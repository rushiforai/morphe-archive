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

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.IntegerSetting;
import app.hushtelegram.extension.shared.settings.StringSetting;

/**
 * The switches behind the hooks that ask before they act.
 *
 * <p>A switch's default is the second argument of its {@link BooleanSetting}. Picking a patch in
 * Morphe Manager is the choice to use it, and the switch is the way to turn it off again without
 * patching a second time. While HushTelegram is paused, safe mode included
 * ({@link app.hushtelegram.extension.shared.settings.HushTelegramPause}), a switch answers off unless
 * {@link app.hushtelegram.extension.shared.settings.Setting#keepWhenPaused} marks it, and the hook behind
 * it takes Telegram's own path.
 */
@SuppressWarnings("unused")
public class Settings extends BaseSettings {
    /**
     * Telegram never asks for a channel's sponsored messages, search's sponsored accounts or the
     * video player's ads, so none are shown, counted as seen or reported as clicked
     * ({@link app.hushtelegram.extension.telegram.ads.Ads}).
     */
    public static final BooleanSetting HIDE_ADS =
            new BooleanSetting("hushtelegram_hide_ads", TRUE);

    /** Chat-list stories only; explicit profile stories and archives keep Telegram's paths. */
    public static final BooleanSetting HIDE_STORIES =
            new BooleanSetting("hushtelegram_hide_stories", TRUE);

    /** Similar channels/bots and their cached search sections. */
    public static final BooleanSetting HIDE_RECOMMENDATIONS =
            new BooleanSetting("hushtelegram_hide_recommendations", TRUE);

    /** Sales entry points only, with no change to purchases or account entitlements. */
    public static final BooleanSetting HIDE_COMMERCE =
            new BooleanSetting("hushtelegram_hide_commerce", TRUE);

    /** Chat-list promotional presentation only; stored suggestions and account security stay stock. */
    public static final BooleanSetting HIDE_PROMOTIONAL_BANNERS =
            new BooleanSetting("hushtelegram_hide_promotional_banners", TRUE);

    /** Cached proxy-channel presentation only; proxy settings and shared promo updates stay stock. */
    public static final BooleanSetting HIDE_SPONSORED_PROXY =
            new BooleanSetting("hushtelegram_hide_sponsored_proxy", TRUE);

    /** Search's Popular apps section and its request only; apps you've used and other results stay stock. */
    public static final BooleanSetting HIDE_POPULAR_APPS =
            new BooleanSetting("hushtelegram_hide_popular_apps", TRUE);

    /**
     * Search's public parts only: the Channels, Apps, Posts and public posts tabs, public accounts,
     * sponsored accounts and public posts in the Chats tab, and a hashtag's public posts. Your chats,
     * contacts and messages from chats you're in still show
     * ({@link app.hushtelegram.extension.telegram.misc.MyChatsSearch}).
     */
    public static final BooleanSetting SEARCH_ONLY_MY_CHATS =
            new BooleanSetting("hushtelegram_search_only_my_chats", FALSE);

    /**
     * Search on this phone finds names in styled letters from plain ones; the names shown and
     * digits stay as they are ({@link app.hushtelegram.extension.telegram.misc.NameFold}).
     */
    public static final BooleanSetting SEARCH_STYLED_NAMES =
            new BooleanSetting("hushtelegram_search_styled_names", FALSE);

    /**
     * The chat list's Your contacts on Telegram heading, rows and loading rows only; chats, folders,
     * contact sync and search stay stock.
     */
    public static final BooleanSetting HIDE_CONTACTS_BLOCK =
            new BooleanSetting("hushtelegram_hide_contacts_block", FALSE);

    /**
     * The sticker an empty private chat offers to send as a greeting only; the empty chat's text,
     * business introductions, Premium and paid-message notices and the sticker picker stay stock.
     */
    public static final BooleanSetting HIDE_GREETING_STICKERS =
            new BooleanSetting("hushtelegram_hide_greeting_stickers", FALSE);

