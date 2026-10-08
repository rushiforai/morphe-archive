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
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Typeface;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;
import android.text.Spanned;
import android.text.style.StyleSpan;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;

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

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
        ROW_TITLES.put(PatchFamily.NO_HAPTICS, "Turn off haptic feedback");
        ROW_TITLES.put(PatchFamily.REACTION_EFFECTS_OFF, "Turn off reaction effects");
        ROW_TITLES.put(PatchFamily.HIDE_FOLDER_COUNTERS, "Hide folder tab counters");
        ROW_TITLES.put(PatchFamily.FORWARD_HIDE_SENDER, "Hide sender names when forwarding");
        ROW_TITLES.put(PatchFamily.VOICE_MUSIC_PLAYER, "Voice messages in the music player");
        ROW_TITLES.put(PatchFamily.SILENCE_NON_CONTACTS, "Silence people outside your contacts");
        ROW_TITLES.put(PatchFamily.DISABLE_ARCHIVE_PULL, "Disable pull to archive");
        ROW_TITLES.put(PatchFamily.REAR_CAMERA_FIRST, "Start the camera on the rear lens");
        ROW_TITLES.put(PatchFamily.HIDE_GALLERY_CAMERA_TILE, "Hide gallery camera tile");
        ROW_TITLES.put(PatchFamily.HIDE_STICKER_TIME, "Hide time on stickers");
        ROW_TITLES.put(PatchFamily.IGNORE_MUTED_MENTIONS, "Ignore mentions in muted chats");
        ROW_TITLES.put(PatchFamily.HIDE_BLOCKED_IN_GROUPS, "Hide blocked users in groups");
        ROW_TITLES.put(PatchFamily.HIDE_FEATURES_AND_INVITE, "Hide Telegram Features and Invite Friends");
        ROW_TITLES.put(PatchFamily.MESSAGE_MENU_REPEAT, "Add Repeat to the message menu");
        ROW_TITLES.put(PatchFamily.DISABLE_ANALYTICS, "Stop usage reports");
        ROW_TITLES.put(PatchFamily.DISABLE_CALL_DEBUG, "Stop call diagnostics");
        ROW_TITLES.put(PatchFamily.DISABLE_DRAFT_PREVIEWS, "No previews before sending");
        ROW_TITLES.put(PatchFamily.GALLERY_CAMERA_ON_TAP, "Camera only on tap");
        ROW_TITLES.put(PatchFamily.OPEN_EXTERNAL_LINKS, "Open links externally");
        ROW_TITLES.put(PatchFamily.STRIP_LINK_TRACKING, "Strip link tracking");
        ROW_TITLES.put(PatchFamily.DISABLE_UPDATE_CHECKS, "Turn off Telegram's update checks");
        ROW_TITLES.put(PatchFamily.REPAIR_FIREBASE_PUSH, "Repair Firebase push registration");
    }

    /** The sections every build has, in the order they're drawn. */
    private static final List<String> EVERY_BUILD = Arrays.asList(
            "Links", "Updates", "Pause", "Settings backup", "Diagnostics", "About");

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
                    String.valueOf(rows.get(pause).getSummary()).contains("every switch but Debug logging acts as if it were off. Changes made when you patched stay in"));
        }
    }

    /**
     * Each patch's row is on the screen only when the patch is in the build: alone, with every
     * other patch, and not at all. A section with nothing of its build to show isn't drawn, and the
     * sections every build needs always are.
     */
    @Test
    public void theFeatureRowsAreThePatchesInThisBuild() {
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
                List<String> expected = new ArrayList<>();
                if (build.contains(PatchFamily.HIDE_ADS) || build.contains(PatchFamily.HIDE_STORIES)
                        || build.contains(PatchFamily.HIDE_RECOMMENDATIONS) || build.contains(PatchFamily.HIDE_COMMERCE)
                        || build.contains(PatchFamily.HIDE_PROMOTIONAL_BANNERS) || build.contains(PatchFamily.HIDE_SPONSORED_PROXY)
                        || build.contains(PatchFamily.HIDE_POPULAR_APPS) || build.contains(PatchFamily.HIDE_CONTACTS_BLOCK)
                        || build.contains(PatchFamily.HIDE_GREETING_STICKERS)
                        || build.contains(PatchFamily.DISABLE_CHAT_SWIPE)
                        || build.contains(PatchFamily.DISABLE_CHANNEL_PULL)
                        || build.contains(PatchFamily.NORMAL_PASTE) || build.contains(PatchFamily.SHOW_LOCAL_IDS)
                        || build.contains(PatchFamily.DISABLE_DOUBLE_TAP_REACTIONS)
                        || build.contains(PatchFamily.QUIET_CONTACTS_NAG) || build.contains(PatchFamily.HOLIDAY_LOOK)
                        || build.contains(PatchFamily.USE_SYSTEM_FONT) || build.contains(PatchFamily.AMOLED_BLACK)
                        || build.contains(PatchFamily.HIDE_TRANSLATE_BAR)
                        || build.contains(PatchFamily.EXACT_NUMBERS)
                        || build.contains(PatchFamily.REVEAL_SPOILERS)
                        || build.contains(PatchFamily.HIDE_KEYBOARD_ON_SCROLL)
                        || build.contains(PatchFamily.KEEP_VIDEOS_MUTED)
                        || build.contains(PatchFamily.SWIPE_BACK_ON_PROFILES)
                        || build.contains(PatchFamily.HIDE_PHONE_NUMBER)
                        || build.contains(PatchFamily.MESSAGE_SECONDS)
                        || build.contains(PatchFamily.ALLOW_CHAT_BLUR)
                        || build.contains(PatchFamily.VOICE_ONE_AT_A_TIME)
                        || build.contains(PatchFamily.NO_HAPTICS)
                        || build.contains(PatchFamily.REACTION_EFFECTS_OFF)
                        || build.contains(PatchFamily.HIDE_FOLDER_COUNTERS)
                        || build.contains(PatchFamily.FORWARD_HIDE_SENDER)
                        || build.contains(PatchFamily.VOICE_MUSIC_PLAYER)
                        || build.contains(PatchFamily.SILENCE_NON_CONTACTS)
                        || build.contains(PatchFamily.DISABLE_ARCHIVE_PULL)
                        || build.contains(PatchFamily.REAR_CAMERA_FIRST)
                        || build.contains(PatchFamily.HIDE_GALLERY_CAMERA_TILE)
                        || build.contains(PatchFamily.HIDE_STICKER_TIME)
                        || build.contains(PatchFamily.IGNORE_MUTED_MENTIONS)
                        || build.contains(PatchFamily.HIDE_BLOCKED_IN_GROUPS)
                        || build.contains(PatchFamily.HIDE_FEATURES_AND_INVITE)
                        || build.contains(PatchFamily.MESSAGE_MENU_REPEAT)) expected.add("Chats");
                if (build.contains(PatchFamily.DISABLE_ANALYTICS) || build.contains(PatchFamily.DISABLE_CALL_DEBUG)
                        || build.contains(PatchFamily.DISABLE_DRAFT_PREVIEWS) || build.contains(PatchFamily.GALLERY_CAMERA_ON_TAP)) expected.add("Privacy");
                if (build.contains(PatchFamily.REPAIR_FIREBASE_PUSH)) expected.add("Notifications");
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
            assertEquals("Channels show no sponsored messages, search shows no sponsored accounts, and videos play "
                    + "without ads. Telegram never asks for them, so none are counted as seen.",
                    String.valueOf(page.findPreference(Settings.HIDE_ADS.key).getSummary()));
            assertEquals("Hide Stories", String.valueOf(page.findPreference(Settings.HIDE_STORIES.key).getTitle()));
            assertEquals("Hides the chat-list story bar, avatar story rings and Post Story button, and stops "
                    + "fetching the story list. Profile stories and archives remain available.",
                    String.valueOf(page.findPreference(Settings.HIDE_STORIES.key).getSummary()));
            assertEquals("Hide promotional banners", String.valueOf(page.findPreference(Settings.HIDE_PROMOTIONAL_BANNERS.key).getTitle()));
            assertEquals("Hides Premium, birthday and low Stars balance banners in the chat list. "
                            + "Account security notices and other suggestions remain. Nothing is dismissed for you.",
                    String.valueOf(page.findPreference(Settings.HIDE_PROMOTIONAL_BANNERS.key).getSummary()));
            assertEquals("Hide sponsored proxy channel", String.valueOf(page.findPreference(Settings.HIDE_SPONSORED_PROXY.key).getTitle()));
            assertEquals("Hides a proxy's sponsored channel from the chat list and folders. "
                            + "Leaves proxy settings and shared promo-data updates alone.",
                    String.valueOf(page.findPreference(Settings.HIDE_SPONSORED_PROXY.key).getSummary()));
            assertEquals("Stop usage reports", String.valueOf(page.findPreference(Settings.DISABLE_ANALYTICS.key).getTitle()));
            assertEquals("Telegram doesn't send its storage-type statistic when its server asks, "
                    + "or how long you spent on each channel post. "
                    + "It also stops reports about Premium screen views, feature taps, accepts and purchase failures. "
                    + "Messages and calls work as before.",
                    String.valueOf(page.findPreference(Settings.DISABLE_ANALYTICS.key).getSummary()));
            assertEquals("Turn off Telegram's update checks", String.valueOf(page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key).getTitle()));
            assertEquals("Telegram stops offering updates from telegram.org. Those can't install over this patched "
                    + "build, so patch each new version in Morphe Manager instead.",
                    String.valueOf(page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key).getSummary()));
            assertEquals("Stop pull to next channel", String.valueOf(page.findPreference(Settings.DISABLE_CHANNEL_PULL.key).getTitle()));
            assertEquals("Pulling up at the bottom of a channel only scrolls. Open the next channel from your chat list.",
                    String.valueOf(page.findPreference(Settings.DISABLE_CHANNEL_PULL.key).getSummary()));
            assertEquals("Stop pull to next topic", String.valueOf(page.findPreference(Settings.DISABLE_TOPIC_PULL.key).getTitle()));
            assertEquals("Pulling up at the bottom of a forum topic only scrolls. Open the next topic from the topic list. "
                            + "Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.DISABLE_TOPIC_PULL.key).getSummary()));
            // Topic pulls keep Telegram's behavior until someone turns their own switch on.
            assertFalse(Settings.DISABLE_TOPIC_PULL.key,
                    ((SwitchPreference) page.findPreference(Settings.DISABLE_TOPIC_PULL.key)).isChecked());
            assertEquals("Show profile data center", String.valueOf(page.findPreference(Settings.PROFILE_DATA_CENTER.key).getTitle()));
            assertEquals("A profile's menu also shows which of Telegram's data centers, 1 to 5, holds the profile photo. "
                            + "A profile without a photo shows none, and no server request is added. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.PROFILE_DATA_CENTER.key).getSummary()));
            // The data center row stays out of profile menus until its own switch is turned on.
            assertFalse(Settings.PROFILE_DATA_CENTER.key,
                    ((SwitchPreference) page.findPreference(Settings.PROFILE_DATA_CENTER.key)).isChecked());
            assertEquals("Repair Firebase push registration", String.valueOf(page.findPreference(Settings.REPAIR_FIREBASE_PUSH.key).getTitle()));
            assertEquals("Uses Telegram's official certificate for Firebase push registration. "
                            + "Notification permission and battery settings still apply.",
                    String.valueOf(page.findPreference(Settings.REPAIR_FIREBASE_PUSH.key).getSummary()));
            assertEquals("Open links externally", String.valueOf(page.findPreference(Settings.OPEN_EXTERNAL_LINKS.key).getTitle()));
            assertEquals("Opens ordinary HTTP(S) links in your browser. "
                            + "Telegram links, login, payment and authenticated routes keep their existing behavior.",
                    String.valueOf(page.findPreference(Settings.OPEN_EXTERNAL_LINKS.key).getSummary()));
            assertEquals("Strip link tracking", String.valueOf(page.findPreference(Settings.STRIP_LINK_TRACKING.key).getTitle()));
            assertEquals("Optional local cleaning at link-open and Share Link chooser sites. "
                            + "Removes only utm_source, utm_medium, utm_campaign, utm_term, utm_content, gclid and fbclid. "
                            + "Any unknown query key preserves the entire URL. Off by default in settings.",
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
            assertEquals("No previews before sending", String.valueOf(page.findPreference(Settings.DISABLE_DRAFT_PREVIEWS.key).getTitle()));
            assertEquals("Telegram doesn't ask its server for a link preview while a message is still unsent. "
                            + "That covers chats, the share sheet, polls, story links and bot shares. "
                            + "Sent messages still get their preview. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.DISABLE_DRAFT_PREVIEWS.key).getSummary()));
            // Draft previews keep Telegram's behavior until someone turns the switch on.
            assertFalse(Settings.DISABLE_DRAFT_PREVIEWS.key,
                    ((SwitchPreference) page.findPreference(Settings.DISABLE_DRAFT_PREVIEWS.key)).isChecked());
            assertEquals("Camera only on tap", String.valueOf(page.findPreference(Settings.GALLERY_CAMERA_ON_TAP.key).getTitle()));
            assertEquals("Opening the attachment gallery doesn't start the camera or ask for camera access. "
                            + "Tap the camera tile to start it. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.GALLERY_CAMERA_ON_TAP.key).getSummary()));
            // The gallery's camera starts as Telegram's does until someone turns the switch on.
            assertFalse(Settings.GALLERY_CAMERA_ON_TAP.key,
                    ((SwitchPreference) page.findPreference(Settings.GALLERY_CAMERA_ON_TAP.key)).isChecked());
            assertEquals("Hide popular apps", String.valueOf(page.findPreference(Settings.HIDE_POPULAR_APPS.key).getTitle()));
            assertEquals("Search's Apps tab skips Telegram's Popular apps list, with its heading and loading rows, "
                            + "and Telegram doesn't ask for it. Apps you've opened and other results stay.",
                    String.valueOf(page.findPreference(Settings.HIDE_POPULAR_APPS.key).getSummary()));
            assertEquals("A short chat list no longer lists your contacts on Telegram under it, with their heading and loading rows. "
                            + "Your chats, folders, contact sync and search stay. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.HIDE_CONTACTS_BLOCK.key).getSummary()));
            assertEquals("An empty private chat no longer offers a sticker to send as a greeting. "
                            + "Its text, business introductions, paid-message notices and the sticker picker stay. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.HIDE_GREETING_STICKERS.key).getSummary()));
            // Contact suggestions and greeting stickers stay as Telegram shows them until someone turns their switch on.
            assertFalse(Settings.HIDE_CONTACTS_BLOCK.key, ((SwitchPreference) page.findPreference(Settings.HIDE_CONTACTS_BLOCK.key)).isChecked());
            assertFalse(Settings.HIDE_GREETING_STICKERS.key, ((SwitchPreference) page.findPreference(Settings.HIDE_GREETING_STICKERS.key)).isChecked());
            assertEquals("No swipe actions on chats", String.valueOf(page.findPreference(Settings.DISABLE_CHAT_SWIPE.key).getTitle()));
            assertEquals("A sideways swipe on a chat in the chat list no longer archives, mutes, pins, deletes or marks it read, "
                            + "so a stray swipe can't change the chat. Long-press still has every action. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.DISABLE_CHAT_SWIPE.key).getSummary()));
            // Chat rows swipe as Telegram's do until someone turns the switch on.
            assertFalse(Settings.DISABLE_CHAT_SWIPE.key,
                    ((SwitchPreference) page.findPreference(Settings.DISABLE_CHAT_SWIPE.key)).isChecked());
            assertEquals("Quiet contacts prompts", String.valueOf(page.findPreference(Settings.QUIET_CONTACTS_NAG.key).getTitle()));
            assertEquals("Once you've said no to contacts access, the Contacts tab stops asking again and its warning badge goes away. "
                            + "The first request, the tab's own buttons and contact sync stay.",
                    String.valueOf(page.findPreference(Settings.QUIET_CONTACTS_NAG.key).getSummary()));
            // Telegram asks once as before, so the switch ships on.
            assertTrue(Settings.QUIET_CONTACTS_NAG.key,
                    ((SwitchPreference) page.findPreference(Settings.QUIET_CONTACTS_NAG.key)).isChecked());
            assertEquals("New Year look all year", String.valueOf(page.findPreference(Settings.HOLIDAY_LOOK.key).getTitle()));
            assertEquals("Telegram's Santa hat sits on the chat list logo, and New Year snow falls every day over the chat list's top bar and, with animated chat "
                            + "backgrounds on, over chat backgrounds. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.HOLIDAY_LOOK.key).getSummary()));
            // Telegram keeps its own holiday dates until someone turns the switch on.
            assertFalse(Settings.HOLIDAY_LOOK.key,
                    ((SwitchPreference) page.findPreference(Settings.HOLIDAY_LOOK.key)).isChecked());
            assertEquals("Use system font", String.valueOf(page.findPreference(Settings.USE_SYSTEM_FONT.key).getTitle()));
            assertEquals("Bold and italic text stops using the Roboto files built into Telegram and takes your phone's font, the one regular text already uses. "
                            + "Code takes the phone's monospace font. Some number displays and Instant View pages keep Telegram's own. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.USE_SYSTEM_FONT.key).getSummary()));
            // Telegram's bundled fonts stay until someone turns the switch on.
            assertFalse(Settings.USE_SYSTEM_FONT.key,
                    ((SwitchPreference) page.findPreference(Settings.USE_SYSTEM_FONT.key)).isChecked());
            assertEquals("AMOLED black", String.valueOf(page.findPreference(Settings.AMOLED_BLACK.key).getTitle()));
            assertEquals("Telegram's Night and Dark themes draw their screens in pure black, and a patterned chat background shows its pattern over black. "
                            + "Message bubbles and pop-up menus keep their colors, and themes you've installed from a file stay as they are. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.AMOLED_BLACK.key).getSummary()));
            // Telegram's own theme colors stay until someone turns the switch on.
            assertFalse(Settings.AMOLED_BLACK.key,
                    ((SwitchPreference) page.findPreference(Settings.AMOLED_BLACK.key)).isChecked());
            assertEquals("Hide translate bar", String.valueOf(page.findPreference(Settings.HIDE_TRANSLATE_BAR.key).getTitle()));
            assertEquals("Chats in another language stop showing Telegram's translate bar at the top, and Translate moves to the chat's menu. "
                            + "A chat you're translating keeps its bar so you can go back to the original. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.HIDE_TRANSLATE_BAR.key).getSummary()));
            // Telegram's translate bar stays until someone turns the switch on.
            assertFalse(Settings.HIDE_TRANSLATE_BAR.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_TRANSLATE_BAR.key)).isChecked());
            assertEquals("Exact numbers", String.valueOf(page.findPreference(Settings.EXACT_NUMBERS.key).getTitle()));
            assertEquals("Member, subscriber, view, reply and reaction counts show the full number, like 12,345 "
                            + "instead of 12.3K. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.EXACT_NUMBERS.key).getSummary()));
            // Counts stay short until the switch is turned on.
            assertFalse(Settings.EXACT_NUMBERS.key,
                    ((SwitchPreference) page.findPreference(Settings.EXACT_NUMBERS.key)).isChecked());
            assertEquals("Reveal spoilers", String.valueOf(page.findPreference(Settings.REVEAL_SPOILERS.key).getTitle()));
            assertEquals("Spoiler text, photos and videos show right away instead of waiting for a tap. View-once "
                            + "media, sensitive content and login codes stay covered, and text you're typing keeps its "
                            + "spoiler. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.REVEAL_SPOILERS.key).getSummary()));
            // Spoilers stay covered until the switch is turned on.
            assertFalse(Settings.REVEAL_SPOILERS.key,
                    ((SwitchPreference) page.findPreference(Settings.REVEAL_SPOILERS.key)).isChecked());
            assertEquals("Hide keyboard on scroll", String.valueOf(page.findPreference(Settings.HIDE_KEYBOARD_ON_SCROLL.key).getTitle()));
            assertEquals("Starting to scroll through a chat closes the keyboard, the way Telegram already does while "
                            + "you search a chat. Telegram's emoji and sticker panel stays open. Off by default in "
                            + "settings.",
                    String.valueOf(page.findPreference(Settings.HIDE_KEYBOARD_ON_SCROLL.key).getSummary()));
            // The keyboard stays up on scroll until the switch is turned on.
            assertFalse(Settings.HIDE_KEYBOARD_ON_SCROLL.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_KEYBOARD_ON_SCROLL.key)).isChecked());
            assertEquals("Keep videos muted on volume keys", String.valueOf(page.findPreference(Settings.KEEP_VIDEOS_MUTED.key).getTitle()));
            assertEquals("Volume keys in a chat change the volume instead of playing the video or round video on "
                            + "screen with sound. Tap a video to hear it. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.KEEP_VIDEOS_MUTED.key).getSummary()));
            // The chat gets volume keys until the switch is turned on.
            assertFalse(Settings.KEEP_VIDEOS_MUTED.key,
                    ((SwitchPreference) page.findPreference(Settings.KEEP_VIDEOS_MUTED.key)).isChecked());
            assertEquals("Swipe back on profiles", String.valueOf(page.findPreference(Settings.SWIPE_BACK_ON_PROFILES.key).getTitle()));
            assertEquals("A swipe to the right on a profile's photos or media tabs goes back, like it does on the "
                            + "rest of the profile, instead of showing the previous photo or tab. Swiping left still "
                            + "moves forward. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.SWIPE_BACK_ON_PROFILES.key).getSummary()));
            // The profile keeps its swipes until the switch is turned on.
            assertFalse(Settings.SWIPE_BACK_ON_PROFILES.key,
                    ((SwitchPreference) page.findPreference(Settings.SWIPE_BACK_ON_PROFILES.key)).isChecked());
            assertEquals("Hide phone number", String.valueOf(page.findPreference(Settings.HIDE_PHONE_NUMBER.key).getTitle()));
            assertEquals("Your own phone number shows as dots in the side menu, Settings, your profile and anywhere "
                            + "else Telegram displays it, which helps with screenshots and screen sharing. Other people's "
                            + "numbers stay visible. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.HIDE_PHONE_NUMBER.key).getSummary()));
            // Your number shows until the switch is turned on.
            assertFalse(Settings.HIDE_PHONE_NUMBER.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_PHONE_NUMBER.key)).isChecked());
            assertEquals("Message times with seconds", String.valueOf(page.findPreference(Settings.MESSAGE_SECONDS.key).getTitle()));
            assertEquals("The time on each message shows seconds too, like 9:41:27 PM, so messages sent close "
                            + "together are easy to tell apart. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.MESSAGE_SECONDS.key).getSummary()));
            // Message times keep Telegram's format until the switch is turned on.
            assertFalse(Settings.MESSAGE_SECONDS.key,
                    ((SwitchPreference) page.findPreference(Settings.MESSAGE_SECONDS.key)).isChecked());
            assertEquals("Allow chat blur on slower phones", String.valueOf(page.findPreference(Settings.ALLOW_CHAT_BLUR.key).getTitle()));
            assertEquals("Telegram only blurs the chat header and panels on phones it rates as fast. This lets any "
                            + "phone use it once Blur in chat is on under Power saving. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.ALLOW_CHAT_BLUR.key).getSummary()));
            // Telegram rates the phone until the switch is turned on.
            assertFalse(Settings.ALLOW_CHAT_BLUR.key,
                    ((SwitchPreference) page.findPreference(Settings.ALLOW_CHAT_BLUR.key)).isChecked());
            assertEquals("Play voice messages one at a time", String.valueOf(page.findPreference(Settings.VOICE_ONE_AT_A_TIME.key).getTitle()));
            assertEquals("When a voice or video message ends, the next one in the chat doesn't start on its own. Off "
                            + "by default in settings.",
                    String.valueOf(page.findPreference(Settings.VOICE_ONE_AT_A_TIME.key).getSummary()));
            // Telegram plays the next voice message until the switch is turned on.
            assertFalse(Settings.VOICE_ONE_AT_A_TIME.key,
                    ((SwitchPreference) page.findPreference(Settings.VOICE_ONE_AT_A_TIME.key)).isChecked());
            assertEquals("Turn off haptic feedback", String.valueOf(page.findPreference(Settings.NO_HAPTICS.key).getTitle()));
            assertEquals("Taps, long presses, swipes and wrong entries in Telegram stop vibrating the phone. "
                            + "Incoming calls still vibrate, and notifications vibrate the way you set them. Off by "
                            + "default in settings.",
                    String.valueOf(page.findPreference(Settings.NO_HAPTICS.key).getSummary()));
            // Telegram vibrates until the switch is turned on.
            assertFalse(Settings.NO_HAPTICS.key,
                    ((SwitchPreference) page.findPreference(Settings.NO_HAPTICS.key)).isChecked());
            assertEquals("Turn off reaction effects", String.valueOf(page.findPreference(Settings.REACTION_EFFECTS_OFF.key).getTitle()));
            assertEquals("When you or someone else reacts to a message, the emoji no longer flies across the screen "
                            + "and bursts. The reaction still shows on the message. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.REACTION_EFFECTS_OFF.key).getSummary()));
            // Reaction effects play until the switch is turned on.
            assertFalse(Settings.REACTION_EFFECTS_OFF.key,
                    ((SwitchPreference) page.findPreference(Settings.REACTION_EFFECTS_OFF.key)).isChecked());
            assertEquals("Hide folder tab counters", String.valueOf(page.findPreference(Settings.HIDE_FOLDER_COUNTERS.key).getTitle()));
            assertEquals("The folder tabs above the chat list show just their names, without the number of unread "
                            + "chats. Chats stay unread and the app icon's badge doesn't change. Off by default in "
                            + "settings.",
                    String.valueOf(page.findPreference(Settings.HIDE_FOLDER_COUNTERS.key).getSummary()));
            // Folder tabs show their counts until the switch is turned on.
            assertFalse(Settings.HIDE_FOLDER_COUNTERS.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_FOLDER_COUNTERS.key)).isChecked());
            assertEquals("Hide sender names when forwarding", String.valueOf(page.findPreference(Settings.FORWARD_HIDE_SENDER.key).getTitle()));
            assertEquals("Each new forward starts with Telegram's Hide sender's name option turned on, so the copies "
                            + "arrive without the original author. You can still turn it off before sending, and article "
                            + "forwards follow Telegram's Premium rule. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.FORWARD_HIDE_SENDER.key).getSummary()));
            // Forwards show the sender until the switch is turned on.
            assertFalse(Settings.FORWARD_HIDE_SENDER.key,
                    ((SwitchPreference) page.findPreference(Settings.FORWARD_HIDE_SENDER.key)).isChecked());
            assertEquals("Voice messages in the music player", String.valueOf(page.findPreference(Settings.VOICE_MUSIC_PLAYER.key).getTitle()));
            assertEquals("While a voice message plays, tapping the bar above the chat opens Telegram's full music "
                            + "player with its seek bar, instead of jumping to the message. View-once voice messages stay "
                            + "as they are. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.VOICE_MUSIC_PLAYER.key).getSummary()));
            // A voice message keeps jumping to the chat until the switch is turned on.
            assertFalse(Settings.VOICE_MUSIC_PLAYER.key,
                    ((SwitchPreference) page.findPreference(Settings.VOICE_MUSIC_PLAYER.key)).isChecked());
            assertEquals("Silence people outside your contacts", String.valueOf(page.findPreference(Settings.SILENCE_NON_CONTACTS.key).getTitle()));
            assertEquals("A private message from someone who isn't in your contacts still shows a notification, just "
                            + "without sound or vibration. Bots, reminders and Telegram's login codes keep their sound. "
                            + "Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.SILENCE_NON_CONTACTS.key).getSummary()));
            // A stranger's message rings until the switch is turned on.
            assertFalse(Settings.SILENCE_NON_CONTACTS.key,
                    ((SwitchPreference) page.findPreference(Settings.SILENCE_NON_CONTACTS.key)).isChecked());
            assertEquals("Disable pull to archive", String.valueOf(page.findPreference(Settings.DISABLE_ARCHIVE_PULL.key).getTitle()));
            assertEquals("Pulling down the chat list no longer brings up a hidden archive. You can open it from "
                            + "Archived chats in the chat list's menu, or pin it to keep it in the list. Off by default "
                            + "in settings.",
                    String.valueOf(page.findPreference(Settings.DISABLE_ARCHIVE_PULL.key).getSummary()));
            // A pull brings the hidden archive back until the switch is turned on.
            assertFalse(Settings.DISABLE_ARCHIVE_PULL.key,
                    ((SwitchPreference) page.findPreference(Settings.DISABLE_ARCHIVE_PULL.key)).isChecked());
            assertEquals("Start the camera on the rear lens", String.valueOf(page.findPreference(Settings.REAR_CAMERA_FIRST.key).getTitle()));
            assertEquals("The camera in the attachment menu starts on the rear lens every time you open it, instead "
                            + "of the lens you used last. You can still flip it while it's open. Off by default in "
                            + "settings.",
                    String.valueOf(page.findPreference(Settings.REAR_CAMERA_FIRST.key).getSummary()));
            // The camera opens on the last lens until the switch is turned on.
            assertFalse(Settings.REAR_CAMERA_FIRST.key,
                    ((SwitchPreference) page.findPreference(Settings.REAR_CAMERA_FIRST.key)).isChecked());
            assertEquals("Hide gallery camera tile", String.valueOf(page.findPreference(Settings.HIDE_GALLERY_CAMERA_TILE.key).getTitle()));
            assertEquals("The photo grid in the attachment menu starts with your photos instead of a live camera "
                            + "tile. A chat picks it up the next time you open it. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.HIDE_GALLERY_CAMERA_TILE.key).getSummary()));
            // The gallery shows its camera tile until the switch is turned on.
            assertFalse(Settings.HIDE_GALLERY_CAMERA_TILE.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_GALLERY_CAMERA_TILE.key)).isChecked());
            assertEquals("Hide time on stickers", String.valueOf(page.findPreference(Settings.HIDE_STICKER_TIME.key).getTitle()));
            assertEquals("Stickers and big animated emoji no longer carry the time and read checks in their corner. "
                            + "Every other message keeps its time. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.HIDE_STICKER_TIME.key).getSummary()));
            // A sticker shows its time until the switch is turned on.
            assertFalse(Settings.HIDE_STICKER_TIME.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_STICKER_TIME.key)).isChecked());
            assertEquals("Ignore mentions in muted chats", String.valueOf(page.findPreference(Settings.IGNORE_MUTED_MENTIONS.key).getTitle()));
            assertEquals("Telegram still notifies you when someone mentions you or replies to you in a group or "
                            + "channel you've muted. With this on, those stay as quiet as the rest of the chat. Chats you "
                            + "haven't muted notify as before. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.IGNORE_MUTED_MENTIONS.key).getSummary()));
            // Mentions in a muted chat notify until the switch is turned on.
            assertFalse(Settings.IGNORE_MUTED_MENTIONS.key,
                    ((SwitchPreference) page.findPreference(Settings.IGNORE_MUTED_MENTIONS.key)).isChecked());
            assertEquals("Hide blocked users in groups", String.valueOf(page.findPreference(Settings.HIDE_BLOCKED_IN_GROUPS.key).getTitle()));
            assertEquals("Messages from people you've blocked are left out of the groups and supergroups you open. "
                            + "Private chats and channel posts stay as they are. Nothing is deleted, so turning it off "
                            + "and reopening the chat brings them back. Telegram loads a long blocked list a bit at a "
                            + "time, so someone it hasn't loaded yet still shows. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.HIDE_BLOCKED_IN_GROUPS.key).getSummary()));
            // Blocked people's group messages show until the switch is turned on.
            assertFalse(Settings.HIDE_BLOCKED_IN_GROUPS.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_BLOCKED_IN_GROUPS.key)).isChecked());
            assertEquals("Hide Telegram Features and Invite Friends", String.valueOf(page.findPreference(Settings.HIDE_FEATURES_AND_INVITE.key).getTitle()));
            assertEquals("Settings drops its Telegram Features row and Contacts drops Invite Friends. When you have "
                            + "no contacts yet, the invite list Contacts shows in their place goes too. Off by default in "
                            + "settings.",
                    String.valueOf(page.findPreference(Settings.HIDE_FEATURES_AND_INVITE.key).getSummary()));
            // Telegram Features and Invite Friends show until the switch is turned on.
            assertFalse(Settings.HIDE_FEATURES_AND_INVITE.key,
                    ((SwitchPreference) page.findPreference(Settings.HIDE_FEATURES_AND_INVITE.key)).isChecked());
            assertEquals("Add Repeat to the message menu", String.valueOf(page.findPreference(Settings.MESSAGE_MENU_REPEAT.key).getTitle()));
            assertEquals("Puts Repeat under Forward in a message's long-press menu. It sends the message again to "
                            + "the same chat as a new message from you. It only shows where Telegram offers Forward and "
                            + "you can write, so it won't appear in protected or secret chats. Off by default in "
                            + "settings.",
                    String.valueOf(page.findPreference(Settings.MESSAGE_MENU_REPEAT.key).getSummary()));
            // The message menu stays as Telegram builds it until the switch is turned on.
            assertFalse(Settings.MESSAGE_MENU_REPEAT.key,
                    ((SwitchPreference) page.findPreference(Settings.MESSAGE_MENU_REPEAT.key)).isChecked());
            assertEquals("Add Copy photo to the message menu", String.valueOf(page.findPreference(Settings.MESSAGE_MENU_COPY_PHOTO.key).getTitle()));
            assertEquals("Puts Copy photo under Forward in a photo's long-press menu once the photo has downloaded. "
                            + "It copies the picture itself, so you can paste it into another app. It won't appear in "
                            + "protected or secret chats. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.MESSAGE_MENU_COPY_PHOTO.key).getSummary()));
            // Each of the menu's items stays out until its own switch is turned on.
            assertFalse(Settings.MESSAGE_MENU_COPY_PHOTO.key,
                    ((SwitchPreference) page.findPreference(Settings.MESSAGE_MENU_COPY_PHOTO.key)).isChecked());
            assertEquals("Add Message details to the message menu", String.valueOf(page.findPreference(Settings.MESSAGE_MENU_DETAILS.key).getTitle()));
            assertEquals("Puts Message details at the end of a message's long-press menu. It shows the message's "
                            + "IDs, when it was sent and edited, where it was forwarded from and the file's data center "
                            + "and size, with a Copy button. Off by default in settings.",
                    String.valueOf(page.findPreference(Settings.MESSAGE_MENU_DETAILS.key).getSummary()));
            // Each of the menu's items stays out until its own switch is turned on.
            assertFalse(Settings.MESSAGE_MENU_DETAILS.key,
                    ((SwitchPreference) page.findPreference(Settings.MESSAGE_MENU_DETAILS.key)).isChecked());
            List<Preference> rows = new ArrayList<>();
            collect(page.getPreferenceScreen(), rows);
            for (Preference row : rows) {
                String text = row.getTitle() + " " + row.getSummary();
                assertFalse("\"" + text + "\" names Facebook, Meta, Instagram or Threads",
                        text.contains("Facebook") || text.contains("Meta") || text.contains("Instagram") || text.contains("Threads"));
            }
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
                assertEquals("Local notification status", status.getTitle());
                assertFalse("reading local status must not be an action", status.isSelectable());
                assertFalse("local facts must not become a saved preference", status.isPersistent());
                assertTrue(String.valueOf(status.getSummary()), String.valueOf(status.getSummary()).contains("Push token saved: Unknown"));
                assertTrue(String.valueOf(status.getSummary()), String.valueOf(status.getSummary()).contains("Signed-in accounts: Unknown"));
                assertTrue(String.valueOf(status.getSummary()), String.valueOf(status.getSummary()).contains("Accounts confirmed for push: Unknown"));
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
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                HushTelegramPreferenceFragment page = pageOf(controller);
                String summary = String.valueOf(page.findPreference(missing.family.switches.get(0).key).getSummary());
                if (missing.family.expectedCapabilities().size() == 1) {
                    assertEquals("This build has no coverage for " + missing.label + ".", summary);
                } else {
                    assertTrue(summary, summary.startsWith("This build covers "));
                    assertTrue(summary, summary.endsWith("Missing coverage: " + missing.label + "."));
                    for (PatchFamily.Capability covered : missing.family.expectedCapabilities()) {
                        if (covered != missing) assertTrue(summary, summary.contains(covered.label));
                    }
                }
                assertTrue("a build family's configuration switch was disabled", page.findPreference(missing.family.switches.get(0).key).isEnabled());
            }
        }

        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = pageOf(controller);
            assertEquals("This build has no coverage for "
                            + L10n.join(Arrays.asList("channel ads", "video ads", "search ads")) + ".",
                    String.valueOf(page.findPreference(Settings.HIDE_ADS.key).getSummary()));
            assertEquals("This build has no coverage for " + L10n.join(Arrays.asList(
                            "device statistics reports", "channel read metrics", "Premium promo views",
                            "Premium promo taps", "Premium promo accepts", "Premium promo failures")) + ".",
                    String.valueOf(page.findPreference(Settings.DISABLE_ANALYTICS.key).getSummary()));
        }
    }

    @Test
    public void thePausedCardSaysWhatStaysInForEveryReason() {
        for (HushTelegramPause.Reason why : HushTelegramPause.Reason.values()) {
            String summary = HushTelegramPreferenceFragment.pausedSummary(why, "org.telegram.messenger.web");
            assertFalse(why + ": " + summary, UNPATCHED.matcher(summary).find());
            assertTrue(why + ": " + summary, summary.contains("what was set when you patched stays in"));
            // Debug logging is kept as saved while paused, so the card can't say every switch is off.
            assertTrue(why + ": " + summary, summary.contains("Every switch but Debug logging"));
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
            assertEquals("Your controls are active.", String.valueOf(card.getSummary()));
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

    private static int indexOfKey(List<Preference> rows, String key) {
        for (int i = 0; i < rows.size(); i++) {
            if (key.equals(rows.get(i).getKey())) return i;
        }
        return -1;
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
