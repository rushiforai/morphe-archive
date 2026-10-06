/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.screenshots

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * Where Facebook marks a window secure, on the 577, 580 and 581 builds.
 *
 * Android blacks out a window carrying FLAG_SECURE (0x2000) in screenshots, screen recordings and
 * the recent apps view. Facebook sets it two ways, both framework calls that keep their names:
 * Window.addFlags or setFlags, on the payment card form, a chat's full-screen photo and about ten
 * other screens, and a write of WindowManager.LayoutParams' flags field, for the dialogs and
 * popups it builds windows for itself. The flag can reach either from a constant, a field or a
 * caller, so every window flag call and every flags write outside the extension goes through the
 * extension, which takes the secure flag out while the switch is on and passes the rest unchanged.
 * Facebook's audio is already capturable (its one capture policy it sets itself is "all"), so
 * nothing there needs changing.
 */
internal const val PATCH = "Allow screenshots"

internal const val WINDOW = "Landroid/view/Window;"
internal const val LAYOUT_PARAMS = "Landroid/view/WindowManager\$LayoutParams;"

private const val SCREENSHOTS = "$EXTENSION_PACKAGE/misc/Screenshots;"
internal const val ADD_FLAGS = "$SCREENSHOTS->addFlags(${WINDOW}I)V"
internal const val SET_FLAGS = "$SCREENSHOTS->setFlags(${WINDOW}II)V"
internal const val LAYOUT_FLAGS = "$SCREENSHOTS->layoutFlags(I)I"

/** The extension method that takes the place of the window flag call [instruction] makes, or null. */
internal fun ownWindowCall(instruction: Instruction): String? {
    if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    val call = (instruction as ReferenceInstruction).reference as? MethodReference ?: return null
    if (call.definingClass != WINDOW || call.returnType != "V") return null
    return when (call.name + call.parameterTypes.joinToString("", "(", ")")) {
        "addFlags(I)" -> ADD_FLAGS
        "setFlags(II)" -> SET_FLAGS
        else -> null
    }
}

/** Whether [instruction] writes a WindowManager.LayoutParams' flags. */
internal fun writesLayoutFlags(instruction: Instruction): Boolean {
    if (instruction.opcode != Opcode.IPUT) return false
    val field = (instruction as ReferenceInstruction).reference as? FieldReference ?: return false
    return field.definingClass == LAYOUT_PARAMS && field.name == "flags" && field.type == "I"
}

/** Whether [method] makes a window flag call or writes a layout parameters' flags. */
internal fun setsWindowFlags(method: Method): Boolean =
    method.implementation?.instructions?.any { ownWindowCall(it) != null || writesLayoutFlags(it) } == true

/**
 * Sends each window flag call in this method to the extension and runs each flags write's value
 * through it, last first. Answers how many. A call becomes a static call of the extension on the
 * same registers, in the call's place. A write's place goes to the extension's call on the value,
 * named by range so any register fits, and the move of its answer and the write itself follow, so
 * a jump to the write, or a try block's edge on it, still reaches the extension first.
 */
internal fun MutableMethod.allowScreenshots(): Int {
    val sites = (implementation ?: return 0).instructions.withIndex()
        .filter { (_, instruction) -> ownWindowCall(instruction) != null || writesLayoutFlags(instruction) }
        .toList()
    sites.asReversed().forEach { (index, instruction) ->
        val own = ownWindowCall(instruction)
        if (own != null) {
            val arguments = when (instruction) {
                is RegisterRangeInstruction ->
                    "invoke-static/range { v${instruction.startRegister} .. v${instruction.startRegister + instruction.registerCount - 1} }"
                is FiveRegisterInstruction -> "invoke-static { " + listOf(
                    instruction.registerC, instruction.registerD, instruction.registerE,
                ).take(instruction.registerCount).joinToString { "v$it" } + " }"
                else -> throw PatchException("$PATCH: $definingClass->$name calls Window in an unexpected form")
            }
            replaceInstruction(index, "$arguments, $own")
        } else {
            val write = instruction as TwoRegisterInstruction
            replaceInstruction(index, "invoke-static/range { v${write.registerA} .. v${write.registerA} }, $LAYOUT_FLAGS")
            addInstruction(index + 1, "move-result v${write.registerA}")
            addInstruction(index + 2, "iput v${write.registerA}, v${write.registerB}, $LAYOUT_PARAMS->flags:I")
        }
    }
    return sites.size
}
