/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.pinterest.ui.UI_HOOKS
import app.morphe.patches.pinterest.ui.calls
import app.morphe.patches.pinterest.ui.instructions
import app.morphe.patches.pinterest.ui.mutable
import app.morphe.patches.pinterest.ui.one
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

/** The JSON name of the pin field that says whether its "See more like this?" bubble shows. */
internal const val FEEDBACK_FLYOUT = "show_feedback_flyout"

internal const val FEEDBACK_FLYOUT_HOOK = "$UI_HOOKS->feedbackFlyout(Ljava/lang/Boolean;)Ljava/lang/Boolean;"

/** The pin's getter for that field, and where it hands the answer back. */
internal class FeedbackFlyout(val getter: Method, val returnAt: Int, val register: Int)

/** True when one of [field]'s annotations names it [json], the way Pinterest's models name their JSON. */
internal fun Field.isJson(json: String) = annotations.any { annotation ->
    annotation.elements.any { it.name == "value" && (it.value as? StringEncodedValue)?.value == json }
}

/**
 * Every reader of the pin's JSON names [FEEDBACK_FLYOUT]; the model among their classes, inner
 * classes counted as their outer one, is the one with a Boolean field of that name. Its getter is
 * the instance method taking nothing and answering a Boolean that reads the field, and every
 * screen that decides on the bubble asks it. Null when no class reads the name. Throws when one
 * does and the getter isn't there in that shape.
 */
internal fun BytecodePatchContext.feedbackFlyoutOrNull(): FeedbackFlyout? {
    val owners = classDefByStrings(FEEDBACK_FLYOUT).map { it.type.substringBefore('$').removeSuffix(";") + ";" }.distinct()
    if (owners.isEmpty()) return null
    val fields = owners.mapNotNull { classDefByOrNull(it) }.flatMap { model ->
        model.fields.filter { it.type == "Ljava/lang/Boolean;" && it.isJson(FEEDBACK_FLYOUT) }
    }
    val field = fields.one("The pin's $FEEDBACK_FLYOUT field")
    val getter = classDefBy(field.definingClass).methods.filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.isEmpty() &&
            method.returnType == "Ljava/lang/Boolean;" && method.instructions().any { reads(it, field) }
    }.one("The pin's $FEEDBACK_FLYOUT getter")
    val body = getter.instructions()
    val returnAt = body.indices.filter { body[it].opcode == Opcode.RETURN_OBJECT }.one("The $FEEDBACK_FLYOUT getter's return")
    val register = (body[returnAt] as OneRegisterInstruction).registerA
    return FeedbackFlyout(getter, returnAt, register)
}

private fun reads(instruction: Instruction, field: Field): Boolean {
    if (instruction.opcode != Opcode.IGET_OBJECT) return false
    val read = (instruction as ReferenceInstruction).reference as? FieldReference ?: return false
    return read.definingClass == field.definingClass && read.name == field.name && read.type == field.type
}

/**
 * Hands the getter's answer to [FEEDBACK_FLYOUT_HOOK] on its way out. The return is where both of
 * the getter's paths meet, so the hook goes in on its label. Goes in once.
 */
internal fun BytecodePatchContext.installFeedbackFlyout(flyout: FeedbackFlyout) = with(flyout) {
    val method = mutable(getter)
    if (method.calls().any { "$it" == FEEDBACK_FLYOUT_HOOK }) return@with
    method.addInstructionsAtControlFlowLabel(returnAt, """
        invoke-static/range { v$register .. v$register }, $FEEDBACK_FLYOUT_HOOK
        move-result-object v$register
    """)
}
