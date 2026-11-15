/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.splitwise.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val FEATURE_STATUS = "Lcom/Splitwise/SplitwiseMobile/features/shared/utils/FeatureStatus;"
internal const val SPLITWISE_FEATURES = "Lapp/loki/extension/SplitwiseFeatures;"

/**
 * FeatureAvailability.loadFeatureData(String, FeatureStatus): the one place every feature switch is read from the
 * server document - simple switches, ad/paywall switches and the dedicated upsell cards alike.
 */
internal object LoadFeatureDataFingerprint : Fingerprint(
    definingClass = "Lcom/Splitwise/SplitwiseMobile/features/shared/utils/FeatureAvailability;",
    name = "loadFeatureData",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", FEATURE_STATUS),
)

/**
 * Records (name, status) at method entry - the only point where p1 is guaranteed to still be the name, since R8
 * reuses that register for a Boolean later - and calls [SPLITWISE_FEATURES].[exit]() before every return, which
 * forces the status on or off by name.
 *
 * Both Splitwise feature patches call this; the entry hook is only added once.
 */
internal fun BytecodePatchContext.overrideFeatures(exit: String) {
    LoadFeatureDataFingerprint.method.apply {
        val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        if (returns.isEmpty()) throw PatchException("loadFeatureData has no return")
        // Branches in this method jump straight to the return. Code inserted BEFORE the return is skipped by them
        // (the branch target stays on the return), so the return itself becomes the call and a new return follows.
        for (index in returns.reversed()) {
            replaceInstruction(index, "invoke-static { }, $SPLITWISE_FEATURES->$exit()V")
            addInstruction(index + 1, "return-void")
        }
        val hasEnter = (instructions.first() as? ReferenceInstruction)
            ?.reference?.toString()?.contains("$SPLITWISE_FEATURES->enter") == true
        if (!hasEnter) {
            addInstruction(0, "invoke-static { p1, p2 }, $SPLITWISE_FEATURES->enter(Ljava/lang/String;Ljava/lang/Object;)V")
        }
    }
}
