/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManager;
import app.hushtelegram.extension.telegram.misc.FirebasePush;

/**
 * Every patch in this source, and what Pause does to it.
 *
 * <p>Pause and safe mode work through the switches: while either is on, every feature switch
 * answers off and the hook behind it takes Telegram's own path. The hook's code is still there,
 * only its answer changes, and Debug logging keeps its saved value. An edit made when you patched
 * has no switch to ask: a removed manifest permission or a rewritten signer check stays in until
 * you patch again, so each such patch says what of it stays.
 *
 * <p>The settings screen and the diagnostic report read this list, so they can't disagree about
 * it. A family is found in this build by the name of its {@link SettingsStatus} method, the same
 * name the patch uses to switch that method on.
 */
public enum PatchFamily {
    HIDE_ADS(FamilyNames.HIDE_ADS, "hideAds", null,
            Settings.HIDE_ADS),
    HIDE_STORIES(FamilyNames.HIDE_STORIES, "hideStories", null,
            Settings.HIDE_STORIES),
    HIDE_RECOMMENDATIONS(FamilyNames.HIDE_RECOMMENDATIONS, "hideRecommendations", null,
            Settings.HIDE_RECOMMENDATIONS, Settings.HIDE_KEYBOARD_FEATURED),
    HIDE_COMMERCE(FamilyNames.HIDE_COMMERCE, "hideCommerce", null,
            Settings.HIDE_COMMERCE, Settings.HIDE_EMOJI_STATUS, Settings.UNLOCK_PREMIUM_ICONS, Settings.LOCAL_EMOJI_STATUS),
    HIDE_PROMOTIONAL_BANNERS(FamilyNames.HIDE_PROMOTIONAL_BANNERS, "hidePromotionalBanners", null,
            Settings.HIDE_PROMOTIONAL_BANNERS),
    HIDE_SPONSORED_PROXY(FamilyNames.HIDE_SPONSORED_PROXY, "hideSponsoredProxy", null,
            Settings.HIDE_SPONSORED_PROXY),
    HIDE_POPULAR_APPS(FamilyNames.HIDE_POPULAR_APPS, "hidePopularApps", null,
            Settings.HIDE_POPULAR_APPS, Settings.SEARCH_ONLY_MY_CHATS, Settings.SEARCH_STYLED_NAMES, Settings.BLOCK_NEW_CHATS, Settings.DISABLE_SECRET_CHATS),
    HIDE_CONTACTS_BLOCK(FamilyNames.HIDE_CONTACTS_BLOCK, "hideContactsBlock", null, Settings.HIDE_CONTACTS_BLOCK),
    HIDE_GREETING_STICKERS(FamilyNames.HIDE_GREETING_STICKERS, "hideGreetingStickers", null, Settings.HIDE_GREETING_STICKERS),
    DISABLE_CHAT_SWIPE(FamilyNames.DISABLE_CHAT_SWIPE, "disableChatSwipe", null,
            Settings.DISABLE_CHAT_SWIPE),
    DISABLE_CHANNEL_PULL(FamilyNames.DISABLE_CHANNEL_PULL, "disableChannelPull", null,
            Settings.DISABLE_CHANNEL_PULL, Settings.DISABLE_TOPIC_PULL),
    NORMAL_PASTE(FamilyNames.NORMAL_PASTE, "normalPaste", null, Settings.NORMAL_PASTE, Settings.MENTION_BY_ID),
    SHOW_LOCAL_IDS(FamilyNames.SHOW_LOCAL_IDS, "showLocalIds", null, Settings.SHOW_LOCAL_IDS, Settings.PROFILE_DATA_CENTER,
            Settings.SPECIAL_CONTACTS),
    DISABLE_DOUBLE_TAP_REACTIONS(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS, "disableDoubleTapReactions", null,
            Settings.DISABLE_DOUBLE_TAP_REACTIONS, Settings.HIDE_REACTION_ROWS, Settings.HIDE_REACTION_PICKER, Settings.HIDE_EMOJI_PACK_NOTE),
    QUIET_CONTACTS_NAG(FamilyNames.QUIET_CONTACTS_NAG, "quietContactsNag", null,
            Settings.QUIET_CONTACTS_NAG),
    HOLIDAY_LOOK(FamilyNames.HOLIDAY_LOOK, "holidayLook", null,
            Settings.HOLIDAY_LOOK),
    USE_SYSTEM_FONT(FamilyNames.USE_SYSTEM_FONT, "useSystemFont", null, Settings.USE_SYSTEM_FONT),
    AMOLED_BLACK(FamilyNames.AMOLED_BLACK, "amoledBlack", null, Settings.AMOLED_BLACK),
    HIDE_TRANSLATE_BAR(FamilyNames.HIDE_TRANSLATE_BAR, "hideTranslateBar", null, Settings.HIDE_TRANSLATE_BAR),
    EXACT_NUMBERS(FamilyNames.EXACT_NUMBERS, "exactNumbers", null, Settings.EXACT_NUMBERS),
    REVEAL_SPOILERS(FamilyNames.REVEAL_SPOILERS, "revealSpoilers", null, Settings.REVEAL_SPOILERS, Settings.REVEAL_MENU,
            Settings.SEARCH_OPENS_QUOTES),
    HIDE_KEYBOARD_ON_SCROLL(FamilyNames.HIDE_KEYBOARD_ON_SCROLL, "hideKeyboardOnScroll", null, Settings.HIDE_KEYBOARD_ON_SCROLL),
    KEEP_VIDEOS_MUTED(FamilyNames.KEEP_VIDEOS_MUTED, "keepVideosMuted", null, Settings.KEEP_VIDEOS_MUTED, Settings.VIDEO_EITHER_LANDSCAPE,
            Settings.VIDEO_ONLY_FROM_BUTTON, Settings.VIDEO_STARTS_SILENT),
    SWIPE_BACK_ON_PROFILES(FamilyNames.SWIPE_BACK_ON_PROFILES, "swipeBackOnProfiles", null, Settings.SWIPE_BACK_ON_PROFILES),
    HIDE_PHONE_NUMBER(FamilyNames.HIDE_PHONE_NUMBER, "hidePhoneNumber", null, Settings.HIDE_PHONE_NUMBER,
            Settings.SHARE_NUMBER_UNTICKED),
    MESSAGE_SECONDS(FamilyNames.MESSAGE_SECONDS, "messageSeconds", null, Settings.MESSAGE_SECONDS),
    ALLOW_CHAT_BLUR(FamilyNames.ALLOW_CHAT_BLUR, "allowChatBlur", null, Settings.ALLOW_CHAT_BLUR),
    VOICE_ONE_AT_A_TIME(FamilyNames.VOICE_ONE_AT_A_TIME, "voiceOneAtATime", null, Settings.VOICE_ONE_AT_A_TIME,
            Settings.LOCKED_VOICE_GUARD),
    NO_HAPTICS(FamilyNames.NO_HAPTICS, "noHaptics", null, Settings.NO_HAPTICS),
    REACTION_EFFECTS_OFF(FamilyNames.REACTION_EFFECTS_OFF, "reactionEffectsOff", null, Settings.REACTION_EFFECTS_OFF),
    HIDE_FOLDER_COUNTERS(FamilyNames.HIDE_FOLDER_COUNTERS, "hideFolderCounters", null, Settings.HIDE_FOLDER_COUNTERS,
            Settings.LAUNCH_FOLDER, Settings.HIDE_ALL_CHATS, Settings.MOVE_ALL_CHATS, Settings.HIDDEN_CHATS, Settings.SORT_BY_DATE,
            Settings.SORT_OLDEST_FIRST, Settings.HIDDEN_CHATS_PASSCODE, Settings.ADMIN_CHATS,
            Settings.HIDE_ACCOUNTS, Settings.HIDDEN_ACCOUNTS_LOCK, Settings.FIT_ALL_TABS, Settings.FOLDER_TAB_ICONS),
    FORWARD_HIDE_SENDER(FamilyNames.FORWARD_HIDE_SENDER, "forwardHideSender", null, Settings.FORWARD_HIDE_SENDER),
    VOICE_MUSIC_PLAYER(FamilyNames.VOICE_MUSIC_PLAYER, "voiceMusicPlayer", null, Settings.VOICE_MUSIC_PLAYER,
            Settings.PLAYBACK_POSITION, Settings.VOICE_SKIP),
    SILENCE_NON_CONTACTS(FamilyNames.SILENCE_NON_CONTACTS, "silenceNonContacts", null, Settings.SILENCE_NON_CONTACTS),
    DISABLE_ARCHIVE_PULL(FamilyNames.DISABLE_ARCHIVE_PULL, "disableArchivePull", null, Settings.DISABLE_ARCHIVE_PULL),
    REAR_CAMERA_FIRST(FamilyNames.REAR_CAMERA_FIRST, "rearCameraFirst", null, Settings.REAR_CAMERA_FIRST),
    HIDE_GALLERY_CAMERA_TILE(FamilyNames.HIDE_GALLERY_CAMERA_TILE, "hideGalleryCameraTile", null, Settings.HIDE_GALLERY_CAMERA_TILE),
    HIDE_STICKER_TIME(FamilyNames.HIDE_STICKER_TIME, "hideStickerTime", null, Settings.HIDE_STICKER_TIME),
    CHANGE_STICKER_SIZE(FamilyNames.CHANGE_STICKER_SIZE, "stickerSize", null, Settings.CHANGE_STICKER_SIZE),
    IGNORE_MUTED_MENTIONS(FamilyNames.IGNORE_MUTED_MENTIONS, "ignoreMutedMentions", null, Settings.IGNORE_MUTED_MENTIONS),
    HIDE_BLOCKED_IN_GROUPS(FamilyNames.HIDE_BLOCKED_IN_GROUPS, "hideBlockedInGroups", null, Settings.HIDE_BLOCKED_IN_GROUPS),
    HIDE_BY_KEYWORD(FamilyNames.HIDE_BY_KEYWORD, "hideByKeyword", null, Settings.HIDE_BY_KEYWORD),
    HIDE_FEATURES_AND_INVITE(FamilyNames.HIDE_FEATURES_AND_INVITE, "hideFeaturesAndInvite", null, Settings.HIDE_FEATURES_AND_INVITE),
    MESSAGE_MENU_REPEAT(FamilyNames.MESSAGE_MENU_REPEAT, "messageMenuRepeat", null, Settings.MESSAGE_MENU_REPEAT, Settings.MESSAGE_MENU_COPY_PHOTO, Settings.MESSAGE_MENU_DETAILS, Settings.MESSAGE_MENU_QUICK_FORWARD, Settings.MESSAGE_MENU_COPY_PROTECTED, Settings.MESSAGE_MENU_SAVE_PROTECTED, Settings.MESSAGE_MENU_FORWARD_COPY, Settings.MESSAGE_MENU_FAST_FORWARD, Settings.MESSAGE_MENU_FORWARD_SAVED, Settings.MESSAGE_MENU_SAVE_COVER, Settings.MESSAGE_MENU_SAVE_ART, Settings.MESSAGE_MENU_CLEAR_CACHE, Settings.MESSAGE_MENU_HIDE, Settings.MESSAGE_MENU_PLAIN_FORWARD, Settings.MESSAGE_MENU_DELETE_FOR_THEM, Settings.STORY_SAVE_BUTTON, Settings.ALLOW_SCREENSHOTS, Settings.SELECT_BETWEEN, Settings.SELECTION_SCREENSHOT, Settings.SELECT_ALL),
    KEEP_DELETED_MESSAGES(FamilyNames.KEEP_DELETED_MESSAGES, "keepDeleted", null, Settings.KEEP_DELETED_MESSAGES, Settings.RED_DELETED_LABEL,
            Settings.KEEP_EDIT_HISTORY, Settings.KEEP_TIMED_MEDIA),
    ASK_BEFORE_STICKER(FamilyNames.ASK_BEFORE_STICKER, "askBeforeSending", null, Settings.ASK_BEFORE_STICKER, Settings.ASK_BEFORE_GIF, Settings.ASK_BEFORE_VOICE_VIDEO, Settings.ASK_BEFORE_CALL),
    OUTSIDE_TRANSLATE(FamilyNames.OUTSIDE_TRANSLATE, "outsideTranslate", null, Settings.OUTSIDE_TRANSLATE),
    HIDE_CHANNEL_BUTTONS(FamilyNames.HIDE_CHANNEL_BUTTONS, "hideChannelButtons", null, Settings.HIDE_CHANNEL_BUTTONS, Settings.HIDE_CHANNEL_MUTE, Settings.HIDE_CHANNEL_SHARE),
    HIDE_SEND_AS(FamilyNames.HIDE_SEND_AS, "hideSendAs", null, Settings.HIDE_SEND_AS),
    HIDE_CONTACTS_TAB(FamilyNames.HIDE_CONTACTS_TAB, "hideContactsTab", null, Settings.HIDE_CONTACTS_TAB,
            Settings.COMPACT_TAB_BAR, Settings.SIDE_MENU, Settings.HIDE_NEW_MESSAGE),
    FASTER_DOWNLOADS(FamilyNames.FASTER_DOWNLOADS, "fasterDownloads", null, Settings.FASTER_DOWNLOADS,
            Settings.DATA_SAVER_DOWNLOADS, Settings.DOWNLOAD_MANAGER, Settings.FASTER_UPLOADS, Settings.BEST_QUALITY_MEDIA),
    SAVE_DOWNLOADS(FamilyNames.SAVE_DOWNLOADS, "saveDownloads", null, Settings.SAVE_DOWNLOADS,
            Settings.SAVE_RESTRICTED_DOWNLOADS, Settings.SAVE_TIMED_MEDIA, Settings.STORAGE_FOLDER),
    CHAT_TYPE_FOLDERS(FamilyNames.CHAT_TYPE_FOLDERS, "chatTypeFolders", null, Settings.CHAT_TYPE_FOLDERS),
    DISABLE_ANALYTICS(FamilyNames.DISABLE_ANALYTICS, "disableAnalytics", null,
            Settings.DISABLE_ANALYTICS, Settings.GHOST_MODE, Settings.GHOST_READS, Settings.GHOST_STORIES,
            Settings.GHOST_TYPING, Settings.GHOST_ONLINE, Settings.GHOST_BUTTON, Settings.GHOST_READ_AFTER_SEND,
            Settings.GHOST_READS_BUTTON, Settings.GHOST_CHATS, Settings.FAKE_TYPING, Settings.RECEIVE_ONLY,
            Settings.POWER_OFF_ACCOUNTS, Settings.INSTANT_LOCK, Settings.QUIET_SIGN_UP),
    DISABLE_CALL_DEBUG(FamilyNames.DISABLE_CALL_DEBUG, "disableCallDebug", null,
            Settings.DISABLE_CALL_DEBUG, Settings.RECORD_CALLS, Settings.RECORD_CALL_BUTTON, Settings.RECORD_CALLS_NOTIFY,
            Settings.RECORD_CALLS_OPUS),
    DISABLE_DRAFT_PREVIEWS(FamilyNames.DISABLE_DRAFT_PREVIEWS, "disableDraftPreviews", null,
            Settings.DISABLE_DRAFT_PREVIEWS, Settings.LOCAL_DRAFTS, Settings.LOCAL_SEARCH),
    GALLERY_CAMERA_ON_TAP(FamilyNames.GALLERY_CAMERA_ON_TAP, "galleryCameraOnTap", null,
            Settings.GALLERY_CAMERA_ON_TAP),
    OPEN_EXTERNAL_LINKS(FamilyNames.OPEN_EXTERNAL_LINKS, "openExternalLinks", null,
            Settings.OPEN_EXTERNAL_LINKS, Settings.MINI_APP_LOCATION_OFF),
    STRIP_LINK_TRACKING(FamilyNames.STRIP_LINK_TRACKING, "stripLinkTracking", null,
            Settings.STRIP_LINK_TRACKING, Settings.SKIP_AUTOLOGIN, Settings.STRIP_LINK_COPY_PASTE),
    DISABLE_UPDATE_CHECKS(FamilyNames.DISABLE_UPDATE_CHECKS, "disableUpdateChecks", null,
            Settings.DISABLE_UPDATE_CHECKS),
    REPAIR_FIREBASE_PUSH(FamilyNames.REPAIR_FIREBASE_PUSH, "repairFirebasePush", null,
            Settings.REPAIR_FIREBASE_PUSH, Settings.KEEP_ALIVE_RUNNING),
    UNIFIED_PUSH(FamilyNames.UNIFIED_PUSH, "unifiedPush", null, Settings.UNIFIED_PUSH, Settings.REACTION_ALERTS,
            Settings.REACTION_SOUND),
    TEST_SERVER_SIGN_IN(FamilyNames.TEST_SERVER_SIGN_IN, "testServerSignIn", null, Settings.TEST_SERVER_SIGN_IN),
    BOT_TOKEN_SIGN_IN(FamilyNames.BOT_TOKEN_SIGN_IN, "botTokenSignIn", null, Settings.BOT_TOKEN_SIGN_IN),
    SUPPRESS_SCREENSHOT_NOTIFICATION(FamilyNames.SUPPRESS_SCREENSHOT_NOTIFICATION, "suppressScreenshotNotification", null,
            Settings.SUPPRESS_SCREENSHOT_NOTIFICATION),
    UNLOCK_PREMIUM(FamilyNames.UNLOCK_PREMIUM, "unlockPremium", null, Settings.UNLOCK_PREMIUM),
    BYPASS_CHANNEL_RESTRICTIONS(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "bypassChannelRestrictions", null,
            Settings.BYPASS_CHANNEL_RESTRICTIONS, Settings.OPEN_RESTRICTED_CHATS),
    BYPASS_INTEGRITY_CHECK(FamilyNames.BYPASS_INTEGRITY_CHECK, "bypassIntegrityCheck", null,
            Settings.BYPASS_INTEGRITY_CHECK),
    AUTO_FORWARDING(FamilyNames.AUTO_FORWARDING, "autoForwarding", null, Settings.AUTO_FORWARDING),
    CROP_GUARD(FamilyNames.CROP_GUARD, "cropGuard", null, Settings.CROP_GUARD),
    CAPTION_ORDER(FamilyNames.CAPTION_ORDER, "captionOrder", null, Settings.CAPTION_ORDER),
    PROXY_MENU(FamilyNames.PROXY_MENU, "proxyMenu", null, Settings.PROXY_MENU),
    FREE_PROXIES(FamilyNames.FREE_PROXIES, "freeProxies", null, Settings.FREE_PROXIES, Settings.SIGN_IN_PROXY),
    MY_MESSAGES(FamilyNames.MY_MESSAGES, "myMessages", null, Settings.MY_MESSAGES),
    TEXT_DIRECTION(FamilyNames.TEXT_DIRECTION, "textDirection", null, Settings.TEXT_DIRECTION),
    LYRICS(FamilyNames.LYRICS, "lyrics", null, Settings.LYRICS, Settings.SONG_DATES),
    CHAT_PREVIEW_BUTTONS(FamilyNames.CHAT_PREVIEW_BUTTONS, "chatPreviewButtons", null, Settings.CHAT_PREVIEW_BUTTONS);