    /** The chat list's sideways swipe on a chat row only; long-press, drag to reorder and folder swipes stay stock. */
    public static final BooleanSetting DISABLE_CHAT_SWIPE =
            new BooleanSetting("hushtelegram_disable_chat_swipe", FALSE);

    /** Bottom pulls stay in the current channel; explicit chat opening keeps its normal behavior. */
    public static final BooleanSetting DISABLE_CHANNEL_PULL =
            new BooleanSetting("hushtelegram_disable_channel_pull", TRUE);

    /** Bottom pulls stay in the current forum topic; opening topics from the topic list stays stock. */
    public static final BooleanSetting DISABLE_TOPIC_PULL =
            new BooleanSetting("hushtelegram_disable_topic_pull", FALSE);

    public static final BooleanSetting NORMAL_PASTE =
            new BooleanSetting("hushtelegram_normal_paste", FALSE);

    public static final BooleanSetting SHOW_LOCAL_IDS =
            new BooleanSetting("hushtelegram_show_local_ids", FALSE);

    /** The profile menu also shows the data center of the profile photo Telegram already caches. */
    public static final BooleanSetting PROFILE_DATA_CENTER =
            new BooleanSetting("hushtelegram_profile_data_center", FALSE);

    public static final BooleanSetting DISABLE_DOUBLE_TAP_REACTIONS =
            new BooleanSetting("hushtelegram_disable_double_tap_reactions", FALSE);

    /**
     * The Contacts tab's automatic prompt and its "!" badge once a contacts prompt was declined;
     * the first request, the tab's own buttons and contact sync stay stock.
     */
    public static final BooleanSetting QUIET_CONTACTS_NAG =
            new BooleanSetting("hushtelegram_quiet_contacts_nag", TRUE);

    /**
     * Telegram's Santa hat over the chat list logo and New Year snow on any day, over the chat list's
     * top bar and chat backgrounds. Telegram's own holiday dates apply while it's off.
     */
    public static final BooleanSetting HOLIDAY_LOOK =
            new BooleanSetting("hushtelegram_holiday_look", FALSE);

    /**
     * A few characters, usually an emoji, drawn after the chat list's title on this phone only
     * ({@link app.hushtelegram.extension.telegram.misc.TitleEmoji}). Empty shows nothing. The chat
     * list builds its title once, so a change waits for a restart.
     */
    public static final StringSetting TITLE_EMOJI =
            new StringSetting("hushtelegram_title_emoji", "", true);

    /**
     * Medium, italic, extra bold, condensed and monospace text in the phone's own font instead of
     * Telegram's bundled Roboto files. Telegram keeps the faces it loaded, so a change waits for a restart.
     */
    public static final BooleanSetting USE_SYSTEM_FONT =
            new BooleanSetting("hushtelegram_use_system_font", FALSE, true);

    /**
     * Pure black backgrounds for Telegram's built-in Night and Dark themes. Telegram keeps the colors
     * it loaded until it applies a theme again, so a change waits for a restart.
     */
    public static final BooleanSetting AMOLED_BLACK =
            new BooleanSetting("hushtelegram_amoled_black", FALSE, true);

    /** No translate bar at the top of a chat in another language unless the chat is being translated. */
    public static final BooleanSetting HIDE_TRANSLATE_BAR =
            new BooleanSetting("hushtelegram_hide_translate_bar", FALSE);

    /**
     * Member, subscriber, view, reply and reaction counts written in full instead of shortened to
     * 12.3K.
     */
    public static final BooleanSetting EXACT_NUMBERS =
            new BooleanSetting("hushtelegram_exact_numbers", FALSE);

    /**
     * Spoiler text, photos and videos shown without the cover. View-once media, sensitive content and
     * login codes stay covered.
     */
    public static final BooleanSetting REVEAL_SPOILERS =
            new BooleanSetting("hushtelegram_reveal_spoilers", FALSE);

    /**
     * The keyboard closes when a finger starts scrolling through a chat, not only during a search.
     */
    public static final BooleanSetting HIDE_KEYBOARD_ON_SCROLL =
            new BooleanSetting("hushtelegram_hide_keyboard_on_scroll", FALSE);

