// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.requesthook

import app.edbfi.patches.shared.hasFlags
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The send method of the app's Reddit request engine, which every Reddit API request runs through: it moves Reddit URLs
 * to oauth.reddit.com when it adds a token, builds the OkHttp request, sends it and parses the reply. R8 renamed the
 * engine and its methods.
 */
internal object SendFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    strings = listOf("oauth.reddit.com", "https"),
    custom = { method, _ -> method.hasFlags(AccessFlags.PRIVATE) },
)

/**
 * The engine's subclasses that send a form (POST and PUT). Each turns its form, an array of AndroidX pairs, into the
 * request body, adding `api_type=json` unless the form has it.
 */
internal object FormBodyFingerprint : Fingerprint(
    parameters = listOf("Z", "[L"),
    strings = listOf("api_type", "json"),
)

/** A subclass of the engine that sends a form, and its abstract method that returns the form. */
internal class FormRequest(val type: String, val getter: String, val pairs: String)

/** The engine's form subclasses, sorted by type. Fails unless each extends [engine] and has one abstract form getter. */
internal fun formRequests(engine: String): List<FormRequest> {
    val bodies = FormBodyFingerprint.matchAllOrNull()?.map { it.originalMethod }
        ?: throw PatchException("Found no form body builder in the request engine's subclasses")
    return bodies.map { body ->
        val type = body.definingClass
        val pairs = body.parameterTypes[1].toString()
        val classDef = classDefByOrNull(type) ?: throw PatchException("No class $type")
        if (classDef.superclass != engine) throw PatchException("$type doesn't extend the request engine $engine")
        val getters = classDef.methods.filter { AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.parameterTypes.isEmpty() && it.returnType == pairs }
        val getter = getters.singleOrNull() ?: throw PatchException("Expected one abstract form getter in $type, found ${getters.size}")
        FormRequest(type, getter.name, pairs)
    }.sortedBy { it.type }
}