    /** The patch's name in Morphe Manager. */
    public final String patchName;

    /** The {@link SettingsStatus} method the patch switches on. */
    final String statusMethod;

    /**
     * What of this patch stays in while HushTelegram is paused, or null when nothing does. One
     * thing, never a plural: alone on the screen it's followed by its patch's name in brackets and
     * "It was set when you patched".
     * It says what stays in, not what the patch is called. The name follows it in brackets, so an
     * item that was the name would read it twice.
     * The English is also a key of {@link L10n}: the screen shows it translated, and the report
     * keeps it in English.
     */
    @Nullable
    public final String staysWhilePaused;

    /** The switches Pause turns off for this patch. Empty when it has none. */
    public final List<BooleanSetting> switches;

    /**
     * The switches of the settings entry itself, which no family owns: every build with this screen
     * carries them. Today that's the release check. Pause turns them off like a family's switches,
     * so the screen draws them above the Pause row with the rest.
     */
    static final List<BooleanSetting> ENTRY_SWITCHES = Collections.singletonList(Settings.CHECK_FOR_RELEASES);


    /** The families a test says this build carries, instead of asking {@link SettingsStatus}. */
    @Nullable
    static volatile Set<PatchFamily> inBuildForTests;

    /**
     * Lets a test say what a family's {@link #staysWhilePaused} reads as, for the families in this
     * build, none of which has one of its own. Cleared by setting it back to null.
     */
    @Nullable
    static volatile Map<PatchFamily, String> staysWhilePausedForTests;

