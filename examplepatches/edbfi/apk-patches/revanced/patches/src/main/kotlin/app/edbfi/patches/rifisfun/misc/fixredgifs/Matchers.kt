// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fixredgifs

import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.definingClass
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// R8 renamed the Redgifs lookup's class, its methods and fields, and OkHttp's; these match on literals, types and calls.

/**
 * The method that gets a token with the app's client credentials. Its class is the base of the app's Redgifs lookup,
 * which sends `GET https://api.redgifs.com/v2/gifs/<id>` through the app's OkHttp client.
 */
internal fun BytecodePatchContext.clientTokenMethod() = uniqueMethod("the Redgifs client-credentials token request", "https://api.redgifs.com/v2/oauth/client") {
    returnType("Ljava/lang/String;")
    parameterTypes()
}

/**
 * The lookup's token getter: the cached token unless it expired (it reads the time), else a new one. The token
 * request is private; this one is protected.
 */
internal fun BytecodePatchContext.tokenGetterMethod(lookup: String) = uniqueMethod("the Redgifs token getter") {
    definingClass(lookup)
    accessFlags(AccessFlags.PROTECTED)
    returnType("Ljava/lang/String;")
    parameterTypes()
    custom { calls { definingClass == "Ljava/lang/System;" && name == "currentTimeMillis" } }
}

/** Adds the User-Agent header to the lookup's request builder. The token request sets it too, but takes no builder. */
internal fun BytecodePatchContext.userAgentSetterMethod(lookup: String) = uniqueMethod("the Redgifs lookup's User-Agent", "User-Agent") {
    definingClass(lookup)
    returnType("V")
    custom { parameterTypes.size == 1 }
}

/** The lookup itself, which calls the token getter, sends the request and tries again once when the token is rejected. */
internal fun BytecodePatchContext.lookupMethod(
    lookup: String,
    tokenGetter: Method,
) = uniqueMethod("the Redgifs lookup") {
    definingClass(lookup)
    custom { AccessFlags.VARARGS.isSet(accessFlags) && calls { name == tokenGetter.name && definingClass == lookup && parameterTypes.isEmpty() } }
}

/** The lookup's subclass builds the gif's API path from its ID. */
internal fun BytecodePatchContext.gifPathMethod() = uniqueMethod("the Redgifs gif path", "/v2/gifs/") {
    accessFlags(AccessFlags.STATIC)
    returnType("Ljava/lang/String;")
    parameterTypes("Ljava/lang/String;")
}

/**
 * The factory's certificate pinner: it adds each host's pins with the pinner builder's `add(pattern, vararg pins)`,
 * a method taking a String and a String array that returns its own builder.
 */
internal fun BytecodePatchContext.pinnerMethod(factory: String) = uniqueMethod("the OkHttp certificate pinner") {
    definingClass(factory)
    accessFlags(AccessFlags.STATIC)
    parameterTypes()
    custom { calls { isAddPins() } }
}

internal fun MethodReference.isAddPins() = parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "[Ljava/lang/String;") && returnType == definingClass

private fun Method.calls(predicate: MethodReference.() -> Boolean) = implementation?.instructions?.any { it.methodReference?.predicate() == true } == true
