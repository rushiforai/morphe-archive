package app.template.patches.rhythm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_RHYTHM

val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks all Pro and Premium features, taals, variations, scales, Manjeera audio engine, and disables store alerts & ads.",
    default = true
) {
    compatibleWith(COMPATIBILITY_RHYTHM)

    execute {
        // 1. Unlock Taal.isPremium() -> return false (0)
        Fingerprint(
            definingClass = "Lcom/psslabs/rhythm/model/Taal;",
            name = "isPremium",
            returnType = "Z"
        ).method.replaceInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // 2. Unlock TaalVariation.isPremium() -> return false (0)
        Fingerprint(
            definingClass = "Lcom/psslabs/rhythm/model/TaalVariation;",
            name = "isPremium",
            returnType = "Z"
        ).method.replaceInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // 3. Unlock PickerView.h() -> return false (0)
        Fingerprint(
            definingClass = "Lcom/psslabs/rhythm/helper/PickerView;",
            name = "h",
            returnType = "Z"
        ).method.replaceInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // 4. Bypass Store Verification Check (m4.f.n()) -> return true (1)
        Fingerprint(
            definingClass = "Lm4/f;",
            name = "n",
            returnType = "Z"
        ).method.replaceInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 5. Bypass Store Alert Dialog in ListingActivity (ListingActivity.A) -> return-void
        Fingerprint(
            definingClass = "Lcom/psslabs/rhythm/ListingActivity;",
            name = "A",
            returnType = "V"
        ).method.replaceInstructions(
            0,
            """
                return-void
            """
        )

        // 6. Disable Purchase Premium Dialog in BaseActivity (i4.b.T1) -> return-void
        Fingerprint(
            definingClass = "Li4/b;",
            name = "T1",
            returnType = "V"
        ).method.replaceInstructions(
            0,
            """
                return-void
            """
        )

        // 7. Disable Banner Ads (k4.d.f())
        Fingerprint(
            definingClass = "Lk4/d;",
            name = "f",
            returnType = "V"
        ).method.replaceInstructions(
            0,
            """
                return-void
            """
        )

        // 8. Disable Interstitial Ads (k4.d.g())
        Fingerprint(
            definingClass = "Lk4/d;",
            name = "g",
            returnType = "V"
        ).method.replaceInstructions(
            0,
            """
                return-void
            """
        )
    }
}
