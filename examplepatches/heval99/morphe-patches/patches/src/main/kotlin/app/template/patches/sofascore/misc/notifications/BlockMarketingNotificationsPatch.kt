package app.template.patches.sofascore.misc.notifications

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.morphe.util.returnEarly

@Suppress("unused")
val blockMarketingNotificationsPatch = bytecodePatch(
    name = "Block marketing notifications",
    description = "Blocks promotional and marketing notification prompts and modals."
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // Hide UTR promotion modals
        UtrPromotionModalFingerprint.methodOrNull?.returnEarly()

        // Disable marketing notification flags
        IsMarketingNotificationFingerprint.methodOrNull?.returnEarly(false)

        // Force promo notification settings off
        NotificationPromoToggleFingerprint.methodOrNull?.returnEarly(false)
    }
}
