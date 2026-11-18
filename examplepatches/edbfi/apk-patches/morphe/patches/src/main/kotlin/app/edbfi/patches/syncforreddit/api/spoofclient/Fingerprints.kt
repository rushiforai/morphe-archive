// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.api.spoofclient

import app.edbfi.patches.shared.hasFlags
import app.edbfi.patches.shared.string
import app.edbfi.patches.syncforreddit.declaredIn
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

internal const val SSL_HOST = "https://ssl.reddit.com/"
internal const val AUTHORIZE_PREFIX = "${SSL_HOST}api/v1/authorize.compact?"

/** Whether the method loads a string literal that [predicate] accepts. */
private fun Method.holdsString(predicate: (String) -> Boolean) = implementation?.instructions?.any { it.string?.let(predicate) == true } == true

/** A public static `()String` of `OAuthLoginHelper` holding [string]. */
internal open class LoginHelperStringFingerprint(string: String) :
    Fingerprint(
        returnType = "Ljava/lang/String;",
        parameters = listOf(),
        strings = listOf(string),
        custom = declaredIn("OAuthLoginHelper.java") { it.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) },
    )

/** `OAuthLoginHelper` returns the redirect URI used by the authorize URL, the WebView catch and the token exchange. */
internal object RedirectUriFingerprint : LoginHelperStringFingerprint("http://redditsync/auth")

/** `OAuthLoginHelper` builds the Basic authorization header every token request sends. */
internal object BasicAuthFingerprint : LoginHelperStringFingerprint("Basic ")

/** `OAuthLoginHelper` builds the authorize URL that carries the client ID. */
internal object AuthorizeUrlFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
    custom =
    declaredIn("OAuthLoginHelper.java") { method ->
        method.hasFlags(AccessFlags.STATIC) && method.holdsString { it.startsWith(AUTHORIZE_PREFIX) && "client_id=" in it }
    },
)

/** `AccountSingleton` returns the User-Agent every Reddit request sends. */
internal object UserAgentFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    custom =
    declaredIn("AccountSingleton.java") { method ->
        method.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) && method.holdsString { it.startsWith("android:com.laurencedawson.reddit_sync") }
    },
)

/** Every method holding an ssl.reddit.com URL. */
internal object SslUrlFingerprint : Fingerprint(
    strings = listOf(string(SSL_HOST, StringComparisonType.STARTS_WITH)),
)
