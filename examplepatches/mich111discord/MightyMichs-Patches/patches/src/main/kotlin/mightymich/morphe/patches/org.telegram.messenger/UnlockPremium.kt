package mightymich.morphe.patches.org.telegram.messenger

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Telegram Premium",
    description = "Unlocks Telegram Premium features by forcing isPremium() to return true.",
    default = true
) {
    compatibleWith(TelegramCompatibility.TELEGRAM)


    val userConfigPremiumFingerprint = Fingerprint(
        definingClass = "Lorg/telegram/messenger/UserConfig;",
        name = "isPremium",
        returnType = "Z"
    )


    val storiesPremiumFingerprint = Fingerprint(
        definingClass = "Lorg/telegram/ui/Stories/StoriesController;",
        name = "isPremium",
        returnType = "Z"
    )

    execute {

        userConfigPremiumFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find UserConfig.isPremium method.")
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }


        storiesPremiumFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find StoriesController.isPremium method.")
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
