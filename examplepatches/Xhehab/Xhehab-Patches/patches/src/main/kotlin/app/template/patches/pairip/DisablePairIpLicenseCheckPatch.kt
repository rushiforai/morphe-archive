package app.template.patches.pairip

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MH_PHYSIQUE_COMPATIBILITY
import app.template.patches.shared.Constants.RP_HYPERTROPHY_COMPATIBILITY
import app.template.patches.shared.Constants.THENX_COMPATIBILITY
import app.template.patches.shared.Constants.TRAINWISE_COMPATIBILITY
import app.template.patches.shared.returnEarlyVoid
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.logging.Logger

@Suppress("unused")
val disablePairIpLicenseCheckPatch = bytecodePatch(
    name = "Disable PairIP license check",
    description = "Disable the PairIP client-side license check",
    default = true
) {
    compatibleWith(
        TRAINWISE_COMPATIBILITY,
        MH_PHYSIQUE_COMPATIBILITY,
        RP_HYPERTROPHY_COMPATIBILITY,
        THENX_COMPATIBILITY
    )

    execute {
        if (PairIpProcessLicenseResponseFingerprint.methodOrNull == null ||
            PairIpValidateLicenseResponseFingerprint.methodOrNull == null
        ) {
            return@execute Logger.getLogger(this::class.java.name)
                .warning("Could not find PairIP licensing check. No changes applied.")
        }

        PairIpProcessLicenseResponseFingerprint.apply {
            method.addInstruction(0, "const/4 p1, 0x0")

            PairIpRepeatedCheckFingerprint.matchOrNull(originalMethod)?.apply {
                val repeatedCheckFlagInstr = instructionMatches.first()
                val reg = repeatedCheckFlagInstr.getInstruction<OneRegisterInstruction>().registerA
                method.replaceInstruction(
                    repeatedCheckFlagInstr.index + 1,
                    "const/4 v$reg, 0x0"
                )
            }
        }

        PairIpValidateLicenseResponseFingerprint.method.returnEarlyVoid()
    }
}
