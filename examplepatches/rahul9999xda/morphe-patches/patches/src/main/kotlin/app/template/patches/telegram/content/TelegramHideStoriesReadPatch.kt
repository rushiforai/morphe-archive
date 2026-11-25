package app.template.patches.telegram.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.StoriesReadReceiptFlowFingerprint
import app.template.patches.telegram.StoriesReadReceiptFlowLegacyFingerprint
import app.template.patches.telegram.Telegram1331StoriesReadReceiptNormalFingerprint
import app.template.patches.telegram.Telegram1331StoriesReadReceiptWebFingerprint
import app.template.patches.telegram.TelegramR8StoriesReadReceiptNormalFingerprint
import app.template.patches.telegram.TelegramR8StoriesReadReceiptWebFingerprint
import app.template.patches.telegram.TelegramPlusR8StoriesReadReceiptFingerprint
import app.template.patches.telegram.TelegramPlus13221R8StoriesReadReceiptFingerprint
import app.template.patches.telegram.TelegramPlusR8StoriesReadReceiptByDialogFingerprint
import app.template.patches.telegram.TelegramPlus13221R8StoriesReadReceiptByDialogFingerprint

@Suppress("unused")
val telegramHideStoriesReadPatch = bytecodePatch(
    name = "Hide Stories read status",
    description = "Prevents the client from processing and sending Stories read receipts.",
    default = true,
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
    )

    execute {
        // The target method returns Z. Returning true preserves its success/handled
        // contract while skipping the local read update and TL_stories_readStories request.
        // Telegram Android and Web use independently fingerprinted boolean
        // dispatchers (wg.f5.Y and zg.d5.Y). Plus 13.2.2.1 has two independently verified request paths
        // in StoriesController rc: R1(PeerStories,
        // StoryItem, boolean)Z and O1(long)V. Both construct
        // TL_stories_readStories, so both must be stopped on Plus.
        val currentR8Methods = listOfNotNull(
            Telegram1331StoriesReadReceiptNormalFingerprint.methodOrNull,
            Telegram1331StoriesReadReceiptWebFingerprint.methodOrNull,
            TelegramR8StoriesReadReceiptNormalFingerprint.methodOrNull,
            TelegramR8StoriesReadReceiptWebFingerprint.methodOrNull,
            TelegramPlus13221R8StoriesReadReceiptFingerprint.methodOrNull
                ?: TelegramPlusR8StoriesReadReceiptFingerprint.methodOrNull,
        ).distinct()
        val plusDialogMethod = TelegramPlus13221R8StoriesReadReceiptByDialogFingerprint.methodOrNull
            ?: TelegramPlusR8StoriesReadReceiptByDialogFingerprint.methodOrNull

        if (currentR8Methods.isNotEmpty() || plusDialogMethod != null) {
            currentR8Methods.forEach { method ->
                method.addInstructions(0, """
                    const/4 v0, 0x1
                    return v0
                """)
            }
            plusDialogMethod?.addInstructions(0, "return-void")
        } else {
            val legacyMethod = StoriesReadReceiptFlowFingerprint.methodOrNull
                ?: StoriesReadReceiptFlowLegacyFingerprint.methodOrNull
            // Older builds retain their separately fingerprinted named helper.
            legacyMethod?.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }
    }
}