    /** Overrides target facts for partial-build tests. Null uses the flags injected when patching. */
    @Nullable
    static volatile Set<Capability> capabilitiesForTests;

    /**
     * The settings pages that hold switches, in the order they're drawn, each with the families
     * whose switches it holds. They follow Morphe Manager's categories so a patch is found under
     * the same name in both: Ads takes Search's one patch, Chat list takes Stories', Look and feel
     * holds Interface and Theme, and Notifications keeps the push repair. The link switches have
     * their own Links page and the update switch its Updates page, as before.
     */
    enum Page {
        ADS("Ads", HIDE_ADS, HIDE_COMMERCE, HIDE_PROMOTIONAL_BANNERS, HIDE_SPONSORED_PROXY, HIDE_POPULAR_APPS),
        CHAT_LIST("Chat list", HIDE_STORIES, HIDE_CONTACTS_BLOCK, DISABLE_CHAT_SWIPE, CHAT_PREVIEW_BUTTONS,
                DISABLE_ARCHIVE_PULL, HIDE_FOLDER_COUNTERS, CHAT_TYPE_FOLDERS, HIDE_CONTACTS_TAB, PROXY_MENU, FREE_PROXIES,
                TEST_SERVER_SIGN_IN, BOT_TOKEN_SIGN_IN),
        CONVERSATIONS("Conversations", HIDE_GREETING_STICKERS, DISABLE_CHANNEL_PULL, NORMAL_PASTE,
                DISABLE_DOUBLE_TAP_REACTIONS, HIDE_TRANSLATE_BAR, OUTSIDE_TRANSLATE, REVEAL_SPOILERS, FORWARD_HIDE_SENDER,
                REAR_CAMERA_FIRST, HIDE_GALLERY_CAMERA_TILE, HIDE_BLOCKED_IN_GROUPS, HIDE_BY_KEYWORD, MESSAGE_MENU_REPEAT,
                KEEP_DELETED_MESSAGES, ASK_BEFORE_STICKER, CROP_GUARD, CAPTION_ORDER, MY_MESSAGES, TEXT_DIRECTION),
        PLAYBACK("Playback", KEEP_VIDEOS_MUTED, VOICE_ONE_AT_A_TIME, VOICE_MUSIC_PLAYER, LYRICS, FASTER_DOWNLOADS,
                SAVE_DOWNLOADS),
        NOTIFICATIONS("Notifications", REPAIR_FIREBASE_PUSH, UNIFIED_PUSH, SILENCE_NON_CONTACTS, IGNORE_MUTED_MENTIONS),
        LOOK("Look and feel", HIDE_RECOMMENDATIONS, QUIET_CONTACTS_NAG, SHOW_LOCAL_IDS, HOLIDAY_LOOK, USE_SYSTEM_FONT,
                AMOLED_BLACK, EXACT_NUMBERS, HIDE_KEYBOARD_ON_SCROLL, SWIPE_BACK_ON_PROFILES, MESSAGE_SECONDS,
                ALLOW_CHAT_BLUR, NO_HAPTICS, REACTION_EFFECTS_OFF, HIDE_STICKER_TIME, CHANGE_STICKER_SIZE, HIDE_FEATURES_AND_INVITE,
                HIDE_CHANNEL_BUTTONS, HIDE_SEND_AS),
        PRIVACY("Privacy", DISABLE_ANALYTICS, DISABLE_CALL_DEBUG, DISABLE_DRAFT_PREVIEWS, GALLERY_CAMERA_ON_TAP,
                HIDE_PHONE_NUMBER, SUPPRESS_SCREENSHOT_NOTIFICATION, UNLOCK_PREMIUM,
                BYPASS_CHANNEL_RESTRICTIONS, BYPASS_INTEGRITY_CHECK, AUTO_FORWARDING);