    /**
     * Volume keys in a chat change the volume instead of playing the video on screen with sound.
     */
    public static final BooleanSetting KEEP_VIDEOS_MUTED =
            new BooleanSetting("hushtelegram_keep_videos_muted", FALSE);

    /**
     * A video put in full screen follows the phone to either landscape side (#27).
     */
    public static final BooleanSetting VIDEO_EITHER_LANDSCAPE =
            new BooleanSetting("hushtelegram_video_either_landscape", FALSE);

    /**
     * The video viewer stays upright when the phone is turned and goes landscape only from its full
     * screen button (#27).
     */
    public static final BooleanSetting VIDEO_ONLY_FROM_BUTTON =
            new BooleanSetting("hushtelegram_video_only_from_button", FALSE);

    /**
     * A swipe to the right on a profile's photos or media tabs goes back instead of to the previous
     * photo or tab.
     */
    public static final BooleanSetting SWIPE_BACK_ON_PROFILES =
            new BooleanSetting("hushtelegram_swipe_back_on_profiles", FALSE);

    /**
     * Your own phone number shows with its digits covered wherever Telegram displays it.
     */
    public static final BooleanSetting HIDE_PHONE_NUMBER =
            new BooleanSetting("hushtelegram_hide_phone_number", FALSE);

    /**
     * Adding a contact from their chat, the box that shares your phone number with them starts clear
     * instead of ticked. Ticking it, and what saving sends, stay Telegram's own.
     */
    public static final BooleanSetting SHARE_NUMBER_UNTICKED =
            new BooleanSetting("hushtelegram_share_number_unticked", FALSE);

    /**
     * The time on each message shows seconds too.
     */
    public static final BooleanSetting MESSAGE_SECONDS =
            new BooleanSetting("hushtelegram_message_seconds", FALSE);

    /**
     * Phones Telegram rates as slow can use its blurred chat header and panels.
     */
    public static final BooleanSetting ALLOW_CHAT_BLUR =
            new BooleanSetting("hushtelegram_allow_chat_blur", FALSE);

    /**
     * A voice or video message stops when it ends instead of playing the next one.
     */
    public static final BooleanSetting VOICE_ONE_AT_A_TIME =
            new BooleanSetting("hushtelegram_voice_one_at_a_time", FALSE);

    /**
     * While the lock screen shows, no voice or round video message starts, resumes or skips to
     * another, whether from a headset, a car, the notification or the lock screen. One already
     * playing keeps going to its end. Music and ordinary videos play as Telegram plays them.
     */
    public static final BooleanSetting LOCKED_VOICE_GUARD =
            new BooleanSetting("hushtelegram_locked_voice_guard", FALSE);

    /**
     * Telegram stops vibrating for taps, long presses, swipes and wrong entries.
     */
    public static final BooleanSetting NO_HAPTICS =
            new BooleanSetting("hushtelegram_no_haptics", FALSE);

    /**
     * Reactions land on the message without the fly-in and burst effect.
     */
    public static final BooleanSetting REACTION_EFFECTS_OFF =
            new BooleanSetting("hushtelegram_reaction_effects_off", FALSE);

    /**
     * Folder tabs above the chat list show no unread counts.
     */
    public static final BooleanSetting HIDE_FOLDER_COUNTERS =
            new BooleanSetting("hushtelegram_hide_folder_counters", FALSE);

    /**
     * The chat list opens on the folder picked for each account instead of All chats
     * ({@link app.hushtelegram.extension.telegram.misc.LaunchFolder}). The picks themselves stay on
     * this phone, outside the settings.
     */
    public static final BooleanSetting LAUNCH_FOLDER =
            new BooleanSetting("hushtelegram_launch_folder", FALSE);

    /**
     * The folder tabs leave out All Chats while the account has another folder to open, and the side
     * menu gets an Archived Chats row ({@link app.hushtelegram.extension.telegram.misc.LaunchFolder}).
     * Each chat list reads it once as its tabs are first built, so a restart shows the change.
     */
    public static final BooleanSetting HIDE_ALL_CHATS =
            new BooleanSetting("hushtelegram_hide_all_chats", FALSE, true);

