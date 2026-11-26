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
     * Pins you've saved or own leave search results and the More to explore pins under a pin, on Filter
     * feed's switch (#34). Those requests only ask for the field that says so while this is on. Off to start.
     */
    public static final BooleanSetting HIDE_SAVED_PINS_ELSEWHERE =
            new BooleanSetting("hushpinterest_hide_saved_pins_elsewhere", FALSE);
    /**
     * Pins that came on screen on Home, opened or scrolled past, stay out of Home's later pages for the
     * time SeenPins.FOR picks, on Filter feed's switch (#52). Off to start.
     */
    public static final BooleanSetting HIDE_SEEN_PINS =
            new BooleanSetting("hushpinterest_hide_seen_pins", FALSE);
    /**
     * Search results leave out pins you've seen too, and pins that come on screen there count as seen,
     * on Filter feed's switch (#52). Off to start.
     */
    public static final BooleanSetting HIDE_SEEN_PINS_SEARCH =
            new BooleanSetting("hushpinterest_hide_seen_pins_search", FALSE);
    /**
     * Pinterest's own suggestion rows leave Home, on Filter feed's switch: the "More ideas for your
     * board" card, the "Inspired by your interests" row, and the "See more like this?" bubble on a
     * pin. Off to start.
     */
    public static final BooleanSetting HIDE_HOME_SUGGESTIONS =
            new BooleanSetting("hushpinterest_hide_home_suggestions", FALSE);
    /**
     * The "Refine your search" lists of suggested searches leave search results, on Filter feed's
     * switch, before they're drawn. Off to start.
     */
    public static final BooleanSetting HIDE_REFINE_SEARCH =
            new BooleanSetting("hushpinterest_hide_refine_search", FALSE);
    /**
     * Filter feed's second capability: pins whose title, grid title or description holds one of
     * these words or phrases leave the same lists. Empty to start, and empty while paused.
     */
    public static final MutedWordsSetting MUTED_WORDS =
            new MutedWordsSetting("hushpinterest_muted_words");
    /** Home keeps its pins when you come back to it. Pull-to-refresh still loads new ones. Off to start. */
    public static final BooleanSetting KEEP_HOME_FEED =
            new BooleanSetting("hushpinterest_keep_home_feed", FALSE);
    /**
     * Back on a Home scrolled down leaves the way it does at the top, instead of jumping to the top
     * and loading new pins first (#36). Keep Home feed's patch, its own switch. Off to start.
     */
    public static final BooleanSetting BACK_LEAVES_HOME =
            new BooleanSetting("hushpinterest_back_leaves_home", FALSE);
    /**
     * Home doesn't show the pill that offers to refresh it after you've been away (#48). Keep Home
     * feed's patch, its own switch. Off to start.
     */
    public static final BooleanSetting HIDE_REFRESH_PILL =
            new BooleanSetting("hushpinterest_hide_refresh_pill", FALSE);
    /** Its row asks for a restart after turning it off, so a change brings up the restart row. */
    public static final BooleanSetting DISABLE_ANALYTICS =
            new BooleanSetting("hushpinterest_disable_analytics", TRUE, true);
    public static final BooleanSetting STRIP_LINK_TRACKING =
            new BooleanSetting("hushpinterest_strip_link_tracking", TRUE);
    public static final BooleanSetting PLAIN_PIN_LINKS =
            new BooleanSetting("hushpinterest_plain_pin_links", FALSE);
    public static final BooleanSetting HIDE_ADVERTISING_ID =
            new BooleanSetting("hushpinterest_hide_ad_id", TRUE);
    /** #48: a list on the phone of the pins you like and the comments you post. */
    public static final BooleanSetting LIKE_COMMENT_HISTORY =
            new BooleanSetting("hushpinterest_like_comment_history", FALSE);
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
    /** View in the long-press menu (#37): the pin's picture full screen, without opening the pin. */
    public static final BooleanSetting LONG_PRESS_VIEW =
            new BooleanSetting("hushpinterest_long_press_view", FALSE);
    /** Pinterest's own long-press buttons, each taken out of the menu by its switch. All start off. */
    public static final BooleanSetting LONG_PRESS_HIDE_SAVE =
            new BooleanSetting("hushpinterest_long_press_hide_save", FALSE);
    public static final BooleanSetting LONG_PRESS_HIDE_SEND =
            new BooleanSetting("hushpinterest_long_press_hide_send", FALSE);
    public static final BooleanSetting LONG_PRESS_HIDE_SEARCH =
            new BooleanSetting("hushpinterest_long_press_hide_search", FALSE);
    /** The button that sends straight to WhatsApp or the app last shared with (#35). */
    public static final BooleanSetting LONG_PRESS_HIDE_SEND_APP =
            new BooleanSetting("hushpinterest_long_press_hide_send_app", FALSE);
    public static final BooleanSetting EXTERNAL_BROWSER =
            new BooleanSetting("hushpinterest_external_browser", FALSE);
    public static final BooleanSetting SYSTEM_SHARE =
            new BooleanSetting("hushpinterest_system_share", FALSE);
    /** Its row says a change shows after Pinterest restarts, so a change brings up the restart row. */
    public static final BooleanSetting HIDE_SCREENSHOT_SHARE =
            new BooleanSetting("hushpinterest_hide_screenshot_share", FALSE, true);
    public static final BooleanSetting HIDE_SEARCH_HISTORY =
            new BooleanSetting("hushpinterest_hide_search_history", FALSE);
    public static final BooleanSetting BLANK_SEARCH_PAGE =
            new BooleanSetting("hushpinterest_blank_search_page", FALSE);
    /** #48: skips the colored suggested searches in the row under the search bar on search results. */
    public static final BooleanSetting HIDE_SEARCH_SUGGESTIONS =
            new BooleanSetting("hushpinterest_hide_search_suggestions", FALSE);
    public static final BooleanSetting HIDE_NAV_CREATE =
            new BooleanSetting("hushpinterest_hide_nav_create", FALSE);
    public static final BooleanSetting HIDE_NAV_NOTIFICATIONS =
            new BooleanSetting("hushpinterest_hide_nav_notifications", FALSE);
    public static final BooleanSetting HIDE_NAV_SEARCH =
            new BooleanSetting("hushpinterest_hide_nav_search", FALSE);
    public static final BooleanSetting HIDE_HEADER_BUTTONS =
            new BooleanSetting("hushpinterest_hide_header_buttons", FALSE);
    public static final BooleanSetting HIDE_HOME_TABS =
            new BooleanSetting("hushpinterest_hide_home_tabs", FALSE);
    public static final BooleanSetting SEARCH_TAB_KEYBOARD =
            new BooleanSetting("hushpinterest_search_tab_keyboard", FALSE);
    public static final BooleanSetting HIDE_ASSISTANT =
            new BooleanSetting("hushpinterest_hide_assistant", FALSE);
    public static final BooleanSetting BLACK_BOTTOM_BAR =
            new BooleanSetting("hushpinterest_black_bottom_bar", FALSE);
    public static final BooleanSetting BLACK_COMMENTS =
            new BooleanSetting("hushpinterest_black_comments", FALSE);
    public static final BooleanSetting BLACK_PIN_MENU =
            new BooleanSetting("hushpinterest_black_pin_menu", FALSE);
    public static final BooleanSetting BLACK_SAVE_SHEET =
            new BooleanSetting("hushpinterest_black_save_sheet", FALSE);
    public static final BooleanSetting BLACK_SHEETS =
            new BooleanSetting("hushpinterest_black_sheets", FALSE);
    public static final BooleanSetting BLACK_BOARDS =
            new BooleanSetting("hushpinterest_black_boards", FALSE);
    public static final BooleanSetting BLACK_TOASTS =
            new BooleanSetting("hushpinterest_black_toasts", FALSE);
    public static final BooleanSetting BLACK_BUTTONS =
            new BooleanSetting("hushpinterest_black_buttons", FALSE);
    public static final BooleanSetting HIDE_CLOSEUP_BACK =
            new BooleanSetting("hushpinterest_hide_closeup_back", FALSE);
    public static final BooleanSetting HIDE_CLOSEUP_LENS =
            new BooleanSetting("hushpinterest_hide_closeup_lens", FALSE);
    public static final BooleanSetting HIDE_CLOSEUP_SEARCH_LABEL =
            new BooleanSetting("hushpinterest_hide_closeup_search_label", FALSE);
    public static final BooleanSetting HIDE_CLOSEUP_LIKE =
            new BooleanSetting("hushpinterest_hide_closeup_like", FALSE);
    public static final BooleanSetting HIDE_CLOSEUP_COMMENTS =
            new BooleanSetting("hushpinterest_hide_closeup_comments", FALSE);
    public static final BooleanSetting HIDE_CLOSEUP_SHARE =
            new BooleanSetting("hushpinterest_hide_closeup_share", FALSE);
    public static final BooleanSetting HIDE_CLOSEUP_MORE =
            new BooleanSetting("hushpinterest_hide_closeup_more", FALSE);
    public static final BooleanSetting HIDE_CLOSEUP_REMIX =
            new BooleanSetting("hushpinterest_hide_closeup_remix", FALSE);
    public static final BooleanSetting HIDE_CLOSEUP_VISIT_SITE =
            new BooleanSetting("hushpinterest_hide_closeup_visit_site", FALSE);
    public static final BooleanSetting SMALLER_SAVE_BUTTON =
            new BooleanSetting("hushpinterest_smaller_save_button", FALSE);
    public static final BooleanSetting SAVE_COLOR_ON_RED_BUTTONS =
            new BooleanSetting("hushpinterest_save_color_on_red_buttons", FALSE);
    public static final BooleanSetting HIDE_PIN_MENU_COLLAGE =
            new BooleanSetting("hushpinterest_hide_pin_menu_collage", FALSE);
    public static final BooleanSetting HIDE_PIN_MENU_VISUAL_SEARCH =
            new BooleanSetting("hushpinterest_hide_pin_menu_visual_search", FALSE);
    public static final BooleanSetting HIDE_PIN_MENU_PIN_BOOST =
            new BooleanSetting("hushpinterest_hide_pin_menu_pin_boost", FALSE);
    public static final BooleanSetting HIDE_PIN_MENU_ROWS =
            new BooleanSetting("hushpinterest_hide_pin_menu_rows", FALSE);
    public static final BooleanSetting HIDE_COMMENTS =
            new BooleanSetting("hushpinterest_hide_comments", FALSE);
    public static final BooleanSetting HIDE_SUGGESTED_REPLIES =
            new BooleanSetting("hushpinterest_hide_suggested_replies", FALSE);
    public static final BooleanSetting HIDE_COMMENT_PREVIEWS =
            new BooleanSetting("hushpinterest_hide_comment_previews", FALSE);
    public static final BooleanSetting HIDE_TOPIC_SUGGESTIONS =
            new BooleanSetting("hushpinterest_hide_topic_suggestions", FALSE);
    /** The Inbox leaves out its Updates section, and doesn't load it. Messages stay. Off to start. */
    public static final BooleanSetting HIDE_INBOX_UPDATES =
            new BooleanSetting("hushpinterest_hide_inbox_updates", FALSE);
    public static final BooleanSetting QUIET_EMAIL_REMINDER =
            new BooleanSetting("hushpinterest_quiet_email_reminder", FALSE);
    public static final BooleanSetting HIDE_SURVEY_PROMPTS =
            new BooleanSetting("hushpinterest_hide_survey_prompts", FALSE);
    public static final BooleanSetting HIDE_POPUP_BANNERS =
            new BooleanSetting("hushpinterest_hide_popup_banners", FALSE);
    /**
     * The banner at the top that says you're offline, then back online, never shows (#48). Hide
     * pop-up banners' patch, its own switch. Off to start.
     */
    public static final BooleanSetting HIDE_OFFLINE_BANNER =
            new BooleanSetting("hushpinterest_hide_offline_banner", FALSE);
    public static final BooleanSetting HIDE_RELATED_PINS =
            new BooleanSetting("hushpinterest_hide_related_pins", FALSE);
    public static final BooleanSetting HIDE_CREATOR_NAME =
            new BooleanSetting("hushpinterest_hide_creator_name", FALSE);
    public static final BooleanSetting HIDE_PIN_AUTHOR =
            new BooleanSetting("hushpinterest_hide_pin_creator", FALSE);
    public static final BooleanSetting HIDE_PIN_DESCRIPTION =
            new BooleanSetting("hushpinterest_hide_pin_description", FALSE);
    public static final BooleanSetting SHOW_IMAGE_SIZE =
            new BooleanSetting("hushpinterest_show_image_size", FALSE);
    /** #48: Pinterest's own pull-down that closes a pin, kept behind an experiment. */
    public static final BooleanSetting SWIPE_TO_CLOSE_PINS =
            new BooleanSetting("hushpinterest_swipe_to_close_pins", FALSE);
    /** #48: someone else's profile photo opens full size when tapped, kept behind an experiment. */
    public static final BooleanSetting FULL_SIZE_PROFILE_PHOTOS =
            new BooleanSetting("hushpinterest_full_size_profile_photos", FALSE);
    /** #48: Pinterest's own lift of its cap on a video's size, kept behind an experiment. */
    public static final BooleanSetting BEST_VIDEO_QUALITY =
            new BooleanSetting("hushpinterest_best_video_quality", FALSE);
    public static final BooleanSetting HIDE_HIGHLIGHT_RING =
            new BooleanSetting("hushpinterest_hide_highlight_ring", FALSE);
    public static final BooleanSetting HIDE_VISUAL_SEARCH_THUMBNAILS =
            new BooleanSetting("hushpinterest_hide_visual_search_thumbnails", FALSE);
    public static final BooleanSetting FOLD_RELATED_PINS =
            new BooleanSetting("hushpinterest_fold_related_pins", FALSE);
    public static final BooleanSetting LET_SCREEN_SLEEP =
            new BooleanSetting("hushpinterest_let_screen_sleep", FALSE);
    public static final BooleanSetting CUSTOM_SAVE_SOUND =
            new BooleanSetting("hushpinterest_custom_save_sound", FALSE);
    /**
     * The logo picked when patching on the screen Android shows while Pinterest starts, on Android
     * 13 and newer ({@link app.hushpinterest.extension.pinterest.ui.SplashLogo}). Android keeps the
     * answer, so a change shows from the next start. Off to start.
     */
    public static final BooleanSetting CUSTOM_SPLASH_LOGO =
            new BooleanSetting("hushpinterest_custom_splash_logo", FALSE, true);
    /**
     * Pinterest's text is shown in a font file the person picks
     * ({@link app.hushpinterest.extension.pinterest.ui.CustomFont}). Pinterest keeps the fonts it
     * loaded, so a change waits for a restart. Off to start.
     */
    public static final BooleanSetting CUSTOM_FONT =
            new BooleanSetting("hushpinterest_custom_font", FALSE, true);
    public static final BooleanSetting HIDE_BOARD_TAB_BUTTON =
            new BooleanSetting("hushpinterest_hide_board_tab_button", FALSE);
    public static final BooleanSetting HIDE_BOARD_TAB_SUBTITLE =
            new BooleanSetting("hushpinterest_hide_board_tab_subtitle", FALSE);
    public static final BooleanSetting BOARD_TAB_COVERS =
            new BooleanSetting("hushpinterest_board_tab_covers_on", FALSE);
    public static final BooleanSetting HIDE_SAVE_TOASTS =
            new BooleanSetting("hushpinterest_hide_save_toasts", FALSE);
    public static final BooleanSetting HIDE_DOWNLOAD_TOASTS =
            new BooleanSetting("hushpinterest_hide_download_toasts", FALSE);
    public static final BooleanSetting ORIGINAL_IMAGES =
            new BooleanSetting("hushpinterest_original_images", FALSE);
    public static final BooleanSetting SHOW_POSTED_DATE =
            new BooleanSetting("hushpinterest_show_posted_date", FALSE);
    public static final BooleanSetting HIDE_SUGGESTED_BOARDS =
            new BooleanSetting("hushpinterest_hide_suggested_boards", FALSE);
    public static final BooleanSetting EXPAND_BOARD_LIST =
            new BooleanSetting("hushpinterest_expand_board_list", FALSE);
    /** #48: the Save to sheet lists your boards in your profile's order instead of A to Z. */
    public static final BooleanSetting BOARD_ORDER_WHEN_SAVING =
            new BooleanSetting("hushpinterest_board_order_when_saving", FALSE);
    /** #48: a pin page's video waits for a tap on play instead of starting on its own. */
    public static final BooleanSetting NO_PIN_VIDEO_AUTOPLAY =
            new BooleanSetting("hushpinterest_no_pin_video_autoplay", FALSE);
    /** #48: a pin page's video starts with the sound off. */
    public static final BooleanSetting START_PIN_VIDEOS_MUTED =
            new BooleanSetting("hushpinterest_start_pin_videos_muted", FALSE);
    /** #48: a pinch on a pin's picture opens it full screen instead of loading pins that look like it. */
    public static final BooleanSetting PINCH_TO_ZOOM_ONLY =
            new BooleanSetting("hushpinterest_pinch_to_zoom_only", FALSE);
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
