package app.template.patches.rhythm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
        // 1. Force Taal.isPremium() to return false (so taals are not restricted as premium)
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

        // 2. Force TaalVariation.isPremium() to return false
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

        // 3. Unlock PickerView feature restrictions
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

        // 4. Force m4.f constructor parameter `isPro` to false so all taals are loaded into e list
        Fingerprint(
            definingClass = "Lm4/f;",
            name = "<init>",
            returnType = "V"
        ).method.addInstructions(
            14,
            """
                const/4 p2, 0x0
            """
        )

        // 5. Bypass Store Check (m4.f.n())
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

        // 6. Disable Banner Ads (k4.d.f())
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

        // 7. Disable Interstitial Ads (k4.d.g())
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