    /**
     * The chats picked for each account leave the chat list, its folders and the archive
     * ({@link app.hushtelegram.extension.telegram.misc.HiddenChats}). The picks themselves stay on
     * this phone, outside the settings.
     */
    public static final BooleanSetting HIDDEN_CHATS =
            new BooleanSetting("hushtelegram_hidden_chats", FALSE);

    /**
     * Forwards start with Telegram's Hide sender's name option turned on.
     */
    public static final BooleanSetting FORWARD_HIDE_SENDER =
            new BooleanSetting("hushtelegram_forward_hide_sender", FALSE);

    /**
     * Tapping the bar above a chat while a voice message plays opens the full music player.
     */
    public static final BooleanSetting VOICE_MUSIC_PLAYER =
            new BooleanSetting("hushtelegram_voice_music_player", FALSE);

    /**
     * A private message from someone outside your contacts notifies without sound or vibration.
     */
    public static final BooleanSetting SILENCE_NON_CONTACTS =
            new BooleanSetting("hushtelegram_silence_non_contacts", FALSE);

    /**
     * A hidden archive stays out of the chat list, so pulling down doesn't bring it up. The chat
     * list's menu opens it instead.
     */
    public static final BooleanSetting DISABLE_ARCHIVE_PULL =
            new BooleanSetting("hushtelegram_disable_archive_pull", FALSE, true);

    /**
     * The attachment menu's camera starts on the rear lens each time, instead of the lens used last.
     */
    public static final BooleanSetting REAR_CAMERA_FIRST =
            new BooleanSetting("hushtelegram_rear_camera_first", FALSE);

    /**
     * The attachment menu's photo grid starts with your photos, without the live camera tile.
     */
    public static final BooleanSetting HIDE_GALLERY_CAMERA_TILE =
            new BooleanSetting("hushtelegram_hide_gallery_camera_tile", FALSE);

    /**
     * Stickers and big animated emoji show no time or read checks.
     */
    public static final BooleanSetting HIDE_STICKER_TIME =
            new BooleanSetting("hushtelegram_hide_sticker_time", FALSE);

    /**
     * Stickers in chats show at {@link #STICKER_SIZE} percent of Telegram's size
     * ({@link app.hushtelegram.extension.telegram.misc.StickerSize}).
     */
    public static final BooleanSetting CHANGE_STICKER_SIZE =
            new BooleanSetting("hushtelegram_change_sticker_size", FALSE);

    /** The picked sticker size, a percent of Telegram's: one of StickerSize.CHOICES. */
    public static final IntegerSetting STICKER_SIZE =
            new IntegerSetting("hushtelegram_sticker_size", 75).withRange(50, 150);

    /**
     * A mention or a reply to you in a muted group or channel stays as quiet as the rest of the chat.
     */
    public static final BooleanSetting IGNORE_MUTED_MENTIONS =
            new BooleanSetting("hushtelegram_ignore_muted_mentions", FALSE);

    /**
     * Messages from people you've blocked are left out of the groups and supergroups you open.
     */
    public static final BooleanSetting HIDE_BLOCKED_IN_GROUPS =
            new BooleanSetting("hushtelegram_hide_blocked_in_groups", FALSE);

    /**
     * Messages that match one of your filters are left out of the groups and channels you open
     * ({@link app.hushtelegram.extension.telegram.misc.MessageFilters}).
     */
    public static final BooleanSetting HIDE_BY_KEYWORD =
            new BooleanSetting("hushtelegram_hide_by_keyword", FALSE);

    /** The filters for groups and supergroups, one a line. */
    public static final StringSetting MESSAGE_FILTERS_GROUPS =
            new StringSetting("hushtelegram_message_filters_groups", "");

    /** The filters for channels' posts, one a line. */
    public static final StringSetting MESSAGE_FILTERS_CHANNELS =
            new StringSetting("hushtelegram_message_filters_channels", "");

