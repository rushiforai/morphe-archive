// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.spoofclient

import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.instructions
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import app.revanced.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal const val SSL_HOST = "https://ssl.reddit.com/"
internal const val AUTHORIZE_PREFIX = "${SSL_HOST}api/v1/authorize.compact?"

/** `OAuthLoginHelper` returns the redirect URI used by the authorize URL, the WebView catch and the token exchange. */
internal fun BytecodePatchContext.redirectUriMethod() = uniqueMethod("the OAuth redirect URI method", "http://redditsync/auth") {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("Ljava/lang/String;")
    parameterTypes()
    custom { isDeclaredIn(this, "OAuthLoginHelper.java") }
}

/** `OAuthLoginHelper` builds the Basic authorization header every token request sends. */
internal fun BytecodePatchContext.basicAuthMethod() = uniqueMethod("the OAuth Basic authorization method", "Basic ") {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("Ljava/lang/String;")
    parameterTypes()
    custom { isDeclaredIn(this, "OAuthLoginHelper.java") }
}

/** `OAuthLoginHelper` builds the authorize URL that carries the client ID. */
internal fun BytecodePatchContext.authorizeUrlMethod() = uniqueMethod("the OAuth authorize URL method") {
    accessFlags(AccessFlags.STATIC)
    returnType("Ljava/lang/String;")
    parameterTypes("Landroid/content/Context;")
    custom { isDeclaredIn(this, "OAuthLoginHelper.java") }
    instructions(string { startsWith(AUTHORIZE_PREFIX) && "client_id=" in this })
}

/** `AccountSingleton` returns the User-Agent every Reddit request sends. */
internal fun BytecodePatchContext.userAgentMethod() = uniqueMethod("the Reddit User-Agent method") {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("Ljava/lang/String;")
    parameterTypes()
    custom { isDeclaredIn(this, "AccountSingleton.java") }
    instructions(string { startsWith("android:com.laurencedawson.reddit_sync") })
}
