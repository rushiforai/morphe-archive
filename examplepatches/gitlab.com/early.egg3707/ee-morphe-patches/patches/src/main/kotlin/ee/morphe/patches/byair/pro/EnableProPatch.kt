package ee.morphe.patches.byair

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import ee.morphe.util.returnRequestResultNullEarly

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Suppresses the main byAir paywall, unlock banners, and local user gating without forcing the shared entitlement path globally.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // A lot of byAir's local UI gating reads the lightweight UserInfo model, not the shared
        // RevenueCat helpers. Forcing these two getters keeps profile, airport tips, MCP surfaces,
        // flight detail extras, and other Pro-only UI consistent without touching UserFullInfo.
        UserInfoIsSubscriberFingerprint.method.returnEarly(true)
        UserInfoGetSignedInFingerprint.method.returnEarly(true)

        // Shared Pro banners are built for Quick Scan, Travel Docs, MCP integrations, calendar sync,
        // import-by-email, profile/edit-profile, notifications, and family-sharing surfaces.
        // Returning Success(null) matches the app's own "already subscriber" banner result
        // without forcing the shared RevenueCat entitlement path globally.
        BuildAppProBannerResultFingerprint.method.returnRequestResultNullEarly()

        // These helpers compute the final "should show paywall" Boolean for the two global entry points:
        // after onboarding and after app launch.
        NeedShowPaywallAppLaunchDecisionFingerprint.method.returnEarly(false)
        NeedShowPaywallOnboardingDecisionFingerprint.method.returnEarly(false)
    }
}
