package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.hevalReturnEarly
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import app.template.patches.truecaller.shared.overrideReadFeatureToggles

private const val FEATURE = "truecaller.hide_promotions"

// A Heval Controls feature: every override below applies only while it is on. The home and drawer
// promos are read when their screens are built, hence the restart.
@Suppress("unused")
val hidePromotionsPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide promotions",
        description = "Hides promo banners, referral offers and Who viewed me promos.",
        category = TruecallerControlsCategory.PROMOTIONS,
        restartRequired = true,
    ),
) {
    // 1. Toggles read through the toggle resolver, now off: "featurePersonalSafetyPromo"
    // (Guardians home promo), "featureAcsWhoViewedMeBanner" (after-call upsell banner),
    // "featureReferralNavDrawer" and "featureRedeemPromo" (one read with the key right before
    // the call, two where the const-string is hoisted further up; the read check needs one).
    // "featureGoldPremiumGift" (2026-11-09) is the Gold gift promo: its getter backs the check that
    // decides whether the "gift Gold" promo and its notification worker (GoldGiftNotificationWorker)
    // run, next to the server flag "goldGiftPromoEnabled_31409" that is not touched here.
    // "featurePersonalSafetyMenuItem" and "featureTruecallerNewsMenuItem" are only in the
    // toggle catalogue (no reads), and "featureChatWithZipZipMenuItem" is the Help "Chat with
    // us" support row, so all three are left alone.
    overrideReadFeatureToggles(
        listOf(
            "featurePersonalSafetyPromo",
            "featureAcsWhoViewedMeBanner",
            "featureReferralNavDrawer",
            "featureRedeemPromo",
            "featureGoldPremiumGift",
        ),
        false,
        FEATURE,
    )

    // 2. The Firebase experiment "DisableWVMNotifications_65487" (read through the Firebase
    // resolver) reads as on, so the Who-viewed-me notification check returns false before it
    // schedules anything. The key's experiment suffix can change with an update; the read
    // check then fails the patch.
    overrideReadFeatureToggles(listOf("DisableWVMNotifications_65487"), true, FEATURE)

    // 3. The per-context referral gate answers false, so no referral entry point shows (bottom
    // bar, promo popup, search screen promo, deep link and the rest). Most of its keys are read
    // from server-written SharedPreferences, not from the toggle resolver, so step 1 cannot reach
    // them. The gate is the only (String)Z method holding these keys; anything else fails the patch.
    val referralGates = ReferralContextGateFingerprint.matchAllOrNull().orEmpty()
    if (referralGates.size != 1) {
        throw PatchException(
            "Hide promotions: expected one referral context gate (String)Z with \"featureReferralNavigationDrawer\" " +
                "and \"featureGoPro\", found ${referralGates.size}",
        )
    }
    referralGates.single().method.hevalReturnEarly(FEATURE, false)
}