        /** The English title, which is also the page's route and its translation key. */
        final String title;
        final Set<PatchFamily> families;

        Page(String title, PatchFamily first, PatchFamily... rest) {
            this.title = title;
            this.families = Collections.unmodifiableSet(EnumSet.of(first, rest));
        }

        /** The page a family's switches sit on, or null for Links, Updates and families without a switch. */
        @Nullable
        static Page of(PatchFamily family) {
            for (Page page : values()) if (page.families.contains(family)) return page;
            return null;
        }

        /** Whether this build put anything on the page. */
        boolean inBuild(Set<PatchFamily> build) {
            return !Collections.disjoint(build, families);
        }

        /** The title as shown, written out so the translation check sees each one. */
        String label() {
            switch (this) {
                case ADS: return L10n.t("Ads");
                case CHAT_LIST: return L10n.t("Chat list");
                case CONVERSATIONS: return L10n.t("Conversations");
                case PLAYBACK: return L10n.t("Playback");
                case NOTIFICATIONS: return L10n.t("Notifications");
                case LOOK: return L10n.t("Look and feel");
                default: return L10n.t("Privacy");
            }
        }
    }

    /**
     * Short headings that split the two long pages, so a switch is found by what it changes rather
     * than by scrolling thirty rows. Every family on Conversations and Look and feel sits in exactly
     * one group of its page, and the other pages are short enough to read as one card. Groups are
     * drawn in the order listed here, and a group's rows in the order of its families.
     */
    enum Group {
        IN_A_CHAT(Page.CONVERSATIONS, "In a chat", HIDE_GREETING_STICKERS, DISABLE_CHANNEL_PULL, NORMAL_PASTE,
                DISABLE_DOUBLE_TAP_REACTIONS, REVEAL_SPOILERS, MY_MESSAGES, TEXT_DIRECTION),
        MESSAGE_MENU(Page.CONVERSATIONS, "Message menu", MESSAGE_MENU_REPEAT),
        SENDING(Page.CONVERSATIONS, "Sending", FORWARD_HIDE_SENDER, ASK_BEFORE_STICKER, CROP_GUARD, CAPTION_ORDER),
        ATTACHMENT_MENU(Page.CONVERSATIONS, "Attachment menu", REAR_CAMERA_FIRST, HIDE_GALLERY_CAMERA_TILE),
        TRANSLATION(Page.CONVERSATIONS, "Translation", HIDE_TRANSLATE_BAR, OUTSIDE_TRANSLATE),
        HIDDEN_MESSAGES(Page.CONVERSATIONS, "Hidden messages", HIDE_BLOCKED_IN_GROUPS, HIDE_BY_KEYWORD),
        DELETED_MESSAGES(Page.CONVERSATIONS, "Deleted messages", KEEP_DELETED_MESSAGES),
        THEME(Page.LOOK, "Theme", AMOLED_BLACK, USE_SYSTEM_FONT, HOLIDAY_LOOK, ALLOW_CHAT_BLUR),
        MESSAGES(Page.LOOK, "Messages and stickers", MESSAGE_SECONDS, EXACT_NUMBERS, REACTION_EFFECTS_OFF, HIDE_STICKER_TIME,
                CHANGE_STICKER_SIZE),
        PROFILES(Page.LOOK, "Profiles", SHOW_LOCAL_IDS, SWIPE_BACK_ON_PROFILES),
        TOUCH_AND_KEYBOARD(Page.LOOK, "Touch and keyboard", NO_HAPTICS, HIDE_KEYBOARD_ON_SCROLL),
        LESS_CLUTTER(Page.LOOK, "Less clutter", HIDE_RECOMMENDATIONS, QUIET_CONTACTS_NAG, HIDE_FEATURES_AND_INVITE,
                HIDE_CHANNEL_BUTTONS, HIDE_SEND_AS);

