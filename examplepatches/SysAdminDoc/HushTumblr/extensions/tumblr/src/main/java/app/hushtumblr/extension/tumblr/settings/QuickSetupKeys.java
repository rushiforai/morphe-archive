/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at 44fb933 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushtumblr.extension.tumblr.settings;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.preference.QuickSetups;

/**
 * Which switches each Quick setups choice changes, all in one place. Loaded only by the settings
 * screen, after the settings have their context, so the lists can name Settings directly.
 *
 * <p>Quiet and Privacy only turn switches on, and only switches whose effect is plain from their
 * name and takes nothing away that someone would miss. Left out on purpose: the post filters and
 * Hide reblogs, which hide posts people follow; the tab switches, which take away a way around the
 * app; the post button switches, note counts, hashtags and the follow button, which are part of
 * reading a post; and the Notifications count, which is how replies and messages get noticed.
 * Back to defaults puts every switch a settings file carries back the way it started.
 */
final class QuickSetupKeys {
    /** Fewer ads, suggestions, prompts, pop-ups and unread counts. */
    static final List<BooleanSetting> QUIET = Collections.unmodifiableList(Arrays.asList(
            Settings.HIDE_ADS,
            Settings.HIDE_AD_FREE_BANNER,
            Settings.HIDE_SUGGESTED_BLOGS,
            Settings.HIDE_SUGGESTED_COMMUNITIES,
            Settings.HIDE_SUGGESTED_TAGS,
            Settings.HIDE_WATCH_IT_ROWS,
            Settings.HIDE_BLAZE_PROMPTS,
            Settings.HIDE_TUMBLRMART,
            Settings.SKIP_REVIEW_PROMPTS,
            Settings.HIDE_BLOG_NOTIFICATION_REMINDERS,
            Settings.HIDE_GIFT_MESSAGE_POPUPS,
            Settings.TURN_OFF_SCREENSHOT_SHARING,
            Settings.DISABLE_UPDATE_PROMPTS,
            Settings.HIDE_DASHBOARD_COUNT,
            Settings.HIDE_COMMUNITIES_COUNT));

    /** Less sent about you: Tumblr's tracking, the ad ID and screenshot watching. */
    static final List<BooleanSetting> PRIVACY = Collections.unmodifiableList(Arrays.asList(
            Settings.DISABLE_ANALYTICS,
            Settings.HIDE_ADVERTISING_ID,
            Settings.TURN_OFF_SCREENSHOT_SHARING));

    /** Every feature switch, the same list a settings file carries: Pause, debug and the release check stay as they are. */
    static final List<BooleanSetting> DEFAULTS = SettingsBackup.ALLOWLIST;

    private QuickSetupKeys() {
    }

    static Map<BooleanSetting, Boolean> quiet() {
        return QuickSetups.allOn(QUIET);
    }

    static Map<BooleanSetting, Boolean> privacy() {
        return QuickSetups.allOn(PRIVACY);
    }

    static Map<BooleanSetting, Boolean> defaults() {
        return QuickSetups.defaults(DEFAULTS);
    }
}
