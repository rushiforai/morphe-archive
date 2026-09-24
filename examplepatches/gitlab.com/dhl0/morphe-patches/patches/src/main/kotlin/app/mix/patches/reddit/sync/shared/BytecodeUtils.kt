/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.shared

import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal fun Method.postsUrlResultIndex() = indexOfFirstInstructionOrThrow {
    getReference<MethodReference>()?.let {
        it.returnType == "Ljava/lang/String;"
                && it.parameterTypes.size == 6
                && it.parameterTypes[0] == "Landroid/content/Context;"
                && it.parameterTypes[1] == "Ljava/lang/String;"
    } == true
} + 1

internal fun Method.stringFieldOfParameter(index: Int): String {
    val parameterType = parameterTypes[index]
    val field = implementation!!.instructions
        .mapNotNull { it.getReference<FieldReference>() }
        .first {
            it.definingClass == parameterType && it.type == "Ljava/lang/String;"
        }
    return "${field.definingClass}->${field.name}:${field.type}"
}