        final Page page;
        /** The English heading, which is also its translation key. */
        final String title;
        final List<PatchFamily> families;

        Group(Page page, String title, PatchFamily... families) {
            this.page = page;
            this.title = title;
            this.families = Collections.unmodifiableList(Arrays.asList(families));
        }

        /** The group a family's rows sit in, or null for a family on a page that isn't split. */
        @Nullable
        static Group of(PatchFamily family) {
            for (Group group : values()) if (group.families.contains(family)) return group;
            return null;
        }

        /** The family whose switch carries this key, or null for a row that isn't a family's switch. */
        @Nullable
        static PatchFamily owner(String key) {
            for (PatchFamily family : PatchFamily.values()) {
                for (BooleanSetting setting : family.switches) if (setting.key.equals(key)) return family;
            }
            return null;
        }

        /** The heading as shown, written out so the translation check sees each one. */
        String label() {
            switch (this) {
                case IN_A_CHAT: return L10n.t("In a chat");
                case MESSAGE_MENU: return L10n.t("Message menu");
                case SENDING: return L10n.t("Sending");
                case ATTACHMENT_MENU: return L10n.t("Attachment menu");
                case TRANSLATION: return L10n.t("Translation");
                case HIDDEN_MESSAGES: return L10n.t("Hidden messages");
                case DELETED_MESSAGES: return L10n.t("Deleted messages");
                case THEME: return L10n.t("Theme");
                case MESSAGES: return L10n.t("Messages and stickers");
                case PROFILES: return L10n.t("Profiles");
                case TOUCH_AND_KEYBOARD: return L10n.t("Touch and keyboard");
                default: return L10n.t("Less clutter");
            }
        }
    }

