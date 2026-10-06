/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.haptics

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * Facebook 577, 580 and 581 play their haptics two ways. Sixty-odd methods call
 * View.performHapticFeedback(int) or (int, int) on a View reference: the Like button's helper, the
 * reactions bar, comments, drag to reorder, reel scrubbing and the design system's haptic helper
 * among them. About forty more hand an effect to Vibrator.vibrate(VibrationEffect) themselves, with
 * or without VibrationAttributes: the design system's helper, the top bar's buttons (the Menu
 * button's tick on a phone came from one of these, not from the helper), seek bars and React
 * Native's vibration module. Each of those calls becomes a static call of the extension on the
 * same registers, so a move-result after it reads the extension's answer.
 *
 * The timed and patterned Vibrator calls, vibrate(long) and vibrate(long[], int), stay: a message
 * notification's buzz, an NFC tag, a scanned document and a web page's own vibration use those,
 * and none is a haptic a tap plays.
 */

internal const val PATCH = "Turn off haptics"

internal const val VIEW = "Landroid/view/View;"
internal const val VIBRATOR = "Landroid/os/Vibrator;"
private const val EFFECT = "Landroid/os/VibrationEffect;"
private const val ATTRIBUTES = "Landroid/os/VibrationAttributes;"

private const val HAPTICS = "$EXTENSION_PACKAGE/misc/Haptics;"
internal const val PERFORM = "$HAPTICS->performHapticFeedback(${VIEW}I)Z"
internal const val PERFORM_FLAGS = "$HAPTICS->performHapticFeedback(${VIEW}II)Z"
internal const val VIBRATE = "$HAPTICS->vibrate($VIBRATOR$EFFECT)V"
internal const val VIBRATE_ATTRIBUTES = "$HAPTICS->vibrate($VIBRATOR$EFFECT$ATTRIBUTES)V"

private fun MethodReference.signature() = name + parameterTypes.joinToString("", "(", ")") + returnType

private fun virtualCall(instruction: Instruction): MethodReference? {
    if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    return (instruction as ReferenceInstruction).reference as? MethodReference
}

/** The extension's stand-in for [instruction] when it's a View haptic call, or null. */
internal fun viewHapticCall(instruction: Instruction): String? {
    val call = virtualCall(instruction) ?: return null
    if (call.definingClass != VIEW) return null
    return when (call.signature()) {
        "performHapticFeedback(I)Z" -> PERFORM
        "performHapticFeedback(II)Z" -> PERFORM_FLAGS
        else -> null
    }
}

/** The extension's stand-in for [instruction] when it hands an effect to the vibrator, or null. */
internal fun vibrateCall(instruction: Instruction): String? {
    val call = virtualCall(instruction) ?: return null
    if (call.definingClass != VIBRATOR) return null
    return when (call.signature()) {
        "vibrate($EFFECT)V" -> VIBRATE
        "vibrate($EFFECT$ATTRIBUTES)V" -> VIBRATE_ATTRIBUTES
        else -> null
    }
}

internal fun playsHaptic(method: Method): Boolean =
    method.implementation?.instructions?.any { viewHapticCall(it) != null || vibrateCall(it) != null } == true

/** Sends this method's View haptic and vibrator effect calls to the extension. Answers how many of each it sent. */
internal fun MutableMethod.turnOffHaptics(): Pair<Int, Int> {
    val sites = (implementation ?: return 0 to 0).instructions.withIndex()
        .mapNotNull { (index, instruction) ->
            val own = viewHapticCall(instruction) ?: vibrateCall(instruction)
            own?.let { Triple(index, instruction, it) }
        }
        .toList()
    sites.asReversed().forEach { (index, instruction, own) ->
        val arguments = when (instruction) {
            is RegisterRangeInstruction ->
                "invoke-static/range { v${instruction.startRegister} .. v${instruction.startRegister + instruction.registerCount - 1} }"
            is FiveRegisterInstruction -> "invoke-static { " + listOf(
                instruction.registerC, instruction.registerD, instruction.registerE,
            ).take(instruction.registerCount).joinToString { "v$it" } + " }"
            else -> throw PatchException("$PATCH: $definingClass->$name plays a haptic in an unexpected form")
        }
        replaceInstruction(index, "$arguments, $own")
    }
    val vibrations = sites.count { it.third == VIBRATE || it.third == VIBRATE_ATTRIBUTES }
    return sites.size - vibrations to vibrations
}
