package app.template.patches.worldmapquiz

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.WORLD_MAP_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags

object PremiumFingerprint : Fingerprint(
    definingClass = "LF1/c${'$'}e;",
    name = "n",
    returnType = "V",
    parameters = listOf("Ldev/axmol/app/AppActivity;"),
    accessFlags = listOf(AccessFlags.PRIVATE),
)

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Premium mode, map themes, rivers, mountains, deserts, oceanic trenches, oceanic currents, lakes, islands and winds",
    default = true
) {
    compatibleWith(WORLD_MAP_COMPATIBILITY)
    execute {
        PremiumFingerprint.method.apply {
            replaceInstruction(4, "const/4 v1, 0x1")
        }
    }
}