    /** Each independent hook, its owning family and the flag set only after it was inserted. */
    public enum Capability {
        CHANNEL_ADS(HIDE_ADS, "channelAds", "channel ads"),
        VIDEO_ADS(HIDE_ADS, "videoAds", "video ads"),
        SEARCH_ADS(HIDE_ADS, "searchAds", "search ads"),
        STORY_REQUESTS(HIDE_STORIES, "storyRequests", "story list requests"),
        STORY_BAR(HIDE_STORIES, "storyBar", "chat-list story bar"),
        STORY_CAMERA(HIDE_STORIES, "storyCamera", "Post Story button"),
        STORY_AVATARS(HIDE_STORIES, "storyAvatars", "avatar story rings"),
        STORY_TOUCHES(HIDE_STORIES, "storyTouches", "avatar story taps"),
        CHANNEL_RECOMMENDATIONS(HIDE_RECOMMENDATIONS, "channelRecommendations", "similar channels and bots"),
        CACHED_RECOMMENDATIONS(HIDE_RECOMMENDATIONS, "cachedRecommendations", "cached recommendations"),
        KEYBOARD_FEATURED(HIDE_RECOMMENDATIONS, "keyboardFeatured", "trending packs in the sticker and emoji keyboards", true),
        READ_METRICS(DISABLE_ANALYTICS, "readMetrics", "channel read metrics"),
        PREMIUM_PROMO_SHOW(DISABLE_ANALYTICS, "premiumPromoShow", "Premium promo views"),
        PREMIUM_PROMO_TAP(DISABLE_ANALYTICS, "premiumPromoTap", "Premium promo taps"),
        PREMIUM_PROMO_ACCEPT(DISABLE_ANALYTICS, "premiumPromoAccept", "Premium promo accepts"),
        PREMIUM_PROMO_FAIL(DISABLE_ANALYTICS, "premiumPromoFail", "Premium promo failures"),
        DUAL_CAMERA_REPORTS(DISABLE_ANALYTICS, "dualCameraReport", "dual camera reports"),
        GHOST_MODE(DISABLE_ANALYTICS, "ghostMode", "read receipts and story views", true),
        RECEIVE_ONLY(DISABLE_ANALYTICS, "receiveOnly", "receive only mode", true),
        POWER_OFF_ACCOUNTS(DISABLE_ANALYTICS, "powerOff", "powering off accounts", true),
        INSTANT_LOCK(DISABLE_ANALYTICS, "instantLock", "instant lock", true),
        QUIET_SIGN_UP(DISABLE_ANALYTICS, "quietSignUp", "quiet sign-up", true),
        DELETE_ACCOUNT(DISABLE_ANALYTICS, "deleteAccount", "account deletion", true),
        CALL_DEBUG_UPLOAD(DISABLE_CALL_DEBUG, "callDebugUpload", "call debug reports"),
        CALL_LOG_FILE_UPLOAD(DISABLE_CALL_DEBUG, "callLogFileUpload", "call log file uploads"),
        CALL_LOG_UPLOAD(DISABLE_CALL_DEBUG, "callLogUpload", "call log reports"),
        CALL_RECORDING(DISABLE_CALL_DEBUG, "callRecording", "call recording", true),
        CALL_RECORD_BUTTON(DISABLE_CALL_DEBUG, "callRecordButton", "call record button", true),
        CHAT_DRAFT_PREVIEWS(DISABLE_DRAFT_PREVIEWS, "chatDraftPreviews", "chat drafts"),
        SHARE_DRAFT_PREVIEWS(DISABLE_DRAFT_PREVIEWS, "shareDraftPreviews", "share sheet comments"),
        POLL_LINK_PREVIEWS(DISABLE_DRAFT_PREVIEWS, "pollLinkPreviews", "poll links"),
        STORY_LINK_PREVIEWS(DISABLE_DRAFT_PREVIEWS, "storyLinkPreviews", "story links"),
        BOT_SHARE_PREVIEWS(DISABLE_DRAFT_PREVIEWS, "botSharePreviews", "bot shares"),
        LOCAL_DRAFTS(DISABLE_DRAFT_PREVIEWS, "localDrafts", "draft syncing", true),
        LOCAL_SEARCH(DISABLE_DRAFT_PREVIEWS, "localSearch", "search lookups", true),
        COMMERCE_SETTINGS_ROWS(HIDE_COMMERCE, "commerceSettingsRows", "Settings sales rows"),
        COMMERCE_PROFILE_GIFTS(HIDE_COMMERCE, "commerceProfileGifts", "profile Gifts tabs"),
        COMMERCE_CHANNEL_GIFT(HIDE_COMMERCE, "commerceChannelGift", "channel Gift button"),
        COMMERCE_ATTACH_WALLET(HIDE_COMMERCE, "commerceAttachWallet", "attach menu Wallet button"),
        COMMERCE_MENU_WALLET(HIDE_COMMERCE, "commerceMenuWallet", "chat list menu Wallet item"),
        COMMERCE_PROFILE_SEND_GRAM(HIDE_COMMERCE, "commerceProfileSendGram", "profile menu Send Gram item"),
        COMMERCE_PROFILE_GIFT_MENU(HIDE_COMMERCE, "commerceProfileGiftMenu", "profile menu Send a Gift item"),
        COMMERCE_ADDRESS_SEND_GRAM(HIDE_COMMERCE, "commerceAddressSendGram", "TON link Send Gram item"),
        COMMERCE_TRANSFER_SEND_GRAM(HIDE_COMMERCE, "commerceTransferSendGram", "Gram transfer Send Gram item"),
        COMMERCE_PREMIUM_STICKERS(HIDE_COMMERCE, "commercePremiumStickers", "Premium stickers in the keyboard and packs"),
        COMMERCE_PREMIUM_EFFECTS(HIDE_COMMERCE, "commercePremiumEffects", "Premium sticker effects"),
        COMMERCE_PREMIUM_EMOJI_PACKS(HIDE_COMMERCE, "commercePremiumEmojiPacks", "Premium emoji packs in the emoji keyboard"),
        COMMERCE_EMOJI_STATUS(HIDE_COMMERCE, "commerceEmojiStatus", "emoji statuses next to names", true),
        COMMERCE_PREMIUM_ICONS(HIDE_COMMERCE, "commercePremiumIcons", "Premium icons in the App Icon list", true),
        COMMERCE_LOCAL_EMOJI_STATUS(HIDE_COMMERCE, "commerceLocalEmojiStatus", "your emoji status on this phone", true),
        PROMOTIONAL_SUGGESTIONS(HIDE_PROMOTIONAL_BANNERS, "promotionalSuggestions", "promotional suggestions"),
        BIRTHDAY_GIFT_BANNER(HIDE_PROMOTIONAL_BANNERS, "birthdayGiftBanner", "birthday gift banner"),
        CACHED_PROXY_DIALOG(HIDE_SPONSORED_PROXY, "cachedProxyDialog", "cached proxy channel"),
        CACHED_PROXY_FILTERS(HIDE_SPONSORED_PROXY, "cachedProxyFilters", "cached proxy folder entries"),
        MY_CHATS_SEARCH(HIDE_POPULAR_APPS, "myChatsSearch", "public search lookups", true),
        NAME_FOLD(HIDE_POPULAR_APPS, "nameFold", "styled names in search", true),
        BLOCK_NEW_CHATS(HIDE_POPULAR_APPS, "blockNewChats", "joining new channels and groups", true),
        DISABLE_SECRET_CHATS(HIDE_POPULAR_APPS, "disableSecretChats", "secret chat requests", true),
        COMPOSE_PLAIN_PASTE(NORMAL_PASTE, "composePlainPaste", "compose text paste"),
        CAPTION_PLAIN_PASTE(NORMAL_PASTE, "captionPlainPaste", "caption text paste"),
        MENTION_BY_ID(NORMAL_PASTE, "mentionById", "mentions by ID", true),
        PROFILE_LOCAL_IDS(SHOW_LOCAL_IDS, "profileLocalIds", "profile local IDs"),
        SPECIAL_CONTACTS(SHOW_LOCAL_IDS, "specialContacts", "special contacts", true),
        CHAT_DOUBLE_TAP_REACTION(DISABLE_DOUBLE_TAP_REACTIONS, "chatDoubleTapReaction", "chat double-tap reactions"),
        PREVIEW_DOUBLE_TAP_REACTION(DISABLE_DOUBLE_TAP_REACTIONS, "previewDoubleTapReaction", "preview double-tap reactions"),
        REACTION_ROWS(DISABLE_DOUBLE_TAP_REACTIONS, "reactionRows", "reaction rows under messages", true),
        REACTION_PICKER(DISABLE_DOUBLE_TAP_REACTIONS, "reactionPicker", "the reaction picker in the message menu", true),
        REACTION_SELECTION(DISABLE_DOUBLE_TAP_REACTIONS, "reactionSelection", "the reaction bubble on selected messages", true),
        EMOJI_PACK_NOTE(DISABLE_DOUBLE_TAP_REACTIONS, "emojiPackNote", "the emoji pack line in the message menu", true),
        SELECT_BETWEEN(MESSAGE_MENU_REPEAT, "selectBetween", "selecting everything between two messages", true),
        SELECTION_SCREENSHOT(MESSAGE_MENU_REPEAT, "selectionScreenshot", "screenshots of selected messages", true),
        SELECT_ALL(MESSAGE_MENU_REPEAT, "selectAll", "selecting every loaded message in a chat", true),
        SHARED_MEDIA_SELECT_ALL(MESSAGE_MENU_REPEAT, "sharedMediaSelectAll", "selecting everything in shared media", true),
        COPY_SELECTION(MESSAGE_MENU_REPEAT, "copySelection", "text selection in chats that don't allow saving", true),
        STORY_SAVE(MESSAGE_MENU_REPEAT, "storySave", "Save to Gallery in stories", true),
        SCREENSHOTS(MESSAGE_MENU_REPEAT, "allowScreenshots", "screenshots in chats that don't allow saving", true),
        HIDE_FOR_ME(MESSAGE_MENU_REPEAT, "hideForMe", "hiding messages for you", true),
        EXTERNAL_BROWSER_ROUTING(OPEN_EXTERNAL_LINKS, "externalBrowserRouting", "external browser routing"),
        MINI_APP_LOCATION(OPEN_EXTERNAL_LINKS, "miniAppLocation", "Mini App and web page location", true),
        OPENED_LINK_TRACKING(STRIP_LINK_TRACKING, "openedLinkTracking", "opened link tracking"),
        SHARED_LINK_TRACKING(STRIP_LINK_TRACKING, "sharedLinkTracking", "shared link tracking"),
        SKIP_AUTOLOGIN(STRIP_LINK_TRACKING, "skipAutologin", "website sign-in tokens", true),
        COPIED_LINK_TRACKING(STRIP_LINK_TRACKING, "copiedLinkTracking", "copied links", true),
        PASTED_LINK_TRACKING(STRIP_LINK_TRACKING, "pastedLinkTracking", "pasted links", true),
        SHARE_NUMBER_UNTICKED(HIDE_PHONE_NUMBER, "shareNumberUnticked", "number sharing on new contacts", true),
        OPEN_RESTRICTED_CHATS(BYPASS_CHANNEL_RESTRICTIONS, "openRestrictedChats", "channels restricted for copyright or local law", true),
        BANNED_CHANNEL_WEB(BYPASS_CHANNEL_RESTRICTIONS, "bannedChannelWeb", "banned channels on the web", true),
        COMPACT_TAB_BAR(HIDE_CONTACTS_TAB, "compactTabBar", "bottom bar size", true),
        SIDE_MENU(HIDE_CONTACTS_TAB, "sideMenu", "side menu", true),
        HIDE_NEW_MESSAGE(HIDE_CONTACTS_TAB, "hideNewMessage", "new message button", true),
        LAUNCH_FOLDER(HIDE_FOLDER_COUNTERS, "launchFolder", "which folder the chat list opens on", true),
        HIDE_ALL_CHATS(HIDE_FOLDER_COUNTERS, "hideAllChats", "the All Chats tab", true),
        ALL_CHATS_PLACE(HIDE_FOLDER_COUNTERS, "allChatsPlace", "where All Chats sits", true),
        HIDDEN_CHATS(HIDE_FOLDER_COUNTERS, "hiddenChats", "chats hidden from the chat list", true),
        SORT_BY_DATE(HIDE_FOLDER_COUNTERS, "sortByDate", "chat list ordered by date", true),
        ADMIN_CHATS(HIDE_FOLDER_COUNTERS, "adminChats", "the Administrators filter", true),
        FIT_TABS(HIDE_FOLDER_COUNTERS, "fitTabs", "the fitted folder tabs", true),
        TAB_ICONS(HIDE_FOLDER_COUNTERS, "tabIcons", "the folder tab icons", true),
        HIDDEN_ACCOUNTS(HIDE_FOLDER_COUNTERS, "hiddenAccounts", "the hidden accounts", true),
        HIDDEN_PASSCODE(HIDE_FOLDER_COUNTERS, "hiddenPasscode", "the app passcode for hidden chats", true),
        HIDDEN_UNREAD(HIDE_FOLDER_COUNTERS, "hiddenUnread", "hidden chats in the unread counts", true),
        LOCKED_VOICE(VOICE_ONE_AT_A_TIME, "lockedVoice", "voice playback while locked", true),
        PLAYBACK_POSITION(VOICE_MUSIC_PLAYER, "playbackPosition", "remembering where playback stopped", true),
        VOICE_SKIP(VOICE_MUSIC_PLAYER, "voiceSkip", "skipping between voice messages", true),
        DATA_SAVER_DOWNLOADS(FASTER_DOWNLOADS, "dataSaverDownloads", "automatic downloads on Data Saver", true),
        FASTER_UPLOADS(FASTER_DOWNLOADS, "fasterUploads", "uploads", true),
        DOWNLOAD_MANAGER(FASTER_DOWNLOADS, "downloadManager", "download manager", true),
        BEST_QUALITY_MEDIA(FASTER_DOWNLOADS, "bestQualityMedia", "photos and videos in their best quality", true),
        GALLERY_FOLDER(SAVE_DOWNLOADS, "galleryFolder", "gallery folder for saved photos and videos", true),
        STORAGE_FOLDER(SAVE_DOWNLOADS, "storageFolder", "Telegram's own files in internal storage", true),
        TITLE_EMOJI(HOLIDAY_LOOK, "titleEmoji", "emoji next to the chat list title", true),
        RED_DELETED_LABEL(KEEP_DELETED_MESSAGES, "redDeletedLabel", "red deleted label", true),
        EDIT_HISTORY(KEEP_DELETED_MESSAGES, "keepEditHistory", "earlier text of edited messages", true),
        TIMED_MEDIA(KEEP_DELETED_MESSAGES, "keepTimedMedia", "view-once and timed media", true),
        CHAT_REVEAL_MENU(REVEAL_SPOILERS, "chatRevealMenu", "spoiler and quote items in the chat menu", true),
        SEARCH_HIT_QUOTES(REVEAL_SPOILERS, "searchHitQuotes", "quotes opened on search hits", true),
        VIDEO_EITHER_LANDSCAPE(KEEP_VIDEOS_MUTED, "videoEitherLandscape", "full screen video turning either way", true),
        VIDEO_ONLY_FROM_BUTTON(KEEP_VIDEOS_MUTED, "videoOnlyFromButton", "keeping a video upright until full screen", true),
        VIDEO_STARTS_SILENT(KEEP_VIDEOS_MUTED, "videoStartsSilent", "videos starting without sound", true),
        HIDE_CHANNEL_MUTE(HIDE_CHANNEL_BUTTONS, "hideChannelMute", "Mute button on the channel bar", true),
        HIDE_CHANNEL_SHARE(HIDE_CHANNEL_BUTTONS, "hideChannelShare", "share button beside channel posts", true),
        FIREBASE_CERTIFICATE_HEADER(REPAIR_FIREBASE_PUSH, "firebaseCertificateHeader", "Firebase certificate header"),
        FIREBASE_LOCAL_STATUS(REPAIR_FIREBASE_PUSH, "firebaseLocalStatus", "local notification status"),
        KEEP_ALIVE_RUNNING(REPAIR_FIREBASE_PUSH, "keepAliveRunning", "Keep-Alive Service start", true),
        REACTION_ALERTS(UNIFIED_PUSH, "reactionAlerts", "reaction notifications without push", true),
        REACTION_SOUND(UNIFIED_PUSH, "reactionSound", "sound for reaction notifications", true),
        PROXY_ORDER(FREE_PROXIES, "proxyOrder", "proxy order", true),
        SONG_DATES(LYRICS, "songDates", "dates on your profile songs", true);

