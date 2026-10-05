package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal fun nativeReloadMethod(owner: String, name: String, parameters: List<String>, returns: String,
    registers: Int, code: String, static: Boolean = false): MutableMethod {
    val flags = AccessFlags.PUBLIC.value or if (static) AccessFlags.STATIC.value else AccessFlags.FINAL.value
    return ImmutableMethod(owner, name, parameters.map { ImmutableMethodParameter(it, null, null) },
        returns, flags, null, null, MutableMethodImplementation(registers)).toMutable().apply {
        addInstructionsWithLabels(0, code)
    }
}
