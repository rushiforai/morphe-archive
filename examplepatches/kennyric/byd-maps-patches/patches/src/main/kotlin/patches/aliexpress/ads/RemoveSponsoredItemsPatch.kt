/*
 * Copyright (C) 2026 Quantro100
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Ported from Quantro100/Morphe-patches:
 * https://github.com/Quantro100/Morphe-patches/commit/f384d233384d2bc3d63d9f5011507f774d586b6f
 * Commit f384d233384d2bc3d63d9f5011507f774d586b6f (2026-06-02),
 * patches/src/main/kotlin/app/morphe/patches/aliexpress/ads/HideSponsoredItemsPatch.kt
 */
package patches.aliexpress.ads

import patches.aliexpress.ALIEXPRESS

import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.findInstructionIndicesReversedOrThrow
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import patches.aliexpress.settings.markPatchApplied
import patches.aliexpress.signin.spoofSignaturePatch

private const val EXTENSION_CLASS_DESCRIPTOR = "Lnl/johninnl/aliexpress/SponsoredProducts;"

private const val DESCRIPTION = "Removes paid placements from search results and product feeds."

// Shared installation point: either control can be selected independently in Manager.
internal val contentFilteringPatch = bytecodePatch {
    dependsOn(spoofSignaturePatch)
    extendWith("extensions/aliexpress.mpe")
    execute {
        installRenderedItemFiltering()
        ProductArrayFingerprint.matchSingle().method.apply {
            val returns = findInstructionIndicesReversedOrThrow(opcode(Opcode.RETURN_OBJECT))
            if (returns.isEmpty()) throw PatchException("AliExpress array return hook is missing")
            returns.forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                addInstructionsAtControlFlowLabel(
                    index,
                    "invoke-static/range { v$register .. v$register }, " +
                        "$EXTENSION_CLASS_DESCRIPTOR->filterIfEnabled(Ljava/util/List;)V",
                )
            }
        }
    }
}

@Suppress("unused")
val removeSponsoredItemsPatch = bytecodePatch(
    name = "Remove sponsored items",
    description = DESCRIPTION,
) {
    compatibleWith(ALIEXPRESS)
    dependsOn(contentFilteringPatch)
    execute {
        markPatchApplied("removeSponsoredItems", DESCRIPTION)
    }
}