    /**
     * Settings drops its Telegram Features row and Contacts drops its Invite Friends rows.
     */
    public static final BooleanSetting HIDE_FEATURES_AND_INVITE =
            new BooleanSetting("hushtelegram_hide_features_and_invite", FALSE);

    /**
     * A message's long-press menu gets Repeat, which sends the message again to the same chat.
     */
    public static final BooleanSetting MESSAGE_MENU_REPEAT =
            new BooleanSetting("hushtelegram_message_menu_repeat", FALSE);

    /**
     * A message someone else deletes stays on this phone, marked deleted next to its time.
     */
    public static final BooleanSetting KEEP_DELETED_MESSAGES =
            new BooleanSetting("hushtelegram_keep_deleted_messages", FALSE);

    /**
     * The deleted label next to a kept message's time shows in red (#25).
     */
    public static final BooleanSetting RED_DELETED_LABEL =
            new BooleanSetting("hushtelegram_red_deleted_label", FALSE);

    /**
     * When someone else edits a message, this phone keeps the text it had before, shown in Message details.
     */
    public static final BooleanSetting KEEP_EDIT_HISTORY =
            new BooleanSetting("hushtelegram_keep_edit_history", FALSE);

    /**
     * A sticker you tap asks Send or Cancel before it goes into the chat.
     */
    public static final BooleanSetting ASK_BEFORE_STICKER =
            new BooleanSetting("hushtelegram_ask_before_sticker", FALSE);

    /**
     * Translate a message or a whole chat with Google's web translate, beside Telegram's own Premium
     * translation. Off by default, and nothing leaves the phone until a chat or message is turned on.
     */
    public static final BooleanSetting OUTSIDE_TRANSLATE =
            new BooleanSetting("hushtelegram_external_translate", FALSE);

    /**
     * The language the outside translate writes in, one of
     * {@link app.hushtelegram.extension.telegram.misc.TranslateTarget#LANGUAGES}. Empty keeps
     * Telegram's language (#35).
     */
    public static final StringSetting TRANSLATE_TARGET =
            new StringSetting("hushtelegram_translate_target", "");

    /** Search, Direct messages and Info leave the bar at the bottom of a channel. Mute and Join stay. */
    public static final BooleanSetting HIDE_CHANNEL_BUTTONS =
            new BooleanSetting("hushtelegram_hide_channel_buttons", FALSE);

    /** The bar at the bottom of a joined channel is left off the screen while it would show Mute or Unmute (#26). */
    public static final BooleanSetting HIDE_CHANNEL_MUTE =
            new BooleanSetting("hushtelegram_hide_channel_mute", FALSE);

    /** The Send as picture next to the message box is left out while you'd post as yourself. */
    public static final BooleanSetting HIDE_SEND_AS =
            new BooleanSetting("hushtelegram_hide_send_as", FALSE);

    /**
     * The Contacts tab leaves the bar at the bottom of the main screen, and a swipe doesn't land on
     * its page. The bar is set up when the main screen is built, so a restart shows the change.
     */
    public static final BooleanSetting HIDE_CONTACTS_TAB =
            new BooleanSetting("hushtelegram_hide_contacts_tab", FALSE, true);

    /**
     * The bar at the bottom of the main screen is shorter and only as wide as its tabs need. Each tab
     * keeps Telegram's 48 dp height. The bar is sized when the main screen is built, so a restart
     * shows the change.
     */
    public static final BooleanSetting COMPACT_TAB_BAR =
            new BooleanSetting("hushtelegram_compact_tab_bar", FALSE, true);

    /**
     * A swipe right on the chat list's first folder slides in a menu like the one Telegram 13 took
     * away. Each swipe reads the switch, so it works the moment it's flipped. The key says drawer
     * because the diagnostic report hides the value of any name holding "sid".
     */
    public static final BooleanSetting SIDE_MENU =
            new BooleanSetting("hushtelegram_drawer_menu", FALSE);

    /**
     * The chat list's round pencil button is hidden. Telegram sets it up when it builds the chat list,
     * so a restart shows the change.
     */
    public static final BooleanSetting HIDE_NEW_MESSAGE =
            new BooleanSetting("hushtelegram_hide_new_message", FALSE, true);

