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

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.preference.TwoStatePreference;
import android.text.Layout;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.text.util.Linkify;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtelegram.extension.shared.settings.preference.ClearLogBufferPreference;
import app.hushtelegram.extension.shared.settings.preference.ExportDiagnosticReportPreference;
import app.hushtelegram.extension.shared.settings.preference.ImmediateAction;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManager;
import app.hushtelegram.extension.telegram.misc.FirebasePush;
import app.hushtelegram.extension.telegram.misc.KeepDeleted;

/**
 * The preference list, built in code rather than from an XML resource so the bundle adds no
 * resources to Telegram. A switch appears only when its patch is in this build
 * ({@link PatchFamily}), but for the settings entry's own ({@link PatchFamily#ENTRY_SWITCHES}),
 * which every build has; a patch that works entirely at patch time gets a line saying so, and what
 * Pause can't reach is listed under the Pause switch. Switches are keyed by their setting, which is
 * how the shared fragment keeps them in sync with stored values. Every word is read from
 * {@link L10n} in the phone's language; the product names and the address stay as they are.
 */
@SuppressWarnings("deprecation")
public final class HushTelegramPreferenceFragment extends AbstractPreferenceFragment
        implements ReleaseCheck.Listener {
    /** The repository as a link, and as a person reads it. ExtensionHostsTest reads the link. */
    static final String SOURCE_URL = "https://github.com/SysAdminDoc/HushTelegram";
    static final String SOURCE_ADDRESS = SOURCE_URL.substring(SOURCE_URL.indexOf("://") + 3);
    /** The English of the row listing what Pause can't reach, and its key in {@link L10n}. */
    static final String STAYS_WHILE_PAUSED = "Stays in while paused";
    /** The Check now row's key. It stores nothing: no setting has this name. */
    static final String CHECK_NOW = "action_check_for_release";
    /** The Supported links row's key. It stores nothing either. */
    static final String SUPPORTED_LINKS = "action_supported_links";
    /** The Clear kept messages row's key, which stores nothing. */
    static final String CLEAR_KEPT = "action_clear_kept_messages";

    /** Thrown by the next initialize() and then cleared: how a test reaches the recovery page. */
    static volatile RuntimeException failNextInitialization;

    /** The first row, which says whether HushTelegram runs now and whether the next start changes that. */
    @Nullable
    private Preference statusCard;

    /** The row that asks GitHub for the newest release now, and says what the last try found. */
    @Nullable
    private Preference checkNowRow;

    @Nullable
    private Preference localNotificationStatus;

    /** Where a settings file waiting on the person's answer is kept across the page being rebuilt. */
    static final String PENDING_IMPORT_STATE = "hushtelegram_pending_import";

    /**
     * A settings file that was read and waits on the person's answer, as
     * {@link SettingsBackup.Snapshot#toBundle()} wrote it, or null.
     */
    @Nullable
    Bundle pendingImport;

    /** The preview of {@link #pendingImport} while it's on screen. */
    @Nullable
    AlertDialog importPreview;

    /** The page's other dialogs that may still be on screen: the sections and Licenses. */
    private final List<Dialog> shownDialogs = new ArrayList<>();

    /**
     * Where the list was before the last section jump, as its first visible position and that row's
     * top, which Back goes back to once; null when there's been no jump since.
     */
    @Nullable
    int[] beforeJump;

    @Nullable
    SettingsNavigation navigation;

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        // The complete model remains usable as a standalone preference page. The dialog adds
        // its navigation shell only after the framework has bound that model to the list.
        if (getParentFragment() instanceof SettingsDialog && !sections().isEmpty()) {
            navigation = new SettingsNavigation(this, (SettingsDialog) getParentFragment(), savedInstanceState);
        }
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        if (savedInstanceState != null) pendingImport = savedInstanceState.getBundle(PENDING_IMPORT_STATE);
        super.onCreate(savedInstanceState);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ListView list = view.findViewById(android.R.id.list);
        if (list != null) {
            list.setDivider(null);
            list.setDividerHeight(0);
            // Set here rather than in initialize(), so a page whose initialize() failed, the
            // recovery page, is drawn on the same black.
            list.setBackgroundColor(ScreenColors.DEFAULT.background);
        }
    }

    @Override
    public void onResume() {
        super.onResume();
        SettingsBackupPreference.onPageResumed(this);
        showSupportedLinks();
        if (localNotificationStatus != null) localNotificationStatus.setSummary(FirebasePush.localStatus(getContext()).summary());
    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (pendingImport != null) outState.putBundle(PENDING_IMPORT_STATE, pendingImport);
        if (navigation != null) navigation.save(outState);
    }

    @Override
    public void onDestroyView() {
        // The preview is drawn over this page's window. It stays unanswered, and the page that
        // replaces this one shows it again.
        SettingsBackupPreference.closePreview(this);
        // The page's other dialogs are drawn over its window too, and would outlive it.
        for (Dialog dialog : new ArrayList<>(shownDialogs)) dialog.dismiss();
        shownDialogs.clear();
        ReleaseCheck.unwatch(this);
        if (navigation != null) navigation.close();
        navigation = null;
        super.onDestroyView();
    }

    /** A release check ended: the card and the Check now row say what it found. */
    @Override
    public void releaseCheckFinished() {
        Context context = getContext();
        if (context == null) return;
        if (statusCard != null) showStatus(statusCard, context);
        if (checkNowRow != null) checkNowRow.setSummary(ReleaseCheck.checkNowSummary());
    }

    /**
     * The file picker's answer. Android finds this page by the name the framework gave it when
     * the picker was opened, and a page rebuilt while the picker was up is given the same name.
     */
    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        SettingsBackupPreference.onResult(this, requestCode, resultCode, data);
    }

    /** Shows what the switches are saved as, after an import wrote them. */
    void refreshSwitches() {
        updateUIToSettingValues();
    }

    @Override
    protected void initialize() {
        RuntimeException fault = failNextInitialization;
        if (fault != null) {
            failNextInitialization = null;
            throw fault;
        }
        // Loads the switches before the shared fragment syncs them to the screen.
        Settings.HIDE_ADS.get();

        // Every row inflates with the theme of the context it was built with. The host activity's
        // theme can be light, and its near-black primary text vanished on this screen's black
        // background on a phone (2026-09-24). The rows get the dark Material theme instead.
        Context context = themed(getContext());
        PreferenceScreen screen = getPreferenceManager().createPreferenceScreen(context);
        setPreferenceScreen(screen);

        screen.addPreference(statusCard(context));
        screen.addPreference(jumpRow(context));
        // The export row below reads these; registering twice keeps one.
        PatchFamily.registerDiagnostics();
        LogBufferManager.registerReportSection(ReleaseCheck.REPORT);
        Set<PatchFamily> build = PatchFamily.inThisBuild();
        localNotificationStatus = null;

        // Every row carries an icon, so all pages share one text edge. A switch that stops something
        // Telegram does takes the stop sign.
        if (!Collections.disjoint(build, PatchFamily.CHATS_PAGE)) {
            PreferenceCategory chats = category(screen, L10n.t("Chats"));
            if (build.contains(PatchFamily.HIDE_ADS)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_ADS, L10n.t("Hide ads"),
                        PatchFamily.HIDE_ADS.coverageSummary(L10n.t("Removes sponsored messages in channels, sponsored accounts in search and ads in "
                                + "videos. They're never loaded, so none count as seen."))), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.HIDE_STORIES)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_STORIES, L10n.t("Hide Stories"),
                        PatchFamily.HIDE_STORIES.coverageSummary(L10n.t("Removes the story bar above your chats, the rings around profile pictures and "
                                + "the Post Story button. Profile stories and archives stay."))), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.HIDE_RECOMMENDATIONS)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_RECOMMENDATIONS, L10n.t("Hide recommendations"),
                        PatchFamily.HIDE_RECOMMENDATIONS.coverageSummary(L10n.t("Hides suggested similar channels and bots, including ones already saved, and "
                                + "stops asking Telegram for new ones."))), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.HIDE_COMMERCE)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_COMMERCE, L10n.t("Hide Premium, gifts and Stars"),
                        PatchFamily.HIDE_COMMERCE.coverageSummary(L10n.t("Removes Premium, Stars, My Grams, Business and Send a Gift from Settings, Gifts "
                                + "tabs on profiles, and the Gift button in channels."))), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.HIDE_PROMOTIONAL_BANNERS)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_PROMOTIONAL_BANNERS, L10n.t("Hide promotional banners"),
                        PatchFamily.HIDE_PROMOTIONAL_BANNERS.coverageSummary(L10n.t("Hides the Premium, birthday and low Stars balance banners above your chat list. "
                                + "Account security notices and other suggestions still show."))), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.HIDE_SPONSORED_PROXY)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_SPONSORED_PROXY, L10n.t("Hide sponsored proxy channel"),
                        PatchFamily.HIDE_SPONSORED_PROXY.coverageSummary(L10n.t("Hides the sponsored channel a proxy adds to your chat list and folders. Your "
                                + "proxy settings aren't touched."))), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.HIDE_POPULAR_APPS)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_POPULAR_APPS, L10n.t("Hide popular apps"),
                        PatchFamily.HIDE_POPULAR_APPS.coverageSummary(L10n.t("Hides the Popular apps list on the Apps tab of search, and doesn't ask Telegram "
                                + "for it. Apps you've opened and other results stay."))),
                        SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.HIDE_CONTACTS_BLOCK)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_CONTACTS_BLOCK, L10n.t("Hide contacts on Telegram"),
                        PatchFamily.HIDE_CONTACTS_BLOCK.coverageSummary(L10n.t("When your chat list is short, Telegram lists your contacts below it. This hides "
                                + "that list and its heading. Chats, folders and search stay."))),
                        SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.HIDE_GREETING_STICKERS)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_GREETING_STICKERS, L10n.t("Hide greeting stickers"),
                        PatchFamily.HIDE_GREETING_STICKERS.coverageSummary(L10n.t("Empty private chats stop suggesting a sticker to say hello. Their other text and"
                                + " notices, and the sticker picker, stay."))),
                        SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.DISABLE_CHAT_SWIPE)) {
                chats.addPreference(mark(toggle(context, Settings.DISABLE_CHAT_SWIPE, L10n.t("No swipe actions on chats"),
                        PatchFamily.DISABLE_CHAT_SWIPE.coverageSummary(L10n.t("Swiping a chat in your list no longer archives, mutes, pins, deletes or marks it"
                                + " read. Press and hold still offers every action."))), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.QUIET_CONTACTS_NAG)) {
                chats.addPreference(mark(toggle(context, Settings.QUIET_CONTACTS_NAG, L10n.t("Quiet contacts prompts"),
                        PatchFamily.QUIET_CONTACTS_NAG.coverageSummary(L10n.t("After you say no to contacts access, the Contacts tab stops asking again and its"
                                + " warning badge goes away."))),
                        SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.DISABLE_CHANNEL_PULL)) {
                chats.addPreference(mark(toggle(context, Settings.DISABLE_CHANNEL_PULL, L10n.t("Stop pull to next channel"),
                        L10n.t("Pulling up at the bottom of a channel only scrolls. Open the next channel from your chat list.")),
                        SettingsIcons.BLOCK));
                chats.addPreference(mark(toggle(context, Settings.DISABLE_TOPIC_PULL, L10n.t("Stop pull to next topic"),
                        L10n.t("Pulling up at the bottom of a forum topic only scrolls. Open the next topic from"
                                + " the topic list.")),
                        SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.NORMAL_PASTE)) {
                chats.addPreference(mark(toggle(context, Settings.NORMAL_PASTE, L10n.t("Use normal paste"),
                        PatchFamily.NORMAL_PASTE.coverageSummary(L10n.t("Pastes text exactly as you copied it, without Telegram adding formatting, tables"
                                + " or code styling. Spaces and links stay as they were."))), SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.SHOW_LOCAL_IDS)) {
                chats.addPreference(mark(toggle(context, Settings.SHOW_LOCAL_IDS, L10n.t("Show user and chat IDs"),
                        PatchFamily.SHOW_LOCAL_IDS.coverageSummary(L10n.t("Adds a copyable ID number for a user or chat to the profile's menu. Telegram "
                                + "isn't asked for anything extra."))), SettingsIcons.CHAT));
                chats.addPreference(mark(toggle(context, Settings.PROFILE_DATA_CENTER, L10n.t("Show where a profile photo is stored"),
                        L10n.t("A profile's menu also shows which of Telegram's five data centers (its server "
                                + "locations) stores the profile photo. No photo, no number.")),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.DISABLE_DOUBLE_TAP_REACTIONS)) {
                chats.addPreference(mark(toggle(context, Settings.DISABLE_DOUBLE_TAP_REACTIONS, L10n.t("Disable double-tap reactions"),
                        PatchFamily.DISABLE_DOUBLE_TAP_REACTIONS.coverageSummary(L10n.t("Double-tapping a message no longer adds a reaction. Scrolling, normal taps, "
                                + "selecting and the reaction menu work as before."))), SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.HOLIDAY_LOOK)) {
                chats.addPreference(mark(toggle(context, Settings.HOLIDAY_LOOK, L10n.t("New Year look all year"),
                        PatchFamily.HOLIDAY_LOOK.coverageSummary(L10n.t("Shows Telegram's Santa hat and New Year snow all year, not only around New Year."
                                + " Snow also falls on chat backgrounds if animated backgrounds are on."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.USE_SYSTEM_FONT)) {
                chats.addPreference(mark(toggle(context, Settings.USE_SYSTEM_FONT, L10n.t("Use system font"),
                        PatchFamily.USE_SYSTEM_FONT.coverageSummary(L10n.t("Bold, italic and code text use your phone's font instead of Telegram's built-in "
                                + "one. Restart Telegram to see the change."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.AMOLED_BLACK)) {
                chats.addPreference(mark(toggle(context, Settings.AMOLED_BLACK, L10n.t("AMOLED black"),
                        PatchFamily.AMOLED_BLACK.coverageSummary(L10n.t("Night and Dark themes use pure black screens. Message bubbles and menus keep "
                                + "their colors. Restart Telegram to see the change."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.HIDE_TRANSLATE_BAR)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_TRANSLATE_BAR, L10n.t("Hide translate bar"),
                        PatchFamily.HIDE_TRANSLATE_BAR.coverageSummary(L10n.t("Chats in another language stop showing the translate bar at the top. Translate "
                                + "moves to the chat's menu, and a chat you're translating keeps its bar."))),
                        SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.EXACT_NUMBERS)) {
                chats.addPreference(mark(toggle(context, Settings.EXACT_NUMBERS, L10n.t("Exact numbers"),
                        PatchFamily.EXACT_NUMBERS.coverageSummary(L10n.t("Member, subscriber, view, reply and reaction counts show in full, like 12,345 "
                                + "instead of 12.3K."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.REVEAL_SPOILERS)) {
                chats.addPreference(mark(toggle(context, Settings.REVEAL_SPOILERS, L10n.t("Reveal spoilers"),
                        PatchFamily.REVEAL_SPOILERS.coverageSummary(L10n.t("Spoiler text, photos and videos show right away without a tap. View-once media, "
                                + "sensitive content and login codes stay covered."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.HIDE_KEYBOARD_ON_SCROLL)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_KEYBOARD_ON_SCROLL, L10n.t("Hide keyboard on scroll"),
                        PatchFamily.HIDE_KEYBOARD_ON_SCROLL.coverageSummary(L10n.t("The keyboard closes when you start scrolling a chat. The emoji and sticker panel"
                                + " stays open."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.KEEP_VIDEOS_MUTED)) {
                chats.addPreference(mark(toggle(context, Settings.KEEP_VIDEOS_MUTED, L10n.t("Keep videos muted on volume keys"),
                        PatchFamily.KEEP_VIDEOS_MUTED.coverageSummary(L10n.t("Volume keys only change the volume. They no longer start the video or round "
                                + "video on screen with sound. Tap a video to hear it."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.SWIPE_BACK_ON_PROFILES)) {
                chats.addPreference(mark(toggle(context, Settings.SWIPE_BACK_ON_PROFILES, L10n.t("Swipe back on profiles"),
                        PatchFamily.SWIPE_BACK_ON_PROFILES.coverageSummary(L10n.t("Swiping right on a profile's photos or media tabs goes back, like the rest of "
                                + "the profile, instead of showing the previous photo or tab."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.HIDE_PHONE_NUMBER)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_PHONE_NUMBER, L10n.t("Hide phone number"),
                        PatchFamily.HIDE_PHONE_NUMBER.coverageSummary(L10n.t("Your own phone number shows as dots in the side menu, Settings and your profile,"
                                + " which helps with screenshots. Others' numbers stay visible."))),
                        SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.MESSAGE_SECONDS)) {
                chats.addPreference(mark(toggle(context, Settings.MESSAGE_SECONDS, L10n.t("Message times with seconds"),
                        PatchFamily.MESSAGE_SECONDS.coverageSummary(L10n.t("Each message's time includes seconds, like 9:41:27 PM, so messages sent close "
                                + "together are easy to tell apart."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.ALLOW_CHAT_BLUR)) {
                chats.addPreference(mark(toggle(context, Settings.ALLOW_CHAT_BLUR, L10n.t("Allow chat blur on slower phones"),
                        PatchFamily.ALLOW_CHAT_BLUR.coverageSummary(L10n.t("Telegram only blurs chat headers and panels on fast phones. This lets any phone "
                                + "do it, once Blur in chat is on under Power saving."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.VOICE_ONE_AT_A_TIME)) {
                chats.addPreference(mark(toggle(context, Settings.VOICE_ONE_AT_A_TIME, L10n.t("Play voice messages one at a time"),
                        PatchFamily.VOICE_ONE_AT_A_TIME.coverageSummary(L10n.t("When a voice or video message ends, the next one doesn't start by itself."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.NO_HAPTICS)) {
                chats.addPreference(mark(toggle(context, Settings.NO_HAPTICS, L10n.t("Stop vibrations on taps"),
                        PatchFamily.NO_HAPTICS.coverageSummary(L10n.t("Taps, long presses, swipes and wrong entries no longer vibrate the phone. "
                                + "Incoming calls still vibrate, and notifications follow your own settings."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.REACTION_EFFECTS_OFF)) {
                chats.addPreference(mark(toggle(context, Settings.REACTION_EFFECTS_OFF, L10n.t("Turn off reaction effects"),
                        PatchFamily.REACTION_EFFECTS_OFF.coverageSummary(L10n.t("When someone reacts to a message, the emoji doesn't fly across the screen and "
                                + "burst. The reaction still shows on the message."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.HIDE_FOLDER_COUNTERS)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_FOLDER_COUNTERS, L10n.t("Hide folder tab counters"),
                        PatchFamily.HIDE_FOLDER_COUNTERS.coverageSummary(L10n.t("Folder tabs above the chat list show just their names, without unread counts. "
                                + "Chats stay unread and the app icon badge doesn't change."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.FORWARD_HIDE_SENDER)) {
                chats.addPreference(mark(toggle(context, Settings.FORWARD_HIDE_SENDER, L10n.t("Hide sender names when forwarding"),
                        PatchFamily.FORWARD_HIDE_SENDER.coverageSummary(L10n.t("Each new forward starts with Hide sender's name turned on, so copies arrive "
                                + "without the original author. You can still turn it off before sending."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.VOICE_MUSIC_PLAYER)) {
                chats.addPreference(mark(toggle(context, Settings.VOICE_MUSIC_PLAYER, L10n.t("Voice messages in the music player"),
                        PatchFamily.VOICE_MUSIC_PLAYER.coverageSummary(L10n.t("While a voice message plays, tapping the bar above the chat opens the full music"
                                + " player, where you can drag to skip around, instead of jumping to the message."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.SILENCE_NON_CONTACTS)) {
                chats.addPreference(mark(toggle(context, Settings.SILENCE_NON_CONTACTS, L10n.t("Silence people outside your contacts"),
                        PatchFamily.SILENCE_NON_CONTACTS.coverageSummary(L10n.t("Private messages from people not in your contacts still show a notification, but"
                                + " without sound or vibration. Bots, reminders and login codes keep their sound."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.DISABLE_ARCHIVE_PULL)) {
                chats.addPreference(mark(toggle(context, Settings.DISABLE_ARCHIVE_PULL, L10n.t("Disable pull to archive"),
                        PatchFamily.DISABLE_ARCHIVE_PULL.coverageSummary(L10n.t("Pulling down the chat list no longer opens the archive. Use Archived chats in "
                                + "the list's menu instead. Restart Telegram to see the change."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.REAR_CAMERA_FIRST)) {
                chats.addPreference(mark(toggle(context, Settings.REAR_CAMERA_FIRST, L10n.t("Start the camera on the rear lens"),
                        PatchFamily.REAR_CAMERA_FIRST.coverageSummary(L10n.t("The camera in the attachment menu always opens on the rear lens, not the lens "
                                + "you used last. You can still flip it."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.HIDE_GALLERY_CAMERA_TILE)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_GALLERY_CAMERA_TILE, L10n.t("Hide gallery camera tile"),
                        PatchFamily.HIDE_GALLERY_CAMERA_TILE.coverageSummary(L10n.t("The attachment menu's photo grid starts with your photos instead of a live "
                                + "camera tile. A chat picks this up the next time you open it."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.HIDE_STICKER_TIME)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_STICKER_TIME, L10n.t("Hide time on stickers"),
                        PatchFamily.HIDE_STICKER_TIME.coverageSummary(L10n.t("Stickers and big animated emoji no longer show the time and read checks in their"
                                + " corner. Other messages keep their time."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.IGNORE_MUTED_MENTIONS)) {
                chats.addPreference(mark(toggle(context, Settings.IGNORE_MUTED_MENTIONS, L10n.t("Ignore mentions in muted chats"),
                        PatchFamily.IGNORE_MUTED_MENTIONS.coverageSummary(L10n.t("Mentions and replies in groups or channels you've muted no longer notify you. "
                                + "Chats you haven't muted notify as before."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.HIDE_BLOCKED_IN_GROUPS)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_BLOCKED_IN_GROUPS, L10n.t("Hide blocked users in groups"),
                        PatchFamily.HIDE_BLOCKED_IN_GROUPS.coverageSummary(L10n.t("Messages from people you've blocked are left out of groups and supergroups you "
                                + "open. Nothing is deleted. Private chats and channel posts stay as they are."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.HIDE_FEATURES_AND_INVITE)) {
                chats.addPreference(mark(toggle(context, Settings.HIDE_FEATURES_AND_INVITE, L10n.t("Hide Telegram Features and Invite Friends"),
                        PatchFamily.HIDE_FEATURES_AND_INVITE.coverageSummary(L10n.t("Removes the Telegram Features row from Settings and Invite Friends from "
                                + "Contacts. With no contacts yet, the invite list goes too."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.MESSAGE_MENU_REPEAT)) {
                chats.addPreference(mark(toggle(context, Settings.MESSAGE_MENU_REPEAT, L10n.t("Add Repeat to the message menu"),
                        PatchFamily.MESSAGE_MENU_REPEAT.coverageSummary(L10n.t("Adds Repeat under Forward in a message's press-and-hold menu. It sends the same "
                                + "message again to the chat. Not shown in protected or secret chats."))),
                        SettingsIcons.CHAT));
                chats.addPreference(mark(toggle(context, Settings.MESSAGE_MENU_COPY_PHOTO, L10n.t("Add Copy photo to the message menu"),
                        PatchFamily.MESSAGE_MENU_REPEAT.coverageSummary(L10n.t("Adds Copy photo to a downloaded photo's press-and-hold menu, so you can paste "
                                + "the picture into another app. Not shown in protected or secret chats."))),
                        SettingsIcons.CHAT));
                chats.addPreference(mark(toggle(context, Settings.MESSAGE_MENU_DETAILS, L10n.t("Add Message details to the message menu"),
                        PatchFamily.MESSAGE_MENU_REPEAT.coverageSummary(L10n.t("Adds Message details to a message's press-and-hold menu. It shows IDs, send and "
                                + "edit times, where it was forwarded from, and file info."))),
                        SettingsIcons.CHAT));
                chats.addPreference(mark(toggle(context, Settings.MESSAGE_MENU_QUICK_FORWARD, L10n.t("Add Quick forward to the message menu"),
                        PatchFamily.MESSAGE_MENU_REPEAT.coverageSummary(L10n.t("Adds Quick forward to a message's press-and-hold menu. One tap sends it to Saved"
                                + " Messages or a recent chat. Not in protected or secret chats."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.KEEP_DELETED_MESSAGES)) {
                chats.addPreference(mark(toggle(context, Settings.KEEP_DELETED_MESSAGES, L10n.t("Keep deleted messages"),
                        PatchFamily.KEEP_DELETED_MESSAGES.coverageSummary(L10n.t("Messages others delete stay in your chat on this phone, marked deleted next to "
                                + "the time. Your own deletes and disappearing messages work as usual."))),
                        SettingsIcons.CHAT));
                chats.addPreference(mark(clearKeptRow(context), SettingsIcons.DELETE));
            }
            if (build.contains(PatchFamily.ASK_BEFORE_STICKER)) {
                chats.addPreference(mark(toggle(context, Settings.ASK_BEFORE_STICKER, L10n.t("Ask before sending a sticker"),
                        PatchFamily.ASK_BEFORE_STICKER.coverageSummary(L10n.t("Asks Send or Cancel before a sticker you tap goes into a chat. Cancel drops it. "
                                + "Scheduled stickers go out without asking."))),
                        SettingsIcons.CHAT));
                chats.addPreference(mark(toggle(context, Settings.ASK_BEFORE_GIF, L10n.t("Ask before sending a GIF"),
                        PatchFamily.ASK_BEFORE_STICKER.coverageSummary(L10n.t("Asks Send or Cancel before a GIF you tap goes into a chat. Cancel drops it. "
                                + "Scheduled GIFs go out without asking."))),
                        SettingsIcons.CHAT));
                chats.addPreference(mark(toggle(context, Settings.ASK_BEFORE_VOICE_VIDEO, L10n.t("Ask before sending a voice or video message"),
                        PatchFamily.ASK_BEFORE_STICKER.coverageSummary(L10n.t("Asks Send or Cancel before a voice or video message you recorded goes out. "
                                + "Cancel throws the recording away."))),
                        SettingsIcons.CHAT));
                chats.addPreference(mark(toggle(context, Settings.ASK_BEFORE_CALL, L10n.t("Ask before starting a call"),
                        PatchFamily.ASK_BEFORE_STICKER.coverageSummary(L10n.t("Asks Call or Cancel before the call button in a chat or on a profile starts a "
                                + "call."))),
                        SettingsIcons.CHAT));
            }
            if (build.contains(PatchFamily.BETA_LOGS_OFF)) {
                chats.addPreference(mark(toggle(context, Settings.BETA_LOGS_OFF, L10n.t("Turn off beta debug logs"),
                        PatchFamily.BETA_LOGS_OFF.coverageSummary(L10n.t("Telegram Beta keeps debug logs on your phone all the time, its connection log "
                                + "included, and its own debug menu can't stop that. This stops them. Logs already saved "
                                + "stay until you clear them, and the regular build doesn't keep them, so nothing changes "
                                + "there. Restart Telegram to see the change."))),
                        SettingsIcons.BUG));
            }
        }

        if (build.contains(PatchFamily.DISABLE_ANALYTICS) || build.contains(PatchFamily.DISABLE_CALL_DEBUG)
                || build.contains(PatchFamily.DISABLE_DRAFT_PREVIEWS) || build.contains(PatchFamily.GALLERY_CAMERA_ON_TAP)) {
            PreferenceCategory privacy = category(screen, L10n.t("Privacy"));
            if (build.contains(PatchFamily.DISABLE_ANALYTICS)) {
                String usage = L10n.t("Stops usage reports to Telegram, like how long you read each channel post and what "
                        + "you tap on Premium screens. Messages and calls work as before.");
                // Only Telegram Beta carries Firebase's reporters, so only a build that stops them says so.
                if (PatchFamily.Capability.CRASH_REPORTS.installed() || PatchFamily.Capability.SESSION_REPORTS.installed()) {
                    usage = usage + " " + L10n.t("Firebase crash and session reports stop too, from the next time Telegram starts.");
                }
                privacy.addPreference(mark(toggle(context, Settings.DISABLE_ANALYTICS, L10n.t("Stop usage reports"),
                    PatchFamily.DISABLE_ANALYTICS.coverageSummary(usage)), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.DISABLE_CALL_DEBUG)) {
                privacy.addPreference(mark(toggle(context, Settings.DISABLE_CALL_DEBUG, L10n.t("Stop call diagnostics"),
                        PatchFamily.DISABLE_CALL_DEBUG.coverageSummary(L10n.t("Stops your phone from automatically sending call problem reports and log files "
                                + "when Telegram's server asks for them."))),
                        SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.DISABLE_DRAFT_PREVIEWS)) {
                privacy.addPreference(mark(toggle(context, Settings.DISABLE_DRAFT_PREVIEWS, L10n.t("No previews before sending"),
                        PatchFamily.DISABLE_DRAFT_PREVIEWS.coverageSummary(L10n.t("Telegram doesn't look up link previews for messages you haven't sent yet, "
                                + "including shares, polls, story links and bots. Sent messages still get one."))),
                        SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.GALLERY_CAMERA_ON_TAP)) {
                privacy.addPreference(mark(toggle(context, Settings.GALLERY_CAMERA_ON_TAP, L10n.t("Camera only on tap"),
                        PatchFamily.GALLERY_CAMERA_ON_TAP.coverageSummary(L10n.t("Opening the attachment gallery doesn't start the camera or ask for camera "
                                + "access. Tap the camera tile to start it."))),
                        SettingsIcons.BLOCK));
            }
        }

        if (build.contains(PatchFamily.REPAIR_FIREBASE_PUSH)) {
            PreferenceCategory notifications = category(screen, L10n.t("Notifications"));
            localNotificationStatus = info(context, L10n.t("Notification status on this phone"), FirebasePush.localStatus(context).summary());
            localNotificationStatus.setKey("local_notification_status");
            notifications.addPreference(mark(localNotificationStatus, SettingsIcons.ABOUT));
            notifications.addPreference(mark(toggle(context, Settings.REPAIR_FIREBASE_PUSH, L10n.t("Repair Firebase push registration"),
                    PatchFamily.REPAIR_FIREBASE_PUSH.coverageSummary(L10n.t("Tries to help this patched Telegram sign up for push notifications with Firebase, "
                            + "Google's notification service, using Telegram's original certificate. Notification "
                            + "permission and battery settings still apply."))), SettingsIcons.BELL));
        }

        // In every build: Telegram's own links are never verified for an app, so Android opens them
        // here only for the addresses selected on the app's Open by default page.
        PreferenceCategory links = category(screen, L10n.t("Links"));
        if (build.contains(PatchFamily.OPEN_EXTERNAL_LINKS)) {
            links.addPreference(mark(toggle(context, Settings.OPEN_EXTERNAL_LINKS, L10n.t("Open links externally"),
                    PatchFamily.OPEN_EXTERNAL_LINKS.coverageSummary(L10n.t("Opens normal web links in your browser. Telegram links, sign-in and payment pages "
                            + "keep working the way they did."))), SettingsIcons.LINKS));
        }
        if (build.contains(PatchFamily.STRIP_LINK_TRACKING)) {
            links.addPreference(mark(toggle(context, Settings.STRIP_LINK_TRACKING, L10n.t("Remove link tracking tags"),
                    PatchFamily.STRIP_LINK_TRACKING.coverageSummary(L10n.t("Removes tracking tags like utm_source, gclid and fbclid from links you open or "
                            + "share. A link with any other tag is left unchanged."))), SettingsIcons.BLOCK));
        }
        links.addPreference(mark(supportedLinksRow(context), SettingsIcons.LINKS));
        // An explanation, not a control: the info mark says so, as it does for Version on About.
        links.addPreference(mark(info(context, L10n.t("Selecting links by hand"),
                L10n.t("Android opens t.me links in this app only if you select their addresses on its Open by "
                        + "default page. Other link settings don't change.")),
                SettingsIcons.ABOUT));

        // In every build: the release check is the settings entry's own, not a patch's. Its switch
        // is one Pause turns off, so it sits above the Pause row with the rest.
        PreferenceCategory updates = category(screen, L10n.t("Updates"));
        if (build.contains(PatchFamily.DISABLE_UPDATE_CHECKS)) {
            updates.addPreference(mark(toggle(context, Settings.DISABLE_UPDATE_CHECKS, L10n.t("Turn off Telegram's update checks"),
                    L10n.t("Telegram stops offering updates from telegram.org. Those can't install over this patched "
                            + "build, so patch each new version in Morphe Manager instead.")), SettingsIcons.BLOCK));
        }
        updates.addPreference(mark(toggle(context, Settings.CHECK_FOR_RELEASES, L10n.t("Check for new HushTelegram releases"),
                L10n.t("Once a day, when Telegram starts, checks GitHub for a newer HushTelegram and shows it at"
                        + " the top of these settings. Nothing is downloaded.")), SettingsIcons.BELL));
        updates.addPreference(mark(checkNowRow(context), SettingsIcons.UPDATES));
        ReleaseCheck.watch(this);

        PreferenceCategory pause = category(screen, L10n.t("Pause"));
        pause.addPreference(mark(toggle(context, BaseSettings.PAUSED, L10n.t("Pause HushTelegram"),
                L10n.t("After Telegram restarts, every switch except Debug logging acts as if it were off. Your "
                        + "choices stay saved. Edits made when you patched stay in.")), SettingsIcons.PATCHED));
        String stays = PatchFamily.staysWhilePausedSummary(build);
        if (stays != null) pause.addPreference(mark(info(context, L10n.t(STAYS_WHILE_PAUSED), stays), SettingsIcons.ABOUT));

        PreferenceCategory backup = category(screen, L10n.t("Settings backup"));
        // Morphe Manager can export the patch choices and the signing key, not these switches.
        backup.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.EXPORT,
                L10n.t("Export settings"),
                L10n.t("Saves your switch choices to a file, for all accounts in this Telegram app. Pause, Debug"
                        + " logging and the update check aren't included.")), SettingsIcons.EXPORT));
        // The preview gives a count of the switches, not each switch by name.
        backup.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.IMPORT,
                L10n.t("Import settings"),
                L10n.t("Loads switch choices from a saved file. You see how many switches it will change before "
                        + "anything is applied. It applies to all accounts.")), SettingsIcons.DOWNLOADS));
        PreferenceCategory diagnostics = category(screen, L10n.t("Diagnostics"));
        // Debug logging also fills the exported report and turns on error toasts (Logger).
        diagnostics.addPreference(mark(toggle(context, BaseSettings.DEBUG, L10n.t("Debug logging"),
                L10n.t("Records what HushTelegram does and shows error messages, to help with a bug report. "
                        + "Leave it off for everyday use.")), SettingsIcons.BUG));
        // Both rows come without a title of their own: Hushfeed's gave them one from string
        // resources that Telegram's APK doesn't have, and untitled they showed as blank rows.
        ExportDiagnosticReportPreference export = new ExportRow(context);
        export.setTitle(L10n.t("Export diagnostic report"));
        export.setSummary(L10n.t("Copy a short report or save the full one to Download/Morphe. Links, IDs and sign-in details are "
                + "left out. Look it over before sharing."));
        diagnostics.addPreference(mark(export, SettingsIcons.LICENSE));
        ClearLogBufferPreference clear = new ClearRow(context);
        clear.setTitle(L10n.t("Clear diagnostic data"));
        clear.setClearAndUndoSummaries(L10n.t("Clears the activity log and patch checks that a report would include."),
                L10n.t("Diagnostic data cleared. Tap again to put it back."));
        diagnostics.addPreference(mark(clear, SettingsIcons.DELETE));

        PreferenceCategory about = category(screen, L10n.t("About"));
        about.addPreference(mark(info(context, L10n.t("Version"), L10n.f("HushTelegram %1$s on Telegram %2$s",
                L10n.isolate(Utils.getPatchesReleaseVersion()), L10n.isolate(Utils.getAppVersionName()))), SettingsIcons.ABOUT));
        // Switches live in one application-wide store, while Telegram can hold several accounts.
        about.addPreference(mark(info(context, L10n.t("Accounts"), L10n.t("Every switch here applies to all the "
                + "accounts in this Telegram app, not only the one you have open.")), SettingsIcons.ABOUT));

        Preference source = new Row(context);
        source.setTitle(L10n.t("Source code and issues"));
        source.setSummary(SOURCE_ADDRESS);
        source.setPersistent(false);
        source.setOnPreferenceClickListener(p -> {
            try {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(SOURCE_URL)));
            } catch (ActivityNotFoundException | SecurityException missing) {
                // No browser, or none switched on. Uncaught, Android's exception closed Telegram.
                Logger.printInfo(() -> "No app opened the source code link");
                Utils.showToastLong(L10n.f("No app on this phone can open the link. The address is %1$s.",
                        L10n.isolate(SOURCE_ADDRESS)));
            }
            return true;
        });
        about.addPreference(mark(source, SettingsIcons.OPENING));

        // Section 7b asks that its notice reach the person using the software, and a file in the
        // repository does not reach them.
        Preference licenses = new Row(context);
        licenses.setTitle(L10n.t("Licenses"));
        licenses.setSummary(L10n.t("The GPL-3.0 license, and credits for the projects HushTelegram is built on"));
        licenses.setPersistent(false);
        licenses.setOnPreferenceClickListener(p -> {
            showNotice(context);
            return true;
        });
        about.addPreference(mark(licenses, SettingsIcons.LICENSE));
    }

    /**
     * Straight to one section: two taps reach any section from the top, and Back goes back once to
     * where the list was.
     */
    private Preference jumpRow(Context context) {
        Row row = new Row(context);
        row.setKey("action_jump_to_section");
        row.setPersistent(false);
        row.setTitle(L10n.t("Jump to a section"));
        row.setSummary(L10n.t("Go straight to one group of settings. Back returns to where you were."));
        row.setOnPreferenceClickListener(p -> {
            showSections(context);
            return true;
        });
        return row;
    }

    /** The page's section titles in the order they're on the page; a tap on one goes there. */
    void showSections(Context context) {
        List<Preference> sections = sections();
        CharSequence[] titles = new CharSequence[sections.size()];
        for (int i = 0; i < titles.length; i++) titles[i] = sections.get(i).getTitle();
        show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Jump to a section"))
                .setItems(titles, (dialog, which) -> jumpTo(sections.get(which)))
                .setNegativeButton(L10n.t("Cancel"), null));
    }

    /**
     * Shows [builder]'s dialog in the screen's colours, and closes it with the page's view. Nothing
     * shows once the view is gone or the activity is finishing: the dialog would come up over a
     * window that's gone.
     */
    private void show(AlertDialog.Builder builder) {
        Activity activity = getActivity();
        if (getView() == null || activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        AlertDialog dialog = builder.show();
        ScreenColors.dialog(dialog);
        shownDialogs.add(dialog);
        dialog.setOnDismissListener(shownDialogs::remove);
    }

    /** The section headings on the page, in order. */
    List<Preference> sections() {
        List<Preference> sections = new ArrayList<>();
        PreferenceScreen screen = getPreferenceScreen();
        for (int i = 0; screen != null && i < screen.getPreferenceCount(); i++) {
            Preference preference = screen.getPreference(i);
            if (preference instanceof PreferenceCategory) sections.add(preference);
        }
        return sections;
    }

    /**
     * Scrolls [section]'s heading to the top of the list, and remembers where the list was for
     * Back. Looked up in the list's own adapter, so it lands right however the page is flattened.
     */
    boolean jumpTo(Preference section) {
        if (navigation != null) return navigation.open(section);
        ListView list = listView();
        if (list == null || list.getAdapter() == null) return false;
        for (int position = 0; position < list.getAdapter().getCount(); position++) {
            if (list.getAdapter().getItem(position) != section) continue;
            View first = list.getChildAt(0);
            beforeJump = new int[] {list.getFirstVisiblePosition(), first == null ? 0 : first.getTop()};
            list.setSelectionFromTop(position, 0);
            return true;
        }
        return false;
    }

    /** Back after a jump: the list goes back to where it was, once, and the page stays open. */
    boolean backFromJump() {
        if (navigation != null) return navigation.back();
        int[] before = beforeJump;
        if (before == null) return false;
        beforeJump = null;
        ListView list = listView();
        if (list == null) return false;
        list.setSelectionFromTop(before[0], before[1]);
        return true;
    }

    @Nullable
    private ListView listView() {
        View view = getView();
        return view == null ? null : view.findViewById(android.R.id.list);
    }

    /**
     * The first row: whether HushTelegram is on, and why not when it isn't. Paused by safe mode or
     * the marker file, a tap turns it back on from the next start.
     */
    private Preference statusCard(Context context) {
        Row card = new Row(context);
        card.setPersistent(false);
        boolean paused = HushTelegramPause.isPaused();
        ScreenColors palette = ScreenColors.DEFAULT;
        card.setIcon(SettingsIcons.icon(context, paused ? SettingsIcons.PAUSE : SettingsIcons.PATCHED,
                paused ? palette.summary : palette.heading));
        statusCard = card;
        if (!paused) {
            card.setTitle(L10n.t("HushTelegram is on"));
            card.setSelectable(false);
            showStatus(card, context);
            return card;
        }
        card.setTitle(L10n.t("HushTelegram is paused"));
        showStatus(card, context);
        // A tap acts at once, taking the pause off the next start, and the card says so in words.
        card.actsAtOnce = true;
        card.setOnPreferenceClickListener(p -> {
            resumeFromOverview();
            return true;
        });
        return card;
    }

    void resumeFromOverview() {
        Context context = getContext();
        if (context == null || statusCard == null) return;
        HushTelegramPause.Reason still = HushTelegramPause.turnBackOn(context);
        // The switch shows what was kept. Setting it to off here would write off through the
        // preference itself when the store had just refused to.
        Preference pause = findPreference(BaseSettings.PAUSED.key);
        if (pause instanceof SwitchPreference) ((SwitchPreference) pause).setChecked(BaseSettings.PAUSED.savedValue());
        if (still == HushTelegramPause.Reason.MARKER_FILE) {
            String file = L10n.isolate(HushTelegramPause.MARKER_FILE_NAME);
            String folder = L10n.isolate(markerFolder(context.getPackageName()));
            // The switches stay as they were until the file goes, so say when they still pause.
            String left = BaseSettings.PAUSED.savedValue() || BaseSettings.SAFE_MODE.savedValue()
                    ? L10n.f("The file %1$s couldn't be removed. Delete it from %2$s, then tap Resume again.", file, folder)
                    : L10n.f("The file %1$s couldn't be removed. Delete it from %2$s to turn HushTelegram back on.",
                    file, folder);
            statusCard.setSummary(left);
            // Resume can be tapped on a category page too, where the card isn't in view.
            Utils.showToastLong(left);
            return;
        }
        if (still != HushTelegramPause.Reason.NONE) {
            Utils.showToastLong(L10n.t("Couldn't turn HushTelegram back on. Try again."));
        }
        showStatus(statusCard, context);
    }

    /**
     * The card's line under its title: this start's state, and the next start's when a change on
     * this screen makes it differ. Pause switched on said "HushTelegram is on" and nothing more,
     * and Pause switched back on after a tap on the card still said it turns back on at restart.
     * A newer release the release check found goes on a line of its own under that, paused or
     * not: a newer release can be the fix for what a pause is working around.
     */
    private void showStatus(Preference card, Context context) {
        boolean pausedNext = HushTelegramPause.pausesNextStart(context);
        String status;
        if (!HushTelegramPause.isPaused()) {
            // The version lives on the About page. Here it pushed the line that matters below it.
            status = pausedNext ? L10n.t("HushTelegram pauses when Telegram restarts.") : L10n.t("Your switches are working.");
        } else if (pausedNext) {
            status = pausedSummary(HushTelegramPause.reason(), context.getPackageName())
                    + " " + L10n.t("Tap to turn it back on.");
        } else {
            status = L10n.t("HushTelegram turns back on when Telegram restarts.");
        }
        String release = ReleaseCheck.statusLine();
        card.setSummary(release == null ? status : status + "\n" + release);
    }

    /**
     * Asks GitHub for the newest release now, and says what the last try found. The tap is the
     * request for that one check, so it runs with the switch off too.
     */
    private Preference checkNowRow(Context context) {
        Row row = new Row(context);
        row.setKey(CHECK_NOW);
        row.setTitle(L10n.t("Check now"));
        row.setPersistent(false);
        // The tap starts the check and the row says how it went: nothing opens, so no chevron.
        row.actsAtOnce = true;
        row.setSummary(ReleaseCheck.checkNowSummary());
        row.setOnPreferenceClickListener(p -> {
            if (!ReleaseCheck.checkNow()) Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
            p.setSummary(ReleaseCheck.checkNowSummary());
            return true;
        });
        checkNowRow = row;
        return row;
    }

    /**
     * The way out of Keep deleted messages: a tap hands every message it kept, in every signed-in
     * account, to Telegram's own deletion and says how many went. The tap is the whole request, so
     * nothing asks first and nothing opens.
     */
    private static Preference clearKeptRow(Context context) {
        Row row = new Row(context);
        row.setKey(CLEAR_KEPT);
        row.setPersistent(false);
        row.setTitle(L10n.t("Clear kept messages"));
        row.setSummary(L10n.t("Deletes the messages this phone kept after others deleted them, in every account, the way "
                + "Telegram would have."));
        row.actsAtOnce = true;
        row.setOnPreferenceClickListener(p -> {
            Utils.showToastLong(KeepDeleted.clearedMessage(KeepDeleted.clear()));
            return true;
        });
        return row;
    }

    /**
     * What Android says about sending Telegram's web addresses here, and the way to its page for
     * them (Morphe Manager #1028). The page opens over Telegram, so the row reads the state again
     * on the way back.
     */
    private Preference supportedLinksRow(Context context) {
        Row row = new Row(context);
        row.setKey(SUPPORTED_LINKS);
        row.setTitle(L10n.t("Supported links"));
        row.setPersistent(false);
        row.setSummary(SupportedLinks.summary(SupportedLinks.read(context)));
        row.setOnPreferenceClickListener(p -> {
            openLinkSettings(context);
            return true;
        });
        return row;
    }

    private void showSupportedLinks() {
        if (getPreferenceScreen() == null) return;
        Preference row = findPreference(SUPPORTED_LINKS);
        if (row != null) row.setSummary(SupportedLinks.summary(SupportedLinks.read(row.getContext())));
    }

    private void openLinkSettings(Context context) {
        for (Intent page : SupportedLinks.settingsIntents(context)) {
            try {
                startActivity(page);
                return;
            } catch (ActivityNotFoundException | SecurityException missing) {
                // A phone without Open by default still has the app's own page, which leads there.
            }
        }
        Logger.printInfo(() -> "No settings page opened for supported links");
        Utils.showToastLong(L10n.t("Android's settings for this app didn't open. Open App info from Telegram's icon, "
                + "then Open by default."));
    }

    /** A switch whose change waits for a restart: the card says what the next start brings. */
    @Override
    protected void onRestartPendingChanged() {
        Preference card = statusCard;
        Context context = getContext();
        if (card != null && context != null) showStatus(card, context);
    }

    /**
     * Why this start runs paused, what a pause does and doesn't reach, and that nothing the reader
     * saved has changed.
     */
    static String pausedSummary(HushTelegramPause.Reason reason, String packageName) {
        String why;
        switch (reason) {
            case CRASH_LOOP:
                // Only a crash, a native crash or a hang counts toward safe mode (HushTelegramPause).
                why = L10n.t("Telegram crashed or froze within a minute of starting three times in a row, so "
                        + "HushTelegram paused itself.");
                break;
            case MARKER_FILE:
                why = L10n.f("A file named %1$s in %2$s paused HushTelegram.",
                        L10n.isolate(HushTelegramPause.MARKER_FILE_NAME), L10n.isolate(markerFolder(packageName)));
                break;
            default:
                why = L10n.t("You paused HushTelegram.");
                break;
        }
        return why + " " + L10n.t("Every switch except Debug logging acts as if it were off. Edits made when you patched stay in. "
                + "Your choices stay saved.");
    }

    /**
     * Where the marker file goes, the way a file manager shows it: the app's own files folder, not
     * the folder above it, which is the one a person finds first.
     */
    static String markerFolder(String packageName) {
        return "Android/data/" + packageName + "/files";
    }

    /**
     * The theme every row and dialog on this screen is built with, over Telegram's own: dark
     * Material, which the black page reads on whatever the host activity's theme is.
     */
    static Context themed(Context base) {
        return new ContextThemeWrapper(base, ScreenColors.THEME);
    }

    /** The recovery page draws on the same page as the rows, so it gets the same theme. */
    @Override
    protected Context pageContext(Activity activity) {
        return themed(activity);
    }

    @Override
    protected ErrorActionStyler errorActionStyler() {
        return ScreenColors::recoveryAction;
    }

    @Override
    protected void styleInitializationMessage(View row) {
        ScreenColors.recoveryMessage(row);
    }

    private static PreferenceCategory category(PreferenceScreen screen, String title) {
        PreferenceCategory category = new Heading(screen.getContext());
        category.setTitle(title);
        screen.addPreference(category);
        return category;
    }

    static SwitchPreference toggle(Context context, BooleanSetting setting, String title, String summary) {
        SwitchPreference preference = new Toggle(context);
        preference.setKey(setting.key);
        preference.setTitle(title);
        preference.setSummary(summary);
        return preference;
    }

    private static Preference mark(Preference row, String icon) {
        row.setIcon(SettingsIcons.icon(row.getContext(), icon, ScreenColors.DEFAULT.heading));
        return row;
    }

    private static Preference info(Context context, String title, String summary) {
        Preference preference = new Row(context);
        preference.setTitle(title);
        preference.setSummary(summary);
        preference.setSelectable(false);
        preference.setPersistent(false);
        return preference;
    }

    /**
     * Lets a row's title and summary wrap to as many lines as they need. Android draws a row's
     * title on one line and cuts its summary at ten, and at 200% text size the paused card, the
     * Pause row and the list of what Pause can't reach ran past ten lines and lost their ends.
     */
    static void showAllText(View row) {
        TextView title = row.findViewById(android.R.id.title);
        if (title != null) {
            title.setSingleLine(false);
            title.setMaxLines(Integer.MAX_VALUE);
        }
        TextView summary = row.findViewById(android.R.id.summary);
        if (summary != null) summary.setMaxLines(Integer.MAX_VALUE);
    }

    /** A section title, which a screen reader announces as a heading so a reader can jump between sections. */
    static final class Heading extends PreferenceCategory {
        Heading(Context context) {
            super(context);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            view.setAccessibilityHeading(true);
            showAllText(view);
            ScreenColors.heading(view);
        }
    }

    /** A row of text, which a screen reader calls a button when a tap does something. */
    static final class Row extends Preference implements ImmediateAction {
        /** Set on a row whose tap does what it says at once, which then goes without a chevron. */
        boolean actsAtOnce;

        Row(Context context) {
            super(context);
        }

        @Override
        public boolean actsOnTap() {
            return actsAtOnce;
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(isSelectable() ? new RowSemantics(this, Button.class) : null);
        }
    }

    /** A switch row, which a screen reader calls a switch and reads as on or off. */
    static final class Toggle extends SwitchPreference {
        Toggle(Context context) {
            super(context);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Switch.class));
        }
    }

    static final class ExportRow extends ExportDiagnosticReportPreference {
        ExportRow(Context context) {
            super(context);
        }

        /** The two choices as cards, each saying what it does under its name. */
        @Override
        protected ListAdapter choices(Context dialogContext) {
            ScreenColors colors = ScreenColors.DEFAULT;
            return new ChoiceCards(colors,
                    new CharSequence[]{L10n.t(getContext(), "Copy quick report"),
                            L10n.t(getContext(), "Save full report")},
                    new CharSequence[]{L10n.t(getContext(), "Copy a short report to the clipboard."),
                            L10n.t(getContext(), "Save the full report in Download/Morphe.")});
        }

        /**
         * The screen's colours, before the dialog is shown so its first layout measures them. The
         * cards bring their own spacing and press ripple, so the list draws no divider and no
         * highlight of its own over them.
         */
        @Override
        protected void onDialogCreated(AlertDialog dialog) {
            ListView list = dialog.getListView();
            if (list != null) {
                list.setDivider(null);
                list.setSelector(new ColorDrawable(Color.TRANSPARENT));
            }
            ScreenColors.dialog(dialog);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }
    }

    static final class ClearRow extends ClearLogBufferPreference {
        ClearRow(Context context) {
            super(context);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }
    }

    /** Export settings or Import settings. */
    static final class BackupRow extends SettingsBackupPreference {
        BackupRow(HushTelegramPreferenceFragment page, Context context, int action, String title, String summary) {
            super(page, context, action, title, summary);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }
    }

    /**
     * What a screen reader hears about a row a tap acts on. The list itself gives such a row its
     * place and a click action and no role, and the switch drawn in a switch row can't take
     * focus, so on its own a switch row said neither that it was a switch nor whether it was on.
     * A double tap goes through the list, the way a tap does, so the preference's own click runs.
     */
    static final class RowSemantics extends View.AccessibilityDelegate {
        private final Preference preference;
        private final Class<? extends View> role;

        RowSemantics(Preference preference, Class<? extends View> role) {
            this.preference = preference;
            this.role = role;
        }

        @Override
        public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(host, info);
            AbsListView list = listOf(host);
            int position = list == null ? AdapterView.INVALID_POSITION : list.getPositionForView(host);
            if (position != AdapterView.INVALID_POSITION) {
                list.onInitializeAccessibilityNodeInfoForItem(host, position, info);
            }
            info.setClassName(role.getName());
            if (preference instanceof TwoStatePreference) {
                info.setCheckable(true);
                info.setChecked(((TwoStatePreference) preference).isChecked());
            }
            if (preference.isEnabled() && !info.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK)) {
                info.setClickable(true);
                info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK);
            }
        }

        @Override
        public void onInitializeAccessibilityEvent(View host, AccessibilityEvent event) {
            super.onInitializeAccessibilityEvent(host, event);
            // The click event is what a screen reader answers a double tap with, so it carries the
            // state the tap left.
            event.setClassName(role.getName());
            if (preference instanceof TwoStatePreference) {
                event.setChecked(((TwoStatePreference) preference).isChecked());
            }
        }

        @Override
        public boolean performAccessibilityAction(View host, int action, Bundle arguments) {
            AbsListView list = listOf(host);
            if (action == AccessibilityNodeInfo.ACTION_CLICK && list != null && preference.isEnabled()) {
                int position = list.getPositionForView(host);
                if (position != AdapterView.INVALID_POSITION) {
                    return list.performItemClick(host, position, list.getItemIdAtPosition(position));
                }
            }
            return super.performAccessibilityAction(host, action, arguments);
        }

        @Nullable
        private static AbsListView listOf(View row) {
            return row.getParent() instanceof AbsListView ? (AbsListView) row.getParent() : null;
        }
    }

    /**
     * The notice itself stays in English, as the licence texts it carries are: a translation of
     * the GPL is not the licence.
     */
    private void showNotice(Context context) {
        TextView text = new TextView(context);
        // NOTICE is hard-wrapped for a source file. Reflow prose on a narrow screen while keeping
        // blank lines, headings, lists and the generated notice itself intact.
        String notice = LicenseNotice.TEXT.replaceAll("(?<=[\\p{L}.,;])\\n(?=\\p{L})", " ")
                .replaceAll("(?m)^(  .+?) {2,}(https?://[^\\n]+)$", "$1\n$2\n");
        ScreenColors colors = ScreenColors.DEFAULT;
        text.setText(noticeForScreen(notice, colors.title));
        text.setTextIsSelectable(true);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        text.setBreakStrategy(Layout.BREAK_STRATEGY_HIGH_QUALITY);
        int pad = Math.round(16 * context.getResources().getDisplayMetrics().density);
        text.setPadding(pad, pad, pad, pad);
        text.setLineSpacing(Math.round(2 * context.getResources().getDisplayMetrics().density), 1.04f);
        ScrollView scroll = new ScrollView(context);
        scroll.addView(text);
        text.setTextColor(colors.summary);
        text.setLinkTextColor(colors.heading);
        Linkify.addLinks(text, Linkify.WEB_URLS);
        show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Licenses"))
                .setView(scroll)
                .setPositiveButton(L10n.t("OK"), null));
    }

    /**
     * NOTICE marks its headings with a line of = or - under them, which reads as a heading in a
     * text file and as a row of symbols on a phone. The heading turns bold and the rule goes, and
     * so does a rule standing alone between notices, since the blank lines already part them.
     */
    static CharSequence noticeForScreen(String notice, int headingColor) {
        Matcher heading = Pattern.compile("(?m)^(\\S[^\\n]*)\\n[=-]{3,}$").matcher(notice);
        SpannableStringBuilder shown = new SpannableStringBuilder();
        int at = 0;
        while (heading.find()) {
            shown.append(notice, at, heading.start());
            int start = shown.length();
            shown.append(heading.group(1));
            shown.setSpan(new StyleSpan(Typeface.BOLD), start, shown.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            shown.setSpan(new ForegroundColorSpan(headingColor), start, shown.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            at = heading.end();
        }
        shown.append(notice, at, notice.length());
        for (Matcher rule = Pattern.compile("(?m)^[=-]{3,}\\n").matcher(shown); rule.find(); rule.reset(shown)) {
            shown.delete(rule.start(), rule.end());
        }
        for (Matcher gap = Pattern.compile("\\n{4,}").matcher(shown); gap.find(); gap.reset(shown)) {
            shown.replace(gap.start(), gap.end(), "\n\n\n");
        }
        return shown;
    }

    @Override
    protected CharSequence initializationErrorTitle(@Nullable Context context) {
        return L10n.t(context, "HushTelegram settings couldn't open");
    }
}
