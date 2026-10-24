/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Forked from:
 * https://github.com/SysAdminDoc/hushfeed/blob/bcc57ee555f4346c4eb1cbdae9f6ca8a3fa6fef4/extensions/tiktok/src/test/java/app/hushpinterest/extension/tiktok/settings/SettingsBackupTest.java
 * Copyright 2026 Hushfeed contributors (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026: rewritten around the list of switches a file may
 * carry, the preview an import shows first, and the picker round trip through Hushfacebook's
 * settings dialog, the activity rebuilt behind the picker included.
 */
package app.hushtumblr.extension.tumblr.settings;

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
import android.os.BadParcelableException;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.Preference;
import android.preference.PreferenceScreen;
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
import org.robolectric.util.ReflectionHelpers;

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
import java.util.EnumSet;
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

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.WorkerPoolForTests;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.BaseSettings;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.FailingStore;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.shared.settings.Setting;
import app.hushtumblr.extension.shared.settings.StringSetting;
import app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtumblr.extension.shared.settings.preference.LogBufferManager;
import app.hushtumblr.extension.shared.settings.preference.SharedPrefCategory;

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
            "hushtumblr_check_releases",
            "It puts the phone online. A shared settings file mustn't opt this phone into a release "
                    + "check, so it's switched on from the phone's own screen.");

    /** HushTumblr's own state and its diagnostics. None of them is ever in a file. */
    private static List<Setting<?>> neverInAFile() {
        return Arrays.asList(BaseSettings.PAUSED, BaseSettings.SAFE_MODE, BaseSettings.DEBUG,
                BaseSettings.DEBUG_LOG_FILTERS, BaseSettings.DEBUG_STACKTRACE, BaseSettings.DEBUG_TOAST_ON_ERROR,
                BaseSettings.CAPTURE_JAVA_CRASHES, BaseSettings.MORPHE_LANGUAGE, BaseSettings.SHOW_MENU_ICONS,
                BaseSettings.FIRST_TIME_APP_LAUNCHED, BaseSettings.EXPERIMENTAL_APP_CONFIRMED,
                BaseSettings.CHECK_ENVIRONMENT_WARNINGS_ISSUED);
    }

    private static final String EXPORT_ROW = "action_export_settings";
    private static final String IMPORT_ROW = "action_import_settings";
    private static final String UNDO_ROW = "action_undo_import";
    /** The app behind every file the tests pick. */
    private static final String AUTHORITY = "settings-test";

    @Before
    public void startClean() {
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.resetToDefault();
        for (StringSetting setting : SettingsBackup.TEXT_ALLOWLIST) setting.resetToDefault();
        SettingsBackup.discardUndo();
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        PatchFamily.capabilitiesForTests = null;
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
        for (StringSetting setting : SettingsBackup.TEXT_ALLOWLIST) setting.resetToDefault();
        // The release check stays out of every file, so the list above doesn't reach it.
        Settings.CHECK_FOR_RELEASES.resetToDefault();
        BaseSettings.PAUSED.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        BaseSettings.DEBUG_LOG_FILTERS.resetToDefault();
        PauseForTests.resume();
        SettingsBackup.discardUndo();
        PatchFamily.inBuildForTests = null;
        PatchFamily.capabilitiesForTests = null;
        AbstractPreferenceFragment.settingImportInProgress = false;
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    // ---- What a file carries ------------------------------------------------------------------

    @Test
    public void backupsAndImportPreviewsReadStoredChoicesInsteadOfTemporaryLiveValues() throws Exception {
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) {
            Setting.privateSetValueFromString(setting, Boolean.toString(!setting.defaultValue));
            JSONObject exported = new JSONObject(SettingsBackup.create()).getJSONObject("settings");
            assertEquals(setting.key, setting.defaultValue.booleanValue(), exported.getBoolean(setting.key));
            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(fileWith(setting, !setting.defaultValue));
            assertEquals(setting.key, 1, snapshot.switchChanges());
            String transition = setting.defaultValue ? "(On to Off)" : "(Off to On)";
            assertTrue(setting.key, SettingsBackupPreference.previewMessage(snapshot).contains(transition));
            setting.resetToDefault();
        }
    }

    @Test
    public void importMatchingATemporaryLiveValuePersistsAndUndoRestoresTheStoredChoice() throws Exception {
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) {
            for (boolean explicitDefault : new boolean[]{false, true}) {
                SettingsBackup.discardUndo();
                setting.resetToDefault();
                if (explicitDefault) {
                    assertTrue(Setting.preferences.preferences.edit().putBoolean(setting.key, setting.defaultValue).commit());
                    setting.noteSavedPreferenceChange();
                }
                Setting.privateSetValueFromString(setting, Boolean.toString(!setting.defaultValue));
                SettingsBackup.Snapshot snapshot = SettingsBackup.parse(fileWith(setting, !setting.defaultValue));
                assertEquals(setting.key, 1, SettingsBackup.apply(snapshot));
                assertEquals(setting.key, !setting.defaultValue,
                        Setting.preferences.preferences.getBoolean(setting.key, setting.defaultValue));
                assertEquals(setting.key, SettingsBackup.UndoState.AVAILABLE, SettingsBackup.undoState());
                assertEquals(setting.key, SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
                assertEquals(setting.key, setting.defaultValue, setting.savedValue());
                assertEquals(setting.key, setting.defaultValue.booleanValue(),
                        Setting.preferences.preferences.getBoolean(setting.key, setting.defaultValue));
                assertEquals(setting.key, SettingsBackup.UndoResult.NOTHING, SettingsBackup.undo());
            }
        }
    }

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
        assertEquals(Arrays.asList(
                Settings.HIDE_ADS,
                Settings.HIDE_ADVERTISING_ID,
                Settings.DISABLE_ANALYTICS,
                Settings.HIDE_AD_FREE_BANNER,
                Settings.HIDE_TUMBLR_TV,
                Settings.HIDE_COMMUNITIES_TAB,
                Settings.HIDE_BLAZE_PROMPTS,
                Settings.SKIP_REVIEW_PROMPTS,
                Settings.HIDE_BLOG_NOTIFICATION_REMINDERS,
                Settings.HIDE_GIFT_MESSAGE_POPUPS,
                Settings.TURN_OFF_SCREENSHOT_SHARING,
                Settings.DISABLE_UPDATE_PROMPTS,
                Settings.HIDE_SUGGESTED_BLOGS,
                Settings.HIDE_SUGGESTED_COMMUNITIES,
                Settings.HIDE_SUGGESTED_TAGS,
                Settings.HIDE_WATCH_IT_ROWS,
                Settings.HIDE_HASHTAGS,
                Settings.HIDE_FOLLOW_BUTTON,
                Settings.HIDE_TUMBLRMART,
                Settings.HIDE_NOTE_COUNTS,
                Settings.HIDE_LIKE_BUTTON,
                Settings.HIDE_REBLOG_BUTTON,
                Settings.HIDE_COMMENT_BUTTON,
                Settings.HIDE_SHARE_BUTTON,
                Settings.HIDE_SAVE_BUTTON,
                Settings.HIDE_DASHBOARD_COUNT,
                Settings.HIDE_COMMUNITIES_COUNT,
                Settings.HIDE_NOTIFICATIONS_COUNT,
                Settings.HIDE_REBLOGS,
                Settings.KEEP_TAGGED_REBLOGS,
                Settings.KEEP_REBLOGS_WITH_CONTENT,
                Settings.HIDE_NOTIFICATION_LIKES,
                Settings.HIDE_NOTIFICATION_REBLOGS,
                Settings.HIDE_NOTIFICATION_REPLIES,
                Settings.HIDE_NOTIFICATION_FOLLOWS,
                Settings.HIDE_NOTIFICATION_MENTIONS,
                Settings.HIDE_NOTIFICATION_ASKS,
                Settings.HIDE_NOTIFICATION_BOOPS,
                Settings.HIDE_VIDEO_POSTS,
                Settings.HIDE_PHOTO_POSTS,
                Settings.HIDE_TEXT_POSTS,
                Settings.HIDE_POSTS_WITH_WORDS,
                Settings.WORDS_CURRENT_TEXT,
                Settings.WORDS_REBLOG_TRAIL,
                Settings.WORDS_TAGS,
                Settings.WORDS_SUMMARY,
                Settings.HIDE_FILTERED_POSTS,
                Settings.SHOW_POST_TIMESTAMPS,
                Settings.SHOW_IMAGE_DESCRIPTIONS,
                Settings.MUTE_ROOT_POSTS,
                Settings.REVEAL_ALLOWED_MATURE_CONTENT,
                Settings.SHOW_MUTUAL_MARKERS,
                Settings.DARK_BACKGROUND,
                Settings.HIDE_EXPLORE_TAB,
                Settings.HIDE_NOTIFICATIONS_TAB,
                Settings.REORDER_TABS,
                Settings.FIX_PUSH_NOTIFICATIONS),
                SettingsBackup.ALLOWLIST);
    }

    @Test
    public void nothingOfHushTumblrsOwnIsOnTheList() throws Exception {
        List<Setting<?>> own = declaredSettings(BaseSettings.class);
        assertTrue("the scan of BaseSettings found nothing", own.size() >= neverInAFile().size());
        for (Setting<?> setting : own) {
            assertFalse(setting.key + " is HushTumblr's own and is on the list", SettingsBackup.ALLOWLIST.contains(setting));
        }
        for (Setting<?> setting : neverInAFile()) {
            assertFalse(setting.key + " is on the list", SettingsBackup.ALLOWLIST.contains(setting));
        }
    }

    /**
     * A file is a format name, a version, one true or false per switch and the text settings,
     * whatever else the phone holds: not the pause, not debug logging or safe mode, not the log, the
     * diagnostic counts or anything that names the phone or the person.
     */
    @Test
    public void aFileIsItsFormatItsVersionAndOneValuePerSwitch() throws Exception {
        Settings.HIDE_ADVERTISING_ID.save(false);
        Settings.CHECK_FOR_RELEASES.save(true);
        BaseSettings.PAUSED.save(true);
        BaseSettings.DEBUG.save(true);
        BaseSettings.DEBUG_LOG_FILTERS.save("feed");
        PauseForTests.pause(HushTumblrPause.Reason.CRASH_LOOP);
        String cookie = "sessionid=100012345678901%3Asecret-session; ds_user_id=100012345678901";
        LogBufferManager.appendToLogBuffer("sentinel line " + cookie);
        HookStatus.invoked(FamilyNames.HIDE_ADVERTISING_ID);
        Context app = RuntimeEnvironment.getApplication();

        String text = SettingsBackup.create();
        JSONObject root = new JSONObject(text);
        assertEquals(new TreeSet<>(Arrays.asList("format", "schema", "settings", "text")), names(root));
        assertEquals("hushtumblr-settings", root.get("format"));
        assertEquals(3, root.get("schema"));
        assertEquals(keys(SettingsBackup.TEXT_ALLOWLIST), names(root.getJSONObject("text")));
        JSONObject switches = root.getJSONObject("settings");
        assertEquals(keys(SettingsBackup.ALLOWLIST), names(switches));
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) {
            // Saved, not what a paused Tumblr is answered: paused, every switch answers false.
            assertFalse(setting.get());
            assertEquals(setting.key, setting.savedValue(), switches.get(setting.key));
        }
        assertEquals(false, switches.get(Settings.HIDE_ADVERTISING_ID.key));
        assertEquals(true, switches.get(Settings.FIX_PUSH_NOTIFICATIONS.key));
        for (Setting<?> setting : Setting.allLoadedSettings()) {
            if (SettingsBackup.ALLOWLIST.contains(setting) || SettingsBackup.TEXT_ALLOWLIST.contains(setting)) continue;
            assertFalse(setting.key + " is in the file", text.contains(setting.key));
        }
        for (String leak : new String[]{"sentinel", "sessionid", "ds_user_id", "100012345678901", "secret-session",
                app.getPackageName(), FamilyNames.HIDE_ADVERTISING_ID, "feed"}) {
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

    /**
     * The words to hide and the tab order go out in the text section, come back exactly, read in
     * the preview by name, and an Undo puts back what was there.
     */
    @Test
    public void textSettingsGoOutAndComeBackExactly() throws Exception {
        String words = "cat\nDog pics, bird";
        String order = "Account,Notifications";
        TextSettings.HIDDEN_WORDS.save(words);
        TextSettings.TAB_ORDER.save(order);
        String file = SettingsBackup.create();
        JSONObject text = new JSONObject(file).getJSONObject("text");
        assertEquals(words, text.get(TextSettings.HIDDEN_WORDS.key));
        assertEquals(order, text.get(TextSettings.TAB_ORDER.key));

        TextSettings.HIDDEN_WORDS.save("something else");
        TextSettings.TAB_ORDER.resetToDefault();
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals(Collections.emptyList(), snapshot.skipped);
        assertEquals(0, snapshot.unknown);
        assertEquals(2, snapshot.switchChanges());
        String preview = SettingsBackupPreference.previewMessage(snapshot);
        assertTrue(preview, preview.startsWith(L10n.quantity(2, "%1$d setting will change.",
                "%1$d settings will change.", 2) + "\n\n" + L10n.f("%1$s (%2$s to %3$s)", L10n.t("Words to hide"),
                L10n.isolate("something else"), L10n.isolate("cat, dog pics, bird"))));
        assertTrue(preview, preview.contains("\n\n" + L10n.t("Tab order") + " (" + L10n.t("Tumblr's order") + " to "));
        assertFalse("text settings were counted as switches: " + preview, preview.contains("switch"));

        assertEquals("word lists and tab order are counted as settings", 2, SettingsBackup.apply(snapshot));
        assertEquals(words, TextSettings.HIDDEN_WORDS.savedValue());
        assertEquals(words, TextSettings.HIDDEN_WORDS.persistedValue());
        assertEquals(order, TextSettings.TAB_ORDER.persistedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());

        assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
        assertEquals("something else", TextSettings.HIDDEN_WORDS.persistedValue());
        assertEquals("", TextSettings.TAB_ORDER.persistedValue());
    }

    /** A version 1 file still restores its switches, and the text settings stay as they are. */
    @Test
    public void aVersionOneFileRestoresItsSwitchesAndLeavesTheTextAlone() throws Exception {
        TextSettings.HIDDEN_WORDS.save("cat");
        TextSettings.TAB_ORDER.save("Account");
        String old = "{\"format\":\"hushtumblr-settings\",\"schema\":1,\"settings\":{\""
                + Settings.HIDE_ADVERTISING_ID.key + "\":false}}";
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(old);
        assertTrue(snapshot.texts.isEmpty());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
        assertEquals("cat", TextSettings.HIDDEN_WORDS.persistedValue());
        assertEquals("Account", TextSettings.TAB_ORDER.persistedValue());

        // Version 1 has no text section, so one in a version 1 file is a name it doesn't know.
        JSONObject stray = new JSONObject(old).put("text", new JSONObject()
                .put(TextSettings.HIDDEN_WORDS.key, "dog").put(TextSettings.TAB_ORDER.key, ""));
        stray.getJSONObject("settings").put(Settings.HIDE_ADVERTISING_ID.key, true);
        snapshot = SettingsBackup.parse(stray.toString());
        assertEquals(1, snapshot.unknown);
        assertTrue(snapshot.texts.isEmpty());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
        assertEquals("cat", TextSettings.HIDDEN_WORDS.persistedValue());
        assertEquals("Account", TextSettings.TAB_ORDER.persistedValue());
    }

    /**
     * A text value its settings row could never have saved is left out and named in the preview,
     * and the rest of the file still imports. Only a text section that isn't one refuses the file.
     */
    @Test
    public void aTextValueThatFailsItsCheckIsLeftOutAndSaidWhileTheRestImports() throws Exception {
        TextSettings.HIDDEN_WORDS.save("cat");
        TextSettings.TAB_ORDER.save("Account");
        String leftOut = L10n.f("%1$s: the value in that file can't be used, so it'll be left out.", L10n.t("Tab order"));
        for (Object badOrder : new Object[]{"Account,Nowhere", "Account,Account", "Account, Notifications", ",Account",
                5, true, JSONObject.NULL, new JSONObject(), new org.json.JSONArray()}) {
            JSONObject file = new JSONObject(fileWith(Settings.HIDE_ADVERTISING_ID, false)).put("text", new JSONObject()
                    .put(TextSettings.HIDDEN_WORDS.key, "dog").put(TextSettings.TAB_ORDER.key, badOrder));
            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file.toString());
            assertEquals(String.valueOf(badOrder), Collections.singletonList(TextSettings.TAB_ORDER), snapshot.skipped);
            String preview = SettingsBackupPreference.previewMessage(snapshot);
            assertTrue(preview, preview.endsWith("\n\n" + leftOut));
            assertEquals(2, SettingsBackup.apply(snapshot));
            assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
            assertEquals("dog", TextSettings.HIDDEN_WORDS.persistedValue());
            assertEquals("a value that failed its check was written", "Account", TextSettings.TAB_ORDER.persistedValue());
            Settings.HIDE_ADVERTISING_ID.resetToDefault();
            TextSettings.HIDDEN_WORDS.save("cat");
            SettingsBackup.discardUndo();
        }
        // The words take any text, trimmed as their box trims it, so only a value that isn't text fails.
        for (Object badWords : new Object[]{7, false, JSONObject.NULL, new org.json.JSONArray()}) {
            JSONObject file = new JSONObject(SettingsBackup.create());
            file.getJSONObject("text").put(TextSettings.HIDDEN_WORDS.key, badWords);
            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file.toString());
            assertEquals(String.valueOf(badWords), Collections.singletonList(TextSettings.HIDDEN_WORDS), snapshot.skipped);
            assertEquals(0, snapshot.switchChanges());
            assertEquals(L10n.t("Your settings already match that file, so nothing will change.") + "\n\n"
                    + L10n.f("%1$s: the value in that file can't be used, so it'll be left out.", L10n.t("Words to hide")),
                    SettingsBackupPreference.previewMessage(snapshot));
        }
        JSONObject padded = new JSONObject(SettingsBackup.create());
        padded.getJSONObject("text").put(TextSettings.HIDDEN_WORDS.key, "  dog \n");
        assertEquals("dog", SettingsBackup.parse(padded.toString()).texts.get(TextSettings.HIDDEN_WORDS));
        // A text section that isn't one was never written by HushTumblr.
        assertEquals(SettingsBackup.Reason.FORMAT,
                reasonFor(new JSONObject(SettingsBackup.create()).put("text", "cat").toString()));
        assertEquals("cat", TextSettings.HIDDEN_WORDS.persistedValue());
        assertEquals("Account", TextSettings.TAB_ORDER.persistedValue());
    }

    /** A list of words longer than any one switch name still reads back: the parser's string cap is the file's. */
    @Test
    public void aLongWordListStillImports() throws Exception {
        StringBuilder words = new StringBuilder();
        for (int index = 0; words.length() < 4000; index++) words.append("word").append(index).append('\n');
        String saved = words.toString().trim();
        TextSettings.HIDDEN_WORDS.save(saved);
        String file = SettingsBackup.create();
        TextSettings.HIDDEN_WORDS.resetToDefault();
        SettingsBackup.apply(SettingsBackup.parse(file));
        assertEquals(saved, TextSettings.HIDDEN_WORDS.persistedValue());
    }

    // ---- Writing ---------------------------------------------------------------------------

    @Test
    public void anImportIsOneCommit() throws Exception {
        Settings.HIDE_ADVERTISING_ID.save(false);
        String file = SettingsBackup.create();
        Settings.HIDE_ADVERTISING_ID.save(true);
        Settings.FIX_PUSH_NOTIFICATIONS.save(false);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals(2, snapshot.changes().size());

        Counts counts = new Counts();
        withStore(counting(Setting.preferences.preferences, counts, () -> false, false), () -> {
            assertEquals(2, SettingsBackup.apply(snapshot));
            return null;
        });
        assertEquals("editors opened", 1, counts.edits.get());
        assertEquals("commits", 1, counts.commits.get());
        assertEquals("asynchronous applies", 0, counts.applies.get());
        assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
        assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());

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
        String file = fileWith(Settings.HIDE_ADVERTISING_ID, false, Settings.FIX_PUSH_NOTIFICATIONS, false);
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
        assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
        assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
    }

    @Test
    public void aRollbackThatFailsTooSaysSomeSwitchesMayHaveChanged() throws Exception {
        String file = fileWith(Settings.HIDE_ADVERTISING_ID, false);
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
        String file = fileWith(Settings.HIDE_ADVERTISING_ID, false, Settings.FIX_PUSH_NOTIFICATIONS, false);
        Map<String, ?> before = store();
        for (FailingStore.Fault fault : new FailingStore.Fault[]{FailingStore.Fault.EDIT_THROWS,
                FailingStore.Fault.STAGE_THROWS, FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.COMMIT_THROWS,
                FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING}) {
            SettingsBackup.ApplyFailed failure = failedApply(file, fault);
            assertTrue(fault + " said the switches may have changed", failure.rolledBack);
            assertEquals(fault + " left the store changed", before, store());
            assertTrue(fault + " left a live switch changed", Settings.HIDE_ADVERTISING_ID.savedValue());
            assertTrue(fault + " left a live switch changed", Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
        }
    }

    /**
     * A rollback that doesn't land either says so, and the switches then hold what the store kept,
     * so the screen and the next start agree.
     */
    @Test
    public void aRollbackThatFailsSaysSoAndTheSwitchesHoldWhatTheStoreKept() throws Exception {
        String file = fileWith(Settings.HIDE_ADVERTISING_ID, false, Settings.FIX_PUSH_NOTIFICATIONS, false);
        FailingStore.Fault[][] scripts = {
                {FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.LOST},
                {FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING, FailingStore.Fault.COMMIT_THROWS},
                {FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.EDIT_THROWS},
                {FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING, FailingStore.Fault.STAGE_THROWS}};
        for (FailingStore.Fault[] script : scripts) {
            String name = Arrays.toString(script);
            SettingsBackup.ApplyFailed failure = failedApply(file, script);
            assertFalse(name + " said the switches are back", failure.rolledBack);
            assertEquals(name, false, store().get(Settings.HIDE_ADVERTISING_ID.key));
            assertFalse(name + " runs a switch the store doesn't hold", Settings.HIDE_ADVERTISING_ID.savedValue());
            assertFalse(name + " runs a switch the store doesn't hold", Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
            Settings.HIDE_ADVERTISING_ID.resetToDefault();
            Settings.FIX_PUSH_NOTIFICATIONS.resetToDefault();
        }
    }

    /** What a failed import says is what the screen shows and the store holds. */
    @Test
    public void aFailedImportSaysWhatTheStoreKeptAndTheScreenShowsIt() throws Exception {
        String file = fileWith(Settings.HIDE_ADVERTISING_ID, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            SwitchPreference row = (SwitchPreference) page.findPreference(Settings.HIDE_ADVERTISING_ID.key);

            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS)) {
                shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                settle();
            }
            assertEquals("Couldn't import the settings. Nothing was changed.", ShadowToast.getTextOfLatestToast());
            assertTrue("the process runs a switch the file never managed to set", Settings.HIDE_ADVERTISING_ID.savedValue());
            assertTrue(row.isChecked());
            assertFalse(store().containsKey(Settings.HIDE_ADVERTISING_ID.key));

            ShadowToast.reset();
            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.LOST)) {
                shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                settle();
            }
            assertEquals("Couldn't import the settings, and couldn't put back the ones you had. "
                    + "Check the settings on this screen.", ShadowToast.getTextOfLatestToast());
            assertEquals(false, store().get(Settings.HIDE_ADVERTISING_ID.key));
            assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
            assertFalse("the screen shows a switch the store doesn't hold", row.isChecked());
        }
    }

    // ---- Undo -------------------------------------------------------------------------------

    @Test
    public void undoRestoresEveryEarlierSwitchInOneCommitAndNeverExportsUndo() throws Exception {
        Map<BooleanSetting, Boolean> before = new LinkedHashMap<>();
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) before.put(setting, setting.savedValue());
        JSONObject file = new JSONObject(SettingsBackup.create());
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) {
            file.getJSONObject("settings").put(setting.key, !setting.savedValue());
        }
        Counts counts = new Counts();
        withStore(counting(Setting.preferences.preferences, counts, () -> false, false), () -> {
            assertEquals(before.size(), SettingsBackup.apply(SettingsBackup.parse(file.toString())));
            assertEquals(SettingsBackup.UndoState.AVAILABLE, SettingsBackup.undoState());
            assertEquals(new TreeSet<>(Arrays.asList("format", "schema", "settings", "text")),
                    names(new JSONObject(SettingsBackup.create())));
            assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
            assertEquals(SettingsBackup.UndoState.NONE, SettingsBackup.undoState());
            assertEquals(SettingsBackup.UndoResult.NOTHING, SettingsBackup.undo());
            return null;
        });
        assertEquals("import and Undo each commit once", 2, counts.commits.get());
        assertEquals(0, counts.applies.get());
        for (Map.Entry<BooleanSetting, Boolean> entry : before.entrySet()) {
            assertEquals(entry.getKey().key, entry.getValue(), entry.getKey().savedValue());
        }
    }

    @Test
    public void undoRowRestoresImmediatelyWithoutOpeningAnotherDialogOrPicker() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            Preference undo = page.findPreference(UNDO_ROW);
            assertNotNull("the settings page needs the Undo row", undo);
            assertFalse(undo.isEnabled());
            deliver(activity, tap(activity, page, IMPORT_ROW), fileWith(Settings.HIDE_ADVERTISING_ID, false));
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertTrue(undo.isEnabled());
            ShadowAlertDialog.reset();
            click(undo);
            settle();
            assertNull("Undo opened another confirmation", ShadowAlertDialog.getLatestAlertDialog());
            assertNull("Undo opened a picker", shadowOf(activity).getNextStartedActivityForResult());
            assertEquals("Import undone. Your earlier settings are back.", ShadowToast.getTextOfLatestToast());
            assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
            assertTrue(((SwitchPreference) page.findPreference(Settings.HIDE_ADVERTISING_ID.key)).isChecked());
            assertFalse(undo.isEnabled());
            assertFalse(AbstractPreferenceFragment.settingImportInProgress);
        }
    }

    @Test
    public void aLaterSavedEditExpiresUndoWithoutOverwritingTheEdit() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
            settle();
            Preference undo = page.findPreference(UNDO_ROW);
            assertNotNull(undo);
            assertTrue(undo.isEnabled());
            Settings.FIX_PUSH_NOTIFICATIONS.save(false);
            settle();
            assertFalse(undo.isEnabled());
            assertEquals("Undo ended because a saved setting changed.", undo.getSummary().toString());
            assertEquals(SettingsBackup.UndoResult.EXPIRED, SettingsBackup.undo());
            assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
            assertFalse("Undo overwrote the later edit", Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
        }
    }

    @Test
    public void savedEditsReturnedToTheImportedValueBeforeCallbacksStillExpireUndo() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
            settle();
            Preference undo = page.findPreference(UNDO_ROW);
            assertTrue(undo.isEnabled());
            assertTrue(Settings.HIDE_ADVERTISING_ID.save(true));
            assertTrue(Settings.HIDE_ADVERTISING_ID.save(false));
            settle();
            assertFalse(undo.isEnabled());
            assertEquals("Undo ended because a saved setting changed.", undo.getSummary().toString());
            assertEquals(SettingsBackup.UndoResult.EXPIRED, SettingsBackup.undo());
            assertFalse("Undo overwrote the final saved edit", Settings.HIDE_ADVERTISING_ID.savedValue());
            assertEquals(false, store().get(Settings.HIDE_ADVERTISING_ID.key));
        }
    }

    @Test
    public void twoFrameworkSwitchTapsBeforeUndoCallbacksStillExpireUndo() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
            settle();
            SwitchPreference ads = (SwitchPreference) page.findPreference(Settings.HIDE_ADVERTISING_ID.key);
            Preference undo = page.findPreference(UNDO_ROW);
            assertTrue(undo.isEnabled());
            ReflectionHelpers.callInstanceMethod(ads, "performClick",
                    ReflectionHelpers.ClassParameter.from(PreferenceScreen.class, page.getPreferenceScreen()));
            assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
            ReflectionHelpers.callInstanceMethod(ads, "performClick",
                    ReflectionHelpers.ClassParameter.from(PreferenceScreen.class, page.getPreferenceScreen()));
            assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
            settle();
            assertFalse(undo.isEnabled());
            assertEquals(SettingsBackup.UndoResult.EXPIRED, SettingsBackup.undo());
            assertFalse("Undo overwrote the final tapped choice", Settings.HIDE_ADVERTISING_ID.savedValue());
            assertEquals(false, store().get(Settings.HIDE_ADVERTISING_ID.key));
        }
    }

    @Test
    public void savedEditsExpireUndoWithoutAnOpenSettingsPage() throws Exception {
        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
        assertTrue(Settings.HIDE_ADVERTISING_ID.save(true));
        assertTrue(Settings.HIDE_ADVERTISING_ID.save(false));
        assertEquals(SettingsBackup.UndoResult.EXPIRED, SettingsBackup.undo());
        assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
        assertEquals(false, store().get(Settings.HIDE_ADVERTISING_ID.key));
    }

    @Test
    public void batchEditsReturnedToTheirImportedValuesStillExpireUndo() throws Exception {
        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
        Map<Setting<?>, Object> changed = new LinkedHashMap<>();
        changed.put(Settings.HIDE_ADVERTISING_ID, true);
        changed.put(Settings.FIX_PUSH_NOTIFICATIONS, false);
        Setting.saveAll(changed);
        changed.put(Settings.HIDE_ADVERTISING_ID, false);
        changed.put(Settings.FIX_PUSH_NOTIFICATIONS, true);
        Setting.saveAll(changed);
        assertEquals(SettingsBackup.UndoResult.EXPIRED, SettingsBackup.undo());
        assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
        assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
    }

    @Test
    public void persistingATransientSwitchStillExpiresUndoWhenItsValuesReturn() throws Exception {
        for (boolean batch : new boolean[]{false, true}) {
            SettingsBackup.discardUndo();
            Settings.HIDE_ADVERTISING_ID.resetToDefault();
            SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
            Setting.privateSetValueFromString(Settings.FIX_PUSH_NOTIFICATIONS, "false");
            assertTrue(Setting.preferences.preferences.getBoolean(Settings.FIX_PUSH_NOTIFICATIONS.key, true));
            if (batch) Setting.saveAll(Collections.singletonMap(Settings.FIX_PUSH_NOTIFICATIONS, false));
            else assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.save(false));
            assertFalse("the requested edit wasn't persisted",
                    Setting.preferences.preferences.getBoolean(Settings.FIX_PUSH_NOTIFICATIONS.key, true));
            Setting.privateSetValueFromString(Settings.FIX_PUSH_NOTIFICATIONS, "true");
            assertEquals(batch ? "batch" : "single", SettingsBackup.UndoResult.EXPIRED, SettingsBackup.undo());
            assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
        }
    }

    @Test
    public void restoringALiveValueToItsAlreadyStoredValueKeepsUndo() throws Exception {
        for (boolean batch : new boolean[]{false, true}) {
            SettingsBackup.discardUndo();
            Settings.HIDE_ADVERTISING_ID.resetToDefault();
            SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
            long revision = Settings.FIX_PUSH_NOTIFICATIONS.savedWriteRevision();
            Setting.privateSetValueFromString(Settings.FIX_PUSH_NOTIFICATIONS, "false");
            if (batch) Setting.saveAll(Collections.singletonMap(Settings.FIX_PUSH_NOTIFICATIONS, true));
            else assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.save(true));
            assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
            assertEquals("a stored no-op became an edit", revision, Settings.FIX_PUSH_NOTIFICATIONS.savedWriteRevision());
            assertEquals(batch ? "batch" : "single", SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
        }
    }

    @Test
    public void failedWritesRestoreStoredRepresentationWithoutPersistingATransientValue() throws Exception {
        for (boolean batch : new boolean[]{false, true}) {
            for (boolean explicitDefault : new boolean[]{false, true}) {
                for (FailingStore.Fault fault : new FailingStore.Fault[]{FailingStore.Fault.EDIT_THROWS,
                        FailingStore.Fault.STAGE_THROWS, FailingStore.Fault.COMMIT_FALSE,
                        FailingStore.Fault.COMMIT_THROWS, FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING,
                        FailingStore.Fault.LOST}) {
                    String mode = (batch ? "batch " : "single ") + explicitDefault + " " + fault;
                    SettingsBackup.discardUndo();
                    Settings.HIDE_ADVERTISING_ID.resetToDefault();
                    if (explicitDefault) {
                        Setting.preferences.preferences.edit().putBoolean(Settings.FIX_PUSH_NOTIFICATIONS.key, true).commit();
                    }
                    try (FailingStore ignored = FailingStore.install(FailingStore.Fault.NONE, fault,
                            FailingStore.Fault.NONE)) {
                        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
                        Map<String, ?> original = store();
                        long revision = Settings.FIX_PUSH_NOTIFICATIONS.savedWriteRevision();
                        Setting.privateSetValueFromString(Settings.FIX_PUSH_NOTIFICATIONS, "false");
                        if (batch) {
                            try {
                                Setting.saveAll(Collections.singletonMap(Settings.FIX_PUSH_NOTIFICATIONS, true));
                                fail(mode + " was reported as saved");
                            } catch (Setting.BatchFailed failed) {
                                assertTrue(mode, failed.restored);
                            }
                        } else {
                            assertFalse(mode + " was reported as saved", Settings.FIX_PUSH_NOTIFICATIONS.save(true));
                        }
                        assertEquals(mode, original, store());
                        assertFalse(mode + " changed the previous live value", Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
                        assertEquals(mode, revision, Settings.FIX_PUSH_NOTIFICATIONS.savedWriteRevision());
                        Setting.privateSetValueFromString(Settings.FIX_PUSH_NOTIFICATIONS, "true");
                        assertEquals(mode, SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
                    }
                }
            }
        }
    }

    @Test
    public void queuedFailedWriteCallbacksPreserveAnExplicitDefaultAndUndo() throws Exception {
        for (boolean batch : new boolean[]{false, true}) {
            SettingsBackup.discardUndo();
            Settings.HIDE_ADVERTISING_ID.resetToDefault();
            Settings.FIX_PUSH_NOTIFICATIONS.resetToDefault();
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
                settle();
                preserveAnExplicitDefault();
                try (FailingStore ignored = FailingStore.install(FailingStore.Fault.NONE,
                        FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING, FailingStore.Fault.NONE)) {
                    SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
                    settle();
                    Map<String, ?> original = store();
                    assertEquals("the explicit-default fixture was normalized", true, original.get(Settings.FIX_PUSH_NOTIFICATIONS.key));
                    long revision = Settings.FIX_PUSH_NOTIFICATIONS.savedWriteRevision();
                    Setting.privateSetValueFromString(Settings.FIX_PUSH_NOTIFICATIONS, "false");
                    java.util.concurrent.ExecutorService pool = java.util.concurrent.Executors.newSingleThreadExecutor();
                    try {
                        java.util.concurrent.Future<Boolean> saved = pool.submit(() -> {
                            if (!batch) return Settings.FIX_PUSH_NOTIFICATIONS.save(true);
                            try {
                                Setting.saveAll(Collections.singletonMap(Settings.FIX_PUSH_NOTIFICATIONS, true));
                                return true;
                            } catch (Setting.BatchFailed failed) {
                                assertTrue(failed.restored);
                                return false;
                            }
                        });
                        assertFalse(saved.get(5, TimeUnit.SECONDS));
                        assertFalse("the failure changed the temporary live value", Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
                        assertEquals(original, store());
                        // Restore the temporary value without normalizing the explicitly stored default.
                        ReflectionHelpers.setField(Settings.FIX_PUSH_NOTIFICATIONS, "value", true);
                        settle();
                        assertEquals("a queued callback rewrote the recovered store", original, store());
                        assertEquals("a rollback callback became an edit", revision,
                                Settings.FIX_PUSH_NOTIFICATIONS.savedWriteRevision());
                        assertTrue(page.findPreference(UNDO_ROW).isEnabled());
                        assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
                    } finally {
                        pool.shutdownNow();
                    }
                }
            }
        }
    }

    @Test
    public void queuedFailedWriteCallbacksDoNotCountATemporaryLiveMismatchAsASavedEdit() throws Exception {
        for (boolean batch : new boolean[]{false, true}) {
            Settings.FIX_PUSH_NOTIFICATIONS.resetToDefault();
            try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                SettingsL10nTest.show(controller.get());
                settle();
                preserveAnExplicitDefault();
                Map<String, ?> original = store();
                long revision = Settings.FIX_PUSH_NOTIFICATIONS.savedWriteRevision();
                Setting.privateSetValueFromString(Settings.FIX_PUSH_NOTIFICATIONS, "false");
                try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING,
                        FailingStore.Fault.NONE)) {
                    java.util.concurrent.ExecutorService pool = java.util.concurrent.Executors.newSingleThreadExecutor();
                    try {
                        java.util.concurrent.Future<Boolean> saved = pool.submit(() -> {
                            if (!batch) return Settings.FIX_PUSH_NOTIFICATIONS.save(true);
                            try {
                                Setting.saveAll(Collections.singletonMap(Settings.FIX_PUSH_NOTIFICATIONS, true));
                                return true;
                            } catch (Setting.BatchFailed failed) {
                                assertTrue(failed.restored);
                                return false;
                            }
                        });
                        assertFalse(saved.get(5, TimeUnit.SECONDS));
                        settle();
                        assertFalse("a queued callback changed the temporary live value", Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
                        assertEquals("a queued callback rewrote the recovered store", original, store());
                        assertEquals("a rollback notification became a successful edit", revision,
                                Settings.FIX_PUSH_NOTIFICATIONS.savedWriteRevision());
                    } finally {
                        pool.shutdownNow();
                    }
                }
            } finally {
                Settings.FIX_PUSH_NOTIFICATIONS.resetToDefault();
            }
        }
    }

    private static void preserveAnExplicitDefault() throws Exception {
        boolean wasImporting = AbstractPreferenceFragment.settingImportInProgress;
        AbstractPreferenceFragment.settingImportInProgress = true;
        try {
            assertTrue(Setting.preferences.preferences.edit().putBoolean(Settings.FIX_PUSH_NOTIFICATIONS.key, true).commit());
            assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.save(true));
        } finally {
            AbstractPreferenceFragment.settingImportInProgress = wasImporting;
        }
        settle();
        assertEquals("the explicit-default fixture was normalized", true, store().get(Settings.FIX_PUSH_NOTIFICATIONS.key));
    }

    @Test
    public void noopsExcludedEditsAndRestoredTransientChoicesKeepUndo() throws Exception {
        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
        assertTrue(Settings.HIDE_ADVERTISING_ID.save(false));
        Setting.saveAll(Collections.singletonMap(Settings.FIX_PUSH_NOTIFICATIONS, true));
        assertTrue(Settings.CHECK_FOR_RELEASES.save(true));
        assertTrue(Settings.CHECK_FOR_RELEASES.save(false));
        BooleanSetting.privateSetValue(Settings.FIX_PUSH_NOTIFICATIONS, false);
        BooleanSetting.privateSetValue(Settings.FIX_PUSH_NOTIFICATIONS, true);
        Setting.privateSetValueFromString(Settings.FIX_PUSH_NOTIFICATIONS, "false");
        Setting.privateSetValueFromString(Settings.FIX_PUSH_NOTIFICATIONS, "true");
        assertEquals(SettingsBackup.UndoState.AVAILABLE, SettingsBackup.undoState());
        assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
        assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
    }

    @Test
    public void failedSavedEditsKeepUndoAfterTheirRollbackCallbacks() throws Exception {
        for (boolean batch : new boolean[]{false, true}) {
            for (FailingStore.Fault fault : new FailingStore.Fault[]{FailingStore.Fault.EDIT_THROWS,
                    FailingStore.Fault.STAGE_THROWS, FailingStore.Fault.COMMIT_FALSE,
                    FailingStore.Fault.COMMIT_THROWS, FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING,
                    FailingStore.Fault.LOST}) {
                String mode = (batch ? "batch " : "single ") + fault;
                SettingsBackup.discardUndo();
                Settings.HIDE_ADVERTISING_ID.resetToDefault();
                try (FailingStore ignored = FailingStore.install(FailingStore.Fault.NONE, fault,
                        FailingStore.Fault.NONE);
                     ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                    HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
                    SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
                    settle();
                    Map<String, ?> imported = store();
                    // The refresh a landed commit asks for waits on the worker for the settings
                    // lock, so it runs after the rollback. The test worker runs on this thread,
                    // which holds that lock, so here it waits in a list for the save to return.
                    List<Runnable> waiting = new ArrayList<>();
                    HushTumblrPreferenceFragment.editWorkerForTests = waiting::add;
                    try {
                        if (batch) {
                            Map<Setting<?>, Object> changed = new LinkedHashMap<>();
                            changed.put(Settings.HIDE_ADVERTISING_ID, true);
                            changed.put(Settings.FIX_PUSH_NOTIFICATIONS, false);
                            try {
                                Setting.saveAll(changed);
                                fail(mode + " was reported as saved");
                            } catch (Setting.BatchFailed failed) {
                                assertTrue(mode, failed.restored);
                            }
                        } else {
                            assertFalse(mode + " was reported as saved", Settings.HIDE_ADVERTISING_ID.save(true));
                        }
                    } finally {
                        HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
                    }
                    for (Runnable task : waiting) task.run();
                    settle();
                    assertFalse(mode + " changed the imported choice", Settings.HIDE_ADVERTISING_ID.savedValue());
                    assertTrue(mode + " changed another switch", Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
                    assertEquals(mode, imported, store());
                    assertEquals(mode, SettingsBackup.UndoState.AVAILABLE, SettingsBackup.undoState());
                    assertTrue(mode + " expired Undo", page.findPreference(UNDO_ROW).isEnabled());
                    assertEquals(mode, SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
                    assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
                }
            }
        }
    }

    @Test
    public void undoRefusesAStoreOrLiveSwitchThatDiffersFromTheImportedSnapshot() throws Exception {
        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
        SharedPreferences store = Setting.preferences.preferences;
        try {
            store.edit().putBoolean(Settings.FIX_PUSH_NOTIFICATIONS.key, false).commit();
            assertTrue("the live value should still be unchanged", Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
            assertEquals(SettingsBackup.UndoResult.EXPIRED, SettingsBackup.undo());
            assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
        } finally {
            store.edit().remove(Settings.FIX_PUSH_NOTIFICATIONS.key).commit();
        }
        Settings.HIDE_ADVERTISING_ID.save(true);
        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
        Setting.privateSetValueFromString(Settings.FIX_PUSH_NOTIFICATIONS, "false");
        assertFalse("the store should still be unchanged", store.contains(Settings.FIX_PUSH_NOTIFICATIONS.key));
        assertEquals(SettingsBackup.UndoResult.EXPIRED, SettingsBackup.undo());
        assertFalse("Undo overwrote the later live choice", Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
    }

    @Test
    public void pauseAndExcludedStateDoNotEnterTheImportOrUndoSnapshot() throws Exception {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        JSONObject file = new JSONObject(fileWith(Settings.HIDE_ADVERTISING_ID, false));
        file.getJSONObject("settings").put(BaseSettings.PAUSED.key, false)
                .put(BaseSettings.DEBUG.key, false).put(Settings.CHECK_FOR_RELEASES.key, false)
                .put("account_token", "foreign-token").put("signing_key", "foreign-key")
                .put("release_cache", "foreign-cache").put("log_buffer", "foreign-log");
        SettingsBackup.apply(SettingsBackup.parse(file.toString()));
        BaseSettings.DEBUG.save(true);
        Settings.CHECK_FOR_RELEASES.save(true);
        Setting.preferences.preferences.edit().putString("account_token", "kept-token")
                .putString("signing_key", "kept-key").putString("release_cache", "kept-cache")
                .putString("log_buffer", "kept-log").commit();
        try {
            assertEquals(SettingsBackup.UndoState.AVAILABLE, SettingsBackup.undoState());
            assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
            assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
            assertFalse("Undo resumed a paused hook", Settings.HIDE_ADVERTISING_ID.get());
            assertTrue(BaseSettings.PAUSED.savedValue());
            assertTrue(BaseSettings.DEBUG.savedValue());
            assertTrue(Settings.CHECK_FOR_RELEASES.savedValue());
            assertEquals("kept-token", store().get("account_token"));
            assertEquals("kept-key", store().get("signing_key"));
            assertEquals("kept-cache", store().get("release_cache"));
            assertEquals("kept-log", store().get("log_buffer"));
            JSONObject exported = new JSONObject(SettingsBackup.create()).getJSONObject("settings");
            assertEquals(keys(SettingsBackup.ALLOWLIST), names(exported));
            assertEquals(true, exported.get(Settings.HIDE_ADVERTISING_ID.key));
        } finally {
            Setting.preferences.preferences.edit().remove("account_token").remove("signing_key")
                    .remove("release_cache").remove("log_buffer").commit();
        }
    }

    @Test
    public void changingThePreferenceStoreDropsUndoWithoutRestoringAStoredSnapshot() throws Exception {
        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
        SharedPreferences nextProcess = RuntimeEnvironment.getApplication()
                .getSharedPreferences("settings-backup-next-process", Context.MODE_PRIVATE);
        nextProcess.edit().clear().putBoolean(Settings.HIDE_ADVERTISING_ID.key, false).commit();
        withStore(nextProcess, () -> {
            assertEquals(SettingsBackup.UndoState.NONE, SettingsBackup.undoState());
            assertEquals(SettingsBackup.UndoResult.NOTHING, SettingsBackup.undo());
            assertEquals(false, store().get(Settings.HIDE_ADVERTISING_ID.key));
            return null;
        });
        assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
        assertEquals(SettingsBackup.UndoState.NONE, SettingsBackup.undoState());
    }

    @Test
    public void aSecondImportKeepsOnlyItsOwnPriorSnapshotAndANoopDoesNotReplaceIt() throws Exception {
        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.FIX_PUSH_NOTIFICATIONS, false)));
        assertEquals(0, SettingsBackup.apply(SettingsBackup.parse(SettingsBackup.create())));
        assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
        assertFalse("Undo restored more than the last import", Settings.HIDE_ADVERTISING_ID.savedValue());
        assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
        assertEquals(SettingsBackup.UndoResult.NOTHING, SettingsBackup.undo());
    }

    @Test
    public void unavailableFamiliesAndCapabilitiesAreNamedButKeepTheirSavedChoices() throws Exception {
        // Fix push notifications is in the build but none of its hooks went in.
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_ADVERTISING_ID, PatchFamily.FIX_PUSH_NOTIFICATIONS);
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.ADVERTISING_ID);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false,
                Settings.FIX_PUSH_NOTIFICATIONS, false));
        String unavailable = "Your choice is saved, but this build doesn't include the patch for it.";
        assertEquals("2 settings will change.\n\nHide advertising ID (On to Off)\n\nFix push notifications (On to Off)\n"
                + unavailable, SettingsBackupPreference.previewMessage(snapshot));
        assertEquals(2, SettingsBackup.apply(snapshot));
        assertFalse(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
        assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
        assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());

        // A patch left out of the build altogether is named the same way.
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_ADVERTISING_ID);
        PatchFamily.capabilitiesForTests = null;
        snapshot = SettingsBackup.parse(fileWith(Settings.FIX_PUSH_NOTIFICATIONS, false));
        assertEquals("1 setting will change.\n\nFix push notifications (On to Off)\n" + unavailable,
                SettingsBackupPreference.previewMessage(snapshot));
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertFalse(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
        assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
        assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
    }

    @Test
    public void namedReviewUsesEachCatalogForNamesValuesAndUnavailableChoices() throws Exception {
        PatchFamily.inBuildForTests = Collections.emptySet();
        Settings.FIX_PUSH_NOTIFICATIONS.save(false);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false,
                Settings.FIX_PUSH_NOTIFICATIONS, true));
        for (String language : new String[]{"de", "es", "in-rID", "pt-rBR", "tr"}) {
            RuntimeEnvironment.setQualifiers("+" + language);
            String message = SettingsBackupPreference.previewMessage(snapshot);
            String off = L10n.t("Off");
            String on = L10n.t("On");
            assertFalse(language + " has an English name", message.contains("Hide advertising ID ("));
            assertTrue(language, message.contains(L10n.f("%1$s (%2$s to %3$s)", L10n.t("Hide advertising ID"), on, off)));
            assertTrue(language, message.contains(L10n.f("%1$s (%2$s to %3$s)", L10n.t("Fix push notifications"), off, on)));
            assertTrue(language, message.contains(L10n.t("Your choice is saved, but this build doesn't include the "
                + "patch for it.")));
        }
    }

    @Test
    @Config(sdk = {30, 37})
    public void aFailedUndoRollsBackAndKeepsItsImportedSnapshotForRetry() throws Exception {
        try (FailingStore faults = FailingStore.install(FailingStore.Fault.NONE,
                FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING, FailingStore.Fault.NONE);
             ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            AbstractPreferenceFragment.settingImportInProgress = true;
            SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
            settle();
            Map<String, ?> imported = store();
            try {
                SettingsBackup.undo();
                fail("Undo accepted a failed commit");
            } catch (SettingsBackup.ApplyFailed failed) {
                assertTrue(failed.rolledBack);
            }
            settle();
            assertEquals(imported, store());
            assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
            assertEquals(SettingsBackup.UndoState.AVAILABLE, SettingsBackup.undoState());
            assertTrue("the rollback callback expired Undo", page.findPreference(UNDO_ROW).isEnabled());
            assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
            assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
            assertEquals("import, failed Undo, rollback, retried Undo", 4, faults.editors.get());
            AbstractPreferenceFragment.settingImportInProgress = false;
        }
    }

    @Test
    public void anUndoWhoseRollbackAlsoFailsExpiresAndReportsTheSurvivingValues() throws Exception {
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.NONE,
                FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING, FailingStore.Fault.LOST)) {
            SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
            try {
                SettingsBackup.undo();
                fail("Undo accepted a failed rollback");
            } catch (SettingsBackup.ApplyFailed failed) {
                assertFalse(failed.rolledBack);
            }
            assertTrue("the live switch differs from the surviving default", Settings.HIDE_ADVERTISING_ID.savedValue());
            assertFalse(store().containsKey(Settings.HIDE_ADVERTISING_ID.key));
            assertEquals(SettingsBackup.UndoState.EXPIRED, SettingsBackup.undoState());
            assertEquals(SettingsBackup.UndoResult.EXPIRED, SettingsBackup.undo());
        }
    }

    @Test
    public void aFailedNewImportKeepsThePreviousUndoOnlyIfRollbackRestoresIt() throws Exception {
        for (FailingStore.Fault rollback : new FailingStore.Fault[]{FailingStore.Fault.NONE, FailingStore.Fault.LOST}) {
            SettingsBackup.discardUndo();
            Settings.HIDE_ADVERTISING_ID.resetToDefault();
            Settings.FIX_PUSH_NOTIFICATIONS.resetToDefault();
            try (FailingStore ignored = FailingStore.install(FailingStore.Fault.NONE,
                    FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING, rollback)) {
                SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
                try {
                    SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.FIX_PUSH_NOTIFICATIONS, false)));
                    fail("the second failed import succeeded");
                } catch (SettingsBackup.ApplyFailed failed) {
                    assertEquals(rollback == FailingStore.Fault.NONE, failed.rolledBack);
                }
                if (rollback == FailingStore.Fault.NONE) {
                    assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
                    assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
                    assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
                } else {
                    assertEquals(SettingsBackup.UndoResult.EXPIRED, SettingsBackup.undo());
                    assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
                    assertFalse(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
                }
            }
        }
    }

    // ---- Refusals ------------------------------------------------------------------------------

    @Test
    public void aFileThatIsNotOneJsonObjectIsDamaged() throws Exception {
        String good = SettingsBackup.create();
        for (String bad : new String[]{good.substring(0, good.length() / 2), "[]", good + "{}", good + " x",
                "just some text", good.replace("\"schema\"", "schema"), good + '\0', "",
                // Numbers past what BigDecimal can hold: these used to escape every refusal.
                "{\"format\":\"hushtumblr-settings\",\"schema\":1,\"settings\":{\"later\":1e9999999999}}",
                "{\"format\":\"hushtumblr-settings\",\"schema\":1e9999999999,\"settings\":{}}"}) {
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
        String key = Settings.HIDE_ADVERTISING_ID.key;
        String twice = "{\"format\":\"hushtumblr-settings\",\"schema\":1,\"settings\":{\"" + key + "\":false,\""
                + key + "\":true}}";
        assertEquals(SettingsBackup.Reason.DUPLICATE, reasonFor(twice));
        assertEquals(SettingsBackup.Reason.DUPLICATE, reasonFor(
                "{\"format\":\"hushtumblr-settings\",\"format\":\"hushtumblr-settings\",\"schema\":1,\"settings\":{}}"));
        assertEquals("a name repeated inside a name this build doesn't know", SettingsBackup.Reason.DUPLICATE,
                reasonFor("{\"format\":\"hushtumblr-settings\",\"schema\":1,\"settings\":{\"later\":{\"a\":1,\"a\":2}}}"));
        // The same name in two different objects is two names.
        assertEquals(0, SettingsBackup.parse(
                "{\"format\":\"hushtumblr-settings\",\"schema\":1,\"settings\":{\"" + key + "\":false}}").unknown);
    }

    @Test
    public void aValueThatIsNotTrueOrFalseIsRefused() throws Exception {
        for (Object bad : new Object[]{"false", "true", 0, 1, JSONObject.NULL, new JSONObject(), new org.json.JSONArray(),
                1.5}) {
            JSONObject file = new JSONObject(SettingsBackup.create());
            file.getJSONObject("settings").put(Settings.FIX_PUSH_NOTIFICATIONS.key, bad);
            assertEquals(String.valueOf(bad), SettingsBackup.Reason.VALUE, reasonFor(file.toString()));
        }
    }

    @Test
    public void aFileFromANewerVersionIsRefused() throws Exception {
        JSONObject newer = new JSONObject(SettingsBackup.create()).put("schema", SettingsBackup.SCHEMA + 1);
        assertEquals(SettingsBackup.Reason.SCHEMA, reasonFor(newer.toString()));
        assertEquals(SettingsBackup.Reason.SCHEMA, reasonFor(new JSONObject(SettingsBackup.create()).put("schema", 99).toString()));
        // Anything else where the version goes was never written by HushTumblr.
        String good = SettingsBackup.create();
        for (String version : new String[]{"0", "-1", "\"1\"", "1.0", "1.5", "4294967297", "null", "true", "[1]"}) {
            String bad = good.replace("\"schema\": " + SettingsBackup.SCHEMA, "\"schema\": " + version);
            assertTrue("the replacement missed", !bad.equals(good));
            assertEquals(version, SettingsBackup.Reason.FORMAT, reasonFor(bad));
        }
        JSONObject none = new JSONObject(good);
        none.remove("schema");
        assertEquals(SettingsBackup.Reason.FORMAT, reasonFor(none.toString()));
    }

    @Test
    public void aFileThatIsNotHushTumblrsIsRefused() throws Exception {
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
                .put(Settings.FIX_PUSH_NOTIFICATIONS.key, false)
                .put(BaseSettings.PAUSED.key, true)
                .put(BaseSettings.DEBUG.key, true)
                .put("hushtumblr_kept_by_a_later_version", "whatever that version keeps here");
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file.toString());
        assertEquals(4, snapshot.unknown);
        assertEquals(1, snapshot.changes().size());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertFalse(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
        assertFalse("a file paused HushTumblr", BaseSettings.PAUSED.savedValue());
        assertFalse("a file turned on debug logging", BaseSettings.DEBUG.savedValue());
    }

    @Test
    public void aFileThatNamesSomeSwitchesLeavesTheRestAlone() throws Exception {
        Settings.FIX_PUSH_NOTIFICATIONS.save(false);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false));
        assertEquals(1, snapshot.values.size());
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
        assertFalse("a switch the file didn't name was reset", Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
    }

    @Test
    public void aWaitingImportSurvivesAsABundle() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.HIDE_ADVERTISING_ID, false, Settings.FIX_PUSH_NOTIFICATIONS, true));
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
        SettingsBackup.Snapshot filtered = SettingsBackup.Snapshot.fromBundle(state);
        assertNotNull(filtered);
        assertEquals(read.values, filtered.values);
        // A known value of the wrong type rejects the whole preview, rather than applying part.
        switches.putString(Settings.HIDE_ADVERTISING_ID.key, "false");
        assertNull(SettingsBackup.Snapshot.fromBundle(state));
        assertNull(SettingsBackup.Snapshot.fromBundle(null));
        assertNull(SettingsBackup.Snapshot.fromBundle(new Bundle()));
        Bundle negative = read.toBundle();
        negative.putInt("unknown", -1);
        assertNull(SettingsBackup.Snapshot.fromBundle(negative));
    }

    @Test
    public void malformedRestoredPreviewsAndFilesDoNotChangeSwitchesOrReplaceUndo() throws Exception {
        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)));
        Map<String, ?> before = store();
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(fileWith(Settings.FIX_PUSH_NOTIFICATIONS, false));
        Bundle wrongSwitches = snapshot.toBundle();
        wrongSwitches.putString("switches", "false");
        Bundle wrongCount = snapshot.toBundle();
        wrongCount.putBoolean("unknown", false);
        Bundle badKnownValue = snapshot.toBundle();
        badKnownValue.getBundle("switches").putInt(Settings.FIX_PUSH_NOTIFICATIONS.key, 0);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            ShadowAlertDialog.reset();
            for (Bundle damaged : new Bundle[]{wrongSwitches, wrongCount, badKnownValue}) {
                page.pendingImport = damaged;
                SettingsBackupPreference.showPreview(page);
                assertNull(page.pendingImport);
                assertNull(ShadowAlertDialog.getLatestAlertDialog());
                assertEquals(before, store());
                assertEquals(SettingsBackup.UndoState.AVAILABLE, SettingsBackup.undoState());
            }
        }
        JSONObject wrongFile = new JSONObject(fileWith(Settings.FIX_PUSH_NOTIFICATIONS, false));
        wrongFile.getJSONObject("settings").put(Settings.HIDE_ADVERTISING_ID.key, "true");
        assertEquals(SettingsBackup.Reason.VALUE, reasonFor(wrongFile.toString()));
        assertEquals(before, store());
        assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
        assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
    }

    @Test
    public void anUnmarshalFailureRejectsTheWholeRestoredPreview() throws Exception {
        Bundle bundle = SettingsBackup.parse(fileWith(Settings.HIDE_ADVERTISING_ID, false)).toBundle();
        bundle.getBundle("switches").putParcelable(Settings.FIX_PUSH_NOTIFICATIONS.key, new UnreadableValue());
        Parcel encoded = Parcel.obtain();
        try {
            encoded.writeBundle(bundle);
            encoded.setDataPosition(0);
            Bundle unreadable = encoded.readBundle(UnreadableValue.class.getClassLoader());
            assertNull(SettingsBackup.Snapshot.fromBundle(unreadable));
            assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
            assertEquals(SettingsBackup.UndoState.NONE, SettingsBackup.undoState());
        } finally {
            encoded.recycle();
        }
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
    public void anOversizedStoredListIsRefusedBeforeReplacingAnExportFile() throws Exception {
        String words = "private words ".repeat(SettingsBackup.MAX_BYTES / 10);
        TextSettings.HIDDEN_WORDS.save(words);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            byte[] earlier = "keep the existing file".getBytes(StandardCharsets.UTF_8);
            Uri uri = SettingsFileProvider.put(AUTHORITY, "too-large.json", earlier);
            shadowOf(activity).receiveResult(tap(activity, page, EXPORT_ROW).intent, Activity.RESULT_OK,
                    new Intent().setData(uri));
            settle();
            org.junit.Assert.assertArrayEquals(earlier, SettingsFileProvider.get(uri));
            assertEquals(words, TextSettings.HIDDEN_WORDS.savedValue());
            assertTrue(ShadowToast.getTextOfLatestToast().contains("too large"));
        }
    }

    @Test
    @Config(sdk = {26, 36, 37})
    public void exportedUtf8PreservesLoneSurrogatesAndValidPairs() throws Exception {
        for (String words : new String[]{"x" + (char) 0xd800 + "y", "x" + (char) 0xdc00 + "y",
                "x" + (char) 0xd83d + (char) 0xde00 + "y",
                "x" + (char) 0xd800 + (char) 0xd83d + (char) 0xde00 + "y",
                "x" + (char) 0xd83d + (char) 0xde00 + (char) 0xdc00 + "y"}) {
            SettingsBackup.checkTextBudget(TextSettings.HIDDEN_WORDS, words);
            TextSettings.HIDDEN_WORDS.save(words);
            TextSettings.ALLOWED_WORDS.save(words);
            byte[] bytes = SettingsBackup.create().getBytes(StandardCharsets.UTF_8);
            SettingsBackup.Snapshot file = SettingsBackup.parse(new String(bytes, StandardCharsets.UTF_8));
            assertEquals(words, file.texts.get(TextSettings.HIDDEN_WORDS));
            assertEquals(words, file.texts.get(TextSettings.ALLOWED_WORDS));
        }
    }

    @Test
    public void theWordsBudgetReservesTabsMissingFromTheCurrentBar() throws Exception {
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.save(false);
        TextSettings.TAB_ORDER.save(app.hushtumblr.extension.tumblr.ui.BottomBarTabs.join(
                app.hushtumblr.extension.tumblr.ui.BottomBarTabs.TABS));
        try {
            ReflectionHelpers.setStaticField(app.hushtumblr.extension.tumblr.ui.BottomBarTabs.class,
                    "tumblrOrder", Arrays.asList("Dashboard", "Search", "Notifications", "Account"));
            int low = 0, high = SettingsBackup.MAX_BYTES;
            while (low < high) {
                int middle = (low + high + 1) / 2;
                try {
                    SettingsBackup.checkTextBudget(TextSettings.HIDDEN_WORDS, "x".repeat(middle));
                    low = middle;
                } catch (SettingsBackup.Rejected full) {
                    assertEquals(SettingsBackup.Reason.SIZE, full.reason);
                    high = middle - 1;
                }
            }
            String words = "x".repeat(low);
            assertTrue(words.length() > SettingsBackup.MAX_BYTES / 2);
            TextSettings.HIDDEN_WORDS.save(words);
            byte[] bytes = SettingsBackup.create().getBytes(StandardCharsets.UTF_8);
            assertTrue(bytes.length <= SettingsBackup.MAX_BYTES);
            assertEquals(words, SettingsBackup.parse(new String(bytes, StandardCharsets.UTF_8))
                    .texts.get(TextSettings.HIDDEN_WORDS));
        } finally {
            ReflectionHelpers.setStaticField(app.hushtumblr.extension.tumblr.ui.BottomBarTabs.class,
                    "tumblrOrder", null);
        }
    }

    @Test
    public void aWorkerImportBetweenAWordPreflightAndSaveCannotExceedTheCombinedBudget() throws Exception {
        for (StringSetting edited : Arrays.asList(TextSettings.HIDDEN_WORDS, TextSettings.ALLOWED_WORDS)) {
            TextSettings.HIDDEN_WORDS.save("");
            TextSettings.ALLOWED_WORDS.save("");
            StringSetting imported = edited == TextSettings.HIDDEN_WORDS
                    ? TextSettings.ALLOWED_WORDS : TextSettings.HIDDEN_WORDS;
            String draft = "h".repeat(40000), otherWords = "a".repeat(40000);
            SettingsBackup.checkTextBudget(edited, draft);
            SettingsBackup.Snapshot file = new SettingsBackup.Snapshot(Collections.emptyMap(),
                    Collections.singletonMap(imported, otherWords), Collections.emptyList(), 0);
            java.util.concurrent.ExecutorService worker = java.util.concurrent.Executors.newSingleThreadExecutor();
            try {
                // This is the interleaving formerly possible after the editor's separate budget check.
                assertEquals(Integer.valueOf(1), worker.submit(() -> SettingsBackup.apply(file)).get(5, TimeUnit.SECONDS));
            } finally {
                worker.shutdownNow();
            }
            long revision = edited.savedWriteRevision();
            try {
                SettingsBackup.saveText(edited, draft);
                fail("a stale preflight allowed two oversized lists to be saved");
            } catch (SettingsBackup.Rejected refused) {
                assertEquals(SettingsBackup.Reason.SIZE, refused.reason);
            }
            assertEquals("", edited.savedValue());
            assertEquals("", edited.persistedValue());
            assertEquals(revision, edited.savedWriteRevision());
            assertEquals(otherWords, imported.persistedValue());
            assertEquals(SettingsBackup.UndoState.AVAILABLE, SettingsBackup.undoState());
            assertTrue(SettingsBackup.saveText(edited, "shorter"));
            SettingsBackup.Snapshot exported = SettingsBackup.parse(SettingsBackup.create());
            assertEquals("shorter", exported.texts.get(edited));
            assertEquals(otherWords, exported.texts.get(imported));
        }
    }

    @Test
    public void theWholeUtf8EnvelopeRoundTripsAtItsSizeBoundary() throws Exception {
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.save(false);
        TextSettings.TAB_ORDER.save(app.hushtumblr.extension.tumblr.ui.BottomBarTabs.join(
                app.hushtumblr.extension.tumblr.ui.BottomBarTabs.TABS));
        for (String piece : new String[]{"a", "\u00e9", "\u732b", "\ud83d\ude00", "\"", "\\", "\n", "\t", "\u0001",
                String.valueOf((char) 0xd800), String.valueOf((char) 0xdc00)}) {
            TextSettings.HIDDEN_WORDS.save("");
            int overhead = SettingsBackup.create().getBytes(StandardCharsets.UTF_8).length;
            int unit = piece.length() == 1 && Character.isSurrogate(piece.charAt(0)) ? 6
                    : JSONObject.quote(piece).getBytes(StandardCharsets.UTF_8).length - 2;
            String words = "x" + piece.repeat((SettingsBackup.MAX_BYTES - overhead - 2) / unit) + "y";
            SettingsBackup.checkTextBudget(TextSettings.HIDDEN_WORDS, words);
            assertTrue(TextSettings.HIDDEN_WORDS.save(words));
            String file = SettingsBackup.create();
            int bytes = file.getBytes(StandardCharsets.UTF_8).length;
            assertTrue(bytes <= SettingsBackup.MAX_BYTES);
            assertTrue(bytes > SettingsBackup.MAX_BYTES - unit);
            assertEquals(words, SettingsBackup.parse(file).texts.get(TextSettings.HIDDEN_WORDS));
            try {
                SettingsBackup.checkTextBudget(TextSettings.HIDDEN_WORDS, words + "z".repeat(unit));
                fail("over-budget text was accepted");
            } catch (SettingsBackup.Rejected refused) {
                assertEquals(SettingsBackup.Reason.SIZE, refused.reason);
            }
            assertEquals(words, TextSettings.HIDDEN_WORDS.savedValue());
        }
    }

    @Test
    @Config(sdk = {29, 30, 33, 36, 37})
    public void exportWritesTheFileThroughTheSystemPicker() throws Exception {
        Settings.HIDE_ADVERTISING_ID.save(false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            ShadowActivity.IntentForResult started = tap(activity, page, EXPORT_ROW);
            assertEquals(Intent.ACTION_CREATE_DOCUMENT, started.intent.getAction());
            assertEquals(SettingsBackupPreference.EXPORT, started.requestCode);
            assertEquals("application/json", started.intent.getType());
            assertTrue(started.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            String name = started.intent.getStringExtra(Intent.EXTRA_TITLE);
            assertTrue("the picker would suggest " + name, name.matches("hushtumblr-settings-\\d{8}-\\d{6}\\.json"));

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
    @Config(sdk = {29, 30, 33, 36, 37})
    public void aFileExportedThroughThePickerImportsBackThroughIt() throws Exception {
        Settings.HIDE_ADVERTISING_ID.save(false);
        Settings.FIX_PUSH_NOTIFICATIONS.save(false);
        Map<BooleanSetting, Boolean> exported = new LinkedHashMap<>();
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) exported.put(setting, setting.savedValue());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            Uri uri = SettingsFileProvider.put(AUTHORITY, "round-trip.json", new byte[0]);
            shadowOf(activity).receiveResult(tap(activity, page, EXPORT_ROW).intent, Activity.RESULT_OK,
                    new Intent().setData(uri));
            settle();

            for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.save(!setting.savedValue());
            deliver(activity, tap(activity, page, IMPORT_ROW), new String(SettingsFileProvider.get(uri), StandardCharsets.UTF_8));
            AlertDialog preview = shownPreview();
            String review = String.valueOf(shadowOf(preview).getMessage());
            assertTrue(review.startsWith(SettingsBackup.ALLOWLIST.size() + " settings will change.\n\n"));
            for (Map.Entry<BooleanSetting, Boolean> entry : exported.entrySet()) {
                assertTrue(entry.getKey().key, review.contains(SettingsBackupPreference.switchName(entry.getKey())
                        + " (" + (entry.getValue() ? "Off to On" : "On to Off") + ")"));
            }
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
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
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
    public void importReviewsNamedOldAndNewValuesAndWritesThemOnImport() throws Exception {
        JSONObject file = new JSONObject(fileWith(Settings.HIDE_ADVERTISING_ID, false,
                Settings.FIX_PUSH_NOTIFICATIONS, false));
        file.getJSONObject("settings").put("later_switch", true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            assertEquals("2 settings will change.\n\nHide advertising ID (On to Off)\n\nFix push notifications (On to Off)"
                    + "\n\n1 item in that file isn't a setting this version of "
                    + "HushTumblr knows, so it'll be left out.", String.valueOf(shadowOf(preview).getMessage()));
            assertEquals("the preview wrote something", before, store());
            assertEquals("Import", String.valueOf(preview.getButton(AlertDialog.BUTTON_POSITIVE).getText()));
            assertEquals("Cancel", String.valueOf(preview.getButton(AlertDialog.BUTTON_NEGATIVE).getText()));

            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("Settings imported. 2 settings changed. Restart Tumblr to apply these settings.",
                    ShadowToast.getTextOfLatestToast());
            assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
            assertFalse(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
            assertFalse("the page still shows the switch on",
                    ((SwitchPreference) page.findPreference(Settings.HIDE_ADVERTISING_ID.key)).isChecked());
            assertNull(page.pendingImport);
            assertFalse(AbstractPreferenceFragment.settingImportInProgress);
        }
    }

    @Test
    public void aFileThatChangesNothingSaysSoAndOffersNoImport() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page, IMPORT_ROW), SettingsBackup.create());
            AlertDialog preview = shownPreview();
            assertEquals("Your settings already match that file, so nothing will change.",
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
        String file = fileWith(Settings.FIX_PUSH_NOTIFICATIONS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
            assertNull("a cancelled import said something", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test
    @Config(sdk = {29, 30, 33, 36, 37})
    public void aCancelledPickerChangesNothingAndSaysNothing() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
     * The picker is an activity of its own, and Android may rebuild Tumblr's behind it, the
     * settings dialog and its page with it. The answer still reaches the rebuilt page: Android
     * finds it by the name the framework gave the page that asked, which the rebuilt one keeps.
     */
    @Test
    @Config(sdk = {29, 30, 33, 36, 37})
    public void thePickersAnswerReachesThePageRebuiltBehindIt() throws Exception {
        String file = fileWith(Settings.FIX_PUSH_NOTIFICATIONS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment asked = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            ShadowActivity.IntentForResult started = tap(controller.get(), asked, IMPORT_ROW);

            controller.recreate();
            ShadowLooper.idleMainLooper();
            Activity rebuilt = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(dialogOf(rebuilt));
            assertNotSame("the page wasn't rebuilt", asked, page);

            deliver(rebuilt, started, file);
            AlertDialog preview = shownPreview();
            assertEquals("1 setting will change.\n\nFix push notifications (On to Off)",
                    String.valueOf(shadowOf(preview).getMessage()));
            preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
            assertEquals("Settings imported. 1 setting changed. Restart Tumblr to apply these settings.",
                    ShadowToast.getTextOfLatestToast());
        }
    }

    @Test
    public void anExportAnswerReachesThePageRebuiltBehindIt() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment asked = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
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
        String file = fileWith(Settings.HIDE_ADVERTISING_ID, false, Settings.FIX_PUSH_NOTIFICATIONS, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            deliver(controller.get(), tap(controller.get(), page, IMPORT_ROW), file);
            AlertDialog first = shownPreview();
            String message = String.valueOf(shadowOf(first).getMessage());
            assertEquals("2 settings will change.\n\nHide advertising ID (On to Off)\n\nFix push notifications (On to Off)", message);

            controller.recreate();
            ShadowLooper.idleMainLooper();
            assertFalse("the old preview stayed up over a window that's gone", first.isShowing());
            AlertDialog again = shownPreview();
            assertNotSame(first, again);
            assertEquals(message, String.valueOf(shadowOf(again).getMessage()));
            assertTrue("the rebuild answered the preview", Settings.HIDE_ADVERTISING_ID.savedValue());

            again.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
            assertFalse(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
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
        String key = Settings.HIDE_ADVERTISING_ID.key;
        JSONObject wrongType = new JSONObject(good);
        wrongType.getJSONObject("settings").put(key, "false");
        Map<String, SettingsBackup.Reason> files = new LinkedHashMap<>();
        files.put(good.substring(0, good.length() - 3), SettingsBackup.Reason.DAMAGED);
        files.put(good + repeat(' ', SettingsBackup.MAX_BYTES), SettingsBackup.Reason.SIZE);
        files.put(good.replace("\"" + key + "\": true", "\"" + key + "\": false, \"" + key + "\": false"),
                SettingsBackup.Reason.DUPLICATE);
        files.put(wrongType.toString(), SettingsBackup.Reason.VALUE);
        files.put(new JSONObject(good).put("schema", SettingsBackup.SCHEMA + 1).toString(), SettingsBackup.Reason.SCHEMA);
        files.put(new JSONObject(good).put("format", "something else").toString(), SettingsBackup.Reason.FORMAT);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
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
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
    @Config(sdk = {29, 30, 33, 36, 37})
    public void aFullWorkerQueueLeavesTheRowsUsable() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            byte[] bytes = fileWith(Settings.HIDE_ADVERTISING_ID, false).getBytes(StandardCharsets.UTF_8);
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
            deliver(activity, tap(activity, page, IMPORT_ROW), fileWith(Settings.HIDE_ADVERTISING_ID, false));
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
        }
    }

    /**
     * An import whose worker can't start, after it has claimed the rows, gives them back and
     * changes nothing. That path has no wait to run out, so nothing else would: the rows would
     * stay out of reach until Tumblr restarts. Here the worker queue fills up while the preview
     * is on screen, so Import finds no room.
     */
    @Test
    @Config(sdk = {30, 37})
    public void anImportWhoseWorkerCantStartGivesTheRowsBack() throws Exception {
        String file = fileWith(Settings.HIDE_ADVERTISING_ID, false);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
                assertNull("the failure reached Tumblr", escaped);
                assertEquals("Couldn't start that. Try again in a moment.", ShadowToast.getTextOfLatestToast());
                assertTrue("a switch changed", Settings.HIDE_ADVERTISING_ID.savedValue());
            }
            settle();

            // And the next import goes through.
            deliver(activity, tap(activity, page, IMPORT_ROW), file);
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
        }
    }

    // ---- The app holding the file ------------------------------------------------------------

    private static final String EXPORT_TIMEOUT = "The app holding the settings file is taking too long, so HushTumblr "
            + "stopped waiting. That app may still finish saving it, so check the file before you rely on it.";
    private static final String IMPORT_TIMEOUT =
            "The app holding that file is taking too long, so HushTumblr stopped waiting. Nothing was changed.";
    private static final String STALLED = "The app holding the last settings file still hasn't answered. Try again later.";
    private static final String MISMATCH =
            "The settings file was saved, but it doesn't read back as what was written. Save it again as a new file.";
    private static final String UNCHECKED = "Settings exported. The app holding the file wouldn't let HushTumblr "
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
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
     * the message says only that HushTumblr stopped waiting. While the app still holds a worker
     * nothing new starts, and its late answer shows no preview and says nothing.
     */
    @Test
    @Config(sdk = {29, 30, 33, 36, 37})
    public void aStalledAppGivesTheRowsBackAndItsLateAnswerChangesNothing() throws Exception {
        CountDownLatch release = new CountDownLatch(1);
        SettingsFileProvider.stall = release;
        SettingsFileProvider.ignoresCancel = true;
        Uri uri = SettingsFileProvider.put(AUTHORITY, "stalled.json",
                fileWith(Settings.HIDE_ADVERTISING_ID, false).getBytes(StandardCharsets.UTF_8));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());

            // Once the app has answered, a new read starts.
            deliver(activity, tap(activity, page, IMPORT_ROW), fileWith(Settings.HIDE_ADVERTISING_ID, false));
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
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
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
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            assertTrue("the next test started with the rows busy", page.findPreference(EXPORT_ROW).isEnabled());
            export(activity, page, SettingsFileProvider.put(AUTHORITY, "next.json", new byte[0]));
            assertEquals("Settings exported.", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test
    public void textOnlyImportAndUndoRefreshTheVisibleSearchSummaries() throws Exception {
        TextSettings.HIDDEN_WORDS.save("before");
        String order = app.hushtumblr.extension.tumblr.ui.BottomBarTabs.join(
                app.hushtumblr.extension.tumblr.ui.BottomBarTabs.movedUp(
                        app.hushtumblr.extension.tumblr.ui.BottomBarTabs.choices(""), 2));
        JSONObject file = new JSONObject().put("format", SettingsBackup.FORMAT).put("schema", 2)
                .put("settings", new JSONObject()).put("text", new JSONObject()
                        .put(TextSettings.HIDDEN_WORDS.key, "one\ntwo")
                        .put(TextSettings.TAB_ORDER.key, order));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            page.navigation.search("Words to hide");
            Uri uri = SettingsFileProvider.put(AUTHORITY, "text.json", file.toString().getBytes(StandardCharsets.UTF_8));
            shadowOf(activity).receiveResult(tap(activity, page, IMPORT_ROW).intent, Activity.RESULT_OK,
                    new Intent().setData(uri));
            settle();
            shownPreview().getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertTrue(ShadowToast.getTextOfLatestToast().startsWith("Settings imported. 2 settings changed."));
            assertEquals(HushTumblrPreferenceFragment.wordsSummary("one\ntwo"),
                    page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW).getSummary());
            assertEquals(HushTumblrPreferenceFragment.tabOrderSummary(order),
                    page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW).getSummary());
            click(page.findPreference(UNDO_ROW));
            settle();
            assertEquals(HushTumblrPreferenceFragment.wordsSummary("before"),
                    page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW).getSummary());
            assertEquals(HushTumblrPreferenceFragment.tabOrderSummary(""),
                    page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW).getSummary());
        }
    }

    @Test
    @Config(sdk = {30, 37})
    public void importRecordsRestartDebtAndUndoReturnsToTheRunningChoice() throws Exception {
        AbstractPreferenceFragment.restartPending.clear();
        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_TUMBLR_TV, true)));
        assertTrue(AbstractPreferenceFragment.restartPending.contains(Settings.HIDE_TUMBLR_TV.key));
        assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
        assertFalse(AbstractPreferenceFragment.restartPending.contains(Settings.HIDE_TUMBLR_TV.key));
    }

    @Test
    public void olderWordBackupsRestoreAllFieldsAndNoExceptionsAndUndoRestoresNewChoices() throws Exception {
        Settings.WORDS_REBLOG_TRAIL.save(false);
        Settings.WORDS_TAGS.save(false);
        TextSettings.ALLOWED_WORDS.save("café");
        JSONObject file = new JSONObject().put("format", SettingsBackup.FORMAT).put("schema", 2)
                .put("settings", new JSONObject().put(Settings.HIDE_POSTS_WITH_WORDS.key, true))
                .put("text", new JSONObject().put(TextSettings.HIDDEN_WORDS.key, "cat"));
        SettingsBackup.apply(SettingsBackup.parse(file.toString()));
        assertTrue(Settings.WORDS_CURRENT_TEXT.savedValue());
        assertTrue(Settings.WORDS_REBLOG_TRAIL.savedValue());
        assertTrue(Settings.WORDS_TAGS.savedValue());
        assertTrue(Settings.WORDS_SUMMARY.savedValue());
        assertEquals("", TextSettings.ALLOWED_WORDS.savedValue());
        assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
        assertFalse(Settings.WORDS_REBLOG_TRAIL.savedValue());
        assertFalse(Settings.WORDS_TAGS.savedValue());
        assertEquals("café", TextSettings.ALLOWED_WORDS.savedValue());
    }

    @Test
    public void schemaTwoAllowedWordsAreUnknownAndLeaveUnrelatedWordChoicesAlone() throws Exception {
        Settings.WORDS_TAGS.save(false);
        TextSettings.ALLOWED_WORDS.save("earlier exception");
        for (Object value : new Object[]{JSONObject.NULL, 42, "new exception"}) {
            JSONObject file = new JSONObject().put("format", SettingsBackup.FORMAT).put("schema", 2)
                    .put("settings", new JSONObject())
                    .put("text", new JSONObject().put(TextSettings.ALLOWED_WORDS.key, value));
            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file.toString());
            assertEquals(1, snapshot.unknown);
            assertTrue(snapshot.skipped.isEmpty());
            assertTrue(snapshot.texts.isEmpty());
            assertEquals(0, SettingsBackup.apply(snapshot));
            assertEquals("earlier exception", TextSettings.ALLOWED_WORDS.persistedValue());
            assertFalse(Settings.WORDS_TAGS.savedValue());
        }
    }

    @Test
    public void legacyWordImportsResetExceptionsDespiteUnknownAllowedWordValues() throws Exception {
        for (boolean textOnly : new boolean[]{false, true}) {
            for (Object value : new Object[]{JSONObject.NULL, 42, "new exception"}) {
                Settings.WORDS_TAGS.save(false);
                TextSettings.ALLOWED_WORDS.save("earlier exception");
                JSONObject switches = new JSONObject();
                JSONObject texts = new JSONObject().put(TextSettings.ALLOWED_WORDS.key, value);
                if (textOnly) texts.put(TextSettings.HIDDEN_WORDS.key, "old hidden words");
                else switches.put(Settings.HIDE_POSTS_WITH_WORDS.key, true);
                SettingsBackup.Snapshot snapshot = SettingsBackup.parse(new JSONObject()
                        .put("format", SettingsBackup.FORMAT).put("schema", 2)
                        .put("settings", switches).put("text", texts).toString());
                assertEquals(1, snapshot.unknown);
                assertTrue(snapshot.skipped.isEmpty());
                assertEquals("", snapshot.texts.get(TextSettings.ALLOWED_WORDS));
                SettingsBackup.apply(snapshot);
                assertEquals("", TextSettings.ALLOWED_WORDS.persistedValue());
                assertTrue(Settings.WORDS_TAGS.savedValue());
            }
        }
    }

    @Test
    public void modernMalformedAllowedWordsAreSkippedWithoutResettingWordChoices() throws Exception {
        Settings.WORDS_TAGS.save(false);
        TextSettings.ALLOWED_WORDS.save("earlier exception");
        for (Object value : new Object[]{JSONObject.NULL, 42}) {
            TextSettings.HIDDEN_WORDS.save("earlier hidden words");
            SettingsBackup.Snapshot snapshot = SettingsBackup.parse(new JSONObject()
                    .put("format", SettingsBackup.FORMAT).put("schema", 3)
                    .put("settings", new JSONObject().put(Settings.HIDE_POSTS_WITH_WORDS.key, true))
                    .put("text", new JSONObject().put(TextSettings.HIDDEN_WORDS.key, "new hidden words")
                            .put(TextSettings.ALLOWED_WORDS.key, value)).toString());
            assertEquals(0, snapshot.unknown);
            assertEquals(Collections.singletonList(TextSettings.ALLOWED_WORDS), snapshot.skipped);
            SettingsBackup.apply(snapshot);
            assertEquals("new hidden words", TextSettings.HIDDEN_WORDS.persistedValue());
            assertEquals("earlier exception", TextSettings.ALLOWED_WORDS.persistedValue());
            assertFalse(Settings.WORDS_TAGS.savedValue());
        }
    }

    @Test
    public void olderReblogBackupsKeepTheirOriginalBehaviorAndUndoRestoresTheException() throws Exception {
        for (int schema : new int[]{1, 2}) {
            Settings.KEEP_TAGGED_REBLOGS.save(true);
            Settings.KEEP_REBLOGS_WITH_CONTENT.save(true);
            JSONObject file = new JSONObject().put("format", SettingsBackup.FORMAT).put("schema", schema)
                    .put("settings", new JSONObject().put(Settings.HIDE_REBLOGS.key, true));
            SettingsBackup.apply(SettingsBackup.parse(file.toString()));
            assertTrue(Settings.HIDE_REBLOGS.savedValue());
            assertFalse(Settings.KEEP_TAGGED_REBLOGS.savedValue());
            assertFalse(Settings.KEEP_REBLOGS_WITH_CONTENT.savedValue());
            assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
            assertTrue(Settings.KEEP_TAGGED_REBLOGS.savedValue());
            assertTrue(Settings.KEEP_REBLOGS_WITH_CONTENT.savedValue());
        }
        SettingsBackup.apply(SettingsBackup.parse(new JSONObject().put("format", SettingsBackup.FORMAT)
                .put("schema", 2).put("settings", new JSONObject().put(Settings.HIDE_ADS.key, true)).toString()));
        assertTrue(Settings.KEEP_TAGGED_REBLOGS.savedValue());
        assertTrue(Settings.KEEP_REBLOGS_WITH_CONTENT.savedValue());
    }

    @Test
    public void theAddedContentReblogExceptionRoundTripsAndUndoes() throws Exception {
        String key = Settings.KEEP_REBLOGS_WITH_CONTENT.key;
        assertFalse(new JSONObject(SettingsBackup.create()).getJSONObject("settings").getBoolean(key));
        Settings.KEEP_REBLOGS_WITH_CONTENT.save(true);
        String file = SettingsBackup.create();
        assertTrue(new JSONObject(file).getJSONObject("settings").getBoolean(key));
        Settings.KEEP_REBLOGS_WITH_CONTENT.save(false);
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(file);
        assertEquals(0, snapshot.unknown);
        assertEquals(1, snapshot.switchChanges());
        String preview = SettingsBackupPreference.previewMessage(snapshot);
        assertTrue(preview, preview.contains(L10n.f("%1$s (%2$s to %3$s)", L10n.t("Keep reblogs with added content"),
                L10n.t("Off"), L10n.t("On"))));
        assertEquals(1, SettingsBackup.apply(snapshot));
        assertTrue(Settings.KEEP_REBLOGS_WITH_CONTENT.savedValue());
        assertFalse("the file turned on a switch it carries as off", Settings.HIDE_REBLOGS.savedValue());
        assertEquals("a file read back is the file", file, SettingsBackup.create());
        assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
        assertFalse(Settings.KEEP_REBLOGS_WITH_CONTENT.savedValue());
    }

    @Test
    public void newWordChoicesAndTaggedReblogsRoundTripAndUndo() throws Exception {
        Settings.KEEP_TAGGED_REBLOGS.save(true);
        Settings.WORDS_CURRENT_TEXT.save(false);
        TextSettings.ALLOWED_WORDS.save("café\n猫\nquote\"\\");
        SettingsBackup.Snapshot file = SettingsBackup.parse(SettingsBackup.create());
        Settings.KEEP_TAGGED_REBLOGS.save(false);
        Settings.WORDS_CURRENT_TEXT.save(true);
        TextSettings.ALLOWED_WORDS.save("");
        assertEquals(3, SettingsBackup.apply(file));
        assertTrue(Settings.KEEP_TAGGED_REBLOGS.savedValue());
        assertFalse(Settings.WORDS_CURRENT_TEXT.savedValue());
        assertEquals("café\n猫\nquote\"\\", TextSettings.ALLOWED_WORDS.savedValue());
        assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
        assertFalse(Settings.KEEP_TAGGED_REBLOGS.savedValue());
        assertTrue(Settings.WORDS_CURRENT_TEXT.savedValue());
        assertEquals("", TextSettings.ALLOWED_WORDS.savedValue());
    }

    @Test
    public void aRolledBackImportAddsNoRestartDebt() throws Exception {
        for (FailingStore.Fault fault : new FailingStore.Fault[]{FailingStore.Fault.COMMIT_FALSE,
                FailingStore.Fault.COMMIT_THROWS}) {
            AbstractPreferenceFragment.restartPending.clear();
            try (FailingStore ignored = FailingStore.install(fault)) {
                try {
                    SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_TUMBLR_TV, true)));
                    fail("failed import reported success");
                } catch (SettingsBackup.ApplyFailed expected) {
                    assertTrue(expected.rolledBack);
                }
            }
            assertFalse(Settings.HIDE_TUMBLR_TV.savedValue());
            assertFalse(AbstractPreferenceFragment.restartPending.contains(Settings.HIDE_TUMBLR_TV.key));
        }
    }

    @Test
    public void undoRetainsDebtWhenItRestoresAChoiceDifferentFromTheRunningOne() throws Exception {
        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_TUMBLR_TV, true)));
        SettingsBackup.apply(SettingsBackup.parse(fileWith(Settings.HIDE_TUMBLR_TV, false)));
        assertFalse(AbstractPreferenceFragment.restartPending.contains(Settings.HIDE_TUMBLR_TV.key));
        assertEquals(SettingsBackup.UndoResult.UNDONE, SettingsBackup.undo());
        assertTrue(AbstractPreferenceFragment.restartPending.contains(Settings.HIDE_TUMBLR_TV.key));
    }

    // ---- Helpers -------------------------------------------------------------------------------

    /** Taps a row and hands back the picker it opened. */
    private static ShadowActivity.IntentForResult tap(Activity activity, HushTumblrPreferenceFragment page, String row) {
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
    private static void export(Activity activity, HushTumblrPreferenceFragment page, Uri uri) throws Exception {
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
        SettingsDialog dialog = (SettingsDialog) activity.getFragmentManager().findFragmentByTag("hushtumblr_settings");
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

    /** A valid parcel header whose payload cannot be restored. */
    public static final class UnreadableValue implements Parcelable {
        public static final Parcelable.Creator<UnreadableValue> CREATOR = new Parcelable.Creator<UnreadableValue>() {
            @Override public UnreadableValue createFromParcel(Parcel source) {
                throw new BadParcelableException("unreadable test payload");
            }
            @Override public UnreadableValue[] newArray(int size) { return new UnreadableValue[size]; }
        };

        @Override public int describeContents() { return 0; }
        @Override public void writeToParcel(Parcel destination, int flags) { }
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