    /** Downloads take 512 KB pieces, 8 at a time, unless Telegram drops back to small ones itself. */
    public static final BooleanSetting FASTER_DOWNLOADS =
            new BooleanSetting("hushtelegram_faster_downloads", FALSE);

    /** Automatic media downloads wait while Android's Data Saver restricts Telegram on a metered network. */
    public static final BooleanSetting DATA_SAVER_DOWNLOADS =
            new BooleanSetting("hushtelegram_data_saver_downloads", FALSE);

    /** A file or song that finishes downloading gets a copy in Download/Telegram, unless saving it isn't allowed. */
    public static final BooleanSetting SAVE_DOWNLOADS =
            new BooleanSetting("hushtelegram_save_downloads", FALSE);

    /**
     * With {@link #SAVE_DOWNLOADS} on, a file from a chat or message whose owner turned off saving
     * gets its copy too. Secret chats and self-destructing media still stay in Telegram. Starts off,
     * since it goes past the owner's setting (#29).
     */
    public static final BooleanSetting SAVE_RESTRICTED_DOWNLOADS =
            new BooleanSetting("hushtelegram_save_restricted_downloads", FALSE);

    /**
     * On Android 11 and up with All files access, Telegram's own Telegram Images, Video, Documents
     * and the rest live in Internal storage/Telegram instead of Android/data (#7). Read once when
     * Telegram sets up its folders, so it needs a restart.
     */
    public static final BooleanSetting STORAGE_FOLDER =
            new BooleanSetting("hushtelegram_storage_folder", FALSE, true);

    /**
     * Which folders Telegram's Save to gallery puts photos and videos in, one of
     * {@link app.hushtelegram.extension.telegram.misc.GalleryFolder#CHOICES}. Empty keeps Telegram's
     * Pictures/Telegram and Movies/Telegram (#30).
     */
    public static final StringSetting GALLERY_FOLDER =
            new StringSetting("hushtelegram_gallery_folder", "");

    /** Turned on, makes Private, Groups, Channels and Bots folders; turned off, removes the untouched ones it made. */
    public static final BooleanSetting CHAT_TYPE_FOLDERS =
            new BooleanSetting("hushtelegram_chat_type_folders", FALSE);

    /** A GIF you tap asks Send or Cancel before it goes into the chat. */
    public static final BooleanSetting ASK_BEFORE_GIF =
            new BooleanSetting("hushtelegram_ask_before_gif", FALSE);

    /** A voice or video message you recorded asks Send or Cancel before it goes into the chat. */
    public static final BooleanSetting ASK_BEFORE_VOICE_VIDEO =
            new BooleanSetting("hushtelegram_ask_before_voice_video", FALSE);

    /** The call button in a chat's header or on a profile asks Call or Cancel before it starts a call. */
    public static final BooleanSetting ASK_BEFORE_CALL =
            new BooleanSetting("hushtelegram_ask_before_call", FALSE);

    /** A photo's long-press menu gets Copy photo, which puts the downloaded picture on the clipboard. */
    public static final BooleanSetting MESSAGE_MENU_COPY_PHOTO =
            new BooleanSetting("hushtelegram_message_menu_copy_photo", FALSE);

    /** A message's long-press menu gets Message details, a dialog of its IDs, times and file facts. */
    public static final BooleanSetting MESSAGE_MENU_DETAILS =
            new BooleanSetting("hushtelegram_message_menu_details", FALSE);

    /** A message's long-press menu gets Quick forward, which forwards it to Saved Messages or a recent chat in one tap. */
    public static final BooleanSetting MESSAGE_MENU_QUICK_FORWARD =
            new BooleanSetting("hushtelegram_message_menu_quick_forward", FALSE);

    /**
     * A channel's read metrics (how long each post stayed on screen), Premium screen interaction
     * reports and the camera's dual-camera report are never sent ({@link app.hushtelegram.extension.telegram.misc.Analytics}).
     */
    public static final BooleanSetting DISABLE_ANALYTICS =
            new BooleanSetting("hushtelegram_disable_analytics", TRUE);

