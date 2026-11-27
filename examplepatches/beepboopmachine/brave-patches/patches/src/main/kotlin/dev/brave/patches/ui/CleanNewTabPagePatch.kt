package dev.brave.patches.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.literal
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

internal object MostVisitedTilesLayoutFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/suggestions/tile/MostVisitedTilesLayout;",
    name = "b",
    returnType = "V",
    parameters = listOf("I", "I")
)

internal object BraveNewTabPageLayoutFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/ntp/BraveNewTabPageLayout;",
    name = "h",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        literal(0x7f010202)
    )
)

internal object BraveNewsDisabledPolicyFingerprint : Fingerprint(
    definingClass = "Lyf2;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Lorg/chromium/chrome/browser/profiles/Profile;"),
    filters = listOf(
        string("brave.news.disabled_by_policy")
    )
)

@Suppress("unused")
val cleanNewTabPagePatch = patch(
    name = "Clean New Tab Page",
    description = "Enforces 4-column tile grid, removes sponsored NTP background ads, and disables Brave News feed."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        // 1. Lock 4-column tile grid in MostVisitedTilesLayout->b(II)V
        MostVisitedTilesLayoutFingerprint.method.apply {
            val setColIdx = instructions.indices.indexOfFirst { idx ->
                val inst = instructions[idx]
                if (inst.opcode != Opcode.INVOKE_VIRTUAL) return@indexOfFirst false
                val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference ?: return@indexOfFirst false
                ref.name == "setColumnCount"
            }
            if (setColIdx < 0) {
                throw PatchException("Could not locate setColumnCount in MostVisitedTilesLayout->b(II)V")
            }

            val inst = instructions[setColIdx] as FiveRegisterInstruction
            val colReg = inst.registerD
            addInstruction(
                setColIdx,
                "const/4 v$colReg, 0x4"
            )
        }

        // 2. Neutralize ALL sponsored NTP background ads in BraveNewTabPageLayout->h()V
        BraveNewTabPageLayoutFingerprint.method.apply {
            val wallpaperFieldIndices = instructions.indices.filter { idx ->
                val inst = instructions[idx]
                if (inst.opcode != Opcode.IGET_BOOLEAN) return@filter false
                val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference ?: return@filter false
                ref.name == "h" && ref.definingClass.contains("Wallpaper")
            }
            if (wallpaperFieldIndices.isEmpty()) {
                throw PatchException("Could not locate Wallpaper.h field read in BraveNewTabPageLayout->h()V")
            }

            // Patch in reverse order so inserted instruction indices do not displace earlier matches
            for (idx in wallpaperFieldIndices.asReversed()) {
                val inst = instructions[idx] as TwoRegisterInstruction
                val boolReg = inst.registerA
                addInstruction(
                    idx + 1,
                    "const/4 v$boolReg, 0x0"
                )
            }
        }

        // 3. Force yf2->a(Profile)Z to return 1 (true) so Brave News feed never initializes
        BraveNewsDisabledPolicyFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent()
            )
        }
    }
}
