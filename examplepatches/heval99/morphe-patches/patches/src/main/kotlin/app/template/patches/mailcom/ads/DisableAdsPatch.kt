package app.template.patches.mailcom.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.mailcom.shared.forceGettersFalse
import app.template.patches.shared.Constants.COMPATIBILITY_MAILCOM

private const val PATCH = "Disable ads"

// Every ad switch of AdvertisingIdentityConfig. isUnifiedInboxAdsEnabled is left alone: it is
// inverted (when true, AdPlacementManager.isAdPlacementAllowed answers false), so forcing it
// false would allow more placements.
internal val AD_SWITCHES = listOf(
    "isAdEnabled",
    "isGoogleInboxAdEnabled",
    "isGoogleBannerEnabled",
    "isHtmlBannerEnabled",
    "isEndlessIbaEnabled",
    "isMetaNativeIBAsEnabled",
    "isMetaNativeBannerEnabled",
    "isAdsInCustomFoldersEnabled",
    "isId5Enabled",
)

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = PATCH,
    description = "Turns off the inbox ads, banners, native ads and interstitials and stops the " +
        "ad tracking pixels. The promotional cards the server places in the inbox (storage and " +
        "eSIM hints, for example) go away with them.",
) {
    compatibleWith(COMPATIBILITY_MAILCOM)

    execute {
        // 1. The remote-config ad switches answer false, so no placement asks for an ad. The
        // paid ad-free entitlement (PayMailManager / BillingAdFreeStateProvider) is not touched,
        // and neither is the Google Mobile Ads SDK itself (rule 9).
        AdvertisingIdentityConfigToStringFingerprint.classDef.forceGettersFalse(PATCH, AD_SWITCHES)

        // 2. Interstitials stay off.
        InterstitialAdConfigToStringFingerprint.classDef.forceGettersFalse(PATCH, listOf("isEnabled"))

        // 3. Ad pixels (display, read, delete and click beacons) are not sent.
        AdTrackerSendFingerprint.method.returnEarly()
    }
}
