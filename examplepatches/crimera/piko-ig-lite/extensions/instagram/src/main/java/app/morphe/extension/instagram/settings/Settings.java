/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */
package app.morphe.extension.instagram.settings;

import app.morphe.extension.crimera.settings.SettingsRegistry;

/**
 * Typed reads of the settings the patches contribute to the shared {@link SettingsRegistry}. The IDs
 * and defaults must match the declarations in the patch bundle ({@code InstagramSettings.kt}); the
 * registry answers the default when a contribution was not applied, so a read never throws.
 */
public final class Settings {
    public static final String HIDE_FEED_ADS = "instagram.ads.hide_feed";
    public static final String HIDE_REELS_AND_STORIES_ADS = "instagram.ads.hide_reels_and_stories";
    public static final String FEED_DOWNLOAD_BUTTON = "instagram.downloads.feed_button";
    public static final String STORY_DOWNLOAD_BUTTON = "instagram.downloads.story_button";
    public static final String REEL_DOWNLOAD_BUTTON = "instagram.downloads.reel_button";
    public static final String DOWNLOAD_SHEET_THUMBNAILS = "instagram.downloads.sheet_thumbnails";
    public static final String DIRECT_DOWNLOAD = "instagram.downloads.direct";
    public static final String DOWNLOAD_USERNAME_FOLDER = "instagram.downloads.username_folder";
    public static final String GHOST_STORIES = "instagram.ghost.stories";
    public static final String GHOST_INSTANTS = "instagram.ghost.instants";
    public static final String GHOST_MESSAGES = "instagram.ghost.messages";

    private Settings() {
    }

    public static boolean hideFeedAds() {
        return SettingsRegistry.getBooleanOrDefault(HIDE_FEED_ADS, true);
    }

    public static boolean hideReelsAndStoriesAds() {
        return SettingsRegistry.getBooleanOrDefault(HIDE_REELS_AND_STORIES_ADS, true);
    }

    public static boolean feedDownloadButton() {
        return SettingsRegistry.getBooleanOrDefault(FEED_DOWNLOAD_BUTTON, true);
    }

    public static boolean storyDownloadButton() {
        return SettingsRegistry.getBooleanOrDefault(STORY_DOWNLOAD_BUTTON, true);
    }

    public static boolean reelDownloadButton() {
        return SettingsRegistry.getBooleanOrDefault(REEL_DOWNLOAD_BUTTON, true);
    }

    public static boolean downloadSheetThumbnails() {
        return SettingsRegistry.getBooleanOrDefault(DOWNLOAD_SHEET_THUMBNAILS, true);
    }

    public static boolean directDownload() {
        return SettingsRegistry.getBooleanOrDefault(DIRECT_DOWNLOAD, true);
    }

    public static boolean downloadUsernameFolder() {
        return SettingsRegistry.getBooleanOrDefault(DOWNLOAD_USERNAME_FOLDER, false);
    }

    public static boolean ghostStories() {
        return SettingsRegistry.getBooleanOrDefault(GHOST_STORIES, false);
    }

    public static boolean ghostInstants() {
        return SettingsRegistry.getBooleanOrDefault(GHOST_INSTANTS, false);
    }

    public static boolean ghostMessages() {
        return SettingsRegistry.getBooleanOrDefault(GHOST_MESSAGES, false);
    }
}
