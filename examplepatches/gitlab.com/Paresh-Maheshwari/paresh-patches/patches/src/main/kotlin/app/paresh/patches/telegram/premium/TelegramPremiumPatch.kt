package app.paresh.patches.telegram.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.telegram.shared.Constants.COMPATIBILITY_TELEGRAM

object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/UserConfig;",
    name = "isPremium",
    returnType = "Z",
)

object IsPremiumUserFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isPremiumUser",
    returnType = "Z",
)

object IsPremiumForStoryFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/Stories/StoriesController;",
    name = "isPremium",
    returnType = "Z",
    parameters = listOf("J"),
)

@Suppress("unused")
val telegramPremiumPatch = bytecodePatch(
    name = "Telegram Premium",
    description = "Unlocks premium features."
) {
    compatibleWith(COMPATIBILITY_TELEGRAM)

    execute {
        IsPremiumFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        IsPremiumUserFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        IsPremiumForStoryFingerprint.methodOrNull?.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
