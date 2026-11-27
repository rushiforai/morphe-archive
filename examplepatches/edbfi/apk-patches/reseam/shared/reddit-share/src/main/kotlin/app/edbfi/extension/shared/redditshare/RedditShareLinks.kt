// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.shared.redditshare

import java.io.IOException
import java.net.Inet4Address
import java.net.Inet6Address
import java.net.InetAddress
import java.net.Proxy
import java.net.URI
import java.net.URISyntaxException
import java.net.UnknownHostException
import java.util.concurrent.TimeUnit
import okhttp3.Call
import okhttp3.Callback
import okhttp3.Dns
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response

object RedditShareLinks {
    private val hosts = setOf("reddit.com", "www.reddit.com", "old.reddit.com", "new.reddit.com",
        "np.reddit.com", "m.reddit.com")
    private val share = Regex("/(?:r|u|user)/[A-Za-z0-9_-]+/s/[A-Za-z0-9]+/?")
    private val post = Regex("/(?:(?:r|u|user)/[A-Za-z0-9_-]+/)?comments/[A-Za-z0-9]+(?:/([^/]+)(?:/[A-Za-z0-9]+)?)?/?")
    private val profile = Regex("/(?:u|user)/([A-Za-z0-9_-]+)/?")
    private val redirectStatus = setOf(301, 302, 303, 307, 308)

    data class Destination(val url: String, val profileName: String?) {
        fun syncUrl(): String {
            // Sync recognizes a bare /user/ profile, and recognizes /user/ but not /u/ for posts.
            if (profileName != null) return "https://www.reddit.com/user/$profileName"
            val uri = URI(url)
            val path = if (uri.rawPath.startsWith("/u/")) "/user/${uri.rawPath.removePrefix("/u/")}" else uri.rawPath
            val separator = if (!path.endsWith('/') && (uri.rawQuery != null || uri.rawFragment != null)) "/" else ""
            return "https://www.reddit.com$path$separator" + suffix(uri, keepFragment = true)
        }
    }

    fun parse(raw: String?): URI? {
        if (raw == null) return null
        val candidate = if (raw.startsWith('/') && !raw.startsWith("//")) "https://www.reddit.com$raw" else raw
        val uri = parseUri(candidate) ?: return null
        val host = uri.host?.lowercase() ?: return null
        if (host != "reddit.com" && !host.endsWith(".reddit.com")) return null
        val defaultPort = when {
            uri.scheme.equals("https", ignoreCase = true) -> 443
            uri.scheme.equals("http", ignoreCase = true) -> 80
            else -> return null
        }
        if ((uri.port != -1 && uri.port != defaultPort) || uri.rawUserInfo != null || uri.rawAuthority.endsWith(':') ||
            !share.matches(uri.rawPath.orEmpty())) return null

        // Alias matching never grants a new destination to the resolver's network allowlist.
        val requestHost = if (host in hosts) host else "www.reddit.com"
        return URI("https://$requestHost${uri.rawPath}")
    }

    private fun parseUri(raw: String): URI? = try {
        URI(raw)
    } catch (_: URISyntaxException) {
        null
    }

    private fun secureHost(uri: URI): Boolean =
        uri.scheme.equals("https", ignoreCase = true) && uri.host?.lowercase() in hosts &&
            (uri.port == -1 || uri.port == 443) && uri.rawUserInfo == null && !uri.rawAuthority.endsWith(':')

    private fun isPost(path: String): Boolean {
        val match = post.matchEntire(path) ?: return false
        val title = match.groups[1]?.value ?: return true
        // Validate a decoded title as one path segment; keep its original encoding for the app.
        val decoded = URI("/$title").path.substring(1)
        return decoded != "." && decoded != ".." && decoded.none { it == '/' || it == '\\' || it.isISOControl() }
    }

    internal sealed interface Next {
        data class Request(val url: URI) : Next
        data class Link(val destination: Destination) : Next
    }

    internal class Redirects(start: URI) {
        private val requested = mutableSetOf(start)

        fun follow(current: URI, status: Int, locations: List<String>): Next? {
            if (status !in redirectStatus) return null
            val location = locations.singleOrNull()?.let(::parseUri) ?: return null
            val target = current.resolve(location)
            if (!secureHost(target)) return null

            val path = target.rawPath.orEmpty()
            val username = profile.matchEntire(path)?.groupValues?.get(1)
            if (username != null || isPost(path)) {
                // Keep the thread/comment target and its parameters on a host both stock routers recognize.
                val url = "https://www.reddit.com$path" + suffix(target, keepFragment = true)
                return Next.Link(Destination(URI(url).toASCIIString(), username))
            }

            val next = URI("https://${target.host.lowercase()}$path" + suffix(target, keepFragment = false))
            if (requested.size >= 4 || !requested.add(next)) return null
            return Next.Request(next)
        }
    }

    private fun suffix(uri: URI, keepFragment: Boolean): String = buildString {
        uri.rawQuery?.let { append('?').append(it) }
        if (keepFragment) uri.rawFragment?.let { append('#').append(it) }
    }

    internal fun isPublic(address: InetAddress): Boolean {
        if (address.isAnyLocalAddress || address.isLoopbackAddress || address.isLinkLocalAddress ||
            address.isSiteLocalAddress || address.isMulticastAddress) return false
        val bytes = address.address
        val first = bytes[0].toInt() and 255
        val second = bytes[1].toInt() and 255
        val third = bytes[2].toInt() and 255
        return when (address) {
            is Inet4Address -> first in 1..223 &&
                !(first == 100 && second in 64..127) &&
                !(first == 192 && (second == 0 || second == 88 && third == 99)) &&
                !(first == 198 && (second in 18..19 || second == 51 && third == 100)) &&
                !(first == 203 && second == 0 && third == 113)
            // Only global IPv6 unicast; exclude protocol assignments, transition and documentation ranges.
            is Inet6Address -> first in 0x20..0x3f &&
                !(first == 0x20 && (second == 2 || second == 1 &&
                    (third < 2 || third == 0x0d && (bytes[3].toInt() and 255) == 0xb8))) &&
                !(first == 0x3f && second == 0xff && third < 0x10)
            else -> false
        }
    }

    private val client by lazy {
        OkHttpClient.Builder()
            .proxy(Proxy.NO_PROXY)
            .dns(object : Dns {
                override fun lookup(hostname: String): List<InetAddress> {
                    if (hostname !in hosts) throw UnknownHostException(hostname)
                    return Dns.SYSTEM.lookup(hostname).filter(::isPublic)
                        .ifEmpty { throw UnknownHostException(hostname) }
                }
            })
            .followRedirects(false)
            .followSslRedirects(false)
            .retryOnConnectionFailure(false)
            .callTimeout(4, TimeUnit.SECONDS)
            .build()
    }

    fun resolve(start: URI, finish: (Destination?) -> Unit) {
        val redirects = Redirects(start)
        fun request(current: URI) {
            client.newCall(Request.Builder().url(current.toASCIIString()).build()).enqueue(object : Callback {
                override fun onFailure(call: Call, error: IOException) = finish(null)

                override fun onResponse(call: Call, response: Response) {
                    when (val next = response.use { redirects.follow(current, it.code, it.headers("Location")) }) {
                        is Next.Request -> request(next.url)
                        is Next.Link -> finish(next.destination)
                        null -> finish(null)
                    }
                }
            })
        }
        request(start)
    }
}