        public final PatchFamily family;
        final String statusMethod;
        public final String label;
        /** Its hook backs only its own row, so the family's switch works the same without it. */
        final boolean rowOnly;

        Capability(PatchFamily family, String statusMethod, String label) {
            this(family, statusMethod, label, false);
        }

        Capability(PatchFamily family, String statusMethod, String label, boolean rowOnly) {
            this.family = family;
            this.statusMethod = statusMethod;
            this.label = label;
            this.rowOnly = rowOnly;
        }

        /** A patch-time fact, independent of whether its switch is on or the app is paused. */
        public boolean installed() {
            Set<Capability> forced = capabilitiesForTests;
            if (forced != null) return forced.contains(this);
            Set<PatchFamily> forcedBuild = inBuildForTests;
            // Existing whole-family tests represent complete builds unless they specify targets.
            if (forcedBuild != null) return forcedBuild.contains(family);
            try {
                return Boolean.TRUE.equals(SettingsStatus.class.getMethod(statusMethod).invoke(null));
            } catch (ReflectiveOperationException | RuntimeException failure) {
                Logger.printException(() -> "Could not ask whether " + label + " is covered in this build", failure);
                return false;
            }
        }
    }

    /** All independently tracked targets this family is expected to cover, in declaration order. */
    public Set<Capability> expectedCapabilities() {
        Set<Capability> expected = EnumSet.noneOf(Capability.class);
        for (Capability capability : Capability.values()) {
            if (capability.family == this) expected.add(capability);
        }
        return Collections.unmodifiableSet(expected);
    }

