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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Typeface;
import android.net.ConnectivityManager;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;
import android.text.Spanned;
import android.text.style.StyleSpan;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.FailingStore;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtelegram.extension.shared.settings.preference.ImmediateAction;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManager;
import app.hushtelegram.extension.telegram.misc.DataSaverDownloads;
import app.hushtelegram.extension.telegram.misc.DataSaverDownloadsForTests;
import app.hushtelegram.extension.telegram.misc.HiddenChats;
import app.hushtelegram.extension.telegram.misc.HiddenChatsForTests;
import app.hushtelegram.extension.telegram.misc.LaunchFolder;
import app.hushtelegram.extension.telegram.misc.LaunchFolderForTests;
import app.hushtelegram.extension.telegram.misc.MessageFilters;
import app.hushtelegram.extension.telegram.misc.OutsideTranslate;
import app.hushtelegram.extension.telegram.misc.OutsideTranslateForTests;

import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Pattern;

/**
 * The settings screen as it draws inside Telegram: a black page whose rows must be readable, and a
 * row for each patch this build carries and none for the rest.
 *
 * <p>On a phone on 2026-09-24 every row title was near-black on black, because the rows took the
 * host's light activity theme, and the two diagnostics rows had no text at all.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class HushTelegramPreferenceFragmentTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Wording that tells the reader a paused Telegram is an unpatched one, which it isn't. */
    private static final Pattern UNPATCHED = Pattern.compile("(?i)unpatched|n't patched|not patched|as if it weren");

    /** What the Data Saver switch does, before the line with what Android reports. */
    private static final String DATA_SAVER_SUMMARY = "While Android's Data Saver is on and the network is metered, Telegram"
            + " doesn't start photos, videos, files, voice messages, music or stories downloading on its own, and stops the"
            + " ones in its download queue. What you tap still downloads.";

    /** The row each patch adds, by the title it shows. */
    private static final Map<PatchFamily, String> ROW_TITLES = new LinkedHashMap<>();

    @Before
    public void initializeRowTitlesAfterTheContextIsReady() {
        ROW_TITLES.clear();
        ROW_TITLES.put(PatchFamily.HIDE_ADS, "Hide ads");
        ROW_TITLES.put(PatchFamily.HIDE_STORIES, "Hide Stories");
        ROW_TITLES.put(PatchFamily.HIDE_RECOMMENDATIONS, "Hide recommendations");
        ROW_TITLES.put(PatchFamily.HIDE_COMMERCE, "Hide Premium, gifts and Stars");
        ROW_TITLES.put(PatchFamily.HIDE_PROMOTIONAL_BANNERS, "Hide promotional banners");
        ROW_TITLES.put(PatchFamily.HIDE_SPONSORED_PROXY, "Hide sponsored proxy channel");
        ROW_TITLES.put(PatchFamily.HIDE_POPULAR_APPS, "Hide popular apps");
        ROW_TITLES.put(PatchFamily.HIDE_CONTACTS_BLOCK, "Hide contacts on Telegram");
        ROW_TITLES.put(PatchFamily.HIDE_GREETING_STICKERS, "Hide greeting stickers");
        ROW_TITLES.put(PatchFamily.DISABLE_CHAT_SWIPE, "No swipe actions on chats");
        ROW_TITLES.put(PatchFamily.DISABLE_CHANNEL_PULL, "Stop pull to next channel");
        ROW_TITLES.put(PatchFamily.NORMAL_PASTE, "Use normal paste");
        ROW_TITLES.put(PatchFamily.SHOW_LOCAL_IDS, "Show user and chat IDs");
        ROW_TITLES.put(PatchFamily.DISABLE_DOUBLE_TAP_REACTIONS, "Disable double-tap reactions");
        ROW_TITLES.put(PatchFamily.QUIET_CONTACTS_NAG, "Quiet contacts prompts");
        ROW_TITLES.put(PatchFamily.HOLIDAY_LOOK, "New Year look all year");
        ROW_TITLES.put(PatchFamily.USE_SYSTEM_FONT, "Use system font");
        ROW_TITLES.put(PatchFamily.AMOLED_BLACK, "AMOLED black");
        ROW_TITLES.put(PatchFamily.HIDE_TRANSLATE_BAR, "Hide translate bar");
        ROW_TITLES.put(PatchFamily.EXACT_NUMBERS, "Exact numbers");
        ROW_TITLES.put(PatchFamily.REVEAL_SPOILERS, "Reveal spoilers");
        ROW_TITLES.put(PatchFamily.HIDE_KEYBOARD_ON_SCROLL, "Hide keyboard on scroll");
        ROW_TITLES.put(PatchFamily.KEEP_VIDEOS_MUTED, "Keep videos muted on volume keys");
        ROW_TITLES.put(PatchFamily.SWIPE_BACK_ON_PROFILES, "Swipe back on profiles");
        ROW_TITLES.put(PatchFamily.HIDE_PHONE_NUMBER, "Hide phone number");
        ROW_TITLES.put(PatchFamily.MESSAGE_SECONDS, "Message times with seconds");
        ROW_TITLES.put(PatchFamily.ALLOW_CHAT_BLUR, "Allow chat blur on slower phones");
        ROW_TITLES.put(PatchFamily.VOICE_ONE_AT_A_TIME, "Play voice messages one at a time");
        ROW_TITLES.put(PatchFamily.NO_HAPTICS, "Stop vibrations on taps");
        ROW_TITLES.put(PatchFamily.REACTION_EFFECTS_OFF, "Turn off reaction effects");
        ROW_TITLES.put(PatchFamily.HIDE_FOLDER_COUNTERS, "Hide folder tab counters");
        ROW_TITLES.put(PatchFamily.CHAT_TYPE_FOLDERS, "Folders by chat type");
        ROW_TITLES.put(PatchFamily.FORWARD_HIDE_SENDER, "Hide sender names when forwarding");
        ROW_TITLES.put(PatchFamily.VOICE_MUSIC_PLAYER, "Voice messages in the music player");
        ROW_TITLES.put(PatchFamily.SILENCE_NON_CONTACTS, "Silence people outside your contacts");
        ROW_TITLES.put(PatchFamily.DISABLE_ARCHIVE_PULL, "Disable pull to archive");
        ROW_TITLES.put(PatchFamily.REAR_CAMERA_FIRST, "Start the camera on the rear lens");
        ROW_TITLES.put(PatchFamily.HIDE_GALLERY_CAMERA_TILE, "Hide gallery camera tile");
        ROW_TITLES.put(PatchFamily.HIDE_STICKER_TIME, "Hide time on stickers");
        ROW_TITLES.put(PatchFamily.CHANGE_STICKER_SIZE, "Change sticker size");
        ROW_TITLES.put(PatchFamily.IGNORE_MUTED_MENTIONS, "Ignore mentions in muted chats");
        ROW_TITLES.put(PatchFamily.HIDE_BLOCKED_IN_GROUPS, "Hide blocked users in groups");
        ROW_TITLES.put(PatchFamily.HIDE_BY_KEYWORD, "Hide messages by keyword");
        ROW_TITLES.put(PatchFamily.HIDE_FEATURES_AND_INVITE, "Hide Telegram Features and Invite Friends");
        ROW_TITLES.put(PatchFamily.MESSAGE_MENU_REPEAT, "Add Repeat to the message menu");
        ROW_TITLES.put(PatchFamily.KEEP_DELETED_MESSAGES, "Keep deleted messages");
        ROW_TITLES.put(PatchFamily.ASK_BEFORE_STICKER, "Ask before sending a sticker");
        ROW_TITLES.put(PatchFamily.OUTSIDE_TRANSLATE, "Translate with an outside service");
        ROW_TITLES.put(PatchFamily.HIDE_CHANNEL_BUTTONS, "Hide channel bar buttons");
        ROW_TITLES.put(PatchFamily.HIDE_SEND_AS, "Hide Send as button");
        ROW_TITLES.put(PatchFamily.HIDE_CONTACTS_TAB, "Hide Contacts tab");
        ROW_TITLES.put(PatchFamily.FASTER_DOWNLOADS, "Faster downloads");
        ROW_TITLES.put(PatchFamily.SAVE_DOWNLOADS, "Save downloaded files");
        ROW_TITLES.put(PatchFamily.DISABLE_ANALYTICS, "Stop usage reports");
        ROW_TITLES.put(PatchFamily.DISABLE_CALL_DEBUG, "Stop call diagnostics");
        ROW_TITLES.put(PatchFamily.DISABLE_DRAFT_PREVIEWS, "No previews before sending");
        ROW_TITLES.put(PatchFamily.GALLERY_CAMERA_ON_TAP, "Camera only on tap");
        ROW_TITLES.put(PatchFamily.OPEN_EXTERNAL_LINKS, "Open links externally");
        ROW_TITLES.put(PatchFamily.STRIP_LINK_TRACKING, "Remove link tracking tags");
        ROW_TITLES.put(PatchFamily.DISABLE_UPDATE_CHECKS, "Turn off Telegram's update checks");
        ROW_TITLES.put(PatchFamily.REPAIR_FIREBASE_PUSH, "Repair Firebase push registration");
        ROW_TITLES.put(PatchFamily.UNIFIED_PUSH, "UnifiedPush notifications");
    }

    /** The sections every build has, in the order they're drawn. */
    private static final List<String> EVERY_BUILD = Arrays.asList(
            "Links", "Updates", "Ways in", "Pause", "Settings backup", "Diagnostics", "About");

    /** The outside translate's own preference file, where the service and its key are kept. */
    private static final String TRANSLATE_FILE = "hushtelegram_outside_translate";

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        PatchFamily.staysWhilePausedForTests = null;
        PatchFamily.capabilitiesForTests = null;
        PauseForTests.resume();
        BaseSettings.SAFE_MODE.resetToDefault();
    }

    @Test
    public void everyRowHasATitleAndLightText() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            assertReadable(rowsOf(controller));
        }
    }

    /**
     * A test JVM has no patched status flags, so the test above sees only the rows every build
     * has. This one draws the screen with every patch in.
     */
    @Test
    public void withEveryPatchInEveryRowIsReadableAndNoneCallsAPausedTelegramUnpatched() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        // Every family in this build has a switch, so none has a staysWhilePaused of its own and
        // the row this test looks for would never be drawn for real. staysWhilePausedForTests
        // substitutes one, so the row and its wiring to the summary stay covered.
        PatchFamily.staysWhilePausedForTests = Collections.singletonMap(PatchFamily.HIDE_ADS,
                "the sponsored message cache cleared when you patched");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = rowsOf(controller);
            assertReadable(rows);

            Set<String> switchKeys = new HashSet<>();
            for (PatchFamily family : PatchFamily.values()) {
                for (BooleanSetting setting : family.switches) switchKeys.add(setting.key);
            }
            // The settings entry's own switches are Pause's to turn off too.
            for (BooleanSetting setting : PatchFamily.ENTRY_SWITCHES) switchKeys.add(setting.key);
            Set<String> shown = new HashSet<>();
            Preference stays = null;
            for (Preference row : rows) {
                String text = row.getTitle() + " " + row.getSummary();
                assertFalse("\"" + text + "\" says a paused Telegram is unpatched", UNPATCHED.matcher(text).find());
                if (row instanceof SwitchPreference && switchKeys.contains(row.getKey())) shown.add(row.getKey());
                if (HushTelegramPreferenceFragment.STAYS_WHILE_PAUSED.contentEquals(row.getTitle())) stays = row;
            }
            assertEquals("a switch Pause turns off is missing from the screen", switchKeys, shown);
            assertNotNull("nothing on the screen says what Pause can't reach", stays);
            assertEquals("Pause", stays.getParent().getTitle());
            assertEquals(PatchFamily.staysWhilePausedSummary(EnumSet.allOf(PatchFamily.class)),
                    String.valueOf(stays.getSummary()));

            // Pause covers runtime features and explicitly keeps debugging available.
            int pause = indexOfKey(rows, BaseSettings.PAUSED.key);
            assertTrue("the Pause row is missing", pause >= 0);
            for (String key : switchKeys) {
                assertTrue(key + " is drawn below the Pause row", indexOfKey(rows, key) < pause);
            }
            assertTrue("Debug logging is drawn above the Pause row", indexOfKey(rows, BaseSettings.DEBUG.key) > pause);
            assertTrue(String.valueOf(rows.get(pause).getSummary()),
                    String.valueOf(rows.get(pause).getSummary()).contains("every switch except Debug logging acts as if it were off. Your choices stay saved. Edits made when you patched stay in"));
        }
    }

    /**
     * Each patch's row is on the screen only when the patch is in the build: alone, with every
     * other patch, and not at all. A section with nothing of its build to show isn't drawn, and the
     * sections every build needs always are.
     */
    @Test
    public void theFeatureRowsAreThePatchesInThisBuild() throws Exception {
        List<Set<PatchFamily>> builds = new ArrayList<>();
        builds.add(EnumSet.noneOf(PatchFamily.class));
        for (PatchFamily family : PatchFamily.values()) builds.add(EnumSet.of(family));
        builds.add(EnumSet.allOf(PatchFamily.class));
        assertEquals("every patch needs its row here", EnumSet.allOf(PatchFamily.class), ROW_TITLES.keySet());

        List<String> wrong = new ArrayList<>();
        for (Set<PatchFamily> build : builds) {
            PatchFamily.inBuildForTests = build;
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                HushTelegramPreferenceFragment page = pageOf(controller);
                List<Preference> rows = new ArrayList<>();
                collect(page.getPreferenceScreen(), rows);
                Set<String> titles = new HashSet<>();
                for (Preference row : rows) titles.add(String.valueOf(row.getTitle()));
                for (Map.Entry<PatchFamily, String> row : ROW_TITLES.entrySet()) {
                    if (build.contains(row.getKey()) != titles.contains(row.getValue())) {
                        wrong.add(build + ": " + row.getValue() + (build.contains(row.getKey()) ? " is missing" : " is shown"));
                    }
                }
                for (PatchFamily family : PatchFamily.values()) {
                    for (BooleanSetting setting : family.switches) {
                        boolean drawn = page.findPreference(setting.key) != null;
                        if (drawn != build.contains(family)) wrong.add(build + ": " + setting.key + (drawn ? " is drawn" : " isn't drawn"));
                    }
                }

                List<String> sections = sections(page);
                // A page for each Manager category group this build has a switch in, then the pages every build has.
                Set<String> holding = new HashSet<>();
                for (PatchFamily family : build) holding.add(pageOf(family));
                List<String> expected = new ArrayList<>();
                for (String title : ManagerCategories.PAGE_ORDER) if (holding.contains(title)) expected.add(title);
                expected.addAll(EVERY_BUILD);
                if (!expected.equals(sections)) wrong.add(build + ": sections " + sections);
            }
        }
        assertEquals(Collections.emptyList(), wrong);
    }

    /** Each patch's row says what it does, in Telegram's own words. */
    @Test
    public void eachPatchsRowSaysWhatItDoes() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = pageOf(controller);
            assertEquals("Hide ads", String.valueOf(page.findPreference(Settings.HIDE_ADS.key).getTitle()));
            assertEquals("Removes sponsored messages in channels, sponsored accounts in search and ads in videos. "
                    + "They're never loaded, so none count as seen.",
                    String.valueOf(page.findPreference(Settings.HIDE_ADS.key).getSummary()));
            assertEquals("Hide Stories", String.valueOf(page.findPreference(Settings.HIDE_STORIES.key).getTitle()));
            assertEquals("Removes the story bar above your chats, the rings around profile pictures and the Post Story"
                    + " button. Profile stories and archives stay.",
                    String.valueOf(page.findPreference(Settings.HIDE_STORIES.key).getSummary()));
            assertEquals("Hide promotional banners", String.valueOf(page.findPreference(Settings.HIDE_PROMOTIONAL_BANNERS.key).getTitle()));
            assertEquals("Hides the Premium, birthday and low Stars balance banners above your chat list. Account "
                    + "security notices and other suggestions still show.",
                    String.valueOf(page.findPreference(Settings.HIDE_PROMOTIONAL_BANNERS.key).getSummary()));
            assertEquals("Hide sponsored proxy channel", String.valueOf(page.findPreference(Settings.HIDE_SPONSORED_PROXY.key).getTitle()));
            assertEquals("Hides the sponsored channel a proxy adds to your chat list and folders. Your proxy settings "
                    + "aren't touched.",
                    String.valueOf(page.findPreference(Settings.HIDE_SPONSORED_PROXY.key).getSummary()));
            assertEquals("Stop usage reports", String.valueOf(page.findPreference(Settings.DISABLE_ANALYTICS.key).getTitle()));
            assertEquals("Stops usage reports to Telegram, like how long you read each channel post and what you tap "
                    + "on Premium screens. Messages and calls work as before.",
                    String.valueOf(page.findPreference(Settings.DISABLE_ANALYTICS.key).getSummary()));
            assertEquals("Ghost mode", String.valueOf(page.findPreference(Settings.GHOST_MODE.key).getTitle()));
            assertEquals("Read chats and watch stories without anyone being told. Sending a message in a chat still "
                    + "marks it read, and your other devices keep showing it unread.",
                    String.valueOf(page.findPreference(Settings.GHOST_MODE.key).getSummary()));
            assertEquals("No read receipts", String.valueOf(page.findPreference(Settings.GHOST_READS.key).getTitle()));
            assertEquals("Messages you read stay unread for the people who sent them, in private chats, groups and "
                    + "secret chats, and voice messages you play stay unplayed. Works with Ghost mode on.",
                    String.valueOf(page.findPreference(Settings.GHOST_READS.key).getSummary()));
            assertEquals("View stories anonymously", String.valueOf(page.findPreference(Settings.GHOST_STORIES.key).getTitle()));
            assertEquals("Stories you watch don't add you to their viewer list. Works with Ghost mode on.",
                    String.valueOf(page.findPreference(Settings.GHOST_STORIES.key).getSummary()));
            assertEquals("Hide typing", String.valueOf(page.findPreference(Settings.GHOST_TYPING.key).getTitle()));
            assertEquals("Other people don't see that you're typing, recording or sending a file. Works with Ghost mode on.",
                    String.valueOf(page.findPreference(Settings.GHOST_TYPING.key).getSummary()));
            assertEquals("Hide online status", String.valueOf(page.findPreference(Settings.GHOST_ONLINE.key).getTitle()));
            assertEquals("Telegram isn't told that you're online while you use it. Going offline still goes out. "
                    + "Works with Ghost mode on.", String.valueOf(page.findPreference(Settings.GHOST_ONLINE.key).getSummary()));
            assertFalse(Settings.GHOST_TYPING.key, ((SwitchPreference) page.findPreference(Settings.GHOST_TYPING.key)).isChecked());
            assertFalse(Settings.GHOST_ONLINE.key, ((SwitchPreference) page.findPreference(Settings.GHOST_ONLINE.key)).isChecked());
            // Receipts go out as usual until Ghost mode itself is turned on; its two parts start on under it.
            assertFalse(Settings.GHOST_MODE.key, ((SwitchPreference) page.findPreference(Settings.GHOST_MODE.key)).isChecked());
            assertTrue(Settings.GHOST_READS.key, ((SwitchPreference) page.findPreference(Settings.GHOST_READS.key)).isChecked());
            assertTrue(Settings.GHOST_STORIES.key, ((SwitchPreference) page.findPreference(Settings.GHOST_STORIES.key)).isChecked());
            assertEquals("Turn off Telegram's update checks", String.valueOf(page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key).getTitle()));
            assertEquals("Telegram stops offering updates from telegram.org. Those can't install over this patched "
                    + "build, so patch each new version in Morphe Manager instead.",
                    String.valueOf(page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key).getSummary()));
            assertEquals("Stop pull to next channel", String.valueOf(page.findPreference(Settings.DISABLE_CHANNEL_PULL.key).getTitle()));
            assertEquals("Pulling up at the bottom of a channel only scrolls. Open the next channel from your chat list.",
                    String.valueOf(page.findPreference(Settings.DISABLE_CHANNEL_PULL.key).getSummary()));
            assertEquals("Stop pull to next topic", String.valueOf(page.findPreference(Settings.DISABLE_TOPIC_PULL.key).getTitle()));
            assertEquals("Pulling up at the bottom of a forum topic only scrolls. Open the next topic from the topic "
                    + "list.",
                    String.valueOf(page.findPreference(Settings.DISABLE_TOPIC_PULL.key).getSummary()));
            // Topic pulls keep Telegram's behavior until someone turns their own switch on.
            assertFalse(Settings.DISABLE_TOPIC_PULL.key,
                    ((SwitchPreference) page.findPreference(Settings.DISABLE_TOPIC_PULL.key)).isChecked());
            assertEquals("Show where a profile photo is stored", String.valueOf(page.findPreference(Settings.PROFILE_DATA_CENTER.key).getTitle()));
            assertEquals("A profile's menu also shows which of Telegram's five data centers (its server locations) "
                    + "stores the profile photo. No photo, no number.",
                    String.valueOf(page.findPreference(Settings.PROFILE_DATA_CENTER.key).getSummary()));
            // The data center row stays out of profile menus until its own switch is turned on.
            assertFalse(Settings.PROFILE_DATA_CENTER.key,
                    ((SwitchPreference) page.findPreference(Settings.PROFILE_DATA_CENTER.key)).isChecked());
            assertEquals("Repair Firebase push registration", String.valueOf(page.findPreference(Settings.REPAIR_FIREBASE_PUSH.key).getTitle()));
            assertEquals("Tries to help this patched Telegram sign up for push notifications with Firebase, Google's "
                    + "notification service, using Telegram's original certificate. Notification permission and "
                    + "battery settings still apply. A change here applies after Telegram restarts.",
                    String.valueOf(page.findPreference(Settings.REPAIR_FIREBASE_PUSH.key).getSummary()));
            assertEquals("UnifiedPush notifications", String.valueOf(page.findPreference(Settings.UNIFIED_PUSH.key).getTitle()));
            assertEquals("For phones where Firebase notifications don't arrive. Telegram signs up an address from a "
                    + "UnifiedPush app like ntfy, and Telegram's servers call it to wake Telegram when something "
                    + "arrives. The messages still come from Telegram itself. It also turns on Telegram's own Keep-Alive "
                    + "Service and Background Connection, unless you've set either one yourself. Turned off, Telegram "
                    + "goes back to Firebase the next time it starts.",
                    String.valueOf(page.findPreference(Settings.UNIFIED_PUSH.key).getSummary()));
            // Telegram keeps signing up with Firebase until the switch is turned on.
            assertFalse(Settings.UNIFIED_PUSH.key,
                    ((SwitchPreference) page.findPreference(Settings.UNIFIED_PUSH.key)).isChecked());
            // With no UnifiedPush app installed, the row under it says what to install.
            assertEquals("Push app", String.valueOf(page.findPreference(UnifiedPushPicker.KEY).getTitle()));
            assertEquals("Install a UnifiedPush app like ntfy, then come back here.",
                    String.valueOf(page.findPreference(UnifiedPushPicker.KEY).getSummary()));
            assertEquals("Open links externally", String.valueOf(page.findPreference(Settings.OPEN_EXTERNAL_LINKS.key).getTitle()));
            assertEquals("Opens normal web links in your browser. Telegram links, sign-in and payment pages keep "
                    + "working the way they did.",
                    String.valueOf(page.findPreference(Settings.OPEN_EXTERNAL_LINKS.key).getSummary()));
            assertEquals("Remove link tracking tags", String.valueOf(page.findPreference(Settings.STRIP_LINK_TRACKING.key).getTitle()));
            assertEquals("Removes tracking tags like utm_source, gclid and fbclid from links you open or share. A link"
                    + " with any other tag is left unchanged.",
                    String.valueOf(page.findPreference(Settings.STRIP_LINK_TRACKING.key).getSummary()));
            // Browser routing is on as shipped; optional tracking cleaning has its own off default.
            for (BooleanSetting setting : Arrays.asList(Settings.HIDE_ADS, Settings.DISABLE_ANALYTICS,
                    Settings.DISABLE_UPDATE_CHECKS, Settings.HIDE_PROMOTIONAL_BANNERS, Settings.HIDE_SPONSORED_PROXY,
                    Settings.HIDE_POPULAR_APPS, Settings.OPEN_EXTERNAL_LINKS, Settings.DISABLE_CHANNEL_PULL,
                    Settings.REPAIR_FIREBASE_PUSH)) {
                assertTrue(setting.key, ((SwitchPreference) page.findPreference(setting.key)).isChecked());
            }
            assertFalse(Settings.STRIP_LINK_TRACKING.key,
                    ((SwitchPreference) page.findPreference(Settings.STRIP_LINK_TRACKING.key)).isChecked());
            assertEquals("No automatic sign-in on Telegram's sites",
                    String.valueOf(page.findPreference(Settings.SKIP_AUTOLOGIN.key).getTitle()));
            assertEquals("Telegram adds a sign-in token for your account to links to some of its own websites. With this "
                    + "on, those links open without it, and you can sign in there yourself.",
                    String.valueOf(page.findPreference(Settings.SKIP_AUTOLOGIN.key).getSummary()));
            // Telegram's sites keep signing you in until someone turns the switch on.
            assertFalse(Settings.SKIP_AUTOLOGIN.key,
                    ((SwitchPreference) page.findPreference(Settings.SKIP_AUTOLOGIN.key)).isChecked());
            assertEquals("Keep your location from Mini Apps",
                    String.valueOf(page.findPreference(Settings.MINI_APP_LOCATION_OFF.key).getTitle()));
            assertEquals("Mini Apps are told your phone's location isn't available, and web pages opened in Telegram "
                    + "are refused it. A page that already had it keeps it until you close it. Sites can still guess "
                    + "a rough area from your connection. Sending your location in a chat works as before.",
                    String.valueOf(page.findPreference(Settings.MINI_APP_LOCATION_OFF.key).getSummary()));
            // Mini Apps keep getting the location Telegram gives them until someone turns the switch on.
            assertFalse(Settings.MINI_APP_LOCATION_OFF.key,
                    ((SwitchPreference) page.findPreference(Settings.MINI_APP_LOCATION_OFF.key)).isChecked());
            assertEquals("No previews before sending", String.valueOf(page.findPreference(Settings.DISABLE_DRAFT_PREVIEWS.key).getTitle()));
            assertEquals("Telegram doesn't look up link previews for messages you haven't sent yet, including shares, "
                    + "polls, story links and bots. Sent messages still get one.",
                    String.valueOf(page.findPreference(Settings.DISABLE_DRAFT_PREVIEWS.key).getSummary()));
            // Draft previews keep Telegram's behavior until someone turns the switch on.
            assertFalse(Settings.DISABLE_DRAFT_PREVIEWS.key,
                    ((SwitchPreference) page.findPreference(Settings.DISABLE_DRAFT_PREVIEWS.key)).isChecked());
            assertEquals("Keep drafts on this phone", String.valueOf(page.findPreference(Settings.LOCAL_DRAFTS.key).getTitle()));
            assertEquals("A message you start but don't send stays on this phone and stops syncing to your other devices. "
                    + "Clearing a draft still clears it there. This covers every account in this Telegram app.",
                    String.valueOf(page.findPreference(Settings.LOCAL_DRAFTS.key).getSummary()));
            // Drafts keep syncing the way Telegram's do until someone turns the switch on.
            assertFalse(Settings.LOCAL_DRAFTS.key,
                    ((SwitchPreference) page.findPreference(Settings.LOCAL_DRAFTS.key)).isChecked());
            assertEquals("Keep searches on this phone", String.valueOf(page.findPreference(Settings.LOCAL_SEARCH.key).getTitle()));
            assertEquals("What you type in the main search isn't sent to Telegram, except in the Posts tab. The Chats tab "
                    + "finds your chats and contacts on this phone, plus recent searches, but not messages or public "
                    + "accounts. Channels, Apps, the media tabs and chat or date filters don't search for typed text. "
                    + "Search inside a chat still goes to Telegram.",
                    String.valueOf(page.findPreference(Settings.LOCAL_SEARCH.key).getSummary()));
            // Search keeps asking Telegram's server until someone turns the switch on.
            assertFalse(Settings.LOCAL_SEARCH.key,
                    ((SwitchPreference) page.findPreference(Settings.LOCAL_SEARCH.key)).isChecked());
            assertEquals("Camera only on tap", String.valueOf(page.findPreference(Settings.GALLERY_CAMERA_ON_TAP.key).getTitle()));
            assertEquals("Opening the attachment gallery doesn't start the camera or ask for camera access. Tap the "
                    + "camera tile to start it.",
                    String.valueOf(page.findPreference(Settings.GALLERY_CAMERA_ON_TAP.key).getSummary()));
            // The gallery's camera starts as Telegram's does until someone turns the switch on.
            assertFalse(Settings.GALLERY_CAMERA_ON_TAP.key,
                    ((SwitchPreference) page.findPreference(Settings.GALLERY_CAMERA_ON_TAP.key)).isChecked());
            assertEquals("Hide popular apps", String.valueOf(page.findPreference(Settings.HIDE_POPULAR_APPS.key).getTitle()));
            assertEquals("Hides the Popular apps list on the Apps tab of search, and doesn't ask Telegram for it. Apps"
                    + " you've opened and other results stay.",
                    String.valueOf(page.findPreference(Settings.HIDE_POPULAR_APPS.key).getSummary()));
            assertEquals("Search only my chats", String.valueOf(page.findPreference(Settings.SEARCH_ONLY_MY_CHATS.key).getTitle()));
            assertEquals("Search finds your chats, contacts and messages from chats you're in, and nothing public. The "
                    + "Channels, Apps and Posts tabs go away, and a hashtag's public posts don't load.",
                    String.valueOf(page.findPreference(Settings.SEARCH_ONLY_MY_CHATS.key).getSummary()));
            // Search keeps its public tabs and lookups until someone turns the switch on.
            assertFalse(Settings.SEARCH_ONLY_MY_CHATS.key,
                    ((SwitchPreference) page.findPreference(Settings.SEARCH_ONLY_MY_CHATS.key)).isChecked());
            assertEquals("Find names in styled letters", String.valueOf(page.findPreference(Settings.SEARCH_STYLED_NAMES.key).getTitle()));
            assertEquals("Searching your chats and contacts also finds names written in letters like 𝐁𝐨𝐥𝐝, 𝘐𝘵𝘢𝘭𝘪𝘤 or "
                    + "Ｗｉｄｅ when you type plain ones. Names still show as they're written and numbers aren't changed. "
                    + "A name found this way isn't highlighted.",
                    String.valueOf(page.findPreference(Settings.SEARCH_STYLED_NAMES.key).getSummary()));
            // Search matches names as Telegram does until someone turns the switch on.
            assertFalse(Settings.SEARCH_STYLED_NAMES.key,
                    ((SwitchPreference) page.findPreference(Settings.SEARCH_STYLED_NAMES.key)).isChecked());
            assertEquals("Block new channels and groups", String.valueOf(page.findPreference(Settings.BLOCK_NEW_CHATS.key).getTitle()));
            assertEquals("Stops joining channels and groups, from search, a link or a shared folder, and opening ones "
                    + "you aren't in. Chats you're already in stay. To keep this on, also turn on Lock HushTelegram settings.",
                    String.valueOf(page.findPreference(Settings.BLOCK_NEW_CHATS.key).getSummary()));
            // New channels and groups open and join as Telegram's do until a parent turns the block on.
            assertFalse(Settings.BLOCK_NEW_CHATS.key,
                    ((SwitchPreference) page.findPreference(Settings.BLOCK_NEW_CHATS.key)).isChecked());
            assertEquals("When your chat list is short, Telegram lists your contacts below it. This hides that list "
                    + "and its heading. Chats, folders and search stay.",
                    String.valueOf(page.findPreference(Settings.HIDE_CONTACTS_BLOCK.key).getSummary()));
            assertEquals("Empty private chats stop suggesting a sticker to say hello. Their other text and notices, "
                    + "and the sticker picker, stay.",
                    String.valueOf(page.findPreference(Settings.HIDE_GREETING_STICKERS.key).getSummary()));
            // Contact suggestions and greeting stickers stay as Telegram shows them until someone turns their switch on.
            assertFalse(Settings.HIDE_CONTACTS_BLOCK.key, ((SwitchPreference) page.findPreference(Settings.HIDE_CONTACTS_BLOCK.key)).isChecked());
            assertFalse(Settings.HIDE_GREETING_STICKERS.key, ((SwitchPreference) page.findPreference(Settings.HIDE_GREETING_STICKERS.key)).isChecked());
            assertEquals("No swipe actions on chats", String.valueOf(page.findPreference(Settings.DISABLE_CHAT_SWIPE.key).getTitle()));
            assertEquals("Swiping a chat in your list no longer archives, mutes, pins, deletes or marks it read. Press"
                    + " and hold still offers every action.",
                    String.valueOf(page.findPreference(Settings.DISABLE_CHAT_SWIPE.key).getSummary()));
            // Chat rows swipe as Telegram's do until someone turns the switch on.
            assertFalse(Settings.DISABLE_CHAT_SWIPE.key,
                    ((SwitchPreference) page.findPreference(Settings.DISABLE_CHAT_SWIPE.key)).isChecked());
            assertEquals("Quiet contacts prompts", String.valueOf(page.findPreference(Settings.QUIET_CONTACTS_NAG.key).getTitle()));
            assertEquals("After you say no to contacts access, the Contacts tab stops asking again and its warning "
                    + "badge goes away.",
                    String.valueOf(page.findPreference(Settings.QUIET_CONTACTS_NAG.key).getSummary()));
            // Telegram asks once as before, so the switch ships on.
            assertTrue(Settings.QUIET_CONTACTS_NAG.key,
                    ((SwitchPreference) page.findPreference(Settings.QUIET_CONTACTS_NAG.key)).isChecked());
            assertEquals("New Year look all year", String.valueOf(page.findPreference(Settings.HOLIDAY_LOOK.key).getTitle()));
            assertEquals("Shows Telegram's Santa hat and New Year snow all year, not only around New Year. Snow falls "
                    + "on the chat list's top bar and on chat backgrounds once Wallpaper rotation is on under Power Saving, in Effects in Chats.",
                    String.valueOf(page.findPreference(Settings.HOLIDAY_LOOK.key).getSummary()));
            // Telegram keeps its own holiday dates until someone turns the switch on.
            assertFalse(Settings.HOLIDAY_LOOK.key,
                    ((SwitchPreference) page.findPreference(Settings.HOLIDAY_LOOK.key)).isChecked());
            assertEquals("Use system font", String.valueOf(page.findPreference(Settings.USE_SYSTEM_FONT.key).getTitle()));
            assertEquals("Bold, italic and code text use your phone's font instead of Telegram's built-in one. Restart"
                    + " Telegram to see the change.",
                    String.valueOf(page.findPreference(Settings.USE_SYSTEM_FONT.key).getSummary()));
            // Telegram's bundled fonts stay until someone turns the switch on.
            assertFalse(Settings.USE_SYSTEM_FONT.key,
                    ((SwitchPreference) page.findPreference(Settings.USE_SYSTEM_FONT.key)).isChecked());
            assertEquals("AMOLED black", String.valueOf(page.findPreference(Settings.AMOLED_BLACK.key).getTitle()));
            assertEquals("Night and Dark themes use pure black screens. Message bubbles and menus keep their colors. "
                    + "Restart Telegram to see the change.",
                    String.valueOf(page.findPreference(Settings.AMOLED_BLACK.key).getSummary()));
            // Telegram's own theme colors stay until someone turns the switch on.
            assertFalse(Settings.AMOLED_BLACK.key,
                    ((SwitchPreference) page.findPreference(Settings.AMOLED_BLACK.key)).isChecked());
            assertEquals("Hide translate bar", String.valueOf(page.findPreference(Settings.HIDE_TRANSLATE_BAR.key).getTitle()));
            assertEquals("Chats in another language stop showing the translate bar at the top. Translate moves to the "
                    + "chat's menu, and a chat you're translating keeps its bar.",
                    String.valueOf(page.findPreference(Settings.HIDE_TRANSLATE_BAR.key).getSummary()));
            // Telegram's translate bar stays until someone turns the switch on.
            assertFalse(Settings.HIDE_TRANSLATE_BAR.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_TRANSLATE_BAR.key)).isChecked());
            assertEquals("Exact numbers", String.valueOf(page.findPreference(Settings.EXACT_NUMBERS.key).getTitle()));
            assertEquals("Member, subscriber, view, reply and reaction counts show in full, like 12,345 instead of "
                    + "12.3K.",
                    String.valueOf(page.findPreference(Settings.EXACT_NUMBERS.key).getSummary()));
            // Counts stay short until the switch is turned on.
            assertFalse(Settings.EXACT_NUMBERS.key,
                    ((SwitchPreference) page.findPreference(Settings.EXACT_NUMBERS.key)).isChecked());
            assertEquals("Reveal spoilers", String.valueOf(page.findPreference(Settings.REVEAL_SPOILERS.key).getTitle()));
            assertEquals("Spoiler text, photos and videos show right away without a tap. View-once media, sensitive "
                    + "content and login codes stay covered.",
                    String.valueOf(page.findPreference(Settings.REVEAL_SPOILERS.key).getSummary()));
            // Spoilers stay covered until the switch is turned on.
            assertFalse(Settings.REVEAL_SPOILERS.key,
                    ((SwitchPreference) page.findPreference(Settings.REVEAL_SPOILERS.key)).isChecked());
            assertEquals("Hide keyboard on scroll", String.valueOf(page.findPreference(Settings.HIDE_KEYBOARD_ON_SCROLL.key).getTitle()));
            assertEquals("The keyboard closes when you start scrolling a chat. The emoji and sticker panel stays open.",
                    String.valueOf(page.findPreference(Settings.HIDE_KEYBOARD_ON_SCROLL.key).getSummary()));
            // The keyboard stays up on scroll until the switch is turned on.
            assertFalse(Settings.HIDE_KEYBOARD_ON_SCROLL.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_KEYBOARD_ON_SCROLL.key)).isChecked());
            assertEquals("Keep videos muted on volume keys", String.valueOf(page.findPreference(Settings.KEEP_VIDEOS_MUTED.key).getTitle()));
            assertEquals("Volume keys only change the volume. They no longer start the video or round video on screen "
                    + "with sound. Tap a video to hear it.",
                    String.valueOf(page.findPreference(Settings.KEEP_VIDEOS_MUTED.key).getSummary()));
            // The chat gets volume keys until the switch is turned on.
            assertFalse(Settings.KEEP_VIDEOS_MUTED.key,
                    ((SwitchPreference) page.findPreference(Settings.KEEP_VIDEOS_MUTED.key)).isChecked());
            assertEquals("Full screen videos turn either way",
                    String.valueOf(page.findPreference(Settings.VIDEO_EITHER_LANDSCAPE.key).getTitle()));
            assertEquals("After you tap full screen, a video follows your phone to either landscape side, even with "
                    + "auto-rotate off. Turning your phone upright doesn't end full screen. Tap the button to leave it.",
                    String.valueOf(page.findPreference(Settings.VIDEO_EITHER_LANDSCAPE.key).getSummary()));
            // Full screen keeps Telegram's one side until the switch is turned on.
            assertFalse(Settings.VIDEO_EITHER_LANDSCAPE.key,
                    ((SwitchPreference) page.findPreference(Settings.VIDEO_EITHER_LANDSCAPE.key)).isChecked());
            assertEquals("Turn videos only from the full screen button",
                    String.valueOf(page.findPreference(Settings.VIDEO_ONLY_FROM_BUTTON.key).getTitle()));
            assertEquals("An open video stays upright when you turn your phone. It goes landscape only when you tap "
                    + "full screen, and back only when you tap the button again.",
                    String.valueOf(page.findPreference(Settings.VIDEO_ONLY_FROM_BUTTON.key).getSummary()));
            // Videos follow the phone as Telegram has it until the switch is turned on.
            assertFalse(Settings.VIDEO_ONLY_FROM_BUTTON.key,
                    ((SwitchPreference) page.findPreference(Settings.VIDEO_ONLY_FROM_BUTTON.key)).isChecked());
            assertEquals("Swipe back on profiles", String.valueOf(page.findPreference(Settings.SWIPE_BACK_ON_PROFILES.key).getTitle()));
            assertEquals("Swiping right on a profile's photos or media tabs goes back, like the rest of the profile, "
                    + "instead of showing the previous photo or tab.",
                    String.valueOf(page.findPreference(Settings.SWIPE_BACK_ON_PROFILES.key).getSummary()));
            // The profile keeps its swipes until the switch is turned on.
            assertFalse(Settings.SWIPE_BACK_ON_PROFILES.key,
                    ((SwitchPreference) page.findPreference(Settings.SWIPE_BACK_ON_PROFILES.key)).isChecked());
            assertEquals("Hide phone number", String.valueOf(page.findPreference(Settings.HIDE_PHONE_NUMBER.key).getTitle()));
            assertEquals("Your own phone number shows as dots in Settings and your profile, which helps"
                    + " with screenshots. Others' numbers stay visible.",
                    String.valueOf(page.findPreference(Settings.HIDE_PHONE_NUMBER.key).getSummary()));
            // Your number shows until the switch is turned on.
            assertFalse(Settings.HIDE_PHONE_NUMBER.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_PHONE_NUMBER.key)).isChecked());
            assertEquals("Don't share my number by default",
                    String.valueOf(page.findPreference(Settings.SHARE_NUMBER_UNTICKED.key).getTitle()));
            assertEquals("When you add someone as a contact from their chat, Telegram ticks the box that shares your phone "
                    + "number with them. With this on, the box starts clear and your number goes only if you tick it.",
                    String.valueOf(page.findPreference(Settings.SHARE_NUMBER_UNTICKED.key).getSummary()));
            // The share box starts ticked the way Telegram's does until someone turns the switch on.
            assertFalse(Settings.SHARE_NUMBER_UNTICKED.key,
                    ((SwitchPreference) page.findPreference(Settings.SHARE_NUMBER_UNTICKED.key)).isChecked());
            assertEquals("Message times with seconds", String.valueOf(page.findPreference(Settings.MESSAGE_SECONDS.key).getTitle()));
            assertEquals("Each message's time includes seconds, like 9:41:27 PM, so messages sent close together are "
                    + "easy to tell apart.",
                    String.valueOf(page.findPreference(Settings.MESSAGE_SECONDS.key).getSummary()));
            // Message times keep Telegram's format until the switch is turned on.
            assertFalse(Settings.MESSAGE_SECONDS.key,
                    ((SwitchPreference) page.findPreference(Settings.MESSAGE_SECONDS.key)).isChecked());
            assertEquals("Allow chat blur on slower phones", String.valueOf(page.findPreference(Settings.ALLOW_CHAT_BLUR.key).getTitle()));
            assertEquals("Telegram only blurs chat headers and panels on fast phones. This lets any phone do it, once "
                    + "Blur in chat is on under Power saving.",
                    String.valueOf(page.findPreference(Settings.ALLOW_CHAT_BLUR.key).getSummary()));
            // Telegram rates the phone until the switch is turned on.
            assertFalse(Settings.ALLOW_CHAT_BLUR.key,
                    ((SwitchPreference) page.findPreference(Settings.ALLOW_CHAT_BLUR.key)).isChecked());
            assertEquals("Play voice messages one at a time", String.valueOf(page.findPreference(Settings.VOICE_ONE_AT_A_TIME.key).getTitle()));
            assertEquals("When a voice or video message ends, the next one doesn't start by itself.",
                    String.valueOf(page.findPreference(Settings.VOICE_ONE_AT_A_TIME.key).getSummary()));
            // Telegram plays the next voice message until the switch is turned on.
            assertFalse(Settings.VOICE_ONE_AT_A_TIME.key,
                    ((SwitchPreference) page.findPreference(Settings.VOICE_ONE_AT_A_TIME.key)).isChecked());
            assertEquals("Keep voice messages quiet while locked", String.valueOf(page.findPreference(Settings.LOCKED_VOICE_GUARD.key).getTitle()));
            assertEquals("While your phone is locked, voice and round video messages don't start, resume or skip to the next one, "
                            + "whether from headphones, a car, the notification or the lock screen. One that's already playing "
                            + "finishes. Music and other videos play as usual.",
                    String.valueOf(page.findPreference(Settings.LOCKED_VOICE_GUARD.key).getSummary()));
            // A locked phone plays voice messages as Telegram does until the switch is turned on.
            assertFalse(((SwitchPreference) page.findPreference(Settings.LOCKED_VOICE_GUARD.key)).isChecked());
            assertEquals("Stop vibrations on taps", String.valueOf(page.findPreference(Settings.NO_HAPTICS.key).getTitle()));
            assertEquals("Taps, long presses, swipes and wrong entries no longer vibrate the phone. Incoming calls "
                    + "still vibrate, and notifications follow your own settings.",
                    String.valueOf(page.findPreference(Settings.NO_HAPTICS.key).getSummary()));
            // Telegram vibrates until the switch is turned on.
            assertFalse(Settings.NO_HAPTICS.key,
                    ((SwitchPreference) page.findPreference(Settings.NO_HAPTICS.key)).isChecked());
            assertEquals("Turn off reaction effects", String.valueOf(page.findPreference(Settings.REACTION_EFFECTS_OFF.key).getTitle()));
            assertEquals("When someone reacts to a message, the emoji doesn't fly across the screen and burst. The "
                    + "reaction still shows on the message.",
                    String.valueOf(page.findPreference(Settings.REACTION_EFFECTS_OFF.key).getSummary()));
            // Reaction effects play until the switch is turned on.
            assertFalse(Settings.REACTION_EFFECTS_OFF.key,
                    ((SwitchPreference) page.findPreference(Settings.REACTION_EFFECTS_OFF.key)).isChecked());
            assertEquals("Hide folder tab counters", String.valueOf(page.findPreference(Settings.HIDE_FOLDER_COUNTERS.key).getTitle()));
            assertEquals("Folder tabs above the chat list show just their names, without unread counts. Chats stay "
                    + "unread and the app icon badge doesn't change.",
                    String.valueOf(page.findPreference(Settings.HIDE_FOLDER_COUNTERS.key).getSummary()));
            // Folder tabs show their counts until the switch is turned on.
            assertFalse(Settings.HIDE_FOLDER_COUNTERS.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_FOLDER_COUNTERS.key)).isChecked());
            assertEquals("Open a folder at launch", String.valueOf(page.findPreference(Settings.LAUNCH_FOLDER.key).getTitle()));
            assertEquals("The chat list opens on the folder you pick below instead of All Chats. Each account keeps its own "
                    + "pick, and the folder order doesn't change. If that folder is gone, renamed or locked, All Chats opens as usual.",
                    String.valueOf(page.findPreference(Settings.LAUNCH_FOLDER.key).getSummary()));
            // The chat list opens on All Chats until the switch is turned on.
            assertFalse(Settings.LAUNCH_FOLDER.key,
                    ((SwitchPreference) page.findPreference(Settings.LAUNCH_FOLDER.key)).isChecked());
            assertEquals("Folder to open", String.valueOf(page.findPreference(HushTelegramPreferenceFragment.LAUNCH_FOLDER_ROW).getTitle()));
            assertEquals("Hide All Chats", String.valueOf(page.findPreference(Settings.HIDE_ALL_CHATS.key).getTitle()));
            assertEquals("The folder tabs leave out All Chats, so the chat list opens on the folder picked above or your "
                    + "first one. Archived Chats moves to the chat list's menu, and to the side menu when that's on. Tabs "
                    + "can't be dragged into a new order while this is on. Restart Telegram to see the change.",
                    String.valueOf(page.findPreference(Settings.HIDE_ALL_CHATS.key).getSummary()));
            // All Chats stays until the switch is turned on.
            assertFalse(Settings.HIDE_ALL_CHATS.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_ALL_CHATS.key)).isChecked());
            assertEquals("Hide picked chats", String.valueOf(page.findPreference(Settings.HIDDEN_CHATS.key).getTitle()));
            assertEquals("The chats you pick below leave All Chats, your folders and archived chats. They keep their messages "
                    + "and notifications, search still finds them, and nothing changes on your other devices. Each account "
                    + "keeps its own list. Folder tab counts leave them out, but the app badge still counts their "
                    + "unread messages.",
                    String.valueOf(page.findPreference(Settings.HIDDEN_CHATS.key).getSummary()));
            // Every chat shows until the switch is turned on.
            assertFalse(Settings.HIDDEN_CHATS.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDDEN_CHATS.key)).isChecked());
            assertEquals("Chats to hide", String.valueOf(page.findPreference(HushTelegramPreferenceFragment.HIDDEN_CHATS_ROW).getTitle()));
            assertEquals("Folders by chat type", String.valueOf(page.findPreference(Settings.CHAT_TYPE_FOLDERS.key).getTitle()));
            assertEquals("Turning this on makes Private, Groups, Channels and Bots folders, as tabs above the chat list "
                    + "and on your other devices. Turning it off removes the ones it made, unless you renamed or changed them. "
                    + "Both work on the account you have open.",
                    String.valueOf(page.findPreference(Settings.CHAT_TYPE_FOLDERS.key).getSummary()));
            // No folders are made until the switch is turned on.
            assertFalse(Settings.CHAT_TYPE_FOLDERS.key,
                    ((SwitchPreference) page.findPreference(Settings.CHAT_TYPE_FOLDERS.key)).isChecked());
            assertEquals("Hide sender names when forwarding", String.valueOf(page.findPreference(Settings.FORWARD_HIDE_SENDER.key).getTitle()));
            assertEquals("Each new forward starts with Hide sender's name turned on, so copies arrive without the "
                    + "original author. You can still turn it off before sending.",
                    String.valueOf(page.findPreference(Settings.FORWARD_HIDE_SENDER.key).getSummary()));
            // Forwards show the sender until the switch is turned on.
            assertFalse(Settings.FORWARD_HIDE_SENDER.key,
                    ((SwitchPreference) page.findPreference(Settings.FORWARD_HIDE_SENDER.key)).isChecked());
            assertEquals("Voice messages in the music player", String.valueOf(page.findPreference(Settings.VOICE_MUSIC_PLAYER.key).getTitle()));
            assertEquals("While a voice message plays, tapping the bar above the chat opens the full music player, "
                    + "where you can drag to skip around, instead of jumping to the message.",
                    String.valueOf(page.findPreference(Settings.VOICE_MUSIC_PLAYER.key).getSummary()));
            // A voice message keeps jumping to the chat until the switch is turned on.
            assertFalse(Settings.VOICE_MUSIC_PLAYER.key,
                    ((SwitchPreference) page.findPreference(Settings.VOICE_MUSIC_PLAYER.key)).isChecked());
            assertEquals("Faster downloads", String.valueOf(page.findPreference(Settings.FASTER_DOWNLOADS.key).getTitle()));
            assertEquals("Files download in 512 KB pieces, 8 at a time, instead of 128 KB pieces 4 at a time. If a big "
                    + "piece fails, Telegram goes back to small ones. The next download picks this up.",
                    String.valueOf(page.findPreference(Settings.FASTER_DOWNLOADS.key).getSummary()));
            // Downloads keep Telegram's piece size until the switch is turned on.
            assertFalse(Settings.FASTER_DOWNLOADS.key,
                    ((SwitchPreference) page.findPreference(Settings.FASTER_DOWNLOADS.key)).isChecked());
            assertEquals("Hold automatic downloads on Data Saver",
                    String.valueOf(page.findPreference(Settings.DATA_SAVER_DOWNLOADS.key).getTitle()));
            assertTrue(String.valueOf(page.findPreference(Settings.DATA_SAVER_DOWNLOADS.key).getSummary())
                    .startsWith(DATA_SAVER_SUMMARY + "\n"));
            // Data Saver leaves automatic downloads to Telegram until the switch is turned on.
            assertFalse(Settings.DATA_SAVER_DOWNLOADS.key,
                    ((SwitchPreference) page.findPreference(Settings.DATA_SAVER_DOWNLOADS.key)).isChecked());
            assertEquals("Save downloaded files", String.valueOf(page.findPreference(Settings.SAVE_DOWNLOADS.key).getTitle()));
            assertEquals("Each file or song you download also goes to Download/Telegram on your phone, where file "
                    + "managers and other apps can open it. Files from secret chats and chats that don't allow saving "
                    + "stay in Telegram.",
                    String.valueOf(page.findPreference(Settings.SAVE_DOWNLOADS.key).getSummary()));
            // Downloads stay in Telegram's own folder until the switch is turned on.
            assertFalse(Settings.SAVE_DOWNLOADS.key,
                    ((SwitchPreference) page.findPreference(Settings.SAVE_DOWNLOADS.key)).isChecked());
            assertEquals("Also save from chats that don't allow saving",
                    String.valueOf(page.findPreference(Settings.SAVE_RESTRICTED_DOWNLOADS.key).getTitle()));
            assertEquals("With Save downloaded files on, files from chats whose owner turned off saving get copied too. "
                    + "Only use it where the owner is fine with you keeping a copy, since it goes past their setting. "
                    + "Secret chats still stay in Telegram.",
                    String.valueOf(page.findPreference(Settings.SAVE_RESTRICTED_DOWNLOADS.key).getSummary()));
            // The owner's setting holds until this one is turned on as well.
            assertFalse(Settings.SAVE_RESTRICTED_DOWNLOADS.key,
                    ((SwitchPreference) page.findPreference(Settings.SAVE_RESTRICTED_DOWNLOADS.key)).isChecked());
            assertEquals("Also save view-once and timed media",
                    String.valueOf(page.findPreference(Settings.SAVE_TIMED_MEDIA.key).getTitle()));
            assertEquals("With Save downloaded files on, view-once and self-destructing photos, videos, voice and video "
                    + "messages get copied to Download/Telegram when they download. The sender meant them to disappear, "
                    + "so only use it where they're fine with you keeping a copy. Secret chats still stay in Telegram.",
                    String.valueOf(page.findPreference(Settings.SAVE_TIMED_MEDIA.key).getSummary()));
            // The sender's timer holds until this one is turned on as well.
            assertFalse(Settings.SAVE_TIMED_MEDIA.key,
                    ((SwitchPreference) page.findPreference(Settings.SAVE_TIMED_MEDIA.key)).isChecked());
            assertEquals("Silence people outside your contacts", String.valueOf(page.findPreference(Settings.SILENCE_NON_CONTACTS.key).getTitle()));
            assertEquals("Private messages from people not in your contacts still show a notification, but without "
                    + "sound or vibration. Bots, reminders and login codes keep their sound.",
                    String.valueOf(page.findPreference(Settings.SILENCE_NON_CONTACTS.key).getSummary()));
            // A stranger's message rings until the switch is turned on.
            assertFalse(Settings.SILENCE_NON_CONTACTS.key,
                    ((SwitchPreference) page.findPreference(Settings.SILENCE_NON_CONTACTS.key)).isChecked());
            assertEquals("Disable pull to archive", String.valueOf(page.findPreference(Settings.DISABLE_ARCHIVE_PULL.key).getTitle()));
            assertEquals("Pulling down the chat list no longer opens the archive. Use Archived chats in the list's "
                    + "menu instead. Restart Telegram to see the change.",
                    String.valueOf(page.findPreference(Settings.DISABLE_ARCHIVE_PULL.key).getSummary()));
            // A pull brings the hidden archive back until the switch is turned on.
            assertFalse(Settings.DISABLE_ARCHIVE_PULL.key,
                    ((SwitchPreference) page.findPreference(Settings.DISABLE_ARCHIVE_PULL.key)).isChecked());
            assertEquals("Start the camera on the rear lens", String.valueOf(page.findPreference(Settings.REAR_CAMERA_FIRST.key).getTitle()));
            assertEquals("The camera in the attachment menu always opens on the rear lens, not the lens you used last."
                    + " You can still flip it.",
                    String.valueOf(page.findPreference(Settings.REAR_CAMERA_FIRST.key).getSummary()));
            // The camera opens on the last lens until the switch is turned on.
            assertFalse(Settings.REAR_CAMERA_FIRST.key,
                    ((SwitchPreference) page.findPreference(Settings.REAR_CAMERA_FIRST.key)).isChecked());
            assertEquals("Hide gallery camera tile", String.valueOf(page.findPreference(Settings.HIDE_GALLERY_CAMERA_TILE.key).getTitle()));
            assertEquals("The attachment menu's photo grid starts with your photos instead of a live camera tile. A "
                    + "chat picks this up the next time you open it.",
                    String.valueOf(page.findPreference(Settings.HIDE_GALLERY_CAMERA_TILE.key).getSummary()));
            // The gallery shows its camera tile until the switch is turned on.
            assertFalse(Settings.HIDE_GALLERY_CAMERA_TILE.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_GALLERY_CAMERA_TILE.key)).isChecked());
            assertEquals("Hide time on stickers", String.valueOf(page.findPreference(Settings.HIDE_STICKER_TIME.key).getTitle()));
            assertEquals("Stickers and big animated emoji no longer show the time and read checks in their corner. "
                    + "Other messages keep their time.",
                    String.valueOf(page.findPreference(Settings.HIDE_STICKER_TIME.key).getSummary()));
            // A sticker shows its time until the switch is turned on.
            assertFalse(Settings.HIDE_STICKER_TIME.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_STICKER_TIME.key)).isChecked());
            assertEquals("Change sticker size", String.valueOf(page.findPreference(Settings.CHANGE_STICKER_SIZE.key).getTitle()));
            assertEquals("Stickers in chats show at the size you pick below. Animated emoji and dice keep Telegram's "
                    + "size. A chat picks this up the next time you open it.",
                    String.valueOf(page.findPreference(Settings.CHANGE_STICKER_SIZE.key).getSummary()));
            // Stickers keep Telegram's size until the switch is turned on.
            assertFalse(((SwitchPreference) page.findPreference(Settings.CHANGE_STICKER_SIZE.key)).isChecked());
            assertEquals("Sticker size", String.valueOf(page.findPreference(HushTelegramPreferenceFragment.STICKER_SIZE_ROW).getTitle()));
            assertEquals("75% of Telegram's size",
                    String.valueOf(page.findPreference(HushTelegramPreferenceFragment.STICKER_SIZE_ROW).getSummary()));
            assertEquals("Ignore mentions in muted chats", String.valueOf(page.findPreference(Settings.IGNORE_MUTED_MENTIONS.key).getTitle()));
            assertEquals("Mentions and replies in groups or channels you've muted no longer notify you. Chats you "
                    + "haven't muted notify as before.",
                    String.valueOf(page.findPreference(Settings.IGNORE_MUTED_MENTIONS.key).getSummary()));
            // Mentions in a muted chat notify until the switch is turned on.
            assertFalse(Settings.IGNORE_MUTED_MENTIONS.key,
                    ((SwitchPreference) page.findPreference(Settings.IGNORE_MUTED_MENTIONS.key)).isChecked());
            assertEquals("Hide blocked users in groups", String.valueOf(page.findPreference(Settings.HIDE_BLOCKED_IN_GROUPS.key).getTitle()));
            assertEquals("Messages from people you've blocked are left out of groups and supergroups you open, and don't"
                    + " notify you. Nothing is deleted. Private chats and channel posts stay as they are.",
                    String.valueOf(page.findPreference(Settings.HIDE_BLOCKED_IN_GROUPS.key).getSummary()));
            // Blocked people's group messages show until the switch is turned on.
            assertFalse(Settings.HIDE_BLOCKED_IN_GROUPS.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_BLOCKED_IN_GROUPS.key)).isChecked());
            assertEquals("Messages in groups and channels that match one of your filters are left out when you open "
                    + "the chat. Private chats and your own messages stay as they are. Nothing is deleted, and your "
                    + "filters stay on this phone.",
                    String.valueOf(page.findPreference(Settings.HIDE_BY_KEYWORD.key).getSummary()));
            assertFalse(((SwitchPreference) page.findPreference(Settings.HIDE_BY_KEYWORD.key)).isChecked());
            assertEquals("Filters for groups", String.valueOf(page.findPreference(FilterEditor.GROUPS).getTitle()));
            assertEquals("No filters yet.", String.valueOf(page.findPreference(FilterEditor.GROUPS).getSummary()));
            assertEquals("Filters for channels", String.valueOf(page.findPreference(FilterEditor.CHANNELS).getTitle()));
            assertEquals("No filters yet.", String.valueOf(page.findPreference(FilterEditor.CHANNELS).getSummary()));
            assertEquals("Hide Telegram Features and Invite Friends", String.valueOf(page.findPreference(Settings.HIDE_FEATURES_AND_INVITE.key).getTitle()));
            assertEquals("Removes the Telegram Features row from Settings and Invite Friends from Contacts. With no "
                    + "contacts yet, the invite list goes too.",
                    String.valueOf(page.findPreference(Settings.HIDE_FEATURES_AND_INVITE.key).getSummary()));
            // Telegram Features and Invite Friends show until the switch is turned on.
            assertFalse(Settings.HIDE_FEATURES_AND_INVITE.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_FEATURES_AND_INVITE.key)).isChecked());
            assertEquals("Add Repeat to the message menu", String.valueOf(page.findPreference(Settings.MESSAGE_MENU_REPEAT.key).getTitle()));
            assertEquals("Adds Repeat under Forward in a message's menu. It sends the same message "
                    + "again to the chat. Not shown in protected or secret chats.",
                    String.valueOf(page.findPreference(Settings.MESSAGE_MENU_REPEAT.key).getSummary()));
            // The message menu stays as Telegram builds it until the switch is turned on.
            assertFalse(Settings.MESSAGE_MENU_REPEAT.key,
                    ((SwitchPreference) page.findPreference(Settings.MESSAGE_MENU_REPEAT.key)).isChecked());
            assertEquals("Keep deleted messages", String.valueOf(page.findPreference(Settings.KEEP_DELETED_MESSAGES.key).getTitle()));
            assertEquals("Messages others delete stay in your chat on this phone, marked deleted next to the time. "
                    + "Your own deletes and disappearing messages work as usual.",
                    String.valueOf(page.findPreference(Settings.KEEP_DELETED_MESSAGES.key).getSummary()));
            // Telegram removes a message another person deletes until the switch is turned on.
            assertFalse(Settings.KEEP_DELETED_MESSAGES.key,
                    ((SwitchPreference) page.findPreference(Settings.KEEP_DELETED_MESSAGES.key)).isChecked());
            assertEquals("Show deleted in red", String.valueOf(page.findPreference(Settings.RED_DELETED_LABEL.key).getTitle()));
            assertEquals("The deleted label next to a kept message's time turns red, so it stands out in the chat. "
                    + "Works with Keep deleted messages on.",
                    String.valueOf(page.findPreference(Settings.RED_DELETED_LABEL.key).getSummary()));
            // The label keeps the time's color until the switch is turned on.
            assertFalse(Settings.RED_DELETED_LABEL.key,
                    ((SwitchPreference) page.findPreference(Settings.RED_DELETED_LABEL.key)).isChecked());
            assertEquals("Ask before sending a sticker", String.valueOf(page.findPreference(Settings.ASK_BEFORE_STICKER.key).getTitle()));
            assertEquals("Asks Send or Cancel before a sticker you tap goes into a chat. Cancel drops it. Scheduled "
                    + "stickers go out without asking.",
                    String.valueOf(page.findPreference(Settings.ASK_BEFORE_STICKER.key).getSummary()));
            // Stickers, GIFs, recordings and calls go out without a question until the switch is turned on.
            assertFalse(Settings.ASK_BEFORE_STICKER.key,
                    ((SwitchPreference) page.findPreference(Settings.ASK_BEFORE_STICKER.key)).isChecked());
            assertEquals("Translate with an outside service", String.valueOf(page.findPreference(Settings.OUTSIDE_TRANSLATE.key).getTitle()));
            assertEquals("Adds Translate here to a message's menu and Translate this chat to a chat's menu, using "
                            + "the translation service you choose. The text you ask to translate is sent to that service, "
                            + "one message at a time. Nothing leaves your phone until "
                            + "you turn a chat or message on. A chat or message you turn on stays on only in the "
                            + "account you turned it on in.",
                    String.valueOf(page.findPreference(Settings.OUTSIDE_TRANSLATE.key).getSummary()));
            // Messages stay as sent until a chat or message is turned on.
            assertFalse(Settings.OUTSIDE_TRANSLATE.key,
                    ((SwitchPreference) page.findPreference(Settings.OUTSIDE_TRANSLATE.key)).isChecked());
            assertEquals("Search, Direct messages and Info leave the bar at the bottom of a channel. Mute and Join stay, "
                            + "and tapping the channel's name at the top still opens its info. A channel picks this up the "
                            + "next time you open it.",
                    String.valueOf(page.findPreference(Settings.HIDE_CHANNEL_BUTTONS.key).getSummary()));
            assertEquals("Hide channel Mute button", String.valueOf(page.findPreference(Settings.HIDE_CHANNEL_MUTE.key).getTitle()));
            assertEquals("The bar at the bottom of a channel you've joined goes away, along with its Mute button and the "
                            + "Search and Info buttons beside it. Channels you haven't joined still show Join. To mute a "
                            + "channel, open its info. A channel picks this up the next time you open it.",
                    String.valueOf(page.findPreference(Settings.HIDE_CHANNEL_MUTE.key).getSummary()));
            assertFalse(((SwitchPreference) page.findPreference(Settings.HIDE_CHANNEL_MUTE.key)).isChecked());
            assertEquals("Hide channel share button", String.valueOf(page.findPreference(Settings.HIDE_CHANNEL_SHARE.key).getTitle()));
            assertEquals("The round share button beside channel posts goes away, in the channel and wherever a post is "
                            + "forwarded. A post's own menu still forwards it. Bots and Saved Messages keep theirs. A chat "
                            + "picks this up the next time you open it.",
                    String.valueOf(page.findPreference(Settings.HIDE_CHANNEL_SHARE.key).getSummary()));
            assertFalse(((SwitchPreference) page.findPreference(Settings.HIDE_CHANNEL_SHARE.key)).isChecked());
            assertEquals("Hide emoji statuses", String.valueOf(page.findPreference(Settings.HIDE_EMOJI_STATUS.key).getTitle()));
            assertEquals("The emoji a Premium account puts next to its name goes away in chats, the chat list and "
                            + "profiles, and the Premium star shows instead. Your own status hides too but stays set for "
                            + "everyone else. A chat picks this up the next time you open it.",
                    String.valueOf(page.findPreference(Settings.HIDE_EMOJI_STATUS.key).getSummary()));
            assertFalse(((SwitchPreference) page.findPreference(Settings.HIDE_EMOJI_STATUS.key)).isChecked());
            assertEquals("Unlock Premium app icons", String.valueOf(page.findPreference(Settings.UNLOCK_PREMIUM_ICONS.key).getTitle()));
            assertEquals("Premium, Turbo and Nox in Telegram's App Icon list work without Premium, with no lock and no "
                            + "Premium sheet. Only the icon on your home screen changes.",
                    String.valueOf(page.findPreference(Settings.UNLOCK_PREMIUM_ICONS.key).getSummary()));
            assertFalse(((SwitchPreference) page.findPreference(Settings.UNLOCK_PREMIUM_ICONS.key)).isChecked());
            assertEquals("Emoji status on this phone", String.valueOf(page.findPreference(Settings.LOCAL_EMOJI_STATUS.key).getTitle()));
            assertEquals("Tap the star next to Telegram at the top of the chat list and pick any emoji status, animated ones "
                            + "too, without Premium. It shows there on this phone only. Nobody else sees it, and nothing is sent "
                            + "to Telegram.",
                    String.valueOf(page.findPreference(Settings.LOCAL_EMOJI_STATUS.key).getSummary()));
            assertFalse(((SwitchPreference) page.findPreference(Settings.LOCAL_EMOJI_STATUS.key)).isChecked());
            assertEquals("Hide trending packs", String.valueOf(page.findPreference(Settings.HIDE_KEYBOARD_FEATURED.key).getTitle()));
            assertEquals("The sticker keyboard's Trending tab and row and the emoji keyboard's trending packs go away, "
                            + "so both list only packs you've added. Search and the Stickers and Emoji screen still show "
                            + "them. A chat picks this up the next time you open it.",
                    String.valueOf(page.findPreference(Settings.HIDE_KEYBOARD_FEATURED.key).getSummary()));
            // The keyboards keep Telegram's trending packs until the switch is turned on.
            assertFalse(((SwitchPreference) page.findPreference(Settings.HIDE_KEYBOARD_FEATURED.key)).isChecked());
            assertEquals("Your picture next to the message box goes away in groups and channels where you could post as "
                            + "a channel, while you're posting as yourself. Once you pick a channel it shows again, so you "
                            + "can always see who you're posting as. To pick one, turn this off first. A chat picks this up "
                            + "the next time you open it.",
                    String.valueOf(page.findPreference(Settings.HIDE_SEND_AS.key).getSummary()));
            // A channel's bar and the message box stay stock until their switches are turned on.
            assertFalse(((SwitchPreference) page.findPreference(Settings.HIDE_CHANNEL_BUTTONS.key)).isChecked());
            assertFalse(((SwitchPreference) page.findPreference(Settings.HIDE_SEND_AS.key)).isChecked());
            assertEquals("Hide Contacts tab", String.valueOf(page.findPreference(Settings.HIDE_CONTACTS_TAB.key).getTitle()));
            assertEquals("The Contacts tab leaves the bar at the bottom of the main screen, and swiping doesn't open its "
                            + "page either. The Calls or Settings tab stays as Telegram has it, and the chat list's new "
                            + "message button still opens your contacts. Restart Telegram to see the change.",
                    String.valueOf(page.findPreference(Settings.HIDE_CONTACTS_TAB.key).getSummary()));
            // The main screen keeps its Contacts tab until the switch is turned on.
            assertFalse(((SwitchPreference) page.findPreference(Settings.HIDE_CONTACTS_TAB.key)).isChecked());
            assertEquals("Compact bottom bar", String.valueOf(page.findPreference(Settings.COMPACT_TAB_BAR.key).getTitle()));
            assertEquals("The bar at the bottom of the main screen gets shorter and only as wide as its tabs need. The tabs "
                            + "keep their full height, so they're just as easy to tap. Restart Telegram to see the change.",
                    String.valueOf(page.findPreference(Settings.COMPACT_TAB_BAR.key).getSummary()));
            // The bar keeps Telegram's size until the switch is turned on.
            assertFalse(((SwitchPreference) page.findPreference(Settings.COMPACT_TAB_BAR.key)).isChecked());
            assertEquals("Side menu", String.valueOf(page.findPreference(Settings.SIDE_MENU.key).getTitle()));
            assertEquals("Swipe right on your first chat folder and a menu slides in, like the one older Telegram had. It has "
                            + "your profile, new message, contacts, calls, saved messages and settings, plus a way to switch "
                            + "accounts. Back or a tap beside it closes it.",
                    String.valueOf(page.findPreference(Settings.SIDE_MENU.key).getSummary()));
            // A swipe on the chat list stays Telegram's until the switch is turned on.
            assertFalse(((SwitchPreference) page.findPreference(Settings.SIDE_MENU.key)).isChecked());
            assertEquals("Hide new message button", String.valueOf(page.findPreference(Settings.HIDE_NEW_MESSAGE.key).getTitle()));
            assertEquals("Removes the round pencil button from the chat list. Start a chat from the menu or search. "
                            + "Restart Telegram to see the change.",
                    String.valueOf(page.findPreference(Settings.HIDE_NEW_MESSAGE.key).getSummary()));
            // The pencil button stays until the switch is turned on.
            assertFalse(((SwitchPreference) page.findPreference(Settings.HIDE_NEW_MESSAGE.key)).isChecked());
            assertEquals("Ask before sending a GIF", String.valueOf(page.findPreference(Settings.ASK_BEFORE_GIF.key).getTitle()));
            assertEquals("Asks Send or Cancel before a GIF you tap goes into a chat. Cancel drops it. Scheduled GIFs "
                    + "go out without asking.",
                    String.valueOf(page.findPreference(Settings.ASK_BEFORE_GIF.key).getSummary()));
            assertFalse(Settings.ASK_BEFORE_GIF.key,
                    ((SwitchPreference) page.findPreference(Settings.ASK_BEFORE_GIF.key)).isChecked());
            assertEquals("Ask before sending a voice or video message", String.valueOf(page.findPreference(Settings.ASK_BEFORE_VOICE_VIDEO.key).getTitle()));
            assertEquals("Asks Send or Cancel before a voice or video message you recorded goes out. The recording"
                    + " pauses first, and Cancel leaves it paused, ready to play, delete or send.",
                    String.valueOf(page.findPreference(Settings.ASK_BEFORE_VOICE_VIDEO.key).getSummary()));
            assertFalse(Settings.ASK_BEFORE_VOICE_VIDEO.key,
                    ((SwitchPreference) page.findPreference(Settings.ASK_BEFORE_VOICE_VIDEO.key)).isChecked());
            assertEquals("Ask before starting a call", String.valueOf(page.findPreference(Settings.ASK_BEFORE_CALL.key).getTitle()));
            assertEquals("Asks Call or Cancel before the call button in a chat or on a profile starts a call.",
                    String.valueOf(page.findPreference(Settings.ASK_BEFORE_CALL.key).getSummary()));
            assertFalse(Settings.ASK_BEFORE_CALL.key,
                    ((SwitchPreference) page.findPreference(Settings.ASK_BEFORE_CALL.key)).isChecked());
            assertEquals("Add Copy photo to the message menu", String.valueOf(page.findPreference(Settings.MESSAGE_MENU_COPY_PHOTO.key).getTitle()));
            assertEquals("Adds Copy photo to a downloaded photo's menu, so you can paste the picture "
                    + "into another app. Not shown in protected or secret chats.",
                    String.valueOf(page.findPreference(Settings.MESSAGE_MENU_COPY_PHOTO.key).getSummary()));
            // Each of the menu's items stays out until its own switch is turned on.
            assertFalse(Settings.MESSAGE_MENU_COPY_PHOTO.key,
                    ((SwitchPreference) page.findPreference(Settings.MESSAGE_MENU_COPY_PHOTO.key)).isChecked());
            assertEquals("Add Message details to the message menu", String.valueOf(page.findPreference(Settings.MESSAGE_MENU_DETAILS.key).getTitle()));
            assertEquals("Adds Message details to a message's menu. It shows IDs, send and edit times, "
                    + "where it was forwarded from, and file info.",
                    String.valueOf(page.findPreference(Settings.MESSAGE_MENU_DETAILS.key).getSummary()));
            // Each of the menu's items stays out until its own switch is turned on.
            assertFalse(Settings.MESSAGE_MENU_DETAILS.key,
                    ((SwitchPreference) page.findPreference(Settings.MESSAGE_MENU_DETAILS.key)).isChecked());
            assertEquals("Add Quick forward to the message menu", String.valueOf(page.findPreference(Settings.MESSAGE_MENU_QUICK_FORWARD.key).getTitle()));
            assertEquals("Adds Quick forward to a message's menu. One tap sends it to Saved Messages or"
                    + " a recent chat. Not in protected or secret chats.",
                    String.valueOf(page.findPreference(Settings.MESSAGE_MENU_QUICK_FORWARD.key).getSummary()));
            assertFalse(Settings.MESSAGE_MENU_QUICK_FORWARD.key,
                    ((SwitchPreference) page.findPreference(Settings.MESSAGE_MENU_QUICK_FORWARD.key)).isChecked());
            List<Preference> rows = new ArrayList<>();
            collect(page.getPreferenceScreen(), rows);
            for (Preference row : rows) {
                String text = row.getTitle() + " " + row.getSummary();
                assertFalse("\"" + text + "\" names Facebook, Meta, Instagram or Threads",
                        text.contains("Facebook") || text.contains("Meta") || text.contains("Instagram") || text.contains("Threads"));
            }
        }
    }

    /**
     * Keep deleted messages brings its way out: a row right under the switch that acts on the tap,
     * with no chevron and no question, and says what happened in a notice.
     */
    @Test
    public void clearKeptMessagesComesWithKeepDeletedAndActsAtOnce() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.KEEP_DELETED_MESSAGES);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            assertNull(pageOf(controller).findPreference(HushTelegramPreferenceFragment.CLEAR_KEPT));
        }
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.KEEP_DELETED_MESSAGES);
        // A build whose label can't go red has no switch for it, and Clear sits right under Keep deleted messages.
        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = new ArrayList<>();
            collect(pageOf(controller).getPreferenceScreen(), rows);
            assertEquals(-1, indexOfKey(rows, Settings.RED_DELETED_LABEL.key));
            assertEquals(HushTelegramPreferenceFragment.CLEAR_KEPT, rows.get(indexOfKey(rows, Settings.KEEP_DELETED_MESSAGES.key) + 1).getKey());
        }
        PatchFamily.capabilitiesForTests = null;
        ShadowToast.reset();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = new ArrayList<>();
            collect(pageOf(controller).getPreferenceScreen(), rows);
            int keep = indexOfKey(rows, Settings.KEEP_DELETED_MESSAGES.key);
            assertEquals("the red switch sits under its family's", Settings.RED_DELETED_LABEL.key, rows.get(keep + 1).getKey());
            Preference clear = rows.get(keep + 2);
            assertEquals(HushTelegramPreferenceFragment.CLEAR_KEPT, clear.getKey());
            assertEquals("Clear kept messages", String.valueOf(clear.getTitle()));
            assertEquals("Deletes the messages this phone kept after others deleted them, in every account, the way "
                    + "Telegram would have.", String.valueOf(clear.getSummary()));
            assertEquals("Conversations", String.valueOf(clear.getParent().getTitle()));
            assertTrue("a tap acts, so no chevron", ((ImmediateAction) clear).actsOnTap());
            assertFalse("it stores nothing", clear.isPersistent());

            // A test JVM has no Telegram, so no account can be read: nothing is cleared, the notice
            // says so, and the failure is in the report rather than in a crash.
            assertTrue(clear.getOnPreferenceClickListener().onPreferenceClick(clear));
            assertEquals("There are no kept messages to clear.", ShadowToast.getTextOfLatestToast());
            assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("accounts"));
        } finally {
            HookStatus.clear();
        }
    }

    /**
     * Hide messages by keyword brings a row for each list under its switch. A tap opens the list;
     * Save keeps the dialog and what was typed when a line can't be used, and saves the list
     * trimmed when every line can.
     */
    @Test
    public void theFilterListsComeWithHideByKeywordAndSaveOnlyWhatWorks() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.HIDE_BY_KEYWORD);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            assertNull(pageOf(controller).findPreference(FilterEditor.GROUPS));
            assertNull(pageOf(controller).findPreference(FilterEditor.CHANNELS));
        }
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_BY_KEYWORD);
        ShadowToast.reset();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = new ArrayList<>();
            collect(pageOf(controller).getPreferenceScreen(), rows);
            int toggle = indexOfKey(rows, Settings.HIDE_BY_KEYWORD.key);
            assertEquals(FilterEditor.GROUPS, rows.get(toggle + 1).getKey());
            assertEquals(FilterEditor.CHANNELS, rows.get(toggle + 2).getKey());
            Preference groups = rows.get(toggle + 1);
            assertEquals("Conversations", String.valueOf(groups.getParent().getTitle()));
            assertFalse("it stores nothing itself", groups.isPersistent());

            assertTrue(groups.getOnPreferenceClickListener().onPreferenceClick(groups));
            ShadowLooper.idleMainLooper();
            AlertDialog editor = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            assertTrue(editor.isShowing());
            assertEquals("Filters for groups", String.valueOf(shadowOf(editor).getTitle()));
            EditText field = editor.findViewById(android.R.id.edit);
            assertEquals("", field.getText().toString());

            field.setText("spam\n\n/(a+)+/");
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertTrue("a line that can't be used keeps the dialog", editor.isShowing());
            assertEquals("Line 3 may be slow on long messages. Try a simpler pattern.", ShadowToast.getTextOfLatestToast());
            assertEquals("", Settings.MESSAGE_FILTERS_GROUPS.savedValue());

            field.setText("/(unclosed/");
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertEquals("Line 1 isn't a valid regex. Fix it or take off the slashes.", ShadowToast.getTextOfLatestToast());

            StringBuilder wide = new StringBuilder();
            String line = new String(new char[MessageFilters.MAX_FILTER_CHARS]).replace('\0', '字');
            for (int i = 0; i < MessageFilters.MAX_FILTERS; i++) wide.append(line).append('\n');
            field.setText(wide);
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertTrue("a list too big for a settings file keeps the dialog", editor.isShowing());
            assertEquals("This list is too long for a settings file. Remove a few lines.",
                    ShadowToast.getTextOfLatestToast());
            assertEquals("", Settings.MESSAGE_FILTERS_GROUPS.savedValue());

            field.setText("spam");
            try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE)) {
                editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                settle();
            }
            assertTrue("a save that fails keeps the dialog", editor.isShowing());
            assertEquals("Couldn't save the filters. Try again in a moment.", ShadowToast.getTextOfLatestToast());
            assertEquals("No filters yet.", String.valueOf(groups.getSummary()));

            field.setText("  spam \n\n/\\bgiveaway\\b/\n");
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(editor.isShowing());
            assertEquals("Filters saved.", ShadowToast.getTextOfLatestToast());
            assertEquals("spam\n/\\bgiveaway\\b/", Settings.MESSAGE_FILTERS_GROUPS.savedValue());
            assertEquals("2 filters.", String.valueOf(groups.getSummary()));
            assertEquals("the other list is its own", "", Settings.MESSAGE_FILTERS_CHANNELS.savedValue());
        } finally {
            Settings.MESSAGE_FILTERS_GROUPS.resetToDefault();
            Settings.MESSAGE_FILTERS_CHANNELS.resetToDefault();
        }
    }

    /**
     * Translate with an outside service brings a Translation service row under its switch. A tap
     * opens the address, model and key; Save keeps the dialog when one can't be used, and Use
     * Google forgets the key. The key is kept in the outside translate's own file, never in the
     * settings the backup reads.
     */
    @Test
    public void theTranslationServiceRowSavesAnAiServiceAndUseGoogleForgetsTheKey() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.OUTSIDE_TRANSLATE);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            assertNull(pageOf(controller).findPreference(TranslateServiceEditor.KEY));
        }
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.OUTSIDE_TRANSLATE);
        android.content.SharedPreferences file = app.hushtelegram.extension.shared.Utils.getContext()
                .getSharedPreferences("hushtelegram_outside_translate", 0);
        file.edit().clear().commit();
        app.hushtelegram.extension.telegram.misc.OutsideTranslateForTests.reset();
        ShadowToast.reset();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = new ArrayList<>();
            collect(pageOf(controller).getPreferenceScreen(), rows);
            int toggle = indexOfKey(rows, Settings.OUTSIDE_TRANSLATE.key);
            Preference row = rows.get(toggle + 1);
            assertEquals(TranslateServiceEditor.KEY, row.getKey());
            assertEquals("Translation service", String.valueOf(row.getTitle()));
            assertEquals("Google's web translate. Tap to use an AI service with your own key.", String.valueOf(row.getSummary()));
            assertFalse("it stores nothing itself", row.isPersistent());

            assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
            ShadowLooper.idleMainLooper();
            AlertDialog editor = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            assertTrue(editor.isShowing());
            assertEquals("Translation service", String.valueOf(shadowOf(editor).getTitle()));
            EditText address = editor.findViewById(android.R.id.text1);
            EditText model = editor.findViewById(android.R.id.text2);
            EditText key = editor.findViewById(android.R.id.edit);
            assertEquals("https://api.openai.com/v1", address.getText().toString());
            assertEquals("gpt-4o-mini", model.getText().toString());
            assertEquals("", key.getText().toString());
            assertTrue("the key field is masked",
                    (key.getInputType() & android.text.InputType.TYPE_TEXT_VARIATION_PASSWORD) != 0);
            assertTrue(key.getTransformationMethod() instanceof android.text.method.PasswordTransformationMethod);
            assertEquals("the key reads in the same face as the other fields", address.getTypeface(), key.getTypeface());
            assertNotEquals(android.graphics.Typeface.MONOSPACE, key.getTypeface());
            assertEquals("no autofill service is offered the key", android.view.View.IMPORTANT_FOR_AUTOFILL_NO,
                    key.getImportantForAutofill());

            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertTrue("no key keeps the dialog", editor.isShowing());
            assertEquals("Type your API key, or tap Use Google.", ShadowToast.getTextOfLatestToast());

            address.setText("http://api.example.com/v1");
            key.setText("sk-test-123");
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertTrue("a key never goes out over plain http", editor.isShowing());
            assertEquals("The address has to start with https://.", ShadowToast.getTextOfLatestToast());
            assertFalse(file.contains("ai_key"));

            address.setText(" https://openrouter.ai/api/v1 ");
            model.setText("deepseek/deepseek-chat");
            EditText style = editor.findViewById(android.R.id.summary);
            assertEquals("", style.getText().toString());
            assertTrue("instructions can run over several lines",
                    (style.getInputType() & android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE) != 0);
            style.setText(new String(new char[1001]).replace('\0', 'x'));
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertTrue("instructions past the limit keep the dialog", editor.isShowing());
            assertEquals("This field is too long. Use 1000 characters or fewer.", ShadowToast.getTextOfLatestToast());
            assertNotNull("the refusal points at the instructions field", style.getTag());
            style.setText("Keep it casual.\nLeave names as they are.");
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(editor.isShowing());
            assertEquals("Translation service saved.", ShadowToast.getTextOfLatestToast());
            assertEquals("Your AI service at openrouter.ai, model deepseek/deepseek-chat.", String.valueOf(row.getSummary()));
            assertEquals("sk-test-123", file.getString("ai_key", null));
            assertEquals("https://openrouter.ai/api/v1", file.getString("ai_address", null));
            assertEquals("Keep it casual.\nLeave names as they are.", file.getString("ai_style", null));
            // Nothing of the service is in the settings a backup or the report reads.
            for (String saved : app.hushtelegram.extension.shared.Utils.getContext()
                    .getSharedPreferences(app.hushtelegram.extension.shared.settings.Setting.PREFERENCES_NAME, 0).getAll().keySet()) {
                assertFalse(saved, saved.contains("ai_") || saved.contains("translate_service"));
            }

            assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
            ShadowLooper.idleMainLooper();
            editor = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            assertEquals("the saved key comes back masked", "sk-test-123",
                    ((EditText) editor.findViewById(android.R.id.edit)).getText().toString());
            assertEquals("Keep it casual.\nLeave names as they are.",
                    ((EditText) editor.findViewById(android.R.id.summary)).getText().toString());
            editor.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
            settle();
            assertFalse(editor.isShowing());
            assertEquals("Back to Google's web translate.", ShadowToast.getTextOfLatestToast());
            assertEquals("Google's web translate. Tap to use an AI service with your own key.", String.valueOf(row.getSummary()));
            assertFalse("Use Google forgets the key", file.contains("ai_key"));
        } finally {
            file.edit().clear().commit();
            app.hushtelegram.extension.telegram.misc.OutsideTranslateForTests.reset();
        }
    }

    /** The Data Saver row ends with what Android reports when the page opens, each fact on its own. */
    @Test
    public void theDataSaverRowSaysWhatAndroidReportsNow() {
        Context app = RuntimeEnvironment.getApplication();
        DataSaverDownloadsForTests.android(ConnectivityManager.RESTRICT_BACKGROUND_STATUS_ENABLED, ConnectivityManager.TYPE_MOBILE);
        assertEquals(DATA_SAVER_SUMMARY + "\nAndroid's Data Saver is on. This network is metered.",
                HushTelegramPreferenceFragment.dataSaverSummary(DataSaverDownloads.status(app)));
        DataSaverDownloadsForTests.android(ConnectivityManager.RESTRICT_BACKGROUND_STATUS_WHITELISTED, ConnectivityManager.TYPE_WIFI);
        assertEquals(DATA_SAVER_SUMMARY + "\nAndroid's Data Saver is on, but Telegram may use data freely. This network isn't metered.",
                HushTelegramPreferenceFragment.dataSaverSummary(DataSaverDownloads.status(app)));
        DataSaverDownloadsForTests.android(ConnectivityManager.RESTRICT_BACKGROUND_STATUS_DISABLED, ConnectivityManager.TYPE_WIFI);
        assertEquals(DATA_SAVER_SUMMARY + "\nAndroid's Data Saver is off. This network isn't metered.",
                HushTelegramPreferenceFragment.dataSaverSummary(DataSaverDownloads.status(app)));
        assertEquals(DATA_SAVER_SUMMARY + "\nAndroid doesn't say whether Data Saver is on. Android doesn't say whether this"
                        + " network is metered.",
                HushTelegramPreferenceFragment.dataSaverSummary(DataSaverDownloads.status(null)));
    }

    /**
     * Flipping the Data Saver switch runs Telegram's download check once the switch is saved, so its
     * queue follows the switch now instead of at the next network change.
     */
    @Test
    public void flippingTheDataSaverSwitchRunsTelegramsCheckOnceItsSaved() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.FASTER_DOWNLOADS);
        Object downloads = new Object();
        List<String> checks = new ArrayList<>();
        DataSaverDownloadsForTests.checkWith(
                checked -> checks.add((checked == downloads) + " " + Settings.DATA_SAVER_DOWNLOADS.get()), downloads);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            SwitchPreference row = (SwitchPreference) pageOf(controller).findPreference(Settings.DATA_SAVER_DOWNLOADS.key);
            assertTrue(row.getOnPreferenceChangeListener().onPreferenceChange(row, Boolean.TRUE));
            row.setChecked(true);
            assertEquals("the check waits for the save", Collections.emptyList(), checks);
            ShadowLooper.idleMainLooper();
            assertEquals(Collections.singletonList("true true"), checks);

            assertTrue(row.getOnPreferenceChangeListener().onPreferenceChange(row, Boolean.FALSE));
            row.setChecked(false);
            ShadowLooper.idleMainLooper();
            assertEquals(Arrays.asList("true true", "true false"), checks);
        } finally {
            Settings.DATA_SAVER_DOWNLOADS.resetToDefault();
            DataSaverDownloadsForTests.reset();
        }
    }

    /**
     * Change sticker size brings a row for the size under its switch. A tap lists the four sizes
     * with the saved one checked, and a pick saves it at once and closes the list.
     */
    @Test
    public void theStickerSizeRowListsTheSizesAndSavesThePick() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.CHANGE_STICKER_SIZE);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            assertNull(pageOf(controller).findPreference(HushTelegramPreferenceFragment.STICKER_SIZE_ROW));
        }
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.CHANGE_STICKER_SIZE);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = new ArrayList<>();
            collect(pageOf(controller).getPreferenceScreen(), rows);
            int toggle = indexOfKey(rows, Settings.CHANGE_STICKER_SIZE.key);
            Preference size = rows.get(toggle + 1);
            assertEquals(HushTelegramPreferenceFragment.STICKER_SIZE_ROW, size.getKey());
            assertEquals("Look and feel", String.valueOf(size.getParent().getTitle()));
            assertFalse("it stores nothing itself", size.isPersistent());

            assertTrue(size.getOnPreferenceClickListener().onPreferenceClick(size));
            ShadowLooper.idleMainLooper();
            AlertDialog list = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            assertTrue(list.isShowing());
            assertEquals("Sticker size", String.valueOf(shadowOf(list).getTitle()));
            ListView choices = list.getListView();
            assertEquals(4, choices.getCount());
            List<String> labels = new ArrayList<>();
            for (int i = 0; i < choices.getCount(); i++) labels.add(String.valueOf(choices.getAdapter().getItem(i)));
            assertEquals(Arrays.asList("50%", "75%", "125%", "150%"), labels);
            assertEquals("the saved size is checked", 1, choices.getCheckedItemPosition());

            shadowOf(list).clickOnItem(3);
            settle();
            assertFalse(list.isShowing());
            assertEquals(150, (int) Settings.STICKER_SIZE.savedValue());
            assertEquals("150% of Telegram's size", String.valueOf(size.getSummary()));
            assertFalse("picking a size leaves the switch alone", Settings.CHANGE_STICKER_SIZE.savedValue());
        } finally {
            Settings.STICKER_SIZE.resetToDefault();
        }
    }

    /**
     * Save downloaded files brings the gallery folder row under its two switches when its target
     * went in (#30). A tap lists the three choices with the saved one checked, and a pick saves it
     * at once and closes the list.
     */
    @Test
    public void theGalleryFolderRowListsTheFoldersAndSavesThePick() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.SAVE_DOWNLOADS);
        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = pageOf(controller);
            assertNotNull(page.findPreference(Settings.SAVE_DOWNLOADS.key));
            assertNull("a build without the target has no row", page.findPreference(HushTelegramPreferenceFragment.GALLERY_FOLDER_ROW));
        }
        PatchFamily.capabilitiesForTests = null;
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = new ArrayList<>();
            collect(pageOf(controller).getPreferenceScreen(), rows);
            Preference folder = rows.get(indexOfKey(rows, Settings.SAVE_TIMED_MEDIA.key) + 1);
            assertEquals(HushTelegramPreferenceFragment.GALLERY_FOLDER_ROW, folder.getKey());
            assertEquals("Playback", String.valueOf(folder.getParent().getTitle()));
            assertFalse("it stores nothing itself", folder.isPersistent());
            assertEquals("Gallery folder", String.valueOf(folder.getTitle()));
            assertEquals("Photos and videos you save to the gallery go to Pictures/Telegram and Movies/Telegram (Telegram's own)."
                    + " Camera photos and automatic saving keep Telegram's folders.", String.valueOf(folder.getSummary()));

            assertTrue(folder.getOnPreferenceClickListener().onPreferenceClick(folder));
            ShadowLooper.idleMainLooper();
            AlertDialog list = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            assertTrue(list.isShowing());
            assertEquals("Gallery folder", String.valueOf(shadowOf(list).getTitle()));
            ListView choices = list.getListView();
            List<String> labels = new ArrayList<>();
            for (int i = 0; i < choices.getCount(); i++) labels.add(String.valueOf(choices.getAdapter().getItem(i)));
            assertEquals(Arrays.asList("Pictures/Telegram and Movies/Telegram (Telegram's own)", "DCIM/Telegram",
                    "DCIM/Telegram/Photos and DCIM/Telegram/Videos"), labels);
            assertEquals("Telegram's folders are checked", 0, choices.getCheckedItemPosition());

            shadowOf(list).clickOnItem(1);
            settle();
            assertFalse(list.isShowing());
            assertEquals(app.hushtelegram.extension.telegram.misc.GalleryFolder.DCIM, Settings.GALLERY_FOLDER.savedValue());
            assertTrue(String.valueOf(folder.getSummary()).startsWith("Photos and videos you save to the gallery go to DCIM/Telegram."));
            assertFalse("picking a folder leaves the switch alone", Settings.SAVE_DOWNLOADS.savedValue());
            assertTrue("and owes no restart", AbstractPreferenceFragment.restartPending.isEmpty());
        } finally {
            Settings.GALLERY_FOLDER.resetToDefault();
        }
    }

    /**
     * Save downloaded files brings the storage folder switch under the gallery folder row when its
     * target went in (#7). Its summary says whether Android gives Telegram All files access, and
     * turning it on without that opens Android's page for it.
     */
    @Test
    public void theStorageFolderSwitchSaysWhetherAllFilesAccessIsOnAndOpensIt() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.SAVE_DOWNLOADS);
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.GALLERY_FOLDER);
        app.hushtelegram.extension.telegram.misc.StorageFolderTest.allFilesAccess(false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            assertNull("a build without the target has no row", pageOf(controller).findPreference(Settings.STORAGE_FOLDER.key));
        }
        PatchFamily.capabilitiesForTests = null;
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = new ArrayList<>();
            collect(pageOf(controller).getPreferenceScreen(), rows);
            SwitchPreference storage = (SwitchPreference) rows.get(indexOfKey(rows, HushTelegramPreferenceFragment.GALLERY_FOLDER_ROW) + 1);
            assertEquals(Settings.STORAGE_FOLDER.key, storage.getKey());
            assertEquals("Playback", String.valueOf(storage.getParent().getTitle()));
            assertEquals("Keep Telegram's files in internal storage", String.valueOf(storage.getTitle()));
            assertFalse(storage.isChecked());
            assertEquals("New photos, videos and files Telegram downloads go to Internal storage/Telegram, where file managers"
                    + " and other apps can open them, instead of Android/data. Files downloaded before stay in Android/data,"
                    + " and Telegram still opens them from there. Needs All files access and a restart.\nAll files access is off, so Telegram's files stay in Android/data."
                    + " Turning this on opens the setting.", String.valueOf(storage.getSummary()));

            assertTrue(storage.getOnPreferenceChangeListener().onPreferenceChange(storage, true));
            android.content.Intent opened = shadowOf(controller.get()).getNextStartedActivity();
            assertEquals(android.provider.Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION, opened.getAction());
            assertEquals("package:" + controller.get().getPackageName(), String.valueOf(opened.getData()));
            assertTrue("turning it off opens nothing", storage.getOnPreferenceChangeListener().onPreferenceChange(storage, false));
            assertNull(shadowOf(controller.get()).getNextStartedActivity());

            app.hushtelegram.extension.telegram.misc.StorageFolderTest.allFilesAccess(true);
            try {
                assertTrue(HushTelegramPreferenceFragment.storageFolderSummary(true).endsWith("\nAll files access is on."));
                assertTrue(storage.getOnPreferenceChangeListener().onPreferenceChange(storage, true));
                assertNull("with access there's nothing to open", shadowOf(controller.get()).getNextStartedActivity());
            } finally {
                app.hushtelegram.extension.telegram.misc.StorageFolderTest.allFilesAccess(false);
            }
        } finally {
            Settings.STORAGE_FOLDER.resetToDefault();
        }
    }

    /**
     * Translate with an outside service brings a Translate into row under the service (#35). A tap
     * lists Telegram's language and then every language Google's web translate knows, the search
     * finds one by any of its names, and a pick saves it at once and closes the list.
     */
    @Test
    public void theTranslateIntoRowListsEveryLanguageAndSavesThePick() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.OUTSIDE_TRANSLATE);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = new ArrayList<>();
            collect(pageOf(controller).getPreferenceScreen(), rows);
            Preference row = rows.get(indexOfKey(rows, TranslateServiceEditor.KEY) + 1);
            assertEquals(TranslateTargetPicker.KEY, row.getKey());
            assertEquals("Translate into", String.valueOf(row.getTitle()));
            assertFalse("it stores nothing itself", row.isPersistent());
            assertEquals("Language for outside translations: Telegram's language. Tap to pick another.",
                    String.valueOf(row.getSummary()));

            assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
            ShadowLooper.idleMainLooper();
            AlertDialog list = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            assertTrue(list.isShowing());
            assertEquals("Translate into", String.valueOf(shadowOf(list).getTitle()));
            assertEquals("the keyboard makes room rather than covering Cancel",
                    android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,
                    list.getWindow().getAttributes().softInputMode & android.view.WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST);
            View decor = list.getWindow().getDecorView();
            EditText search = decor.findViewWithTag(TranslateTargetPicker.SEARCH);
            ListView choices = decor.findViewWithTag(TranslateTargetPicker.LIST);
            assertEquals(app.hushtelegram.extension.telegram.misc.TranslateTarget.LANGUAGES.size() + 1, choices.getCount());
            assertEquals("Telegram's language", String.valueOf(choices.getAdapter().getItem(0)));
            assertEquals("Telegram's language is checked", 0, choices.getCheckedItemPosition());

            // By its name in the app's language, its own name or its code. Persian comes with
            // Afghanistan's, which Google lists as Dari.
            for (String typed : new String[]{"persian", "فارسی"}) {
                search.setText(typed);
                assertEquals(typed, 2, choices.getCount());
                assertTrue(typed, String.valueOf(choices.getAdapter().getItem(persianIn(choices))).endsWith("(Persian)"));
                assertEquals("nothing shown is the saved one", ListView.INVALID_POSITION, choices.getCheckedItemPosition());
            }
            search.setText("Deutsch");
            assertEquals(1, choices.getCount());
            search.setText("zh-TW");
            assertEquals(1, choices.getCount());
            // The phone calls Twi Akan, so the row carries Google's name as well.
            search.setText("Twi");
            assertEquals(1, choices.getCount());
            String twi = String.valueOf(choices.getAdapter().getItem(0));
            assertTrue(twi, twi.contains("Akan") && twi.endsWith("(Twi)"));
            search.setText("");
            assertEquals(app.hushtelegram.extension.telegram.misc.TranslateTarget.LANGUAGES.size() + 1, choices.getCount());
            assertEquals(0, choices.getCheckedItemPosition());

            search.setText("persian");
            choices.performItemClick(null, persianIn(choices), 0);
            assertFalse("a second tap can't land while the pick saves", choices.isEnabled());
            settle();
            assertFalse(list.isShowing());
            assertEquals("fa", Settings.TRANSLATE_TARGET.savedValue());
            assertTrue(String.valueOf(row.getSummary()), String.valueOf(row.getSummary()).contains("(Persian)"));
            assertTrue("and owes no restart", AbstractPreferenceFragment.restartPending.isEmpty());

            assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
            ShadowLooper.idleMainLooper();
            ListView again = ShadowAlertDialog.getLatestDialog().getWindow().getDecorView().findViewWithTag(TranslateTargetPicker.LIST);
            int saved = again.getCheckedItemPosition();
            assertTrue("Persian is checked", String.valueOf(again.getAdapter().getItem(saved)).endsWith("(Persian)"));
            assertEquals("and opens in view", saved, again.getSelectedItemPosition());
            ShadowAlertDialog.getLatestDialog().dismiss();
        } finally {
            Settings.TRANSLATE_TARGET.resetToDefault();
        }
    }

    /** Where Persian itself is among the rows shown. */
    private static int persianIn(ListView choices) {
        for (int i = 0; i < choices.getCount(); i++) {
            if (String.valueOf(choices.getAdapter().getItem(i)).endsWith("(Persian)")) return i;
        }
        throw new AssertionError("no Persian row");
    }

    /** A build whose unread counts can't skip the hidden chats says the folder tabs still count them. */
    @Test
    public void hidePickedChatsSaysWhenTheFolderTabsStillCountThem() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_FOLDER_COUNTERS);
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.HIDDEN_CHATS);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            assertEquals("The chats you pick below leave All Chats, your folders and archived chats. They keep their messages "
                    + "and notifications, search still finds them, and nothing changes on your other devices. Each account "
                    + "keeps its own list. Folder tab counts and the app badge still count their unread messages.",
                    String.valueOf(pageOf(controller).findPreference(Settings.HIDDEN_CHATS.key).getSummary()));
        } finally {
            PatchFamily.capabilitiesForTests = null;
        }
    }

    /**
     * Hide folder tab counters brings the folder at launch switch and, under it, a row that lists
     * All Chats and the account's folders and saves the pick for the account shown.
     */
    @Test
    public void theFolderToOpenRowListsTheFoldersAndSavesThePick() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_FOLDER_COUNTERS);
        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = pageOf(controller);
            assertNull("a build without the target has no switch", page.findPreference(Settings.LAUNCH_FOLDER.key));
            assertNull("or row", page.findPreference(HushTelegramPreferenceFragment.LAUNCH_FOLDER_ROW));
            assertNull("or Hide All Chats", page.findPreference(Settings.HIDE_ALL_CHATS.key));
        }
        PatchFamily.capabilitiesForTests = null;
        LaunchFolderForTests.signedIn(1000, "Work", "Friends");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = new ArrayList<>();
            collect(pageOf(controller).getPreferenceScreen(), rows);
            int toggle = indexOfKey(rows, Settings.LAUNCH_FOLDER.key);
            Preference folder = rows.get(toggle + 1);
            assertEquals(HushTelegramPreferenceFragment.LAUNCH_FOLDER_ROW, folder.getKey());
            assertSame(rows.get(toggle).getParent(), folder.getParent());
            // Hide All Chats right under the row, since it opens on that pick.
            assertEquals(Settings.HIDE_ALL_CHATS.key, rows.get(toggle + 2).getKey());
            assertFalse("it stores nothing itself", folder.isPersistent());
            assertEquals("All Chats", String.valueOf(folder.getSummary()));

            AlertDialog list = dialogOf(folder);
            assertTrue(list.isShowing());
            assertEquals("Folder to open", String.valueOf(shadowOf(list).getTitle()));
            ListView choices = list.getListView();
            List<String> labels = new ArrayList<>();
            for (int i = 0; i < choices.getCount(); i++) labels.add(String.valueOf(choices.getAdapter().getItem(i)));
            assertEquals(Arrays.asList("All Chats", "Work", "Friends"), labels);
            assertEquals("nothing picked yet", 0, choices.getCheckedItemPosition());

            shadowOf(list).clickOnItem(2);
            settle();
            assertFalse(list.isShowing());
            // Saved with its name, so a folder made later in its place isn't taken for it.
            assertEquals(2, LaunchFolder.picked(1000).id);
            assertEquals("Friends", LaunchFolder.picked(1000).name);
            assertEquals("Friends", String.valueOf(folder.getSummary()));
            assertFalse("picking a folder leaves the switch alone", Settings.LAUNCH_FOLDER.savedValue());

            list = dialogOf(folder);
            assertEquals("the pick is checked", 2, list.getListView().getCheckedItemPosition());
            shadowOf(list).clickOnItem(0);
            settle();
            assertNull(LaunchFolder.picked(1000));
            assertEquals("All Chats", String.valueOf(folder.getSummary()));

            // Signed out, no folders yet, or folders that can't be read: a note instead of a list.
            for (Object[] state : new Object[][]{{0L, "Sign in to Telegram first."}, {1000L, "You don't have any folders yet."},
                    {-1L, "Couldn't read your folders."}}) {
                if ((Long) state[0] < 0) LaunchFolderForTests.unreadable();
                else LaunchFolderForTests.signedIn((Long) state[0]);
                ShadowToast.reset();
                ShadowAlertDialog.reset();
                assertTrue(folder.getOnPreferenceClickListener().onPreferenceClick(folder));
                ShadowLooper.idleMainLooper();
                assertNull(ShadowAlertDialog.getLatestAlertDialog());
                assertEquals(state[1], ShadowToast.getTextOfLatestToast());
            }
            // The page still builds, and the row names All Chats.
            assertEquals("All Chats", HushTelegramPreferenceFragment.launchFolderSummary());
        } finally {
            LaunchFolderForTests.restore();
        }
    }

    /** With Hide All Chats on and All Chats still in the tabs, its summary names why the chat list kept it (#38). */
    @Test
    public void hideAllChatsNamesWhyTheChatListKeptAllChats() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_FOLDER_COUNTERS, PatchFamily.HIDE_CONTACTS_TAB);
        String base = HushTelegramPreferenceFragment.hideAllChatsSummary();
        String sideMenu = base + " All Chats is still showing because it holds your only way to Archived Chats. Turn on "
                + "the side menu to give the archive another way in.";
        Settings.HIDE_ALL_CHATS.save(true);
        try {
            assertNull("a list that leaves it out", LaunchFolderForTests.built(true, "Work"));
            assertEquals(base, HushTelegramPreferenceFragment.hideAllChatsSummary());

            assertEquals(LaunchFolder.Kept.NO_FOLDER, LaunchFolderForTests.built(true));
            assertEquals(base + " All Chats is still showing because this account has no folder of its own to open, or "
                    + "each one is locked.", HushTelegramPreferenceFragment.hideAllChatsSummary());

            assertEquals(LaunchFolder.Kept.NO_ARCHIVE, LaunchFolderForTests.built(false, "Work"));
            assertEquals(sideMenu, HushTelegramPreferenceFragment.hideAllChatsSummary());
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                assertEquals("the page's row", sideMenu,
                        String.valueOf(pageOf(controller).findPreference(Settings.HIDE_ALL_CHATS.key).getSummary()));
            }
            // A build without the side menu has the menu entry as its other way in.
            PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.HIDE_ALL_CHATS);
            assertEquals(base + " All Chats is still showing because it holds your only way to Archived Chats. Patch "
                    + "again with Disable pull to archive to give the archive another way in.",
                    HushTelegramPreferenceFragment.hideAllChatsSummary());
            PatchFamily.capabilitiesForTests = null;

            // Tabs the stubs can't read.
            LaunchFolderForTests.signedIn(1000, "Work");
            LaunchFolder.firstTabs(new Object());
            assertEquals(LaunchFolder.Kept.NO_STRIP, LaunchFolder.kept());
            assertEquals(base + " All Chats is still showing because the folder tabs couldn't be read. The diagnostic "
                    + "report has the details.", HushTelegramPreferenceFragment.hideAllChatsSummary());

            // Turned off, the summary only says what the switch does.
            Settings.HIDE_ALL_CHATS.save(false);
            assertEquals(base, HushTelegramPreferenceFragment.hideAllChatsSummary());
        } finally {
            LaunchFolderForTests.restore();
            Settings.HIDE_ALL_CHATS.resetToDefault();
        }
    }

    /**
     * Hide folder tab counters also brings the hidden chats switch and, under it, a row that lists
     * the account's chats, archived ones included, and saves the ticked ones for that account.
     */
    @Test
    public void theChatsToHideRowListsTheChatsAndSavesTheTicks() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_FOLDER_COUNTERS);
        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = pageOf(controller);
            assertNull("a build without the hook has no switch", page.findPreference(Settings.HIDDEN_CHATS.key));
            assertNull("or row", page.findPreference(HushTelegramPreferenceFragment.HIDDEN_CHATS_ROW));
        }
        PatchFamily.capabilitiesForTests = null;
        HiddenChatsForTests.Fake telegram = HiddenChatsForTests.use(new HiddenChatsForTests.Fake().chats(0, 0, 11, 12).chats(0, 1, 13));
        telegram.users.put(0, 1000L);
        telegram.names.put(11L, "Alice");
        telegram.names.put(12L, "Book club");
        telegram.names.put(13L, "Old news");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = new ArrayList<>();
            collect(pageOf(controller).getPreferenceScreen(), rows);
            int toggle = indexOfKey(rows, Settings.HIDDEN_CHATS.key);
            Preference chats = rows.get(toggle + 1);
            assertEquals(HushTelegramPreferenceFragment.HIDDEN_CHATS_ROW, chats.getKey());
            assertSame(rows.get(toggle).getParent(), chats.getParent());
            assertFalse("it stores nothing itself", chats.isPersistent());
            assertEquals("No chats hidden yet.", String.valueOf(chats.getSummary()));

            AlertDialog list = dialogOf(chats);
            assertTrue(list.isShowing());
            assertEquals("Chats to hide", String.valueOf(shadowOf(list).getTitle()));
            ListView choices = list.getListView();
            List<String> labels = new ArrayList<>();
            for (int i = 0; i < choices.getCount(); i++) labels.add(String.valueOf(choices.getAdapter().getItem(i)));
            assertEquals("the chat list, then the archive", Arrays.asList("Alice", "Book club", "Old news"), labels);
            shadowOf(list).clickOnItem(1);
            shadowOf(list).clickOnItem(2);
            assertTrue("a tick alone doesn't close the list", list.isShowing());
            assertEquals("or save", Collections.emptySet(), HiddenChats.hidden(1000));
            list.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(list.isShowing());
            assertEquals(new LinkedHashSet<>(Arrays.asList(12L, 13L)), HiddenChats.hidden(1000));
            assertEquals("the chat list sorts again at once", Collections.singletonList(0), telegram.resorted);
            assertEquals("Book club, Old news", String.valueOf(chats.getSummary()));
            assertFalse("ticking chats leaves the switch alone", Settings.HIDDEN_CHATS.savedValue());

            // A hidden chat Telegram no longer lists still shows, so it can be unticked.
            telegram.chats(0, 1);
            list = dialogOf(chats);
            assertEquals(3, list.getListView().getCount());
            assertTrue("the saved ones are ticked", list.getListView().isItemChecked(1) && list.getListView().isItemChecked(2));
            assertFalse(list.getListView().isItemChecked(0));
            shadowOf(list).clickOnItem(1);
            shadowOf(list).clickOnItem(2);
            list.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals(Collections.emptySet(), HiddenChats.hidden(1000));
            assertEquals("No chats hidden yet.", String.valueOf(chats.getSummary()));

            // Flipping the switch sorts each signed-in account's chat list again too.
            telegram.resorted.clear();
            telegram.users.put(2, 3000L);
            assertTrue(rows.get(toggle).getOnPreferenceChangeListener().onPreferenceChange(rows.get(toggle), Boolean.TRUE));
            ShadowLooper.idleMainLooper();
            assertEquals(Arrays.asList(0, 2), telegram.resorted);
            telegram.users.remove(2);

            // Signed out, no chats yet, or chats that can't be read: a note instead of a list.
            for (Object[] state : new Object[][]{{0L, "Sign in to Telegram first."}, {1000L, "You don't have any chats yet."},
                    {-1L, "Couldn't read your chats."}}) {
                HiddenChatsForTests.Fake other = HiddenChatsForTests.use(new HiddenChatsForTests.Fake());
                if ((Long) state[0] < 0) other.broken = true;
                else other.users.put(0, (Long) state[0]);
                ShadowToast.reset();
                ShadowAlertDialog.reset();
                assertTrue(chats.getOnPreferenceClickListener().onPreferenceClick(chats));
                ShadowLooper.idleMainLooper();
                assertNull(ShadowAlertDialog.getLatestAlertDialog());
                assertEquals(state[1], ShadowToast.getTextOfLatestToast());
            }
            assertEquals("No chats hidden yet.", HushTelegramPreferenceFragment.hiddenChatsSummary(null));
        } finally {
            HiddenChatsForTests.restore();
        }
    }

    /**
     * Folder tabs ask for their counts only when the counts change, so flipping Hide folder tab
     * counters has every signed-in account's tabs counted again instead of waiting for a restart.
     */
    @Test
    public void hideFolderCountersCountsTheTabsAgainAtOnce() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_FOLDER_COUNTERS);
        HiddenChatsForTests.Fake telegram = HiddenChatsForTests.use(new HiddenChatsForTests.Fake());
        telegram.users.put(0, 1000L);
        telegram.users.put(2, 3000L);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Preference counters = pageOf(controller).findPreference(Settings.HIDE_FOLDER_COUNTERS.key);
            for (Boolean value : new Boolean[]{Boolean.TRUE, Boolean.FALSE}) {
                telegram.recounted.clear();
                assertTrue(counters.getOnPreferenceChangeListener().onPreferenceChange(counters, value));
                assertTrue("not before the switch is saved", telegram.recounted.isEmpty());
                ShadowLooper.idleMainLooper();
                assertEquals(value + " counts each signed-in account again", Arrays.asList(0, 2), telegram.recounted);
            }
        } finally {
            HiddenChatsForTests.restore();
        }
    }

    /**
     * Holiday look brings a row for the text beside the chat list's title, under its switch. A tap
     * opens an editor that saves the text cleaned and refuses text that's too long, and a restart
     * is owed only while the saved text isn't the one running.
     */
    @Test
    public void theTitleEmojiRowSavesCleanTextAndSaysWhenARestartIsOwed() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HOLIDAY_LOOK);
        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            assertNull("a build without the title target has no row", pageOf(controller).findPreference(TitleEmojiEditor.KEY));
        }
        PatchFamily.capabilitiesForTests = null;
        String tree = new String(Character.toChars(0x1F384));
        String invitation = "Add an emoji or a few letters after Telegram's name at the top of the chat list. It stays on "
                + "this phone, and your Premium emoji status is left alone.";
        ShadowToast.reset();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = new ArrayList<>();
            collect(pageOf(controller).getPreferenceScreen(), rows);
            Preference row = rows.get(indexOfKey(rows, Settings.HOLIDAY_LOOK.key) + 1);
            assertEquals(TitleEmojiEditor.KEY, row.getKey());
            assertEquals("Emoji next to the chat list title", String.valueOf(row.getTitle()));
            assertEquals(invitation, String.valueOf(row.getSummary()));
            assertFalse("it stores nothing itself", row.isPersistent());

            assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
            ShadowLooper.idleMainLooper();
            AlertDialog editor = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            assertTrue(editor.isShowing());
            assertEquals("Emoji next to the chat list title", String.valueOf(shadowOf(editor).getTitle()));
            EditText field = editor.findViewById(android.R.id.edit);
            assertEquals("", field.getText().toString());
            StringBuilder tooLong = new StringBuilder();
            for (int i = 0; i <= app.hushtelegram.extension.telegram.misc.TitleEmoji.MAX_CODE_POINTS; i++) tooLong.append(tree);
            field.setText(tooLong);
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertTrue("too long keeps the dialog", editor.isShowing());
            assertEquals("That's too long. Try an emoji or two, or a short word.", ShadowToast.getTextOfLatestToast());
            assertEquals("", Settings.TITLE_EMOJI.savedValue());

            field.setText("  " + tree + "\n");
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            // The write is on the worker, and the dialog closes once its answer is back.
            settle();
            assertFalse(editor.isShowing());
            assertEquals("saved cleaned", tree, Settings.TITLE_EMOJI.savedValue());
            assertTrue("the chat list shows it after a restart",
                    app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending
                            .contains(Settings.TITLE_EMOJI.key));
            assertEquals(app.hushtelegram.extension.shared.L10n.isolate(tree) + " shows after Telegram's name at the top "
                    + "of the chat list, on this phone only. Tap to change it.", String.valueOf(row.getSummary()));

            // Cleared again, it's what Telegram runs with, so nothing waits for a restart.
            assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
            ShadowLooper.idleMainLooper();
            editor = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            field = editor.findViewById(android.R.id.edit);
            assertEquals(tree, field.getText().toString());
            field.setText("");
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(editor.isShowing());
            assertEquals("", Settings.TITLE_EMOJI.savedValue());
            assertEquals("Saved.", ShadowToast.getTextOfLatestToast());
            assertFalse(app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending
                    .contains(Settings.TITLE_EMOJI.key));
            assertEquals(invitation, String.valueOf(row.getSummary()));
        } finally {
            Settings.TITLE_EMOJI.resetToDefault();
            app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending
                    .remove(Settings.TITLE_EMOJI.key);
        }
    }

    @Test
    public void aListThatIsTooLongOrHasALongLineIsSaid() {
        StringBuilder many = new StringBuilder();
        for (int i = 0; i <= app.hushtelegram.extension.telegram.misc.MessageFilters.MAX_FILTERS; i++) many.append("word").append(i).append('\n');
        assertEquals("A list holds up to 100 filters.", FilterEditor.refusal(many.toString()));
        assertEquals("Line 2 is longer than 200 characters.",
                FilterEditor.refusal("ok\n" + new String(new char[201]).replace('\0', 'x')));
        assertNull(FilterEditor.refusal(""));
        assertNull(FilterEditor.refusal("\n  \n"));
    }

    /**
     * Save names the line whose count only makes work, and the line a list's expressions run out of
     * room at, and saves neither list. Each of the second list's lines is fine alone.
     */
    @Test
    public void saveNamesTheLineACountMakesSlowAndTheLineAListRunsOutAt() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_BY_KEYWORD);
        ShadowToast.reset();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Preference groups = pageOf(controller).findPreference(FilterEditor.GROUPS);
            assertTrue(groups.getOnPreferenceClickListener().onPreferenceClick(groups));
            ShadowLooper.idleMainLooper();
            AlertDialog editor = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            EditText field = editor.findViewById(android.R.id.edit);

            field.setText("spam\n\n/\\d{4}-\\d{2}/\n/(?:(?=x)){16777215}(?!x)/");
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertTrue("a count that only makes work keeps the dialog", editor.isShowing());
            assertEquals("Line 4 may be slow on long messages. Try a simpler pattern.", ShadowToast.getTextOfLatestToast());
            assertEquals("", Settings.MESSAGE_FILTERS_GROUPS.savedValue());

            StringBuilder heavy = new StringBuilder("spam\n");
            for (int i = 0; i < 7; i++) {
                String line = "/x.*a?b?c?d?" + i + "/";
                assertNull(line, MessageFilters.problem(line));
                heavy.append(line).append('\n');
            }
            field.setText(heavy);
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertTrue("a list past what its expressions may add up to keeps the dialog", editor.isShowing());
            assertEquals("Line 8 may be slow on long messages. Try a simpler pattern.", ShadowToast.getTextOfLatestToast());
            assertEquals("", Settings.MESSAGE_FILTERS_GROUPS.savedValue());
        } finally {
            Settings.MESSAGE_FILTERS_GROUPS.resetToDefault();
            Settings.MESSAGE_FILTERS_CHANNELS.resetToDefault();
        }
    }

    /**
     * Try runs a typed message against the lines as they stand, saved or not, and names the first
     * one that would hide it, or says why the list can't be tried in Save's words. None of it is
     * saved or toasted: the answer goes once either text changes, and the message is gone when the
     * editor opens again.
     */
    @Test
    public void theFilterEditorTriesAMessageWithoutKeepingIt() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_BY_KEYWORD);
        ShadowToast.reset();
        Settings.MESSAGE_FILTERS_GROUPS.save("saved line");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Preference groups = pageOf(controller).findPreference(FilterEditor.GROUPS);
            assertTrue(groups.getOnPreferenceClickListener().onPreferenceClick(groups));
            ShadowLooper.idleMainLooper();
            AlertDialog editor = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            EditText field = editor.findViewById(android.R.id.edit);
            EditText sample = editor.findViewById(android.R.id.input);
            TextView answer = editor.getWindow().getDecorView().findViewWithTag(EditorForm.ANSWER);
            Button tryIt = editor.getButton(AlertDialog.BUTTON_NEUTRAL);
            assertEquals("Try", tryIt.getText().toString());
            assertEquals(View.GONE, answer.getVisibility());
            assertFalse("the message stays out of the screen's saved state", sample.isSaveEnabled());
            assertTrue("and out of the keyboard's learning", (sample.getImeOptions() & EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING) != 0);
            assertEquals("and out of autofill", View.IMPORTANT_FOR_AUTOFILL_NO, sample.getImportantForAutofill());

            field.setText("airdrop\n\n/free\\s+crypto/\ncrypto");
            tryIt.performClick();
            settle();
            assertEquals(View.VISIBLE, answer.getVisibility());
            assertEquals("Type a message to try the filters on.", answer.getText().toString());

            sample.setText("Get FREE   crypto now");
            assertEquals("a changed text takes the answer away", View.GONE, answer.getVisibility());
            tryIt.performClick();
            settle();
            assertEquals("the first line that matches, numbered as shown",
                    "Line 3 would hide this message: ⁨/free\\s+crypto/⁩", answer.getText().toString());

            sample.setText("nothing to see");
            tryIt.performClick();
            settle();
            assertEquals("No filter here would hide this message.", answer.getText().toString());

            sample.setText("crypto");
            tryIt.performClick();
            sample.setText("crypto, changed before the answer came");
            settle();
            assertEquals("an answer for a message that has changed since isn't shown", View.GONE, answer.getVisibility());

            field.setText("spam\n/(a+)+/");
            sample.setText("aaaa");
            tryIt.performClick();
            settle();
            assertEquals("Line 2 may be slow on long messages. Try a simpler pattern.", answer.getText().toString());

            field.setText("\n\n");
            tryIt.performClick();
            settle();
            assertEquals("There are no filters to try yet.", answer.getText().toString());

            assertTrue("Try leaves the editor open", editor.isShowing());
            assertEquals("nothing tried is saved", "saved line", Settings.MESSAGE_FILTERS_GROUPS.savedValue());
            assertEquals("nor toasted", 0, ShadowToast.shownToastCount());

            editor.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertTrue(groups.getOnPreferenceClickListener().onPreferenceClick(groups));
            ShadowLooper.idleMainLooper();
            AlertDialog again = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            assertNotSame(editor, again);
            assertEquals("", ((EditText) again.findViewById(android.R.id.input)).getText().toString());
            assertEquals("saved line", ((EditText) again.findViewById(android.R.id.edit)).getText().toString());
        } finally {
            Settings.MESSAGE_FILTERS_GROUPS.resetToDefault();
            Settings.MESSAGE_FILTERS_CHANNELS.resetToDefault();
        }
    }

    /**
     * Try waits for its answer before it takes another tap, so taps can't stack checks on the
     * shared workers, and with no worker free it says so rather than checking on the main thread.
     */
    @Test
    public void theFilterEditorTriesOneMessageAtATimeAndNeverOnTheMainThread() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_BY_KEYWORD);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Preference groups = pageOf(controller).findPreference(FilterEditor.GROUPS);
            assertTrue(groups.getOnPreferenceClickListener().onPreferenceClick(groups));
            ShadowLooper.idleMainLooper();
            AlertDialog editor = (AlertDialog) ShadowAlertDialog.getLatestDialog();
            ((EditText) editor.findViewById(android.R.id.edit)).setText("crypto");
            ((EditText) editor.findViewById(android.R.id.input)).setText("crypto");
            TextView answer = editor.getWindow().getDecorView().findViewWithTag(EditorForm.ANSWER);
            Button tryIt = editor.getButton(AlertDialog.BUTTON_NEUTRAL);

            // A click that reaches the button while it waits, as a program or some accessibility paths can, starts nothing.
            tryIt.setEnabled(false);
            tryIt.performClick();
            settle();
            assertEquals("", answer.getText().toString());
            tryIt.setEnabled(true);

            tryIt.performClick();
            assertFalse("Try waits for the answer", tryIt.isEnabled());
            settle();
            assertTrue(tryIt.isEnabled());
            assertEquals("Line 1 would hide this message: ⁨crypto⁩", answer.getText().toString());

            try (app.hushtelegram.extension.shared.WorkerPoolForTests full = app.hushtelegram.extension.shared.WorkerPoolForTests.fill()) {
                tryIt.performClick();
                assertTrue("a refused check gives Try back", tryIt.isEnabled());
                assertEquals("and isn't checked on the main thread instead",
                        "Couldn't try it now. Try again in a moment.", answer.getText().toString());
            }
            settle();

            // A check that breaks gives Try back and still answers.
            answer.setText("");
            FilterEditor.check = (typed, message) -> { throw new IllegalStateException("broken check"); };
            tryIt.performClick();
            settle();
            assertTrue(tryIt.isEnabled());
            assertEquals("Couldn't try it now. Try again in a moment.", answer.getText().toString());
        } finally {
            FilterEditor.check = FilterEditor::verdict;
            Settings.MESSAGE_FILTERS_GROUPS.resetToDefault();
        }
    }

    /** Its row says nothing leaves the phone until a chat or message is turned on, so off forgets them. */
    @Test
    public void switchingOutsideTranslateOffForgetsTheChatsTurnedOn() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.OUTSIDE_TRANSLATE);
        Settings.OUTSIDE_TRANSLATE.save(true);
        app.hushtelegram.extension.telegram.misc.OutsideTranslateForTests.reset();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            assertTrue(OutsideTranslateForTests.toggleChat(7, 42));
            SwitchPreference row = (SwitchPreference) pageOf(controller).findPreference(Settings.OUTSIDE_TRANSLATE.key);
            assertTrue(row.getOnPreferenceChangeListener().onPreferenceChange(row, Boolean.TRUE));
            assertTrue("switching on forgot the chat", OutsideTranslateForTests.chatOn(7, 42));
            assertTrue(row.getOnPreferenceChangeListener().onPreferenceChange(row, Boolean.FALSE));
            app.hushtelegram.extension.telegram.misc.OutsideTranslateForTests.reset();
            assertFalse(OutsideTranslateForTests.chatOn(7, 42));
        } finally {
            Settings.OUTSIDE_TRANSLATE.resetToDefault();
            app.hushtelegram.extension.telegram.misc.OutsideTranslateForTests.reset();
        }
    }

    @Test
    public void localNotificationFactsStayReadableWhenTheRepairIsOffOrPaused() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.REPAIR_FIREBASE_PUSH);
        Settings.REPAIR_FIREBASE_PUSH.save(false);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            PauseForTests.pause(reason);
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                Preference status = pageOf(controller).findPreference("local_notification_status");
                assertNotNull("local facts must remain visible with repair off and Pause " + reason, status);
                assertEquals("Notification status on this phone", status.getTitle());
                assertTrue("local status opens details and Android settings", status.isSelectable());
                assertFalse("local facts must not become a saved preference", status.isPersistent());
                assertTrue(String.valueOf(status.getSummary()), String.valueOf(status.getSummary()).contains("Notification permission:"));
                assertTrue(String.valueOf(status.getSummary()), String.valueOf(status.getSummary()).contains("Signed-in accounts: Unknown"));
                assertTrue(String.valueOf(status.getSummary()), String.valueOf(status.getSummary()).contains("Tap for details and Android settings."));
                status.getOnPreferenceClickListener().onPreferenceClick(status);
                AlertDialog details = ShadowAlertDialog.getLatestAlertDialog();
                assertTrue(String.valueOf(shadowOf(details).getMessage()).contains("Accounts Telegram confirmed for notifications: Unknown"));
                details.dismiss();
            }
            PauseForTests.resume();
        }
        Settings.REPAIR_FIREBASE_PUSH.resetToDefault();
    }

    @Test
    public void omittedRepairHasNoLocalNotificationRowOrUnrelatedNotificationControls() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_ADS);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = pageOf(controller);
            assertEquals(null, page.findPreference("local_notification_status"));
            assertEquals(null, page.findPreference(Settings.REPAIR_FIREBASE_PUSH.key));
            assertFalse(sections(page).contains("Notifications"));
        }
    }

    /** Partial target matches used to show the complete-build promise beside the family switch. */
    @Test
    public void partialBuildRowsNameTheirSurvivingAndMissingCoverage() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        for (PatchFamily.Capability missing : PatchFamily.Capability.values()) {
            Set<PatchFamily.Capability> installed = EnumSet.allOf(PatchFamily.Capability.class);
            installed.remove(missing);
            PatchFamily.capabilitiesForTests = installed;
            List<PatchFamily.Capability> switchTargets = new ArrayList<>();
            for (PatchFamily.Capability target : missing.family.expectedCapabilities()) {
                if (!target.rowOnly) switchTargets.add(target);
            }
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                HushTelegramPreferenceFragment page = pageOf(controller);
                String summary = String.valueOf(page.findPreference(missing.family.switches.get(0).key).getSummary());
                if (missing.rowOnly) {
                    // Only that target's own row is gone; the switch still does what its description says.
                    assertFalse(missing + ": " + summary, summary.startsWith("This patched app"));
                } else if (switchTargets.size() == 1) {
                    assertEquals("This patched app doesn't change " + missing.label + ".", summary);
                } else {
                    assertTrue(summary, summary.startsWith("This patched app changes "));
                    assertTrue(summary, summary.endsWith(" but not " + missing.label + "."));
                    for (PatchFamily.Capability covered : switchTargets) {
                        if (covered != missing) assertTrue(summary, summary.contains(covered.label));
                    }
                }
                assertTrue("a build family's configuration switch was disabled", page.findPreference(missing.family.switches.get(0).key).isEnabled());
            }
        }

        // A complete build: every usage report hooked, so the row keeps its plain summary.
        PatchFamily.capabilitiesForTests = EnumSet.allOf(PatchFamily.Capability.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = pageOf(controller);
            assertEquals("Stops usage reports to Telegram, like how long you read each channel post and what you tap "
                    + "on Premium screens. Messages and calls work as before.",
                    String.valueOf(page.findPreference(Settings.DISABLE_ANALYTICS.key).getSummary()));
        }

        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = pageOf(controller);
            assertEquals("This patched app doesn't change "
                            + L10n.join(Arrays.asList("channel ads", "video ads", "search ads")) + ".",
                    String.valueOf(page.findPreference(Settings.HIDE_ADS.key).getSummary()));
            assertEquals("This patched app doesn't change " + L10n.join(Arrays.asList(
                            "channel read metrics", "Premium promo views",
                            "Premium promo taps", "Premium promo accepts", "Premium promo failures", "dual camera reports")) + ".",
                    String.valueOf(page.findPreference(Settings.DISABLE_ANALYTICS.key).getSummary()));
        }
    }

    @Test
    public void thePausedCardSaysWhatStaysInForEveryReason() {
        for (HushTelegramPause.Reason why : HushTelegramPause.Reason.values()) {
            String summary = HushTelegramPreferenceFragment.pausedSummary(why, "org.telegram.messenger.web");
            assertFalse(why + ": " + summary, UNPATCHED.matcher(summary).find());
            assertTrue(why + ": " + summary, summary.contains("Edits made when you patched stay in"));
            // Debug logging is kept as saved while paused, so the card can't say every switch is off.
            assertTrue(why + ": " + summary, summary.contains("Every switch except Debug logging"));
        }

        // The marker counts only in the app's own files folder, and the card names that folder,
        // not the one above it a person finds first. The folder is isolated, so a right-to-left
        // sentence keeps the path in the order it was written.
        String pkg = RuntimeEnvironment.getApplication().getPackageName();
        assertTrue(HushTelegramPreferenceFragment.pausedSummary(HushTelegramPause.Reason.MARKER_FILE, pkg)
                .contains("in " + L10n.isolate("Android/data/" + pkg + "/files") + " paused HushTelegram"));

        PauseForTests.pause(HushTelegramPause.Reason.CRASH_LOOP);
        // A crash-loop pause comes from safe mode, which stays on for the next start too. The card
        // reads that to say whether the next start still runs paused.
        BaseSettings.SAFE_MODE.save(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Preference card = rowsOf(controller).get(0);
            assertEquals("HushTelegram is paused", String.valueOf(card.getTitle()));
            assertEquals(HushTelegramPreferenceFragment.pausedSummary(HushTelegramPause.Reason.CRASH_LOOP, pkg)
                    + " Tap to turn it back on.", String.valueOf(card.getSummary()));
        }
    }

    /**
     * A version is a value set into a sentence, so the row that shows one isolates it: in a
     * right-to-left sentence "449.0.0.54.82" then keeps the order it was written in. The status
     * card leaves the versions to the About page and says only whether the controls are active.
     */
    @Test
    public void theVersionRowsIsolateTheVersions() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        Shadows.shadowOf(context.getPackageManager())
                .getInternalMutablePackageInfo(context.getPackageName()).versionName = "449.0.0.54.82";
        String threads = app.hushtelegram.extension.shared.Utils.getAppVersionName();
        assertTrue("no Telegram version to look for", threads != null && !threads.isEmpty());

        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = rowsOf(controller);
            Preference card = rows.get(0);
            assertEquals("HushTelegram is on", String.valueOf(card.getTitle()));
            assertEquals("Your switches are working.", String.valueOf(card.getSummary()));
            Preference version = null;
            for (Preference row : rows) {
                if ("Version".contentEquals(row.getTitle())) version = row;
            }
            assertNotNull("no Version row", version);
            assertTrue(String.valueOf(version.getSummary()), String.valueOf(version.getSummary()).contains(L10n.isolate(threads)));
        }
    }

    /**
     * The page's own dialogs are drawn over its activity's window: the list of sections and
     * Licenses. Open when the page went, on a rotation, Back or Telegram closing, they outlived that
     * window, which Android reports as a leaked window.
     */
    @Test
    public void thePagesDialogsCloseWhenItsViewGoes() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = rowsOf(controller);
            List<AlertDialog> open = new ArrayList<>();
            Preference jump = rows.get(indexOfKey(rows, "action_jump_to_section"));
            jump.getOnPreferenceClickListener().onPreferenceClick(jump);
            open.add(ShadowAlertDialog.getLatestAlertDialog());
            Preference licenses = null;
            for (Preference row : rows) if ("Licenses".contentEquals(row.getTitle())) licenses = row;
            assertNotNull("no Licenses row", licenses);
            licenses.getOnPreferenceClickListener().onPreferenceClick(licenses);
            open.add(ShadowAlertDialog.getLatestAlertDialog());

            List<String> titles = new ArrayList<>();
            for (AlertDialog dialog : open) {
                assertTrue(dialog.isShowing());
                titles.add(String.valueOf(Shadows.shadowOf(dialog).getTitle()));
            }
            assertEquals(Arrays.asList("Jump to a section", "Licenses"), titles);

            controller.recreate();
            ShadowLooper.idleMainLooper();

            for (AlertDialog dialog : open) {
                assertFalse(Shadows.shadowOf(dialog).getTitle() + " outlived the page", dialog.isShowing());
            }
        }
    }

    /**
     * NOTICE's underlined headings read as rows of = and - on a phone. On screen each heading is
     * bold and the rules are gone, and every word of the notice is still there.
     */
    @Test
    public void theLicensesDialogShowsHeadingsInsteadOfRules() {
        CharSequence shown = HushTelegramPreferenceFragment.noticeForScreen(LicenseNotice.TEXT, Color.WHITE);
        String text = shown.toString();
        assertFalse("a rule line is still on screen", Pattern.compile("(?m)^[=-]{3,}$").matcher(text).find());
        assertFalse("removing the rules left a gap wider than NOTICE's own", text.contains("\n\n\n\n"));
        assertEquals("words went missing", LicenseNotice.TEXT.replaceAll("(?m)^[=-]{3,}$", "").replaceAll("\\s+", " ").trim(),
                text.replaceAll("\\s+", " ").trim());

        Spanned spans = (Spanned) shown;
        List<String> bold = new ArrayList<>();
        for (StyleSpan span : spans.getSpans(0, spans.length(), StyleSpan.class)) {
            if (span.getStyle() == Typeface.BOLD) bold.add(text.substring(spans.getSpanStart(span), spans.getSpanEnd(span)));
        }
        assertTrue(bold.toString(), bold.containsAll(Arrays.asList(
                "HushTelegram NOTICE", "Morphe: Project Name Restriction", "Trademarks", "Material Design icons")));
    }

    /**
     * A switch the file doesn't name stays the person's to change while an import writes. Tapped on
     * a second page with the import's commit still out, it's saved, running and shown on both pages
     * and on one built afterwards, whether the import lands or is put back. The switch the file
     * names waits out of reach meanwhile, for a tap and for Quick setups, and is back when it ends.
     *
     * <p>Every switch used to be shown from its Setting while an import ran, so the tap reached the
     * store and the row went back: the screen and the running value said off, and the next start
     * loaded on.
     */
    @Test
    public void aSwitchTappedWhileAnImportWritesIsSavedRunningAndShownOnEveryPage() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.NORMAL_PASTE);
        String file = new JSONObject().put("format", SettingsBackup.FORMAT).put("schema", SettingsBackup.SCHEMA)
                .put("settings", new JSONObject().put(Settings.HIDE_ADS.key, false)).toString();
        for (boolean lands : new boolean[]{true, false}) {
            String name = lands ? "an import that lands: " : "an import that's put back: ";
            ShadowToast.reset();
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                HushTelegramPreferenceFragment first = pageOf(controller);
                HushTelegramPreferenceFragment second = pageOf(controller);
                try (FailingStore store = lands ? FailingStore.holding()
                        : FailingStore.holding(FailingStore.Fault.COMMIT_THROWS)) {
                    first.pendingImport = SettingsBackup.parse(file).toBundle();
                    SettingsBackupPreference.showPreview(first);
                    ShadowAlertDialog.getLatestAlertDialog().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                    ShadowLooper.idleMainLooper();
                    assertTrue(name + "the import never reached its commit", store.awaitHeld());

                    for (HushTelegramPreferenceFragment page : Arrays.asList(first, second)) {
                        assertFalse(name + "a switch the import writes is in reach",
                                page.findPreference(Settings.HIDE_ADS.key).isEnabled());
                        assertEquals("Importing settings",
                                String.valueOf(page.findPreference("action_import_settings").getSummary()));
                    }
                    tap(second, Settings.HIDE_ADS.key);
                    assertEquals(name + "Quick setups reached a switch the import writes", 0,
                            second.applyQuickSetup(Collections.singletonMap(Settings.HIDE_ADS, false)));
                    assertFalse(name + "a tap reached a switch the import writes",
                            Setting.preferences.preferences.contains(Settings.HIDE_ADS.key));

                    tap(second, Settings.NORMAL_PASTE.key);
                    assertAgreed(name + "while it writes, ", Settings.NORMAL_PASTE, true, first, second);

                    store.letGo();
                    for (int round = 0; round < 3; round++) {
                        Utils.awaitBackgroundTasksForTests();
                        ShadowLooper.idleMainLooper();
                    }
                }
                assertEquals(name, lands ? "Settings imported. 1 switch changed."
                        : "Couldn't import the settings. Nothing was changed.", ShadowToast.getTextOfLatestToast());
                assertFalse(name + "the import still holds its switches",
                        AbstractPreferenceFragment.settingImportInProgress);
                assertAgreed(name, Settings.NORMAL_PASTE, true, first, second);
                assertAgreed(name, Settings.HIDE_ADS, !lands, first, second);

                controller.recreate();
                ShadowLooper.idleMainLooper();
                HushTelegramPreferenceFragment rebuilt = pageOf(controller);
                assertAgreed(name + "on a page built afterwards, ", Settings.NORMAL_PASTE, true, rebuilt);
                assertAgreed(name + "on a page built afterwards, ", Settings.HIDE_ADS, !lands, rebuilt);
            } finally {
                Settings.HIDE_ADS.resetToDefault();
                Settings.NORMAL_PASTE.resetToDefault();
            }
        }
    }

    /**
     * Save hands a filter list's write to the worker and waits for its answer. The tap comes
     * straight back and the page behind still takes a tap. The dialog stays up with its actions out
     * of reach until the answer is in, so a second Save starts nothing. A write that fails keeps the
     * dialog and what was typed, one that lands closes it, and a page that went in the meantime is
     * told nothing.
     *
     * <p>The write used to be made inside the tap, so the screen stood still for as long as the
     * disk took.
     */
    @Test
    public void aFilterSaveWaitsForItsWriteWithoutHoldingTheScreen() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_BY_KEYWORD);
        ShadowToast.reset();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = pageOf(controller);
            Preference groups = page.findPreference(FilterEditor.GROUPS);
            AlertDialog editor = dialogOf(groups);
            EditText field = editor.findViewById(android.R.id.edit);
            Button save = editor.getButton(AlertDialog.BUTTON_POSITIVE);

            field.setText("spam");
            try (FailingStore store = FailingStore.holding(FailingStore.Fault.COMMIT_THROWS)) {
                save.performClick();
                assertWaiting("a save that fails: ", store, editor);
                assertEquals("No filters yet.", String.valueOf(groups.getSummary()));
                assertEquals("the chat read the list before its write landed", "", Settings.MESSAGE_FILTERS_GROUPS.get());
                assertNull("something was said before the write was back", ShadowToast.getLatestToast());
                tap(page, Settings.HIDE_BY_KEYWORD.key);
                assertTrue("the page behind took no tap while the write was out",
                        ((SwitchPreference) page.findPreference(Settings.HIDE_BY_KEYWORD.key)).isChecked());
                assertTrue(Settings.HIDE_BY_KEYWORD.savedValue());

                field.setText("spam\nlater");
                save.performClick();
                store.letGo();
                settle();
            }
            assertTrue("a save that fails keeps the dialog", editor.isShowing());
            assertTrue("its actions are still out of reach", save.isEnabled());
            assertEquals("Couldn't save the filters. Try again in a moment.", ShadowToast.getTextOfLatestToast());
            assertEquals("what was typed is kept", "spam\nlater", field.getText().toString());
            assertEquals("the second Save wrote", "", Settings.MESSAGE_FILTERS_GROUPS.savedValue());
            assertEquals("No filters yet.", String.valueOf(groups.getSummary()));

            field.setText("spam");
            try (FailingStore store = FailingStore.holding()) {
                save.performClick();
                assertWaiting("a save that lands: ", store, editor);
                assertFalse("the list was in the store before its commit was let through",
                        Setting.preferences.preferences.contains(Settings.MESSAGE_FILTERS_GROUPS.key));
                assertEquals("the chat read the list before its write landed", "", Settings.MESSAGE_FILTERS_GROUPS.get());
                field.setText("later");
                save.performClick();
                store.letGo();
                settle();
            }
            assertFalse("a save that landed left the dialog up", editor.isShowing());
            assertEquals("Filters saved.", ShadowToast.getTextOfLatestToast());
            assertEquals("the second Save wrote over the first", "spam", Settings.MESSAGE_FILTERS_GROUPS.savedValue());
            assertEquals("1 filter.", String.valueOf(groups.getSummary()));

            AlertDialog left = dialogOf(groups);
            assertNotSame(editor, left);
            ((EditText) left.findViewById(android.R.id.edit)).setText("spam\nmore");
            ShadowToast.reset();
            try (FailingStore store = FailingStore.holding()) {
                left.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                assertTrue("the write never reached the store", store.awaitHeld());
                controller.get().getFragmentManager().beginTransaction().remove(page).commitNow();
                assertFalse("the dialog outlived its page", left.isShowing());
                store.letGo();
                settle();
            }
            assertEquals("the write a page left behind is lost", "spam\nmore", Settings.MESSAGE_FILTERS_GROUPS.savedValue());
            assertEquals("a page that's gone had its row changed", "1 filter.", String.valueOf(groups.getSummary()));
            assertNull("a page that's gone was told how its save went", ShadowToast.getLatestToast());
            assertEquals("2 filters.", String.valueOf(pageOf(controller).findPreference(FilterEditor.GROUPS).getSummary()));
        } finally {
            Settings.MESSAGE_FILTERS_GROUPS.resetToDefault();
            Settings.HIDE_BY_KEYWORD.resetToDefault();
        }
    }

    /**
     * A Save made while a settings import is writing is held back with a note. Nothing is written
     * and the dialog keeps what was typed, so the import can't land over the save or under it, and
     * a Save once the import is done goes through.
     */
    @Test
    public void aFilterSaveWaitsForASettingsImportToFinish() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_BY_KEYWORD);
        ShadowToast.reset();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Preference groups = pageOf(controller).findPreference(FilterEditor.GROUPS);
            AlertDialog editor = dialogOf(groups);
            EditText field = editor.findViewById(android.R.id.edit);
            Button save = editor.getButton(AlertDialog.BUTTON_POSITIVE);

            field.setText("spam");
            AbstractPreferenceFragment.settingImportInProgress = true;
            save.performClick();
            settle();
            assertEquals("Wait for the settings import to finish, then save again.", ShadowToast.getTextOfLatestToast());
            assertTrue("a save held back closed the dialog", editor.isShowing());
            assertTrue("a save held back left the actions out of reach", save.isEnabled());
            assertEquals("what was typed is kept", "spam", field.getText().toString());
            assertEquals("a save held back wrote", "", Settings.MESSAGE_FILTERS_GROUPS.savedValue());
            assertEquals("No filters yet.", String.valueOf(groups.getSummary()));

            AbstractPreferenceFragment.settingImportInProgress = false;
            save.performClick();
            settle();
            assertFalse("a save after the import left the dialog up", editor.isShowing());
            assertEquals("Filters saved.", ShadowToast.getTextOfLatestToast());
            assertEquals("spam", Settings.MESSAGE_FILTERS_GROUPS.savedValue());
        } finally {
            AbstractPreferenceFragment.settingImportInProgress = false;
            Settings.MESSAGE_FILTERS_GROUPS.resetToDefault();
            Settings.HIDE_BY_KEYWORD.resetToDefault();
        }
    }

    /** A size picked while a settings import is writing is held back like a Save, with the saved size checked again. */
    @Test
    public void aStickerSizePickHeldForAnImportChecksTheSavedSizeAgain() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.CHANGE_STICKER_SIZE);
        ShadowToast.reset();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Preference size = pageOf(controller).findPreference(HushTelegramPreferenceFragment.STICKER_SIZE_ROW);
            AlertDialog picker = dialogOf(size);
            AbstractPreferenceFragment.settingImportInProgress = true;
            shadowOf(picker).clickOnItem(3);
            settle();
            assertEquals("Wait for the settings import to finish, then save again.", ShadowToast.getTextOfLatestToast());
            assertTrue("a pick held back closed the list", picker.isShowing());
            assertEquals("the saved size is checked again", 1, picker.getListView().getCheckedItemPosition());
            assertEquals("a pick held back wrote", 75, (int) Settings.STICKER_SIZE.savedValue());
            assertEquals("75% of Telegram's size", String.valueOf(size.getSummary()));

            // The import writes a size of its own while the list is open.
            Settings.STICKER_SIZE.save(125);
            shadowOf(picker).clickOnItem(0);
            settle();
            assertEquals("what the import saved is checked, not what the list opened with",
                    2, picker.getListView().getCheckedItemPosition());
            Settings.STICKER_SIZE.save(100);
            shadowOf(picker).clickOnItem(0);
            settle();
            assertEquals("a saved size that's none of the choices checks the default, as stickers read it",
                    1, picker.getListView().getCheckedItemPosition());
            assertEquals(100, (int) Settings.STICKER_SIZE.savedValue());
        } finally {
            AbstractPreferenceFragment.settingImportInProgress = false;
            Settings.STICKER_SIZE.resetToDefault();
        }
    }

    /**
     * The translation service's Save and Use Google write on the worker the same way, and the
     * service a message reads as it draws stays the saved one, read without a wait, until the write
     * has landed.
     *
     * <p>Both used to commit inside the tap while holding the lock every message takes to read the
     * service, so a slow disk stopped the chat behind the dialog as well.
     */
    @Test
    public void theTranslationServiceWaitsForItsWriteAndNoMessageWaitsWithIt() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.OUTSIDE_TRANSLATE);
        Context application = RuntimeEnvironment.getApplication();
        SharedPreferences file = application.getSharedPreferences(TRANSLATE_FILE, 0);
        file.edit().clear().commit();
        OutsideTranslateForTests.reset();
        ShadowToast.reset();
        String google = "Google's web translate. Tap to use an AI service with your own key.";
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = pageOf(controller);
            Preference row = page.findPreference(TranslateServiceEditor.KEY);
            AlertDialog editor = dialogOf(row);
            EditText key = editor.findViewById(android.R.id.edit);
            ((EditText) editor.findViewById(android.R.id.text1)).setText("https://openrouter.ai/api/v1");
            ((EditText) editor.findViewById(android.R.id.text2)).setText("deepseek/deepseek-chat");
            Button save = editor.getButton(AlertDialog.BUTTON_POSITIVE);

            key.setText("sk-test-123");
            try (FailingStore store = FailingStore.holding(FailingStore.Fault.LOST)) {
                Utils.setContext(store.over(application, TRANSLATE_FILE));
                save.performClick();
                assertWaiting("a save that fails: ", store, editor);
                long asked = System.nanoTime();
                assertFalse("the service changed before its write landed", OutsideTranslate.service().enabled());
                assertTrue("a message drawing waited for the service's write",
                        System.nanoTime() - asked < TimeUnit.SECONDS.toNanos(2));

                key.setText("sk-typed-since");
                save.performClick();
                // The keyboard's Done is the same Save.
                key.onEditorAction(EditorInfo.IME_ACTION_DONE);
                store.letGo();
                settle();
            } finally {
                Utils.setContext(application);
            }
            assertTrue("a save that fails keeps the dialog", editor.isShowing());
            assertTrue("its actions are still out of reach", save.isEnabled());
            assertEquals("Couldn't save the translation service. Try again in a moment.", ShadowToast.getTextOfLatestToast());
            assertEquals("what was typed is kept", "sk-typed-since", key.getText().toString());
            assertFalse("the second Save wrote", file.contains("ai_key"));
            assertEquals(google, String.valueOf(row.getSummary()));

            key.setText("sk-test-123");
            try (FailingStore store = FailingStore.holding()) {
                Utils.setContext(store.over(application, TRANSLATE_FILE));
                save.performClick();
                assertWaiting("a save that lands: ", store, editor);
                assertFalse("the key was in the file before its commit was let through", file.contains("ai_key"));
                assertEquals(google, String.valueOf(row.getSummary()));
                store.letGo();
                settle();
            } finally {
                Utils.setContext(application);
            }
            assertFalse("a save that landed left the dialog up", editor.isShowing());
            assertEquals("Translation service saved.", ShadowToast.getTextOfLatestToast());
            assertEquals("Your AI service at openrouter.ai, model deepseek/deepseek-chat.", String.valueOf(row.getSummary()));
            assertEquals("sk-test-123", file.getString("ai_key", null));

            editor = dialogOf(row);
            try (FailingStore store = FailingStore.holding()) {
                Utils.setContext(store.over(application, TRANSLATE_FILE));
                editor.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
                assertWaiting("Use Google: ", store, editor);
                assertTrue("the key was gone before its commit was let through", file.contains("ai_key"));
                assertTrue("the service changed before its write landed", OutsideTranslate.service().enabled());
                store.letGo();
                settle();
            } finally {
                Utils.setContext(application);
            }
            assertFalse("Use Google left the dialog up", editor.isShowing());
            assertEquals("Back to Google's web translate.", ShadowToast.getTextOfLatestToast());
            assertEquals(google, String.valueOf(row.getSummary()));
            assertFalse("Use Google forgets the key", file.contains("ai_key"));

            AlertDialog left = dialogOf(row);
            ((EditText) left.findViewById(android.R.id.edit)).setText("sk-test-456");
            ShadowToast.reset();
            try (FailingStore store = FailingStore.holding()) {
                Utils.setContext(store.over(application, TRANSLATE_FILE));
                left.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                assertTrue("the write never reached the store", store.awaitHeld());
                controller.get().getFragmentManager().beginTransaction().remove(page).commitNow();
                assertFalse("the dialog outlived its page", left.isShowing());
                store.letGo();
                settle();
            } finally {
                Utils.setContext(application);
            }
            assertEquals("the write a page left behind is lost", "sk-test-456", file.getString("ai_key", null));
            assertEquals("a page that's gone had its row changed", google, String.valueOf(row.getSummary()));
            assertNull("a page that's gone was told how its save went", ShadowToast.getLatestToast());
        } finally {
            Utils.setContext(application);
            file.edit().clear().commit();
            OutsideTranslateForTests.reset();
        }
    }

    /**
     * A sticker size picked from the list is written on the worker too. The list stays up, out of
     * reach, with the pick checked until the answer is in, and a second pick meanwhile starts
     * nothing. A write that fails checks the saved size again. Picks made on two pages land in the
     * order they were tapped.
     */
    @Test
    public void aStickerSizePickWaitsForItsWriteAndPicksLandInTheOrderTapped() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.CHANGE_STICKER_SIZE);
        ShadowToast.reset();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = pageOf(controller);
            Preference size = page.findPreference(HushTelegramPreferenceFragment.STICKER_SIZE_ROW);
            AlertDialog picker = dialogOf(size);

            try (FailingStore store = FailingStore.holding(FailingStore.Fault.COMMIT_THROWS)) {
                shadowOf(picker).clickOnItem(3);
                assertWaiting("a pick that fails: ", store, picker);
                assertEquals("the pick shows while it's written", 3, picker.getListView().getCheckedItemPosition());
                assertEquals("75% of Telegram's size", String.valueOf(size.getSummary()));
                assertEquals("stickers took the pick before its write landed", 75, (int) Settings.STICKER_SIZE.savedValue());
                shadowOf(picker).clickOnItem(0);
                store.letGo();
                settle();
            }
            assertTrue("a pick that fails keeps the list", picker.isShowing());
            assertTrue("the list is still out of reach", picker.getListView().isEnabled());
            assertEquals("the saved size is checked again", 1, picker.getListView().getCheckedItemPosition());
            assertEquals("Couldn't save the size. Try again in a moment.", ShadowToast.getTextOfLatestToast());
            assertEquals("the second pick was written", 75, (int) Settings.STICKER_SIZE.savedValue());
            assertEquals("75% of Telegram's size", String.valueOf(size.getSummary()));

            Preference otherSize = pageOf(controller).findPreference(HushTelegramPreferenceFragment.STICKER_SIZE_ROW);
            AlertDialog otherPicker = dialogOf(otherSize);
            assertNotSame(picker, otherPicker);
            try (FailingStore store = FailingStore.holding()) {
                shadowOf(picker).clickOnItem(3);
                assertWaiting("the first of two picks: ", store, picker);
                assertFalse("the size was in the store before its commit was let through",
                        Setting.preferences.preferences.contains(Settings.STICKER_SIZE.key));
                assertEquals("stickers took the pick before its write landed", 75, (int) Settings.STICKER_SIZE.savedValue());
                shadowOf(otherPicker).clickOnItem(0);
                ShadowLooper.idleMainLooper();
                assertTrue("the second pick didn't wait its turn", otherPicker.isShowing());
                store.letGo();
                settle();
            }
            assertFalse("a pick that landed left the list up", picker.isShowing());
            assertFalse("a pick that landed left the list up", otherPicker.isShowing());
            assertEquals("the picks landed out of order", 50, (int) Settings.STICKER_SIZE.savedValue());
            assertEquals("50% of Telegram's size", String.valueOf(otherSize.getSummary()));

            AlertDialog left = dialogOf(size);
            ShadowToast.reset();
            try (FailingStore store = FailingStore.holding()) {
                shadowOf(left).clickOnItem(2);
                assertTrue("the write never reached the store", store.awaitHeld());
                controller.get().getFragmentManager().beginTransaction().remove(page).commitNow();
                assertFalse("the list outlived its page", left.isShowing());
                store.letGo();
                settle();
            }
            assertEquals("the write a page left behind is lost", 125, (int) Settings.STICKER_SIZE.savedValue());
            assertEquals("a page that's gone had its row changed", "50% of Telegram's size", String.valueOf(size.getSummary()));
            assertNull("a page that's gone was told how its save went", ShadowToast.getLatestToast());
        } finally {
            Settings.STICKER_SIZE.resetToDefault();
        }
    }

    /**
     * The worker takes 32 saves behind the one it's on. One more isn't started, and the dialog says
     * so the way it does for a write that failed: it stays, in reach, with what was typed.
     */
    @Test
    public void aSaveTheWorkerHasNoRoomForLeavesItsDialogInReach() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_BY_KEYWORD);
        ShadowToast.reset();
        CountDownLatch started = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        AtomicInteger unfinished = new AtomicInteger();
        Runnable filler = () -> {
            started.countDown();
            try {
                release.await(10, TimeUnit.SECONDS);
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
            } finally {
                unfinished.decrementAndGet();
            }
        };
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Preference groups = pageOf(controller).findPreference(FilterEditor.GROUPS);
            AlertDialog editor = dialogOf(groups);
            EditText field = editor.findViewById(android.R.id.edit);
            Button save = editor.getButton(AlertDialog.BUTTON_POSITIVE);
            field.setText("spam");

            // The worker has to be on the first one before the rest can fill everything behind it.
            unfinished.incrementAndGet();
            assertTrue(Utils.runInOrderOnBackgroundThread(filler));
            assertTrue("the worker never started", started.await(5, TimeUnit.SECONDS));
            while (true) {
                unfinished.incrementAndGet();
                if (!Utils.runInOrderOnBackgroundThread(filler)) break;
                assertTrue("the worker never ran out of room", unfinished.get() < 100);
            }
            unfinished.decrementAndGet();

            save.performClick();
            ShadowLooper.idleMainLooper();
            assertTrue("a save that never started closed the dialog", editor.isShowing());
            assertTrue("a save that never started left its actions out of reach", save.isEnabled());
            assertEquals("Couldn't save the filters. Try again in a moment.", ShadowToast.getTextOfLatestToast());
            assertEquals("spam", field.getText().toString());
            assertEquals("", Settings.MESSAGE_FILTERS_GROUPS.savedValue());

            release.countDown();
            long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(10);
            while (unfinished.get() > 0 && System.nanoTime() < deadline) Thread.sleep(5);
            assertEquals("the worker never caught up", 0, unfinished.get());
            save.performClick();
            settle();
            assertFalse("with room again, Save didn't go through", editor.isShowing());
            assertEquals("spam", Settings.MESSAGE_FILTERS_GROUPS.savedValue());
        } finally {
            release.countDown();
            Settings.MESSAGE_FILTERS_GROUPS.resetToDefault();
        }
    }

    /**
     * Clear diagnostic data hands its work to the same worker and waits out of reach for it. A page
     * that goes meanwhile leaves a row nothing draws, and that row isn't changed; the page drawn
     * next offers the Undo.
     */
    @Test
    public void theClearRowOfAPageThatWentIsLeftAsItWas() throws Exception {
        // Whatever an earlier test cleared is dropped, so the row starts on Clear.
        LogBufferManager.clearLogBuffer();
        LogBufferManager.clearLogBuffer();
        LogBufferManager.appendToLogBuffer("something to clear");
        CountDownLatch release = new CountDownLatch(1);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = pageOf(controller);
            Preference clear = page.findPreference("action_clear_diagnostic_data");
            assertEquals("Clear diagnostic data", String.valueOf(clear.getTitle()));

            // The worker is kept on something else, so the row's work waits behind it.
            assertTrue(Utils.runInOrderOnBackgroundThread(() -> {
                try {
                    release.await(10, TimeUnit.SECONDS);
                } catch (InterruptedException interrupted) {
                    Thread.currentThread().interrupt();
                }
            }));
            assertTrue(clear.getOnPreferenceClickListener().onPreferenceClick(clear));
            assertFalse("a row with its work out takes a tap", clear.isEnabled());
            assertFalse("the work was done inside the tap", LogBufferManager.canUndoClear());

            controller.get().getFragmentManager().beginTransaction().remove(page).commitNow();
            release.countDown();
            settle();
            assertTrue("the Clear a page left behind is lost", LogBufferManager.canUndoClear());
            assertEquals("a row whose page went was redrawn", "Clear diagnostic data", String.valueOf(clear.getTitle()));
            assertEquals("Undo", String.valueOf(
                    pageOf(controller).findPreference("action_clear_diagnostic_data").getTitle()));
        } finally {
            release.countDown();
            settle();
            LogBufferManager.clearLogBuffer();
            LogBufferManager.clearLogBuffer();
        }
    }

    /**
     * A save is out and held at [store]: its write is on a worker, the main thread is free, and
     * [dialog] waits with its actions out of reach.
     */
    private static void assertWaiting(String when, FailingStore store, AlertDialog dialog) throws Exception {
        assertTrue(when + "the write never reached the store", store.awaitHeld());
        assertNotSame(when + "the write is on the main thread", Looper.getMainLooper().getThread(), store.heldOn());
        ShadowLooper.idleMainLooper();
        assertTrue(when + "the dialog didn't wait for the write", dialog.isShowing());
        for (int which : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEUTRAL, AlertDialog.BUTTON_NEGATIVE}) {
            Button button = dialog.getButton(which);
            if (button != null) assertFalse(when + "button " + which + " is in reach", button.isEnabled());
        }
        if (dialog.getListView() != null) assertFalse(when + "the list is in reach", dialog.getListView().isEnabled());
    }

    /** Lets a save finish: its write on the worker, then its answer on the main thread. */
    private static void settle() throws Exception {
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
    }

    /** Taps [row] and answers the dialog it opens. */
    private static AlertDialog dialogOf(Preference row) {
        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        ShadowLooper.idleMainLooper();
        return ShadowAlertDialog.getLatestAlertDialog();
    }

    /** Taps the row for [key] the way a finger does, through the page's list. A row out of reach ignores it. */
    private static void tap(HushTelegramPreferenceFragment page, String key) {
        Preference row = page.findPreference(key);
        ListView list = page.getView().findViewById(android.R.id.list);
        int position = -1;
        for (int i = 0; i < list.getCount(); i++) if (list.getItemAtPosition(i) == row) position = i;
        assertTrue("no row in the list for " + key, position >= 0);
        list.performItemClick(null, position, list.getAdapter().getItemId(position));
    }

    /** [setting] is [expected] in the store, in the process and on each of [pages], with its row in reach. */
    private static void assertAgreed(String when, BooleanSetting setting, boolean expected,
                                     HushTelegramPreferenceFragment... pages) {
        Object stored = Setting.preferences.preferences.getAll().get(setting.key);
        assertEquals(when + setting.key + " in the store", expected, stored == null ? setting.defaultValue : stored);
        assertEquals(when + setting.key + " in the process", expected, setting.savedValue());
        for (HushTelegramPreferenceFragment page : pages) {
            SwitchPreference row = (SwitchPreference) page.findPreference(setting.key);
            assertEquals(when + setting.key + " on a page", expected, row.isChecked());
            assertTrue(when + setting.key + "'s row is out of reach", row.isEnabled());
        }
    }

    private static int indexOfKey(List<Preference> rows, String key) {
        for (int i = 0; i < rows.size(); i++) {
            if (key.equals(rows.get(i).getKey())) return i;
        }
        return -1;
    }

    private static String pageOf(PatchFamily family) {
        try {
            return ManagerCategories.pageOf(family);
        } catch (Exception unreadable) {
            throw new AssertionError(unreadable);
        }
    }

    private static HushTelegramPreferenceFragment pageOf(ActivityController<Activity> controller) {
        HushTelegramPreferenceFragment fragment = new HushTelegramPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction()
                .add(android.R.id.content, fragment)
                .commitNow();
        return fragment;
    }

    private static List<Preference> rowsOf(ActivityController<Activity> controller) {
        List<Preference> rows = new ArrayList<>();
        collect(pageOf(controller).getPreferenceScreen(), rows);
        assertFalse("the screen has no rows", rows.isEmpty());
        return rows;
    }

    /** The titles of the page's sections, in the order they're drawn. */
    private static List<String> sections(HushTelegramPreferenceFragment page) {
        List<String> titles = new ArrayList<>();
        PreferenceGroup screen = page.getPreferenceScreen();
        for (int i = 0; i < screen.getPreferenceCount(); i++) {
            if (screen.getPreference(i) instanceof PreferenceCategory) {
                titles.add(String.valueOf(screen.getPreference(i).getTitle()));
            }
        }
        return titles;
    }

    private static void assertReadable(List<Preference> rows) {
        for (Preference row : rows) {
            CharSequence title = row.getTitle();
            assertTrue("a row has no title: " + row.getClass().getSimpleName() + " " + row.getKey(),
                    title != null && title.toString().trim().length() > 0);

            TypedArray styled = row.getContext().obtainStyledAttributes(
                    new int[]{android.R.attr.textColorPrimary});
            try {
                ColorStateList primary = styled.getColorStateList(0);
                assertTrue("no primary text color for " + title, primary != null);
                assertTrue("\"" + title + "\" is drawn dark on the black page",
                        Color.luminance(primary.getDefaultColor()) > 0.5f);
            } finally {
                styled.recycle();
            }
        }
    }

    private static void collect(PreferenceGroup group, List<Preference> rows) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference preference = group.getPreference(i);
            if (preference instanceof PreferenceGroup) {
                collect((PreferenceGroup) preference, rows);
            } else {
                rows.add(preference);
            }
        }
    }
}
