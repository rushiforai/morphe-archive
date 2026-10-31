package app.fluffydiscord.patches.screenrecorder

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal fun MutableClass.addVoidMethod(
    name: String,
    parameterTypes: List<String>,
    registerCount: Int,
    smali: String,
) {
    val parameters = parameterTypes.map { ImmutableMethodParameter(it, null, null) }
    val method = ImmutableMethod(
        type,
        name,
        parameters,
        "V",
        AccessFlags.PUBLIC.value,
        null,
        null,
        MutableMethodImplementation(registerCount),
    ).toMutable()

    method.addInstructionsWithLabels(0, smali)
    methods.add(method)
}
