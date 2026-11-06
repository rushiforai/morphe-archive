/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.flags;

/**
 * Stands in for Tumblr's feature enum, whose class name changes with every build. The hook reads
 * only a constant's name, so a constant here named like Tumblr's flag is that flag to it.
 * {@link FeatureSwitchesTest} checks that every claimed flag has one.
 */
public enum FakeFeature {
    /** A flag no family claims. */
    UNCLAIMED_FLAG,

    // Hide ads
    MAKE_ADX_REQUESTS,
    MAKE_APS_AD_REQUESTS,
    MAKE_DISPLAY_IO_REQUEST,
    MAKE_DISPLAY_IO_INTERSCROLLER_REQUEST,
    MAKE_FAN_REQUESTS,
    MAKE_NIMBUS_CLIENT_AD_REQUESTS,
    GOOGLE_BANNER_ADS,
    GOOGLE_NATIVE_ADS,
    GOOGLE_REWARDED_ADS,
    SMART_BANNER_ADS,
    RENDER_NIMBUS_ADS,
    RENDER_VUNGLE_ADS,
    RENDER_DISPLAY_IO_INTERSCROLLER_S2S_ADS,
    MAKE_NIMBUS_INTERSTITIAL_CLIENT_AD_REQUESTS,
    INTERSTITIAL_ADS_BLOG_OPENING_TRIGGERS,
    /** Off, it ends the interstitial cooldown, so it's left to Tumblr. */
    INTERSTITIAL_ADS_CLIENT_COOLDOWN,

    // Disable analytics
    LIVERAMP_ATS,
    ENABLE_OM_SDK,
    MOAT_VIDEO_AD_BEACONING,
    LITTLE_SISTER_MOAT_LOGGING,
    SEND_FEATURE_EXPOSED_ANALYTICS,
    SEND_NETWORK_USAGE_DATA,
    MOBILE_PERFORMANCE_LOGGING,
    SUPPLY_LOGGING,

    // Hide the ad-free banner
    AD_FREE_CTA_BANNER,

    // Hide Tumblr TV
    TUMBLR_TV_MOBILE_NAV,
    TUMBLR_TV_ONBOARDING_REDIRECT,

    // Hide the Communities tab. It claims the tips only: the tab's own flag is here as one it
    // leaves to Tumblr.
    COMMUNITIES_TAB_BAR_ITEM,
    COMMUNITIES_TOOLTIPS,

    // Hide Blaze prompts
    BLAZE_DASHBOARD_ENTRYPOINT_IN_USER_BLOG_HEADER,
    BLAZE_DASHBOARD_ENTRYPOINT_NEAR_PREMIUM,
    BLAZE_NUDGE_AFTER_POST,
    SHOW_BLAZE_SETTINGS_BANNER,
    TUMBLR_BLAZE_LANDING_PAGE_BANNER,

    // Turn off screenshot sharing
    SCREENSHOT_INTERCEPTION,

    // Disable update prompts
    IN_APP_UPDATE,
}
