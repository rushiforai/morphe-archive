// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fixredgifs

import app.edbfi.patches.shared.hasFlags
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// R8 renamed the Redgifs lookup's class, its methods and fields, and OkHttp's; these match on literals, types and calls.

/**
 * The method that gets a token with the app's client credentials. Its class is the base of the app's Redgifs lookup,
 * which sends `GET https://api.redgifs.com/v2/gifs/<id>` through the app's OkHttp client.
 */
internal object ClientTokenFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("https://api.redgifs.com/v2/oauth/client"),
)

/**
 * The lookup's token getter: the cached token unless it expired (it reads the time), else a new one. The token
 * request is private; this one is protected.
 */
internal class TokenGetterFingerprint(lookup: String) :
    Fingerprint(
        definingClass = lookup,
        returnType = "Ljava/lang/String;",
        parameters = listOf(),
        filters = listOf(methodCall(definingClass = "Ljava/lang/System;", name = "currentTimeMillis")),
        custom = { method, _ -> method.hasFlags(AccessFlags.PROTECTED) },
    )

/** Adds the User-Agent header to the lookup's request builder. The token request sets it too, but takes no builder. */
internal class UserAgentSetterFingerprint(lookup: String) :
    Fingerprint(
        definingClass = lookup,
        returnType = "V",
        strings = listOf("User-Agent"),
        custom = { method, _ -> method.parameterTypes.size == 1 },
    )

/** The lookup itself, which calls the token getter, sends the request and tries again once when the token is rejected. */
internal class LookupFingerprint(
    lookup: String,
    tokenGetter: Method,
) : Fingerprint(
    definingClass = lookup,
    filters = listOf(methodCall(definingClass = lookup, name = tokenGetter.name, parameters = listOf())),
    custom = { method, _ -> method.hasFlags(AccessFlags.VARARGS) },
)

/** The lookup's subclass builds the gif's API path from its ID. */
internal object GifPathFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("/v2/gifs/"),
)

/**
 * The factory's certificate pinner: it adds each host's pins with the pinner builder's `add(pattern, vararg pins)`,
 * a method taking a String and a String array that returns its own builder.
 */
internal class PinnerFingerprint(factory: String) :
    Fingerprint(
        definingClass = factory,
        isStatic = true,
        parameters = listOf(),
        custom = { method, _ -> method.implementation?.instructions?.any { it.getReference<MethodReference>()?.isAddPins() == true } == true },
    )

internal fun MethodReference.isAddPins() = parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "[Ljava/lang/String;") && returnType == definingClass
