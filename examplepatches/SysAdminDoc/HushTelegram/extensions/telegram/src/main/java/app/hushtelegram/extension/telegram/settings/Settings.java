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

import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.IntegerSetting;
import app.hushtelegram.extension.shared.settings.Setting;
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

    /**
     * Chat-list stories only; explicit profile stories and archives keep Telegram's paths. The chat
     * list sets up its Post Story button and loads the story list when it's built, so a change shows
     * after a restart.
     */
    public static final BooleanSetting HIDE_STORIES =
            new BooleanSetting("hushtelegram_hide_stories", TRUE, true);

    /** Similar channels/bots and their cached search sections. */
    public static final BooleanSetting HIDE_RECOMMENDATIONS =
            new BooleanSetting("hushtelegram_hide_recommendations", TRUE);

    /** The sticker and emoji keyboards copy an empty featured list; search and the packs screen keep Telegram's. */
    public static final BooleanSetting HIDE_KEYBOARD_FEATURED =
            new BooleanSetting("hushtelegram_hide_keyboard_featured", FALSE);

    /** Sales entry points only, with no change to purchases or account entitlements. */
    public static final BooleanSetting HIDE_COMMERCE =
            new BooleanSetting("hushtelegram_hide_commerce", TRUE);

    /** Names read as having no emoji status; the channel editor and admin log still see the real one. */
    public static final BooleanSetting HIDE_EMOJI_STATUS =
            new BooleanSetting("hushtelegram_hide_emoji_status", FALSE);

    /** Premium, Turbo and Nox in the App Icon list switch like any other icon; the Premium page's preview stays stock. */
    public static final BooleanSetting UNLOCK_PREMIUM_ICONS =
            new BooleanSetting("hushtelegram_unlock_premium_icons", FALSE);

    /** The chat list title's status picker works without Premium and keeps its pick on this phone; nothing is sent. */
    public static final BooleanSetting LOCAL_EMOJI_STATUS =
            new BooleanSetting("hushtelegram_local_emoji_status", FALSE);

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
     * A parental control: joining a channel or group, by its page or an invite link or a shared
     * folder, and opening one you aren't in, are both refused. Chats you're already in stay as they
     * are ({@link app.hushtelegram.extension.telegram.misc.NewChatsBlock}).
     */
    public static final BooleanSetting BLOCK_NEW_CHATS =
            new BooleanSetting("hushtelegram_block_new_chats", FALSE);
