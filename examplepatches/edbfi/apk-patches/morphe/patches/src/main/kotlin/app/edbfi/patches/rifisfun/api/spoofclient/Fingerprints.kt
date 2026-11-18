// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.api.spoofclient

import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.shared.hasFlags
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val APP_REDIRECT_URI = "redditisfun://auth"
internal const val APP_AUTHORIZE_URL = "https://old.reddit.com/api/v1/authorize.compact"

// R8 renamed the app's login classes and methods, so these match on the literals they hold and their signatures.

/** The OAuth helper builds the authorize URL; the client ID in it is scrambled and decoded at runtime. */
internal object AuthorizeUrlFingerprint : Fingerprint(
    returnType = "Landroid/net/Uri;",
    parameters = listOf(),
    strings = listOf(APP_AUTHORIZE_URL, "client_id", APP_REDIRECT_URI),
)

/** Every method that holds the app's redirect URI. */
internal object RedirectUriFingerprint : Fingerprint(
    strings = listOf(APP_REDIRECT_URI),
)

private fun appendString() = methodCall(
    opcode = Opcode.INVOKE_VIRTUAL,
    definingClass = "Ljava/lang/StringBuilder;",
    name = "append",
    parameters = listOf("Ljava/lang/String;"),
    location = MatchAfterImmediately(),
)

/**
 * Every token request (code exchange, refresh, app-only) adds a Basic authorization of the scrambled client ID and
 * secret: `"Basic " + base64(id:secret)`, appended right after the prefix.
 */
internal object BasicAuthFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(string("Basic "), appendString(), appendString()),
    strings = listOf("Authorization"),
)

/**
 * The OAuth helper hands out the cached app-only token, or gets a new one once it expires: it reads the token, then
 * its expiry, a long, and compares that with the time. (The method that gets a new one reads no time.)
 */
internal object AppTokenFingerprint : Fingerprint(
    classFingerprint = AuthorizeUrlFingerprint,
    isStatic = false,
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(methodCall(definingClass = "Ljava/lang/System;", name = "currentTimeMillis")),
)

/** Whether a request takes the app-only token, which the app gave only to oauth.reddit.com/api/v1/. */
internal object AppTokenCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/net/Uri;"),
    strings = listOf("oauth.reddit.com", "/api/v1/"),
    custom = { method, _ -> method.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) },
)

/** The class that builds the app's OkHttp clients, whose cache directory is `okhttp_cache`. */
internal object OkHttpClientFactoryFingerprint : Fingerprint(
    strings = listOf("okhttp_cache"),
)

/**
 * The User-Agent of every request the app sends, `reddit is fun (Android) <version>` from a string resource. It sits
 * in the class that builds the app's OkHttp clients.
 */
internal object UserAgentFingerprint : Fingerprint(
    classFingerprint = OkHttpClientFactoryFingerprint,
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(methodCall(definingClass = "Landroid/content/Context;", name = "getString", parameters = listOf("I", "[Ljava/lang/Object;"))),
    custom = { method, _ -> method.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) },
)

/** The extension method an option goes in. */
internal open class OptionFingerprint(name: String) :
    Fingerprint(
        definingClass = "$EXTENSION/SpoofClient;",
        name = name,
        returnType = "Ljava/lang/String;",
        parameters = listOf(),
    )

internal object ClientIdOptionFingerprint : OptionFingerprint("clientId")

internal object UserAgentOptionFingerprint : OptionFingerprint("userAgent")
