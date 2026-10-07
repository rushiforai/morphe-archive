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
     * The device statistics report the server can ask for (a storage-type boolean, sent as a
     * help.saveAppLog event) and a channel's read metrics (how long each post stayed on screen) are
     * never sent ({@link app.hushtelegram.extension.telegram.misc.Analytics}).
     */
    public static final BooleanSetting DISABLE_ANALYTICS =
            new BooleanSetting("hushtelegram_disable_analytics", TRUE);

    /** Automatic call diagnostics only; the call itself and its cleanup stay stock. */
    public static final BooleanSetting DISABLE_CALL_DEBUG =
            new BooleanSetting("hushtelegram_disable_call_debug", TRUE);

    /** Link previews for unsent messages only; sent messages and received previews stay stock. */
    public static final BooleanSetting DISABLE_DRAFT_PREVIEWS =
            new BooleanSetting("hushtelegram_disable_draft_previews", FALSE);

    /** The attachment gallery's camera tile only; the camera wakes on a tap and every other camera stays stock. */
    public static final BooleanSetting GALLERY_CAMERA_ON_TAP =
            new BooleanSetting("hushtelegram_gallery_camera_on_tap", FALSE);

    /** Ordinary HTTP(S) browser dispatch only; native and protected Telegram routes stay stock. */
    public static final BooleanSetting OPEN_EXTERNAL_LINKS =
            new BooleanSetting("hushtelegram_open_external_links", TRUE);

    /** Optional local URL cleaning at verified open/share sinks; unknown query keys preserve the URL. */
    public static final BooleanSetting STRIP_LINK_TRACKING =
            new BooleanSetting("hushtelegram_strip_link_tracking", FALSE);

    /**
     * telegram.org's build stops checking for its own updates, which can't install over a re-signed
     * build anyway ({@link app.hushtelegram.extension.telegram.misc.UpdateChecks}).
     */
    public static final BooleanSetting DISABLE_UPDATE_CHECKS =
            new BooleanSetting("hushtelegram_disable_update_checks", TRUE);

    /** The official web certificate for the scoped Firebase Installations header only. */
    public static final BooleanSetting REPAIR_FIREBASE_PUSH =
            new BooleanSetting("hushtelegram_repair_firebase_push", TRUE);

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
