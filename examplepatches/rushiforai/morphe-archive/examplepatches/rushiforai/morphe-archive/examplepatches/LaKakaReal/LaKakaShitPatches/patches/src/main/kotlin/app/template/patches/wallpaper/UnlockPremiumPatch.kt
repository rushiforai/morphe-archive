package app.template.patches.wallpaper

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.DEPTH_WALLPAPERS_COMPATIBILITY
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

private fun dismissActivity() =
    "invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V\n" +
    "invoke-virtual {p0}, Landroid/app/Activity;->finish()V\n" +
    "return-void"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium wallpapers and removes license verification features.",
    default = true
) {
    compatibleWith(DEPTH_WALLPAPERS_COMPATIBILITY)

    execute {
        // ── Layer 1: Force Category.isPremium() -> always true ───────────────
        runCatching {
            IsPremiumFingerprint.method.apply {
                addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            }
        }

        // ── Layer 2: Disable Pairip license verification routines ────────────
        runCatching {
            LicenseClientFingerprint.method.apply {
                addInstructions(0, "return-void")
            }
        }

        // ── Layer 3: Force "owns premium" check -> always true ──────────────
        runCatching {
            IsPremiumOwnedFingerprint.method.apply {
                addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            }
        }

        // ── Layer 4: PairIP LicenseActivity kill-switch ─────────────────────
        runCatching {
            LicenseActivityOnCreateFingerprint.method.apply {
                addInstructions(0, dismissActivity())
            }
        }

        // ── Layer 5: Force premium LiveData to true ──────────────────────────
        runCatching {
            val method = PremiumSetterFingerprint.method
            val containsMatch = PremiumSetterFingerprint.instructionMatches[0]
            val containsIndex = containsMatch.index
            val moveResultIndex = containsIndex + 1
            val moveResultInstr = method.getInstruction<OneRegisterInstruction>(moveResultIndex)
            val register = moveResultInstr.registerA
            method.addInstructions(moveResultIndex + 1, "const/4 v$register, 0x1")
        }

        // ── Layer 6: Targeted drawable trap sweeper ─────────────────────────
        val trapDrawableIds = setOf(0x7f070090)

        runCatching {
            Fo6ClinitFingerprint.method.let { method ->
                method.instructions.forEachIndexed { index, instruction ->
                    if (instruction is OneRegisterInstruction && instruction is NarrowLiteralInstruction) {
                        val literal = instruction.narrowLiteral
                        if (literal in trapDrawableIds) {
                            val register = instruction.registerA
                            method.replaceInstruction(index, "const v$register, 0x0108003e")
                        }
                    }
                }
            }
        }

        runCatching {
            NavigationSetupFingerprint.method.let { method ->
                method.instructions.forEachIndexed { index, instruction ->
                    if (instruction is OneRegisterInstruction && instruction is NarrowLiteralInstruction) {
                        val literal = instruction.narrowLiteral
                        if (literal in trapDrawableIds) {
                            val register = instruction.registerA
                            method.replaceInstruction(index, "const v$register, 0x0108003e")
                        }
                    }
                }
            }
        }

        runCatching {
            Km6InvokeFingerprint.method.let { method ->
                method.instructions.forEachIndexed { index, instruction ->
                    if (instruction is OneRegisterInstruction && instruction is NarrowLiteralInstruction) {
                        val literal = instruction.narrowLiteral
                        if (literal in trapDrawableIds) {
                            val register = instruction.registerA
                            method.replaceInstruction(index, "const v$register, 0x0108003e")
                        }
                    }
                }
            }
        }
    }
}