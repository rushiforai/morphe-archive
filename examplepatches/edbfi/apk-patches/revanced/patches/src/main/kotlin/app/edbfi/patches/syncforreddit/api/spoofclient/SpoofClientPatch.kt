// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.spoofclient

import app.edbfi.patches.shared.returnString
import app.edbfi.patches.shared.rewriteStrings
import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.revanced.patcher.firstMethod
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch
import app.revanced.patcher.patch.stringOption
import java.util.Base64

private const val WWW_HOST = "https://www.reddit.com/"

// The defaults are RedReader's public OAuth client, its registered redirect URI and the User-Agent it sends.
private const val DEFAULT_CLIENT_ID = "yH0aTnJEt6qUgGn835B4vg"
private const val DEFAULT_REDIRECT_URI = "redreader://rr_oauth_redir"
private const val DEFAULT_USER_AGENT = "org.quantumbadger.redreader/1.27"

@Suppress("unused")
val spoofClientPatch =
    bytecodePatch(
        name = "Spoof client",
        description = "Restores login and browsing by using another app's Reddit OAuth client.",
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))

        val clientId by stringOption(
            name = "OAuth client ID",
            default = DEFAULT_CLIENT_ID,
            description =
            "The Reddit OAuth client ID of an installed app. The default is RedReader's. " +
                "Change the redirect URI and User-Agent with it.",
            required = true,
        ) { it?.matches(Regex("[A-Za-z0-9_-]+")) == true }

        val redirectUri by stringOption(
            name = "Redirect URI",
            default = DEFAULT_REDIRECT_URI,
            description = "The redirect URI registered for the client ID, without characters that need URL encoding.",
            required = true,
        ) { it?.matches(Regex("[A-Za-z][A-Za-z0-9.-]*:[A-Za-z0-9._~/:-]+")) == true }

        val userAgent by stringOption(
            name = "User-Agent",
            default = DEFAULT_USER_AGENT,
            description = "The User-Agent sent to Reddit: that of the app the client ID belongs to.",
            required = true,
        ) { it?.matches(Regex("[ -~]+")) == true && it.isNotBlank() }

        apply {
            val id = clientId!!
            val basic = "Basic " + Base64.getEncoder().encodeToString("$id:".toByteArray())

            val edits =
                listOf(
                    redirectUriMethod().returnString(redirectUri!!),
                    basicAuthMethod().returnString(basic),
                    userAgentMethod().returnString(userAgent!!),
                )

            // The client ID is a literal in the authorize URL; the redirect URI is appended from the method above.
            val withClientId = authorizeUrlMethod().rewriteStrings { it.withClientId(id) }
            if (withClientId.count != 1) throw PatchException("Expected one authorize URL, found ${withClientId.count}")

            // ssl.reddit.com answers 301 to www.reddit.com, which turns the token POSTs into GETs.
            val sslMethods = classDefs.methodsByString.filterKeys { it.startsWith(SSL_HOST) }.values.flatten().toSet()
            val toWww = sslMethods.map { method -> firstMethod(method).rewriteStrings { it.onWwwHost() } }
            if (toWww.sumOf { it.count } == 0) throw PatchException("Found no ssl.reddit.com URLs to rewrite")

            // The authorize URL is an ssl.reddit.com URL too: its host is rewritten after its client ID. The returns go in
            // last, as they move the instructions the rewrites point at.
            (listOf(withClientId) + toWww + edits).forEach { it.apply() }
        }
    }

private fun String.withClientId(id: String) = if (startsWith(AUTHORIZE_PREFIX)) replace(Regex("client_id=[^&]*"), "client_id=$id") else null

private fun String.onWwwHost() = if (startsWith(SSL_HOST)) WWW_HOST + removePrefix(SSL_HOST) else null