    /** An immutable snapshot of the targets whose hooks were inserted into this build. */
    public Set<Capability> installedCapabilities() {
        Set<Capability> installed = EnumSet.noneOf(Capability.class);
        for (Capability capability : expectedCapabilities()) {
            if (capability.installed()) installed.add(capability);
        }
        return Collections.unmodifiableSet(installed);
    }

    /**
     * Keeps the usual description for complete builds and names precise coverage for partial ones.
     * A missing row-only target leaves the switch's description alone: its row is simply absent.
     */
    String coverageSummary(String completeSummary) {
        Set<Capability> installed = installedCapabilities();
        List<String> covered = new ArrayList<>();
        List<String> missing = new ArrayList<>();
        for (Capability capability : expectedCapabilities()) {
            if (capability.rowOnly) continue;
            (installed.contains(capability) ? covered : missing).add(L10n.t(capability.label));
        }
        if (missing.isEmpty()) return completeSummary;
        if (covered.isEmpty()) return L10n.f("This patched app doesn't change %1$s.", L10n.join(missing));
        return L10n.f("This patched app changes %1$s but not %2$s.", L10n.join(covered), L10n.join(missing));
    }

    private String coverageReportLine() {
        List<String> covered = new ArrayList<>();
        List<String> missing = new ArrayList<>();
        boolean switchWorks = true;
        for (Capability capability : expectedCapabilities()) {
            boolean installed = capability.installed();
            (installed ? covered : missing).add(capability.label);
            if (!installed && !capability.rowOnly) switchWorks = false;
        }
        // Only row-only targets missing: the switch itself still does its job.
        String line = patchName + " coverage: " + (!covered.isEmpty() ? String.join(", ", covered)
                : switchWorks ? "switch only" : "none");
        return missing.isEmpty() ? line : line + "; missing: " + String.join(", ", missing);
    }

    @Nullable
    private String effectiveStaysWhilePaused() {
        Map<PatchFamily, String> forced = staysWhilePausedForTests;
        if (forced != null && forced.containsKey(this)) return forced.get(this);
        return staysWhilePaused;
    }

    PatchFamily(String patchName, String statusMethod, @Nullable String staysWhilePaused,
                BooleanSetting... switches) {
        this.patchName = patchName;
        this.statusMethod = statusMethod;
        this.staysWhilePaused = staysWhilePaused;
        this.switches = Collections.unmodifiableList(Arrays.asList(switches));
    }

    /** Whether this patch was selected for this build. */
    public boolean inBuild() {
        Set<PatchFamily> forced = inBuildForTests;
        if (forced != null) return forced.contains(this);
        try {
            return Boolean.TRUE.equals(SettingsStatus.class.getMethod(statusMethod).invoke(null));
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Logger.printException(() -> "Could not ask whether " + patchName + " is in this build", failure);
            return false;
        }
    }

    /** The families this build carries, in declaration order. */
    public static Set<PatchFamily> inThisBuild() {
        Set<PatchFamily> found = EnumSet.noneOf(PatchFamily.class);
        for (PatchFamily family : values()) {
            if (family.inBuild()) found.add(family);
        }
        return found;
    }

    /**
     * What of these families stays in while HushTelegram is paused, as a sentence in the phone's
     * language, or null when a pause turns every one of them off. The list leads the sentence, so
     * its first letter is raised the way that language does it.
     *
     * <p>Each item is followed by its patch's name in brackets, the name Morphe Manager lists it
     * under, which stays English there, since nothing in the item's own words says which patch in
     * Manager it came from.
     */
    @Nullable
    static String staysWhilePausedSummary(Set<PatchFamily> inBuild) {
        List<String> parts = new ArrayList<>();
        for (PatchFamily family : values()) {
            String stays = family.effectiveStaysWhilePaused();
            if (inBuild.contains(family) && stays != null) {
                parts.add(L10n.t(stays) + " (" + L10n.isolate(family.patchName) + ")");
            }
        }
        if (parts.isEmpty()) return null;
        return L10n.capitalize(L10n.quantity(parts.size(),
                "%1$s. It was set when you patched, so Pause can't turn it off. To get rid of it, patch "
                        + "again without that patch.",
                "%1$s. They were set when you patched, so Pause can't turn them off. To get rid of one, "
                        + "patch again without the patch named in brackets after it.",
                L10n.join(parts)));
    }

    /**
     * One line per family in this build, saying whether a switch runs it, what the switch is set
     * to and what stays in while paused, then the families this build doesn't carry.
     */
    static List<String> reportLines(Set<PatchFamily> inBuild, boolean paused) {
        List<String> lines = new ArrayList<>();
        List<String> absent = new ArrayList<>();
        for (PatchFamily family : values()) {
            if (inBuild.contains(family)) lines.add(family.reportLine(paused));
            else absent.add(family.patchName);
        }
        if (!absent.isEmpty()) lines.add("not in this build: " + String.join(", ", absent));
        for (PatchFamily family : values()) {
            if (inBuild.contains(family) && !family.expectedCapabilities().isEmpty()) {
                lines.add(family.coverageReportLine());
            }
        }
        return lines;
    }


    /**
     * "on", "disabled by its switch" or "disabled while paused", then the saved switches. A
     * family with two switches is on while either is: each hides its own kind of post.
     */
    private String reportLine(boolean paused) {
        StringBuilder line = new StringBuilder(patchName).append(": ");
        if (switches.isEmpty()) {
            return line.append("no switch, stays in while paused: ").append(effectiveStaysWhilePaused()).toString();
        }
        boolean anyOn = false;
        for (BooleanSetting setting : switches) anyOn |= setting.savedValue();
        line.append(paused ? "disabled while paused (saved " : anyOn ? "on (" : "disabled by its switch (");
        for (int i = 0; i < switches.size(); i++) {
            if (i > 0) line.append(", ");
            BooleanSetting setting = switches.get(i);
            line.append(setting.key).append(setting.savedValue() ? "=on" : "=off");
        }
        line.append(')');
        String stays = effectiveStaysWhilePaused();
        if (stays != null) line.append("; stays in while paused: ").append(stays);
        return line.toString();
    }

    /**
     * Registers the [PATCHES] report section, and tells Hook status which families no pause
     * reaches, so a paused export marks only the ones a switch runs. Registering twice keeps one.
     */
    public static void registerDiagnostics() {
        LogBufferManager.registerReportSection(REPORT);
        for (PatchFamily family : values()) {
            if (family.switches.isEmpty()) HookStatus.runsWhilePaused(family.patchName);
        }
    }

    /** The [PATCHES] section of the diagnostic report. */
    static final LogBufferManager.ReportSection REPORT = new LogBufferManager.ReportSection() {
        @Override
        public String title() {
            return "PATCHES";
        }

        @Override
        public List<String> lines() {
            List<String> lines = reportLines(inThisBuild(), HushTelegramPause.isPaused());
            lines.addAll(FirebasePush.localReportLines());
            return lines;
        }
    };
}
