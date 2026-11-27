// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.shared.oauth

import java.net.URI
import java.net.URLEncoder
import java.util.Base64

internal class OAuthConfig private constructor(val clientId: String, val redirect: String, val userAgent: String) {
    val basicAuthorization: String
        get() = "Basic " + Base64.getEncoder().encodeToString("$clientId:".toByteArray(Charsets.US_ASCII))

    val encodedRedirect: String
        get() = URLEncoder.encode(redirect, Charsets.UTF_8.name())

    companion object {
        fun read(clientId: String?, redirect: String?, userAgent: String?): OAuthConfig? {
            if (clientId.isNullOrEmpty() && redirect.isNullOrEmpty() && userAgent.isNullOrEmpty()) return null

            require(!clientId.isNullOrBlank() && !redirect.isNullOrBlank() && !userAgent.isNullOrBlank()) {
                "Enter OAuth client ID, Redirect URI and User-Agent together, or leave all three blank."
            }
            require(clientId.matches(Regex("[A-Za-z0-9_-]+"))) { "OAuth client ID must be a public Reddit client ID." }
            val uri = runCatching { URI(redirect).parseServerAuthority() }.getOrNull()
            val scheme = uri?.scheme?.lowercase()
            require(
                uri != null && scheme != null && !uri.isOpaque && uri.rawFragment == null &&
                    uri.rawUserInfo == null &&
                    scheme !in setOf("about", "blob", "content", "data", "file", "intent", "javascript") &&
                    (uri.host != null || (scheme !in setOf("http", "https") && !uri.rawPath.isNullOrEmpty())) &&
                    redirect.all { it in '!'..'~' }
            ) {
                "Redirect URI must be an absolute HTTP(S) or app callback URI without user info or a fragment."
            }
            require(uri.rawQuery?.split('&')?.all { parameter ->
                val name = parameter.substringBefore('=')
                name.isNotEmpty() && '%' !in name && name !in setOf("state", "code", "error")
            } != false) { "The registered redirect query must leave state, code and error available for OAuth." }
            require(userAgent == userAgent.trim() && userAgent.all { it in ' '..'~' }) {
                "User-Agent must be printable ASCII without leading or trailing spaces."
            }
            return OAuthConfig(clientId, redirect, userAgent)
        }
    }
}
