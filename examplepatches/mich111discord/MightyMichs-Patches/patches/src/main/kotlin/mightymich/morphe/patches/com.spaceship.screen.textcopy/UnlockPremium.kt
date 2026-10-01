package mightymich.morphe.patches.com.spaceship.screen.textcopy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Unlocks Screen Translate Premium.",
    default = true
) {
    compatibleWith(ScreenTranslateCompatibility.SCREEN_TRANSLATE)


    val premiumCheckFingerprint = Fingerprint(
        definingClass = "Lcom/spaceship/screen/translate/utils/premium/d;",
        name = "a",
        returnType = "Z"
    )


    val needPremiumFingerprint = Fingerprint(
        definingClass = "Lcom/spaceship/screen/translate/utils/premium/Config;",
        name = "getHomeKeyActionNeedPremium",
        returnType = "Z"
    )

    execute {

        premiumCheckFingerprint.let { fingerprint ->
            val method = fingerprint.method
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }


        needPremiumFingerprint.let { fingerprint ->
            val method = fingerprint.method
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }
    }
}
