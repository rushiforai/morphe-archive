/*
 * Forked from:
 * https://github.com/SysAdminDoc/hushfeed/blob/bcc57ee555f4346c4eb1cbdae9f6ca8a3fa6fef4/extensions/tiktok/src/test/java/app/morphe/extension/tiktok/settings/SettingsBackupTest.java
 * Copyright 2026 Hushfeed contributors (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026: rewritten around the list of switches a file may
 * carry, the preview an import shows first, and the picker round trip through Hushfacebook's
 * settings dialog, the activity rebuilt behind the picker included.
 */
package app.morphe.extension.facebook.settings;

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
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.BooleanSupplier;

import app.morphe.extension.facebook.download.DownloadQuality;
import app.morphe.extension.facebook.download.FileNameTemplate;
import app.morphe.extension.facebook.download.SaveFolder;
import app.morphe.extension.facebook.download.SaveTo;
import app.morphe.extension.facebook.download.SendLink;
import app.morphe.extension.facebook.comments.CommentOrder;
import app.morphe.extension.facebook.feed.PostWords;
import app.morphe.extension.facebook.feed.PostWordsTest;
import app.morphe.extension.facebook.feed.WordsCorpus;
import app.morphe.extension.facebook.media.PlaybackQuality;
import app.morphe.extension.facebook.navigation.FeedsSubtab;
import app.morphe.extension.facebook.navigation.StartTab;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.WorkerPoolForTests;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.FailingStore;
import app.morphe.extension.shared.settings.HushfacebookPause;
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
            "hushfacebook_check_releases",
            "It puts the phone online, and the import preview gives only a count of the switches it "
                    + "changes, so a file someone shared could turn it on unseen. It's switched on from the "
                    + "phone's own screen.");

    /**
     * Settings in {@link Settings} that aren't switches and stay out of a settings file, by key,
     * each with the reason. A new one in neither this nor {@link SettingsBackup#VALUES} fails the
     * test below. Keys, not the settings: a Setting read before the context rule has run poisons
     * the registry for the rest of the sandbox.
     */
    private static final Map<String, String> VALUES_STAY_OUT = valuesStayOut();

    private static Map<String, String> valuesStayOut() {
        Map<String, String> out = new java.util.LinkedHashMap<>();
        out.put("hushfacebook_font_source",
                "it names the font file Use the system font draws in, whose copy only this install holds. A settings "
                        + "file can't carry the font itself, and the name alone would point at nothing on another phone.");
        return Collections.unmodifiableMap(out);
    }

    /** Hushfacebook's own state and its diagnostics. None of them is ever in a file. */
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
        Settings.SAVE_FOLDER.resetToDefault();
        Settings.DOWNLOAD_QUALITY.resetToDefault();
        Settings.FILENAME_TEMPLATE.resetToDefault();
        Settings.START_TAB.resetToDefault();
        Settings.FEEDS_SUBTAB.resetToDefault();
        Settings.COMMENT_ORDER.resetToDefault();
        Settings.PLAYBACK_QUALITY.resetToDefault();
        Settings.DOWNLOAD_ACTION.resetToDefault();
        Settings.SEND_TO_APP.resetToDefault();
        Settings.SAVE_TO.resetToDefault();
        Settings.HIDDEN_WORDS.resetToDefault();
        Settings.KEPT_WORDS.resetToDefault();
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
        // A file carries true or false, one folder name it checks as a folder name and one quality
        // it checks against the ones this build offers. Any other setting in Settings needs a
        // format that can carry it before it can be decided on.
        List<Setting<?>> notSwitches = new ArrayList<>();
        Set<String> declared = new TreeSet<>();
        for (Setting<?> setting : declaredSettings(Settings.class)) {
            declared.add(setting.key);
            if (!(setting instanceof BooleanSetting) && !VALUES_STAY_OUT.containsKey(setting.key)) notSwitches.add(setting);
        }
        assertEquals("a setting in Settings that isn't a switch has no format in a settings file: add it to "
                + "SettingsBackup.VALUES, or to VALUES_STAY_OUT here with the reason", SettingsBackup.VALUES, notSwitches);
        assertTrue("VALUES_STAY_OUT names a setting Settings no longer has", declared.containsAll(VALUES_STAY_OUT.keySet()));
        for (Setting<?> setting : SettingsBackup.VALUES) {
            assertFalse(setting.key + " is carried and kept out at once", VALUES_STAY_OUT.containsKey(setting.key));
        }
        assertEquals(Arrays.<Setting<?>>asList(Settings.HIDDEN_WORDS, Settings.KEPT_WORDS, Settings.SAVE_TO,
                Settings.SAVE_FOLDER, Settings.DOWNLOAD_QUALITY, Settings.FILENAME_TEMPLATE, Settings.DOWNLOAD_ACTION,
                Settings.SEND_TO_APP, Settings.START_TAB, Settings.FEEDS_SUBTAB, Settings.COMMENT_ORDER,
                Settings.PLAYBACK_QUALITY), SettingsBackup.VALUES);
        assertEquals(Settings.SAVE_TO, SettingsBackup.TO);
        assertEquals(Settings.HIDDEN_WORDS, SettingsBackup.HIDDEN);
        assertEquals(Settings.KEPT_WORDS, SettingsBackup.KEPT);
        assertEquals(Settings.SAVE_FOLDER, SettingsBackup.FOLDER);
        assertEquals(Settings.DOWNLOAD_QUALITY, SettingsBackup.QUALITY);
        assertEquals(Settings.FILENAME_TEMPLATE, SettingsBackup.FILE_NAME);
        assertEquals(Settings.START_TAB, SettingsBackup.START);
        assertEquals(Settings.FEEDS_SUBTAB, SettingsBackup.SUBTAB);
        assertEquals(Settings.COMMENT_ORDER, SettingsBackup.ORDER);
        assertEquals(Settings.PLAYBACK_QUALITY, SettingsBackup.PLAYBACK);
        assertEquals(Settings.DOWNLOAD_ACTION, SettingsBackup.ACTION);
        assertEquals(Settings.SEND_TO_APP, SettingsBackup.APP);
    }

    @Test
    public void nothingOfHushfacebooksOwnIsOnTheList() throws Exception {
        List<Setting<?>> own = declaredSettings(BaseSettings.class);
        assertTrue("the scan of BaseSettings found nothing", own.size() >= neverInAFile().size());
        for (Setting<?> setting : own) {
            assertFalse(setting.key + " is Hushfacebook's own and is on the list", SettingsBackup.ALLOWLIST.contains(setting));
        }
        for (Setting<?> setting : neverInAFile()) {
            assertFalse(setting.key + " is on the list", SettingsBackup.ALLOWLIST.contains(setting));
        }
    }

    /**
     * The font file Use the system font draws in stays out of a file both ways: an export doesn't
     * name it, and a file that does has it counted as something this build doesn't know.
     */
    @Test
    public void thePickedFontStaysOutOfAFile() throws Exception {
        Settings.FONT_SOURCE.save("Inter-Regular.ttf");
        try {
            String text = SettingsBackup.create();
            assertFalse(text, text.contains(Settings.FONT_SOURCE.key));
            assertFalse(text, text.contains("Inter-Regular.ttf"));

            JSONObject file = new JSONObject(text);
            file.getJSONObject("settings").put(Settings.FONT_SOURCE.key, "Other.ttf");
            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file.toString());
            assertEquals(1, snapshot.unknown);
            assertEquals(0, SettingsBackup.apply(snapshot));
            assertEquals("Inter-Regular.ttf", Settings.FONT_SOURCE.savedValue());
        } finally {
            Settings.FONT_SOURCE.resetToDefault();
        }
    }

    /**
     * A file is a format name, a version, one true or false per switch and the save folder's
     * name, whatever else the phone holds: not the pause, not debug logging or safe mode, not the
     * log, the diagnostic counts or anything that names the phone or the person.
     */
    @Test
    public void aFileIsItsFormatItsVersionAndOneValuePerSwitch() throws Exception {
        Settings.HIDE_PROMOTED_POSTS.save(false);
        Settings.DOWNLOAD_REELS.save(false);
        // Stored as it came, and written as the folder the saves really use.
        Settings.SAVE_FOLDER.save("../My/Clips");
        Settings.DOWNLOAD_QUALITY.save(DownloadQuality.P480);
        Settings.FILENAME_TEMPLATE.save("../{video_id}");
        Settings.START_TAB.save(StartTab.FRIENDS);
        Settings.COMMENT_ORDER.save(CommentOrder.ALL_COMMENTS);
        // Stored as typed, and written as the list the filter reads.
        Settings.HIDDEN_WORDS.save(" spoiler \nSPOILER\nleak");
        BaseSettings.PAUSED.save(true);
        BaseSettings.DEBUG.save(true);
        BaseSettings.DEBUG_LOG_FILTERS.save("downloads");
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        String cookie = "c_user=100012345678901; xs=secret-session";
        LogBufferManager.appendToLogBuffer("sentinel line " + cookie);
        HookStatus.invoked(FamilyNames.SPONSORED_POSTS);
        Context app = RuntimeEnvironment.getApplication();

        String text = SettingsBackup.create();
        JSONObject root = new JSONObject(text);
        assertEquals(new TreeSet<>(Arrays.asList("format", "schema", "settings")), names(root));
        assertEquals("hushfacebook-settings", root.get("format"));
        assertEquals(1, root.get("schema"));
        JSONObject switches = root.getJSONObject("settings");
        Set<String> carried = keys(SettingsBackup.ALLOWLIST);
        carried.addAll(keys(SettingsBackup.VALUES));
        assertEquals(carried, names(switches));
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) {
            // Saved, not what a paused Facebook is answered: paused, every switch answers false.
            assertFalse(setting.get());
            assertEquals(setting.key, setting.savedValue(), switches.get(setting.key));
        }
        assertEquals("My_Clips", switches.get(SettingsBackup.FOLDER.key));
        // Saved, not what a paused Facebook is answered: paused, the quality answers the best.
        assertEquals("480p", switches.get(SettingsBackup.QUALITY.key));
        assertEquals("{video_id}", switches.get(SettingsBackup.FILE_NAME.key));
        // Saved, not what a paused Facebook is answered: paused, it opens where it chooses.
        assertEquals("friends", switches.get(SettingsBackup.START.key));
        // Saved, not what a paused Facebook is answered: paused, comments open as Facebook picks.
        assertEquals("all_comments", switches.get(SettingsBackup.ORDER.key));
        // Saved, not what a paused Facebook is answered: paused, the lists read empty.
        assertEquals("spoiler\nleak", switches.get(SettingsBackup.HIDDEN.key));
        assertEquals("", switches.get(SettingsBackup.KEPT.key));
        for (Setting<?> setting : Setting.allLoadedSettings()) {
            if (SettingsBackup.ALLOWLIST.contains(setting) || SettingsBackup.VALUES.contains(setting)) continue;
            assertFalse(setting.key + " is in the file", text.contains(setting.key));
        }
        for (String leak : new String[]{"sentinel", "c_user", "100012345678901", "secret-session",
                app.getPackageName(), FamilyNames.SPONSORED_POSTS, "downloads"}) {
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

    @Test
    public void sparseAndLegacyImportsDoNotChangeAnOmittedWholeWordMode() throws Exception {
        for (boolean full : new boolean[]{false, true}) {
            for (boolean saved : new boolean[]{false, true}) {
                Settings.POST_WORDS_WHOLE_WORDS.save(saved);
                JSONObject file = new JSONObject(SettingsBackup.create());
                assertEquals(1, file.getInt("schema"));
                if (!full) {
                    file.put("settings", new JSONObject().put(Settings.HIDE_POSTS_WITH_WORDS.key,
                            !Settings.HIDE_POSTS_WITH_WORDS.savedValue()));
                }
                file.getJSONObject("settings").remove(Settings.POST_WORDS_WHOLE_WORDS.key);
                SettingsBackup.Snapshot incoming = SettingsBackup.parse(file.toString());
                assertFalse(incoming.values.containsKey(Settings.POST_WORDS_WHOLE_WORDS));
                SettingsBackup.apply(incoming);
                assertEquals(saved, Settings.POST_WORDS_WHOLE_WORDS.savedValue());
            }
        }
    }

    /** Saves other apps can open travel with the other download settings, both ways (issue #11). */
    @Test
    public void theCompatibleSavesSwitchGoesOutAndComesBack() throws Exception {
        assertFalse("the switch doesn't start off", Settings.DOWNLOAD_COMPATIBLE.savedValue());
        Settings.DOWNLOAD_COMPATIBLE.save(true);
        JSONObject exported = new JSONObject(SettingsBackup.create()).getJSONObject("settings");
        assertTrue(exported.toString(), exported.getBoolean(Settings.DOWNLOAD_COMPATIBLE.key));

        Settings.DOWNLOAD_COMPATIBLE.save(false);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(fileWith(Settings.DOWNLOAD_COMPATIBLE, true));
        assertEquals(0, snapshot.unknown);
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertTrue(Settings.DOWNLOAD_COMPATIBLE.savedValue());
    }

    // ---- Writing ---------------------------------------------------------------------------

    @Test
    public void anImportIsOneCommit() throws Exception {
        Settings.HIDE_SPONSORED_POSTS.save(false);
        String file = SettingsBackup.create();
        Settings.HIDE_SPONSORED_POSTS.save(true);
        Settings.OPEN_LINKS_EXTERNALLY.save(false);
        Settings.DOWNLOAD_STORIES.save(false);
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
        assertFalse(Settings.HIDE_SPONSORED_POSTS.savedValue());
        assertTrue(Settings.OPEN_LINKS_EXTERNALLY.savedValue());
        assertTrue(Settings.DOWNLOAD_STORIES.savedValue());

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
        String file = fileWith(Settings.HIDE_SPONSORED_POSTS, false, Settings.DOWNLOAD_REELS, false);
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
        assertTrue(Settings.HIDE_SPONSORED_POSTS.savedValue());
        assertTrue(Settings.DOWNLOAD_REELS.savedValue());
    }

    @Test
    public void aRollbackThatFailsTooSaysSomeSwitchesMayHaveChanged() throws Exception {
        String file = fileWith(Settings.HIDE_SPONSORED_POSTS, false);
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
        String file = fileWith(Settings.HIDE_SPONSORED_POSTS, false, Settings.DOWNLOAD_REELS, false);
        Map<String, ?> before = store();
        for (FailingStore.Fault fault : new FailingStore.Fault[]{FailingStore.Fault.EDIT_THROWS,
                FailingStore.Fault.STAGE_THROWS, FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.COMMIT_THROWS,
                FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING}) {
            SettingsBackup.ApplyFailed failure = failedApply(file, fault);
            assertTrue(fault + " said the switches may have changed", failure.rolledBack);
            assertEquals(fault + " left the store changed", before, store());
            assertTrue(fault + " left a live switch changed", Settings.HIDE_SPONSORED_POSTS.savedValue());
            assertTrue(fault + " left a live switch changed", Settings.DOWNLOAD_REELS.savedValue());
        }
    }

    /**
     * A rollback that doesn't land either says so, and the switches then hold what the store kept,
     * so the screen and the next start agree.
     */
    @Test
    public void aRollbackThatFailsSaysSoAndTheSwitchesHoldWhatTheStoreKept() throws Exception {
        String file = fileWith(Settings.HIDE_SPONSORED_POSTS, false, Settings.DOWNLOAD_REELS, false);
        FailingStore.Fault[][] scripts = {
                {FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.LOST},
                {FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING, FailingStore.Fault.COMMIT_THROWS},
                {FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.EDIT_THROWS},
                {FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING, FailingStore.Fault.STAGE_THROWS}};
        for (FailingStore.Fault[] script : scripts) {
            String name = Arrays.toString(script);
            SettingsBackup.ApplyFailed failure = failedApply(file, script);
            assertFalse(name + " said the switches are back", failure.rolledBack);
            assertEquals(name, false, store().get(Settings.HIDE_SPONSORED_POSTS.key));
            assertFalse(name + " runs a switch the store doesn't hold", Settings.HIDE_SPONSORED_POSTS.savedValue());
            assertFalse(name + " runs a switch the store doesn't hold", Settings.DOWNLOAD_REELS.savedValue());
            Settings.HIDE_SPONSORED_POSTS.resetToDefault();
            Settings.DOWNLOAD_REELS.resetToDefault();
        }
    }

    /** What a failed import says is what the screen shows and the store holds. */
    @Test
    public void aFailedImportSaysWhatTheStoreKeptAndTheScreenShowsIt() throws Exception {
        String file = fileWith(Settings.HIDE_SPONSORED_POSTS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            SwitchPreference row = (SwitchPreference) page.findPreference(Settings.HIDE_SPONSORED_POSTS.key);

            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS)) {
                shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                settle();
            }
            assertEquals("Couldn't import the settings. Nothing was changed.", ShadowToast.getTextOfLatestToast());
            assertTrue("the process runs a switch the file never managed to set", Settings.HIDE_SPONSORED_POSTS.savedValue());
            assertTrue(row.isChecked());
            assertFalse(store().containsKey(Settings.HIDE_SPONSORED_POSTS.key));

            ShadowToast.reset();
            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.LOST)) {
                shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                settle();
            }
            assertEquals("Couldn't import the settings, and couldn't put back the ones you had. "
                    + "Check the switches on this screen.", ShadowToast.getTextOfLatestToast());
            assertEquals(false, store().get(Settings.HIDE_SPONSORED_POSTS.key));
            assertFalse(Settings.HIDE_SPONSORED_POSTS.savedValue());
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
                "{\"format\":\"hushfacebook-settings\",\"schema\":1,\"settings\":{\"later\":1e9999999999}}",
                "{\"format\":\"hushfacebook-settings\",\"schema\":1e9999999999,\"settings\":{}}"}) {
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
        String key = Settings.HIDE_SPONSORED_POSTS.key;
        String twice = "{\"format\":\"hushfacebook-settings\",\"schema\":1,\"settings\":{\"" + key + "\":false,\""
                + key + "\":true}}";
        assertEquals(SettingsBackup.Reason.DUPLICATE, reasonFor(twice));
        assertEquals(SettingsBackup.Reason.DUPLICATE, reasonFor(
                "{\"format\":\"hushfacebook-settings\",\"format\":\"hushfacebook-settings\",\"schema\":1,\"settings\":{}}"));
        assertEquals("a name repeated inside a name this build doesn't know", SettingsBackup.Reason.DUPLICATE,
                reasonFor("{\"format\":\"hushfacebook-settings\",\"schema\":1,\"settings\":{\"later\":{\"a\":1,\"a\":2}}}"));
        // The same name in two different objects is two names.
        assertEquals(0, SettingsBackup.parse(
                "{\"format\":\"hushfacebook-settings\",\"schema\":1,\"settings\":{\"" + key + "\":false}}").unknown);
    }

    @Test
    public void aValueThatIsNotTrueOrFalseIsRefused() throws Exception {
        for (Object bad : new Object[]{"false", "true", 0, 1, JSONObject.NULL, new JSONObject(), new org.json.JSONArray(),
                1.5}) {
            JSONObject file = new JSONObject(SettingsBackup.create());
            file.getJSONObject("settings").put(Settings.DOWNLOAD_STORIES.key, bad);
            assertEquals(String.valueOf(bad), SettingsBackup.Reason.VALUE, reasonFor(file.toString()));
        }
    }

    @Test
    public void aFileFromANewerVersionIsRefused() throws Exception {
        JSONObject newer = new JSONObject(SettingsBackup.create()).put("schema", SettingsBackup.SCHEMA + 1);
        assertEquals(SettingsBackup.Reason.SCHEMA, reasonFor(newer.toString()));
        assertEquals(SettingsBackup.Reason.SCHEMA, reasonFor(new JSONObject(SettingsBackup.create()).put("schema", 99).toString()));
        // Anything else where the version goes was never written by Hushfacebook.
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
    public void aFileThatIsNotHushfacebooksIsRefused() throws Exception {
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
                .put(Settings.HIDE_SPONSORED_REELS.key, false)
                .put(BaseSettings.PAUSED.key, true)
                .put(BaseSettings.DEBUG.key, true)
                .put("hushfacebook_kept_by_a_later_version", "whatever that version keeps here");
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file.toString());
        assertEquals(4, snapshot.unknown);
        assertEquals(1, snapshot.changes().size());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertFalse(Settings.HIDE_SPONSORED_REELS.savedValue());
        assertFalse("a file paused Hushfacebook", BaseSettings.PAUSED.savedValue());
        assertFalse("a file turned on debug logging", BaseSettings.DEBUG.savedValue());
    }

    /**
     * The folder goes out as the name the saves use and comes back only as one: a value the
     * sanitizer would change, or that isn't text, refuses the whole file, so a file can't point
     * the saves at a path or hide them.
     */
    @Test
    public void theFolderRoundTripsAndComesBackOnlyAsOneCleanName() throws Exception {
        Settings.SAVE_FOLDER.save("Clips");
        String file = SettingsBackup.create();
        Settings.SAVE_FOLDER.resetToDefault();

        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals("Clips", snapshot.folder);
        assertEquals("Clips", snapshot.folderChange());
        assertEquals(0, snapshot.switchChanges());
        assertEquals(Collections.singletonMap(SettingsBackup.FOLDER, "Clips"), snapshot.changes());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertEquals("Clips", Settings.SAVE_FOLDER.savedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());
        assertEquals("the same folder again changes nothing", 0, SettingsBackup.parse(file).changes().size());

        Map<String, ?> before = store();
        for (Object refused : new Object[]{"../Clips", "My/Clips", "My\\Clips", ".hidden", "Clips.", " Clips", "",
                "a\u200Bb", "a\u202Eb", "a\nb", repeat('a', 51), 5, true, JSONObject.NULL, new JSONObject()}) {
            JSONObject hostile = new JSONObject(file);
            hostile.getJSONObject("settings").put(SettingsBackup.FOLDER.key, refused);
            try {
                SettingsBackup.parse(hostile.toString());
                fail("a file with the folder " + printable(String.valueOf(refused)) + " was read");
            } catch (SettingsBackup.Rejected rejected) {
                assertEquals(printable(String.valueOf(refused)), SettingsBackup.Reason.VALUE, rejected.reason);
            }
        }
        assertEquals("a refused file wrote something", before, store());
        assertEquals("Clips", Settings.SAVE_FOLDER.savedValue());

        // A file from before the folder was carried leaves it alone.
        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_SUGGESTED_POSTS, false));
        assertNull(older.folder);
        assertNull(older.folderChange());
        SettingsBackup.apply(older);
        assertEquals("Clips", Settings.SAVE_FOLDER.savedValue());
    }

    /**
     * The word filter's two lists go out and come back exactly as the settings row stores them. A
     * list the row would clean differently, or that isn't text, refuses the whole file, so a file
     * can't carry a longer or looser list than someone could type.
     */
    @Test
    public void theWordListsRoundTripAndComeBackOnlyAsCleanLists() throws Exception {
        Settings.HIDDEN_WORDS.save("spoiler\ngiveaway now");
        Settings.KEPT_WORDS.save("my team");
        String file = SettingsBackup.create();
        Settings.HIDDEN_WORDS.resetToDefault();
        Settings.KEPT_WORDS.resetToDefault();

        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals("spoiler\ngiveaway now", snapshot.hiddenChange());
        assertEquals("my team", snapshot.keptChange());
        assertEquals(0, snapshot.switchChanges());
        assertEquals(2, SettingsBackup.apply(snapshot));
        assertEquals("spoiler\ngiveaway now", Settings.HIDDEN_WORDS.savedValue());
        assertEquals("my team", Settings.KEPT_WORDS.savedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());
        assertEquals("the same lists again change nothing", 0, SettingsBackup.parse(file).changes().size());

        Map<String, ?> before = store();
        // One phrase past the most a list holds.
        StringBuilder long51 = new StringBuilder("w0");
        for (int i = 1; i <= PostWords.MAX_PHRASES; i++) long51.append("\nw").append(i);
        for (Object refused : new Object[]{" spoiler", "spoiler\n", "spoiler\nSPOILER", "a", repeat('a', 61),
                "spoiler\n\nleak", long51.toString(), 5, true, JSONObject.NULL, new JSONObject()}) {
            for (Setting<?> list : Arrays.<Setting<?>>asList(SettingsBackup.HIDDEN, SettingsBackup.KEPT)) {
                JSONObject hostile = new JSONObject(file);
                hostile.getJSONObject("settings").put(list.key, refused);
                try {
                    SettingsBackup.parse(hostile.toString());
                    fail("a file with the list " + printable(String.valueOf(refused)) + " was read");
                } catch (SettingsBackup.Rejected rejected) {
                    assertEquals(printable(String.valueOf(refused)), SettingsBackup.Reason.VALUE, rejected.reason);
                    assertFalse("the refusal quotes the list", rejected.getMessage().contains("spoiler"));
                }
            }
        }
        assertEquals("a refused file wrote something", before, store());

        // An empty list is a list: a file can clear one.
        JSONObject emptied = new JSONObject(file);
        emptied.getJSONObject("settings").put(SettingsBackup.KEPT.key, "");
        SettingsBackup.Snapshot clearing = SettingsBackup.parse(emptied.toString());
        assertEquals("", clearing.keptChange());
        assertNull(clearing.hiddenChange());
        SettingsBackup.apply(clearing);
        assertEquals("", Settings.KEPT_WORDS.savedValue());

        // A file from before the lists were carried leaves them alone.
        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_SUGGESTED_POSTS, false));
        assertNull(older.hidden);
        assertNull(older.hiddenChange());
        SettingsBackup.apply(older);
        assertEquals("spoiler\ngiveaway now", Settings.HIDDEN_WORDS.savedValue());

        // A waiting import keeps its lists across a rebuilt page only while they're clean.
        Bundle state = snapshot.toBundle();
        SettingsBackup.Snapshot back = SettingsBackup.Snapshot.fromBundle(state);
        assertEquals("spoiler\ngiveaway now", back.hidden);
        assertEquals("my team", back.kept);
        state.putString("hidden_words", "spoiler\nSPOILER");
        assertNull(SettingsBackup.Snapshot.fromBundle(state).hidden);
    }

    /**
     * #58: lists that fill the room the two share to the byte, written with emoji, a CJK
     * character, an escaped slash and plain letters, go out and come back whole, both at once, with
     * every other value a file carries at its longest, in a file inside the size limit.
     */
    @Test
    public void wordListsFillingTheirRoomRoundTripWithEverythingElseAtItsLongest() throws Exception {
        String hidden = roomFilling(PostWords.MAX_LIST_BYTES / 2);
        String kept = PostWordsTest.asciiOfBytes(PostWords.MAX_LIST_BYTES - PostWords.encodedBytes(hidden));
        assertEquals(PostWords.MAX_LIST_BYTES, PostWords.encodedBytes(hidden) + PostWords.encodedBytes(kept));
        assertTrue(PostWords.fits(hidden, kept));
        assertFalse(PostWords.fits(hidden, kept + "x"));
        Settings.HIDDEN_WORDS.save(hidden);
        Settings.KEPT_WORDS.save(kept);
        // Every other value at the longest a file takes back: a folder and a file name kept from
        // a run of four-byte characters longer than either row keeps, and an app name of the
        // parser's longest string.
        String folder = SaveFolder.sanitize(emoji(80));
        assertEquals("a folder keeps fifty", emoji(50), folder);
        Settings.SAVE_FOLDER.save(folder);
        String fileName = FileNameTemplate.sanitize(emoji(80));
        assertEquals(fileName, FileNameTemplate.sanitize(fileName));
        assertEquals("a file name keeps fifty, its date token included", 50,
                fileName.codePointCount(0, fileName.length()));
        Settings.FILENAME_TEMPLATE.save(fileName);
        String app = "a." + repeat('b', 1024 - 2);
        assertTrue(SendLink.isFileApp(app));
        Settings.SEND_TO_APP.save(app);
        String file = SettingsBackup.create();
        int size = file.getBytes(StandardCharsets.UTF_8).length;
        assertTrue("a file of " + size + " bytes", size <= SettingsBackup.MAX_BYTES);
        assertTrue("MAX_BYTES says 63 KB at most: " + size, size <= 63 * 1024);
        Settings.HIDDEN_WORDS.resetToDefault();
        Settings.KEPT_WORDS.resetToDefault();

        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals(hidden, snapshot.hiddenChange());
        assertEquals(kept, snapshot.keptChange());
        assertEquals(2, SettingsBackup.apply(snapshot));
        assertEquals(hidden, Settings.HIDDEN_WORDS.savedValue());
        assertEquals(kept, Settings.KEPT_WORDS.savedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());
    }

    /** #58: a thousand short phrases in each list go out and come back whole. */
    @Test
    public void aThousandShortPhrasesInEachListRoundTrip() throws Exception {
        String hidden = WordsCorpus.hide();
        String kept = WordsCorpus.keep();
        Settings.HIDDEN_WORDS.save(hidden);
        Settings.KEPT_WORDS.save(kept);
        String file = SettingsBackup.create();
        assertTrue(file.getBytes(StandardCharsets.UTF_8).length <= SettingsBackup.MAX_BYTES);
        Settings.HIDDEN_WORDS.resetToDefault();
        Settings.KEPT_WORDS.resetToDefault();
        assertEquals(2, SettingsBackup.apply(SettingsBackup.parse(file)));
        assertEquals(1000, PostWords.count(Settings.HIDDEN_WORDS.savedValue()));
        assertEquals(hidden, Settings.HIDDEN_WORDS.savedValue());
        assertEquals(kept, Settings.KEPT_WORDS.savedValue());
    }

    /**
     * #58: lists past the room they share are refused whole, and nothing changes: two in one file,
     * or one beside the list the file leaves as it is on the phone. Within the room, both come in.
     */
    @Test
    public void wordListsPastTheirRoomAreRefusedAndChangeNothing() throws Exception {
        String half = PostWordsTest.asciiOfBytes(PostWords.MAX_LIST_BYTES / 2);
        String more = PostWordsTest.asciiOfBytes(PostWords.MAX_LIST_BYTES / 2 + 1);
        JSONObject both = new JSONObject(SettingsBackup.create());
        both.getJSONObject("settings").put(SettingsBackup.HIDDEN.key, half).put(SettingsBackup.KEPT.key, more);
        assertEquals(SettingsBackup.Reason.WORDS, reasonFor(both.toString()));

        Settings.KEPT_WORDS.save(more);
        Map<String, ?> before = store();
        JSONObject one = new JSONObject(SettingsBackup.create());
        one.getJSONObject("settings").put(SettingsBackup.HIDDEN.key, half).remove(SettingsBackup.KEPT.key);
        assertEquals("beside the phone's list", SettingsBackup.Reason.WORDS, reasonFor(one.toString()));
        assertEquals(before, store());

        Settings.KEPT_WORDS.save(half);
        assertEquals(half, SettingsBackup.parse(one.toString()).hiddenChange());
        both.getJSONObject("settings").put(SettingsBackup.KEPT.key, half);
        assertEquals(half, SettingsBackup.parse(both.toString()).hiddenChange());
    }

    /** Lists of 1,024 and 1,025 chars, the most a file's string could be before, both come back. */
    @Test
    public void listsEitherSideOfTheOldStringLimitComeBack() throws Exception {
        for (int length : new int[]{1024, 1025}) {
            String list = asciiList(length);
            assertEquals(length, list.length());
            assertTrue(PostWords.isClean(list));
            Settings.HIDDEN_WORDS.save(list);
            String file = SettingsBackup.create();
            Settings.HIDDEN_WORDS.resetToDefault();
            SettingsBackup.apply(SettingsBackup.parse(file));
            assertEquals(length + " chars", list, Settings.HIDDEN_WORDS.savedValue());
        }
    }

    /**
     * A string past the longest list, as a list, an unknown value or a name, or one that never
     * ends, is refused before anything is read into a setting, and every setting stays as it was.
     */
    @Test
    public void aStringPastTheLongestListIsRefusedAndChangesNothing() throws Exception {
        assertEquals(PostWords.MAX_STORED_CHARS, SettingsBackup.MAX_STRING_CHARS);
        Settings.HIDDEN_WORDS.save("spoiler");
        Settings.KEPT_WORDS.save("my team");
        Settings.SAVE_FOLDER.save("Clips");
        Settings.HIDE_SUGGESTED_POSTS.save(!Settings.HIDE_SUGGESTED_POSTS.defaultValue);
        String file = SettingsBackup.create();
        Map<String, ?> before = store();
        String past = repeat('x', SettingsBackup.MAX_STRING_CHARS + 1);

        JSONObject asList = new JSONObject(file);
        asList.getJSONObject("settings").put(SettingsBackup.HIDDEN.key, past);
        JSONObject asUnknown = new JSONObject(file);
        asUnknown.getJSONObject("settings").put("later", past);
        JSONObject asName = new JSONObject(file);
        asName.getJSONObject("settings").put(past, true);
        String endless = file.substring(0, file.lastIndexOf('}')) + ",\"later\":\"" + repeat('x', SettingsBackup.MAX_STRING_CHARS + 1);
        for (String refused : new String[]{asList.toString(), asUnknown.toString(), asName.toString(), endless}) {
            assertTrue(refused.getBytes(StandardCharsets.UTF_8).length <= SettingsBackup.MAX_BYTES);
            assertEquals(SettingsBackup.Reason.DAMAGED, reasonFor(refused));
        }
        String oversized = file.substring(0, file.lastIndexOf('}')) + ",\"later\":\"" + repeat('x', SettingsBackup.MAX_BYTES);
        assertEquals(SettingsBackup.Reason.SIZE, reasonFor(oversized));
        assertEquals(SettingsBackup.Reason.SIZE, readReason(new ByteArrayInputStream(oversized.getBytes(StandardCharsets.UTF_8))));

        // The longest list beside the kept one still comes in.
        String longest = PostWordsTest.asciiOfBytes(PostWords.MAX_LIST_BYTES - PostWords.encodedBytes("my team"));
        JSONObject withLongest = new JSONObject(file);
        withLongest.getJSONObject("settings").put(SettingsBackup.HIDDEN.key, longest);
        assertEquals(longest, SettingsBackup.parse(withLongest.toString()).hiddenChange());
        assertEquals("a refused file wrote something", before, store());
    }

    /** [count] grinning faces, four bytes each in UTF-8. */
    private static String emoji(int count) {
        StringBuilder run = new StringBuilder();
        for (int i = 0; i < count; i++) run.appendCodePoint(0x1F600);
        return run.toString();
    }

    /**
     * A clean list taking exactly [bytes] in a file: phrases of a CJK character, a slash and emoji
     * to sixty characters, each its own emoji, then plain letters for the rest.
     */
    private static String roomFilling(int bytes) {
        List<String> phrases = new ArrayList<>();
        int used = 0;
        for (int phrase = 0; ; phrase++) {
            StringBuilder next = new StringBuilder("猫/");
            while (next.codePointCount(0, next.length()) < PostWords.MAX_LENGTH) next.appendCodePoint(0x1F600 + phrase);
            int cost = PostWords.encodedBytes(next.toString()) + (phrases.isEmpty() ? 0 : 2);
            // Leave the letters a line break and a phrase of eight at least.
            if (used + cost > bytes - 2 - 8) break;
            phrases.add(next.toString());
            used += cost;
        }
        String letters = PostWordsTest.asciiOfBytes(bytes - used - 2);
        String list = String.join("\n", phrases) + "\n" + letters;
        assertTrue(PostWords.isClean(list));
        assertEquals(bytes, PostWords.encodedBytes(list));
        return list;
    }

    /** A clean list of plain letters exactly [length] chars long. */
    private static String asciiList(int length) {
        StringBuilder list = new StringBuilder();
        for (int phrase = 0; list.length() < length; phrase++) {
            if (phrase > 0) list.append('\n');
            String start = String.format(Locale.ROOT, "p%02d", phrase);
            int room = Math.min(PostWords.MAX_LENGTH, length - list.length());
            list.append(start).append(repeat('x', room - start.length()));
        }
        return list.toString();
    }

    /** The preview and the toast say how many phrases each list will hold, never which. */
    @Test
    public void importOfTheWordListsSaysHowManyPhrasesEachHolds() {
        assertEquals("Settings imported. Your list of words to hide will hold 2 words or phrases. Your list of words "
                        + "that keep a post will be empty.",
                SettingsBackupPreference.importedMessage(0, null, null, null, null, null, "spoiler\nleak", ""));
        assertEquals("Settings imported. 1 switch changed. Your list of words to hide will be empty. Your list of "
                        + "words that keep a post will hold 1 word or phrase.",
                SettingsBackupPreference.importedMessage(1, null, null, null, null, null, "", "my team"));
        String withFolder = SettingsBackupPreference.importedMessage(0, "Clips", null, null, null, null, "spoiler", null);
        assertFalse(withFolder, withFolder.contains("spoiler"));
        assertTrue(withFolder, withFolder.contains("1 word or phrase"));
    }

    /**
     * A file a phone on a newer Android wrote can name a folder with a character this one doesn't
     * know yet. The folder comes in as the name the saves here will use, and the switches in the
     * same file come in with it, where before the whole file was refused.
     */
    @Test
    public void aFolderFromANewerAndroidComesInAsTheNameSavesUseHere() throws Exception {
        int newer = 0x50000;
        assertEquals("the stand-in for a newer character has to be unknown here",
                Character.UNASSIGNED, Character.getType(newer));
        String unknown = new String(Character.toChars(newer));
        Settings.SAVE_FOLDER.save("Old");
        boolean flipped = !Settings.HIDE_SUGGESTED_POSTS.savedValue();
        JSONObject file = new JSONObject(fileWith(Settings.HIDE_SUGGESTED_POSTS, flipped));
        file.getJSONObject("settings").put(SettingsBackup.FOLDER.key, "Clips " + unknown);

        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file.toString());
        assertEquals("Clips", snapshot.folder);
        assertEquals("Clips", snapshot.folderChange());
        assertEquals(1, snapshot.switchChanges());
        assertEquals(2, SettingsBackup.apply(snapshot));
        assertEquals("Clips", Settings.SAVE_FOLDER.savedValue());
        assertEquals(flipped, Settings.HIDE_SUGGESTED_POSTS.savedValue());

        file.getJSONObject("settings").put(SettingsBackup.FOLDER.key, unknown);
        assertEquals("a name of nothing this phone knows is the default folder",
                app.morphe.extension.facebook.download.SaveFolder.DEFAULT, SettingsBackup.parse(file.toString()).folder);
        for (String refused : new String[]{"../" + unknown, "My/" + unknown, "." + unknown}) {
            file.getJSONObject("settings").put(SettingsBackup.FOLDER.key, refused);
            try {
                SettingsBackup.parse(file.toString());
                fail("a file with the folder " + printable(refused) + " was read");
            } catch (SettingsBackup.Rejected rejected) {
                assertEquals(printable(refused), SettingsBackup.Reason.VALUE, rejected.reason);
            }
        }
    }

    /**
     * The quality goes out as its file value and comes back only as one this build offers: any
     * other value, or one that isn't text, refuses the whole file.
     */
    @Test
    public void theQualityRoundTripsAndComesBackOnlyAsOneThisBuildOffers() throws Exception {
        for (DownloadQuality quality
                : DownloadQuality.values()) {
            Settings.DOWNLOAD_QUALITY.save(quality);
            String file = SettingsBackup.create();
            assertEquals(quality.fileValue, new JSONObject(file).getJSONObject("settings").get(SettingsBackup.QUALITY.key));
            Settings.DOWNLOAD_QUALITY.save(quality == DownloadQuality.P720
                    ? DownloadQuality.SMALLEST
                    : DownloadQuality.P720);

            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
            assertEquals(quality, snapshot.quality);
            assertEquals(quality, snapshot.qualityChange());
            assertEquals(0, snapshot.switchChanges());
            assertEquals(Collections.singletonMap(SettingsBackup.QUALITY, quality), snapshot.changes());
            assertEquals(1, SettingsBackup.apply(snapshot));
            assertEquals(quality, Settings.DOWNLOAD_QUALITY.savedValue());
            assertEquals("a file read back is the file", file, SettingsBackup.create());
            assertEquals("the same quality again changes nothing", 0, SettingsBackup.parse(file).changes().size());
        }

        Settings.DOWNLOAD_QUALITY.save(DownloadQuality.P480);
        String file = SettingsBackup.create();
        Map<String, ?> before = store();
        for (Object refused : new Object[]{"BEST", "P480", "Best", "720", "720P", "1440p", " 480p", "", 480, true,
                JSONObject.NULL, new JSONObject(), new org.json.JSONArray()}) {
            JSONObject hostile = new JSONObject(file);
            hostile.getJSONObject("settings").put(SettingsBackup.QUALITY.key, refused);
            try {
                SettingsBackup.parse(hostile.toString());
                fail("a file with the quality " + printable(String.valueOf(refused)) + " was read");
            } catch (SettingsBackup.Rejected rejected) {
                assertEquals(printable(String.valueOf(refused)), SettingsBackup.Reason.VALUE, rejected.reason);
            }
        }
        assertEquals("a refused file wrote something", before, store());

        // A file from before the quality was carried leaves it alone.
        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_SUGGESTED_POSTS, false));
        assertNull(older.quality);
        assertNull(older.qualityChange());
        SettingsBackup.apply(older);
        assertEquals(DownloadQuality.P480, Settings.DOWNLOAD_QUALITY.savedValue());
    }

    /**
     * The file name goes out as the template the saves use and comes back only as one: a value the
     * sanitizer would change, or that isn't text, refuses the whole file, so a file can't name a
     * path, a photo's name, an extension or one name for every video. A character this phone
     * doesn't know yet counts as an ordinary one.
     */
    @Test
    public void theFileNameRoundTripsAndComesBackOnlyAsOneCleanName() throws Exception {
        Settings.FILENAME_TEMPLATE.save("Reel {video_id}");
        String file = SettingsBackup.create();
        Settings.FILENAME_TEMPLATE.resetToDefault();

        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals("Reel {video_id}", snapshot.fileName);
        assertEquals("Reel {video_id}", snapshot.fileNameChange());
        assertEquals(Collections.singletonMap(SettingsBackup.FILE_NAME, "Reel {video_id}"), snapshot.changes());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertEquals("Reel {video_id}", Settings.FILENAME_TEMPLATE.savedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());
        assertEquals("the same name again changes nothing", 0, SettingsBackup.parse(file).changes().size());

        // Stored past the row as a name with no token, it goes out as the one the saves use.
        Settings.FILENAME_TEMPLATE.save("Clip.mp4");
        assertEquals("Clip_{date}", new JSONObject(SettingsBackup.create()).getJSONObject("settings")
                .get(SettingsBackup.FILE_NAME.key));
        Settings.FILENAME_TEMPLATE.save("Reel {video_id}");

        Map<String, ?> before = store();
        for (Object refused : new Object[]{"../{date}", "My/{date}", "a\\b", ".{date}", "{date}.", " {date}", "",
                "a\u200Bb", "a\nb", repeat('a', 51), "Clip", "{date}.mp4", "FB_IMG_{date}", ".nomedia",
                5, true, JSONObject.NULL, new JSONObject()}) {
            JSONObject hostile = new JSONObject(file);
            hostile.getJSONObject("settings").put(SettingsBackup.FILE_NAME.key, refused);
            try {
                SettingsBackup.parse(hostile.toString());
                fail("a file with the name " + printable(String.valueOf(refused)) + " was read");
            } catch (SettingsBackup.Rejected rejected) {
                assertEquals(printable(String.valueOf(refused)), SettingsBackup.Reason.VALUE, rejected.reason);
            }
        }
        assertEquals("a refused file wrote something", before, store());

        String unknown = new String(Character.toChars(0x50000));
        JSONObject newer = new JSONObject(file);
        newer.getJSONObject("settings").put(SettingsBackup.FILE_NAME.key, "Clip " + unknown + " {date}");
        assertEquals("Clip {date}", SettingsBackup.parse(newer.toString()).fileName);

        // A file from before the name was carried leaves it alone.
        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_SUGGESTED_POSTS, false));
        assertNull(older.fileName);
        assertNull(older.fileNameChange());
        SettingsBackup.apply(older);
        assertEquals("Reel {video_id}", Settings.FILENAME_TEMPLATE.savedValue());

        // A preview kept across a rebuild keeps its name, and only a clean one comes back.
        Bundle state = SettingsBackup.parse(file).toBundle();
        assertEquals("Reel {video_id}", SettingsBackup.Snapshot.fromBundle(state).fileName);
        state.putString("file_name", "../{date}");
        assertNull(SettingsBackup.Snapshot.fromBundle(state).fileName);
        state.putInt("file_name", 5);
        assertNull(SettingsBackup.Snapshot.fromBundle(state).fileName);
    }

    /** A file that renames saved videos says so, before and after, beside what else it changes. */
    @Test
    public void importOfAFileNameSaysWhatVideosWillBeNamed() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.DOWNLOAD_REELS, false));
        file.getJSONObject("settings").put(SettingsBackup.FILE_NAME.key, "{date}_{video_id}")
                .put(SettingsBackup.QUALITY.key, "720p");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file.toString());
            AlertDialog preview = shownPreview();
            String quality = "Videos will save at " + app.morphe.extension.shared.L10n.isolate("720p")
                    + " or the closest quality below it. A video with nothing that low will save at the closest "
                    + "quality above.";
            String name = "Saved videos will be named " + app.morphe.extension.shared.L10n.isolate("{date}_{video_id}") + ".";
            assertEquals("1 switch will change.\n\n" + quality + "\n\n" + name,
                    String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 1 switch changed. " + quality + " " + name, ShadowToast.getTextOfLatestToast());
            assertEquals("{date}_{video_id}", Settings.FILENAME_TEMPLATE.savedValue());
            assertEquals("the name row still shows the old name",
                    HushfacebookPreferenceFragment.fileNameSummary("{date}_{video_id}"),
                    String.valueOf(page.findPreference(Settings.FILENAME_TEMPLATE.key).getSummary()));
        }
        assertEquals("Settings imported. " + "Saved videos will be named "
                        + app.morphe.extension.shared.L10n.isolate("Clip") + ".",
                SettingsBackupPreference.importedMessage(0, null, null, "Clip"));
    }

    /** A preview kept across a rebuild keeps its quality, and only one this build offers comes back. */
    @Test
    public void aWaitingImportKeepsItsQualityOnlyWhileItIsOne() throws Exception {
        Settings.DOWNLOAD_QUALITY.save(DownloadQuality.SMALLEST);
        Bundle state = SettingsBackup.parse(SettingsBackup.create()).toBundle();
        assertEquals(DownloadQuality.SMALLEST,
                SettingsBackup.Snapshot.fromBundle(state).quality);

        state.putString("quality", "SMALLEST");
        assertNull(SettingsBackup.Snapshot.fromBundle(state).quality);
        state.putInt("quality", 360);
        assertNull(SettingsBackup.Snapshot.fromBundle(state).quality);
    }

    /**
     * The tab Facebook opens on goes out as its file value and comes back only as one this build
     * offers: any other value, or one that isn't text, refuses the whole file.
     */
    @Test
    public void theStartTabRoundTripsAndComesBackOnlyAsOneThisBuildOffers() throws Exception {
        for (StartTab tab : StartTab.values()) {
            Settings.START_TAB.save(tab);
            String file = SettingsBackup.create();
            assertEquals(tab.fileValue, new JSONObject(file).getJSONObject("settings").get(SettingsBackup.START.key));
            Settings.START_TAB.save(tab == StartTab.HOME ? StartTab.MENU : StartTab.HOME);

            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
            assertEquals(tab, snapshot.start);
            assertEquals(tab, snapshot.startChange());
            assertEquals(0, snapshot.switchChanges());
            assertEquals(Collections.singletonMap(SettingsBackup.START, tab), snapshot.changes());
            assertEquals(1, SettingsBackup.apply(snapshot));
            assertEquals(tab, Settings.START_TAB.savedValue());
            assertEquals("a file read back is the file", file, SettingsBackup.create());
            assertEquals("the same tab again changes nothing", 0, SettingsBackup.parse(file).changes().size());
        }

        Settings.START_TAB.save(StartTab.FRIENDS);
        String file = SettingsBackup.create();
        Map<String, ?> before = store();
        for (Object refused : new Object[]{"FRIENDS", "Friends", "friend", " friends", "", 772219799489960L, true,
                JSONObject.NULL, new JSONObject(), new org.json.JSONArray()}) {
            JSONObject hostile = new JSONObject(file);
            hostile.getJSONObject("settings").put(SettingsBackup.START.key, refused);
            try {
                SettingsBackup.parse(hostile.toString());
                fail("a file with the start tab " + printable(String.valueOf(refused)) + " was read");
            } catch (SettingsBackup.Rejected rejected) {
                assertEquals(printable(String.valueOf(refused)), SettingsBackup.Reason.VALUE, rejected.reason);
            }
        }
        assertEquals("a refused file wrote something", before, store());

        // A file from before the tab was carried leaves it alone.
        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_SUGGESTED_POSTS, false));
        assertNull(older.start);
        assertNull(older.startChange());
        SettingsBackup.apply(older);
        assertEquals(StartTab.FRIENDS, Settings.START_TAB.savedValue());

        // A preview kept across a rebuild keeps its tab, and only one this build offers comes back.
        Bundle state = SettingsBackup.parse(file).toBundle();
        assertEquals(StartTab.FRIENDS, SettingsBackup.Snapshot.fromBundle(state).start);
        state.putString("start_tab", "FRIENDS");
        assertNull(SettingsBackup.Snapshot.fromBundle(state).start);
        state.putInt("start_tab", 3);
        assertNull(SettingsBackup.Snapshot.fromBundle(state).start);
    }

    /**
     * The Feeds filter goes out as its file value and comes back only as one this build offers,
     * like the start tab, and the preview and the toast each say what it does (#56).
     */
    @Test
    public void theFeedsFilterRoundTripsAndComesBackOnlyAsOneThisBuildOffers() throws Exception {
        for (FeedsSubtab subtab : FeedsSubtab.values()) {
            Settings.FEEDS_SUBTAB.save(subtab);
            String file = SettingsBackup.create();
            assertEquals(subtab.fileValue, new JSONObject(file).getJSONObject("settings").get(SettingsBackup.SUBTAB.key));
            Settings.FEEDS_SUBTAB.save(subtab == FeedsSubtab.ALL ? FeedsSubtab.PAGES : FeedsSubtab.ALL);

            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
            assertEquals(subtab, snapshot.subtab);
            assertEquals(subtab, snapshot.subtabChange());
            assertEquals(Collections.singletonMap(SettingsBackup.SUBTAB, subtab), snapshot.changes());
            assertEquals(1, SettingsBackup.apply(snapshot));
            assertEquals(subtab, Settings.FEEDS_SUBTAB.savedValue());
            assertEquals("a file read back is the file", file, SettingsBackup.create());
            assertEquals("the same filter again changes nothing", 0, SettingsBackup.parse(file).changes().size());
        }

        Settings.FEEDS_SUBTAB.save(FeedsSubtab.GROUPS);
        String file = SettingsBackup.create();
        Map<String, ?> before = store();
        for (Object refused : new Object[]{"GROUPS", "Groups", "group", "most_recent_group", "", 3, true,
                JSONObject.NULL, new JSONObject(), new org.json.JSONArray()}) {
            JSONObject hostile = new JSONObject(file);
            hostile.getJSONObject("settings").put(SettingsBackup.SUBTAB.key, refused);
            try {
                SettingsBackup.parse(hostile.toString());
                fail("a file with the Feeds filter " + printable(String.valueOf(refused)) + " was read");
            } catch (SettingsBackup.Rejected rejected) {
                assertEquals(printable(String.valueOf(refused)), SettingsBackup.Reason.VALUE, rejected.reason);
            }
        }
        assertEquals("a refused file wrote something", before, store());

        // A file from before the filter was carried leaves it alone.
        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_SUGGESTED_POSTS, false));
        assertNull(older.subtab);
        assertNull(older.subtabChange());
        SettingsBackup.apply(older);
        assertEquals(FeedsSubtab.GROUPS, Settings.FEEDS_SUBTAB.savedValue());

        // A preview kept across a rebuild keeps its filter, and only one this build offers comes back.
        Bundle state = SettingsBackup.parse(file).toBundle();
        assertEquals(FeedsSubtab.GROUPS, SettingsBackup.Snapshot.fromBundle(state).subtab);
        state.putString("feeds_subtab", "GROUPS");
        assertNull(SettingsBackup.Snapshot.fromBundle(state).subtab);

        // What the preview and the toast say it does.
        assertEquals(Collections.singletonList(L10n.f("The Feeds tab will open on %1$s.", L10n.t("Groups"))),
                SettingsBackupPreference.valueSentences(null, null, null, null, null, null, null, null, null, null,
                        null, FeedsSubtab.GROUPS));
        assertEquals("Settings imported. " + L10n.t("The Feeds tab will open on the filter Facebook picks."),
                SettingsBackupPreference.importedMessage(0, null, null, null, null, null, null, null, null, null,
                        null, null, FeedsSubtab.ALL));
        assertEquals("the folder alone keeps its own sentence",
                SettingsBackupPreference.importedMessage(0, "Hush", null, null, null),
                SettingsBackupPreference.importedMessage(0, "Hush", null, null, null, null, null, null, null, null,
                        null, null, null));
    }

    /**
     * The order comments open in goes out as its file value and comes back only as one this build
     * offers: any other value, or one that isn't text, refuses the whole file.
     */
    @Test
    public void theCommentOrderRoundTripsAndComesBackOnlyAsOneThisBuildOffers() throws Exception {
        for (CommentOrder order : CommentOrder.values()) {
            Settings.COMMENT_ORDER.save(order);
            String file = SettingsBackup.create();
            assertEquals(order.fileValue, new JSONObject(file).getJSONObject("settings").get(SettingsBackup.ORDER.key));
            Settings.COMMENT_ORDER.save(order == CommentOrder.NEWEST ? CommentOrder.FACEBOOK : CommentOrder.NEWEST);

            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
            assertEquals(order, snapshot.order);
            assertEquals(order, snapshot.orderChange());
            assertEquals(0, snapshot.switchChanges());
            assertEquals(Collections.singletonMap(SettingsBackup.ORDER, order), snapshot.changes());
            assertEquals(1, SettingsBackup.apply(snapshot));
            assertEquals(order, Settings.COMMENT_ORDER.savedValue());
            assertEquals("a file read back is the file", file, SettingsBackup.create());
            assertEquals("the same order again changes nothing", 0, SettingsBackup.parse(file).changes().size());
        }

        Settings.COMMENT_ORDER.save(CommentOrder.ALL_COMMENTS);
        String file = SettingsBackup.create();
        Map<String, ?> before = store();
        for (Object refused : new Object[]{"ALL_COMMENTS", "All comments", "all", " all_comments", "",
                "RANKED_UNFILTERED_CHRONOLOGICAL_REPLIES_INTENT_V1", 3, true, JSONObject.NULL, new JSONObject(),
                new org.json.JSONArray()}) {
            JSONObject hostile = new JSONObject(file);
            hostile.getJSONObject("settings").put(SettingsBackup.ORDER.key, refused);
            try {
                SettingsBackup.parse(hostile.toString());
                fail("a file with the comment order " + printable(String.valueOf(refused)) + " was read");
            } catch (SettingsBackup.Rejected rejected) {
                assertEquals(printable(String.valueOf(refused)), SettingsBackup.Reason.VALUE, rejected.reason);
            }
        }
        assertEquals("a refused file wrote something", before, store());

        // A file from before the order was carried leaves it alone.
        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_SUGGESTED_POSTS, false));
        assertNull(older.order);
        assertNull(older.orderChange());
        SettingsBackup.apply(older);
        assertEquals(CommentOrder.ALL_COMMENTS, Settings.COMMENT_ORDER.savedValue());

        // A preview kept across a rebuild keeps its order, and only one this build offers comes back.
        Bundle state = SettingsBackup.parse(file).toBundle();
        assertEquals(CommentOrder.ALL_COMMENTS, SettingsBackup.Snapshot.fromBundle(state).order);
        state.putString("comment_order", "ALL_COMMENTS");
        assertNull(SettingsBackup.Snapshot.fromBundle(state).order);
        state.putInt("comment_order", 3);
        assertNull(SettingsBackup.Snapshot.fromBundle(state).order);
    }

    /** A file that changes the comment order says how comments will open, before and after. */
    @Test
    public void importOfACommentOrderSaysHowCommentsWillOpen() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.DOWNLOAD_REELS, false));
        file.getJSONObject("settings").put(SettingsBackup.ORDER.key, "newest")
                .put(SettingsBackup.START.key, "notifications");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file.toString());
            AlertDialog preview = shownPreview();
            String start = "Facebook will open on Notifications.";
            String order = "Comments will open with Newest picked in their sort menu.";
            assertEquals("1 switch will change.\n\n" + start + "\n\n" + order,
                    String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 1 switch changed. " + start + " " + order,
                    ShadowToast.getTextOfLatestToast());
            assertEquals(CommentOrder.NEWEST, Settings.COMMENT_ORDER.savedValue());
            assertEquals("the comment order row still shows the old order",
                    HushfacebookPreferenceFragment.commentOrderSummary(CommentOrder.NEWEST),
                    String.valueOf(page.findPreference(Settings.COMMENT_ORDER.key).getSummary()));
        }
        assertEquals("Settings imported. Comments will open in the order Facebook picks.",
                SettingsBackupPreference.importedMessage(0, null, null, null, null, CommentOrder.FACEBOOK));
    }

    /**
     * The quality videos play at goes out as its file value and comes back only as one this build
     * offers: any other value, or one that isn't text, refuses the whole file.
     */
    @Test
    public void thePlaybackQualityRoundTripsAndComesBackOnlyAsOneThisBuildOffers() throws Exception {
        for (PlaybackQuality quality : PlaybackQuality.values()) {
            Settings.PLAYBACK_QUALITY.save(quality);
            String file = SettingsBackup.create();
            assertEquals(quality.fileValue, new JSONObject(file).getJSONObject("settings").get(SettingsBackup.PLAYBACK.key));
            Settings.PLAYBACK_QUALITY.save(quality == PlaybackQuality.P720 ? PlaybackQuality.AUTO : PlaybackQuality.P720);

            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
            assertEquals(quality, snapshot.playback);
            assertEquals(quality, snapshot.playbackChange());
            assertEquals(0, snapshot.switchChanges());
            assertEquals(Collections.singletonMap(SettingsBackup.PLAYBACK, quality), snapshot.changes());
            assertEquals(1, SettingsBackup.apply(snapshot));
            assertEquals(quality, Settings.PLAYBACK_QUALITY.savedValue());
            assertEquals("a file read back is the file", file, SettingsBackup.create());
            assertEquals("the same quality again changes nothing", 0, SettingsBackup.parse(file).changes().size());
        }

        Settings.PLAYBACK_QUALITY.save(PlaybackQuality.DATA_SAVER);
        String file = SettingsBackup.create();
        Map<String, ?> before = store();
        for (Object refused : new Object[]{"DATA_SAVER", "Data saver", "480", " 720p", "", "1080p", 720, true,
                JSONObject.NULL, new JSONObject(), new org.json.JSONArray()}) {
            JSONObject hostile = new JSONObject(file);
            hostile.getJSONObject("settings").put(SettingsBackup.PLAYBACK.key, refused);
            try {
                SettingsBackup.parse(hostile.toString());
                fail("a file with the playback quality " + printable(String.valueOf(refused)) + " was read");
            } catch (SettingsBackup.Rejected rejected) {
                assertEquals(printable(String.valueOf(refused)), SettingsBackup.Reason.VALUE, rejected.reason);
            }
        }
        assertEquals("a refused file wrote something", before, store());

        // A file from before the quality was carried leaves it alone.
        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_SUGGESTED_POSTS, false));
        assertNull(older.playback);
        assertNull(older.playbackChange());
        SettingsBackup.apply(older);
        assertEquals(PlaybackQuality.DATA_SAVER, Settings.PLAYBACK_QUALITY.savedValue());

        // A preview kept across a rebuild keeps its quality, and only one this build offers comes back.
        Bundle state = SettingsBackup.parse(file).toBundle();
        assertEquals(PlaybackQuality.DATA_SAVER, SettingsBackup.Snapshot.fromBundle(state).playback);
        state.putString("playback_quality", "DATA_SAVER");
        assertNull(SettingsBackup.Snapshot.fromBundle(state).playback);
        state.putInt("playback_quality", 3);
        assertNull(SettingsBackup.Snapshot.fromBundle(state).playback);
    }

    /** A file that changes the playback quality says what videos will play at, before and after. */
    @Test
    public void importOfAPlaybackQualitySaysWhatVideosWillPlayAt() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.DOWNLOAD_REELS, false));
        file.getJSONObject("settings").put(SettingsBackup.PLAYBACK.key, "720p")
                .put(SettingsBackup.ORDER.key, "newest");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file.toString());
            AlertDialog preview = shownPreview();
            String order = "Comments will open with Newest picked in their sort menu.";
            String quality = "Playback quality will be set to Up to " + L10n.isolate("720p") + ".";
            assertEquals("1 switch will change.\n\n" + order + "\n\n" + quality,
                    String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 1 switch changed. " + order + " " + quality,
                    ShadowToast.getTextOfLatestToast());
            assertEquals(PlaybackQuality.P720, Settings.PLAYBACK_QUALITY.savedValue());
            assertEquals("the playback quality row still shows the old quality",
                    HushfacebookPreferenceFragment.playbackQualitySummary(PlaybackQuality.P720),
                    String.valueOf(page.findPreference(Settings.PLAYBACK_QUALITY.key).getSummary()));
        }
        assertEquals("Settings imported. Facebook will pick the quality videos play at.",
                SettingsBackupPreference.importedMessage(0, null, null, null, null, null, null, null, PlaybackQuality.AUTO));
    }

    /**
     * A file exported with Send the link to an app and a package set puts both back on a clean
     * install (#41).
     */
    @Test
    public void theDownloadActionAndTheSendToAppComeBackOnACleanInstall() throws Exception {
        Settings.DOWNLOAD_ACTION.save(SendLink.Action.SEND);
        Settings.SEND_TO_APP.save(SendLink.YTDLNIS);
        String file = SettingsBackup.create();
        JSONObject written = new JSONObject(file).getJSONObject("settings");
        assertEquals("send", written.get(SettingsBackup.ACTION.key));
        assertEquals(SendLink.YTDLNIS, written.get(SettingsBackup.APP.key));

        Settings.DOWNLOAD_ACTION.resetToDefault();
        Settings.SEND_TO_APP.resetToDefault();
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals(SendLink.Action.SEND, snapshot.actionChange());
        assertEquals(SendLink.YTDLNIS, snapshot.appChange());
        Map<Setting<?>, Object> expected = new LinkedHashMap<>();
        expected.put(SettingsBackup.ACTION, SendLink.Action.SEND);
        expected.put(SettingsBackup.APP, SendLink.YTDLNIS);
        assertEquals(expected, snapshot.changes());
        assertEquals(2, SettingsBackup.apply(snapshot));
        assertEquals(SendLink.Action.SEND, Settings.DOWNLOAD_ACTION.savedValue());
        assertEquals(SendLink.YTDLNIS, Settings.SEND_TO_APP.savedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());
        assertEquals("the same file again changes nothing", 0, SettingsBackup.parse(file).changes().size());
    }

    /**
     * The download action goes out as its file value and the app as the package links really go
     * to, blank for Android's chooser, and each comes back only as one of those: any other action,
     * or an app that isn't blank or one package name as it stands, refuses the whole file.
     */
    @Test
    public void theDownloadActionAndTheAppComeBackOnlyAsOnesTheRowsTake() throws Exception {
        for (SendLink.Action action : SendLink.Action.values()) {
            Settings.DOWNLOAD_ACTION.save(action);
            String file = SettingsBackup.create();
            assertEquals(action.fileValue, new JSONObject(file).getJSONObject("settings").get(SettingsBackup.ACTION.key));
            Settings.DOWNLOAD_ACTION.save(action == SendLink.Action.SEND ? SendLink.Action.SAVE : SendLink.Action.SEND);

            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
            assertEquals(action, snapshot.action);
            assertEquals(Collections.singletonMap(SettingsBackup.ACTION, action), snapshot.changes());
            assertEquals(1, SettingsBackup.apply(snapshot));
            assertEquals(action, Settings.DOWNLOAD_ACTION.savedValue());
            assertEquals("a file read back is the file", file, SettingsBackup.create());
        }
        for (String app : new String[]{"", SendLink.SEAL, "a.b"}) {
            Settings.SEND_TO_APP.save(app);
            String file = SettingsBackup.create();
            assertEquals(app, new JSONObject(file).getJSONObject("settings").get(SettingsBackup.APP.key));
            Settings.SEND_TO_APP.save(app.isEmpty() ? SendLink.YTDLNIS : "");

            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
            assertEquals(app, snapshot.app);
            assertEquals(Collections.singletonMap(SettingsBackup.APP, app), snapshot.changes());
            assertEquals(1, SettingsBackup.apply(snapshot));
            assertEquals(app, Settings.SEND_TO_APP.savedValue());
            assertEquals("a file read back is the file", file, SettingsBackup.create());
        }

        // A saved name with spaces round it, or one that isn't a package name, goes out as where
        // links really go, and that's no change here.
        Settings.SEND_TO_APP.save(" " + SendLink.SEAL + "  ");
        String trimmed = SettingsBackup.create();
        assertEquals(SendLink.SEAL, new JSONObject(trimmed).getJSONObject("settings").get(SettingsBackup.APP.key));
        assertNull(SettingsBackup.parse(trimmed).appChange());
        Settings.SEND_TO_APP.save("not a package");
        String blank = SettingsBackup.create();
        assertEquals("", new JSONObject(blank).getJSONObject("settings").get(SettingsBackup.APP.key));
        assertNull(SettingsBackup.parse(blank).appChange());

        Settings.DOWNLOAD_ACTION.save(SendLink.Action.SEND);
        Settings.SEND_TO_APP.save(SendLink.YTDLNIS);
        String file = SettingsBackup.create();
        Map<String, ?> before = store();
        for (Object refused : new Object[]{"SEND", "Send", "share", "", " send", 1, true, JSONObject.NULL,
                new JSONObject(), new org.json.JSONArray()}) {
            JSONObject hostile = new JSONObject(file);
            hostile.getJSONObject("settings").put(SettingsBackup.ACTION.key, refused);
            try {
                SettingsBackup.parse(hostile.toString());
                fail("a file with the download action " + printable(String.valueOf(refused)) + " was read");
            } catch (SettingsBackup.Rejected rejected) {
                assertEquals(printable(String.valueOf(refused)), SettingsBackup.Reason.VALUE, rejected.reason);
            }
        }
        for (Object refused : new Object[]{"ytdl", " " + SendLink.YTDLNIS, SendLink.YTDLNIS + " ", "com..ytdl",
                "com.ytdl.", "1com.ytdl", "com.1ytdl", "com.ytdl/Main", "com.ytdl;x", "com.yt\u00e9dl", " ", "\n", 7,
                false, JSONObject.NULL, new JSONObject(), new org.json.JSONArray()}) {
            JSONObject hostile = new JSONObject(file);
            hostile.getJSONObject("settings").put(SettingsBackup.APP.key, refused);
            try {
                SettingsBackup.parse(hostile.toString());
                fail("a file with the app " + printable(String.valueOf(refused)) + " was read");
            } catch (SettingsBackup.Rejected rejected) {
                assertEquals(printable(String.valueOf(refused)), SettingsBackup.Reason.VALUE, rejected.reason);
                assertEquals("a refusal names the setting, never what the file holds",
                        "Not one package name: " + SettingsBackup.APP.key, rejected.getMessage());
            }
        }
        assertEquals("a refused file wrote something", before, store());

        // A file from before these were carried leaves them alone.
        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_SUGGESTED_POSTS, false));
        assertNull(older.action);
        assertNull(older.app);
        assertNull(older.actionChange());
        assertNull(older.appChange());
        SettingsBackup.apply(older);
        assertEquals(SendLink.Action.SEND, Settings.DOWNLOAD_ACTION.savedValue());
        assertEquals(SendLink.YTDLNIS, Settings.SEND_TO_APP.savedValue());

        // A preview kept across a rebuild keeps both, and only what a file could hold comes back.
        Bundle state = SettingsBackup.parse(file).toBundle();
        SettingsBackup.Snapshot kept = SettingsBackup.Snapshot.fromBundle(state);
        assertEquals(SendLink.Action.SEND, kept.action);
        assertEquals(SendLink.YTDLNIS, kept.app);
        state.putString("download_action", "SEND");
        state.putString("send_to_app", "not a package");
        kept = SettingsBackup.Snapshot.fromBundle(state);
        assertNull(kept.action);
        assertNull(kept.app);
        state.putInt("download_action", 1);
        state.putInt("send_to_app", 1);
        kept = SettingsBackup.Snapshot.fromBundle(state);
        assertNull(kept.action);
        assertNull(kept.app);
    }

    /** A file that changes the download action and the app says what Download will do, before and after. */
    @Test
    public void importOfTheDownloadActionAndAppSaysWhereLinksWillGo() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.DOWNLOAD_REELS, false));
        file.getJSONObject("settings").put(SettingsBackup.ACTION.key, "send")
                .put(SettingsBackup.APP.key, SendLink.YTDLNIS);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file.toString());
            AlertDialog preview = shownPreview();
            String action = "Tapping Download on a reel or video will send its link to an app.";
            String app = "Links will go to " + L10n.isolate(SendLink.YTDLNIS) + ".";
            assertEquals("1 switch will change.\n\n" + action + "\n\n" + app,
                    String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 1 switch changed. " + action + " " + app,
                    ShadowToast.getTextOfLatestToast());
            assertEquals(SendLink.Action.SEND, Settings.DOWNLOAD_ACTION.savedValue());
            assertEquals(SendLink.YTDLNIS, Settings.SEND_TO_APP.savedValue());
            assertEquals("the download action row still shows the old action",
                    HushfacebookPreferenceFragment.downloadActionSummary(SendLink.Action.SEND),
                    String.valueOf(page.findPreference(Settings.DOWNLOAD_ACTION.key).getSummary()));
            assertEquals("the send-to row still shows the old app",
                    HushfacebookPreferenceFragment.sendAppSummary(SendLink.YTDLNIS),
                    String.valueOf(page.findPreference(Settings.SEND_TO_APP.key).getSummary()));
        }
        assertEquals("Settings imported. Reels and videos will save to this phone when you tap Download. "
                        + "Android will ask which app gets the links each time.",
                SettingsBackupPreference.importedMessage(0, null, null, null, null, null, null, null, null,
                        SendLink.Action.SAVE, ""));
    }

    /** A file exported with Save to set to Download puts it back on a clean install (#42). */
    @Test
    public void theTopFolderComesBackOnACleanInstall() throws Exception {
        Settings.SAVE_TO.save(SaveTo.DOWNLOAD);
        String file = SettingsBackup.create();
        assertEquals("download", new JSONObject(file).getJSONObject("settings").get(SettingsBackup.TO.key));

        Settings.SAVE_TO.resetToDefault();
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals(SaveTo.DOWNLOAD, snapshot.toChange());
        assertEquals(Collections.singletonMap(SettingsBackup.TO, SaveTo.DOWNLOAD), snapshot.changes());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertEquals(SaveTo.DOWNLOAD, Settings.SAVE_TO.savedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());
        assertEquals("the same file again changes nothing", 0, SettingsBackup.parse(file).changes().size());
    }

    /**
     * Each top folder goes out as its file value and comes back only as one of those. Anything else
     * refuses the whole file, a file from before it was carried leaves it alone, and a preview kept
     * across a rebuild keeps only a value a file could hold.
     */
    @Test
    public void theTopFolderComesBackOnlyAsOneTheRowOffers() throws Exception {
        for (SaveTo to : SaveTo.values()) {
            Settings.SAVE_TO.save(to);
            String file = SettingsBackup.create();
            assertEquals(to.fileValue, new JSONObject(file).getJSONObject("settings").get(SettingsBackup.TO.key));
            Settings.SAVE_TO.save(to == SaveTo.DCIM ? SaveTo.DOWNLOAD : SaveTo.DCIM);

            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
            assertEquals(to, snapshot.to);
            assertEquals(Collections.singletonMap(SettingsBackup.TO, to), snapshot.changes());
            assertEquals(1, SettingsBackup.apply(snapshot));
            assertEquals(to, Settings.SAVE_TO.savedValue());
            assertEquals("a file read back is the file", file, SettingsBackup.create());
        }
        assertEquals(Arrays.asList("movies_pictures", "dcim", "download"), Arrays.asList(
                SaveTo.MOVIES_AND_PICTURES.fileValue, SaveTo.DCIM.fileValue, SaveTo.DOWNLOAD.fileValue));

        Settings.SAVE_TO.save(SaveTo.DCIM);
        String file = SettingsBackup.create();
        Map<String, ?> before = store();
        for (Object refused : new Object[]{"DCIM", "Download", "downloads", "movies", "pictures", "MOVIES_AND_PICTURES",
                "", " dcim", "dcim ", "sdcard", 1, true, JSONObject.NULL, new JSONObject(), new org.json.JSONArray()}) {
            JSONObject hostile = new JSONObject(file);
            hostile.getJSONObject("settings").put(SettingsBackup.TO.key, refused);
            try {
                SettingsBackup.parse(hostile.toString());
                fail("a file with the top folder " + printable(String.valueOf(refused)) + " was read");
            } catch (SettingsBackup.Rejected rejected) {
                assertEquals(printable(String.valueOf(refused)), SettingsBackup.Reason.VALUE, rejected.reason);
                assertEquals("a refusal names the setting, never what the file holds",
                        "Not a save location: " + SettingsBackup.TO.key, rejected.getMessage());
            }
        }
        assertEquals("a refused file wrote something", before, store());

        // A file from before the top folder was carried leaves it alone.
        SettingsBackup.Snapshot older = SettingsBackup.parse(fileWith(Settings.HIDE_SUGGESTED_POSTS, false));
        assertNull(older.to);
        assertNull(older.toChange());
        SettingsBackup.apply(older);
        assertEquals(SaveTo.DCIM, Settings.SAVE_TO.savedValue());

        Bundle state = SettingsBackup.parse(file).toBundle();
        assertEquals(SaveTo.DCIM, SettingsBackup.Snapshot.fromBundle(state).to);
        state.putString("save_to", "DCIM");
        assertNull(SettingsBackup.Snapshot.fromBundle(state).to);
        state.putInt("save_to", 1);
        assertNull(SettingsBackup.Snapshot.fromBundle(state).to);
    }

    /** A file that changes the top folder says where saves will go, in the preview and the toast. */
    @Test
    public void importOfTheTopFolderSaysWhereSavesWillGo() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.DOWNLOAD_REELS, false));
        file.getJSONObject("settings").put(SettingsBackup.TO.key, "download");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file.toString());
            AlertDialog preview = shownPreview();
            String to = "Videos and photos will go to " + L10n.isolate("Download") + ".";
            assertEquals("1 switch will change.\n\n" + to, String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 1 switch changed. " + to, ShadowToast.getTextOfLatestToast());
            assertEquals(SaveTo.DOWNLOAD, Settings.SAVE_TO.savedValue());
            assertEquals("the Save to row still shows the old top folder",
                    HushfacebookPreferenceFragment.saveToSummary(SaveTo.DOWNLOAD),
                    String.valueOf(page.findPreference(Settings.SAVE_TO.key).getSummary()));
            assertEquals("the folder row still names the old top folder",
                    HushfacebookPreferenceFragment.folderSummary(
                            app.morphe.extension.facebook.download.SaveFolder.DEFAULT, SaveTo.DOWNLOAD),
                    String.valueOf(page.findPreference(Settings.SAVE_FOLDER.key).getSummary()));
        }
        assertEquals("Settings imported. Videos will go to " + L10n.isolate("Movies") + " and photos to "
                        + L10n.isolate("Pictures") + ".",
                SettingsBackupPreference.importedMessage(0, null, null, null, null, null, null, null, null, null, null,
                        SaveTo.MOVIES_AND_PICTURES));
    }

    /** A file that changes the start tab says where Facebook will open, before and after. */
    @Test
    public void importOfAStartTabSaysWhereFacebookWillOpen() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.DOWNLOAD_REELS, false));
        file.getJSONObject("settings").put(SettingsBackup.START.key, "notifications")
                .put(SettingsBackup.QUALITY.key, "720p");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file.toString());
            AlertDialog preview = shownPreview();
            String start = "Facebook will open on Notifications.";
            String quality = "Videos will save at " + app.morphe.extension.shared.L10n.isolate("720p")
                    + " or the closest quality below it. A video with nothing that low will save at the closest "
                    + "quality above.";
            assertEquals("1 switch will change.\n\n" + start + "\n\n" + quality,
                    String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 1 switch changed. " + start + " " + quality,
                    ShadowToast.getTextOfLatestToast());
            assertEquals(StartTab.NOTIFICATIONS, Settings.START_TAB.savedValue());
            assertEquals("the start tab row still shows the old tab",
                    HushfacebookPreferenceFragment.startTabSummary(StartTab.NOTIFICATIONS),
                    String.valueOf(page.findPreference(Settings.START_TAB.key).getSummary()));
        }
        assertEquals("Settings imported. Facebook will open on Home.",
                SettingsBackupPreference.importedMessage(0, null, null, null, StartTab.HOME));
    }

    /** A preview kept across a rebuild keeps its folder, and only a clean one comes back. */
    @Test
    public void aWaitingImportKeepsItsFolderOnlyWhileItIsClean() throws Exception {
        Settings.SAVE_FOLDER.save("Clips");
        SettingsBackup.Snapshot read = SettingsBackup.parse(SettingsBackup.create());
        Bundle state = read.toBundle();
        assertEquals("Clips", SettingsBackup.Snapshot.fromBundle(state).folder);

        state.putString("folder", "../Clips");
        assertNull(SettingsBackup.Snapshot.fromBundle(state).folder);
        state.putInt("folder", 5);
        assertNull(SettingsBackup.Snapshot.fromBundle(state).folder);
    }

    @Test
    public void aFileThatNamesSomeSwitchesLeavesTheRestAlone() throws Exception {
        Settings.OPEN_LINKS_EXTERNALLY.save(false);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(fileWith(Settings.HIDE_SUGGESTED_POSTS, false));
        assertEquals(1, snapshot.values.size());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertFalse(Settings.HIDE_SUGGESTED_POSTS.savedValue());
        assertFalse("a switch the file didn't name was reset", Settings.OPEN_LINKS_EXTERNALLY.savedValue());
        assertTrue(Settings.HIDE_SPONSORED_POSTS.savedValue());
    }

    @Test
    public void aWaitingImportSurvivesAsABundle() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.HIDE_PROMOTED_POSTS, false, Settings.DOWNLOAD_REELS, true));
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
        switches.putString(Settings.HIDE_SPONSORED_POSTS.key, "false");
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
        Settings.HIDE_PROMOTED_POSTS.save(false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            ShadowActivity.IntentForResult started = tap(activity, page, EXPORT_ROW);
            assertEquals(Intent.ACTION_CREATE_DOCUMENT, started.intent.getAction());
            assertEquals(SettingsBackupPreference.EXPORT, started.requestCode);
            assertEquals("application/json", started.intent.getType());
            assertTrue(started.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            String name = started.intent.getStringExtra(Intent.EXTRA_TITLE);
            assertTrue("the picker would suggest " + name, name.matches("hushfacebook-settings-\\d{8}-\\d{6}\\.json"));

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
        Settings.HIDE_SUGGESTED_POSTS.save(false);
        Settings.OPEN_LINKS_EXTERNALLY.save(false);
        Map<BooleanSetting, Boolean> exported = new LinkedHashMap<>();
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) exported.put(setting, setting.savedValue());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
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
        JSONObject file = new JSONObject(fileWith(Settings.HIDE_SPONSORED_POSTS, false,
                Settings.HIDE_SPONSORED_STORIES, false, Settings.DOWNLOAD_STORIES, true));
        file.getJSONObject("settings").put("later_switch", true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
                    + "Hushfacebook knows, so it'll be left out.", String.valueOf(shadowOf(preview).getMessage()));
            assertEquals("the preview wrote something", before, store());
            assertEquals("Import", String.valueOf(preview.getButton(AlertDialog.BUTTON_POSITIVE).getText()));
            assertEquals("Cancel", String.valueOf(preview.getButton(AlertDialog.BUTTON_NEGATIVE).getText()));

            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 2 switches changed.", ShadowToast.getTextOfLatestToast());
            assertFalse(Settings.HIDE_SPONSORED_POSTS.savedValue());
            assertFalse(Settings.HIDE_SPONSORED_STORIES.savedValue());
            assertTrue(Settings.DOWNLOAD_STORIES.savedValue());
            assertFalse("the page still shows the switch on",
                    ((SwitchPreference) page.findPreference(Settings.HIDE_SPONSORED_POSTS.key)).isChecked());
            assertNull(page.pendingImport);
            assertFalse(AbstractPreferenceFragment.settingImportInProgress);
        }
    }

    /** A file that moves only the folder says where saves will go, before and after. */
    @Test
    public void importOfAFolderAloneSaysWhereSavesWillGo() throws Exception {
        JSONObject file = new JSONObject(SettingsBackup.create());
        file.getJSONObject("settings").put(SettingsBackup.FOLDER.key, "Clips");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file.toString());
            AlertDialog preview = shownPreview();
            assertEquals("Saves will go to a folder named " + app.morphe.extension.shared.L10n.isolate("Clips") + ".",
                    String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. Saves will go to a folder named "
                    + app.morphe.extension.shared.L10n.isolate("Clips") + ".", ShadowToast.getTextOfLatestToast());
            assertEquals("Clips", Settings.SAVE_FOLDER.savedValue());
            assertEquals("the folder row still shows the old folder",
                    HushfacebookPreferenceFragment.folderSummary("Clips"),
                    String.valueOf(page.findPreference(Settings.SAVE_FOLDER.key).getSummary()));
        }
    }

    /** A file that moves switches and the folder counts the switches and names the folder. */
    @Test
    public void importOfSwitchesAndAFolderSaysBoth() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.DOWNLOAD_REELS, false));
        file.getJSONObject("settings").put(SettingsBackup.FOLDER.key, "Clips");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file.toString());
            AlertDialog preview = shownPreview();
            String folder = "Saves will go to a folder named " + app.morphe.extension.shared.L10n.isolate("Clips") + ".";
            assertEquals("1 switch will change.\n\n" + folder, String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 1 switch changed. " + folder, ShadowToast.getTextOfLatestToast());
            assertFalse(Settings.DOWNLOAD_REELS.savedValue());
            assertEquals("Clips", Settings.SAVE_FOLDER.savedValue());
        }
    }

    /**
     * A file that moves the quality says what videos will save at, before and after, beside the
     * switches and the folder it changes, and the row shows the new quality.
     */
    @Test
    public void importOfAQualitySaysWhatVideosWillSaveAt() throws Exception {
        JSONObject file = new JSONObject(SettingsBackup.create());
        file.getJSONObject("settings").put(SettingsBackup.QUALITY.key, "480p");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file.toString());
            AlertDialog preview = shownPreview();
            String quality = "Videos will save at " + app.morphe.extension.shared.L10n.isolate("480p")
                    + " or the closest quality below it. A video with nothing that low will save at the closest "
                    + "quality above.";
            assertEquals(quality, String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. " + quality, ShadowToast.getTextOfLatestToast());
            assertEquals(DownloadQuality.P480, Settings.DOWNLOAD_QUALITY.savedValue());
            assertEquals("the quality row still shows the old quality",
                    HushfacebookPreferenceFragment.qualitySummary(DownloadQuality.P480),
                    String.valueOf(page.findPreference(Settings.DOWNLOAD_QUALITY.key).getSummary()));
        }

        file = new JSONObject(fileWith(Settings.DOWNLOAD_REELS, false));
        file.getJSONObject("settings").put(SettingsBackup.QUALITY.key, "smallest")
                .put(SettingsBackup.FOLDER.key, "Clips");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file.toString());
            AlertDialog preview = shownPreview();
            String quality = "Videos will save at their lowest quality, for the smallest files.";
            String folder = "Saves will go to a folder named " + app.morphe.extension.shared.L10n.isolate("Clips") + ".";
            assertEquals("1 switch will change.\n\n" + quality + "\n\n" + folder,
                    String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 1 switch changed. " + quality + " " + folder,
                    ShadowToast.getTextOfLatestToast());
            assertEquals(DownloadQuality.SMALLEST,
                    Settings.DOWNLOAD_QUALITY.savedValue());
            assertEquals("Clips", Settings.SAVE_FOLDER.savedValue());
            assertFalse(Settings.DOWNLOAD_REELS.savedValue());
        }
        // Back to the best: that has a sentence of its own, and a quality with a folder drops the
        // folder's own toast for the sentences.
        assertEquals("Videos will save at the best quality.",
                SettingsBackupPreference.qualitySentence(DownloadQuality.BEST));
        assertEquals("Settings imported. Videos will save at the best quality. Saves will go to a folder named "
                        + app.morphe.extension.shared.L10n.isolate("Clips") + ".",
                SettingsBackupPreference.importedMessage(0, "Clips",
                        DownloadQuality.BEST, null));
    }

    @Test
    public void aFileThatChangesNothingSaysSoAndOffersNoImport() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
        String file = fileWith(Settings.OPEN_LINKS_EXTERNALLY, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            assertTrue(Settings.OPEN_LINKS_EXTERNALLY.savedValue());
            assertNull("a cancelled import said something", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test
    public void aCancelledPickerChangesNothingAndSaysNothing() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
     * The picker is an activity of its own, and Android may rebuild Facebook's behind it, the
     * settings dialog and its page with it. The answer still reaches the rebuilt page: Android
     * finds it by the name the framework gave the page that asked, which the rebuilt one keeps.
     */
    @Test
    public void thePickersAnswerReachesThePageRebuiltBehindIt() throws Exception {
        String file = fileWith(Settings.DOWNLOAD_REELS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment asked = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            ShadowActivity.IntentForResult started = tap(controller.get(), asked, IMPORT_ROW);

            controller.recreate();
            ShadowLooper.idleMainLooper();
            Activity rebuilt = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(dialogOf(rebuilt));
            assertNotSame("the page wasn't rebuilt", asked, page);

            deliver(rebuilt, started, file);
            AlertDialog preview = shownPreview();
            assertEquals("1 switch will change.", String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.DOWNLOAD_REELS.savedValue());
            assertEquals("Settings imported. 1 switch changed.", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test
    public void anExportAnswerReachesThePageRebuiltBehindIt() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment asked = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
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
        String file = fileWith(Settings.HIDE_SUGGESTED_POSTS, false, Settings.HIDE_PROMOTED_POSTS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
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
            assertTrue("the rebuild answered the preview", Settings.HIDE_SUGGESTED_POSTS.savedValue());

            again.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.HIDE_SUGGESTED_POSTS.savedValue());
            assertFalse(Settings.HIDE_PROMOTED_POSTS.savedValue());
            assertNull(SettingsL10nTest.pageOf(dialogOf(controller.get())).pendingImport);
        }
    }

    /**
     * Malformed, oversized, duplicate-name, wrong-type, newer-version and word-lists-past-their-room
     * files each say why and change nothing: no preview, no write, the switches as they were.
     */
    @Test
    public void aRefusedFileSaysWhyAndChangesNothing() throws Exception {
        String good = SettingsBackup.create();
        String key = Settings.HIDE_SPONSORED_POSTS.key;
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
        JSONObject pastTheRoom = new JSONObject(good);
        pastTheRoom.getJSONObject("settings")
                .put(SettingsBackup.HIDDEN.key, PostWordsTest.asciiOfBytes(PostWords.MAX_LIST_BYTES / 2))
                .put(SettingsBackup.KEPT.key, PostWordsTest.asciiOfBytes(PostWords.MAX_LIST_BYTES / 2 + 1));
        files.put(pastTheRoom.toString(), SettingsBackup.Reason.WORDS);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            assertTrue(Settings.HIDE_SPONSORED_POSTS.savedValue());
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
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
                assertEquals("a row that isn't acting changed its summary", exportSummary, String.valueOf(export.getSummary()));

                click(export);
                assertNull("a tap during a read opened a picker", shadowOf(activity).getNextStartedActivityForResult());
            } finally {
                release.countDown();
            }
            settle();
            assertTrue(export.isEnabled());
            assertTrue(importRow.isEnabled());
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
    public void aFullWorkerQueueLeavesTheRowsUsable() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            byte[] bytes = fileWith(Settings.HIDE_SPONSORED_POSTS, false).getBytes(StandardCharsets.UTF_8);
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
            deliver(activity, tap(activity, page, IMPORT_ROW), fileWith(Settings.HIDE_SPONSORED_POSTS, false));
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.HIDE_SPONSORED_POSTS.savedValue());
        }
    }

    /**
     * An import that fails after it has claimed the rows, before a worker has it, gives them back
     * and changes nothing. That path has no wait to run out, so nothing else would: the rows would
     * stay out of reach until Facebook restarts. Here the folder the toast names can't be read once
     * Import is pressed, so the toast's text can't be built.
     */
    @Test
    public void anImportThatFailsBeforeItsWorkerStartsGivesTheRowsBack() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.HIDE_SPONSORED_POSTS, false));
        file.getJSONObject("settings").put(SettingsBackup.FOLDER.key, "Clips");
        Field value = Setting.class.getDeclaredField("value");
        value.setAccessible(true);
        Object folder = value.get(Settings.SAVE_FOLDER);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), file.toString());
            AlertDialog preview = shownPreview();
            RuntimeException escaped = null;
            // Not a folder name, so no sentence can be worded around it.
            value.set(Settings.SAVE_FOLDER, 7);
            try {
                preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                settle();
            } catch (RuntimeException failure) {
                escaped = failure;
            } finally {
                value.set(Settings.SAVE_FOLDER, folder);
            }
            assertTrue("the rows stayed out of reach", page.findPreference(IMPORT_ROW).isEnabled());
            assertTrue(page.findPreference(EXPORT_ROW).isEnabled());
            assertFalse(AbstractPreferenceFragment.settingImportInProgress);
            assertNull("the failure reached Facebook", escaped);
            assertEquals("Couldn't start that. Try again in a moment.", ShadowToast.getTextOfLatestToast());
            assertTrue("a switch changed", Settings.HIDE_SPONSORED_POSTS.savedValue());

            // And the next import goes through.
            deliver(activity, tap(activity, page, IMPORT_ROW), fileWith(Settings.HIDE_SPONSORED_POSTS, false));
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.HIDE_SPONSORED_POSTS.savedValue());
        }
    }

    // ---- The app holding the file ------------------------------------------------------------

    private static final String EXPORT_TIMEOUT = "The app holding the settings file is taking too long, so Hushfacebook "
            + "stopped waiting. That app may still finish saving it, so check the file before you rely on it.";
    private static final String IMPORT_TIMEOUT =
            "The app holding that file is taking too long, so Hushfacebook stopped waiting. Nothing was changed.";
    private static final String STALLED = "The app holding the last settings file still hasn't answered. Try again later.";
    private static final String MISMATCH =
            "The settings file was saved, but it doesn't read back as what was written. Save it again as a new file.";
    private static final String UNCHECKED = "Settings exported. The app holding the file wouldn't let Hushfacebook "
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
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
     * the message says only that Hushfacebook stopped waiting. While the app still holds a worker
     * nothing new starts, and its late answer shows no preview and says nothing.
     */
    @Test
    public void aStalledAppGivesTheRowsBackAndItsLateAnswerChangesNothing() throws Exception {
        CountDownLatch release = new CountDownLatch(1);
        SettingsFileProvider.stall = release;
        SettingsFileProvider.ignoresCancel = true;
        Uri uri = SettingsFileProvider.put(AUTHORITY, "stalled.json",
                fileWith(Settings.HIDE_SPONSORED_POSTS, false).getBytes(StandardCharsets.UTF_8));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            assertTrue(Settings.HIDE_SPONSORED_POSTS.savedValue());

            // Once the app has answered, a new read starts.
            deliver(activity, tap(activity, page, IMPORT_ROW), fileWith(Settings.HIDE_SPONSORED_POSTS, false));
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
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            assertTrue("the next test started with the rows busy", page.findPreference(EXPORT_ROW).isEnabled());
            export(activity, page, SettingsFileProvider.put(AUTHORITY, "next.json", new byte[0]));
            assertEquals("Settings exported.", ShadowToast.getTextOfLatestToast());
        }
    }

    // ---- Helpers -------------------------------------------------------------------------------

    /** Taps a row and hands back the picker it opened. */
    private static ShadowActivity.IntentForResult tap(Activity activity, HushfacebookPreferenceFragment page, String row) {
        click(page.findPreference(row));
        ShadowActivity.IntentForResult started = shadowOf(activity).getNextStartedActivityForResult();
        assertNotNull(row + " opened no picker", started);
        return started;
    }

    private static void click(Preference row) {
        assertNotNull("no such row", row);
        row.getOnPreferenceClickListener().onPreferenceClick(row);
    }

    /** Exports through the picker to [uri], and waits for what that sets off. */
    private static void export(Activity activity, HushfacebookPreferenceFragment page, Uri uri) throws Exception {
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
        SettingsDialog dialog = (SettingsDialog) activity.getFragmentManager().findFragmentByTag("hushfacebook_settings");
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