    /** Automatic call diagnostics only; the call itself and its cleanup stay stock. */
    public static final BooleanSetting DISABLE_CALL_DEBUG =
            new BooleanSetting("hushtelegram_disable_call_debug", TRUE);

    /** Link previews for unsent messages only; sent messages and received previews stay stock. */
    public static final BooleanSetting DISABLE_DRAFT_PREVIEWS =
            new BooleanSetting("hushtelegram_disable_draft_previews", FALSE);

    /**
     * The server copy of an unsent draft only, which goes emptied; the draft on this phone, an empty
     * clear and drafts the server sends stay stock ({@link app.hushtelegram.extension.telegram.misc.LocalDrafts}).
     */
    public static final BooleanSetting LOCAL_DRAFTS =
            new BooleanSetting("hushtelegram_local_drafts", FALSE);

    /**
     * Search's Chats tab only: what you type there isn't sent for usernames, messages, sponsored
     * accounts or public posts; the chats, contacts and recent searches on this phone still show
     * ({@link app.hushtelegram.extension.telegram.misc.LocalSearch}).
     */
    public static final BooleanSetting LOCAL_SEARCH =
            new BooleanSetting("hushtelegram_local_search", FALSE);

    /** The attachment gallery's camera tile only; the camera wakes on a tap and every other camera stays stock. */
    public static final BooleanSetting GALLERY_CAMERA_ON_TAP =
            new BooleanSetting("hushtelegram_gallery_camera_on_tap", FALSE);

    /** Ordinary HTTP(S) browser dispatch only; native and protected Telegram routes stay stock. */
    public static final BooleanSetting OPEN_EXTERNAL_LINKS =
            new BooleanSetting("hushtelegram_open_external_links", TRUE);

    /**
     * Mini Apps hear that location isn't available and web pages inside Telegram are refused it.
     * Location sharing in chats, maps and live locations stay stock.
     */
    public static final BooleanSetting MINI_APP_LOCATION_OFF =
            new BooleanSetting("hushtelegram_mini_app_location_off", FALSE);

    /** Optional local URL cleaning at verified open/share sinks; unknown query keys preserve the URL. */
    public static final BooleanSetting STRIP_LINK_TRACKING =
            new BooleanSetting("hushtelegram_strip_link_tracking", FALSE);

    /**
     * The account's sign-in token Telegram adds to links for the sites its server lists for automatic
     * sign-in; with this on those links open as they are. Routing and every other link stay stock.
     */
    public static final BooleanSetting SKIP_AUTOLOGIN =
            new BooleanSetting("hushtelegram_skip_autologin", FALSE);

    /**
     * telegram.org's build stops checking for its own updates, which can't install over a re-signed
     * build anyway ({@link app.hushtelegram.extension.telegram.misc.UpdateChecks}).
     */
    public static final BooleanSetting DISABLE_UPDATE_CHECKS =
            new BooleanSetting("hushtelegram_disable_update_checks", TRUE);

    /**
     * The official web certificate for the scoped Firebase Installations header only. Firebase signs
     * up once per process, so a change shows the restart row.
     */
    public static final BooleanSetting REPAIR_FIREBASE_PUSH =
            new BooleanSetting("hushtelegram_repair_firebase_push", TRUE, true);

    /** Telegram signs up a UnifiedPush app's address for its wake-ups instead of Firebase's token. */
    public static final BooleanSetting UNIFIED_PUSH =
            new BooleanSetting("hushtelegram_unified_push", FALSE);

    /**
     * Once a day, when Telegram starts, ask api.github.com whether a newer HushTelegram release is
     * out, and say so on the settings screen ({@link ReleaseCheck}). It's the settings entry's own
     * switch rather than a patch's, so every build has it ({@link PatchFamily#ENTRY_SWITCHES}). Off
     * by default, and a settings file never carries it: a file shouldn't be able to put a phone
     * online.
     */
    public static final BooleanSetting CHECK_FOR_RELEASES =
            new BooleanSetting("hushtelegram_check_releases", FALSE);
}
