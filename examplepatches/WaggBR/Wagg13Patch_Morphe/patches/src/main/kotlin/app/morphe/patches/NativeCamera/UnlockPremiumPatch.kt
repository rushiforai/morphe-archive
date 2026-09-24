package app.morphe.patches.nativecamera.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.nativecamera.shared.Constants.COMPATIBILITY_NATIVECAMERA
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n

@Suppress("unused")
val unlockNativeCameraPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces the premium entitlement in Native Camera. Premium status is stored " +
                  "locally and controls features such as the sub-40-Mbps bitrate cap. " +
                  "Compatible with v1.4 and v1.4.1 (PairIP was removed in v1.4.1).",
    default = true
) {
    compatibleWith(COMPATIBILITY_NATIVECAMERA)

    execute {
        // Primary unlock (hard): the constructor reads getBoolean("is_premium", false) into the
        // premium StateFlow. Flip the default literal so premium is always true on a cold start.
        val initMatch = CameraViewModelPremiumInitFingerprint.match()
        val premiumFlagMatch = initMatch.stringMatchesOrNull!!.first { it.string == "is_premium" }
        val defaultConstIndex = premiumFlagMatch.index + 1
        val defaultConst = initMatch.method.getInstruction(defaultConstIndex) as BuilderInstruction11n
        check(defaultConst.narrowLiteral == 0) {
            "Native Camera: expected const/4 literal 0 at default-const index $defaultConstIndex, " +
                "got ${defaultConst.narrowLiteral}"
        }
        initMatch.method.replaceInstruction(defaultConstIndex, "const/4 v${defaultConst.registerA}, 0x1")

        // Hardening (fail-soft): the premium setter writes the "is_premium" flag and, on
        // downgrade, resets premium-only features. Force its boolean argument to 1 so a later
        // non-premium billing result can never downgrade the local entitlement.
        val setter = CameraViewModelSetPremiumFingerprint.methodOrNull
        if (setter != null) {
            setter.addInstructions(0, "const/4 p1, 0x1")
        }

        // NOTE: PairIP license check was removed in Native Camera v1.4.1.
        // The app now uses Google Play Billing directly. The cold-start unlock above
        // is sufficient to bypass premium checks since the billing flow only writes
        // the SharedPreferences flag, which we now force to true.
    }
}
