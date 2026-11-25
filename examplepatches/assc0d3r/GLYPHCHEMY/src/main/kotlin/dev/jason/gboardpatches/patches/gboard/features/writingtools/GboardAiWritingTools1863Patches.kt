package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.isFieldReference

/*
 * 18.6.3 writing-tools shims.
 *
 * The 18.0.3 shims in GboardAiWritingToolsFlagValuePatch target internals that were
 * refactored (zqk/vow/vpc/wgv/hhs/mjn/ugw). These are the same fixes against the
 * classes that exist in 18.6.3: the ambiguity manager gzz, the route object hai and
 * the intent enum aail.
 */

/** The V2 disambiguation gate: route in, ambiguity type out. */
internal val autoFixAmbiguityGate1863 = GboardMethodTarget(
    classType = "Lgzz;",
    name = "a",
    parameterTypes = listOf("Lhai;"),
    returnType = "Lmcv;",
)

internal val gboardAiWritingTools1863AutoFixAcceptancePatch = bytecodePatch(
    description = "Let a confirmed INTENT_AUTO_FIX pass V2 disambiguation on 18.6.3.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        findMutableMethodOrThrow(autoFixAmbiguityGate1863).applyAutoFixAcceptance1863()
    }
}

/**
 * MobileBERT's confirmed INTENT_AUTO_FIX is dropped by the ambiguity manager, so the
 * "fix" action never reaches a handler. Answer UNAMBIGUOUS for that one intent and
 * leave every other route to stock.
 */
internal fun MutableMethod.applyAutoFixAcceptance1863() {
    val instructions = implementation?.instructions
        ?: error("No 18.6.3 writing-tools ambiguity implementation")
    check(implementation!!.registerCount == 6) {
        "18.6.3 writing-tools ambiguity register drift"
    }

    // Stock reads Lhai;->a itself, so that field cannot mark our adapter. Stock never
    // mentions INTENT_AUTO_FIX, which makes it the reliable marker.
    val existing = instructions.count {
        it.isFieldReference("Laail;->INTENT_AUTO_FIX:Laail;")
    }
    if (existing != 0) {
        check(existing == 1) { "Duplicate INTENT_AUTO_FIX ambiguity delegates" }
        return
    }

    val continuation = instructions.first()
    addInstructionsWithLabels(
        0,
        """
            iget-object v0, p1, Lhai;->a:Laail;
            sget-object v1, Laail;->INTENT_AUTO_FIX:Laail;
            if-ne v0, v1, :jasondev_auto_fix_stock_ambiguity
            sget-object v0, Lmcv;->COMMAND_AMBIGUITY_TYPE_UNAMBIGUOUS:Lmcv;
            return-object v0
        """.trimIndent(),
        ExternalLabel("jasondev_auto_fix_stock_ambiguity", continuation),
    )
}
