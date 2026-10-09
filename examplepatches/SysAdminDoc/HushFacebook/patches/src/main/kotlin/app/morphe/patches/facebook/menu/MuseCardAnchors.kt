/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.menu

import app.morphe.patches.facebook.chats.jumpTargets
import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Where the Muse card in Facebook's Menu reads whether it was dismissed, on 577, 580 and 581.
 *
 * The card ("Meet Muse, your personal AI agent.", with Get app and Dismiss) is a Menu bookmark
 * carrying a Native Templates promotion, drawn by Litho's BookmarkFolderItemComponent (581 `8hX`).
 * It doesn't pass through the Menu's group sections, so the section hooks can't reach it. Its
 * render (581 `A1A`) asks a helper (581 `6um.A02(8h9, 9aA, Z)Z`) whether Dismiss was tapped for
 * this bookmark lately, a time Facebook keeps in its preferences per bookmark id. When the answer
 * differs from the component's state, the render sets that state,
 * `updateState:BookmarkFolderItemComponent.updateNtContentDismissed`, and a dismissed card draws
 * nothing.
 *
 * The component is a Redex name, so it's found by that kept state-update string, its render as
 * the instance method loading it that hands back a component, and the read by its shape: the one
 * instance call before the string taking two objects and a boolean and answering a boolean, its
 * second object of a type the component keeps in a field (the bookmark), and its answer kept and
 * compared at once.
 */
internal const val NT_DISMISSED_UPDATE = "updateState:BookmarkFolderItemComponent.updateNtContentDismissed"

/**
 * The dismissal read: the `move-result` at [index] keeps the answer in [answer], and the bookmark
 * it was asked for is still in [bookmark].
 */
internal data class DismissalRead(val index: Int, val answer: Int, val bookmark: Int)

/** The bookmark component's render: an instance method loading [NT_DISMISSED_UPDATE] that hands back an object. */
internal fun isBookmarkRender(method: Method): Boolean =
    method.implementation != null && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.returnType.startsWith("L") && holdsString(method, NT_DISMISSED_UPDATE)

/**
 * The dismissal read in [render], a method of [component]. Null unless there's exactly one call of
 * its shape before the state update, its answer is kept in a register the comparison right after
 * reads, both registers fit a 4-bit operand, the answer doesn't overwrite the bookmark, and no
 * branch lands on the comparison, which would step past a hook put in front of it.
 */
internal fun dismissalRead(component: ClassDef, render: Method): DismissalRead? {
    val code = render.implementation?.instructions?.toList() ?: return null
    val update = code.indexOfFirst { (it.reference() as? StringReference)?.string == NT_DISMISSED_UPDATE }
    if (update < 0) return null
    val fieldTypes = component.fields.map { it.type }.toSet()
    val call = (0 until update).filter { isDismissalCall(code[it], fieldTypes) }.singleOrNull() ?: return null
    val result = code.getOrNull(call + 1) as? OneRegisterInstruction ?: return null
    if (code[call + 1].opcode != Opcode.MOVE_RESULT) return null
    val compare = code.getOrNull(call + 2) as? TwoRegisterInstruction ?: return null
    if (code[call + 2].opcode != Opcode.IF_EQ && code[call + 2].opcode != Opcode.IF_NE) return null
    val answer = result.registerA
    val bookmark = (code[call] as FiveRegisterInstruction).registerE
    if (answer != compare.registerA && answer != compare.registerB) return null
    if (answer == bookmark || answer > 15 || bookmark > 15) return null
    if (call + 2 in jumpTargets(code)) return null
    return DismissalRead(call + 1, answer, bookmark)
}

/** A non-range instance call of (object, object, boolean) answering a boolean, its second object a type in [bookmarkTypes]. */
private fun isDismissalCall(instruction: Instruction, bookmarkTypes: Set<String>): Boolean {
    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return false
    val method = instruction.reference() as? MethodReference ?: return false
    val types = method.parameterTypes.map { it.toString() }
    return method.returnType == "Z" && types.size == 3 && types[0].startsWith("L") && types[2] == "Z" &&
        types[1] in bookmarkTypes && (instruction as FiveRegisterInstruction).registerCount == 4
}

private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference
