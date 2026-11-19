/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** What a closeup module asks itself after taking a pin. It keeps its name. */
internal const val CLOSEUP_SHOULD_SHOW = "shouldShowForPin"

/**
 * Hands every closeup module's answer to "do I show for this pin" through [hook], which gets the
 * module and the answer and returns the answer to use. The base class's updatePin asks and branches
 * right after, so this is the one place all of a pin page's sections pass through, and a no there
 * takes Pinterest's own path for a section with nothing to show.
 */
internal fun BytecodePatchContext.addCloseupGate(patch: String, hook: String) {
    val owner = classDefByOrNull(CLOSEUP_MODULE) ?: throw PatchException("$patch: $CLOSEUP_MODULE is missing")
    val update = owner.methods.filter {
        it.name == "updatePin" && it.returnType == "V" && it.parameterTypes.size == 1 && it.implementation != null &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }.one("$patch: the closeup module's updatePin")
    val body = update.instructions()
    val ask = body.indices.filter { at ->
        val call = (body[at] as? ReferenceInstruction)?.reference as? MethodReference
        call?.name == CLOSEUP_SHOULD_SHOW && call.returnType == "Z" && call.parameterTypes.isEmpty()
    }.one("$patch: the module's $CLOSEUP_SHOULD_SHOW call")
    val answer = body.getOrNull(ask + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction
        ?: throw PatchException("$patch: nothing reads the $CLOSEUP_SHOULD_SHOW answer")
    val self = update.implementation!!.registerCount - 2
    if (answer.registerA > 15 || self > 15) throw PatchException("$patch: the module's registers don't fit the call")
    mutable(update).addInstructions(ask + 2, """
        invoke-static { p0, v${answer.registerA} }, $hook
        move-result v${answer.registerA}
    """)
}
