/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.utils

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The generated getter on [modelClass] that reads the json key [jsonKey] and returns a type
 * [returnType] accepts, or null when it cannot be told apart from anything else on the class.
 *
 * Instagram's LiveTree-backed models — Media, User and their kin — give every json key its own
 * getter, which makes the key a far steadier anchor than the unrelated call sites piko reads
 * these names out of. How the getter carries its key changed with the app: up to v439 the key
 * sat in it as a plain string, while v446 pools the keys and passes `key.hashCode()` to the
 * LiveTree reader instead. Both forms are accepted here.
 *
 * Taking no arguments is what separates a getter from its setter and from the bulk update
 * method, both of which mention the same key.
 */
internal fun BytecodePatchContext.liveTreeGetter(
    modelClass: String,
    jsonKey: String,
    returnType: (String) -> Boolean,
): Method? {
    val keyHash = jsonKey.hashCode().toLong()
    return classDefByOrNull(modelClass)
        ?.methods
        ?.singleOrNull { method ->
            method.parameters.isEmpty() &&
                returnType(method.returnType) &&
                method.mentions(jsonKey, keyHash)
        }
}

private fun Method.mentions(
    jsonKey: String,
    keyHash: Long,
): Boolean =
    implementation?.instructions?.any { instruction ->
        when (instruction.opcode) {
            Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO ->
                instruction.getReference<StringReference>()?.string == jsonKey
            else -> (instruction as? WideLiteralInstruction)?.wideLiteral == keyHash
        }
    } == true

/**
 * The field a [liveTreeGetter] caches its value in. Since v446 the models decode lazily and keep
 * the decoded values on a separate holder object, so this is how that holder is found.
 */
internal fun Method.cacheFieldOrNull(): FieldReference? =
    implementation
        ?.instructions
        ?.firstOrNull { it.opcode == Opcode.IPUT_OBJECT }
        ?.getReference<FieldReference>()
