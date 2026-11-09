/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Forked from:
 * https://github.com/SysAdminDoc/hushfeed/blob/bcc57ee555f4346c4eb1cbdae9f6ca8a3fa6fef4/extensions/tiktok/src/test/java/app/morphe/extension/tiktok/settings/SettingsBackupTest.java
 * Copyright 2026 Hushfeed contributors (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026: rewritten around the list of switches a file may
 * carry, the preview an import shows first, and the picker round trip through Hushfacebook's
 * settings dialog, the activity rebuilt behind the picker included.
 */
package app.morphe.extension.hushthreads.settings;

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
import android.os.Build;
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
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.BooleanSupplier;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.WorkerPoolForTests;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.FailingStore;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.morphe.extension.shared.settings.preference.LogBufferManager;
import app.morphe.extension.shared.settings.preference.SharedPrefCategory;

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
    private static final Map<String, String> STAYS_OUT = Collections.singletonMap(
            "hushthreads_check_releases",
            "It puts the phone online, and the import preview gives only a count of the switches it "
                    + "changes, so a file someone shared could turn it on unseen. It's switched on from the "
                    + "phone's own screen.");

    /** HushThreads's own state and its diagnostics. None of them is ever in a file. */
    private static List<Setting<?>> neverInAFile() {
        return Arrays.asList(BaseSettings.PAUSED, BaseSettings.SAFE_MODE, BaseSettings.DEBUG,
                BaseSettings.DEBUG_LOG_FILTERS, BaseSettings.DEBUG_STACKTRACE, BaseSettings.DEBUG_TOAST_ON_ERROR,
                BaseSettings.CAPTURE_JAVA_CRASHES, BaseSettings.MORPHE_LANGUAGE, BaseSettings.SHOW_MENU_ICONS,
                BaseSettings.FIRST_TIME_APP_LAUNCHED, BaseSettings.EXPERIMENTAL_APP_CONFIRMED,
                BaseSettings.CHECK_ENVIRONMENT_WARNINGS_ISSUED, BaseSettings.HIDE_QUICK_SETUPS,
                BaseSettings.SETTINGS_SHORTCUT, BaseSettings.SETTINGS_ROW, BaseSettings.SETTINGS_LOGO_PRESS);
    }

    private static final String EXPORT_ROW = "action_export_settings";
    private static final String IMPORT_ROW = "action_import_settings";
    /** The app behind every file the tests pick. */
    private static final String AUTHORITY = "settings-test";

    @Before
    public void startClean() {
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.resetToDefault();
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
        // A pick left waiting would be read by the next test's page as soon as it resumes.
        SettingsBackupPreference.forgetPickForTests();
        SettingsFileGrants.forgetProcessForTests();
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.resetToDefault();
        // Off the list on purpose, so the loop above misses it, and ReleaseCheckTest starts from a
        // phone that never checked.
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
        assertEquals("a switch in Settings has no decision: add it to SettingsBackup.ALLOWLIST, or to STAYS_OUT "
                + "here with the reason it stays out of a settings file", expected, keys(SettingsBackup.ALLOWLIST));
        assertTrue("STAYS_OUT names a switch Settings no longer has", switches.containsAll(STAYS_OUT.keySet()));
        assertEquals("the list names a switch twice", SettingsBackup.ALLOWLIST.size(),
                new HashSet<>(SettingsBackup.ALLOWLIST).size());
        // A file carries true or false and nothing else. A setting in Settings that isn't a switch
        // needs a format that can carry it before it can be decided on.
        List<String> notSwitches = new ArrayList<>();
        for (Setting<?> setting : declaredSettings(Settings.class)) {
            if (!(setting instanceof BooleanSetting)) notSwitches.add(setting.key);
        }
        assertEquals("a setting in Settings isn't a switch, and a settings file has no format for it",
                Collections.emptyList(), notSwitches);
        assertEquals(Arrays.asList(Settings.HIDE_ADS, Settings.HIDE_SUGGESTED_USERS, Settings.HIDE_SEARCH_SUGGESTIONS, Settings.BLOCK_RETURN_REFRESH,
                Settings.RETURN_REFRESH_NO_LIMIT, Settings.DISABLE_VIDEO_AUTOPLAY, Settings.MAX_IMAGE_QUALITY, Settings.DISABLE_SWIPE_TO_SEARCH,
                Settings.SANITIZE_SHARING_LINKS, Settings.OPEN_LINKS_EXTERNALLY,
                Settings.DISABLE_ANALYTICS, Settings.DISABLE_SCREENSHOT_DETECTION, Settings.PURE_BLACK,
                Settings.HIDE_INSTAGRAM_BUTTON, Settings.HIDE_GHOST_POST_BUBBLES, Settings.FULL_SIZE_PROFILE_PICTURES,
                Settings.EXACT_POST_TIMES,
                Settings.FILTER_COMMENTS, Settings.HIDE_COMMENT_LINKS, Settings.SAVE_MEDIA, Settings.DOWNLOAD_COMPATIBLE,
                Settings.COPY_TEXT),
                SettingsBackup.ALLOWLIST);
    }

    @Test
    public void nothingOfHushThreadssOwnIsOnTheList() throws Exception {
        List<Setting<?>> own = declaredSettings(BaseSettings.class);
        assertTrue("the scan of BaseSettings found nothing", own.size() >= neverInAFile().size());
        for (Setting<?> setting : own) {
            assertFalse(setting.key + " is HushThreads's own and is on the list", SettingsBackup.ALLOWLIST.contains(setting));
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
        Settings.SANITIZE_SHARING_LINKS.save(false);
        Settings.CHECK_FOR_RELEASES.save(true);
        BaseSettings.PAUSED.save(true);
        BaseSettings.DEBUG.save(true);
        BaseSettings.DEBUG_LOG_FILTERS.save("feed");
        PauseForTests.pause(HushThreadsPause.Reason.CRASH_LOOP);
        String cookie = "sessionid=100012345678901%3Asecret-session; ds_user_id=100012345678901";
        LogBufferManager.appendToLogBuffer("sentinel line " + cookie);
        HookStatus.invoked(FamilyNames.HIDE_ADS);
        Context app = RuntimeEnvironment.getApplication();

        String text = SettingsBackup.create();
        JSONObject root = new JSONObject(text);
        assertEquals(new TreeSet<>(Arrays.asList("format", "schema", "settings")), names(root));
        assertEquals("hushthreads-settings", root.get("format"));
        assertEquals(1, root.get("schema"));
        JSONObject switches = root.getJSONObject("settings");
        assertEquals(keys(SettingsBackup.ALLOWLIST), names(switches));
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) {
            // Saved, not what a paused Threads is answered: paused, every switch answers false.
            assertFalse(setting.get());
            assertEquals(setting.key, setting.savedValue(), switches.get(setting.key));
        }
        assertEquals(false, switches.get(Settings.HIDE_ADS.key));
        assertEquals(true, switches.get(Settings.DISABLE_ANALYTICS.key));
        for (Setting<?> setting : Setting.allLoadedSettings()) {
            if (SettingsBackup.ALLOWLIST.contains(setting)) continue;
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
        Settings.SANITIZE_SHARING_LINKS.save(false);
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
        assertTrue(Settings.SANITIZE_SHARING_LINKS.savedValue());
        assertTrue(Settings.DISABLE_ANALYTICS.savedValue());

        // A file that changes nothing writes nothing.
        Counts none = new Counts();
        withStore(counting(Setting.preferences.preferences, none, () -> false, false), () -> {
            assertEquals(0, SettingsBackup.apply(SettingsBackup.parse(file)));
            return null;
        });
        assertEquals(0, none.edits.get());
    }

    @Test
    public void aFailedCommitIsPutBackAndSaysSo() throws Exception {
        String file = fileWith(Settings.HIDE_ADS, false, Settings.SANITIZE_SHARING_LINKS, false);
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
        assertTrue(Settings.SANITIZE_SHARING_LINKS.savedValue());
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
     * An editor that won't open, a value it refuses, a commit that answers false or throws, before
     * or after landing: each leaves both switches on the value the store still holds, which is what
     * a restart loads, and only then does the failure say nothing changed.
     */
    @Test
    public void everyFailedWriteLeavesTheLiveSwitchesOnWhatTheStoreKeeps() throws Exception {
        String file = fileWith(Settings.HIDE_ADS, false, Settings.SANITIZE_SHARING_LINKS, false);
        Map<String, ?> before = store();
        for (FailingStore.Fault fault : new FailingStore.Fault[]{FailingStore.Fault.EDIT_THROWS,
                FailingStore.Fault.STAGE_THROWS, FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.COMMIT_THROWS,
                FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING}) {
            SettingsBackup.ApplyFailed failure = failedApply(file, fault);
            assertTrue(fault + " said the switches may have changed", failure.rolledBack);
            assertEquals(fault + " left the store changed", before, store());
            assertTrue(fault + " left a live switch changed", Settings.HIDE_ADS.savedValue());
            assertTrue(fault + " left a live switch changed", Settings.SANITIZE_SHARING_LINKS.savedValue());
        }
    }

    /**
     * A rollback that doesn't land either says so, and the switches then hold what the store kept,
     * so the screen and the next start agree.
     */
    @Test
    public void aRollbackThatFailsSaysSoAndTheSwitchesHoldWhatTheStoreKept() throws Exception {
        String file = fileWith(Settings.HIDE_ADS, false, Settings.SANITIZE_SHARING_LINKS, false);
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
            assertFalse(name + " runs a switch the store doesn't hold", Settings.SANITIZE_SHARING_LINKS.savedValue());
            Settings.HIDE_ADS.resetToDefault();
            Settings.SANITIZE_SHARING_LINKS.resetToDefault();
        }
    }

    /** What a failed import says is what the screen shows and the store holds. */
    @Test
    public void aFailedImportSaysWhatTheStoreKeptAndTheScreenShowsIt() throws Exception {
        String file = fileWith(Settings.HIDE_ADS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            assertEquals("Couldn't import the settings, and couldn't put back the ones you had. "
                    + "Check the switches on this screen.", ShadowToast.getTextOfLatestToast());
            assertEquals(false, store().get(Settings.HIDE_ADS.key));
            assertFalse(Settings.HIDE_ADS.savedValue());
            assertFalse("the screen shows a switch the store doesn't hold", row.isChecked());
        }
    }

    // ---- Refusals ------------------------------------------------------------------------------

    @Test
    public void aFileThatIsNotOneJsonObjectIsDamaged() throws Exception {
        String good = SettingsBackup.create();
        for (String bad : new String[]{good.substring(0, good.length() / 2), "[]", good + "{}", good + " x",
                "just some text", good.replace("\"schema\"", "schema"), good + '\0', "",
                // Numbers past what BigDecimal can hold: these used to escape every refusal.
                "{\"format\":\"hushthreads-settings\",\"schema\":1,\"settings\":{\"later\":1e9999999999}}",
                "{\"format\":\"hushthreads-settings\",\"schema\":1e9999999999,\"settings\":{}}"}) {
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
        String twice = "{\"format\":\"hushthreads-settings\",\"schema\":1,\"settings\":{\"" + key + "\":false,\""
                + key + "\":true}}";
        assertEquals(SettingsBackup.Reason.DUPLICATE, reasonFor(twice));
        assertEquals(SettingsBackup.Reason.DUPLICATE, reasonFor(
                "{\"format\":\"hushthreads-settings\",\"format\":\"hushthreads-settings\",\"schema\":1,\"settings\":{}}"));
        assertEquals("a name repeated inside a name this build doesn't know", SettingsBackup.Reason.DUPLICATE,
                reasonFor("{\"format\":\"hushthreads-settings\",\"schema\":1,\"settings\":{\"later\":{\"a\":1,\"a\":2}}}"));
        // The same name in two different objects is two names.
        assertEquals(0, SettingsBackup.parse(
                "{\"format\":\"hushthreads-settings\",\"schema\":1,\"settings\":{\"" + key + "\":false}}").unknown);
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
        // Anything else where the version goes was never written by HushThreads.
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
    public void aFileThatIsNotHushThreadssIsRefused() throws Exception {
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
                .put("hushthreads_kept_by_a_later_version", "whatever that version keeps here");
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file.toString());
        assertEquals(4, snapshot.unknown);
        assertEquals(1, snapshot.changes().size());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertFalse(Settings.DISABLE_ANALYTICS.savedValue());
        assertFalse("a file paused HushThreads", BaseSettings.PAUSED.savedValue());
        assertFalse("a file turned on debug logging", BaseSettings.DEBUG.savedValue());
    }

    @Test
    public void aFileThatNamesSomeSwitchesLeavesTheRestAlone() throws Exception {
        Settings.SANITIZE_SHARING_LINKS.save(false);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(fileWith(Settings.HIDE_ADS, false));
        assertEquals(1, snapshot.values.size());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertFalse(Settings.HIDE_ADS.savedValue());
        assertFalse("a switch the file didn't name was reset", Settings.SANITIZE_SHARING_LINKS.savedValue());
        assertTrue(Settings.DISABLE_ANALYTICS.savedValue());
    }

    @Test
    public void aWaitingImportSurvivesAsABundle() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.DISABLE_ANALYTICS, false, Settings.SANITIZE_SHARING_LINKS, true));
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
    public void exportWritesTheFileThroughTheSystemPicker() throws Exception {
        Settings.DISABLE_ANALYTICS.save(false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            ShadowActivity.IntentForResult started = tap(activity, page, EXPORT_ROW);
            assertEquals(Intent.ACTION_CREATE_DOCUMENT, started.intent.getAction());
            assertEquals(SettingsBackupPreference.EXPORT, started.requestCode);
            assertEquals("application/json", started.intent.getType());
            assertTrue(started.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            String name = started.intent.getStringExtra(Intent.EXTRA_TITLE);
            assertTrue("the picker would suggest " + name, name.matches("hushthreads-settings-\\d{8}-\\d{6}\\.json"));

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
    public void aFileExportedThroughThePickerImportsBackThroughIt() throws Exception {
        Settings.HIDE_ADS.save(false);
        Settings.SANITIZE_SHARING_LINKS.save(false);
        Map<BooleanSetting, Boolean> exported = new LinkedHashMap<>();
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) exported.put(setting, setting.savedValue());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            Uri uri = SettingsFileProvider.put(AUTHORITY, "round-trip.json", new byte[0]);
            shadowOf(activity).receiveResult(tap(activity, page, EXPORT_ROW).intent, Activity.RESULT_OK,
                    new Intent().setData(uri));
            settle();

            for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.save(!setting.savedValue());
            deliver(activity, tap(activity, page, IMPORT_ROW), new String(SettingsFileProvider.get(uri), StandardCharsets.UTF_8));
            AlertDialog preview = shownPreview();
            assertEquals(SettingsBackup.ALLOWLIST.size() + " switches will change.",
                    String.valueOf(shadowOf(preview).getMessage()));
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
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            application.checkActivities(true);
            for (String row : new String[]{EXPORT_ROW, IMPORT_ROW}) {
                ShadowToast.reset();
                click(page.findPreference(row));
                ShadowLooper.idleMainLooper();
                assertEquals(row, "This phone has no file picker, so there's no way to choose a file here.",
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
                Settings.SANITIZE_SHARING_LINKS, false, Settings.DISABLE_ANALYTICS, true));
        file.getJSONObject("settings").put("later_switch", true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            assertEquals("2 switches will change.\n\n1 item in that file isn't a setting this version of "
                    + "HushThreads knows, so it'll be left out.", String.valueOf(shadowOf(preview).getMessage()));
            assertEquals("the preview wrote something", before, store());
            assertEquals("Import", String.valueOf(preview.getButton(AlertDialog.BUTTON_POSITIVE).getText()));
            assertEquals("Cancel", String.valueOf(preview.getButton(AlertDialog.BUTTON_NEGATIVE).getText()));

            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 2 switches changed.", ShadowToast.getTextOfLatestToast());
            assertFalse(Settings.HIDE_ADS.savedValue());
            assertFalse(Settings.SANITIZE_SHARING_LINKS.savedValue());
            assertTrue(Settings.DISABLE_ANALYTICS.savedValue());
            assertFalse("the page still shows the switch on",
                    ((SwitchPreference) page.findPreference(Settings.HIDE_ADS.key)).isChecked());
            assertNull(page.pendingImport);
            assertFalse(AbstractPreferenceFragment.settingImportInProgress);
        }
    }

    /** An imported switch that waits for a restart owes one, the same as a flipped one. */
    @Test
    public void importingARestartGatedSwitchShowsTheRestartRow() throws Exception {
        boolean pureBlack = Settings.PURE_BLACK.savedValue();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            SettingsDialog dialog = SettingsL10nTest.show(activity);
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(dialog);
            deliver(activity, tap(activity, page, IMPORT_ROW),
                    fileWith(Settings.PURE_BLACK, !pureBlack, Settings.HIDE_ADS, !Settings.HIDE_ADS.savedValue()));
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("only the restart-gated switch owes one", Collections.singleton(Settings.PURE_BLACK.key),
                    new HashSet<>(AbstractPreferenceFragment.restartPending));
            assertTrue("the import left no restart row", restartRowShown(dialog));

            // Importing the value Threads is running with pays the debt back.
            deliver(activity, tap(activity, page, IMPORT_ROW), fileWith(Settings.PURE_BLACK, pureBlack));
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertTrue(AbstractPreferenceFragment.restartPending.isEmpty());
            assertFalse("the restart row stayed with nothing waiting", restartRowShown(dialog));
        }
    }

    private static boolean restartRowShown(SettingsDialog dialog) {
        android.widget.ListView list = dialog.getView().findViewById(android.R.id.list);
        for (int i = 0; i < list.getCount(); i++) {
            if (SettingsNavigation.RESTART.equals(((Preference) list.getItemAtPosition(i)).getKey())) return true;
        }
        return false;
    }

    @Test
    public void aFileThatChangesNothingSaysSoAndOffersNoImport() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
    public void cancellingThePreviewChangesNothing() throws Exception {
        String file = fileWith(Settings.SANITIZE_SHARING_LINKS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            assertTrue(Settings.SANITIZE_SHARING_LINKS.savedValue());
            assertNull("a cancelled import said something", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test
    public void aCancelledPickerChangesNothingAndSaysNothing() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
     * The picker is an activity of its own, and Android may rebuild Threads' behind it, the
     * settings dialog and its page with it. The answer still reaches the rebuilt page: Android
     * finds it by the name the framework gave the page that asked, which the rebuilt one keeps.
     */
    @Test
    public void thePickersAnswerReachesThePageRebuiltBehindIt() throws Exception {
        String file = fileWith(Settings.SANITIZE_SHARING_LINKS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment asked = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            ShadowActivity.IntentForResult started = tap(controller.get(), asked, IMPORT_ROW);

            controller.recreate();
            ShadowLooper.idleMainLooper();
            Activity rebuilt = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(dialogOf(rebuilt));
            assertNotSame("the page wasn't rebuilt", asked, page);

            deliver(rebuilt, started, file);
            AlertDialog preview = shownPreview();
            assertEquals("1 switch will change.", String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.SANITIZE_SHARING_LINKS.savedValue());
            assertEquals("Settings imported. 1 switch changed.", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test
    public void anExportAnswerReachesThePageRebuiltBehindIt() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment asked = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
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
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            deliver(controller.get(), tap(controller.get(), page, IMPORT_ROW), file);
            AlertDialog first = shownPreview();
            String message = String.valueOf(shadowOf(first).getMessage());
            assertEquals("2 switches will change.", message);

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
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
     * While a file is read, both rows explain why they are out of reach. A second picker can't
     * be opened, and the original descriptions return when the read finishes.
     */
    @Test
    @Config(sdk = {28, 36})
    public void theRowsAreOutOfReachWhileAFileIsRead() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
                String waiting = "Reading the settings file. This action will be available when it finishes.";
                assertEquals(waiting, String.valueOf(export.getSummary()));
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    android.widget.ListView list = new android.widget.ListView(activity);
                    assertEquals("Reading the settings file", importRow.getView(null, list).getStateDescription());
                    assertEquals(waiting, export.getView(null, list).getStateDescription());
                }

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
     * Android 12 and newer cut a text toast at two lines, which hid the end of a refusal (seen on
     * an emulator), so the row a run started from says how it ended too. A rebuilt page still says
     * it, and the next run takes it away.
     */
    @Test
    @Config(sdk = {28, 36})
    public void theRowSaysHowItsRunEndedPastTheToast() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            String exportSummary = String.valueOf(page.findPreference(EXPORT_ROW).getSummary());
            String importSummary = String.valueOf(page.findPreference(IMPORT_ROW).getSummary());
            String good = SettingsBackup.create();
            String damaged = SettingsBackupPreference.refusal(SettingsBackup.Reason.DAMAGED);

            deliver(controller.get(), tap(controller.get(), page, IMPORT_ROW), good.substring(0, good.length() - 3));
            assertEquals(damaged, ShadowToast.getTextOfLatestToast());
            assertEquals(damaged, String.valueOf(page.findPreference(IMPORT_ROW).getSummary()));
            assertEquals(exportSummary, String.valueOf(page.findPreference(EXPORT_ROW).getSummary()));

            controller.recreate();
            ShadowLooper.idleMainLooper();
            page = SettingsL10nTest.pageOf(dialogOf(controller.get()));
            assertEquals("the rebuilt page forgot how the import ended",
                    damaged, String.valueOf(page.findPreference(IMPORT_ROW).getSummary()));
            assertTrue(page.findPreference(IMPORT_ROW).isEnabled());

            // A read that ends in the preview says nothing of its own, so only its start takes the
            // refusal away.
            deliver(controller.get(), tap(controller.get(), page, IMPORT_ROW), good);
            assertEquals("the refusal stayed after the next import",
                    importSummary, String.valueOf(page.findPreference(IMPORT_ROW).getSummary()));
            shownPreview().cancel();
            settle();

            export(controller.get(), page, SettingsFileProvider.put(AUTHORITY, "after.json", new byte[0]));
            assertEquals("Settings exported.", String.valueOf(page.findPreference(EXPORT_ROW).getSummary()));
            assertEquals("the old refusal stayed after another run",
                    importSummary, String.valueOf(page.findPreference(IMPORT_ROW).getSummary()));
        }
    }

    /**
     * With SettingsFilePicker in Threads' manifest, the rows open the picker through it rather
     * than from the page. It takes the answer and keeps the file's access past its own end, the
     * page reads the file, and the access is let go once the read is done. A cancel says nothing,
     * keeps nothing and leaves the rows usable.
     */
    @Test
    public void thePickerOpensThroughHushThreadsOwnActivity() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            listPicker(activity);
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));

            ActivityController<SettingsFilePicker> picker = pickThrough(activity, page, IMPORT_ROW);
            ShadowActivity.IntentForResult started = shadowOf(picker.get()).getNextStartedActivityForResult();
            assertNotNull("SettingsFilePicker opened no picker", started);
            assertEquals(SettingsBackupPreference.IMPORT, started.requestCode);
            assertEquals(Intent.ACTION_OPEN_DOCUMENT, started.intent.getAction());

            CountDownLatch release = new CountDownLatch(1);
            SettingsFileProvider.stall = release;
            Uri uri = SettingsFileProvider.put(AUTHORITY, "through.json",
                    fileWith(Settings.SANITIZE_SHARING_LINKS, false).getBytes(StandardCharsets.UTF_8));
            int grant = Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION;
            shadowOf(picker.get()).receiveResult(started.intent, Activity.RESULT_OK,
                    new Intent().setData(uri).addFlags(grant | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION));
            assertTrue("SettingsFilePicker stayed after the answer", picker.get().isFinishing());
            try {
                awaitHeldOpen();
                assertEquals("the file's access wasn't kept for the read", 1,
                        activity.getContentResolver().getPersistedUriPermissions().size());
                assertEquals("the kept access isn't listed for the next start",
                        Collections.singleton(uri.toString()), heldFiles(activity));
            } finally {
                release.countDown();
            }
            settle();
            assertTrue("the file's access was kept after the read",
                    activity.getContentResolver().getPersistedUriPermissions().isEmpty());
            assertTrue("the let-go access is still listed", heldFiles(activity).isEmpty());
            assertEquals("1 switch will change.", String.valueOf(shadowOf(shownPreview()).getMessage()));
            shownPreview().cancel();
            settle();

            ActivityController<SettingsFilePicker> cancelled = pickThrough(activity, page, EXPORT_ROW);
            ShadowActivity.IntentForResult export = shadowOf(cancelled.get()).getNextStartedActivityForResult();
            assertEquals(Intent.ACTION_CREATE_DOCUMENT, export.intent.getAction());
            ShadowToast.reset();
            shadowOf(cancelled.get()).receiveResult(export.intent, Activity.RESULT_CANCELED, null);
            settle();
            assertTrue(cancelled.get().isFinishing());
            assertNull("a cancel said something", ShadowToast.getTextOfLatestToast());
            assertTrue(page.findPreference(EXPORT_ROW).isEnabled());
            assertTrue(activity.getContentResolver().getPersistedUriPermissions().isEmpty());

            Uri out = SettingsFileProvider.put(AUTHORITY, "through-export.json", new byte[0]);
            ActivityController<SettingsFilePicker> saving = pickThrough(activity, page, EXPORT_ROW);
            shadowOf(saving.get()).receiveResult(shadowOf(saving.get()).getNextStartedActivityForResult().intent,
                    Activity.RESULT_OK, new Intent().setData(out).addFlags(grant | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION));
            settle();
            assertEquals(SettingsBackup.create(), new String(SettingsFileProvider.get(out), StandardCharsets.UTF_8));
            assertEquals("Settings exported.", String.valueOf(page.findPreference(EXPORT_ROW).getSummary()));
            assertTrue(activity.getContentResolver().getPersistedUriPermissions().isEmpty());
        }
    }

    /**
     * Android brings SettingsFilePicker back on its own if it ends while the picker is up. The
     * rebuilt one opens no second picker, and the answer still reaches the page.
     */
    @Test
    public void aRebuiltSettingsFilePickerWaitsForTheAnswer() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            listPicker(activity);
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            ActivityController<SettingsFilePicker> first = pickThrough(activity, page, IMPORT_ROW);
            ShadowActivity.IntentForResult started = shadowOf(first.get()).getNextStartedActivityForResult();
            Bundle saved = new Bundle();
            first.saveInstanceState(saved);

            ActivityController<SettingsFilePicker> rebuilt = Robolectric.buildActivity(SettingsFilePicker.class,
                    first.getIntent()).create(saved);
            assertNull("a rebuilt SettingsFilePicker opened a second picker",
                    shadowOf(rebuilt.get()).getNextStartedActivityForResult());
            Uri uri = SettingsFileProvider.put(AUTHORITY, "rebuilt.json",
                    fileWith(Settings.SANITIZE_SHARING_LINKS, false).getBytes(StandardCharsets.UTF_8));
            shadowOf(rebuilt.get()).receiveResult(started.intent, Activity.RESULT_OK, new Intent().setData(uri));
            settle();
            assertEquals("1 switch will change.", String.valueOf(shadowOf(shownPreview()).getMessage()));
            shownPreview().cancel();
            settle();
        }
    }

    /**
     * Two quick taps open one picker. They used to open two, and when both answers named the same
     * file, the second let go of the access the first had just kept. The answer, a cancel included,
     * or the page back on screen lets the rows open a picker again.
     */
    @Test
    public void twoQuickTapsOpenOnePicker() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            listPicker(activity);
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            ActivityController<SettingsFilePicker> picker = pickThrough(activity, page, IMPORT_ROW);
            // Robolectric keeps one list of starts for every activity, SettingsFilePicker's included.
            ShadowActivity.IntentForResult started = shadowOf(picker.get()).getNextStartedActivityForResult();
            click(page.findPreference(IMPORT_ROW));
            click(page.findPreference(EXPORT_ROW));
            assertNull("a second tap opened another picker", shadowOf(activity).getNextStartedActivityForResult());

            shadowOf(picker.get()).receiveResult(started.intent, Activity.RESULT_CANCELED, null);
            settle();
            ActivityController<SettingsFilePicker> again = pickThrough(activity, page, EXPORT_ROW);
            assertEquals(Intent.ACTION_CREATE_DOCUMENT,
                    shadowOf(again.get()).getNextStartedActivityForResult().intent.getAction());

            // That picker never answers; the page coming back shows none covers it anymore.
            controller.pause().resume();
            settle();
            assertNotNull(pickThrough(activity, page, IMPORT_ROW));
        }
    }

    /**
     * Android keeps one lasting grant per file, so a second answer naming the same file keeps the
     * access it shares with the first rather than letting go of it.
     */
    @Test
    public void theSameFilePickedTwiceKeepsItsAccess() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            SettingsL10nTest.show(activity);
            controller.pause();
            Uri uri = SettingsFileProvider.put(AUTHORITY, "twice.json",
                    fileWith(Settings.SANITIZE_SHARING_LINKS, false).getBytes(StandardCharsets.UTF_8));
            int flags = Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION;
            SettingsBackupPreference.picked(SettingsBackupPreference.IMPORT, uri, SettingsFileGrants.take(activity, uri, flags));
            Uri same = Uri.parse(uri.toString());
            SettingsBackupPreference.picked(SettingsBackupPreference.IMPORT, same, SettingsFileGrants.take(activity, same, flags));
            assertEquals("the second answer let go of the file's access", 1,
                    activity.getContentResolver().getPersistedUriPermissions().size());

            controller.resume();
            settle();
            assertEquals("1 switch will change.", String.valueOf(shadowOf(shownPreview()).getMessage()));
            assertTrue(activity.getContentResolver().getPersistedUriPermissions().isEmpty());
            assertTrue(heldFiles(activity).isEmpty());
            shownPreview().cancel();
            settle();
        }
    }

    /** A picked file the settings don't come back for in time is let go, and nothing previews it later. */
    @Test
    public void aPickNoSettingsTookIsLetGoOfInTime() throws Exception {
        long kept = SettingsBackupPreference.pickKeptMs;
        SettingsBackupPreference.pickKeptMs = 1_000L;
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            SettingsL10nTest.show(activity);
            controller.pause().stop();
            Uri uri = SettingsFileProvider.put(AUTHORITY, "late.json",
                    fileWith(Settings.SANITIZE_SHARING_LINKS, false).getBytes(StandardCharsets.UTF_8));
            int flags = Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION;
            SettingsBackupPreference.picked(SettingsBackupPreference.IMPORT, uri, SettingsFileGrants.take(activity, uri, flags));
            ShadowLooper.idleMainLooper(999, TimeUnit.MILLISECONDS);
            assertEquals("let go of before its time", 1, activity.getContentResolver().getPersistedUriPermissions().size());
            ShadowLooper.idleMainLooper(1, TimeUnit.MILLISECONDS);
            assertTrue("kept past its time", activity.getContentResolver().getPersistedUriPermissions().isEmpty());
            assertTrue(heldFiles(activity).isEmpty());

            controller.start().resume();
            settle();
            assertNull("a file let go of was previewed", ShadowAlertDialog.getLatestAlertDialog());
        } finally {
            SettingsBackupPreference.pickKeptMs = kept;
        }
    }

    /**
     * Access an ended process kept and never let go of is let go at the next start. Access this
     * process took, as for an answer Android started it to deliver, stays.
     */
    @Test
    public void accessAnEndedProcessKeptIsLetGoAtTheNextStart() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        int flags = Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION;
        Uri left = SettingsFileProvider.put(AUTHORITY, "left.json", new byte[0]);
        assertEquals(Intent.FLAG_GRANT_READ_URI_PERMISSION, SettingsFileGrants.take(context, left, flags));
        SettingsFileGrants.forgetProcessForTests();
        Uri now = SettingsFileProvider.put(AUTHORITY, "now.json", new byte[0]);
        SettingsFileGrants.take(context, now, flags);
        assertEquals(new HashSet<>(Arrays.asList(left.toString(), now.toString())), heldFiles(context));

        SettingsFileGrants.sweepAfterStart(context);
        Utils.awaitBackgroundTasksForTests();
        assertEquals(Collections.singleton(now.toString()), heldFiles(context));
        assertEquals(1, context.getContentResolver().getPersistedUriPermissions().size());
        assertEquals(now, context.getContentResolver().getPersistedUriPermissions().get(0).getUri());

        SettingsFileGrants.release(context, now, Intent.FLAG_GRANT_READ_URI_PERMISSION);
        assertTrue(heldFiles(context).isEmpty());
        assertTrue(context.getContentResolver().getPersistedUriPermissions().isEmpty());

        // An export's read and write and an import's read of one file are one grant, so letting go
        // after the import ends the write access too.
        int both = flags | Intent.FLAG_GRANT_WRITE_URI_PERMISSION;
        SettingsFileGrants.take(context, now, both);
        assertEquals(Intent.FLAG_GRANT_READ_URI_PERMISSION, SettingsFileGrants.take(context, now, flags));
        SettingsFileGrants.release(context, now, Intent.FLAG_GRANT_READ_URI_PERMISSION);
        assertTrue("write access outlived the release", context.getContentResolver().getPersistedUriPermissions().isEmpty());
        // A picker that made nothing lasting leaves nothing to list.
        assertEquals(0, SettingsFileGrants.take(context, now, Intent.FLAG_GRANT_READ_URI_PERMISSION));
        assertTrue(heldFiles(context).isEmpty());
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
    public void aFullWorkerQueueLeavesTheRowsUsable() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
     * stay out of reach until Threads restarts. Here the worker queue fills up while the preview
     * is on screen, so Import finds no room.
     */
    @Test
    public void anImportWhoseWorkerCantStartGivesTheRowsBack() throws Exception {
        String file = fileWith(Settings.HIDE_ADS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
                assertNull("the failure reached Threads", escaped);
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

    // ---- The app holding the file ------------------------------------------------------------

    private static final String EXPORT_TIMEOUT = "The app holding the settings file is taking too long, so HushThreads "
            + "stopped waiting. That app may still finish saving it, so check the file before you rely on it.";
    private static final String IMPORT_TIMEOUT =
            "The app holding that file is taking too long, so HushThreads stopped waiting. Nothing was changed.";
    private static final String STALLED = "The app holding the last settings file still hasn't answered. Try again later.";
    private static final String MISMATCH =
            "The settings file was saved, but it doesn't read back as what was written. Save it again as a new file.";
    private static final String UNCHECKED = "Settings exported. The app holding the file wouldn't let HushThreads "
            + "read it back, so it wasn't checked.";

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
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            export(activity, page, uri);
            assertEquals(MISMATCH, ShadowToast.getTextOfLatestToast());
            String kept = new String(SettingsFileProvider.get(uri), StandardCharsets.UTF_8);
            assertTrue("the app truncated after all", kept.startsWith(now) && kept.endsWith("{\"old\":true}"));
            assertEquals(SettingsBackup.Reason.DAMAGED, reasonFor(kept));
            assertTrue(page.findPreference(EXPORT_ROW).isEnabled());

            SettingsFileProvider.refusesTruncate = false;
            export(activity, page, uri);
            assertEquals("Settings exported.", ShadowToast.getTextOfLatestToast());
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
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            ShadowAlertDialog.reset();
            deliver(activity, tap(activity, page, IMPORT_ROW), SettingsBackup.create());
            assertEquals(SettingsBackupPreference.refusal(SettingsBackup.Reason.UNREADABLE), ShadowToast.getTextOfLatestToast());
            assertNull(ShadowAlertDialog.getLatestAlertDialog());
            assertTrue(page.findPreference(IMPORT_ROW).isEnabled());
            assertTrue(page.findPreference(EXPORT_ROW).isEnabled());
        }
    }

    /**
     * An app that never answers: after the wait the rows come back, the cancel reaches the app and
     * the message says only that HushThreads stopped waiting. While the app still holds a worker
     * nothing new starts, and its late answer shows no preview and says nothing.
     */
    @Test
    public void aStalledAppGivesTheRowsBackAndItsLateAnswerChangesNothing() throws Exception {
        CountDownLatch release = new CountDownLatch(1);
        SettingsFileProvider.stall = release;
        SettingsFileProvider.ignoresCancel = true;
        Uri uri = SettingsFileProvider.put(AUTHORITY, "stalled.json",
                fileWith(Settings.HIDE_ADS, false).getBytes(StandardCharsets.UTF_8));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            SettingsFileProvider.stall = new CountDownLatch(1);
            shadowOf(activity).receiveResult(tap(activity, page, EXPORT_ROW).intent, Activity.RESULT_OK,
                    new Intent().setData(uri));
            ShadowLooper.idleMainLooper();
            awaitHeldOpen();
            assertEquals("Saving the settings file. This action will be available when it finishes.",
                    String.valueOf(page.findPreference(IMPORT_ROW).getSummary()));
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
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            assertTrue("the next test started with the rows busy", page.findPreference(EXPORT_ROW).isEnabled());
            export(activity, page, SettingsFileProvider.put(AUTHORITY, "next.json", new byte[0]));
            assertEquals("Settings exported.", ShadowToast.getTextOfLatestToast());
        }
    }

    /** The picker result and a landed-write rollback agree with the rebuilt screen at both endpoints. */
    @Test
    @Config(sdk = {28, 36})
    public void platformEndpointsImportContentUrisAfterRecreationAndRollBackLandedWrites() throws Exception {
        Uri uri = SettingsFileProvider.put(AUTHORITY, "platform-import.json",
                fileWith(Settings.HIDE_ADS, false, Settings.SANITIZE_SHARING_LINKS, false)
                        .getBytes(StandardCharsets.UTF_8));
        assertEquals("content", uri.getScheme());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushThreadsPreferenceFragment asked = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            ShadowActivity.IntentForResult started = tap(controller.get(), asked, IMPORT_ROW);
            assertEquals(Intent.ACTION_OPEN_DOCUMENT, started.intent.getAction());
            assertTrue(started.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            controller.recreate();
            ShadowLooper.idleMainLooper();
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(dialogOf(activity));
            assertNotSame("the picker still addresses the old page", asked, page);
            Map<String, ?> before = store();

            shadowOf(activity).receiveResult(started.intent, Activity.RESULT_OK,
                    new Intent().setData(uri).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION));
            settle();
            assertTrue("the content provider was bypassed", SettingsFileProvider.opened.get() > 0);
            assertEquals(before, store());
            assertEquals("2 switches will change.", String.valueOf(shadowOf(shownPreview()).getMessage()));
            try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING)) {
                shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                settle();
            }
            assertEquals("Couldn't import the settings. Nothing was changed.", ShadowToast.getTextOfLatestToast());
            assertEquals("the landed values weren't rolled back", before, store());
            for (BooleanSetting setting : new BooleanSetting[]{Settings.HIDE_ADS, Settings.SANITIZE_SHARING_LINKS}) {
                assertTrue(setting.key, setting.savedValue());
                assertTrue(setting.key, ((SwitchPreference) page.findPreference(setting.key)).isChecked());
            }
            assertNull(page.pendingImport);
            assertTrue(page.findPreference(IMPORT_ROW).isEnabled());
            assertTrue(page.findPreference(EXPORT_ROW).isEnabled());

            controller.recreate();
            ShadowLooper.idleMainLooper();
            activity = controller.get();
            page = SettingsL10nTest.pageOf(dialogOf(activity));
            assertEquals(before, store());
            assertTrue(((SwitchPreference) page.findPreference(Settings.HIDE_ADS.key)).isChecked());
            shadowOf(activity).receiveResult(tap(activity, page, IMPORT_ROW).intent, Activity.RESULT_OK,
                    new Intent().setData(uri).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION));
            settle();
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 2 switches changed.", ShadowToast.getTextOfLatestToast());
            assertFalse(Settings.HIDE_ADS.savedValue());
            assertFalse(Settings.SANITIZE_SHARING_LINKS.savedValue());
            assertEquals(false, store().get(Settings.HIDE_ADS.key));
            assertFalse(((SwitchPreference) page.findPreference(Settings.HIDE_ADS.key)).isChecked());
        }
    }

    /** Scoped-storage and older picker failures both return usable rows without changing a switch. */
    @Test
    @Config(sdk = {28, 36})
    public void platformEndpointsRecoverFromAContentUriReadPermissionFailure() throws Exception {
        Uri uri = SettingsFileProvider.put(AUTHORITY, "platform-no-grant.json",
                fileWith(Settings.HIDE_ADS, false).getBytes(StandardCharsets.UTF_8));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushThreadsPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            Map<String, ?> before = store();
            SettingsFileProvider.readFailure = new SecurityException("the document app revoked its read grant");
            shadowOf(activity).receiveResult(tap(activity, page, IMPORT_ROW).intent, Activity.RESULT_OK,
                    new Intent().setData(uri));
            settle();
            assertEquals(SettingsBackupPreference.refusal(SettingsBackup.Reason.UNREADABLE), ShadowToast.getTextOfLatestToast());
            assertNull("a file without permission produced a preview", ShadowAlertDialog.getLatestAlertDialog());
            assertNull(page.pendingImport);
            assertEquals(before, store());
            assertTrue(Settings.HIDE_ADS.savedValue());
            assertTrue(page.findPreference(IMPORT_ROW).isEnabled());
            assertTrue(page.findPreference(EXPORT_ROW).isEnabled());

            SettingsFileProvider.readFailure = null;
            shadowOf(activity).receiveResult(tap(activity, page, IMPORT_ROW).intent, Activity.RESULT_OK,
                    new Intent().setData(uri).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION));
            settle();
            shownPreview().cancel();
            settle();
            assertEquals("a cancelled retry changed a switch", before, store());
            assertNull(page.pendingImport);
        }
    }

    // ---- Helpers -------------------------------------------------------------------------------

    /** Taps a row and hands back the picker it opened. */
    private static ShadowActivity.IntentForResult tap(Activity activity, HushThreadsPreferenceFragment page, String row) {
        click(page.findPreference(row));
        ShadowActivity.IntentForResult started = shadowOf(activity).getNextStartedActivityForResult();
        assertNotNull(row + " opened no picker", started);
        return started;
    }

    /** Lists SettingsFilePicker the way the settings patch's manifest entry does on a phone. */
    static void listPicker(Context context) {
        android.content.pm.ActivityInfo info = new android.content.pm.ActivityInfo();
        info.packageName = context.getPackageName();
        info.name = SettingsFilePicker.class.getName();
        info.exported = false;
        shadowOf(context.getPackageManager()).addOrUpdateActivity(info);
    }

    /** Taps a row and starts the SettingsFilePicker it opened, which opens the picker. */
    private static ActivityController<SettingsFilePicker> pickThrough(Activity activity, HushThreadsPreferenceFragment page, String row) {
        click(page.findPreference(row));
        // Robolectric lists a plain start here too, with no request code.
        ShadowActivity.IntentForResult opened = shadowOf(activity).getNextStartedActivityForResult();
        assertNotNull(row + " opened nothing", opened);
        assertEquals(row + " asked for an answer from the page", -1, opened.requestCode);
        assertEquals(SettingsFilePicker.class.getName(), opened.intent.getComponent().getClassName());
        return Robolectric.buildActivity(SettingsFilePicker.class, opened.intent).create();
    }

    /** The files the next start of Threads would let go of. */
    private static Set<String> heldFiles(Context context) {
        return new HashSet<>(context.getSharedPreferences(SettingsFileGrants.LEDGER, Context.MODE_PRIVATE)
                .getStringSet(SettingsFileGrants.HELD, Collections.emptySet()));
    }

    private static void click(Preference row) {
        assertNotNull("no such row", row);
        row.getOnPreferenceClickListener().onPreferenceClick(row);
    }

    /** Exports through the picker to [uri], and waits for what that sets off. */
    private static void export(Activity activity, HushThreadsPreferenceFragment page, Uri uri) throws Exception {
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

    private static AlertDialog shownPreview() {
        AlertDialog preview = ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull("no preview", preview);
        assertTrue("the preview isn't showing", preview.isShowing());
        return preview;
    }

    private static SettingsDialog dialogOf(Activity activity) {
        SettingsDialog dialog = (SettingsDialog) activity.getFragmentManager().findFragmentByTag("hushthreads_settings");
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
