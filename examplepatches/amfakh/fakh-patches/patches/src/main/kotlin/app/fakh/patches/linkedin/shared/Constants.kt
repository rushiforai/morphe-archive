/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.shared

import app.fakh.patches.shared.Feature
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val EXTENSION_PACKAGE = "Lapp/fakh/extension/linkedin"

    val COMPATIBILITY_LINKEDIN = Compatibility(
        name = "LinkedIn",
        packageName = "com.linkedin.android",
        signatures = setOf("3b6a403ca91d56ab854517720203176640816d3f923f92cca16138f5cc3d0727"),
        // LinkedIn is only on APKMirror as a bundle; Morphe merges APKM splits itself.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A66C2,
        targets = listOf(
            // Morphe recommends the newest supported version, so keep the newest tested one last.
            AppTarget(
                version = "4.1.1264",
                versionCode = 217200
            ),
            AppTarget(
                version = "4.1.1267",
                versionCode = 217500
            ),
            AppTarget(
                version = "4.1.1269",
                versionCode = 217700
            ),
            AppTarget(
                version = "4.1.1270",
                versionCode = 217800
            ),
            AppTarget(
                version = "4.1.1272",
                versionCode = 218000
            ),
            AppTarget(
                version = "4.1.1275",
                versionCode = 218300
            ),
            AppTarget(
                version = "4.1.1276",
                versionCode = 218400
            ),
            AppTarget(
                version = "4.1.1278",
                versionCode = 218600
            )
        )
    )

    // The switches of the Fakh Patches page, saved in morphe_linkedin_settings under the keys the page has always used.
    // The page keeps its own layout; the shown tabs, their order and the More items are list settings saved outside these.
    val HIDE_ADS = Feature("hide_ads", "Hide ads", "Ads")
    val HIDE_PROMOTED_JOBS = Feature("hide_promoted_jobs", "Hide promoted jobs", "Ads")
    val HIDE_SUGGESTED = Feature("hide_suggested", "Hide suggested posts", "Ads")
    val HIDE_PREMIUM = Feature("hide_premium", "Hide Premium upsells", "Ads")
    val DISABLE_DOUBLE_TAP_LIKE = Feature("disable_double_tap_like", "Turn off double-tap to like", "Feed")
    val SWIPE_TABS = Feature("swipe_tabs", "Swipe between tabs", "Feed")
    val KEEP_FEED = Feature("keep_feed", "Keep feed position on reopen", "Feed")
    val NO_SCREENSHOT_SHARE = Feature("no_screenshot_share", "Turn off screenshot share sheet", "Feed")
    val COPY_TEXT = Feature("copy_text", "Copy text", "Feed")
    val VIEWER_TAP_TO_HIDE = Feature("viewer_tap_to_hide", "Tap to hide controls in viewers", "Feed")
    val EXPAND_POSTS = Feature("expand_posts", "Expand posts by default", "Feed", default = false)
    val FOCUS_MODE = Feature("focus_mode", "Hide engagement counts", "Feed", default = false)
    val HIDE_CELEBRATIONS = Feature("hide_celebrations", "Hide celebration posts", "Feed", default = false)
    val HIDE_FEED_JOBS = Feature("hide_feed_jobs", "Hide job posts", "Feed", default = false)
    val HIDE_REPOSTS = Feature("hide_reposts", "Hide network activity", "Feed", default = false)
    val HIDE_VIDEO_POSTS = Feature("hide_video_posts", "Hide video posts", "Feed", default = false)
    val HIDE_RECOMMENDATIONS = Feature("hide_recommendations", "Hide \"Recommended for you\"", "Feed", default = false)
    val HIDE_GAMES = Feature("hide_games", "Hide puzzle games", "Feed", default = false)
    val HIDE_NEW_POSTS_PILL = Feature("hide_new_posts_pill", "Hide the \"New posts\" button", "Feed", default = false)
    val HIDE_TRANSLATION = Feature("hide_translation", "Hide \"Show translation\"", "Feed", default = false)
    val HIDE_POST_FOLLOW = Feature("hide_post_follow", "Hide Follow and Connect", "Feed", default = false)
    val HIDE_DEGREE = Feature("hide_degree", "Hide connection degree", "Feed", default = false)
    val EXACT_POST_TIME = Feature("exact_post_time", "Show exact post time", "Feed", default = false)
    val NEWEST_COMMENTS = Feature("newest_comments", "Most recent comments first", "Feed", default = false)
    val GLASS_NAVIGATION_BAR = Feature("glass_navigation_bar", "Liquid Glass navigation bar", "Navigation bar")
    val LIQUID_GLASS = Feature("liquid_glass", "Background blur", "Navigation bar", dependsOn = GLASS_NAVIGATION_BAR, default = false)
    val MATERIAL_TAB_ICONS = Feature("material_tab_icons", "Material icons", "Navigation bar", default = false)
    val ALWAYS_SHOW_NAVIGATION_BAR = Feature("always_show_navigation_bar", "Always show navigation bar", "Navigation bar", default = false)
    val HIDE_TAB_LABELS = Feature("hide_tab_labels", "Hide tab labels", "Navigation bar", default = false)
    val HIDE_TAB_BADGES = Feature("hide_tab_badges", "Hide notification badges", "Navigation bar", default = false)
    val SHOW_TOP_BAR_POST = Feature("show_top_bar_post", "Post", "Top bar")
    val SHOW_TOP_BAR_MESSAGING = Feature("show_top_bar_messaging", "Messaging", "Top bar")
    val FEED_SORT_BUTTON = Feature("feed_sort_button", "Feed sort", "Top bar", default = false)
    val VIDEO_TAB_TIME = Feature("video_tab_time", "Show video time", "Video tab")
    val VIDEO_TAB_AUTO_SCROLL = Feature("video_tab_auto_scroll", "Auto-scroll videos", "Video tab", default = false)
    val MOVE_MORE_ITEMS = Feature("move_more_items", "Show More tab items in profile menu", "More tab")
    val GAMES_SHORTCUT = Feature("games_shortcut", "Puzzle games shortcut", "More tab")
    val REMOVE_GAPS_AND_DIVIDERS = Feature("remove_gaps_and_dividers", "Hide gaps and dividers", "Appearance")
    val MATERIAL_YOU = Feature("material_you", "Material You", "Appearance")
    val PITCH_BLACK = Feature("pitch_black", "Pitch black", "Appearance", default = false)
    val DARK_APP_ICON = Feature("dark_app_icon", "Dark app icon", "Appearance", default = false)
    val DOWNLOAD_MEDIA = Feature("download_media", "Download media", "Downloads")
    val DOWNLOAD_SPLIT_BY_TYPE = Feature("download_split_by_type", "Split photos & videos", "Downloads", default = false)
    val HIDE_SPONSORED_MESSAGES = Feature("hide_sponsored_messages", "Hide sponsored messages", "Messaging")
    val GHOST_MODE = Feature("ghost_mode", "Ghost mode", "Messaging", default = false)
    val MARK_READ_AFTER_REPLY = Feature("mark_read_after_reply", "Mark as read when you reply", "Messaging", dependsOn = GHOST_MODE)
    val OPEN_LINKS_DIRECTLY = Feature("open_links_directly", "Open links directly", "Privacy")
    val RESOLVE_SHORT_LINKS = Feature("resolve_short_links", "Expand lnkd.in links", "Privacy")
    val SANITIZE_SHARE_LINKS = Feature("sanitize_share_links", "Clean share links", "Privacy")
    val BLOCK_TRACKING = Feature("block_tracking", "Disable analytics", "Privacy")
    val ANONYMOUS_PROFILE_VIEWING = Feature("anonymous_profile_viewing", "Anonymous profile viewing", "Privacy")
}
