/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Forked from:
 * https://github.com/SysAdminDoc/hushfeed/blob/bcc57ee555f4346c4eb1cbdae9f6ca8a3fa6fef4/extensions/tiktok/src/test/java/app/hushtelegram/extension/tiktok/settings/SettingsBackupTest.java
 * Copyright 2026 Hushfeed contributors (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026: rewritten around the list of switches a file may
 * carry, the preview an import shows first, and the picker round trip through Hushfacebook's
 * settings dialog, the activity rebuilt behind the picker included.
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.SwitchPreference;

import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowActivity;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.BooleanSupplier;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.WorkerPoolForTests;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.FailingStore;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.IntegerSetting;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.shared.settings.StringSetting;
import app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManager;
import app.hushtelegram.extension.shared.settings.preference.QuickSetups;
import app.hushtelegram.extension.shared.settings.preference.SharedPrefCategory;

/**
 * Export settings and Import settings: what a file may carry, what an import refuses, the preview
 * it shows first and the one commit it writes, and the round trip through Android's file picker.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SettingsBackupTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /**
     * Switches in {@link Settings} that are meant to stay out of a settings file, each with the
     * reason. A switch that shows up in neither this nor the list fails the test below, so it's a
     * decision someone makes rather than one that happens. Keyed by the switch's key as text: a
     * static that loads Settings here would load it before the rule sets a context, and that
     * poisons the sandbox for every class after this one (SettingsContextRule).
     */
    private static final Map<String, String> STAYS_OUT = staysOut();

    private static Map<String, String> staysOut() {
        Map<String, String> out = new LinkedHashMap<>();
        out.put("hushtelegram_check_releases",
                "It puts the phone online, and the import preview gives only a count of the switches it "
                        + "changes, so a file someone shared could turn it on unseen. It's switched on from the "
                        + "phone's own screen.");
        out.put("hushtelegram_chat_type_folders",
                "Flipping it makes or removes folders on the Telegram account. An import would flip it "
                        + "without doing either, so it would say folders are there that aren't.");
        out.put("hushtelegram_unified_push",
                "On, it signs Telegram up with a push app at the next start and routes every wake-up through "
                        + "that app, picking the only one installed on its own. Like the release check, that's a "
                        + "choice for the phone's own screen, not for a file someone shared.");
        return Collections.unmodifiableMap(out);
    }

    /** HushTelegram's own state and its diagnostics. None of them is ever in a file. */
    private static List<Setting<?>> neverInAFile() {
        return Arrays.asList(BaseSettings.PAUSED, BaseSettings.SAFE_MODE, BaseSettings.DEBUG,
                BaseSettings.DEBUG_LOG_FILTERS, BaseSettings.DEBUG_STACKTRACE, BaseSettings.DEBUG_TOAST_ON_ERROR,
                BaseSettings.CAPTURE_JAVA_CRASHES, BaseSettings.MORPHE_LANGUAGE, BaseSettings.SHOW_MENU_ICONS,
                BaseSettings.FIRST_TIME_APP_LAUNCHED, BaseSettings.EXPERIMENTAL_APP_CONFIRMED,
                BaseSettings.CHECK_ENVIRONMENT_WARNINGS_ISSUED);
    }

    private static final String EXPORT_ROW = "action_export_settings";
    private static final String IMPORT_ROW = "action_import_settings";
    /** The app behind every file the tests pick. */
    private static final String AUTHORITY = "settings-test";

    @Before
    public void startClean() {
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.resetToDefault();
        for (StringSetting list : SettingsBackup.FILTER_LISTS) list.resetToDefault();
        for (IntegerSetting number : SettingsBackup.NUMBERS) number.resetToDefault();
        for (StringSetting text : SettingsBackup.TEXTS) text.resetToDefault();
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        ShadowToast.reset();
        ShadowAlertDialog.reset();
        SettingsFileProvider.install(AUTHORITY);
    }

    @After
    public void restore() throws Exception {
        // A test that stopped while the app still held its file would leave that run holding a
        // worker and the rows for the tests after it. Letting the open go ends the run, and the
        // rows come back the way they do in the app.
        CountDownLatch held = SettingsFileProvider.stall;
        if (held != null) held.countDown();
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.resetToDefault();
        for (StringSetting list : SettingsBackup.FILTER_LISTS) list.resetToDefault();
        for (IntegerSetting number : SettingsBackup.NUMBERS) number.resetToDefault();
        for (StringSetting text : SettingsBackup.TEXTS) text.resetToDefault();
        // The release check stays out of every file, so the list above doesn't reach it.
        Settings.CHECK_FOR_RELEASES.resetToDefault();
        BaseSettings.PAUSED.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        BaseSettings.DEBUG_LOG_FILTERS.resetToDefault();
        PauseForTests.resume();
        PatchFamily.inBuildForTests = null;
        AbstractPreferenceFragment.settingImportInProgress = false;
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    // ---- What a file carries ------------------------------------------------------------------

    /**
     * Every switch in Settings is either on the list or stays out with a reason. A new switch
     * fails here until someone decides which, so it can't slip into files, or out of them, unseen.
     */
    @Test
    public void theListIsEverySwitchInSettings() throws Exception {
        Set<String> switches = new TreeSet<>();
        for (BooleanSetting setting : PausedHooksTest.settingsSwitches()) switches.add(setting.key);
        Set<String> expected = new TreeSet<>(switches);
        expected.removeAll(STAYS_OUT.keySet());
        for (BooleanSetting way : SettingsRoutes.all()) expected.add(way.key);
        assertEquals("a switch in Settings has no decision: add it to SettingsBackup.ALLOWLIST, or to STAYS_OUT "
                + "here with the reason it stays out of a settings file", expected, keys(SettingsBackup.ALLOWLIST));
        assertTrue("STAYS_OUT names a switch Settings no longer has", switches.containsAll(STAYS_OUT.keySet()));
        assertEquals("the list names a switch twice", SettingsBackup.ALLOWLIST.size(),
                new HashSet<>(SettingsBackup.ALLOWLIST).size());
        // A file carries true or false, the message filters as lists of lines, the sticker size
        // as one of its choices and the title emoji as short text. Any other setting in Settings
        // that isn't a switch needs a format that can carry it before it can be decided on.
        List<String> notSwitches = new ArrayList<>();
        for (Setting<?> setting : declaredSettings(Settings.class)) {
            if (!(setting instanceof BooleanSetting) && !SettingsBackup.FILTER_LISTS.contains(setting)
                    && !SettingsBackup.NUMBERS.contains(setting) && !SettingsBackup.TEXTS.contains(setting)) notSwitches.add(setting.key);
        }
        assertEquals("a setting in Settings isn't a switch, and a settings file has no format for it",
                Collections.emptyList(), notSwitches);
        assertEquals(Arrays.asList(Settings.MESSAGE_FILTERS_GROUPS, Settings.MESSAGE_FILTERS_CHANNELS), SettingsBackup.FILTER_LISTS);
        assertEquals(Collections.singletonList(Settings.STICKER_SIZE), SettingsBackup.NUMBERS);
        assertEquals(Arrays.asList(Settings.TITLE_EMOJI, Settings.GALLERY_FOLDER, Settings.TRANSLATE_TARGET), SettingsBackup.TEXTS);
        assertEquals(Arrays.asList(Settings.HIDE_ADS, Settings.HIDE_STORIES,
                        Settings.HIDE_RECOMMENDATIONS, Settings.HIDE_KEYBOARD_FEATURED, Settings.HIDE_COMMERCE, Settings.HIDE_EMOJI_STATUS,
                        Settings.UNLOCK_PREMIUM_ICONS, Settings.LOCAL_EMOJI_STATUS, Settings.HIDE_PROMOTIONAL_BANNERS,
                        Settings.HIDE_SPONSORED_PROXY, Settings.HIDE_POPULAR_APPS, Settings.SEARCH_ONLY_MY_CHATS, Settings.SEARCH_STYLED_NAMES, Settings.BLOCK_NEW_CHATS, Settings.HIDE_CONTACTS_BLOCK, Settings.HIDE_GREETING_STICKERS, Settings.DISABLE_CHAT_SWIPE, Settings.DISABLE_CHANNEL_PULL, Settings.DISABLE_TOPIC_PULL,
                        Settings.NORMAL_PASTE, Settings.SHOW_LOCAL_IDS, Settings.PROFILE_DATA_CENTER, Settings.DISABLE_DOUBLE_TAP_REACTIONS, Settings.HIDE_REACTION_ROWS, Settings.HIDE_REACTION_PICKER,
                        Settings.QUIET_CONTACTS_NAG, Settings.HOLIDAY_LOOK, Settings.USE_SYSTEM_FONT, Settings.AMOLED_BLACK, Settings.HIDE_TRANSLATE_BAR, Settings.EXACT_NUMBERS, Settings.REVEAL_SPOILERS, Settings.HIDE_KEYBOARD_ON_SCROLL, Settings.KEEP_VIDEOS_MUTED, Settings.VIDEO_EITHER_LANDSCAPE, Settings.VIDEO_ONLY_FROM_BUTTON, Settings.SWIPE_BACK_ON_PROFILES, Settings.HIDE_PHONE_NUMBER, Settings.SHARE_NUMBER_UNTICKED, Settings.MESSAGE_SECONDS, Settings.ALLOW_CHAT_BLUR, Settings.VOICE_ONE_AT_A_TIME, Settings.LOCKED_VOICE_GUARD, Settings.NO_HAPTICS, Settings.REACTION_EFFECTS_OFF, Settings.HIDE_FOLDER_COUNTERS, Settings.LAUNCH_FOLDER, Settings.HIDE_ALL_CHATS, Settings.HIDDEN_CHATS, Settings.FORWARD_HIDE_SENDER, Settings.VOICE_MUSIC_PLAYER, Settings.SILENCE_NON_CONTACTS, Settings.REACTION_ALERTS, Settings.REACTION_SOUND, Settings.DISABLE_ARCHIVE_PULL, Settings.REAR_CAMERA_FIRST, Settings.HIDE_GALLERY_CAMERA_TILE, Settings.HIDE_STICKER_TIME, Settings.CHANGE_STICKER_SIZE, Settings.IGNORE_MUTED_MENTIONS, Settings.HIDE_BLOCKED_IN_GROUPS, Settings.HIDE_BY_KEYWORD, Settings.HIDE_FEATURES_AND_INVITE, Settings.MESSAGE_MENU_REPEAT, Settings.KEEP_DELETED_MESSAGES, Settings.RED_DELETED_LABEL, Settings.KEEP_EDIT_HISTORY, Settings.KEEP_TIMED_MEDIA, Settings.ASK_BEFORE_STICKER, Settings.OUTSIDE_TRANSLATE, Settings.HIDE_CHANNEL_BUTTONS, Settings.HIDE_CHANNEL_MUTE, Settings.HIDE_CHANNEL_SHARE, Settings.HIDE_SEND_AS, Settings.HIDE_CONTACTS_TAB, Settings.COMPACT_TAB_BAR, Settings.SIDE_MENU, Settings.HIDE_NEW_MESSAGE, SettingsRoutes.SETTINGS_ROW, SettingsRoutes.TITLE_PRESS, SettingsRoutes.SIDE_MENU_ROW, SettingsRoutes.SHORTCUT, Settings.FASTER_DOWNLOADS, Settings.DATA_SAVER_DOWNLOADS, Settings.SAVE_DOWNLOADS, Settings.SAVE_RESTRICTED_DOWNLOADS, Settings.SAVE_TIMED_MEDIA, Settings.STORAGE_FOLDER, Settings.ASK_BEFORE_GIF, Settings.ASK_BEFORE_VOICE_VIDEO, Settings.ASK_BEFORE_CALL, Settings.MESSAGE_MENU_COPY_PHOTO, Settings.MESSAGE_MENU_DETAILS, Settings.MESSAGE_MENU_QUICK_FORWARD, Settings.MESSAGE_MENU_COPY_PROTECTED, Settings.MESSAGE_MENU_SAVE_PROTECTED, Settings.MESSAGE_MENU_FORWARD_COPY,
                        Settings.DISABLE_ANALYTICS, Settings.GHOST_MODE, Settings.GHOST_READS, Settings.GHOST_STORIES, Settings.GHOST_TYPING, Settings.GHOST_ONLINE,
                        Settings.DISABLE_CALL_DEBUG, Settings.RECORD_CALLS, Settings.RECORD_CALL_BUTTON, Settings.DISABLE_DRAFT_PREVIEWS,
                        Settings.LOCAL_DRAFTS, Settings.LOCAL_SEARCH, Settings.GALLERY_CAMERA_ON_TAP,
                        Settings.OPEN_EXTERNAL_LINKS, Settings.MINI_APP_LOCATION_OFF, Settings.STRIP_LINK_TRACKING,
                        Settings.SKIP_AUTOLOGIN, Settings.DISABLE_UPDATE_CHECKS,
                        Settings.REPAIR_FIREBASE_PUSH),
                SettingsBackup.ALLOWLIST);
    }

    @Test
    public void nothingOfHushTelegramsOwnIsOnTheList() throws Exception {
        List<Setting<?>> own = declaredSettings(BaseSettings.class);
        assertTrue("the scan of BaseSettings found nothing", own.size() >= neverInAFile().size());
        for (Setting<?> setting : own) {
            assertFalse(setting.key + " is HushTelegram's own and is on the list", SettingsBackup.ALLOWLIST.contains(setting));
        }
        for (Setting<?> setting : neverInAFile()) {
            assertFalse(setting.key + " is on the list", SettingsBackup.ALLOWLIST.contains(setting));
        }
    }

    /**
     * A file is a format name, a version and one true or false per switch, whatever else the phone
     * holds: not the pause, not debug logging or safe mode, not the log, the diagnostic counts or
     * anything that names the phone or the person.
     */
    @Test
    public void aFileIsItsFormatItsVersionAndOneValuePerSwitch() throws Exception {
        Settings.HIDE_ADS.save(false);
        Settings.DISABLE_UPDATE_CHECKS.save(false);
        Settings.CHECK_FOR_RELEASES.save(true);
        BaseSettings.PAUSED.save(true);
        BaseSettings.DEBUG.save(true);
        BaseSettings.DEBUG_LOG_FILTERS.save("feed");
        PauseForTests.pause(HushTelegramPause.Reason.CRASH_LOOP);
        String cookie = "sessionid=100012345678901%3Asecret-session; ds_user_id=100012345678901";
        LogBufferManager.appendToLogBuffer("sentinel line " + cookie);
        HookStatus.invoked(FamilyNames.HIDE_ADS);
        Context app = RuntimeEnvironment.getApplication();

        String text = SettingsBackup.create();
        JSONObject root = new JSONObject(text);
        assertEquals(new TreeSet<>(Arrays.asList("format", "schema", "settings")), names(root));
        assertEquals("hushtelegram-settings", root.get("format"));
        assertEquals(1, root.get("schema"));
        JSONObject switches = root.getJSONObject("settings");
        Set<String> carried = keys(SettingsBackup.ALLOWLIST);
        carried.addAll(keys(SettingsBackup.FILTER_LISTS));
        carried.addAll(keys(SettingsBackup.NUMBERS));
        carried.addAll(keys(SettingsBackup.TEXTS));
        assertEquals(carried, names(switches));
        assertEquals("", switches.get(Settings.TITLE_EMOJI.key));
        for (StringSetting list : SettingsBackup.FILTER_LISTS) {
            assertEquals(list.key, 0, switches.getJSONArray(list.key).length());
        }
        assertEquals(75, switches.get(Settings.STICKER_SIZE.key));
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) {
            // Saved, not what a paused Telegram is answered: paused, every switch answers false.
            if (!Arrays.asList(SettingsRoutes.all()).contains(setting)) assertFalse(setting.get());
            assertEquals(setting.key, setting.savedValue(), switches.get(setting.key));
        }
        assertEquals(false, switches.get(Settings.HIDE_ADS.key));
        assertEquals(true, switches.get(Settings.DISABLE_ANALYTICS.key));
        for (Setting<?> setting : Setting.allLoadedSettings()) {
            if (SettingsBackup.ALLOWLIST.contains(setting) || SettingsBackup.FILTER_LISTS.contains(setting)
                    || SettingsBackup.NUMBERS.contains(setting) || SettingsBackup.TEXTS.contains(setting)) continue;
            assertFalse(setting.key + " is in the file", text.contains(setting.key));
        }
        for (String leak : new String[]{"sentinel", "sessionid", "ds_user_id", "100012345678901", "secret-session",
                app.getPackageName(), FamilyNames.HIDE_ADS, "feed"}) {
            assertFalse("the file carries " + leak + ":\n" + text, text.contains(leak));
        }
    }

    @Test
    public void everySwitchRoundTripsBothWays() throws Exception {
        for (int pattern = 0; pattern < 2; pattern++) {
            Map<BooleanSetting, Boolean> chosen = new LinkedHashMap<>();
            int index = 0;
            for (BooleanSetting setting : SettingsBackup.ALLOWLIST) {
                boolean value = (index++ + pattern) % 2 == 0;
                setting.save(value);
                chosen.put(setting, value);
            }
            String file = SettingsBackup.create();
            for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.save(!setting.savedValue());

            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
            assertEquals(0, snapshot.unknown);
            assertEquals(SettingsBackup.ALLOWLIST.size(), snapshot.changes().size());
            assertEquals(SettingsBackup.ALLOWLIST.size(), SettingsBackup.apply(snapshot));
            for (Map.Entry<BooleanSetting, Boolean> entry : chosen.entrySet()) {
                BooleanSetting setting = entry.getKey();
                assertEquals(setting.key, entry.getValue(), setting.savedValue());
                // What the next start reads: a switch at its default is absent from the store.
                assertEquals(setting.key, entry.getValue(),
                        Setting.preferences.preferences.getBoolean(setting.key, setting.defaultValue));
            }
            assertEquals("a file read back is the file", file, SettingsBackup.create());
        }
    }

    // ---- Writing ---------------------------------------------------------------------------

    @Test
    public void anImportIsOneCommit() throws Exception {
        Settings.HIDE_ADS.save(false);
        String file = SettingsBackup.create();
        Settings.HIDE_ADS.save(true);
        Settings.DISABLE_UPDATE_CHECKS.save(false);
        Settings.DISABLE_ANALYTICS.save(false);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals(3, snapshot.changes().size());

        Counts counts = new Counts();
        withStore(counting(Setting.preferences.preferences, counts, () -> false, false), () -> {
            assertEquals(3, SettingsBackup.apply(snapshot));
            return null;
        });
        assertEquals("editors opened", 1, counts.edits.get());
        assertEquals("commits", 1, counts.commits.get());
        assertEquals("asynchronous applies", 0, counts.applies.get());
        assertFalse(Settings.HIDE_ADS.savedValue());
        assertTrue(Settings.DISABLE_UPDATE_CHECKS.savedValue());
        assertTrue(Settings.DISABLE_ANALYTICS.savedValue());

        // A file that changes nothing writes nothing.
        Counts none = new Counts();
        withStore(counting(Setting.preferences.preferences, none, () -> false, false), () -> {
            assertEquals(0, SettingsBackup.apply(SettingsBackup.parse(file)));
            return null;
        });
        assertEquals(0, none.edits.get());
    }

    /**
     * Translate with an outside service forgets its chats as it goes off, from its row or from a
     * file. Off from one file and on from another, with no message drawn between them, still
     * leaves nothing turned on and sends nothing that was queued.
     */
    @Test
    public void aFileThatTurnsTheTranslatorOffForgetsItsChatsAndWhatWasQueued() throws Exception {
        Settings.OUTSIDE_TRANSLATE.save(true);
        app.hushtelegram.extension.telegram.misc.OutsideTranslateForTests.reset();
        try {
            assertTrue(app.hushtelegram.extension.telegram.misc.OutsideTranslateForTests.toggleChat(7, 10));
            java.util.function.IntSupplier send = app.hushtelegram.extension.telegram.misc.OutsideTranslateForTests.queueOne(7, 10);
            assertEquals(1, SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.OUTSIDE_TRANSLATE, false))));
            assertEquals(1, SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.OUTSIDE_TRANSLATE, true))));
            assertTrue(Settings.OUTSIDE_TRANSLATE.savedValue());
            assertEquals("a request queued before the file turned translation off went out", 0, send.getAsInt());
            assertFalse(app.hushtelegram.extension.telegram.misc.OutsideTranslateForTests.chatOn(7, 10));
        } finally {
            Settings.OUTSIDE_TRANSLATE.resetToDefault();
            app.hushtelegram.extension.telegram.misc.OutsideTranslateForTests.reset();
        }
    }

    /** A file that changes the Data Saver switch runs Telegram's download check, as the row does. */
    @Test
    public void aFileThatChangesTheDataSaverSwitchRunsTelegramsCheck() throws Exception {
        Object downloads = new Object();
        List<String> checks = new ArrayList<>();
        app.hushtelegram.extension.telegram.misc.DataSaverDownloadsForTests.checkWith(
                checked -> checks.add((checked == downloads) + " " + Settings.DATA_SAVER_DOWNLOADS.get()), downloads);
        try {
            assertEquals(1, SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.DATA_SAVER_DOWNLOADS, true))));
            ShadowLooper.idleMainLooper();
            assertEquals(Collections.singletonList("true true"), checks);
            // A file that leaves the switch as it is doesn't run it.
            assertEquals(1, SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADS, false))));
            ShadowLooper.idleMainLooper();
            assertEquals(Collections.singletonList("true true"), checks);
            // Nor does one that names it at the value it already has.
            assertEquals(1, SettingsBackup.apply(SettingsBackup.parse(
                    fileWith(Settings.DATA_SAVER_DOWNLOADS, true, Settings.HIDE_ADS, true))));
            ShadowLooper.idleMainLooper();
            assertEquals(Collections.singletonList("true true"), checks);
        } finally {
            Settings.DATA_SAVER_DOWNLOADS.resetToDefault();
            Settings.HIDE_ADS.resetToDefault();
            app.hushtelegram.extension.telegram.misc.DataSaverDownloadsForTests.reset();
        }
    }

    @Test
    public void aFailedCommitIsPutBackAndSaysSo() throws Exception {
        String file = fileWith(Settings.HIDE_ADS, false, Settings.DISABLE_UPDATE_CHECKS, false);
        Map<String, ?> before = store();
        Counts counts = new Counts();
        SettingsBackup.ApplyFailed failure = withStore(
                counting(Setting.preferences.preferences, counts, () -> counts.commits.get() == 1, false), () -> {
                    try {
                        SettingsBackup.apply(SettingsBackup.parse(file));
                        fail("a failed commit was reported as written");
                        return null;
                    } catch (SettingsBackup.ApplyFailed failed) {
                        return failed;
                    }
                });
        assertTrue("the switches are back, and the failure says they aren't", failure.rolledBack);
        assertEquals(before, store());
        assertTrue(Settings.HIDE_ADS.savedValue());
        assertTrue(Settings.DISABLE_UPDATE_CHECKS.savedValue());
    }

    @Test
    public void aRollbackThatFailsTooSaysSomeSwitchesMayHaveChanged() throws Exception {
        String file = fileWith(Settings.HIDE_ADS, false);
        Counts counts = new Counts();
        // The first commit lands and reports failure; the one putting it back never lands.
        SettingsBackup.ApplyFailed failure = withStore(
                counting(Setting.preferences.preferences, counts, () -> true, true), () -> {
                    try {
                        SettingsBackup.apply(SettingsBackup.parse(file));
                        fail("a failed commit was reported as written");
                        return null;
                    } catch (SettingsBackup.ApplyFailed failed) {
                        return failed;
                    }
                });
        assertFalse("a store left changed was reported as put back", failure.rolledBack);
        assertEquals(2, counts.commits.get());
    }

    /**
     * A rollback puts back what the file named and nothing else. A switch the file doesn't name,
     * saved the way its row saves it while the import's commit was still out, keeps that value in
     * the store and in the process.
     */
    @Test
    public void aRollbackLeavesASwitchSavedSinceAlone() throws Exception {
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(fileWith(Settings.HIDE_ADS, false));
        SharedPreferences real = Setting.preferences.preferences;
        SettingsBackup.ApplyFailed failure;
        try (FailingStore store = FailingStore.holding(FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING)) {
            Future<SettingsBackup.ApplyFailed> applied = Utils.submitOnBackgroundThread(() -> {
                try {
                    SettingsBackup.apply(snapshot);
                    return null;
                } catch (SettingsBackup.ApplyFailed failed) {
                    return failed;
                }
            });
            assertTrue("the import never reached its commit", store.awaitHeld());
            assertTrue(real.edit().putBoolean(Settings.NORMAL_PASTE.key, true).commit());
            BooleanSetting.privateSetValue(Settings.NORMAL_PASTE, true);
            store.letGo();
            failure = applied.get(5, TimeUnit.SECONDS);
        }
        assertNotNull("a failed commit was reported as written", failure);
        assertTrue("the switch the file named isn't back", failure.rolledBack);
        assertTrue(Settings.HIDE_ADS.savedValue());
        assertFalse(store().containsKey(Settings.HIDE_ADS.key));
        assertEquals("the rollback took a later write to another switch with it",
                true, store().get(Settings.NORMAL_PASTE.key));
        assertTrue(Settings.NORMAL_PASTE.savedValue());
    }

    /**
     * An editor that won't open, a value it refuses, a commit that answers false or throws, before
     * or after landing: each leaves both switches on the value the store still holds, which is what
     * a restart loads, and only then does the failure say nothing changed.
     */
    @Test
    public void everyFailedWriteLeavesTheLiveSwitchesOnWhatTheStoreKeeps() throws Exception {
        String file = fileWith(Settings.HIDE_ADS, false, Settings.DISABLE_UPDATE_CHECKS, false);
        Map<String, ?> before = store();
        for (FailingStore.Fault fault : new FailingStore.Fault[]{FailingStore.Fault.EDIT_THROWS,
                FailingStore.Fault.STAGE_THROWS, FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.COMMIT_THROWS,
                FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING}) {
            SettingsBackup.ApplyFailed failure = failedApply(file, fault);
            assertTrue(fault + " said the switches may have changed", failure.rolledBack);
            assertEquals(fault + " left the store changed", before, store());
            assertTrue(fault + " left a live switch changed", Settings.HIDE_ADS.savedValue());
            assertTrue(fault + " left a live switch changed", Settings.DISABLE_UPDATE_CHECKS.savedValue());
        }
    }

    /**
     * A rollback that doesn't land either says so, and the switches then hold what the store kept,
     * so the screen and the next start agree.
     */
    @Test
    public void aRollbackThatFailsSaysSoAndTheSwitchesHoldWhatTheStoreKept() throws Exception {
        String file = fileWith(Settings.HIDE_ADS, false, Settings.DISABLE_UPDATE_CHECKS, false);
        FailingStore.Fault[][] scripts = {
                {FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.LOST},
                {FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING, FailingStore.Fault.COMMIT_THROWS},
                {FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.EDIT_THROWS},
                {FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING, FailingStore.Fault.STAGE_THROWS}};
        for (FailingStore.Fault[] script : scripts) {
            String name = Arrays.toString(script);
            SettingsBackup.ApplyFailed failure = failedApply(file, script);
            assertFalse(name + " said the switches are back", failure.rolledBack);
            assertEquals(name, false, store().get(Settings.HIDE_ADS.key));
            assertFalse(name + " runs a switch the store doesn't hold", Settings.HIDE_ADS.savedValue());
            assertFalse(name + " runs a switch the store doesn't hold", Settings.DISABLE_UPDATE_CHECKS.savedValue());
            Settings.HIDE_ADS.resetToDefault();
            Settings.DISABLE_UPDATE_CHECKS.resetToDefault();
        }
    }

    /** What a failed import says is what the screen shows and the store holds. */
    @Test
    public void aFailedImportSaysWhatTheStoreKeptAndTheScreenShowsIt() throws Exception {
        String file = fileWith(Settings.HIDE_ADS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            SwitchPreference row = (SwitchPreference) page.findPreference(Settings.HIDE_ADS.key);

            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS)) {
                shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                settle();
            }
            assertEquals("Couldn't import the settings. Nothing was changed.", ShadowToast.getTextOfLatestToast());
            assertTrue("the process runs a switch the file never managed to set", Settings.HIDE_ADS.savedValue());
            assertTrue(row.isChecked());
            assertFalse(store().containsKey(Settings.HIDE_ADS.key));

            ShadowToast.reset();
            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.LOST)) {
                shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                settle();
            }
            assertEquals("Couldn't import or restore old settings. Check the switches.",
                    ShadowToast.getTextOfLatestToast());
            assertEquals(false, store().get(Settings.HIDE_ADS.key));
            assertFalse(Settings.HIDE_ADS.savedValue());
            assertFalse("the screen shows a switch the store doesn't hold", row.isChecked());
        }
    }

    /**
     * The message filters go out as an array of their lines and come back as the list they were,
     * and a file from before them, or one that leaves a list out, leaves that list alone.
     */
    @Test
    public void theMessageFiltersRoundTripAsLines() throws Exception {
        Settings.MESSAGE_FILTERS_GROUPS.save("free crypto\n/\\bgiveaway\\b/\nÜberweisung");
        Settings.MESSAGE_FILTERS_CHANNELS.save("sponsored");
        String file = SettingsBackup.create();
        JSONObject settings = new JSONObject(file).getJSONObject("settings");
        org.json.JSONArray groups = settings.getJSONArray(Settings.MESSAGE_FILTERS_GROUPS.key);
        assertEquals(3, groups.length());
        assertEquals(Arrays.asList("free crypto", "/\\bgiveaway\\b/", "Überweisung"),
                Arrays.asList(groups.getString(0), groups.getString(1), groups.getString(2)));
        assertEquals(1, settings.getJSONArray(Settings.MESSAGE_FILTERS_CHANNELS.key).length());

        Settings.MESSAGE_FILTERS_GROUPS.save("");
        Settings.MESSAGE_FILTERS_CHANNELS.save("something else");
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals(0, snapshot.unknown);
        assertEquals(0, snapshot.switchChanges());
        assertEquals(2, snapshot.listChanges());
        SettingsBackup.Snapshot kept = SettingsBackup.Snapshot.fromBundle(snapshot.toBundle());
        assertEquals(snapshot.lists, kept.lists);
        assertEquals(2, SettingsBackup.apply(kept));
        assertEquals("free crypto\n/\\bgiveaway\\b/\nÜberweisung", Settings.MESSAGE_FILTERS_GROUPS.savedValue());
        assertEquals("sponsored", Settings.MESSAGE_FILTERS_CHANNELS.savedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());

        // Blank and padded lines come in the way the editor saves them.
        JSONObject padded = new JSONObject(file);
        padded.getJSONObject("settings").put(Settings.MESSAGE_FILTERS_CHANNELS.key, new org.json.JSONArray(Arrays.asList("  spam ", "", "ads")));
        SettingsBackup.apply(SettingsBackup.parse(padded.toString()));
        assertEquals("spam\nads", Settings.MESSAGE_FILTERS_CHANNELS.savedValue());

        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_ADS, false));
        assertTrue(older.lists.isEmpty());
        SettingsBackup.apply(older);
        assertEquals("a file without the lists left them alone", "spam\nads", Settings.MESSAGE_FILTERS_CHANNELS.savedValue());
    }

    @Test
    public void aFilterListThatIsNotAShortListOfShortLinesIsRefused() throws Exception {
        List<String> tooMany = new ArrayList<>();
        for (int i = 0; i <= app.hushtelegram.extension.telegram.misc.MessageFilters.MAX_FILTERS; i++) tooMany.add("word" + i);
        // As many lines as a list holds, each as long as a line may be, but three bytes a character.
        List<String> tooBig = new ArrayList<>();
        for (int i = 0; i < app.hushtelegram.extension.telegram.misc.MessageFilters.MAX_FILTERS; i++) {
            tooBig.add(repeat('字', app.hushtelegram.extension.telegram.misc.MessageFilters.MAX_FILTER_CHARS));
        }
        for (Object bad : new Object[]{"spam", true, 1, JSONObject.NULL, new JSONObject(),
                new org.json.JSONArray(Arrays.asList("spam", 1)),
                new org.json.JSONArray(Collections.singletonList("two\nlines")),
                new org.json.JSONArray(Collections.singletonList("carriage\rreturn")),
                new org.json.JSONArray(Collections.singletonList(repeat('x', app.hushtelegram.extension.telegram.misc.MessageFilters.MAX_FILTER_CHARS + 1))),
                new org.json.JSONArray(tooMany), new org.json.JSONArray(tooBig)}) {
            JSONObject file = new JSONObject(SettingsBackup.create());
            file.getJSONObject("settings").put(Settings.MESSAGE_FILTERS_GROUPS.key, bad);
            assertEquals(printable(String.valueOf(bad)), SettingsBackup.Reason.VALUE, reasonFor(file.toString()));
        }

        // A list stored too big to carry is left out of a file rather than making one the import refuses.
        Settings.MESSAGE_FILTERS_GROUPS.save(String.join("\n", tooBig));
        Settings.MESSAGE_FILTERS_CHANNELS.save(String.join("\n", tooBig.subList(0, 30)));
        SettingsBackup.Snapshot carried = SettingsBackup.parse(SettingsBackup.create());
        assertFalse(carried.lists.containsKey(Settings.MESSAGE_FILTERS_GROUPS));
        assertTrue(carried.lists.containsKey(Settings.MESSAGE_FILTERS_CHANNELS));
        Settings.MESSAGE_FILTERS_GROUPS.resetToDefault();
        Settings.MESSAGE_FILTERS_CHANNELS.resetToDefault();
        // A line that isn't a working filter, such as an expression edited by hand, still comes in:
        // the editor shows it and a chat leaves it out.
        JSONObject file = new JSONObject(SettingsBackup.create());
        file.getJSONObject("settings").put(Settings.MESSAGE_FILTERS_GROUPS.key,
                new org.json.JSONArray(Arrays.asList("/(unclosed/", "/(a+)+/", "/(?:(?=x)){16777215}(?!x)/")));
        assertEquals("/(unclosed/\n/(a+)+/\n/(?:(?=x)){16777215}(?!x)/",
                SettingsBackup.parse(file.toString()).lists.get(Settings.MESSAGE_FILTERS_GROUPS));
    }

    /**
     * The sticker size goes out as its number and comes back only as one of the choices, and a
     * file from before it leaves the size alone.
     */
    @Test
    public void theStickerSizeRoundTripsAsOneOfItsChoices() throws Exception {
        Settings.STICKER_SIZE.save(150);
        String file = SettingsBackup.create();
        assertEquals(150, new JSONObject(file).getJSONObject("settings").get(Settings.STICKER_SIZE.key));

        Settings.STICKER_SIZE.save(50);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals(0, snapshot.switchChanges());
        assertEquals(0, snapshot.listChanges());
        assertTrue(snapshot.sizeChanges());
        SettingsBackup.Snapshot kept = SettingsBackup.Snapshot.fromBundle(snapshot.toBundle());
        assertEquals(snapshot.numbers, kept.numbers);
        assertEquals(1, SettingsBackup.apply(kept));
        assertEquals(150, (int) Settings.STICKER_SIZE.savedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());
        assertFalse(SettingsBackup.parse(file).sizeChanges());

        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_ADS, false));
        assertTrue(older.numbers.isEmpty());
        SettingsBackup.apply(older);
        assertEquals("a file without the size left it alone", 150, (int) Settings.STICKER_SIZE.savedValue());

        for (Object bad : new Object[]{100, 0, -75, 1000, 75.5, "75", true, JSONObject.NULL, new org.json.JSONArray()}) {
            JSONObject wrong = new JSONObject(file);
            wrong.getJSONObject("settings").put(Settings.STICKER_SIZE.key, bad);
            assertEquals(String.valueOf(bad), SettingsBackup.Reason.VALUE, reasonFor(wrong.toString()));
        }

        // A saved state is read back as strictly: a size that isn't a choice is left out.
        Bundle state = snapshot.toBundle();
        state.getBundle("numbers").putInt(Settings.STICKER_SIZE.key, 100);
        assertTrue(SettingsBackup.Snapshot.fromBundle(state).numbers.isEmpty());
        state.getBundle("numbers").putString(Settings.STICKER_SIZE.key, "150");
        assertTrue(SettingsBackup.Snapshot.fromBundle(state).numbers.isEmpty());
    }

    /**
     * The title emoji goes out as the text it is and comes back only as text the editor would have
     * saved, and a file from before it leaves the text alone.
     */
    @Test
    public void theTitleEmojiRoundTripsAsTextTheTitleCanShow() throws Exception {
        String tree = new String(Character.toChars(0x1F384));
        Settings.TITLE_EMOJI.save(tree);
        String file = SettingsBackup.create();
        assertEquals(tree, new JSONObject(file).getJSONObject("settings").get(Settings.TITLE_EMOJI.key));

        Settings.TITLE_EMOJI.save("");
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals(0, snapshot.switchChanges());
        assertEquals("it isn't a filter list", 0, snapshot.listChanges());
        assertFalse(snapshot.sizeChanges());
        assertTrue(snapshot.titleEmojiChanges());
        SettingsBackup.Snapshot kept = SettingsBackup.Snapshot.fromBundle(snapshot.toBundle());
        assertEquals(snapshot.texts, kept.texts);
        assertEquals(1, SettingsBackup.apply(kept));
        assertEquals(tree, Settings.TITLE_EMOJI.savedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());
        assertFalse(SettingsBackup.parse(file).titleEmojiChanges());

        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_ADS, false));
        assertTrue(older.texts.isEmpty());
        SettingsBackup.apply(older);
        assertEquals("a file without the text left it alone", tree, Settings.TITLE_EMOJI.savedValue());

        StringBuilder tooLong = new StringBuilder();
        for (int i = 0; i <= app.hushtelegram.extension.telegram.misc.TitleEmoji.MAX_CODE_POINTS; i++) tooLong.append(tree);
        String turned = new String(Character.toChars(0x202E)) + tree;
        for (Object bad : new Object[]{tooLong.toString(), " " + tree, "a\nb", turned, 1, true, JSONObject.NULL, new org.json.JSONArray()}) {
            JSONObject wrong = new JSONObject(file);
            wrong.getJSONObject("settings").put(Settings.TITLE_EMOJI.key, bad);
            assertEquals(String.valueOf(bad), SettingsBackup.Reason.VALUE, reasonFor(wrong.toString()));
        }
        // Empty is a choice: it clears the text.
        JSONObject cleared = new JSONObject(file);
        cleared.getJSONObject("settings").put(Settings.TITLE_EMOJI.key, "");
        assertEquals("", SettingsBackup.parse(cleared.toString()).texts.get(Settings.TITLE_EMOJI));

        // A saved state is read back as strictly: text the title can't show is left out, and only
        // the file's other texts, the gallery folder and the translation language, come back.
        Bundle state = snapshot.toBundle();
        state.getBundle("texts").putString(Settings.TITLE_EMOJI.key, tooLong.toString());
        Set<StringSetting> others = new java.util.HashSet<>(Arrays.asList(Settings.GALLERY_FOLDER, Settings.TRANSLATE_TARGET));
        assertEquals(others, SettingsBackup.Snapshot.fromBundle(state).texts.keySet());
        state.getBundle("texts").putInt(Settings.TITLE_EMOJI.key, 1);
        assertEquals(others, SettingsBackup.Snapshot.fromBundle(state).texts.keySet());
    }

    /** The gallery folder goes out as its choice and comes back only as one, never as a path (#30). */
    @Test
    public void theGalleryFolderRoundTripsOnlyAsOneOfItsChoices() throws Exception {
        String dcim = app.hushtelegram.extension.telegram.misc.GalleryFolder.DCIM;
        Settings.GALLERY_FOLDER.save(dcim);
        String file = SettingsBackup.create();
        assertEquals(dcim, new JSONObject(file).getJSONObject("settings").get(Settings.GALLERY_FOLDER.key));

        Settings.GALLERY_FOLDER.resetToDefault();
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals(0, snapshot.switchChanges());
        assertEquals("it isn't a filter list", 0, snapshot.listChanges());
        assertFalse(snapshot.titleEmojiChanges());
        assertTrue(snapshot.galleryFolderChanges());
        assertEquals(1, SettingsBackup.apply(SettingsBackup.Snapshot.fromBundle(snapshot.toBundle())));
        assertEquals(dcim, Settings.GALLERY_FOLDER.savedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());

        for (Object bad : new Object[]{"DCIM/Telegram/", "../../Android/data/", "/storage/emulated/0/DCIM", "Dcim", " dcim", 1, true,
                JSONObject.NULL, new org.json.JSONArray()}) {
            JSONObject wrong = new JSONObject(file);
            wrong.getJSONObject("settings").put(Settings.GALLERY_FOLDER.key, bad);
            assertEquals(String.valueOf(bad), SettingsBackup.Reason.VALUE, reasonFor(wrong.toString()));
        }
        // Empty is a choice: Telegram's own folders.
        JSONObject telegrams = new JSONObject(file);
        telegrams.getJSONObject("settings").put(Settings.GALLERY_FOLDER.key, "");
        assertEquals("", SettingsBackup.parse(telegrams.toString()).texts.get(Settings.GALLERY_FOLDER));

        Bundle state = snapshot.toBundle();
        state.getBundle("texts").putString(Settings.GALLERY_FOLDER.key, "../DCIM");
        assertFalse(SettingsBackup.Snapshot.fromBundle(state).texts.containsKey(Settings.GALLERY_FOLDER));
    }

    /** The translation language goes out as its code and comes back only as one of the codes (#35). */
    @Test
    public void theTranslationLanguageRoundTripsOnlyAsOneOfItsCodes() throws Exception {
        Settings.TRANSLATE_TARGET.save("fa");
        String file = SettingsBackup.create();
        assertEquals("fa", new JSONObject(file).getJSONObject("settings").get(Settings.TRANSLATE_TARGET.key));

        Settings.TRANSLATE_TARGET.resetToDefault();
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals(0, snapshot.switchChanges());
        assertEquals("it isn't a filter list", 0, snapshot.listChanges());
        assertFalse(snapshot.galleryFolderChanges());
        assertTrue(snapshot.translateTargetChanges());
        assertEquals(1, SettingsBackup.apply(SettingsBackup.Snapshot.fromBundle(snapshot.toBundle())));
        assertEquals("fa", Settings.TRANSLATE_TARGET.savedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());

        for (Object bad : new Object[]{"xx", "FA", " fa", "fa-IR", "../fa", 1, true, JSONObject.NULL, new org.json.JSONArray()}) {
            JSONObject wrong = new JSONObject(file);
            wrong.getJSONObject("settings").put(Settings.TRANSLATE_TARGET.key, bad);
            assertEquals(String.valueOf(bad), SettingsBackup.Reason.VALUE, reasonFor(wrong.toString()));
        }
        // Empty is a choice: Telegram's language.
        JSONObject telegrams = new JSONObject(file);
        telegrams.getJSONObject("settings").put(Settings.TRANSLATE_TARGET.key, "");
        assertEquals("", SettingsBackup.parse(telegrams.toString()).texts.get(Settings.TRANSLATE_TARGET));

        Bundle state = snapshot.toBundle();
        state.getBundle("texts").putString(Settings.TRANSLATE_TARGET.key, "xx");
        assertFalse(SettingsBackup.Snapshot.fromBundle(state).texts.containsKey(Settings.TRANSLATE_TARGET));
    }

    // ---- Refusals ------------------------------------------------------------------------------

    @Test
    public void aFileThatIsNotOneJsonObjectIsDamaged() throws Exception {
        String good = SettingsBackup.create();
        for (String bad : new String[]{good.substring(0, good.length() / 2), "[]", good + "{}", good + " x",
                "just some text", good.replace("\"schema\"", "schema"), good + '\0', "",
                // Numbers past what BigDecimal can hold: these used to escape every refusal.
                "{\"format\":\"hushtelegram-settings\",\"schema\":1,\"settings\":{\"later\":1e9999999999}}",
                "{\"format\":\"hushtelegram-settings\",\"schema\":1e9999999999,\"settings\":{}}"}) {
            assertEquals(printable(bad), SettingsBackup.Reason.DAMAGED, reasonFor(bad));
        }
        // An editor's byte order mark isn't damage.
        assertEquals(0, SettingsBackup.parse((char) 0xFEFF + good).unknown);
    }

    @Test
    public void anOversizedFileIsRefusedWithoutBeingReadWhole() throws Exception {
        String good = SettingsBackup.create();
        int room = SettingsBackup.MAX_BYTES - good.getBytes(StandardCharsets.UTF_8).length;
        String full = good + repeat(' ', room);
        assertEquals("a file of exactly the limit is refused", SettingsBackup.MAX_BYTES,
                full.getBytes(StandardCharsets.UTF_8).length);
        assertEquals(0, SettingsBackup.parse(full).unknown);
        assertEquals(SettingsBackup.Reason.SIZE, reasonFor(full + " "));

        byte[] atTheLimit = full.getBytes(StandardCharsets.UTF_8);
        assertEquals(full, SettingsBackup.read(new ByteArrayInputStream(atTheLimit)));
        byte[] over = (full + " ").getBytes(StandardCharsets.UTF_8);
        assertEquals(SettingsBackup.Reason.SIZE, readReason(new ByteArrayInputStream(over)));

        // A stream that never ends is given up on just past the limit, not read into memory.
        AtomicInteger pulled = new AtomicInteger();
        InputStream endless = new InputStream() {
            @Override public int read() {
                pulled.incrementAndGet();
                return ' ';
            }

            @Override public int read(byte[] buffer, int offset, int length) {
                Arrays.fill(buffer, offset, offset + length, (byte) ' ');
                pulled.addAndGet(length);
                return length;
            }
        };
        assertEquals(SettingsBackup.Reason.SIZE, readReason(endless));
        assertTrue("read " + pulled.get() + " bytes of an endless stream",
                pulled.get() <= SettingsBackup.MAX_BYTES + 8192);
    }

    @Test
    public void aNameGivenTwiceIsRefused() throws Exception {
        String key = Settings.HIDE_ADS.key;
        String twice = "{\"format\":\"hushtelegram-settings\",\"schema\":1,\"settings\":{\"" + key + "\":false,\""
                + key + "\":true}}";
        assertEquals(SettingsBackup.Reason.DUPLICATE, reasonFor(twice));
        assertEquals(SettingsBackup.Reason.DUPLICATE, reasonFor(
                "{\"format\":\"hushtelegram-settings\",\"format\":\"hushtelegram-settings\",\"schema\":1,\"settings\":{}}"));
        assertEquals("a name repeated inside a name this build doesn't know", SettingsBackup.Reason.DUPLICATE,
                reasonFor("{\"format\":\"hushtelegram-settings\",\"schema\":1,\"settings\":{\"later\":{\"a\":1,\"a\":2}}}"));
        // The same name in two different objects is two names.
        assertEquals(0, SettingsBackup.parse(
                "{\"format\":\"hushtelegram-settings\",\"schema\":1,\"settings\":{\"" + key + "\":false}}").unknown);
    }

    @Test
    public void aValueThatIsNotTrueOrFalseIsRefused() throws Exception {
        for (Object bad : new Object[]{"false", "true", 0, 1, JSONObject.NULL, new JSONObject(), new org.json.JSONArray(),
                1.5}) {
            JSONObject file = new JSONObject(SettingsBackup.create());
            file.getJSONObject("settings").put(Settings.DISABLE_ANALYTICS.key, bad);
            assertEquals(String.valueOf(bad), SettingsBackup.Reason.VALUE, reasonFor(file.toString()));
        }
    }

    @Test
    public void aFileFromANewerVersionIsRefused() throws Exception {
        JSONObject newer = new JSONObject(SettingsBackup.create()).put("schema", SettingsBackup.SCHEMA + 1);
        assertEquals(SettingsBackup.Reason.SCHEMA, reasonFor(newer.toString()));
        assertEquals(SettingsBackup.Reason.SCHEMA, reasonFor(new JSONObject(SettingsBackup.create()).put("schema", 99).toString()));
        // Anything else where the version goes was never written by HushTelegram.
        String good = SettingsBackup.create();
        for (String version : new String[]{"0", "-1", "\"1\"", "1.0", "1.5", "4294967297", "null", "true", "[1]"}) {
            String bad = good.replace("\"schema\": 1", "\"schema\": " + version);
            assertTrue("the replacement missed", !bad.equals(good));
            assertEquals(version, SettingsBackup.Reason.FORMAT, reasonFor(bad));
        }
        JSONObject none = new JSONObject(good);
        none.remove("schema");
        assertEquals(SettingsBackup.Reason.FORMAT, reasonFor(none.toString()));
    }

    @Test
    public void aFileThatIsNotHushTelegramsIsRefused() throws Exception {
        String good = SettingsBackup.create();
        assertEquals(SettingsBackup.Reason.FORMAT, reasonFor(new JSONObject(good).put("format", "hushfeed-settings").toString()));
        assertEquals(SettingsBackup.Reason.FORMAT, reasonFor(new JSONObject(good).put("format", 1).toString()));
        JSONObject noFormat = new JSONObject(good);
        noFormat.remove("format");
        assertEquals(SettingsBackup.Reason.FORMAT, reasonFor(noFormat.toString()));
        assertEquals(SettingsBackup.Reason.FORMAT, reasonFor(new JSONObject(good).put("settings", "all of them").toString()));
        JSONObject noSettings = new JSONObject(good);
        noSettings.remove("settings");
        assertEquals(SettingsBackup.Reason.FORMAT, reasonFor(noSettings.toString()));
    }

    @Test
    public void bytesThatAreNotUtf8AreRefused() {
        assertEquals(SettingsBackup.Reason.ENCODING,
                readReason(new ByteArrayInputStream(new byte[]{'{', (byte) 0xC3, (byte) 0x28, '}'})));
        assertEquals(SettingsBackup.Reason.UNREADABLE, readReason(null));
        assertEquals(SettingsBackup.Reason.UNREADABLE, readReason(new InputStream() {
            @Override public int read() throws java.io.IOException {
                throw new java.io.IOException("content://provider/document/private-name.json went away");
            }
        }));
    }

    /**
     * A name this build doesn't know is counted for the preview and left alone, Pause and debug
     * logging included: naming them in a file changes neither.
     */
    @Test
    public void unknownNamesAreCountedAndLeftAlone() throws Exception {
        JSONObject file = new JSONObject(SettingsBackup.create()).put("exported_by", "a newer build");
        file.getJSONObject("settings")
                .put(Settings.DISABLE_ANALYTICS.key, false)
                .put(BaseSettings.PAUSED.key, true)
                .put(BaseSettings.DEBUG.key, true)
                .put("hushtelegram_kept_by_a_later_version", "whatever that version keeps here");
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file.toString());
        assertEquals(4, snapshot.unknown);
        assertEquals(1, snapshot.changes().size());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertFalse(Settings.DISABLE_ANALYTICS.savedValue());
        assertFalse("a file paused HushTelegram", BaseSettings.PAUSED.savedValue());
        assertFalse("a file turned on debug logging", BaseSettings.DEBUG.savedValue());
    }

    @Test
    public void aFileThatNamesSomeSwitchesLeavesTheRestAlone() throws Exception {
        Settings.DISABLE_UPDATE_CHECKS.save(false);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(fileWith(Settings.HIDE_ADS, false));
        assertEquals(1, snapshot.values.size());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertFalse(Settings.HIDE_ADS.savedValue());
        assertFalse("a switch the file didn't name was reset", Settings.DISABLE_UPDATE_CHECKS.savedValue());
        assertTrue(Settings.DISABLE_ANALYTICS.savedValue());
    }

    @Test
    public void aWaitingImportSurvivesAsABundle() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.DISABLE_ANALYTICS, false, Settings.DISABLE_UPDATE_CHECKS, true));
        file.getJSONObject("settings").put("later_switch", true);
        SettingsBackup.Snapshot read = SettingsBackup.parse(file.toString());
        SettingsBackup.Snapshot back = SettingsBackup.Snapshot.fromBundle(read.toBundle());
        assertNotNull(back);
        assertEquals(read.values, back.values);
        assertEquals(1, back.unknown);

        // A saved state is read back as strictly as a file: only switches on the list, as true or false.
        Bundle state = read.toBundle();
        Bundle switches = state.getBundle("switches");
        switches.putBoolean(BaseSettings.PAUSED.key, true);
        switches.putString(Settings.HIDE_ADS.key, "false");
        SettingsBackup.Snapshot filtered = SettingsBackup.Snapshot.fromBundle(state);
        assertEquals(read.values, filtered.values);
        assertNull(SettingsBackup.Snapshot.fromBundle(null));
        assertNull(SettingsBackup.Snapshot.fromBundle(new Bundle()));
        Bundle negative = read.toBundle();
        negative.putInt("unknown", -1);
        assertNull(SettingsBackup.Snapshot.fromBundle(negative));
    }

    @Test
    public void everyRefusalHasItsOwnSentence() {
        Set<String> sentences = new HashSet<>();
        for (SettingsBackup.Reason reason : SettingsBackup.Reason.values()) {
            String sentence = SettingsBackupPreference.refusal(reason);
            assertTrue(reason + ": " + sentence, sentence.endsWith("Nothing was changed."));
            sentences.add(sentence);
        }
        assertEquals("two refusals read the same", SettingsBackup.Reason.values().length, sentences.size());
    }

    // ---- The screen and the picker ------------------------------------------------------------

    @Test
    @Config(sdk = {28, 30, 33, 36})
    public void exportWritesTheFileThroughTheSystemPicker() throws Exception {
        Settings.DISABLE_ANALYTICS.save(false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            ShadowActivity.IntentForResult started = tap(activity, page, EXPORT_ROW);
            assertEquals(Intent.ACTION_CREATE_DOCUMENT, started.intent.getAction());
            assertEquals(SettingsBackupPreference.EXPORT, started.requestCode);
            assertEquals("application/json", started.intent.getType());
            assertTrue(started.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            String name = started.intent.getStringExtra(Intent.EXTRA_TITLE);
            assertTrue("the picker would suggest " + name, name.matches("hushtelegram-settings-\\d{8}-\\d{6}\\.json"));

            Uri uri = SettingsFileProvider.put(AUTHORITY, "export.json", new byte[0]);
            shadowOf(activity).receiveResult(started.intent, Activity.RESULT_OK, new Intent().setData(uri));
            settle();

            assertEquals("Settings exported.", ShadowToast.getTextOfLatestToast());
            assertEquals(SettingsBackup.create(), new String(SettingsFileProvider.get(uri), StandardCharsets.UTF_8));
            assertTrue(page.findPreference(EXPORT_ROW).isEnabled());
        }
    }

    /** What Export writes is what Import takes back, through both pickers, every switch included. */
    @Test
    @Config(sdk = {28, 30, 33, 36})
    public void aFileExportedThroughThePickerImportsBackThroughIt() throws Exception {
        Settings.HIDE_ADS.save(false);
        Settings.DISABLE_UPDATE_CHECKS.save(false);
        Map<BooleanSetting, Boolean> exported = new LinkedHashMap<>();
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) exported.put(setting, setting.savedValue());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            Uri uri = SettingsFileProvider.put(AUTHORITY, "round-trip.json", new byte[0]);
            shadowOf(activity).receiveResult(tap(activity, page, EXPORT_ROW).intent, Activity.RESULT_OK,
                    new Intent().setData(uri));
            settle();

            for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.save(!setting.savedValue());
            deliver(activity, tap(activity, page, IMPORT_ROW), new String(SettingsFileProvider.get(uri), StandardCharsets.UTF_8));
            AlertDialog preview = shownPreview();
            String[] said = String.valueOf(shadowOf(preview).getMessage()).split("\n");
            assertEquals(SettingsBackup.ALLOWLIST.size() + " switches will change.", said[0]);
            assertEquals("every switch gets its own line", SettingsBackup.ALLOWLIST.size() + 2, said.length);
            assertEquals("Hide ads turns off", said[2]);
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            for (Map.Entry<BooleanSetting, Boolean> entry : exported.entrySet()) {
                assertEquals(entry.getKey().key, entry.getValue(), entry.getKey().savedValue());
            }
        }
    }

    /** With nothing on the phone to answer either picker, both rows say so and stay usable. */
    @Test
    public void aPhoneWithNoFilePickerSaysSo() throws Exception {
        org.robolectric.shadows.ShadowApplication application = shadowOf(RuntimeEnvironment.getApplication());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            application.checkActivities(true);
            for (String row : new String[]{EXPORT_ROW, IMPORT_ROW}) {
                ShadowToast.reset();
                click(page.findPreference(row));
                ShadowLooper.idleMainLooper();
                assertEquals(row, "This phone has no file picker, so you can't choose a file here.",
                        ShadowToast.getTextOfLatestToast());
                assertTrue(row + " stayed out of reach", page.findPreference(row).isEnabled());
            }
        } finally {
            application.checkActivities(false);
        }
    }

    @Test
    public void importShowsHowManySwitchesChangeAndWritesThemOnImport() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.HIDE_ADS, false,
                Settings.DISABLE_UPDATE_CHECKS, false, Settings.DISABLE_ANALYTICS, true));
        file.getJSONObject("settings").put("later_switch", true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            ShadowActivity.IntentForResult started = tap(activity, page, IMPORT_ROW);
            assertEquals(Intent.ACTION_OPEN_DOCUMENT, started.intent.getAction());
            assertEquals(SettingsBackupPreference.IMPORT, started.requestCode);
            assertTrue(started.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            assertEquals("*/*", started.intent.getType());
            assertTrue(Arrays.asList(started.intent.getStringArrayExtra(Intent.EXTRA_MIME_TYPES)).contains("application/json"));

            Map<String, ?> before = store();
            deliver(activity, started, file.toString());
            AlertDialog preview = shownPreview();
            assertEquals("Import settings", String.valueOf(shadowOf(preview).getTitle()));
            assertEquals("2 switches will change.\n\nHide ads turns off\nTurn off Telegram's update checks turns off"
                    + "\n\n1 item in that file isn't a setting this version of HushTelegram knows, so it'll be left out.",
                    String.valueOf(shadowOf(preview).getMessage()));
            assertEquals("the preview wrote something", before, store());
            assertEquals("Import", String.valueOf(preview.getButton(AlertDialog.BUTTON_POSITIVE).getText()));
            assertEquals("Cancel", String.valueOf(preview.getButton(AlertDialog.BUTTON_NEGATIVE).getText()));

            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 2 switches changed.", ShadowToast.getTextOfLatestToast());
            String row = String.valueOf(page.findPreference(IMPORT_ROW).getSummary());
            assertTrue("the import row doesn't say how it went: " + row, row.startsWith("Settings imported. 2 switches changed.\n"));
            assertFalse(Settings.HIDE_ADS.savedValue());
            assertFalse(Settings.DISABLE_UPDATE_CHECKS.savedValue());
            assertTrue(Settings.DISABLE_ANALYTICS.savedValue());
            assertFalse("the page still shows the switch on",
                    ((SwitchPreference) page.findPreference(Settings.HIDE_ADS.key)).isChecked());
            assertNull(page.pendingImport);
            assertFalse(AbstractPreferenceFragment.settingImportInProgress);
        }
    }

    /**
     * An import can write a switch to the value a Quick setups choice left there, which no write
     * listener hears, so it ends that choice's undo rather than let Undo take back what was imported.
     */
    @Test
    public void anImportEndsTheLastQuickSetupsUndo() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            assertEquals(1, page.applyQuickSetup(Collections.singletonMap(Settings.REVEAL_SPOILERS, true)));
            assertNotNull(QuickSetups.last());
            // The file keeps spoilers revealed, as the choice left them, and turns Hide ads off.
            deliver(activity, tap(activity, page, IMPORT_ROW),
                    fileWith(Settings.REVEAL_SPOILERS, true, Settings.HIDE_ADS, false));
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.HIDE_ADS.savedValue());
            assertNull("Undo would take back the imported spoiler switch", QuickSetups.last());
            assertEquals(0, page.undoQuickSetup());
            assertTrue(Settings.REVEAL_SPOILERS.savedValue());
        } finally {
            QuickSetups.forget();
        }
    }

    @Test
    public void aFileThatChangesNothingSaysSoAndOffersNoImport() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), SettingsBackup.create());
            AlertDialog preview = shownPreview();
            assertEquals("Your switches already match that file, so nothing will change.",
                    String.valueOf(shadowOf(preview).getMessage()));
            assertEquals("OK", String.valueOf(preview.getButton(AlertDialog.BUTTON_POSITIVE).getText()));
            assertFalse(preview.getButton(AlertDialog.BUTTON_NEGATIVE).isShown());
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertNull(page.pendingImport);
        }
    }

    @Test
    public void aFileThatChangesOnlyTheSizeSaysSoAndImportsIt() throws Exception {
        Settings.STICKER_SIZE.save(125);
        String file = SettingsBackup.create();
        Settings.STICKER_SIZE.resetToDefault();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            AlertDialog preview = shownPreview();
            assertEquals("The sticker size will change.\n\nSticker size: 75% to 125%", String.valueOf(shadowOf(preview).getMessage()));
            assertEquals("Import", String.valueOf(preview.getButton(AlertDialog.BUTTON_POSITIVE).getText()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported.", ShadowToast.getTextOfLatestToast());
            assertEquals(125, (int) Settings.STICKER_SIZE.savedValue());
            assertEquals("the row shows the imported size", "125% of Telegram's size",
                    String.valueOf(page.findPreference(HushTelegramPreferenceFragment.STICKER_SIZE_ROW).getSummary()));
        }
    }

    @Test
    public void aFileThatChangesOnlyTheTitleEmojiSaysSoAndImportsIt() throws Exception {
        String tree = new String(Character.toChars(0x1F384));
        Settings.TITLE_EMOJI.save(tree);
        String file = SettingsBackup.create();
        Settings.TITLE_EMOJI.resetToDefault();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            AlertDialog preview = shownPreview();
            assertEquals("The emoji next to the chat list title will change.\n\nEmoji next to the chat list title: none to "
                    + app.hushtelegram.extension.shared.L10n.isolate(tree), String.valueOf(shadowOf(preview).getMessage()));
            assertEquals("Import", String.valueOf(preview.getButton(AlertDialog.BUTTON_POSITIVE).getText()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported.", ShadowToast.getTextOfLatestToast());
            assertEquals(tree, Settings.TITLE_EMOJI.savedValue());
            assertTrue("the row shows the imported text",
                    String.valueOf(page.findPreference(TitleEmojiEditor.KEY).getSummary()).contains(tree));
            // The title only changes at the next start, like a switch that waits for one, and an
            // import used to leave it off the restart row.
            assertEquals(Collections.singleton(Settings.TITLE_EMOJI.key), new TreeSet<>(AbstractPreferenceFragment.restartPending));
            assertEquals("Restart Telegram to apply this change", restartRow(page));
        }
    }

    @Test
    public void aFileThatChangesOnlyTheGalleryFolderSaysSoAndImportsIt() throws Exception {
        Settings.GALLERY_FOLDER.save(app.hushtelegram.extension.telegram.misc.GalleryFolder.DCIM_APART);
        String file = SettingsBackup.create();
        Settings.GALLERY_FOLDER.resetToDefault();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            AlertDialog preview = shownPreview();
            assertEquals("The gallery folder will change.\n\nGallery folder: Pictures/Telegram and Movies/Telegram (Telegram's own)"
                    + " to DCIM/Telegram/Photos and DCIM/Telegram/Videos", String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported.", ShadowToast.getTextOfLatestToast());
            assertEquals(app.hushtelegram.extension.telegram.misc.GalleryFolder.DCIM_APART, Settings.GALLERY_FOLDER.savedValue());
            assertTrue("the row shows the imported folders", String.valueOf(page.findPreference(
                    HushTelegramPreferenceFragment.GALLERY_FOLDER_ROW).getSummary()).contains("DCIM/Telegram/Photos"));
            // Each save reads the choice, so nothing waits for a restart.
            assertTrue(AbstractPreferenceFragment.restartPending.isEmpty());
        }
    }

    @Test
    public void aFileThatChangesOnlyTheTranslationLanguageSaysSoAndImportsIt() throws Exception {
        Settings.TRANSLATE_TARGET.save("fa");
        String file = SettingsBackup.create();
        Settings.TRANSLATE_TARGET.resetToDefault();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            AlertDialog preview = shownPreview();
            String message = String.valueOf(shadowOf(preview).getMessage());
            assertTrue(message, message.startsWith("The translation language will change.\n\nTranslate into: Telegram's language to "));
            assertTrue(message, message.endsWith("(Persian)"));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported.", ShadowToast.getTextOfLatestToast());
            assertEquals("fa", Settings.TRANSLATE_TARGET.savedValue());
            assertTrue("the row shows the imported language", String.valueOf(page.findPreference(
                    TranslateTargetPicker.KEY).getSummary()).contains("(Persian)"));
            // Each translation reads the choice, so nothing waits for a restart.
            assertTrue(AbstractPreferenceFragment.restartPending.isEmpty());
        }
    }

    @Test
    public void cancellingThePreviewChangesNothing() throws Exception {
        String file = fileWith(Settings.DISABLE_UPDATE_CHECKS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            Map<String, ?> before = store();

            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            shownPreview().getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
            settle();
            assertNull(page.pendingImport);

            // Back, or a tap outside it, is a cancel too.
            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            shownPreview().cancel();
            settle();
            assertNull(page.pendingImport);

            assertEquals(before, store());
            assertTrue(Settings.DISABLE_UPDATE_CHECKS.savedValue());
            assertNull("a cancelled import said something", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test
    @Config(sdk = {28, 30, 33, 36})
    public void aCancelledPickerChangesNothingAndSaysNothing() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            for (String row : new String[]{EXPORT_ROW, IMPORT_ROW}) {
                shadowOf(activity).receiveResult(tap(activity, page, row).intent, Activity.RESULT_CANCELED, null);
                settle();
            }
            assertNull(ShadowToast.getTextOfLatestToast());
            assertNull(ShadowAlertDialog.getLatestAlertDialog());
            assertTrue(page.findPreference(IMPORT_ROW).isEnabled());
        }
    }

    /**
     * The picker is an activity of its own, and Android may rebuild Telegram's behind it, the
     * settings dialog and its page with it. The answer still reaches the rebuilt page: Android
     * finds it by the name the framework gave the page that asked, which the rebuilt one keeps.
     */
    @Test
    @Config(sdk = {28, 30, 33, 36})
    public void thePickersAnswerReachesThePageRebuiltBehindIt() throws Exception {
        String file = fileWith(Settings.DISABLE_UPDATE_CHECKS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment asked = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            ShadowActivity.IntentForResult started = tap(controller.get(), asked, IMPORT_ROW);

            controller.recreate();
            ShadowLooper.idleMainLooper();
            Activity rebuilt = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(dialogOf(rebuilt));
            assertNotSame("the page wasn't rebuilt", asked, page);

            deliver(rebuilt, started, file);
            AlertDialog preview = shownPreview();
            assertEquals("1 switch will change.\n\nTurn off Telegram's update checks turns off",
                    String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.DISABLE_UPDATE_CHECKS.savedValue());
            assertEquals("Settings imported. 1 switch changed.", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test
    public void anExportAnswerReachesThePageRebuiltBehindIt() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment asked = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            ShadowActivity.IntentForResult started = tap(controller.get(), asked, EXPORT_ROW);
            controller.recreate();
            ShadowLooper.idleMainLooper();

            Uri uri = SettingsFileProvider.put(AUTHORITY, "rebuilt-export.json", new byte[0]);
            shadowOf(controller.get()).receiveResult(started.intent, Activity.RESULT_OK, new Intent().setData(uri));
            settle();
            assertEquals("Settings exported.", ShadowToast.getTextOfLatestToast());
            assertEquals(SettingsBackup.create(), new String(SettingsFileProvider.get(uri), StandardCharsets.UTF_8));
        }
    }

    /**
     * A preview on screen when the activity is rebuilt comes back on the rebuilt page, still
     * unanswered, and the old one goes with the old window.
     */
    @Test
    public void thePreviewComesBackWhenThePageIsRebuilt() throws Exception {
        String file = fileWith(Settings.HIDE_ADS, false, Settings.DISABLE_ANALYTICS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            deliver(controller.get(), tap(controller.get(), page, IMPORT_ROW), file);
            AlertDialog first = shownPreview();
            String message = String.valueOf(shadowOf(first).getMessage());
            assertEquals("2 switches will change.\n\nHide ads turns off\nStop usage reports turns off", message);

            controller.recreate();
            ShadowLooper.idleMainLooper();
            assertFalse("the old preview stayed up over a window that's gone", first.isShowing());
            AlertDialog again = shownPreview();
            assertNotSame(first, again);
            assertEquals(message, String.valueOf(shadowOf(again).getMessage()));
            assertTrue("the rebuild answered the preview", Settings.HIDE_ADS.savedValue());

            again.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.HIDE_ADS.savedValue());
            assertFalse(Settings.DISABLE_ANALYTICS.savedValue());
            assertNull(SettingsL10nTest.pageOf(dialogOf(controller.get())).pendingImport);
        }
    }

    /**
     * Malformed, oversized, duplicate-name, wrong-type and newer-version files each say why and
     * change nothing: no preview, no write, the switches as they were.
     */
    @Test
    public void aRefusedFileSaysWhyAndChangesNothing() throws Exception {
        String good = SettingsBackup.create();
        String key = Settings.HIDE_ADS.key;
        JSONObject wrongType = new JSONObject(good);
        wrongType.getJSONObject("settings").put(key, "false");
        Map<String, SettingsBackup.Reason> files = new LinkedHashMap<>();
        files.put(good.substring(0, good.length() - 3), SettingsBackup.Reason.DAMAGED);
        files.put(good + repeat(' ', SettingsBackup.MAX_BYTES), SettingsBackup.Reason.SIZE);
        files.put(good.replace("\"" + key + "\": true", "\"" + key + "\": false, \"" + key + "\": false"),
                SettingsBackup.Reason.DUPLICATE);
        files.put(wrongType.toString(), SettingsBackup.Reason.VALUE);
        files.put(new JSONObject(good).put("schema", 2).toString(), SettingsBackup.Reason.SCHEMA);
        files.put(new JSONObject(good).put("format", "something else").toString(), SettingsBackup.Reason.FORMAT);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            Map<String, ?> before = store();
            for (Map.Entry<String, SettingsBackup.Reason> entry : files.entrySet()) {
                ShadowToast.reset();
                ShadowAlertDialog.reset();
                Counts counts = new Counts();
                withStore(counting(Setting.preferences.preferences, counts, () -> false, false), () -> {
                    deliver(activity, tap(activity, page, IMPORT_ROW), entry.getKey());
                    return null;
                });
                assertEquals(entry.getValue() + " said", SettingsBackupPreference.refusal(entry.getValue()),
                        ShadowToast.getTextOfLatestToast());
                assertNull(entry.getValue() + " showed a preview", ShadowAlertDialog.getLatestAlertDialog());
                assertNull(page.pendingImport);
                assertEquals(entry.getValue() + " opened an editor", 0, counts.edits.get());
                assertEquals(entry.getValue() + " changed the store", before, store());
                assertTrue(page.findPreference(IMPORT_ROW).isEnabled());
            }
            assertTrue(Settings.HIDE_ADS.savedValue());
        }
    }

    /**
     * Export settings names what a file leaves out, from the same decisions this class checks:
     * every switch STAYS_OUT names, by the title its row shows, along with Pause and Debug logging.
     * A build without a feature doesn't name it, and the row never promises a backup of Telegram
     * itself.
     */
    @Test
    public void theExportRowNamesWhatAFileLeavesOut() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            String summary = String.valueOf(page.findPreference(EXPORT_ROW).getSummary());
            List<String> named = new ArrayList<>(STAYS_OUT.keySet());
            named.add(BaseSettings.PAUSED.key);
            named.add(BaseSettings.DEBUG.key);
            for (String key : named) {
                Preference row = page.findPreference(key);
                assertNotNull(key, row);
                assertTrue(key + " isn't named: " + summary, summary.contains(String.valueOf(row.getTitle())));
            }
            assertTrue(summary, summary.contains("the translation service, its key and the chats you turned translation on for"));
            assertTrue(summary, summary.contains("Your chats, drafts and kept messages aren't in it."));
        }
        String partial = HushTelegramPreferenceFragment.exportSummary(java.util.EnumSet.noneOf(PatchFamily.class));
        assertTrue(partial, partial.contains("Left out of the file: Pause HushTelegram"));
        assertTrue(partial, partial.contains("Check for new HushTelegram releases"));
        // The lock and the settings look keep their own state, which a file doesn't carry.
        assertTrue(partial, partial.contains("Lock HushTelegram settings"));
        assertTrue(partial, partial.contains("Settings look"));
        assertFalse(partial, partial.contains("Quick setups"));
        for (String missing : new String[]{"UnifiedPush", "Folders by chat type", "translation service"}) {
            assertFalse("a build without it named " + missing, partial.contains(missing));
        }
    }

    /**
     * While a file is read, both rows are out of reach and the one acting says what it's doing,
     * which is also what a screen reader hears as its state. A second picker can't be opened.
     */
    @Test
    public void theRowsAreOutOfReachWhileAFileIsRead() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            Preference export = page.findPreference(EXPORT_ROW);
            Preference importRow = page.findPreference(IMPORT_ROW);
            String exportSummary = String.valueOf(export.getSummary());
            String importSummary = String.valueOf(importRow.getSummary());

            CountDownLatch release = new CountDownLatch(1);
            SettingsFileProvider.stall = release;
            Uri uri = SettingsFileProvider.put(AUTHORITY, "slow.json", SettingsBackup.create().getBytes(StandardCharsets.UTF_8));
            ShadowActivity.IntentForResult started = tap(activity, page, IMPORT_ROW);
            shadowOf(activity).receiveResult(started.intent, Activity.RESULT_OK, new Intent().setData(uri));
            try {
                assertFalse(export.isEnabled());
                assertFalse(importRow.isEnabled());
                assertEquals("Reading the settings file", String.valueOf(importRow.getSummary()));
                assertEquals("the other row explains why it is unavailable", "Reading the settings file", String.valueOf(export.getSummary()));

                click(export);
                assertNull("a tap during a read opened a picker", shadowOf(activity).getNextStartedActivityForResult());
            } finally {
                release.countDown();
            }
            settle();
            assertTrue(export.isEnabled());
            assertTrue(importRow.isEnabled());
            assertEquals(exportSummary, String.valueOf(export.getSummary()));
            assertEquals(importSummary, String.valueOf(importRow.getSummary()));
            shownPreview().cancel();
            settle();
        }
    }

    /**
     * A full worker queue runs nothing, says so, and leaves the rows usable for another try.
     *
     * <p>The pool is one static executor for every test in the JVM, and a worker left finishing
     * something else when the fill stops hands its slot to the read (the full suite saw that on
     * 2026-09-26, with the pool drained first). WorkerPoolForTests holds it full until every worker
     * holds a filler.
     */
    @Test
    @Config(sdk = {28, 30, 33, 36})
    public void aFullWorkerQueueLeavesTheRowsUsable() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            byte[] bytes = fileWith(Settings.HIDE_ADS, false).getBytes(StandardCharsets.UTF_8);
            Uri uri = SettingsFileProvider.put(AUTHORITY, "queued.json", bytes);
            ShadowActivity.IntentForResult started = tap(activity, page, IMPORT_ROW);

            try (WorkerPoolForTests full = WorkerPoolForTests.fill()) {
                shadowOf(activity).receiveResult(started.intent, Activity.RESULT_OK, new Intent().setData(uri));
                ShadowLooper.idleMainLooper();
                assertEquals("Couldn't start that. Try again in a moment.", ShadowToast.getTextOfLatestToast());
                assertEquals("the file was read anyway", 0, SettingsFileProvider.opened.get());
                assertTrue(page.findPreference(IMPORT_ROW).isEnabled());
                assertTrue(page.findPreference(EXPORT_ROW).isEnabled());
            }
            settle();
            // And it works once the queue has room.
            deliver(activity, tap(activity, page, IMPORT_ROW), fileWith(Settings.HIDE_ADS, false));
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.HIDE_ADS.savedValue());
        }
    }

    /**
     * An import whose worker can't start, after it has claimed the rows, gives them back and
     * changes nothing. That path has no wait to run out, so nothing else would: the rows would
     * stay out of reach until Telegram restarts. Here the worker queue fills up while the preview
     * is on screen, so Import finds no room.
     */
    @Test
    public void anImportWhoseWorkerCantStartGivesTheRowsBack() throws Exception {
        String file = fileWith(Settings.HIDE_ADS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            AlertDialog preview = shownPreview();
            RuntimeException escaped = null;
            try (WorkerPoolForTests full = WorkerPoolForTests.fill()) {
                try {
                    preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                    ShadowLooper.idleMainLooper();
                } catch (RuntimeException failure) {
                    escaped = failure;
                }
                assertTrue("the rows stayed out of reach", page.findPreference(IMPORT_ROW).isEnabled());
                assertTrue(page.findPreference(EXPORT_ROW).isEnabled());
                assertFalse(AbstractPreferenceFragment.settingImportInProgress);
                assertNull("the failure reached Telegram", escaped);
                assertEquals("Couldn't start that. Try again in a moment.", ShadowToast.getTextOfLatestToast());
                assertTrue("a switch changed", Settings.HIDE_ADS.savedValue());
            }
            settle();

            // And the next import goes through.
            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.HIDE_ADS.savedValue());
        }
    }

    /**
     * A switch that takes effect at the next start owes a restart when a file changes it, the same
     * as when its row does. The card and the restart row say so, on the page and on one rebuilt
     * afterwards, until a file puts back the value Telegram is running with, and then only for that
     * switch. A file that names the switch as it is, or whose write is put back, owes nothing new.
     * Nothing is asked along the way: the preview is the only dialog.
     *
     * <p>An import used to skip that bookkeeping, and the card said "Your switches are working."
     * over a font, a theme or a tab bar that hadn't changed yet.
     */
    @Test
    public void anImportedSwitchThatWaitsForARestartSaysSoUntilItsRunningValueIsBack() throws Exception {
        List<BooleanSetting> gated = Arrays.asList(Settings.USE_SYSTEM_FONT, Settings.AMOLED_BLACK,
                Settings.DISABLE_ARCHIVE_PULL, Settings.HIDE_CONTACTS_TAB);
        String on = fileWith(Settings.USE_SYSTEM_FONT, true, Settings.AMOLED_BLACK, true,
                Settings.DISABLE_ARCHIVE_PULL, true, Settings.HIDE_CONTACTS_TAB, true);
        String off = fileWith(Settings.USE_SYSTEM_FONT, false, Settings.AMOLED_BLACK, false,
                Settings.DISABLE_ARCHIVE_PULL, false, Settings.HIDE_CONTACTS_TAB, false);
        String working = "Your switches are working.";
        String waiting = "A change here applies after Telegram restarts.";
        Set<String> owed = AbstractPreferenceFragment.restartPending;
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            for (BooleanSetting setting : gated) assertTrue(setting.key + " takes effect at once", setting.rebootApp);

            // Named as they are, next to a switch that does change.
            JSONObject asTheyAre = new JSONObject(off);
            asTheyAre.getJSONObject("settings").put(Settings.HIDE_ADS.key, false);
            importFile(controller.get(), page, asTheyAre.toString());
            assertFalse(Settings.HIDE_ADS.savedValue());
            assertEquals("a switch a file left as it was owes a restart", Collections.emptySet(), new TreeSet<>(owed));
            assertEquals(working, overview(page));

            // A write that's put back changed nothing.
            importFile(controller.get(), page, on, FailingStore.Fault.COMMIT_THROWS);
            assertEquals("Couldn't import the settings. Nothing was changed.", ShadowToast.getTextOfLatestToast());
            assertEquals("a write that was put back owes a restart", Collections.emptySet(), new TreeSet<>(owed));
            assertEquals(working, overview(page));

            importFile(controller.get(), page, on);
            assertEquals("Settings imported. 4 switches changed.", ShadowToast.getTextOfLatestToast());
            assertFalse("the import asked something after its preview", ShadowAlertDialog.getLatestAlertDialog().isShowing());
            assertEquals(keys(gated), new TreeSet<>(owed));
            assertEquals(waiting, overview(page));
            assertEquals("Restart Telegram to apply 4 changes", restartRow(page));

            // The page is rebuilt. Telegram runs what it ran, so it owes what it owed.
            controller.recreate();
            ShadowLooper.idleMainLooper();
            page = SettingsL10nTest.pageOf(dialogOf(controller.get()));
            assertEquals(keys(gated), new TreeSet<>(owed));
            assertEquals(waiting, overview(page));
            assertEquals("Restart Telegram to apply 4 changes", restartRow(page));

            // A file that would put them back, whose write doesn't land.
            importFile(controller.get(), page, off, FailingStore.Fault.COMMIT_THROWS);
            assertEquals(keys(gated), new TreeSet<>(owed));
            assertEquals(waiting, overview(page));

            // Back to the running value one at a time: each takes its own debt off and no other.
            Set<String> left = keys(gated);
            for (BooleanSetting setting : gated) {
                importFile(controller.get(), page, fileWith(setting, false));
                left.remove(setting.key);
                assertEquals("after " + setting.key + " went back", left, new TreeSet<>(owed));
                assertEquals("after " + setting.key + " went back", left.isEmpty() ? working : waiting, overview(page));
            }
            assertNull("the restart row outlived the changes it was for", restartRow(page));
        }
    }

    // ---- The app holding the file ------------------------------------------------------------

    private static final String EXPORT_TIMEOUT = "That app is slow. It may still save the file, so check it.";
    private static final String IMPORT_TIMEOUT = "That app is slow to answer. Nothing was changed. Try again.";
    private static final String STALLED = "That file's app still hasn't answered. Try again later.";
    private static final String MISMATCH = "Saved, but the file doesn't match. Save it again as a new file.";
    private static final String UNCHECKED = "Settings exported but not checked. Open the file to make sure.";

    /**
     * An app that turns "wt" down gets "w", which here keeps the old file's longer tail. The file is
     * read back and the export says it doesn't read as what was written, rather than claiming
     * success. An app that truncates gets the plain answer.
     */
    @Test
    public void anExportThatKeepsOldBytesIsReadBackAndSaysSo() throws Exception {
        SettingsFileProvider.refusesTruncate = true;
        String now = SettingsBackup.create();
        Uri uri = SettingsFileProvider.put(AUTHORITY, "old.json",
                (now + repeat(' ', 64) + "{\"old\":true}").getBytes(StandardCharsets.UTF_8));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            String resting = String.valueOf(page.findPreference(EXPORT_ROW).getSummary());
            export(activity, page, uri);
            assertEquals(MISMATCH, ShadowToast.getTextOfLatestToast());
            assertEquals("the row keeps the answer a two-line toast cuts off at large text",
                    MISMATCH + "\n" + resting, String.valueOf(page.findPreference(EXPORT_ROW).getSummary()));
            String kept = new String(SettingsFileProvider.get(uri), StandardCharsets.UTF_8);
            assertTrue("the app truncated after all", kept.startsWith(now) && kept.endsWith("{\"old\":true}"));
            assertEquals(SettingsBackup.Reason.DAMAGED, reasonFor(kept));
            assertTrue(page.findPreference(EXPORT_ROW).isEnabled());

            SettingsFileProvider.refusesTruncate = false;
            export(activity, page, uri);
            assertEquals("Settings exported.", ShadowToast.getTextOfLatestToast());
            assertEquals("the newer answer replaces the older one", "Settings exported.\n" + resting,
                    String.valueOf(page.findPreference(EXPORT_ROW).getSummary()));
            assertEquals(now, new String(SettingsFileProvider.get(uri), StandardCharsets.UTF_8));
        }
    }

    /** An app that won't open the file for reading leaves the export unchecked, and the export says so. */
    @Test
    public void anExportTheAppWontReadBackSaysItWasNotChecked() throws Exception {
        SettingsFileProvider.readFailure = new SecurityException("no read grant");
        Uri uri = SettingsFileProvider.put(AUTHORITY, "write-only.json", new byte[0]);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            export(activity, page, uri);
            assertEquals(UNCHECKED, ShadowToast.getTextOfLatestToast());
            assertEquals(SettingsBackup.create(), new String(SettingsFileProvider.get(uri), StandardCharsets.UTF_8));
            assertTrue(page.findPreference(EXPORT_ROW).isEnabled());
        }
    }

    /** A runtime failure partway through a read is refused like an IOException, with a message and the rows back. */
    @Test
    public void aRuntimeFailureWhileReadingIsUnreadable() throws Exception {
        InputStream failing = new InputStream() {
            private int given;

            @Override public int read() {
                if (given++ < 3) return '{';
                throw new IllegalStateException("the app went away");
            }
        };
        assertEquals(SettingsBackup.Reason.UNREADABLE, readReason(failing));

        SettingsFileProvider.readFailure = new IllegalStateException("the app went away");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            ShadowAlertDialog.reset();
            String resting = String.valueOf(page.findPreference(IMPORT_ROW).getSummary());
            String exportResting = String.valueOf(page.findPreference(EXPORT_ROW).getSummary());
            deliver(activity, tap(activity, page, IMPORT_ROW), SettingsBackup.create());
            String refused = SettingsBackupPreference.refusal(SettingsBackup.Reason.UNREADABLE);
            assertEquals(refused, ShadowToast.getTextOfLatestToast());
            assertEquals(refused + "\n" + resting, String.valueOf(page.findPreference(IMPORT_ROW).getSummary()));
            assertEquals("only the acting row says it", exportResting, String.valueOf(page.findPreference(EXPORT_ROW).getSummary()));
            assertNull(ShadowAlertDialog.getLatestAlertDialog());
            assertTrue(page.findPreference(IMPORT_ROW).isEnabled());
            assertTrue(page.findPreference(EXPORT_ROW).isEnabled());
        }
    }

    /**
     * An app that never answers: after the wait the rows come back, the cancel reaches the app and
     * the message says only that HushTelegram stopped waiting. While the app still holds a worker
     * nothing new starts, and its late answer shows no preview and says nothing.
     */
    @Test
    @Config(sdk = {28, 30, 33, 36})
    public void aStalledAppGivesTheRowsBackAndItsLateAnswerChangesNothing() throws Exception {
        CountDownLatch release = new CountDownLatch(1);
        SettingsFileProvider.stall = release;
        SettingsFileProvider.ignoresCancel = true;
        Uri uri = SettingsFileProvider.put(AUTHORITY, "stalled.json",
                fileWith(Settings.HIDE_ADS, false).getBytes(StandardCharsets.UTF_8));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            ShadowAlertDialog.reset();
            Preference importRow = page.findPreference(IMPORT_ROW);
            try {
                shadowOf(activity).receiveResult(tap(activity, page, IMPORT_ROW).intent, Activity.RESULT_OK,
                        new Intent().setData(uri));
                ShadowLooper.idleMainLooper();
                assertFalse(importRow.isEnabled());
                awaitHeldOpen();
                waitOut();
                assertEquals(IMPORT_TIMEOUT, ShadowToast.getTextOfLatestToast());
                assertTrue(importRow.isEnabled());
                assertTrue(page.findPreference(EXPORT_ROW).isEnabled());
                assertEquals("the cancel never reached the app", 1, SettingsFileProvider.cancels.get());

                ShadowToast.reset();
                click(page.findPreference(EXPORT_ROW));
                assertNull("a picker opened while a stuck app held a worker",
                        shadowOf(activity).getNextStartedActivityForResult());
                assertEquals(STALLED, ShadowToast.getTextOfLatestToast());
            } finally {
                release.countDown();
            }
            settle();
            assertNull("the late answer showed a preview", ShadowAlertDialog.getLatestAlertDialog());
            assertNull(page.pendingImport);
            assertEquals("the late answer said something", STALLED, ShadowToast.getTextOfLatestToast());
            assertTrue(Settings.HIDE_ADS.savedValue());

            // Once the app has answered, a new read starts.
            deliver(activity, tap(activity, page, IMPORT_ROW), fileWith(Settings.HIDE_ADS, false));
            shownPreview().cancel();
            settle();
        }
    }

    /**
     * An export whose app honours the cancel ends when the screen stops waiting, so the next one
     * starts at once. One whose app ignores it keeps a second export off the file until it has
     * answered, and its late answer is neither written to nor called a success.
     */
    @Test
    public void aStalledExportIsCancelledOrKeepsASecondWriteOffItsFile() throws Exception {
        Uri uri = SettingsFileProvider.put(AUTHORITY, "busy.json", new byte[0]);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            SettingsFileProvider.stall = new CountDownLatch(1);
            shadowOf(activity).receiveResult(tap(activity, page, EXPORT_ROW).intent, Activity.RESULT_OK,
                    new Intent().setData(uri));
            ShadowLooper.idleMainLooper();
            awaitHeldOpen();
            waitOut();
            assertEquals(EXPORT_TIMEOUT, ShadowToast.getTextOfLatestToast());
            assertEquals(1, SettingsFileProvider.cancels.get());
            settle();
            assertEquals("the cancelled export said more", EXPORT_TIMEOUT, ShadowToast.getTextOfLatestToast());
            assertEquals(0, SettingsFileProvider.get(uri).length);

            CountDownLatch release = new CountDownLatch(1);
            SettingsFileProvider.stall = release;
            SettingsFileProvider.ignoresCancel = true;
            try {
                shadowOf(activity).receiveResult(tap(activity, page, EXPORT_ROW).intent, Activity.RESULT_OK,
                        new Intent().setData(uri));
                ShadowLooper.idleMainLooper();
                awaitHeldOpen();
                waitOut();
                assertEquals(EXPORT_TIMEOUT, ShadowToast.getTextOfLatestToast());
                ShadowToast.reset();
                click(page.findPreference(EXPORT_ROW));
                assertNull("a second write could reach the file", shadowOf(activity).getNextStartedActivityForResult());
                assertEquals(STALLED, ShadowToast.getTextOfLatestToast());
            } finally {
                release.countDown();
            }
            settle();
            // Handed over after the cancel, the file is closed unwritten, and nothing is said.
            assertEquals(0, SettingsFileProvider.get(uri).length);
            assertEquals("the late answer was called a success", STALLED, ShadowToast.getTextOfLatestToast());

            SettingsFileProvider.stall = null;
            export(activity, page, uri);
            assertEquals("Settings exported.", ShadowToast.getTextOfLatestToast());
        }
    }

    /**
     * A test that stops while the app still holds its file, as a failed assertion does, leaves the
     * next test nothing busy. The cleanup lets the open go, so the run ends and gives the rows back
     * the way it does in the app. A held open used to outlast the cleanup's wait for background
     * work, which skipped the rest of the cleanup and kept the rows claimed for every later test.
     */
    @Test
    public void aTestThatStopsWhileTheAppHoldsItsFileLeavesTheNextOneFree() throws Exception {
        SettingsFileProvider.stall = new CountDownLatch(1);
        Uri held = SettingsFileProvider.put(AUTHORITY, "held.json", SettingsBackup.create().getBytes(StandardCharsets.UTF_8));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            shadowOf(activity).receiveResult(tap(activity, page, IMPORT_ROW).intent, Activity.RESULT_OK,
                    new Intent().setData(held));
            assertFalse(page.findPreference(EXPORT_ROW).isEnabled());
            awaitHeldOpen();
        }
        // What runs after a failed test and before the next one.
        restore();
        startClean();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTelegramPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            assertTrue("the next test started with the rows busy", page.findPreference(EXPORT_ROW).isEnabled());
            export(activity, page, SettingsFileProvider.put(AUTHORITY, "next.json", new byte[0]));
            assertEquals("Settings exported.", ShadowToast.getTextOfLatestToast());
        }
    }

    // ---- Helpers -------------------------------------------------------------------------------

    /** Taps a row and hands back the picker it opened. */
    private static ShadowActivity.IntentForResult tap(Activity activity, HushTelegramPreferenceFragment page, String row) {
        Preference control = page.findPreference(row);
        assertNotNull("no such row", control);
        assertEquals(L10n.t("Settings backup"), control.getParent().getTitle());
        assertTrue("the backup page wasn't reachable", page.navigation.open(control));
        android.widget.ListView list = page.getView().findViewById(android.R.id.list);
        int position = -1;
        for (int i = 0; i < list.getCount(); i++) if (list.getItemAtPosition(i) == control) position = i;
        assertTrue("the backup control wasn't visible", position >= 0);
        android.view.View view = list.getAdapter().getView(position, null, list);
        assertTrue(list.performItemClick(view, position, list.getAdapter().getItemId(position)));
        ShadowActivity.IntentForResult started = shadowOf(activity).getNextStartedActivityForResult();
        assertNotNull(row + " opened no picker", started);
        return started;
    }

    private static void click(Preference row) {
        assertNotNull("no such row", row);
        row.getOnPreferenceClickListener().onPreferenceClick(row);
    }

    /** Exports through the picker to [uri], and waits for what that sets off. */
    private static void export(Activity activity, HushTelegramPreferenceFragment page, Uri uri) throws Exception {
        shadowOf(activity).receiveResult(tap(activity, page, EXPORT_ROW).intent, Activity.RESULT_OK, new Intent().setData(uri));
        settle();
    }

    /** Lets the screen's wait for the file's app run out. */
    private static void waitOut() {
        ShadowLooper.idleMainLooper(SettingsBackupPreference.timeoutMs, TimeUnit.MILLISECONDS);
    }

    /**
     * Waits until the app holds the open with its cancel listener in place, as it has long before
     * 30 seconds run out on a phone. waitOut moves only the main thread's clock, so without this the
     * worker may not have reached the app when the cancel goes out, and the app never counts it.
     */
    private static void awaitHeldOpen() throws InterruptedException {
        assertTrue("the app never got the open", SettingsFileProvider.holding.tryAcquire(5, TimeUnit.SECONDS));
    }

    /** Answers a picker with a file holding [text], and waits for what that sets off. */
    private static void deliver(Activity activity, ShadowActivity.IntentForResult started, String text) throws Exception {
        Uri uri = SettingsFileProvider.put(AUTHORITY, System.nanoTime() + ".json", text.getBytes(StandardCharsets.UTF_8));
        shadowOf(activity).receiveResult(started.intent, Activity.RESULT_OK, new Intent().setData(uri));
        settle();
    }

    /**
     * Imports [file] the whole way: the picker, the preview and its Import button, through a store
     * with [faults], and waits for it to end.
     */
    private static void importFile(Activity activity, HushTelegramPreferenceFragment page, String file,
                                   FailingStore.Fault... faults) throws Exception {
        deliver(activity, tap(activity, page, IMPORT_ROW), file);
        try (FailingStore ignored = FailingStore.install(faults)) {
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
        }
    }

    /**
     * What the status card says. The home list draws the card only while paused or a newer release
     * is news, so with nothing paused the restart row (see {@link #restartRow}) is what shows a
     * change that's owed, and the card's line stays right for when it is drawn.
     */
    private static String overview(HushTelegramPreferenceFragment page) {
        while (page.navigation.back()) { }
        return String.valueOf(page.getPreferenceScreen().getPreference(0).getSummary());
    }

    /** The restart row's title on the page showing, or null when the row isn't there. */
    private static String restartRow(HushTelegramPreferenceFragment page) {
        for (int position = 0; position < page.navigation.getCount(); position++) {
            Preference row = page.navigation.getItem(position);
            if (SettingsNavigation.RESTART.equals(row.getKey())) return String.valueOf(row.getTitle());
        }
        return null;
    }

    private static AlertDialog shownPreview() {
        AlertDialog preview = ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull("no preview", preview);
        assertTrue("the preview isn't showing", preview.isShowing());
        return preview;
    }

    private static SettingsDialog dialogOf(Activity activity) {
        SettingsDialog dialog = (SettingsDialog) activity.getFragmentManager().findFragmentByTag("hushtelegram_settings");
        assertNotNull("the settings didn't come back", dialog);
        return dialog;
    }

    private static void settle() throws Exception {
        for (int round = 0; round < 3; round++) {
            Utils.awaitBackgroundTasksForTests();
            ShadowLooper.idleMainLooper();
        }
    }

    private static SettingsBackup.Reason reasonFor(String text) {
        try {
            SettingsBackup.parse(text);
        } catch (SettingsBackup.Rejected refused) {
            return refused.reason;
        }
        throw new AssertionError("accepted: " + printable(text));
    }

    private static SettingsBackup.Reason readReason(InputStream input) {
        try {
            SettingsBackup.read(input);
        } catch (SettingsBackup.Rejected refused) {
            return refused.reason;
        }
        throw new AssertionError("read without a refusal");
    }

    /** A file naming only these switches, as [setting, value] pairs. */
    private static String fileWith(Object... pairs) throws Exception {
        JSONObject switches = new JSONObject();
        for (int index = 0; index < pairs.length; index += 2) {
            switches.put(((BooleanSetting) pairs[index]).key, pairs[index + 1]);
        }
        return new JSONObject().put("format", SettingsBackup.FORMAT).put("schema", SettingsBackup.SCHEMA)
                .put("settings", switches).toString();
    }

    private static Map<String, ?> store() {
        return new HashMap<>(Setting.preferences.preferences.getAll());
    }

    /** Applies [file] through a store with [faults], and hands back the failure it has to end in. */
    private static SettingsBackup.ApplyFailed failedApply(String file, FailingStore.Fault... faults) throws Exception {
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        try (FailingStore ignored = FailingStore.install(faults)) {
            SettingsBackup.apply(snapshot);
        } catch (SettingsBackup.ApplyFailed failed) {
            return failed;
        }
        throw new AssertionError("a failed write was reported as written: " + Arrays.toString(faults));
    }

    private static Set<String> keys(List<? extends Setting<?>> settings) {
        Set<String> keys = new TreeSet<>();
        for (Setting<?> setting : settings) keys.add(setting.key);
        return keys;
    }

    private static Set<String> names(JSONObject object) {
        Set<String> names = new TreeSet<>();
        for (Iterator<String> iterator = object.keys(); iterator.hasNext(); ) names.add(iterator.next());
        return names;
    }

    private static List<Setting<?>> declaredSettings(Class<?> owner) throws IllegalAccessException {
        List<Setting<?>> found = new ArrayList<>();
        for (Field field : owner.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) && Setting.class.isAssignableFrom(field.getType())) {
                found.add((Setting<?>) field.get(null));
            }
        }
        return found;
    }

    private static String repeat(char character, int count) {
        char[] run = new char[count];
        Arrays.fill(run, character);
        return new String(run);
    }

    private static String printable(String text) {
        String shown = text.length() > 80 ? text.substring(0, 80) + "..." : text;
        return shown.replace("\0", "\\0");
    }

    private static final class Counts {
        final AtomicInteger edits = new AtomicInteger();
        final AtomicInteger commits = new AtomicInteger();
        final AtomicInteger applies = new AtomicInteger();
    }

    private interface Body<T> {
        T run() throws Exception;
    }

    /** Runs [body] with Setting's store swapped for [store], and puts the real one back after. */
    private static <T> T withStore(SharedPreferences store, Body<T> body) throws Exception {
        Field field = SharedPrefCategory.class.getDeclaredField("preferences");
        field.setAccessible(true);
        Object original = field.get(Setting.preferences);
        field.set(Setting.preferences, store);
        try {
            return body.run();
        } finally {
            field.set(Setting.preferences, original);
        }
    }

    /**
     * [target], counting editors and their commits. While [fail] answers true, a commit reports
     * failure: after landing, or, with [landThenLose], the first lands and the rest never do.
     */
    private static SharedPreferences counting(SharedPreferences target, Counts counts, BooleanSupplier fail,
                                              boolean landThenLose) {
        return (SharedPreferences) Proxy.newProxyInstance(target.getClass().getClassLoader(),
                new Class<?>[]{SharedPreferences.class}, (proxy, method, args) -> {
                    if (!method.getName().equals("edit")) return method.invoke(target, args);
                    counts.edits.incrementAndGet();
                    SharedPreferences.Editor editor = target.edit();
                    return Proxy.newProxyInstance(editor.getClass().getClassLoader(),
                            new Class<?>[]{SharedPreferences.Editor.class}, (editorProxy, call, values) -> {
                                if (call.getName().equals("apply")) {
                                    counts.applies.incrementAndGet();
                                    return call.invoke(editor, values);
                                }
                                if (call.getName().equals("commit")) {
                                    int commit = counts.commits.incrementAndGet();
                                    if (landThenLose && commit > 1 && fail.getAsBoolean()) return false;
                                    Object landed = call.invoke(editor, values);
                                    return !fail.getAsBoolean() && (Boolean) landed;
                                }
                                Object result = call.invoke(editor, values);
                                return result instanceof SharedPreferences.Editor ? editorProxy : result;
                            });
                });
    }
}