/** An incoming secret chat request is ignored on this phone: not saved, not shown, not answered. */    public static final BooleanSetting DISABLE_SECRET_CHATS =            new BooleanSetting("hushtelegram_disable_encrypted_chats", FALSE);

    /**
     * The chat list's Your contacts on Telegram heading, rows and loading rows only; chats, folders,
     * contact sync and search stay stock.
     */
    public static final BooleanSetting HIDE_CONTACTS_BLOCK =
            new BooleanSetting("hushtelegram_hide_contacts_block", FALSE);

    /**
     * The sticker an empty private chat offers to send as a greeting only, a business
     * introduction's included; the empty chat's text, the introduction editor's preview, Premium
     * and paid-message notices and the sticker picker stay stock.
     */
    public static final BooleanSetting HIDE_GREETING_STICKERS =
            new BooleanSetting("hushtelegram_hide_greeting_stickers", FALSE);

    /** The chat list's sideways swipe on a chat row only; long-press, drag to reorder and folder swipes stay stock. */
    public static final BooleanSetting DISABLE_CHAT_SWIPE =
            new BooleanSetting("hushtelegram_disable_chat_swipe", FALSE);

    /**
     * The menu under a chat's preview, after pressing and holding the chat, ends with Open chat and
     * Close preview (#71). Telegram's own items stay. Off by default.
     */
    public static final BooleanSetting CHAT_PREVIEW_BUTTONS =
            new BooleanSetting("hushtelegram_chat_preview_buttons", FALSE);

    /** Bottom pulls stay in the current channel; explicit chat opening keeps its normal behavior. */
    public static final BooleanSetting DISABLE_CHANNEL_PULL =
            new BooleanSetting("hushtelegram_disable_channel_pull", TRUE);

    /** Bottom pulls stay in the current forum topic; opening topics from the topic list stays stock. */
    public static final BooleanSetting DISABLE_TOPIC_PULL =
            new BooleanSetting("hushtelegram_disable_topic_pull", FALSE);

    public static final BooleanSetting NORMAL_PASTE =
            new BooleanSetting("hushtelegram_normal_paste", FALSE);

    /**
     * Typing {@code @123456789} or {@code tg://user?id=123456789} in the message box sends a real
     * mention of that person, when the app has seen them (#53). Off by default.
     */
    public static final BooleanSetting MENTION_BY_ID =
            new BooleanSetting("hushtelegram_mention_by_id", FALSE);

    public static final BooleanSetting SHOW_LOCAL_IDS =
            new BooleanSetting("hushtelegram_show_local_ids", FALSE);

    /** The profile menu also shows the data center of the profile photo Telegram already caches. */
    public static final BooleanSetting PROFILE_DATA_CENTER =
            new BooleanSetting("hushtelegram_profile_data_center", FALSE);

    /** A person's profile menu also shows about when their account was made, estimated from the user ID (#79). */
    public static final BooleanSetting REGISTRATION_DATE =
            new BooleanSetting("hushtelegram_registration_date", FALSE);

    /** A group's member lists also show when each person joined, from the date Telegram sends with each member (#79). */
    public static final BooleanSetting MEMBER_JOIN_DATES =
            new BooleanSetting("hushtelegram_member_join_dates", FALSE);

    /** A forwarded message's header also shows when it was first sent, from the date Telegram keeps with the forward (#79). */
    public static final BooleanSetting FORWARD_DATES =
            new BooleanSetting("hushtelegram_forward_dates", FALSE);

    /** A profile menu offers Track this user, and the people tracked get a history of what Telegram shows of them. */
    public static final BooleanSetting SPECIAL_CONTACTS =
            new BooleanSetting("hushtelegram_special_contacts", FALSE);

    public static final BooleanSetting DISABLE_DOUBLE_TAP_REACTIONS =
            new BooleanSetting("hushtelegram_disable_double_tap_reactions", FALSE);

    /** The row of reactions under a message is not drawn; the stored reactions are untouched. */
    public static final BooleanSetting HIDE_REACTION_ROWS =
            new BooleanSetting("hushtelegram_hide_reaction_rows", FALSE);

    /** The reaction strip at the top of the long-press menu, and the panel it expands into, never open. */
    public static final BooleanSetting HIDE_REACTION_PICKER =
            new BooleanSetting("hushtelegram_hide_reaction_picker", FALSE);
    public static final BooleanSetting HIDE_EMOJI_PACK_NOTE =
            new BooleanSetting("hushtelegram_hide_emoji_pack_note", FALSE);

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
     * The person's own text in place of Telegram's name at the top of the chat list, on this phone
     * only ({@link app.hushtelegram.extension.telegram.misc.TitleEmoji}). The chat list builds its
     * title once, so a change waits for a restart.
     */
    public static final BooleanSetting CHAT_LIST_TITLE =
            new BooleanSetting("hushtelegram_chat_list_title", FALSE, true);

    /** The text {@link #CHAT_LIST_TITLE} shows. Empty keeps Telegram's own title. */
    public static final StringSetting CHAT_LIST_TITLE_TEXT =
            new StringSetting("hushtelegram_chat_list_title_text", "", true);

    /**
     * What the chat list's top bar shows behind its title and buttons on this phone
     * ({@link app.hushtelegram.extension.telegram.misc.ChatListBanner}): empty for Telegram's own
     * bar, one of the gradients by name, or {@code picture} for the one picked from the gallery.
     */
    public static final StringSetting CHAT_LIST_BANNER =
            new StringSetting("hushtelegram_chat_list_banner", "", false);

    /**
     * Medium, italic, extra bold, condensed and monospace text in the phone's own font instead of
     * Telegram's bundled Roboto files. Telegram keeps the faces it loaded, so a change waits for a restart.
     */
    public static final BooleanSetting USE_SYSTEM_FONT =
            new BooleanSetting("hushtelegram_use_system_font", FALSE, true);

    /**
     * The name of the font file picked for all of Telegram's text (#79), or empty for none. The
     * file itself is kept by {@link app.hushtelegram.extension.telegram.misc.CustomFont} and used
     * only while {@link #USE_SYSTEM_FONT} is on. Telegram keeps the faces it was handed, so a change
     * waits for a restart.
     */
    public static final StringSetting CUSTOM_FONT =
            new StringSetting("hushtelegram_custom_font", "", true);

    /**
     * Pure black backgrounds for Telegram's built-in Night and Dark themes. Telegram keeps the colors
     * it loaded until it applies a theme again, so a change waits for a restart.
     */
    public static final BooleanSetting AMOLED_BLACK =
            new BooleanSetting("hushtelegram_amoled_black", FALSE, true);

    /**
     * A picture from the gallery behind Telegram's list pages, with their fills see-through over it
     * ({@link app.hushtelegram.extension.telegram.misc.ListBackground}). The picture is kept in
     * Telegram's own files on this phone.
     */
    public static final BooleanSetting LIST_BACKGROUND =
            new BooleanSetting("hushtelegram_list_background", FALSE);

    /** How much of the theme's page color lies over {@link #LIST_BACKGROUND}'s picture, in percent. */
    public static final IntegerSetting LIST_BACKGROUND_DIM =
            new IntegerSetting("hushtelegram_list_background_dim", 40).withRange(0, 90);

    /** No translate bar at the top of a chat in another language unless the chat is being translated. */
    public static final BooleanSetting HIDE_TRANSLATE_BAR =
            new BooleanSetting("hushtelegram_hide_translate_bar", FALSE);

    /**
     * No pinned message bar under a chat's top bar, its counter and list button included. The pinned
     * messages stay pinned and nothing is marked as read; the chat screen takes the bar's place.
     */
    public static final BooleanSetting HIDE_PINNED_BAR =
            new BooleanSetting("hushtelegram_hide_pinned_bar", FALSE);

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
     * Show all spoilers and Expand all quotes in a chat's menu at the top, for the messages it has loaded.
     */
    public static final BooleanSetting REVEAL_MENU =
            new BooleanSetting("hushtelegram_reveal_menu", FALSE);

    /**
     * A chat search that lands inside a collapsed quote opens it, so the highlighted match shows.
     */
    public static final BooleanSetting SEARCH_OPENS_QUOTES =
            new BooleanSetting("hushtelegram_search_opens_quotes", FALSE);

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
     * Videos open in the viewer without sound until a volume key gives that video its sound (#61).
     */
    public static final BooleanSetting VIDEO_STARTS_SILENT =
            new BooleanSetting("hushtelegram_video_starts_silent", FALSE);

    /**
     * A video's settings menu offers Audio track and Subtitles when it has more than one audio
     * track or has subtitles, and the subtitles picked show over the video (#79).
     */
    public static final BooleanSetting VIDEO_TRACKS =
            new BooleanSetting("hushtelegram_video_tracks", FALSE);

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
     * The voice changer (#79): empty records voice messages as they are, otherwise one of
     * {@link app.hushtelegram.extension.telegram.misc.VoiceChanger#PRESETS}. Each recording keeps
     * the voice it started with.
     */
    public static final StringSetting VOICE_CHANGER =
            new StringSetting("hushtelegram_voice_changer", "");

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
    public static final BooleanSetting MOVE_ALL_CHATS =
            new BooleanSetting("hushtelegram_move_all_chats", FALSE, true);

    /**
     * The chats picked for each account leave the chat list, its folders and the archive
     * ({@link app.hushtelegram.extension.telegram.misc.HiddenChats}). The picks themselves stay on
     * this phone, outside the settings.
     */
    public static final BooleanSetting HIDDEN_CHATS =
            new BooleanSetting("hushtelegram_hidden_chats", FALSE);

    /**
     * The chat list orders its unpinned chats by the date of their last message
     * ({@link app.hushtelegram.extension.telegram.misc.ChatSort}). Pinned chats stay where they are.
     */
    public static final BooleanSetting SORT_BY_DATE =
            new BooleanSetting("hushtelegram_sort_by_date", FALSE);

    /**
     * The list of hidden chats and the switch that hides them ask for Telegram's app passcode first
     * ({@link app.hushtelegram.extension.telegram.misc.AppPasscode}).
     */
    public static final BooleanSetting HIDDEN_CHATS_PASSCODE =
            new BooleanSetting("hushtelegram_hidden_chats_lock", FALSE);

    /** The side menu gets an Administrators row that limits the chat list to the chats you manage. */
    public static final BooleanSetting ADMIN_CHATS =
            new BooleanSetting("hushtelegram_admin_chats", FALSE);

    /**
     * Accounts picked in the settings stay out of Telegram's account lists
     * ({@link app.hushtelegram.extension.telegram.misc.HiddenAccounts}). They stay signed in and keep
     * their notifications. The picks themselves stay on this phone, outside the settings.
     */
    public static final BooleanSetting HIDE_ACCOUNTS =
            new BooleanSetting("hushtelegram_hide_accounts", FALSE);

    /**
     * The folder tabs above the chat list shrink to fit the screen, so none of them scrolls out of
     * sight ({@link app.hushtelegram.extension.telegram.misc.TabFit}).
     */
    public static final BooleanSetting FIT_ALL_TABS =
            new BooleanSetting("hushtelegram_fit_all_tabs", FALSE);

    /**
     * Each folder tab above the chat list shows an icon for its kind of folder in front of its name
     * ({@link app.hushtelegram.extension.telegram.misc.TabIcons}). The tabs take it when they're
     * built, so a change waits for a restart.
     */
    public static final BooleanSetting FOLDER_TAB_ICONS =
            new BooleanSetting("hushtelegram_folder_tab_icons", FALSE, true);

    /** The list of hidden accounts and the switch that hides them ask for Telegram's app passcode first. */
    public static final BooleanSetting HIDDEN_ACCOUNTS_LOCK =
            new BooleanSetting("hushtelegram_hidden_accounts_lock", FALSE);

    /** With the date order on, the chat with the oldest last message comes first instead of the newest. */
    public static final BooleanSetting SORT_OLDEST_FIRST =
            new BooleanSetting("hushtelegram_sort_oldest_first", FALSE);

    /**
     * The chat list's long press menu offers Pin on this phone, and the chats picked with it sit
     * right under the pinned chats in All Chats ({@link app.hushtelegram.extension.telegram.misc.LocalPins}).
     * Nothing goes to Telegram.
     */
    public static final BooleanSetting LOCAL_PINS =
            new BooleanSetting("hushtelegram_local_pins", FALSE);

    /** The chats Pin on this phone picked, as comma-separated dialog ids, the same on every account. */
    public static final StringSetting LOCAL_PINNED_CHATS =
            new StringSetting("hushtelegram_local_pinned_chats", "");

    /**
     * Chat list avatars show at {@link #CHAT_LIST_AVATAR_SIZE} percent of Telegram's size
     * ({@link app.hushtelegram.extension.telegram.misc.ChatListAvatar}).
     */
    public static final BooleanSetting CHAT_LIST_AVATAR =
            new BooleanSetting("hushtelegram_chat_list_avatar", FALSE);

    /** The picked chat list avatar size, a percent of Telegram's: one of ChatListAvatar.CHOICES. */
    public static final IntegerSetting CHAT_LIST_AVATAR_SIZE =
            new IntegerSetting("hushtelegram_chat_list_avatar_size", 80).withRange(70, 120);

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
     * A button in a chat's selection bar that selects every message between the first and last
     * one selected, and a range that grows when a message past it is picked (#53).
     */
    public static final BooleanSetting SELECT_BETWEEN =
            new BooleanSetting("hushtelegram_select_between", FALSE);

    /** A Screenshot button in the same bar that saves a picture of the selected messages as the chat shows them (#71). */
    public static final BooleanSetting SELECTION_SCREENSHOT =
            new BooleanSetting("hushtelegram_selection_screenshot", FALSE);

    /** A Select all button in the same bar, in chats and in a chat's shared media, that selects everything loaded (#73). */
    public static final BooleanSetting SELECT_ALL =
            new BooleanSetting("hushtelegram_select_all", FALSE);

    /**
     * Videos, voice messages and music remember where they stopped, however short they are, and
     * pick up from there the next time they play (#53).
     */
    public static final BooleanSetting PLAYBACK_POSITION =
            new BooleanSetting("hushtelegram_playback_position", FALSE);

    /**
     * Next and previous in the notification, on the lock screen, on headphones and in the full
     * player move between the voice messages of a chat, as they do between songs (#77).
     */
    public static final BooleanSetting VOICE_SKIP =
            new BooleanSetting("hushtelegram_voice_skip", FALSE);

    /**
     * The music player's menu has Lyrics, which finds the song's words on lrclib.net and shows them
     * over the player, following along when they're timed (#71). Off by default.
     */
    public static final BooleanSetting LYRICS =
            new BooleanSetting("hushtelegram_lyrics", FALSE);

    /**
     * Songs added to your profile from now on show the day they were added, after the artist in
     * your profile's song list (#71). Kept on this phone only. Off by default.
     */
    public static final BooleanSetting SONG_DATES =
            new BooleanSetting("hushtelegram_song_dates", FALSE);

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
     * With {@link #KEEP_DELETED_MESSAGES} on, your own messages stay too when their deletion comes from
     * the server, such as the other person deleting the whole chat for both of you (#82).
     */
    public static final BooleanSetting KEEP_OWN_DELETED =
            new BooleanSetting("hushtelegram_keep_own_deleted", FALSE);

    /**
     * Days a kept deleted message stays before it goes to Telegram's own deletion, 0 to keep them
     * until Clear kept messages (#91).
     */
    public static final IntegerSetting KEEP_DELETED_DAYS =
            new IntegerSetting("hushtelegram_keep_deleted_days", 0).withRange(0, 365);

    /**
     * When someone else edits a message, this phone keeps the text it had before, shown in Message details.
     */
    public static final BooleanSetting KEEP_EDIT_HISTORY =
            new BooleanSetting("hushtelegram_keep_edit_history", FALSE);

    /**
     * View-once and timed media someone sends you in an ordinary chat stays after you open it, with no
     * timer, and the server isn't told it was opened (#9).
     */
    public static final BooleanSetting KEEP_TIMED_MEDIA =
            new BooleanSetting("hushtelegram_keep_timed_media", FALSE);

    /**
     * Messages in secret chats stay on this phone when their self-destruct timer runs out (#82). The
     * key says encrypted, since the diagnostic report hides the value of any name with secret in it.
     */
    public static final BooleanSetting KEEP_SECRET_TIMED =
            new BooleanSetting("hushtelegram_keep_encrypted_timed", FALSE);

    /**
     * A group or channel that removes or bans you stays in the chat list with what this phone saved
     * of it, and opens to that instead of closing (#71).
     */
    public static final BooleanSetting KEEP_REMOVED_CHATS =
            new BooleanSetting("hushtelegram_keep_removed_chats", FALSE);

    /** The chats Keep chats you're removed from kept, as comma-separated dialog ids, the same on every account. */
    public static final StringSetting KEPT_REMOVED_CHATS =
            new StringSetting("hushtelegram_kept_removed_chats", "");

    /**
     * A sticker you tap asks Send or Cancel before it goes into the chat.
     */
    public static final BooleanSetting ASK_BEFORE_STICKER =
            new BooleanSetting("hushtelegram_ask_before_sticker", FALSE);

    /**
     * A photo whose crop Telegram can't finish stays in the editor with a try again toast, instead of
     * going out uncropped. On by default.
     */
    public static final BooleanSetting CROP_GUARD =
            new BooleanSetting("hushtelegram_crop_guard", TRUE);

    /**
     * Unpicking the first of several photos that each have a caption, or dragging another photo in
     * front of it, has the comment field show the new first photo's caption, so every caption goes
     * out on its own photo. On by default.
     */
    public static final BooleanSetting CAPTION_ORDER =
            new BooleanSetting("hushtelegram_caption_order", TRUE);

    /**
     * The chat list's menu always has Proxy, not just while a proxy is on or Telegram is blocked
     * where you are. Off by default.
     */
    public static final BooleanSetting PROXY_MENU =
            new BooleanSetting("hushtelegram_proxy_menu", FALSE);

    /**
     * The chat list's menu gets a Do Not Disturb item, which holds every message notification and
     * the in-chat sound until it's tapped again (#79). Off by default.
     */
    public static final BooleanSetting DND_MENU =
            new BooleanSetting("hushtelegram_dnd_menu", FALSE);

    /**
     * Every six hours, a public list of MTProto proxies is downloaded and the fastest ten go in
     * Telegram's proxy list, and Telegram connects through them unless a proxy of your own is in
     * use (#66). Off by default, since it goes online and a proxy's operator sees your address.
     */
    public static final BooleanSetting FREE_PROXIES =
            new BooleanSetting("hushtelegram_free_proxies", FALSE);

    /**
     * Telegram connects through your own VMess, VLESS, Trojan and Shadowsocks servers, from links
     * you paste and your own proxy lists, by way of a SOCKS5 proxy that runs inside Telegram on
     * 127.0.0.1 and one entry for it in Telegram's proxy list (#71). Off by default, and it stays
     * out of settings files: the links don't go in one, so an import would turn on a proxy with no
     * servers behind it.
     */
    public static final BooleanSetting V2RAY_PROXIES =
            new BooleanSetting("hushtelegram_v2ray_proxies", FALSE, false, false);

    /**
     * A group's menu at the top has My messages, which searches the group for the messages you
     * sent the way Telegram's search does once you pick yourself as the sender. Off by default.
     */
    public static final BooleanSetting MY_MESSAGES =
            new BooleanSetting("hushtelegram_my_messages", FALSE);

    /**
     * The menu at the top of a group or channel you own or administer has Admin tools, a list of
     * the admin screens your rights there open: Recent Actions, Administrators, Members or
     * Subscribers, Permissions or Removed users, and Invite Links (#79). Off by default.
     */
    public static final BooleanSetting ADMIN_TOOLS =
            new BooleanSetting("hushtelegram_admin_tools", FALSE);

    /**
     * An Admin folder with every group and channel you own or administer, made as Telegram's own
     * folder so it's a tab above the chat list and on your other devices (#79). Turning it off
     * removes the folder unless you changed it. Off by default, and it stays out of settings files
     * like {@link #CHAT_TYPE_FOLDERS}: an import would flip it without making or removing anything.
     */
    public static final BooleanSetting ADMIN_FOLDER =
            new BooleanSetting("hushtelegram_admin_folder", FALSE);

    /**
     * The message box's text menu has Right to left and Left to right, which start the selected
     * lines with an invisible direction mark, and Control character, which picks one of the
     * invisible Unicode marks Telegram Desktop offers. Off by default.
     */
    public static final BooleanSetting TEXT_DIRECTION =
            new BooleanSetting("hushtelegram_text_direction", FALSE);

    /**
     * The phone number screen always shows Telegram's proxy button, which it otherwise keeps for
     * countries where Telegram is blocked, so a proxy can be set before signing in (#66). On by
     * default.
     */
    public static final BooleanSetting SIGN_IN_PROXY =
            new BooleanSetting("hushtelegram_sign_in_proxy", TRUE);

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

    /** The round share button beside channel posts, in the channel and forwarded into a chat, is left off. */
    public static final BooleanSetting HIDE_CHANNEL_SHARE =
            new BooleanSetting("hushtelegram_hide_channel_share", FALSE);

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

    /**
     * The bar at the bottom of the main screen gets a thin Telegram blue outline. Its glass reads the
     * outline when the main screen is built, so a restart shows the change.
     */
    public static final BooleanSetting BAR_OUTLINE =
            new BooleanSetting("hushtelegram_bar_outline", FALSE, true);

    /** Downloads take 512 KB pieces, 8 at a time, unless Telegram drops back to small ones itself. */
    public static final BooleanSetting FASTER_DOWNLOADS =
            new BooleanSetting("hushtelegram_faster_downloads", FALSE);

    /** An upload keeps four times as many pieces in flight. */
    public static final BooleanSetting FASTER_UPLOADS =
            new BooleanSetting("hushtelegram_faster_uploads", FALSE);

    /** Automatic media downloads wait while Android's Data Saver restricts Telegram on a metered network. */
    public static final BooleanSetting DATA_SAVER_DOWNLOADS =
            new BooleanSetting("hushtelegram_data_saver_downloads", FALSE);

    /** Downloads run one at a time in the order asked, and the side menu lists them. */
    public static final BooleanSetting DOWNLOAD_MANAGER =
            new BooleanSetting("hushtelegram_download_manager", FALSE);

    /** Photos go out in HD and videos at their own size unless one is changed before sending (#63). */
    public static final BooleanSetting BEST_QUALITY_MEDIA =
            new BooleanSetting("hushtelegram_best_quality_media", FALSE);

    /** A file or song that finishes downloading gets a copy in Download/Telegram, unless saving it isn't allowed. */
    public static final BooleanSetting SAVE_DOWNLOADS =
            new BooleanSetting("hushtelegram_save_downloads", FALSE);

    /**
     * With {@link #SAVE_DOWNLOADS} on, a file from a chat or message whose owner turned off saving
     * gets its copy too. A secret chat needs {@link #SAVE_SECRET_CHATS} as well, and self-destructing
     * media {@link #SAVE_TIMED_MEDIA}. Starts off,
     * since it goes past the owner's setting (#29).
     */
    public static final BooleanSetting SAVE_RESTRICTED_DOWNLOADS =
            new BooleanSetting("hushtelegram_save_restricted_downloads", FALSE);

    /**
     * With {@link #SAVE_DOWNLOADS} on, view-once and self-destructing photos, videos, voice and
     * round videos get a copy too, decrypted from Telegram's cache. A chat that doesn't allow saving
     * needs {@link #SAVE_RESTRICTED_DOWNLOADS} as well, and a secret chat {@link #SAVE_SECRET_CHATS} on
     * top of that. Starts off,
     * since it goes past the sender's choice (#9).
     */
    public static final BooleanSetting SAVE_TIMED_MEDIA =
            new BooleanSetting("hushtelegram_save_timed_media", FALSE);

    /**
     * With {@link #SAVE_RESTRICTED_DOWNLOADS} on, a secret chat's files, photos and videos get their
     * copy too, and its view-once and timed media with {@link #SAVE_TIMED_MEDIA} on. The message
     * menu's Save to Downloads shows in a secret chat as well. Starts off, since a secret chat is
     * meant to stay on the two phones in it (#82).
     */
    public static final BooleanSetting SAVE_SECRET_CHATS =
            new BooleanSetting("hushtelegram_save_encrypted_chats", FALSE);

    /**
     * What to copy: with {@link #SAVE_DOWNLOADS} on, the kinds of files left in Telegram, as
     * comma-separated {@link app.hushtelegram.extension.telegram.misc.SaveDownloads.Kind} names
     * (#57). Empty copies every kind, so a kind added later starts ticked. Documents are whatever
     * isn't a picture, video or sound file. Photos, videos and voice messages only come through the
     * switches above, and Save to Downloads in the message menu copies any kind.
     */
    public static final StringSetting SAVE_KINDS_LEFT_OUT =
            new StringSetting("hushtelegram_save_kinds_left_out", "");

    /**
     * On Android 11 and up with All files access, Telegram's own Telegram Images, Video, Documents
     * and the rest live in Internal storage/Telegram instead of Android/data (#7). Read once when
     * Telegram sets up its folders, so it needs a restart.
     */
    public static final BooleanSetting STORAGE_FOLDER =
            new BooleanSetting("hushtelegram_storage_folder", FALSE, true);

    /**
     * File icons and thumbnails (#79): a file sent as a document shows what it is in a chat and in
     * Shared media &gt; Files. An APK or EXE gets an Android-style or Windows-style glyph, and once
     * downloaded a PDF shows its first page and a video a frame from it. A file with a thumbnail
     * from Telegram's servers keeps it. Starts off.
     */
    public static final BooleanSetting FILE_ICONS =
            new BooleanSetting("hushtelegram_file_icons", FALSE);

    /**
     * Files you already have (#79): a named file, or a photo or video from a chat that allows
     * saving, shows as downloaded when Telegram's folders already hold one with the same name and
     * size, even though this account has no record of downloading it. That covers another
     * account's downloads, and with {@link #STORAGE_FOLDER} on, files from before a reinstall.
     * Starts off.
     */
    public static final BooleanSetting KNOWN_FILES =
            new BooleanSetting("hushtelegram_known_files", FALSE);

    /**
     * The folder under Internal storage that {@link #STORAGE_FOLDER} moves Telegram's files to, one
     * {@link app.hushtelegram.extension.telegram.misc.StorageFolder#allowedName} takes. Empty is
     * Internal storage/Telegram (#7). Read once with the folder, so it needs a restart too.
     */
    public static final StringSetting STORAGE_FOLDER_NAME =
            new StringSetting("hushtelegram_storage_folder_name", "", true);

    /**
     * Which folders Telegram's Save to gallery puts photos and videos in, one of
     * {@link app.hushtelegram.extension.telegram.misc.GalleryFolder#CHOICES}. Empty keeps Telegram's
     * Pictures/Telegram and Movies/Telegram (#30).
     */
    public static final StringSetting GALLERY_FOLDER =
            new StringSetting("hushtelegram_gallery_folder", "");

    /**
     * The icon pack HushTelegram draws beside folder names in its own lists, one of
     * {@link app.hushtelegram.extension.telegram.misc.FolderIcons#CHOICES}. Empty draws none (#53).
     */
    public static final StringSetting FOLDER_ICON_PACK =
            new StringSetting("hushtelegram_folder_icon_pack", "");

    /** Turned on, makes Private, Groups, Channels and Bots folders; turned off, removes the untouched ones it made. */
    public static final BooleanSetting CHAT_TYPE_FOLDERS =
            new BooleanSetting("hushtelegram_chat_type_folders", FALSE);

    /** A GIF you tap asks Send or Cancel before it goes into the chat. */
    public static final BooleanSetting ASK_BEFORE_GIF =
            new BooleanSetting("hushtelegram_ask_before_gif", FALSE);

    /**
     * A voice message you recorded asks Send or Cancel before it goes into the chat. Its key is
     * older than {@link #ASK_BEFORE_ROUND_VIDEO}, from when this one switch asked about both.
     */
    public static final BooleanSetting ASK_BEFORE_VOICE_VIDEO =
            new BooleanSetting("hushtelegram_ask_before_voice_video", FALSE);

    /** The call button in a chat's header or on a profile asks Call or Cancel before it starts a call. */
    public static final BooleanSetting ASK_BEFORE_CALL =
            new BooleanSetting("hushtelegram_ask_before_call", FALSE);

    /**
     * A round video message you recorded asks Send or Cancel before it goes into the chat. The
     * voice message switch used to ask about these too, so a phone that had it on gets this one on
     * once, the first time this build starts.
     */
    public static final BooleanSetting ASK_BEFORE_ROUND_VIDEO =
            new BooleanSetting("hushtelegram_ask_before_round_video", FALSE);

    /** A message you typed asks Send or Cancel before the send button or the keyboard's send key sends it. */
    public static final BooleanSetting ASK_BEFORE_MESSAGE =
            new BooleanSetting("hushtelegram_ask_before_message", FALSE);

    /** Joining a voice chat or a live stream asks Join or Cancel first. */
    public static final BooleanSetting ASK_BEFORE_JOIN =
            new BooleanSetting("hushtelegram_ask_before_join_call", FALSE);

    /** Stored once {@link #ASK_BEFORE_ROUND_VIDEO} has taken the voice message switch's value. */
    static final String ROUND_VIDEO_CARRIED = "hushtelegram_round_video_carried";

    static {
        carryRoundVideo();
    }

    /**
     * Turns {@link #ASK_BEFORE_ROUND_VIDEO} on when {@link #ASK_BEFORE_VOICE_VIDEO} is on, once per
     * install, so splitting the switch in two doesn't stop a question someone turned on.
     */
    static void carryRoundVideo() {
        try {
            if (!Utils.isMainProcess() || Setting.preferences.getBoolean(ROUND_VIDEO_CARRIED, false)) return;
            if (ASK_BEFORE_VOICE_VIDEO.savedValue() && !ASK_BEFORE_ROUND_VIDEO.save(true)) return;
            Setting.preferences.saveBoolean(ROUND_VIDEO_CARRIED, true);
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not carry the voice message question over to round videos", failure);
        }
    }

    /** A photo's long-press menu gets Copy photo, which puts the downloaded picture on the clipboard. */
    public static final BooleanSetting MESSAGE_MENU_COPY_PHOTO =
            new BooleanSetting("hushtelegram_message_menu_copy_photo", FALSE);

    /** A message's long-press menu gets Message details, a dialog of its IDs, times and file facts. */
    public static final BooleanSetting MESSAGE_MENU_DETAILS =
            new BooleanSetting("hushtelegram_message_menu_details", FALSE);

    /** A message's long-press menu gets Quick forward, which forwards it to Saved Messages or a recent chat in one tap. */
    public static final BooleanSetting MESSAGE_MENU_QUICK_FORWARD =
            new BooleanSetting("hushtelegram_message_menu_quick_forward", FALSE);

    /** A chat or message that doesn't allow saving gets Copy in its long-press menu and in text selection again (#43). */
    public static final BooleanSetting MESSAGE_MENU_COPY_PROTECTED =
            new BooleanSetting("hushtelegram_message_menu_copy_protected", FALSE);

    /** A downloaded file in a chat that doesn't allow saving gets Save to Downloads in its long-press menu (#29). */
    public static final BooleanSetting MESSAGE_MENU_SAVE_PROTECTED =
            new BooleanSetting("hushtelegram_message_menu_save_protected", FALSE);
    /** A story's three-dot menu gets Save to Gallery without Premium, on stories that don't allow saving too (#52). */
    public static final BooleanSetting STORY_SAVE_BUTTON =
            new BooleanSetting("hushtelegram_story_save_button", FALSE);
    /** Screenshots and screen recording work in chats, profiles, photos and stories that don't allow saving (Discussion #34). */
    public static final BooleanSetting ALLOW_SCREENSHOTS =
            new BooleanSetting("hushtelegram_allow_screenshots", FALSE);
    /** With {@link #ALLOW_SCREENSHOTS} on, secret chats, their profiles and their photos can be captured too (#82). */
    public static final BooleanSetting SECRET_CHAT_SCREENSHOTS =
            new BooleanSetting("hushtelegram_encrypted_chat_screenshots", FALSE);
    /** A message in a chat that doesn't allow forwarding gets Forward as copy in its long-press menu (#46, #47). */
    public static final BooleanSetting MESSAGE_MENU_FORWARD_COPY =
            new BooleanSetting("hushtelegram_message_menu_forward_copy", FALSE);

    /** Fast forward in the message menu (#53): forward with the sender's name or the captions left off, then pick a chat. */
    public static final BooleanSetting MESSAGE_MENU_FAST_FORWARD =
            new BooleanSetting("hushtelegram_message_menu_fast_forward", FALSE);

    /** Forward to Saved Messages in the message menu (#53): one tap to your own chat, with a choice of what to leave off. */
    public static final BooleanSetting MESSAGE_MENU_FORWARD_SAVED =
            new BooleanSetting("hushtelegram_message_menu_forward_saved", FALSE);

    /** Save video cover in the message menu (#53): the biggest cover or thumbnail of a video goes to Pictures. */
    public static final BooleanSetting MESSAGE_MENU_SAVE_COVER =
            new BooleanSetting("hushtelegram_message_menu_save_cover", FALSE);

    /** Save album art in the message menu (#53): a song's embedded or server album art goes to Pictures. */
    public static final BooleanSetting MESSAGE_MENU_SAVE_ART =
            new BooleanSetting("hushtelegram_message_menu_save_art", FALSE);

    /** Clear from cache in the message menu (#53): drops what Telegram kept of one video or file and puts the download arrow back. */
    public static final BooleanSetting MESSAGE_MENU_CLEAR_CACHE =
            new BooleanSetting("hushtelegram_message_menu_clear_cache", FALSE);

    /** Hide for me in the message menu (#20): a message leaves the chat on this phone only ({@link app.hushtelegram.extension.telegram.misc.HiddenMessages}). */
    public static final BooleanSetting MESSAGE_MENU_HIDE =
            new BooleanSetting("hushtelegram_message_menu_hide", FALSE);

    /** Forward as plain text in the message menu (#71): a message's words go to a picked chat as a new message, without formatting. */
    public static final BooleanSetting MESSAGE_MENU_PLAIN_FORWARD =
            new BooleanSetting("hushtelegram_message_menu_plain_forward", FALSE);

    /** Delete for them in the message menu (#71): your own message goes for everyone else and stays on this phone ({@link app.hushtelegram.extension.telegram.misc.DeleteForThem}). */
    public static final BooleanSetting MESSAGE_MENU_DELETE_FOR_THEM =
            new BooleanSetting("hushtelegram_message_menu_delete_for_them", FALSE);

    /** Bookmark in the message menu (#79): a message saved to a list on this phone, opened again from the Bookmarks page ({@link app.hushtelegram.extension.telegram.misc.Bookmarks}). */
    public static final BooleanSetting MESSAGE_MENU_BOOKMARKS =
            new BooleanSetting("hushtelegram_message_menu_bookmarks", FALSE);

    /** The bookmarks themselves, one per line, newest first, as {@link app.hushtelegram.extension.telegram.misc.Bookmarks} writes them. */
    public static final StringSetting BOOKMARKS =
            new StringSetting("hushtelegram_bookmarks", "");

    /** Edit a copy in the message menu (#79): a photo opened in Telegram's photo editor, the edited copy sent to the chat ({@link app.hushtelegram.extension.telegram.misc.PhotoEdit}). */
    public static final BooleanSetting MESSAGE_MENU_EDIT_COPY =
            new BooleanSetting("hushtelegram_message_menu_edit_copy", FALSE);

    /** Also delete for, checked from the start in Telegram's delete messages dialog (#83) ({@link app.hushtelegram.extension.telegram.misc.MessageMenu#alsoDeleteChecked}). */
    public static final BooleanSetting ALSO_DELETE_CHECKED =
            new BooleanSetting("hushtelegram_also_delete_checked", FALSE);

    /**
     * A channel's read metrics (how long each post stayed on screen), Premium screen interaction
     * reports and the camera's dual-camera report are never sent ({@link app.hushtelegram.extension.telegram.misc.Analytics}).
     */
    public static final BooleanSetting DISABLE_ANALYTICS =
            new BooleanSetting("hushtelegram_disable_analytics", TRUE);

    /**
     * Ghost mode's own switch: with it off, read receipts and story views go out as in stock
     * Telegram whatever its two parts say ({@link app.hushtelegram.extension.telegram.misc.GhostMode}).
     */
    public static final BooleanSetting GHOST_MODE =
            new BooleanSetting("hushtelegram_ghost_mode", FALSE);

    /**
     * Ghost mode's read receipts: chats, groups, channels, secret chats and played voice messages
     * stay unread for their senders. Read only while Ghost mode is on.
     */
    public static final BooleanSetting GHOST_READS =
            new BooleanSetting("hushtelegram_ghost_read_receipts", TRUE);

    /** Ghost mode's story views: stories you watch don't count you as a viewer. Read only while Ghost mode is on. */
    public static final BooleanSetting GHOST_STORIES =
            new BooleanSetting("hushtelegram_ghost_stories", TRUE);

    /** Ghost mode's typing: the typing, recording and uploading status isn't sent. Read only while Ghost mode is on. */
    public static final BooleanSetting GHOST_TYPING =
            new BooleanSetting("hushtelegram_ghost_typing", FALSE);

    /** Ghost mode's online status: going online isn't sent, going offline is. Read only while Ghost mode is on. */
    public static final BooleanSetting GHOST_ONLINE =
            new BooleanSetting("hushtelegram_ghost_online", FALSE);

    /**
     * A ghost on the chat list's top bar that turns {@link #GHOST_MODE} on and off with a tap
     * ({@link app.hushtelegram.extension.telegram.misc.GhostButton}). The chat list follows it as
     * soon as it's back on screen.
     */
    public static final BooleanSetting GHOST_BUTTON =
            new BooleanSetting("hushtelegram_ghost_button", FALSE);

    /**
     * Ghost mode's read after a reply: a message you send into a chat lets out the read receipt
     * {@link #GHOST_READS} kept back there (#69). Read only while Ghost mode and its reads are on.
     */
    public static final BooleanSetting GHOST_READ_AFTER_SEND =
            new BooleanSetting("hushtelegram_ghost_read_after_send", FALSE);

    /**
     * A double check on the chat list's top bar that sends the read receipts Ghost mode kept back
     * ({@link app.hushtelegram.extension.telegram.misc.ReadsButton}, #69). It shows while Ghost
     * mode and its reads are on.
     */
    public static final BooleanSetting GHOST_READS_BUTTON =
            new BooleanSetting("hushtelegram_ghost_reads_button", FALSE);

    /**
     * Ghost mode exceptions: the chats picked for them get the opposite of {@link #GHOST_MODE}, so
     * they act as in stock Telegram while it's on and keep things back while it's off
     * ({@link app.hushtelegram.extension.telegram.misc.GhostChats}, #71). Online status stays
     * with the main switch, since it's the account's and not one chat's.
     */
    public static final BooleanSetting GHOST_CHATS =
            new BooleanSetting("hushtelegram_ghost_chats", FALSE);

    /**
     * Fake typing: chats picked from the long press menu show you typing for up to ten minutes,
     * even under {@link #GHOST_TYPING} ({@link app.hushtelegram.extension.telegram.misc.FakeTyping}, #71).
     */
    public static final BooleanSetting FAKE_TYPING =
            new BooleanSetting("hushtelegram_fake_typing", FALSE);

    /**
     * Receive only mode: the accounts on {@link #RECEIVE_ONLY_ACCOUNTS} send nothing that writes.
     * With it off every account sends as in stock Telegram.
     */
    public static final BooleanSetting RECEIVE_ONLY =
            new BooleanSetting("hushtelegram_receive_only", FALSE);

    /** The accounts (their positions in Telegram's list, comma separated) that are receive only. Read only while Receive only mode is on. */
    public static final StringSetting RECEIVE_ONLY_ACCOUNTS =
            new StringSetting("hushtelegram_receive_only_accounts", "", false, false);

    /**
     * Power off accounts: the accounts on {@link #POWERED_OFF_ACCOUNTS} send nothing at all. With it
     * off every account is connected as in stock Telegram.
     */
    public static final BooleanSetting POWER_OFF_ACCOUNTS =
            new BooleanSetting("hushtelegram_power_off_accounts", FALSE);

    /** The accounts (their positions in Telegram's list, comma separated) that are powered off. Read only while Power off accounts is on. */
    public static final StringSetting POWERED_OFF_ACCOUNTS =
            new StringSetting("hushtelegram_powered_off_accounts", "", false, false);

    /**
     * Instant lock: with a Telegram passcode set, Telegram locks a second or two after you leave it
     * instead of waiting for Auto-lock. The Auto-lock choice itself is kept (#71).
     */
    public static final BooleanSetting INSTANT_LOCK =
            new BooleanSetting("hushtelegram_instant_lock", FALSE);

    /**
     * Duress passcode: a second passcode, typed where Telegram asks for its own, logs out or deletes
     * the accounts on the phone and clears what HushTelegram kept (#79). Only a salted hash of it is
     * kept, by {@link app.hushtelegram.extension.telegram.misc.DuressWipe}, outside settings files.
     */
    public static final BooleanSetting DURESS_WIPE =
            new BooleanSetting("hushtelegram_duress_wipe", FALSE);

    /**
     * What the duress passcode does (#79): empty to log out every account, or one of
     * {@link app.hushtelegram.extension.telegram.misc.DuressWipe#ACTIONS}. Settings files leave it
     * out, so a file can't make the code delete accounts on a phone where nobody picked that.
     */
    public static final StringSetting DURESS_ACTION =
            new StringSetting("hushtelegram_duress_action", "");

    /**
     * Don't notify contacts: a sign-up for a phone number new to Telegram asks the server not to tell
     * the people who have that number saved (#71). Existing accounts never send this request.
     */
    public static final BooleanSetting QUIET_SIGN_UP =
            new BooleanSetting("hushtelegram_quiet_sign_up", FALSE);

    /**
     * The device name every account tells Telegram when it connects, which Settings > Devices on
     * the other sessions shows (#79). Empty sends Telegram's own. Sent once per launch, so it
     * needs a restart.
     */
    public static final StringSetting SESSION_DEVICE_NAME =
            new StringSetting("hushtelegram_session_device_name", "", true);

    /** The system version sent beside {@link #SESSION_DEVICE_NAME}. Empty sends Telegram's own. */
    public static final StringSetting SESSION_SYSTEM_VERSION =
            new StringSetting("hushtelegram_session_system_version", "", true);

    /** Automatic call diagnostics only; the call itself and its cleanup stay stock. */
    public static final BooleanSetting DISABLE_CALL_DEBUG =
            new BooleanSetting("hushtelegram_disable_call_debug", TRUE);

    /**
     * Each call's audio, both sides, is saved to a file on this phone once the call ends. Read on
     * every block of call audio, so turning it off stops a call's recording where it is. Off by
     * default.
     */
    public static final BooleanSetting RECORD_CALLS =
            new BooleanSetting("hushtelegram_record_calls", FALSE);

    /**
     * A button on the call screen that records the call on screen, or stops recording it when
     * Record calls is on, for that call only. Off by default.
     */
    public static final BooleanSetting RECORD_CALL_BUTTON =
            new BooleanSetting("hushtelegram_record_call_button", FALSE);

    /**
     * Which calls Record calls saves (#72): empty for every call, or one of
     * {@link app.hushtelegram.extension.telegram.misc.RecordChats#SCOPES}. The record button works
     * on any call whatever this says.
     */
    public static final StringSetting RECORD_CALLS_WHICH =
            new StringSetting("hushtelegram_record_calls_which", "");

    /** Days a call recording is kept before the next saved one deletes it, 0 to keep them all (#72). */
    public static final IntegerSetting RECORD_CALLS_KEEP_DAYS =
            new IntegerSetting("hushtelegram_record_calls_keep_days", 0).withRange(0, 365);

    /**
     * A notification once each call recording is saved (#72): a tap plays it, and its buttons share
     * it or send it to Saved Messages. Off by default.
     */
    public static final BooleanSetting RECORD_CALLS_NOTIFY =
            new BooleanSetting("hushtelegram_record_calls_notify", FALSE);

    /**
     * Call recordings in Opus, in an .ogg about half the size, rather than AAC in an .m4a (#72).
     * Android 10 and newer with an Opus encoder; AAC otherwise. Read as each recording starts. Off
     * by default.
     */
    public static final BooleanSetting RECORD_CALLS_OPUS =
            new BooleanSetting("hushtelegram_record_calls_opus", FALSE);

    /**
     * The folder picked for call recordings (#72), as the address Android's folder picker gave, or
     * empty for the usual one. Telegram's lasting permission for it belongs to this phone, so it
     * stays out of settings files.
     */
    public static final StringSetting RECORD_CALLS_FOLDER =
            new StringSetting("hushtelegram_record_calls_folder", "", false, false);

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

    /**
     * A sent message's link preview only: a link one of {@link #LINK_PREVIEW_RULE_LIST}'s rules
     * covers gets its preview from the rule's other site, and the text goes out as typed
     * ({@link app.hushtelegram.extension.telegram.misc.LinkPreviewRules}).
     */
    public static final BooleanSetting LINK_PREVIEW_RULES =
            new BooleanSetting("hushtelegram_link_preview_rules", FALSE);

    /** The rules Fix link previews follows, one {@code original -> alternative} a line. */
    public static final StringSetting LINK_PREVIEW_RULE_LIST = new StringSetting("hushtelegram_link_preview_rule_list",
            app.hushtelegram.extension.telegram.misc.LinkPreviewRules.DEFAULT_RULES);

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
     * A link copied from Telegram, and one pasted into the message box, loses the same tracking tags the
     * opened and shared ones do (#53). Only a text that is one link and nothing else is changed.
     */
    public static final BooleanSetting STRIP_LINK_COPY_PASTE =
            new BooleanSetting("hushtelegram_strip_link_copy_paste", FALSE);

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

    /**
     * Telegram's Keep-Alive Service runs in front with a quiet notification, so Android stops
     * freezing it in the background (#50, #54). Only matters while Telegram's own Keep-Alive Service
     * switch is on.
     */
    public static final BooleanSetting KEEP_ALIVE_RUNNING =
            new BooleanSetting("hushtelegram_keep_alive_running", TRUE);

    /** Telegram signs up a UnifiedPush app's address for its wake-ups instead of Firebase's token. */
    public static final BooleanSetting UNIFIED_PUSH =
            new BooleanSetting("hushtelegram_unified_push", FALSE);

    /**
     * Someone's reaction to your message shows a notification even when no push arrives, from the
     * connection Telegram already has open. On by default: a push for the same reaction shows once.
     */
    public static final BooleanSetting REACTION_ALERTS =
            new BooleanSetting("hushtelegram_reaction_alerts", TRUE);

    /**
     * A reaction's notification plays the sound and vibration set for reactions in Telegram's
     * Notifications and Sounds, where Telegram keeps every reaction silent. Off by default.
     */
    public static final BooleanSetting REACTION_SOUND =
            new BooleanSetting("hushtelegram_reaction_sound", FALSE);

    /**
     * Telegram's Test Backend checkbox shows on the sign-in phone screen for every account being
     * added, not only one already on the test servers. Ticking it signs that account in on
     * Telegram's test servers, apart from the accounts already signed in. Off by default.
     */
    public static final BooleanSetting TEST_SERVER_SIGN_IN =
            new BooleanSetting("hushtelegram_test_server_sign_in", FALSE);

    /**
     * Whether Telegram's phone number screen offers Sign in with a bot token, for first sign-in and
     * Add account alike, so an account can be a bot made with @BotFather. Turning it off hides the
     * button and leaves a bot account that's already signed in working. Off by default.
     */
    public static final BooleanSetting BOT_TOKEN_SIGN_IN =
            new BooleanSetting("hushtelegram_bot_sign_in", FALSE);

    /**
     * Once a day, when Telegram starts, ask api.github.com whether a newer HushTelegram release is
     * out, and say so on the settings screen ({@link ReleaseCheck}). It's the settings entry's own
     * switch rather than a patch's, so every build has it ({@link PatchFamily#ENTRY_SWITCHES}). Off
     * by default, and a settings file never carries it: a file shouldn't be able to put a phone
     * online.
     */
    public static final BooleanSetting CHECK_FOR_RELEASES =
            new BooleanSetting("hushtelegram_check_releases", FALSE);

    /**
     * The screenshot notification Telegram sends to the other party in a secret chat is dropped
     * before it leaves the phone ({@link app.hushtelegram.extension.telegram.misc.ScreenshotNotification}).
     */
    public static final BooleanSetting SUPPRESS_SCREENSHOT_NOTIFICATION =
            new BooleanSetting("hushtelegram_suppress_screenshot_notification", FALSE);

    /**
     * The app behaves as if the account has Telegram Premium, locally only. The server still knows
     * the real status, so server-enforced limits stay. Unlocks client-side Premium features like
     * doubled limits, extra reactions, no ads and faster downloads
     * ({@link app.hushtelegram.extension.telegram.misc.PremiumUnlock}).
     */
    public static final BooleanSetting UNLOCK_PREMIUM =
            new BooleanSetting("hushtelegram_unlock_premium", FALSE);

    /**
     * Content restrictions on channels and chats (no forwards, no saving) are bypassed locally.
     * Forwarding, copying and saving work as if the restriction was never set
     * ({@link app.hushtelegram.extension.telegram.misc.ChannelRestrictions}).
     */
    public static final BooleanSetting BYPASS_CHANNEL_RESTRICTIONS =
            new BooleanSetting("hushtelegram_bypass_channel_restrictions", FALSE);

    /**
     * Channels, chats and messages Telegram restricts for copyright or local law open and show as
     * they would anywhere else (#58,
     * {@link app.hushtelegram.extension.telegram.misc.ChannelRestrictions#ignoreRestrictionReason}).
     */
    public static final BooleanSetting OPEN_RESTRICTED_CHATS =
            new BooleanSetting("hushtelegram_open_restricted_chats", FALSE);

    /**
     * Play Integrity, SafetyNet and certificate verification checks are answered with a passing
     * result so the app doesn't detect it has been re-signed
     * ({@link app.hushtelegram.extension.telegram.misc.IntegrityBypass}).
     */
    public static final BooleanSetting BYPASS_INTEGRITY_CHECK =
            new BooleanSetting("hushtelegram_bypass_integrity_check", FALSE);

    /**
     * New messages in a rule's chat are forwarded to the rule's other chat on the same account.
     * Rules are kept in {@link #AUTO_FORWARDING_RULES}
     * ({@link app.hushtelegram.extension.telegram.misc.AutoForwarding}).
     */
    public static final BooleanSetting AUTO_FORWARDING =
            new BooleanSetting("hushtelegram_auto_forwarding", FALSE);

    /** The forwarding rules, one a line: user id, source chat, destination chat, then 1 for media only. Kept per account, so they aren't in settings files. */
    public static final StringSetting AUTO_FORWARDING_RULES =
            new StringSetting("hushtelegram_auto_forwarding_rules", "", false, false);
}
