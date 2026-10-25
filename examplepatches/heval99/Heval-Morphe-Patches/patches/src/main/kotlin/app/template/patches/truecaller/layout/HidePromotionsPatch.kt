package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.truecaller.shared.FirebaseFeatureToggleResolverFingerprint
import app.template.patches.truecaller.shared.overrideReadFeatureToggles

@Suppress("unused")
val hidePromotionsPatch = bytecodePatch(
    name = "Hide promotions",
    description = "Hides promo banners, referral offers and Who viewed me promos.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // 1. Toggles read through the toggle resolver, now off: "featurePersonalSafetyPromo"
        // (Guardians home promo), "featureAcsWhoViewedMeBanner" (after-call upsell banner),
        // "featureReferralNavDrawer" and "featureRedeemPromo" (one read with the key right before
        // the call, two where the const-string is hoisted further up; the read check needs one).
        // "featurePersonalSafetyMenuItem" and "featureTruecallerNewsMenuItem" are only in the
        // toggle catalogue (no reads), and "featureChatWithZipZipMenuItem" is the Help "Chat with
        // us" support row, so all three are left alone.
        overrideReadFeatureToggles(
            listOf(
                "featurePersonalSafetyPromo",
                "featureAcsWhoViewedMeBanner",
                "featureReferralNavDrawer",
                "featureRedeemPromo",
            ),
            false,
        )

        // 2. The Firebase experiment "DisableWVMNotifications_65487" reads as on, so the
        // Who-viewed-me notification check returns false before it schedules anything. The key's
        // experiment suffix can change with an update; the read check then fails the patch.
        overrideReadFeatureToggles(
            listOf("DisableWVMNotifications_65487"),
            true,
            FirebaseFeatureToggleResolverFingerprint,
        )
    }
}
