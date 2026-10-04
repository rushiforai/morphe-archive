/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.settings.BooleanSetting;

/** Individual switch names, shared by the feature pages and imports regardless of patch selection. */
final class SwitchLabels {
    private SwitchLabels() {
    }

    static String title(BooleanSetting setting) {
        if (setting == Settings.MARKETPLACE_ONLY) return L10n.t("Marketplace only");
        if (setting == Settings.MARKETPLACE_QUIET_NOTIFICATIONS) return L10n.t("Quiet social notifications");
        if (setting == Settings.MARKETPLACE_SKIP_FEED_PREFETCH) return L10n.t("Skip feed preloading");
        if (setting == Settings.OPEN_ON_CHOSEN_TAB) return L10n.t("Open on a chosen tab");
        if (setting == Settings.HIDE_SPONSORED_POSTS) return L10n.t("Hide sponsored posts");
        if (setting == Settings.HIDE_PROMOTED_POSTS) return L10n.t("Hide promoted posts");
        if (setting == Settings.HIDE_SPONSORED_PROFILE_POSTS) return L10n.t("Hide sponsored profile posts");
        if (setting == Settings.HIDE_AFFILIATE_LINKS) return L10n.t("Hide affiliate product links");
        if (setting == Settings.HIDE_SUGGESTED_POSTS) return L10n.t("Hide page suggestions and Facebook's own promos");
        if (setting == Settings.HIDE_SUGGESTED_FOR_YOU) return L10n.t("Hide \"Suggested for you\" posts");
        if (setting == Settings.HIDE_PEOPLE_YOU_MAY_KNOW) return L10n.t("Hide \"People you may know\"");
        if (setting == Settings.HIDE_SUGGESTED_GROUPS) return L10n.t("Hide suggested groups");
        if (setting == Settings.HIDE_STORIES_YOU_MIGHT_LIKE) return L10n.t("Hide \"Stories you might like\"");
        if (setting == Settings.HIDE_TOP_STORIES_TRAY) return L10n.t("Hide the Stories tray");
        if (setting == Settings.HIDE_STORIES_BETWEEN_POSTS) return L10n.t("Hide Stories between posts");
        if (setting == Settings.HIDE_FEED_REELS) return L10n.t("Hide Reels in the feed");
        if (setting == Settings.HIDE_POST_PROMPTS) return L10n.t("Hide post prompts");
        if (setting == Settings.HIDE_META_AI_QUESTIONS) return L10n.t("Hide Meta AI questions under posts");
        if (setting == Settings.KEEP_POST_DATES) return L10n.t("Keep post dates");
        if (setting == Settings.HIDE_FEEDS_HEADER) return L10n.t("Hide the Feeds header");
        if (setting == Settings.BLOCK_RETURN_REFRESH) return L10n.t("Keep feed position on return");
        if (setting == Settings.RETURN_REFRESH_NO_LIMIT) return L10n.t("No time limit");
        if (setting == Settings.HIDE_AI_DETECTED_POSTS) return L10n.t("Hide AI-detected posts");
        if (setting == Settings.HIDE_AI_LABELLED_POSTS) return L10n.t("Also hide posts labelled as AI");
        if (setting == Settings.HIDE_POSTS_WITH_WORDS) return L10n.t("Hide posts with words you choose");
        if (setting == Settings.POST_WORDS_WHOLE_WORDS) return L10n.t("Match whole words");
        if (setting == Settings.HIDE_SPONSORED_STORIES) return L10n.t("Hide sponsored stories");
        if (setting == Settings.HIDE_SUGGESTED_STORIES) return L10n.t("Hide suggested stories");
        if (setting == Settings.HIDE_CONTACT_IMPORT_CARD) return L10n.t("Hide \"Find friends from contacts\"");
        if (setting == Settings.HIDE_STORY_PROMPTS) return L10n.t("Hide story prompts");
        if (setting == Settings.BLOCK_STORY_AUTO_ADVANCE) return L10n.t("Stop Story auto-advance");
        if (setting == Settings.VIEW_STORIES_ANONYMOUSLY) return L10n.t("View stories anonymously");
        if (setting == Settings.DOWNLOAD_STORIES) return L10n.t("Save any story");
        if (setting == Settings.DEFAULT_COMMENT_ORDER) return L10n.t("Default comment order");
        if (setting == Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT) return L10n.t("Tag suggestions only after @");
        if (setting == Settings.HIDE_REELS_TAB) return L10n.t("Hide the Reels tab");
        if (setting == Settings.HIDE_REELS_TAB_DOT) return L10n.t("Hide the Reels tab dot");
        if (setting == Settings.HIDE_REEL_PROMPTS) return L10n.t("Hide reel interest prompts");
        if (setting == Settings.HIDE_SPONSORED_REELS) return L10n.t("Hide sponsored reels");
        if (setting == Settings.HIDE_AI_DETECTED_REELS) return L10n.t("Hide AI-detected reels and videos");
        if (setting == Settings.HIDE_REEL_CHIPS) return L10n.t("Hide prompts and promos under reels");
        if (setting == Settings.HIDE_REEL_FOLLOW_BUTTON) return L10n.t("Hide the Follow button on reels");
        if (setting == Settings.HIDE_REEL_SOCIAL_FOOTER) return L10n.t("Hide comment and reaction previews");
        if (setting == Settings.DONT_SEND_REEL_WATCH_HISTORY) return L10n.t("Don't send reel watch history");
        if (setting == Settings.TURN_OFF_DOUBLE_TAP_LIKE) return L10n.t("Turn off double tap to like");
        if (setting == Settings.KEEP_REEL_SPEED) return L10n.t("Keep the reel speed");
        if (setting == Settings.HOLD_REEL_FOR_2X) return L10n.t("Hold a reel for 2x");
        if (setting == Settings.DOWNLOAD_REELS) return L10n.t("Download button on reels");
        if (setting == Settings.TAP_TO_PLAY) return L10n.t("Tap to play");
        if (setting == Settings.RESUME_LONG_VIDEOS) return L10n.t("Resume long videos");
        if (setting == Settings.DEFAULT_PLAYBACK_QUALITY) return L10n.t("Default playback quality");
        if (setting == Settings.DOWNLOAD_VIDEOS) return L10n.t("Download feed and Watch videos");
        if (setting == Settings.DOWNLOAD_COMPATIBLE) return L10n.t("Save videos other apps can open");
        if (setting == Settings.HIDE_GET_MESSENGER_CARD) return L10n.t("Hide the Get Messenger card");
        if (setting == Settings.OPEN_MESSENGER_APP) return L10n.t("Open the Messenger app");
        if (setting == Settings.SAVED_SHORTCUT) return L10n.t("Saved shortcut");
        if (setting == Settings.HIDE_MENU_UPGRADES) return L10n.t("Hide Upgrades");
        if (setting == Settings.HIDE_MENU_ALSO_FROM_META) return L10n.t("Hide Also from Meta");
        if (setting == Settings.HIDE_META_AI_IN_SEARCH) return L10n.t("Hide Meta AI in search");
        if (setting == Settings.HIDE_SPONSORED_SEARCH_RESULTS) return L10n.t("Hide sponsored search results");
        if (setting == Settings.HIDE_SPONSORED_MARKETPLACE_LISTINGS) return L10n.t("Hide sponsored Marketplace listings");
        if (setting == Settings.BLOCK_TRENDING_VIDEO_NOTIFICATIONS) return L10n.t("Block trending video notifications");
        if (setting == Settings.BLOCK_MEMORY_NOTIFICATIONS) return L10n.t("Block memory notifications");
        if (setting == Settings.BLOCK_BIRTHDAY_NOTIFICATIONS) return L10n.t("Block birthday notifications");
        if (setting == Settings.BLOCK_HIGHLIGHT_NOTIFICATIONS) return L10n.t("Block group and Page highlights");
        if (setting == Settings.BLOCK_PEOPLE_YOU_MAY_KNOW_NOTIFICATIONS) return L10n.t("Block \"People you may know\"");
        if (setting == Settings.BLOCK_NEARBY_NOTIFICATIONS) return L10n.t("Block nearby and weather notifications");
        if (setting == Settings.OPEN_LINKS_EXTERNALLY) return L10n.t("Open links in your browser");
        if (setting == Settings.SANITIZE_SHARING_LINKS) return L10n.t("Remove tracking from shared links");
        if (setting == Settings.STOP_UPDATE_PROMPTS) return L10n.t("Stop update prompts");
        if (setting == Settings.CHECK_FOR_RELEASES) return L10n.t("Check for new Hushfacebook releases");
        if (setting == Settings.USE_SYSTEM_FONT) return L10n.t("Use the system font");
        if (setting == Settings.USE_SYSTEM_EMOJI) return L10n.t("Use the phone's emoji");
        if (setting == Settings.BOTTOM_TAB_BAR) return L10n.t("Tab bar at the bottom");
        if (setting == Settings.FORCE_DARK_MODE) return L10n.t("Force dark mode");
        throw new IllegalArgumentException("No individual switch label: " + setting.key);
    }
}
