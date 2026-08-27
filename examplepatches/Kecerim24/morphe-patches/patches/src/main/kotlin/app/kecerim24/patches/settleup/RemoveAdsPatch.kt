package app.kecerim24.patches.settleup

import app.kecerim24.patches.shared.Constants.COMPATIBILITY_SETTLE_UP
import app.kecerim24.patches.shared.pairipLicenseCheckPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes the rewarded ads shown after adding expenses.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SETTLE_UP)

    // Google Play's PairIP check kills any re-signed build on startup.
    dependsOn(pairipLicenseCheckPatch)

    execute {
        // region Tell the app there are no ads to show.

        // IsPremium is the single object carrying the premium state, and its showAds flag is
        // what makes the app count expenses towards the next ad. Forcing it false in the
        // constructor covers every place the state is built.
        IsPremiumConstructorFingerprint.method.addInstruction(
            0,
            "const/4 p2, 0x0"
        )

        // endregion

        // region Never open the ad screen.

        // Belt and braces: the legacy pre-Compose screens keep their own expense counter that
        // does not consult showAds, so also make the only entry point to the rewarded ad
        // screen a no-op.
        BeforeAdActivityStartFingerprint.method.addInstructions(
            0,
            "return-void"
        )

        // endregion
    }
}
