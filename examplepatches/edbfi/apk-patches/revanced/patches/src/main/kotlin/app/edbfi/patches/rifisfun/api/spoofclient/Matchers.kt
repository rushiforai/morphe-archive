// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.api.spoofclient

import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.definingClass
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.name
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags

internal const val APP_REDIRECT_URI = "redditisfun://auth"
internal const val APP_AUTHORIZE_URL = "https://old.reddit.com/api/v1/authorize.compact"

// R8 renamed the app's login classes and methods, so these match on the literals they hold and their signatures.

/** The OAuth helper builds the authorize URL; the client ID in it is scrambled and decoded at runtime. */
internal fun BytecodePatchContext.authorizeUrlMethod() = uniqueMethod("the OAuth authorize URL method", APP_AUTHORIZE_URL, "client_id", APP_REDIRECT_URI) {
    returnType("Landroid/net/Uri;")
    parameterTypes()
}

/** Every token request (code exchange, refresh, app-only) adds a Basic authorization of the scrambled client ID and secret. */
internal fun BytecodePatchContext.basicAuthMethod() = uniqueMethod("the token requests' Basic authorization", "Basic ", "Authorization") {
    returnType("V")
}

/**
 * The OAuth helper hands out the cached app-only token, or gets a new one once it expires: it reads the token, then
 * its expiry, a long, and compares that with the time. (The method that gets a new one reads no time.)
 */
internal fun BytecodePatchContext.appTokenMethod(helper: String) = uniqueMethod("the app-only token getter") {
    definingClass(helper)
    returnType("Ljava/lang/String;")
    parameterTypes()
    custom {
        !AccessFlags.STATIC.isSet(accessFlags) &&
            implementation?.instructions?.any {
                val reference = it.methodReference
                reference?.definingClass == "Ljava/lang/System;" && reference.name == "currentTimeMillis"
            } == true
    }
}

/** Whether a request takes the app-only token, which the app gave only to oauth.reddit.com/api/v1/. */
internal fun BytecodePatchContext.appTokenCheckMethod() = uniqueMethod("the app-only token check", "oauth.reddit.com", "/api/v1/") {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("Z")
    parameterTypes("Landroid/net/Uri;")
}

/** The class that builds the app's OkHttp clients, whose cache directory is `okhttp_cache`. */
internal fun BytecodePatchContext.clientFactory() = uniqueMethod("the OkHttp client factory", "okhttp_cache") {}.definingClass

/**
 * The User-Agent of every request the app sends, `reddit is fun (Android) <version>` from a string resource. It sits
 * in the class that builds the app's OkHttp clients, whose cache directory is `okhttp_cache`.
 */
internal fun BytecodePatchContext.userAgentMethod(): MutableMethod = uniqueMethod("the User-Agent method") {
    definingClass(clientFactory())
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("Ljava/lang/String;")
    parameterTypes()
    custom {
        implementation?.instructions?.any {
            val reference = it.methodReference
            reference?.definingClass == "Landroid/content/Context;" && reference.name == "getString" && reference.parameterTypes.size == 2
        } == true
    }
}

/** The extension method an option goes in. */
internal fun BytecodePatchContext.optionMethod(name: String) = uniqueMethod("SpoofClient.$name in the extension") {
    definingClass("$EXTENSION/SpoofClient;")
    name(name)
    returnType("Ljava/lang/String;")
}
