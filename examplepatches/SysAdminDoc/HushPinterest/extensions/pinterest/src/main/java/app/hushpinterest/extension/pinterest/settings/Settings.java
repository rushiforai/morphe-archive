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
 * tracking and Hide advertising ID) keep their switches on, and so does Fix push notifications,
 * since a patched build gets no push notifications without it. Every other patch is in the default
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
    /**
     * Pins Pinterest doesn't label that say they're AI in their own words or come from an AI image
     * site leave the same lists, on Hide AI-labeled pins' hook but its own switch. Off to start.
     */
    public static final BooleanSetting HIDE_AI_SELF_DESCRIBED =
            new BooleanSetting("hushpinterest_hide_ai_self_described", FALSE);

    public static final BooleanSetting HIDE_SHOPPING =
            new BooleanSetting("hushpinterest_hide_shopping", FALSE);
    /**
     * Video pins leave the same lists, on Filter feed's switch: a pin Pinterest marks as video, gives
     * a video list or calls an idea pin with running time. GIFs and photos stay. Off to start.
     */
    public static final BooleanSetting HIDE_VIDEO_PINS =
            new BooleanSetting("hushpinterest_hide_video_pins", FALSE);
    /**
     * Pins you've saved or own leave Home, on Filter feed's switch. Home's request only asks for the
     * field that says so while this or Save pins you download is on. Off to start.
     */
    public static final BooleanSetting HIDE_SAVED_PINS =
            new BooleanSetting("hushpinterest_hide_saved_pins", FALSE);
    /**
     * Filter feed's second capability: pins whose title, grid title or description holds one of
     * these words or phrases leave the same lists. Empty to start, and empty while paused.
     */
    public static final MutedWordsSetting MUTED_WORDS =
            new MutedWordsSetting("hushpinterest_muted_words");
    /** Home keeps its pins when you come back to it. Pull-to-refresh still loads new ones. Off to start. */
    public static final BooleanSetting KEEP_HOME_FEED =
            new BooleanSetting("hushpinterest_keep_home_feed", FALSE);
    /** Its row asks for a restart after turning it off, so a change brings up the restart row. */
    public static final BooleanSetting DISABLE_ANALYTICS =
            new BooleanSetting("hushpinterest_disable_analytics", TRUE, true);
    public static final BooleanSetting STRIP_LINK_TRACKING =
            new BooleanSetting("hushpinterest_strip_link_tracking", TRUE);
    public static final BooleanSetting PLAIN_PIN_LINKS =
            new BooleanSetting("hushpinterest_plain_pin_links", FALSE);
    public static final BooleanSetting HIDE_ADVERTISING_ID =
            new BooleanSetting("hushpinterest_hide_ad_id", TRUE);
    public static final BooleanSetting DOWNLOAD_PINS =
            new BooleanSetting("hushpinterest_download_pins", FALSE);
    /**
     * Downloads go to Pictures/100PINT/Pins, the folder Pinterest's own image save uses, instead of
     * Download. Download pins' second switch: it only changes where a download goes.
     */
    public static final BooleanSetting SAVE_IN_PINTEREST_FOLDER =
            new BooleanSetting("hushpinterest_save_in_pinterest_folder", FALSE);
    /**
     * Download pins' network limits: a download queued while one is on waits in Android's Downloads
     * for a network Android counts as unmetered, or one that isn't roaming. Android keeps the limit
     * a download was queued with, so switching one never changes a download already queued.
     */
    public static final BooleanSetting DOWNLOAD_UNMETERED_ONLY =
            new BooleanSetting("hushpinterest_download_unmetered_only", FALSE);
    public static final BooleanSetting DOWNLOAD_NO_ROAMING =
            new BooleanSetting("hushpinterest_download_no_roaming", FALSE);
    /** Download pins' Copy image row in the pin menu. Starts off, and needs Download pins on. */
    public static final BooleanSetting COPY_IMAGE =
            new BooleanSetting("hushpinterest_copy_image", FALSE);
    /** Download pins' Share image row in the pin menu. Starts off, and needs Download pins on. */
    public static final BooleanSetting SHARE_IMAGE =
            new BooleanSetting("hushpinterest_share_image", FALSE);
    /** Download pins: downloading one pin from its menu also saves it. Starts off, and needs Download pins on. */
    public static final BooleanSetting SAVE_DOWNLOADED_PINS =
            new BooleanSetting("hushpinterest_save_downloaded_pins", FALSE);
    /** Download pins: saving a pin also downloads it. Starts off, and needs Download pins on. */
    public static final BooleanSetting DOWNLOAD_SAVED_PINS =
            new BooleanSetting("hushpinterest_download_saved_pins", FALSE);
    public static final BooleanSetting DOWNLOAD_BOARD =
            new BooleanSetting("hushpinterest_download_board", FALSE);
    public static final BooleanSetting LONG_PRESS_DOWNLOAD =
            new BooleanSetting("hushpinterest_long_press_download", FALSE);
    /** Pinterest's own long-press buttons, each taken out of the menu by its switch. All start off. */
    public static final BooleanSetting LONG_PRESS_HIDE_SAVE =
            new BooleanSetting("hushpinterest_long_press_hide_save", FALSE);
    public static final BooleanSetting LONG_PRESS_HIDE_SEND =
            new BooleanSetting("hushpinterest_long_press_hide_send", FALSE);
    public static final BooleanSetting LONG_PRESS_HIDE_SEARCH =
            new BooleanSetting("hushpinterest_long_press_hide_search", FALSE);
    public static final BooleanSetting EXTERNAL_BROWSER =
            new BooleanSetting("hushpinterest_external_browser", FALSE);
    public static final BooleanSetting SYSTEM_SHARE =
            new BooleanSetting("hushpinterest_system_share", FALSE);
    /** Its row says a change shows after Pinterest restarts, so a change brings up the restart row. */
    public static final BooleanSetting HIDE_SCREENSHOT_SHARE =
            new BooleanSetting("hushpinterest_hide_screenshot_share", FALSE, true);
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
    public static final BooleanSetting HIDE_ASSISTANT =
            new BooleanSetting("hushpinterest_hide_assistant", FALSE);
    public static final BooleanSetting BLACK_BOTTOM_BAR =
            new BooleanSetting("hushpinterest_black_bottom_bar", FALSE);
    public static final BooleanSetting BLACK_COMMENTS =
            new BooleanSetting("hushpinterest_black_comments", FALSE);
    public static final BooleanSetting BLACK_PIN_MENU =
            new BooleanSetting("hushpinterest_black_pin_menu", FALSE);
    public static final BooleanSetting HIDE_CLOSEUP_BACK =
            new BooleanSetting("hushpinterest_hide_closeup_back", FALSE);
    public static final BooleanSetting HIDE_CLOSEUP_LENS =
            new BooleanSetting("hushpinterest_hide_closeup_lens", FALSE);
    public static final BooleanSetting HIDE_CLOSEUP_SEARCH_LABEL =
            new BooleanSetting("hushpinterest_hide_closeup_search_label", FALSE);
    public static final BooleanSetting HIDE_PIN_MENU_COLLAGE =
            new BooleanSetting("hushpinterest_hide_pin_menu_collage", FALSE);
    public static final BooleanSetting HIDE_PIN_MENU_VISUAL_SEARCH =
            new BooleanSetting("hushpinterest_hide_pin_menu_visual_search", FALSE);
    public static final BooleanSetting HIDE_PIN_MENU_PIN_BOOST =
            new BooleanSetting("hushpinterest_hide_pin_menu_pin_boost", FALSE);
    public static final BooleanSetting HIDE_COMMENTS =
            new BooleanSetting("hushpinterest_hide_comments", FALSE);
    public static final BooleanSetting HIDE_SUGGESTED_REPLIES =
            new BooleanSetting("hushpinterest_hide_suggested_replies", FALSE);
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
    public static final BooleanSetting SHOW_POSTED_DATE =
            new BooleanSetting("hushpinterest_show_posted_date", FALSE);
    public static final BooleanSetting DISABLE_UPDATE_NAG =
            new BooleanSetting("hushpinterest_disable_update_nag", FALSE);

    /**
     * Firebase gets Pinterest's own certificate fingerprint when it signs this install up for push
     * notifications ({@link app.hushpinterest.extension.pinterest.notifications.PushNotifications}). On to
     * start: a patched build gets no push notifications at all without it. A change applies the
     * next time Pinterest starts, so it brings up the restart row.
     */
    public static final BooleanSetting FIX_PUSH_NOTIFICATIONS =
            new BooleanSetting("hushpinterest_fix_push_notifications", TRUE, true);

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
