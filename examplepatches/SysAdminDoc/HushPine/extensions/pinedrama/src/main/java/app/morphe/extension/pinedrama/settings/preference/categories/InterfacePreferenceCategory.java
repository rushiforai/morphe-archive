/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.pinedrama.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;


import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsStatus;
import app.morphe.extension.pinedrama.settings.preference.ChoicePreference;
import app.morphe.extension.pinedrama.settings.preference.NumberInputPreference;
import app.morphe.extension.pinedrama.settings.preference.SectionHeadingPreference;
import app.morphe.extension.pinedrama.settings.preference.TogglePreference;

/**
 * Everything drawn on the feed itself, grouped by where it sits: the right column, the buttons
 * HushPine adds, the text beside the video, what is around it, what pops over it, then
 * captions, clear display and gestures. The status bar and screenshot switches cover the whole
 * app, so they're on App. The page used to be one 27-row "Feed controls" card after the
 * captions, in the order the patches were written.
 */
@SuppressWarnings("deprecation")
public final class InterfacePreferenceCategory extends ConditionalPreferenceCategory {
    public InterfacePreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Feed screen");
    }

    /** Whether this page has anything on it. The row into it asks the same question. */
    public static boolean isAvailable() {
        return SettingsStatus.hideFeedFollowButtonEnabled
                || SettingsStatus.hideFeedSaveButtonEnabled
                || SettingsStatus.alwaysShowPublishDateEnabled
                || SettingsStatus.hideFeedSearchButtonEnabled
                || SettingsStatus.feedFilterEnabled
                || SettingsStatus.promotionalBannersEnabled
                || SettingsStatus.sensitiveWarningsEnabled
                || SettingsStatus.automaticClearDisplayEnabled
                || SettingsStatus.longPressSpeedLockEnabled
                || SettingsStatus.disableLongPressQuickShareEnabled
                || SettingsStatus.disableLongPressRepostEnabled;
    }

    @Override
    public boolean getSettingsStatus() {
        return isAvailable();
    }

    @Override
    public void addPreferences(Context context) {
        addRightColumn(context);
        addButtonsOnVideos(context);
        addVideoInfo(context);
        addAroundTheVideo(context);
        addPopups(context);
        addCaptions(context);
        addClearDisplay(context);
        addGestures(context);
    }

    private void addRightColumn(Context context) {
        boolean any = SettingsStatus.hideFeedFollowButtonEnabled
                || SettingsStatus.hideFeedSaveButtonEnabled;
        if (!any) return;
        addPreference(new SectionHeadingPreference(context, "Right column"));
        if (SettingsStatus.hideFeedFollowButtonEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide the follow button on the feed",
                    "Hide the plus button under the creator's picture in the right column.",
                    Settings.HIDE_FEED_FOLLOW_BUTTON
            ));
        }
        if (SettingsStatus.hideFeedSaveButtonEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide the save button on the feed",
                    "Hide the save button in the right column.",
                    Settings.HIDE_FEED_SAVE_BUTTON
            ));
        }
    }

    /**
     * Every control HushPine draws on the video, in one card. They were split between Feed filter
     * and Playback, so nobody could see in one place which of them would show up. Each starts off.
     */
    private void addButtonsOnVideos(Context context) {
        return;
    }

    private void addVideoInfo(Context context) {
        boolean any = SettingsStatus.alwaysShowPublishDateEnabled;
        if (!any) return;
        addPreference(new SectionHeadingPreference(context, "Video info"));
        if (SettingsStatus.alwaysShowPublishDateEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Always show publish date",
                    "Always show the publish date in video author information. Restart PineDrama to apply this.",
                    Settings.ALWAYS_SHOW_PUBLISH_DATE
            ));
            addPreference(new TogglePreference(
                    context,
                    "Show the time to the second",
                    "Show when a video was posted down to the second, with your time zone, in place of PineDrama's short date by the creator's name.",
                    Settings.PUBLISH_DATE_EXACT_TIME
            ));
            addPreference(new TogglePreference(
                    context,
                    "Show the time zone",
                    "Puts your time zone after the time to the second, like EDT.",
                    Settings.PUBLISH_DATE_TIME_ZONE
            ));
            addPreference(new TogglePreference(
                    context,
                    "Short date",
                    "Writes the date before the time to the second the short way your language does, like 10/7/25.",
                    Settings.PUBLISH_DATE_SHORT_DATE
            ));
            addPreference(new TogglePreference(
                    context,
                    "Show dates on profile grids",
                    "Show the day each video was posted under its view count on profile grids.",
                    Settings.PUBLISH_DATE_ON_GRID
            ));
            addPreference(new TogglePreference(
                    context,
                    "Show video length on profile grids",
                    "Show how long each video runs under its view count on profile grids. Photo posts and videos PineDrama sent no length for show none.",
                    Settings.VIDEO_LENGTH_ON_GRID
            ));
            if (SettingsStatus.gridSortEnabled) {
                addPreference(new ChoicePreference(context, "Sort loaded videos on profile grids",
                        Settings.PROFILE_GRID_SORT,
                        new String[]{"Original order", "Newest first", "Oldest first", "Longest first",
                                "Shortest first", "Most viewed first", "Least viewed first",
                                "Most liked first", "Least liked first"},
                        new String[]{"off", "newest", "oldest", "longest", "shortest", "most_viewed",
                                "least_viewed", "most_liked", "least_liked"})
                        .withNote("Sorts a profile or Liked grid with pinned videos first. While an order is on, the grid keeps loading by itself up to 300 videos, so the order covers more than the first screen. A button in the grid's top corner changes the order right there."));
                if (SettingsStatus.likedGridSortEnabled) {
                    addPreference(new ChoicePreference(context, "Sort loaded videos on Liked grids",
                            Settings.LIKED_GRID_SORT,
                            new String[]{"Same as profile grids", "Original order", "Newest first", "Oldest first",
                                    "Longest first", "Shortest first", "Most viewed first", "Least viewed first",
                                    "Most liked first", "Least liked first"},
                            new String[]{"profile", "off", "newest", "oldest", "longest", "shortest", "most_viewed",
                                    "least_viewed", "most_liked", "least_liked"}));
                }
            }
        }
    }

    private void addAroundTheVideo(Context context) {
        boolean any = SettingsStatus.hideFeedSearchButtonEnabled
                || SettingsStatus.feedFilterEnabled;
        if (!any) return;
        addPreference(new SectionHeadingPreference(context, "Around the video"));
        if (SettingsStatus.hideFeedSearchButtonEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide the search button on the feed",
                    "Hide the magnifying glass at the top right of the feed. Search in Inbox and suggestions above comments stay unchanged.",
                    Settings.HIDE_FEED_SEARCH_BUTTON
            ));
        }
        // Feed filter rows that hide things drawn around a video rather than videos.
        // They were the tail of the Feed filter page under "Feed elements", a page about
        // which videos arrive.
        if (SettingsStatus.feedFilterEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide the search bar below videos",
                    "Hide the suggested-search strip above the bottom tabs and let video details and side controls use its space. The top search button and comments stay unchanged.",
                    Settings.HIDE_BOTTOM_SEARCH_BAR
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide the playlist bar",
                    "Hide the playlist bar along the bottom of videos that belong to a series.",
                    Settings.HIDE_PLAYLIST_BAR
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide the event badge",
                    "Hide the floating promotional badge over the feed.",
                    Settings.HIDE_EVENT_BADGE
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide inserted cards",
                    "Hide the friend recommendation card and the other cards PineDrama slots between videos.",
                    Settings.HIDE_INSERTED_CARDS
            ));
        }
    }

    private void addPopups(Context context) {
        boolean any = SettingsStatus.promotionalBannersEnabled
                || SettingsStatus.sensitiveWarningsEnabled;
        if (!any) return;
        addPreference(new SectionHeadingPreference(context, "Popups"));
        if (SettingsStatus.promotionalBannersEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide floating promotions",
                    "Hide floating promotion badges, coins, and timer banners on the feed.",
                    Settings.HIDE_HOMEPAGE_COIN
            ));
        }
        if (SettingsStatus.sensitiveWarningsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Skip content warnings",
                    "Plays videos that PineDrama covers with a content warning without asking you "
                            + "to tap through first.",
                    Settings.HIDE_SENSITIVE_WARNINGS
            ));
            // Left out with its hook on a build where the risk model getter wasn't found.
            if (SettingsStatus.unverifiedNoticesEnabled) {
                addPreference(new TogglePreference(
                        context,
                        "Hide unverified content notices",
                        "Hide the Check sources banner PineDrama puts on videos it marks as unverified, "
                                + "and the warnings it shows when you share one.",
                        Settings.HIDE_UNVERIFIED_NOTICES
                ));
            }
            // Left out with its hooks on a build where the Know the facts gate or prompt wasn't found.
            if (SettingsStatus.checkYourSourcesEnabled) {
                addPreference(new TogglePreference(
                        context,
                        "Hide Check your sources warnings",
                        "Hide the Check your sources banner PineDrama puts across the top of some videos, "
                                + "and the prompt it shows when you share one.",
                        Settings.HIDE_CHECK_YOUR_SOURCES
                ));
            }
        }
    }

    private void addCaptions(Context context) {
    }

    private void addClearDisplay(Context context) {
        if (SettingsStatus.automaticClearDisplayEnabled) {
            addPreference(new SectionHeadingPreference(context, "Clear display"));
        }
        if (SettingsStatus.automaticClearDisplayEnabled) {
            addPreference(new TogglePreference(context, "Automatic Clear display",
                    "Hide controls after each video starts. Tap to restore them.", Settings.AUTOMATIC_CLEAR_DISPLAY));
            NumberInputPreference delay = new NumberInputPreference(context, "Clear display delay",
                    "Wait before hiding the controls.", Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY,
                    "%1$s millisecond", "%1$s milliseconds");
            delay.zeroMeans("No delay");
            addPreference(delay);
        }
        // #232: below the controls row, which stays right under the automatic switch for #84.
        if (SettingsStatus.automaticClearDisplayEnabled) {
            addPreference(new TogglePreference(context, "Keep Clear display across videos",
                    "Clear display you turn on stays on as you swipe to the next video. Off, each new video starts with its controls showing.",
                    Settings.REMEMBER_CLEAR_DISPLAY_ON_SCROLL));
        }
    }

    private void addGestures(Context context) {
        boolean any = SettingsStatus.longPressSpeedLockEnabled
                || SettingsStatus.disableLongPressQuickShareEnabled
                || SettingsStatus.disableLongPressRepostEnabled;
        if (!any) return;
        addPreference(new SectionHeadingPreference(context, "Gestures"));
        // Three more long presses, each its own patch. They sat under Player on the App page,
        // two pages away from the Long press row they belong beside.
        if (SettingsStatus.longPressSpeedLockEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Lock the hold speed with a pull down",
                    "Use PineDrama's own hold, pull down and release gesture to keep playing at the hold speed, "
                            + "2x unless Playback sets another.",
                    Settings.ENABLE_LONG_PRESS_SPEED_LOCK
            ));
        }
        if (SettingsStatus.disableLongPressQuickShareEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Keep long press from quick sharing",
                    "Stop a long press on Share from opening PineDrama's quick share action.",
                    Settings.DISABLE_LONG_PRESS_QUICK_SHARE
            ));
        }
        if (SettingsStatus.disableLongPressRepostEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Keep long press from reposting",
                    "Stop a long press on Like from opening PineDrama's repost action.",
                    Settings.DISABLE_LONG_PRESS_REPOST
            ));
        }
    }
}
