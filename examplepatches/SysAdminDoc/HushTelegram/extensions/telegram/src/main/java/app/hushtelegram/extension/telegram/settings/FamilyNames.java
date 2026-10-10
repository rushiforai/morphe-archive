/*
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
package app.hushtelegram.extension.telegram.settings;

/**
 * The name each patch goes by in Morphe Manager, which is also the family its hooks report
 * under in Hook status.
 *
 * <p>Compile-time constants, so a hook that names its family inlines the text and loads no
 * class. That matters for the hooks that can run before HushTelegram has a context, such as one in
 * code Telegram runs while its content providers start: touching {@link PatchFamily}
 * there would load the settings with no context to read them from.
 */
public final class FamilyNames {
    public static final String HIDE_ADS = "Hide ads";
    public static final String HIDE_STORIES = "Hide Stories";
    public static final String HIDE_RECOMMENDATIONS = "Hide recommendations";
    public static final String HIDE_COMMERCE = "Hide Premium, gifts and Stars";
    public static final String HIDE_PROMOTIONAL_BANNERS = "Hide promotional banners";
    public static final String HIDE_SPONSORED_PROXY = "Hide sponsored proxy channel";
    public static final String HIDE_POPULAR_APPS = "Hide popular apps";
    public static final String HIDE_CONTACTS_BLOCK = "Hide contacts on Telegram";
    public static final String HIDE_GREETING_STICKERS = "Hide greeting stickers";
    public static final String DISABLE_CHAT_SWIPE = "Disable chat swipe actions";
    public static final String DISABLE_CHANNEL_PULL = "Disable pull to next channel";
    public static final String NORMAL_PASTE = "Use normal paste";
    public static final String SHOW_LOCAL_IDS = "Show user and chat IDs";
    public static final String DISABLE_DOUBLE_TAP_REACTIONS = "Disable double-tap reactions";
    public static final String QUIET_CONTACTS_NAG = "Quiet contacts nag";
    public static final String HOLIDAY_LOOK = "Holiday look all year";
    public static final String USE_SYSTEM_FONT = "Use system font";
    public static final String AMOLED_BLACK = "AMOLED black";
    public static final String HIDE_TRANSLATE_BAR = "Hide translate bar";
    public static final String EXACT_NUMBERS = "Exact numbers";
    public static final String REVEAL_SPOILERS = "Reveal spoilers";
    public static final String HIDE_KEYBOARD_ON_SCROLL = "Hide keyboard on scroll";
    public static final String KEEP_VIDEOS_MUTED = "Keep videos muted on volume keys";
    public static final String SWIPE_BACK_ON_PROFILES = "Swipe back on profiles";
    public static final String HIDE_PHONE_NUMBER = "Hide phone number";
    public static final String MESSAGE_SECONDS = "Message times with seconds";
    public static final String ALLOW_CHAT_BLUR = "Allow chat blur on slower phones";
    public static final String VOICE_ONE_AT_A_TIME = "Play voice messages one at a time";
    public static final String NO_HAPTICS = "Turn off haptic feedback";
    public static final String REACTION_EFFECTS_OFF = "Turn off reaction effects";
    public static final String HIDE_FOLDER_COUNTERS = "Hide folder tab counters";
    public static final String FORWARD_HIDE_SENDER = "Hide sender names when forwarding";
    public static final String VOICE_MUSIC_PLAYER = "Voice messages in the music player";
    public static final String SILENCE_NON_CONTACTS = "Silence people outside your contacts";
    public static final String DISABLE_ARCHIVE_PULL = "Disable pull to archive";
    public static final String REAR_CAMERA_FIRST = "Start the camera on the rear lens";
    public static final String HIDE_GALLERY_CAMERA_TILE = "Hide gallery camera tile";
    public static final String HIDE_STICKER_TIME = "Hide time on stickers";
    public static final String IGNORE_MUTED_MENTIONS = "Ignore mentions in muted chats";
    public static final String HIDE_BLOCKED_IN_GROUPS = "Hide blocked users in groups";
    public static final String HIDE_FEATURES_AND_INVITE = "Hide Telegram Features and Invite Friends";
    public static final String MESSAGE_MENU_REPEAT = "Add Repeat to the message menu";
    public static final String KEEP_DELETED_MESSAGES = "Keep deleted messages";
    public static final String ASK_BEFORE_STICKER = "Ask before sending a sticker";
    public static final String BETA_LOGS_OFF = "Turn off beta debug logs";
    public static final String DISABLE_ANALYTICS = "Disable analytics";
    public static final String DISABLE_CALL_DEBUG = "Disable call debug upload";
    public static final String DISABLE_DRAFT_PREVIEWS = "Disable draft link previews";
    public static final String GALLERY_CAMERA_ON_TAP = "Gallery camera on tap";
    public static final String OPEN_EXTERNAL_LINKS = "Open links externally";
    public static final String STRIP_LINK_TRACKING = "Strip link tracking";
    public static final String DISABLE_UPDATE_CHECKS = "Disable update checks";
    public static final String REPAIR_FIREBASE_PUSH = "Repair Firebase push registration";

    private FamilyNames() {
    }
}
