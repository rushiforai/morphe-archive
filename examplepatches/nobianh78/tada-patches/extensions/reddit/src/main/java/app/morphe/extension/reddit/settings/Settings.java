/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */
package app.morphe.extension.reddit.settings;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;
import static app.morphe.extension.shared.settings.Setting.migrateOldSettingToNew;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.shared.settings.preference.SharedPrefCategory;

public class Settings extends BaseSettings {
    // Ads
    public static final BooleanSetting HIDE_COMMENT_ADS = new BooleanSetting("tada_hide_comment_ads", TRUE, true);
    public static final BooleanSetting HIDE_POST_ADS = new BooleanSetting("tada_hide_post_ads", TRUE, true);

    // Layout
    public static final BooleanSetting CUSTOM_FONT = new BooleanSetting("tada_custom_font", FALSE, true);
    public static final StringSetting CUSTOM_FONT_FILE_PATH = new StringSetting("tada_custom_font_file_path", "", true);
    public static final BooleanSetting DISABLE_MODERN_HOME = new BooleanSetting("tada_disable_modern_home", FALSE, true);
    public static final BooleanSetting DISABLE_SCREENSHOT_POPUP = new BooleanSetting("tada_disable_screenshot_popup", TRUE, true);
    public static final BooleanSetting FORCE_SYSTEM_FONT = new BooleanSetting("tada_force_system_font", FALSE, true);
    public static final BooleanSetting HIDE_ASK_BUTTON = new BooleanSetting("tada_hide_ask_button", FALSE, true);
    public static final BooleanSetting HIDE_ANSWERS_BUTTON = new BooleanSetting("tada_hide_answers_button", FALSE, true);
    public static final BooleanSetting HIDE_CHAT_BUTTON = new BooleanSetting("tada_hide_chat_button", FALSE, true);
    public static final BooleanSetting HIDE_COMMUNITIES_SHELF = new BooleanSetting("tada_hide_communities_shelf", FALSE, true);
    public static final BooleanSetting HIDE_CREATE_BUTTON = new BooleanSetting("tada_hide_create_button", FALSE, true);
    public static final BooleanSetting HIDE_DISCOVER_BUTTON = new BooleanSetting("tada_hide_discover_button", FALSE, true);
    public static final BooleanSetting HIDE_GAMES_BUTTON = new BooleanSetting("tada_hide_games_button", FALSE, true);
    public static final BooleanSetting HIDE_ABOUT_SHELF = new BooleanSetting("tada_hide_about_shelf", FALSE, true);
    public static final BooleanSetting HIDE_GAMES_ON_REDDIT_SHELF = new BooleanSetting("tada_hide_games_on_reddit_shelf", FALSE, true);
    public static final BooleanSetting HIDE_RECENTLY_VISITED_SHELF = new BooleanSetting("tada_hide_recently_visited_shelf", FALSE, true);
    public static final BooleanSetting HIDE_RESOURCES_SHELF = new BooleanSetting("tada_hide_resources_shelf", FALSE, true);
    public static final BooleanSetting HIDE_REDDIT_PRO_SHELF = new BooleanSetting("tada_hide_reddit_pro_shelf", FALSE, true);
    public static final BooleanSetting HIDE_TRENDING_SHELVES = new BooleanSetting("tada_hide_trending_shelves", FALSE, true);
    public static final BooleanSetting REMOVE_NSFW_DIALOG = new BooleanSetting("tada_remove_nsfw_dialog", FALSE, true);
    public static final BooleanSetting REMOVE_NOTIFICATION_DIALOG = new BooleanSetting("tada_remove_notification_dialog", FALSE, true);
    public static final BooleanSetting SHOW_VIEW_COUNT = new BooleanSetting("tada_show_view_count", FALSE, true);

    // Miscellaneous
    public static final BooleanSetting OPEN_LINKS_DIRECTLY = new BooleanSetting("tada_open_links_directly", TRUE);
    public static final BooleanSetting OPEN_LINKS_EXTERNALLY = new BooleanSetting("tada_open_links_externally", TRUE);
    public static final BooleanSetting SANITIZE_SHARING_LINKS = new BooleanSetting("tada_sanitize_sharing_links", TRUE);

    private static final BooleanSetting DEPRECATED_HIDE_RECOMMENDED_COMMUNITIES_SHELF = new BooleanSetting("tada_hide_recommended_communities_shelf", FALSE, true);
    private static final BooleanSetting DEPRECATED_HIDE_TRENDING_TODAY_SHELF = new BooleanSetting("tada_hide_trending_today_shelf", FALSE, true);
    private static final BooleanSetting DEPRECATED_SANITIZE_URL_QUERY = new BooleanSetting("tada_sanitize_url_query", TRUE);

    static {
        // region Migration

        SharedPrefCategory oldPrefs = new SharedPrefCategory("reddit_tada");
        for (Setting<?> setting : Setting.allLoadedSettings()) {
            Setting.migrateFromOldPreferences(oldPrefs, setting);
        }

        migrateOldSettingToNew(DEPRECATED_HIDE_RECOMMENDED_COMMUNITIES_SHELF, HIDE_COMMUNITIES_SHELF);
        migrateOldSettingToNew(DEPRECATED_HIDE_TRENDING_TODAY_SHELF, HIDE_TRENDING_SHELVES);
        migrateOldSettingToNew(DEPRECATED_SANITIZE_URL_QUERY, SANITIZE_SHARING_LINKS);

        // endregion
    }
}
