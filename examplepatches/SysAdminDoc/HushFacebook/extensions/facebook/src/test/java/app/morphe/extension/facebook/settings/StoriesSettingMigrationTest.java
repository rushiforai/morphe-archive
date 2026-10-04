/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.content.SharedPreferences;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.FailingStore;

import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, manifest = Config.NONE)
public class StoriesSettingMigrationTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void clearChoices() {
        Settings.HIDE_TOP_STORIES_TRAY.get();
        store().edit().remove(StoriesSetting.LEGACY_KEY).remove(StoriesSetting.TOP_KEY)
                .remove(StoriesSetting.BETWEEN_KEY).commit();
        reload();
    }

    @After public void resetChoices() {
        store().edit().remove(StoriesSetting.LEGACY_KEY).commit();
        Settings.HIDE_TOP_STORIES_TRAY.resetToDefault();
        Settings.HIDE_STORIES_BETWEEN_POSTS.resetToDefault();
    }

    @Test public void freshDefaultsNeedNoMigrationWrite() {
        try (FailingStore counted = FailingStore.install()) {
            StoriesSetting.finishMigration();
            assertEquals(0, counted.editors.get());
            assertTrue(Settings.HIDE_TOP_STORIES_TRAY.defaultValue);
            assertTrue(Settings.HIDE_STORIES_BETWEEN_POSTS.defaultValue);
            assertTrue(Settings.HIDE_TOP_STORIES_TRAY.savedValue());
            assertTrue(Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
        }
    }

    @Test public void eitherExplicitLegacyChoiceMigratesBothValuesInOneCommit() {
        for (boolean previous : new boolean[]{false, true}) {
            store().edit().remove(StoriesSetting.TOP_KEY).remove(StoriesSetting.BETWEEN_KEY)
                    .putBoolean(StoriesSetting.LEGACY_KEY, previous).commit();
            try (FailingStore counted = FailingStore.install()) {
                StoriesSetting.finishMigration();
                assertEquals(1, counted.editors.get());
                assertFalse(store().contains(StoriesSetting.LEGACY_KEY));
                assertEquals(previous, store().getBoolean(StoriesSetting.TOP_KEY, !previous));
                assertEquals(previous, store().getBoolean(StoriesSetting.BETWEEN_KEY, !previous));
                reload();
                assertEquals(previous, Settings.HIDE_TOP_STORIES_TRAY.savedValue());
                assertEquals(previous, Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
                StoriesSetting.finishMigration();
                assertEquals("migration ran twice", 1, counted.editors.get());
            }
        }
    }

    @Test public void existingIndependentValuesAlwaysWinOverTheLegacyChoice() {
        for (String existing : new String[]{StoriesSetting.TOP_KEY, StoriesSetting.BETWEEN_KEY}) {
            String missing = existing.equals(StoriesSetting.TOP_KEY) ? StoriesSetting.BETWEEN_KEY : StoriesSetting.TOP_KEY;
            for (boolean previous : new boolean[]{false, true}) {
                store().edit().putBoolean(StoriesSetting.LEGACY_KEY, previous).putBoolean(existing, !previous)
                        .remove(missing).commit();
                StoriesSetting.finishMigration();
                assertEquals(!previous, store().getBoolean(existing, previous));
                assertEquals(previous, store().getBoolean(missing, !previous));
                assertFalse(store().contains(StoriesSetting.LEGACY_KEY));
            }
        }
    }

    @Test public void resettingAnIndependentChoiceToDefaultNeverRemigratesTheOldOffValue() {
        store().edit().putBoolean(StoriesSetting.LEGACY_KEY, false).commit();
        StoriesSetting.finishMigration();
        reload();
        assertTrue(Settings.HIDE_TOP_STORIES_TRAY.save(true));
        assertFalse(store().contains(StoriesSetting.TOP_KEY));
        StoriesSetting.finishMigration();
        reload();
        assertTrue(Settings.HIDE_TOP_STORIES_TRAY.savedValue());
        assertFalse(Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
    }

    @Test public void failedStartupWritesPreserveTheOldChoiceAndCanBeRetried() {
        for (FailingStore.Fault fault : new FailingStore.Fault[]{FailingStore.Fault.EDIT_THROWS,
                FailingStore.Fault.STAGE_THROWS, FailingStore.Fault.LOST, FailingStore.Fault.COMMIT_THROWS,
                FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING}) {
            clearChoices();
            store().edit().putBoolean(StoriesSetting.LEGACY_KEY, false).commit();
            try (FailingStore failed = FailingStore.install(fault)) {
                StoriesSetting.migrate();
                reload();
                assertFalse(fault.name(), Settings.HIDE_TOP_STORIES_TRAY.savedValue());
                assertFalse(fault.name(), Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
            }
            StoriesSetting.finishMigration();
            assertFalse(fault.name(), store().contains(StoriesSetting.LEGACY_KEY));
            reload();
            assertFalse(Settings.HIDE_TOP_STORIES_TRAY.savedValue());
            assertFalse(Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
        }
    }

    @Test public void aLaterIndividualSaveFinishesAFailedMigrationWithoutLosingTheOtherChoice() {
        leaveFailedMigration();
        assertTrue(Settings.HIDE_TOP_STORIES_TRAY.save(true));
        assertFalse(store().contains(StoriesSetting.LEGACY_KEY));
        reload();
        assertTrue(Settings.HIDE_TOP_STORIES_TRAY.savedValue());
        assertFalse(Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
    }

    @Test public void aLaterSparseImportFinishesAFailedMigrationWithoutLosingTheOtherChoice() throws Exception {
        leaveFailedMigration();
        JSONObject values = new JSONObject().put(StoriesSetting.TOP_KEY, true);
        String file = new JSONObject().put("format", SettingsBackup.FORMAT).put("schema", 1)
                .put("settings", values).toString();
        assertEquals(1, SettingsBackup.apply(SettingsBackup.parse(file)));
        assertFalse(store().contains(StoriesSetting.LEGACY_KEY));
        reload();
        assertTrue(Settings.HIDE_TOP_STORIES_TRAY.savedValue());
        assertFalse(Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
    }

    @Test public void thePreferenceFrameworksDefaultCleanupAlsoFinishesAFailedMigration() {
        leaveFailedMigration();
        // Android's Preference stores the selected value before the framework updates Setting.
        store().edit().putBoolean(StoriesSetting.TOP_KEY, true).commit();
        BooleanSetting.privateSetValue(Settings.HIDE_TOP_STORIES_TRAY, true);
        assertFalse(store().contains(StoriesSetting.LEGACY_KEY));
        assertFalse(store().contains(StoriesSetting.TOP_KEY));
        reload();
        assertTrue(Settings.HIDE_TOP_STORIES_TRAY.savedValue());
        assertFalse(Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
    }

    @Test public void aFailedIndividualSaveRollsBothChoicesBackAfterStartupMigrationFailed() {
        for (FailingStore.Fault fault : new FailingStore.Fault[]{FailingStore.Fault.EDIT_THROWS,
                FailingStore.Fault.STAGE_THROWS, FailingStore.Fault.LOST, FailingStore.Fault.COMMIT_THROWS,
                FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.COMMIT_THROWS_AFTER_LANDING}) {
            clearChoices();
            leaveFailedMigration();
            try (FailingStore failed = FailingStore.install(fault)) {
                assertFalse(fault.name(), Settings.HIDE_TOP_STORIES_TRAY.save(true));
            }
            reload();
            assertFalse(fault.name(), Settings.HIDE_TOP_STORIES_TRAY.savedValue());
            assertFalse(fault.name(), Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
        }
    }

    @Test public void aSecondaryProcessReadsTheLegacyChoiceWithoutWritingIt() {
        store().edit().putBoolean(StoriesSetting.LEGACY_KEY, false).commit();
        var app = RuntimeEnvironment.getApplication().getApplicationInfo();
        String previous = app.processName;
        app.processName = RuntimeEnvironment.getApplication().getPackageName() + ":secondary";
        try (FailingStore counted = FailingStore.install()) {
            StoriesSetting.finishMigration();
            reload();
            assertEquals(0, counted.editors.get());
            assertTrue(store().contains(StoriesSetting.LEGACY_KEY));
            assertFalse(Settings.HIDE_TOP_STORIES_TRAY.savedValue());
            assertFalse(Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
            assertFalse(Settings.HIDE_TOP_STORIES_TRAY.save(true));
        } finally {
            app.processName = previous;
        }
    }

    private static void leaveFailedMigration() {
        store().edit().putBoolean(StoriesSetting.LEGACY_KEY, false).commit();
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.LOST)) {
            StoriesSetting.migrate();
        }
        reload();
        assertTrue(store().contains(StoriesSetting.LEGACY_KEY));
        assertFalse(Settings.HIDE_TOP_STORIES_TRAY.savedValue());
        assertFalse(Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
    }

    private static SharedPreferences store() {
        return Setting.preferences.preferences;
    }

    private static void reload() {
        ((StoriesSetting) Settings.HIDE_TOP_STORIES_TRAY).load();
        ((StoriesSetting) Settings.HIDE_STORIES_BETWEEN_POSTS).load();
    }
}
