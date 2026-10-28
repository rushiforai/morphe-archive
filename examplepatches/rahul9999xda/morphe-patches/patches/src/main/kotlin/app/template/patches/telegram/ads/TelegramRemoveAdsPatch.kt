package app.template.patches.telegram.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.PlusApplicationLoaderLoadAdsFingerprint
import app.template.patches.telegram.PlusApplicationLoaderLoadAdsLegacyFingerprint
import app.template.patches.telegram.signature.telegramSpoofDependency

private val messageObjectIsSponsoredFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSponsored",
    returnType = "Z",
)

private val messagesControllerIsSponsoredDisabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isSponsoredDisabled",
    returnType = "Z",
)

private val messagesControllerGetSponsoredMessagesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "getSponsoredMessages",
    returnType = "Lorg/telegram/messenger/MessagesController\$SponsoredMessagesInfo;",
    parameters = listOf("J"),
)

private val videoAdsLoadFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/video/VideoAds;",
    name = "load",
    returnType = "V",
)

@Suppress("unused")
val telegramRemoveAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes sponsored messages and video ads. On Telegram Plus also blocks current and legacy Plus ad-loader entry points.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
    )
    dependsOn(telegramSpoofDependency())

    execute {
        messageObjectIsSponsoredFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        messagesControllerIsSponsoredDisabledFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // The current cache helper was found in all three audited APKs; fail fast if its
        // exact descriptor drifts instead of silently leaving this sponsored-message path live.
        requireNotNull(messagesControllerGetSponsoredMessagesFingerprint.methodOrNull) {
            "Missing MessagesController.getSponsoredMessages(J)SponsoredMessagesInfo"
        }.addInstructions(0, """
            const/4 v0, 0x0
            return-object v0
        """)

        videoAdsLoadFingerprint.method.addInstructions(0, "return-void")

        // Plus Messenger 13.1.1.0 declares loadAds(Activity, Cells.m3)V.
        // Keep the historical no-argument signature as a separate fallback for older Plus builds.
        listOf(
            PlusApplicationLoaderLoadAdsFingerprint.methodOrNull,
            PlusApplicationLoaderLoadAdsLegacyFingerprint.methodOrNull,
        ).filterNotNull().distinct().forEach { method ->
            method.addInstructions(0, "return-void")
        }
    }
}