/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushpinterest.extension.pinterest.settings;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.shared.settings.BooleanSetting;

/**
 * The switches behind the hooks that ask before they act.
 *
 * <p>A switch's default is the second argument of its {@link BooleanSetting}. The patches that were
 * in Morphe Manager's default selection from the start (Hide ads, Disable analytics, Strip link
 * tracking and Hide advertising ID) keep their switches on. Every other patch is in the default
 * selection too, and its switches start off, so a build patched with the defaults acts like
 * Pinterest until one is turned on. While HushPinterest is paused, safe mode included
 * ({@link app.hushpinterest.extension.shared.settings.HushPinterestPause}), a switch answers off unless
 * {@link app.hushpinterest.extension.shared.settings.Setting#keepWhenPaused} marks it, and the hook behind
 * it takes Pinterest's own path.
 */
@SuppressWarnings("unused")
public class Settings extends BaseSettings {
    /**
     * Promoted pins leave the home feed, search, related pins and boards before Pinterest shows
     * them, and the views that only ever hold an ad stay collapsed
     * ({@link app.hushpinterest.extension.pinterest.ads.Ads}).
     */
    public static final BooleanSetting HIDE_ADS =
            new BooleanSetting("hushpinterest_hide_ads", TRUE);

    /**
     * Pins Pinterest itself labels as made or changed with AI leave the same lists. Unlabeled AI
     * images stay: nothing in a pin marks them ({@link app.hushpinterest.extension.pinterest.ads.AiPins}).
     * Off to start, since the patch joined Manager's default selection.
     */
    public static final BooleanSetting HIDE_AI_PINS =
            new BooleanSetting("hushpinterest_hide_ai_pins", FALSE);

    public static final BooleanSetting HIDE_SHOPPING =
            new BooleanSetting("hushpinterest_hide_shopping", FALSE);
    public static final BooleanSetting DISABLE_ANALYTICS =
            new BooleanSetting("hushpinterest_disable_analytics", TRUE);
    public static final BooleanSetting STRIP_LINK_TRACKING =
            new BooleanSetting("hushpinterest_strip_link_tracking", TRUE);
    public static final BooleanSetting HIDE_ADVERTISING_ID =
            new BooleanSetting("hushpinterest_hide_ad_id", TRUE);
    public static final BooleanSetting DOWNLOAD_PINS =
            new BooleanSetting("hushpinterest_download_pins", FALSE);
    public static final BooleanSetting DOWNLOAD_BOARD =
            new BooleanSetting("hushpinterest_download_board", FALSE);
    public static final BooleanSetting LONG_PRESS_DOWNLOAD =
            new BooleanSetting("hushpinterest_long_press_download", FALSE);
    public static final BooleanSetting EXTERNAL_BROWSER =
            new BooleanSetting("hushpinterest_external_browser", FALSE);
    public static final BooleanSetting SYSTEM_SHARE =
            new BooleanSetting("hushpinterest_system_share", FALSE);
    public static final BooleanSetting HIDE_SCREENSHOT_SHARE =
            new BooleanSetting("hushpinterest_hide_screenshot_share", FALSE);
    public static final BooleanSetting HIDE_SEARCH_HISTORY =
            new BooleanSetting("hushpinterest_hide_search_history", FALSE);
    public static final BooleanSetting HIDE_NAV_CREATE =
            new BooleanSetting("hushpinterest_hide_nav_create", FALSE);
    public static final BooleanSetting HIDE_NAV_NOTIFICATIONS =
            new BooleanSetting("hushpinterest_hide_nav_notifications", FALSE);
    public static final BooleanSetting HIDE_NAV_SEARCH =
            new BooleanSetting("hushpinterest_hide_nav_search", FALSE);
    public static final BooleanSetting HIDE_HEADER_BUTTONS =
            new BooleanSetting("hushpinterest_hide_header_buttons", FALSE);
    public static final BooleanSetting HIDE_PIN_MENU_COLLAGE =
            new BooleanSetting("hushpinterest_hide_pin_menu_collage", FALSE);
    public static final BooleanSetting HIDE_PIN_MENU_VISUAL_SEARCH =
            new BooleanSetting("hushpinterest_hide_pin_menu_visual_search", FALSE);
    public static final BooleanSetting HIDE_PIN_MENU_PIN_BOOST =
            new BooleanSetting("hushpinterest_hide_pin_menu_pin_boost", FALSE);
    public static final BooleanSetting HIDE_COMMENTS =
            new BooleanSetting("hushpinterest_hide_comments", FALSE);
    public static final BooleanSetting HIDE_TOPIC_SUGGESTIONS =
            new BooleanSetting("hushpinterest_hide_topic_suggestions", FALSE);
    public static final BooleanSetting QUIET_EMAIL_REMINDER =
            new BooleanSetting("hushpinterest_quiet_email_reminder", FALSE);
    public static final BooleanSetting HIDE_SURVEY_PROMPTS =
            new BooleanSetting("hushpinterest_hide_survey_prompts", FALSE);
    public static final BooleanSetting HIDE_SAVE_TOASTS =
            new BooleanSetting("hushpinterest_hide_save_toasts", FALSE);
    public static final BooleanSetting ORIGINAL_IMAGES =
            new BooleanSetting("hushpinterest_original_images", FALSE);
    public static final BooleanSetting DISABLE_UPDATE_NAG =
            new BooleanSetting("hushpinterest_disable_update_nag", FALSE);

    /**
     * Once a day, when Pinterest starts, ask api.github.com whether a newer HushPinterest release is
     * out, and say so on the settings screen ({@link ReleaseCheck}). It's the settings entry's own
     * switch rather than a patch's, so every build has it ({@link PatchFamily#ENTRY_SWITCHES}). Off
     * by default, and a settings file never carries it: a file shouldn't be able to put a phone
     * online.
     */
    public static final BooleanSetting CHECK_FOR_RELEASES =
            new BooleanSetting("hushpinterest_check_releases", FALSE);
}
