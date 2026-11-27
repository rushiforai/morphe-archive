// SPDX-License-Identifier: AGPL-3.0-or-later

@file:JvmName("MediaLinks")

package app.edbfi.extension.rifisfun.reading

import android.net.Uri
import app.reseam.runtime.Export
import java.net.URI
import java.net.URISyntaxException

private val redditHosts = setOf("reddit.com", "www.reddit.com", "old.reddit.com", "new.reddit.com", "m.reddit.com")
private val mediaHosts = setOf("i.redd.it", "preview.redd.it", "external-preview.redd.it")

@Export
fun parseLink(url: String): Uri = unwrap(Uri.parse(url))

private fun unwrap(uri: Uri): Uri {
    if (uri.scheme != "https" || uri.encodedAuthority !in redditHosts || uri.encodedPath != "/media") return uri
    val wrapped = uri.getQueryParameters("url").singleOrNull() ?: return uri
    val target = try {
        URI(wrapped)
    } catch (_: URISyntaxException) {
        return uri
    }
    if (target.scheme != "https" || target.rawAuthority !in mediaHosts ||
        target.rawFragment != null || target.rawPath.isNullOrEmpty() || target.rawPath == "/"
    ) return uri
    return Uri.parse(target.toASCIIString())
}
