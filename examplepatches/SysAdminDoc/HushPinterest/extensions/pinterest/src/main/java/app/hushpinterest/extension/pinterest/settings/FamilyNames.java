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

/**
 * The name each patch goes by in Morphe Manager, which is also the family its hooks report
 * under in Hook status.
 *
 * <p>Compile-time constants, so a hook that names its family inlines the text and loads no
 * class. That matters for the hooks that can run before HushPinterest has a context, such as one in
 * code Pinterest runs while its startup providers run: touching {@link PatchFamily}
 * there would load the settings with no context to read them from.
 */
public final class FamilyNames {
    public static final String HIDE_ADS = "Hide ads";
    public static final String HIDE_AI_PINS = "Hide AI-labeled pins";
    public static final String HIDE_SHOPPING = "Hide shopping and product pins";
    public static final String FILTER_FEED = "Filter feed";
    public static final String KEEP_HOME_FEED = "Keep Home feed";
    public static final String DISABLE_ANALYTICS = "Disable analytics";
    public static final String STRIP_LINK_TRACKING = "Strip link tracking";
    public static final String HIDE_ADVERTISING_ID = "Hide advertising ID";
    public static final String LIKE_COMMENT_HISTORY = "Like and comment history";
    public static final String REMOVE_AD_TRACKING_PERMISSIONS = "Remove ad tracking permissions";
    public static final String SPOOF_SIGNATURE = "Spoof signature for Google sign-in";
    public static final String GMS_CORE_SUPPORT = "GmsCore support";
    public static final String CHANGE_PACKAGE_NAME = "Change package name";
    public static final String DOWNLOAD_PINS = "Download pins";
    public static final String DOWNLOAD_BOARD = "Download board";
    public static final String LONG_PRESS_DOWNLOAD = "Long-press download";
    public static final String EXTERNAL_BROWSER = "Open links in your browser";
    public static final String SYSTEM_SHARE = "System share sheet";
    public static final String HIDE_SCREENSHOT_SHARE = "No screenshot share menu";
    public static final String HIDE_ASSISTANT = "Hide Assistant";
    public static final String HIDE_SEARCH_HISTORY = "Hide search history";
    public static final String HIDE_NAVIGATION_BUTTONS = "Hide navigation buttons";
    public static final String HIDE_HEADER_BUTTONS = "Hide header buttons";
    public static final String AMOLED_BLACK = "AMOLED black";
    public static final String HIDE_CLOSEUP_BUTTONS = "Hide closeup buttons";
    public static final String HIDE_PIN_MENU_ITEMS = "Filter pin menu";
    public static final String HIDE_COMMENTS = "Hide comments";
    public static final String HIDE_TOPIC_SUGGESTIONS = "Hide topic suggestions";
    public static final String HIDE_INBOX_UPDATES = "Hide Inbox updates";
    public static final String QUIET_EMAIL_REMINDER = "Quiet email reminders";
    public static final String HIDE_SURVEY_PROMPTS = "Hide survey prompts";
    public static final String HIDE_POPUP_BANNERS = "Hide pop-up banners";
    public static final String HIDE_RELATED_PINS = "Hide related pins";
    public static final String HIDE_CREATOR_NAME = "Hide creator name on pins";
    public static final String HIDE_PIN_AUTHOR = "Hide pin author";
    public static final String HIDE_PIN_DESCRIPTION = "Hide pin title and description";
    public static final String SHOW_IMAGE_SIZE = "Show image size";
    public static final String SWIPE_TO_CLOSE_PINS = "Swipe down to close pins";
    public static final String FULL_SIZE_PROFILE_PHOTOS = "Full-size profile photos";
    public static final String BEST_VIDEO_QUALITY = "Best video quality";
    public static final String HIDE_HIGHLIGHT_RING = "Hide blue highlight ring";
    public static final String HIDE_VISUAL_SEARCH_THUMBNAILS = "Hide visual search thumbnails";
    public static final String FOLD_RELATED_PINS = "Fold related pins";
    public static final String LET_SCREEN_SLEEP = "Let the screen sleep";
    public static final String CUSTOM_SAVE_SOUND = "Custom save sound";
    public static final String CUSTOM_SPLASH_LOGO = "Custom splash logo";
    public static final String CUSTOM_FONT = "Custom font";
    public static final String BOARD_TABS = "Customize board tabs";
    public static final String HIDE_SAVE_TOASTS = "Hide save toasts";
    public static final String ORIGINAL_IMAGES = "Original-quality images";
    public static final String SHOW_POSTED_DATE = "Show posted date";
    public static final String HIDE_SUGGESTED_BOARDS = "Hide suggested boards";
    public static final String EXPAND_BOARD_LIST = "Expand board list";
    public static final String BOARD_ORDER_WHEN_SAVING = "Board order when saving";
    public static final String PIN_VIDEO_PLAYBACK = "Pin video playback";
    public static final String PINCH_TO_ZOOM_ONLY = "Pinch to zoom only";
    public static final String DISABLE_UPDATE_NAG = "Disable update nag";
    public static final String FIX_PUSH_NOTIFICATIONS = "Fix push notifications";

    private FamilyNames() {
    }
}
