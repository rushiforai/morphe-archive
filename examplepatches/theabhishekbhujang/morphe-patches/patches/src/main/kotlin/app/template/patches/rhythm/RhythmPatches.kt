package app.template.patches.rhythm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_RHYTHM

val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks all Pro features, taals, variations, scales, and removes ads.",
    default = true
) {
    compatibleWith(COMPATIBILITY_RHYTHM)

    execute {
        // 1. Unlock Taal.isPremium()
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

        // 2. Unlock TaalVariation.isPremium()
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

        // 3. Unlock PickerView.h()
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

        // 4. Bypass Store Check (m4.f.n())
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

        // 5. Disable Banner Ads (k4.d.f())
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

        // 6. Disable Interstitial Ads (k4.d.g())
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

        // 7. Remove _More Taals? promo card injection (m4.f.f())
        Fingerprint(
            definingClass = "Lm4/f;",
            name = "f",
            returnType = "Ljava/util/ArrayList;"
        ).method.replaceInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
    }
}
