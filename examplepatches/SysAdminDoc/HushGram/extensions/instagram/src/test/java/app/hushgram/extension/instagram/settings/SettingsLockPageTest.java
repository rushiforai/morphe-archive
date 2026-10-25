/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import app.hushgram.extension.instagram.settings.SettingsLock.State;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.BooleanSetting;
import app.hushgram.extension.shared.settings.PauseForTests;

/**
 * Lock these settings (#301) on the page: locked, every row that changes something is greyed out,
 * Pause and Quick setups included, while Debug logging, the exports and the lock itself stay open.
 * The rows come back when the wait is over and lock again when the open time ends.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SettingsLockPageTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private static final long MINUTE = 60_000L;
    private final SettingsLockTest.Phone phone = new SettingsLockTest.Phone();

    @Before public void prepare() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        // Every row on one page, so a test reads them without opening a category.
        Settings.CATEGORY_PAGES.save(false);
        Settings.SETTINGS_LOCK_HOURS.resetToDefault();
        Settings.SETTINGS_LOCK_ASKED.resetToDefault();
        BaseSettings.PAUSED.save(false);
        BaseSettings.DEBUG.save(false);
        PauseForTests.resume();
        SettingsLock.clocks = phone;
        ShadowToast.reset();
    }

    @After public void restore() {
        SettingsLock.clocks = SettingsLock.PHONE;
        Settings.SETTINGS_LOCK_HOURS.resetToDefault();
        Settings.SETTINGS_LOCK_ASKED.resetToDefault();
        for (BooleanSetting setting : QuickSetupKeys.quiet().keySet()) setting.resetToDefault();
        BaseSettings.PAUSED.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        PauseForTests.resume();
        Settings.CATEGORY_PAGES.resetToDefault();
        PatchFamily.inBuildForTests = null;
        ScreenColors.shown = null;
    }

    @Test public void theLockSitsRightUnderPause() {
        try (ActivityController<Activity> host = Robolectric.buildActivity(Activity.class).setup().visible()) {
            List<Preference> rows = rowsOf(DownloadSettingsTest.pageIn(host));
            int pause = indexOfKey(rows, BaseSettings.PAUSED.key);
            assertTrue("no Pause row", pause >= 0);
            assertEquals(pause + 1, indexOfKey(rows, HushgramPreferenceFragment.LOCK_ROW_KEY));
            assertEquals("Lock these settings", String.valueOf(rows.get(pause + 1).getTitle()));
        }
    }

    @Test public void lockingGreysEveryChangeButLeavesTheExitsOpen() {
        try (ActivityController<Activity> host = Robolectric.buildActivity(Activity.class).setup().visible()) {
            HushgramPreferenceFragment page = DownloadSettingsTest.pageIn(host);
            Preference lock = lockRow(page);
            tap(lock);
            ListView waits = latest().getListView();
            assertEquals(5, waits.getAdapter().getCount());
            assertEquals("1 hour", String.valueOf(waits.getAdapter().getItem(0)));
            assertEquals("24 hours", String.valueOf(waits.getAdapter().getItem(2)));
            assertEquals("72 hours", String.valueOf(waits.getAdapter().getItem(4)));
            pick(waits, 0);
            assertEquals(State.LOCKED, SettingsLock.state());
            assertEquals("Settings locked", ShadowToast.getTextOfLatestToast());

            assertFalse(row(page, Settings.HIDE_REELS_TOP_BAR.key).isEnabled());
            assertFalse("Pause would undo the lock", row(page, BaseSettings.PAUSED.key).isEnabled());
            assertFalse("a settings file would undo the lock", page.importConfiguration.isEnabled());
            assertFalse(row(page, HushgramPreferenceFragment.QUICK_SETUPS_ROW_KEY).isEnabled());
            assertTrue(row(page, BaseSettings.DEBUG.key).isEnabled());
            assertTrue(page.exportConfiguration.isEnabled());
            assertTrue(lock.isEnabled());
            assertEquals("Ask to unlock", String.valueOf(lock.getTitle()));

            // Another refresh, the way a search or a switch's own rules run, keeps them greyed.
            page.searchSettings("reels");
            page.searchSettings("");
            assertFalse(row(page, Settings.HIDE_REELS_TOP_BAR.key).isEnabled());
            assertFalse(row(page, BaseSettings.PAUSED.key).isEnabled());
        }
    }

    @Test public void aQuickSetupChangesNothingWhileLocked() {
        try (ActivityController<Activity> host = Robolectric.buildActivity(Activity.class).setup().visible()) {
            HushgramPreferenceFragment page = DownloadSettingsTest.pageIn(host);
            assertTrue(SettingsLock.lock(6));
            Map<BooleanSetting, Boolean> quiet = QuickSetupKeys.quiet();
            List<Boolean> before = new ArrayList<>();
            for (BooleanSetting setting : quiet.keySet()) before.add(setting.savedValue());
            assertEquals(0, page.applyQuickSetup(quiet));
            int i = 0;
            for (BooleanSetting setting : quiet.keySet()) assertEquals(setting.key, before.get(i++), setting.savedValue());
            assertEquals("These settings are locked. Ask to unlock first.", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test public void askingOpensThePageAfterTheWaitAndItLocksAgainTenMinutesLater() {
        try (ActivityController<Activity> host = Robolectric.buildActivity(Activity.class).setup().visible()) {
            HushgramPreferenceFragment page = DownloadSettingsTest.pageIn(host);
            assertTrue(SettingsLock.lock(1));
            page.showLock();
            Preference lock = lockRow(page);
            tap(lock);
            assertEquals(State.WAITING, SettingsLock.state());
            assertEquals("Unlock asked", String.valueOf(lock.getTitle()));
            assertTrue(ShadowToast.getTextOfLatestToast().startsWith("These settings open at "));

            // Setting the time of day forward doesn't open it.
            phone.wall += 2 * 60 * MINUTE;
            phone.pass(59 * MINUTE);
            page.showLock();
            assertFalse(row(page, Settings.HIDE_REELS_TOP_BAR.key).isEnabled());

            phone.pass(MINUTE);
            page.showLock();
            assertEquals(State.OPEN, SettingsLock.state());
            assertEquals("Settings are open", String.valueOf(lock.getTitle()));
            assertTrue(row(page, Settings.HIDE_REELS_TOP_BAR.key).isEnabled());
            assertTrue(row(page, BaseSettings.PAUSED.key).isEnabled());
            assertTrue(page.importConfiguration.isEnabled());
            assertTrue(row(page, HushgramPreferenceFragment.QUICK_SETUPS_ROW_KEY).isEnabled());

            phone.pass(SettingsLock.OPEN_MS);
            page.showLock();
            assertEquals(State.LOCKED, SettingsLock.state());
            assertEquals("Ask to unlock", String.valueOf(lock.getTitle()));
            assertFalse(row(page, Settings.HIDE_REELS_TOP_BAR.key).isEnabled());
            assertEquals("the spent ask is dropped", "", Settings.SETTINGS_LOCK_ASKED.savedValue());
        }
    }

    @Test public void whileOpenTheLockCanBeTurnedOff() {
        try (ActivityController<Activity> host = Robolectric.buildActivity(Activity.class).setup().visible()) {
            HushgramPreferenceFragment page = DownloadSettingsTest.pageIn(host);
            assertTrue(SettingsLock.lock(1));
            assertTrue(SettingsLock.ask());
            phone.pass(60 * MINUTE);
            page.showLock();
            tap(lockRow(page));
            ListView choices = latest().getListView();
            assertEquals(6, choices.getAdapter().getCount());
            assertEquals("Turn the lock off", String.valueOf(choices.getAdapter().getItem(5)));
            pick(choices, 5);
            assertEquals(State.OFF, SettingsLock.state());
            assertEquals("Lock turned off", ShadowToast.getTextOfLatestToast());
            assertEquals("Lock these settings", String.valueOf(lockRow(page).getTitle()));

            phone.pass(SettingsLock.OPEN_MS);
            page.showLock();
            assertTrue(row(page, Settings.HIDE_REELS_TOP_BAR.key).isEnabled());
        }
    }

    @Test public void aRunningWaitCanBeStoppedAndTheSettingsStayLocked() {
        try (ActivityController<Activity> host = Robolectric.buildActivity(Activity.class).setup().visible()) {
            HushgramPreferenceFragment page = DownloadSettingsTest.pageIn(host);
            assertTrue(SettingsLock.lock(72));
            assertTrue(SettingsLock.ask());
            phone.pass(60 * MINUTE);
            page.showLock();
            Preference lock = lockRow(page);
            assertTrue(String.valueOf(lock.getSummary()), String.valueOf(lock.getSummary()).endsWith("Tap to stop the wait."));

            // Keep waiting leaves the wait running.
            tap(lock);
            latest().getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertEquals(State.WAITING, SettingsLock.state());

            tap(lock);
            AlertDialog asked = latest();
            assertEquals("Stop the wait", String.valueOf(asked.getButton(AlertDialog.BUTTON_POSITIVE).getText()));
            asked.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertEquals(State.LOCKED, SettingsLock.state());
            assertEquals("Wait stopped. These settings stay locked.", ShadowToast.getTextOfLatestToast());
            assertEquals("Ask to unlock", String.valueOf(lock.getTitle()));
            assertFalse(row(page, Settings.HIDE_REELS_TOP_BAR.key).isEnabled());

            // The 71 hours the stopped wait had left don't open anything.
            phone.pass(72 * 60 * MINUTE);
            page.showLock();
            assertEquals(State.LOCKED, SettingsLock.state());
            assertFalse(row(page, Settings.HIDE_REELS_TOP_BAR.key).isEnabled());
        }
    }

    @Test public void whilePausedTurningHushGramBackOnStaysOpen() {
        BaseSettings.PAUSED.save(true);
        try (ActivityController<Activity> host = Robolectric.buildActivity(Activity.class).setup().visible()) {
            HushgramPreferenceFragment page = DownloadSettingsTest.pageIn(host);
            assertTrue(SettingsLock.lock(24));
            page.showLock();
            assertTrue(row(page, BaseSettings.PAUSED.key).isEnabled());
            assertFalse(row(page, Settings.HIDE_REELS_TOP_BAR.key).isEnabled());
        }
    }

    private static Preference lockRow(HushgramPreferenceFragment page) {
        return row(page, HushgramPreferenceFragment.LOCK_ROW_KEY);
    }

    private static Preference row(HushgramPreferenceFragment page, String key) {
        for (Preference row : rowsOf(page)) {
            if (key.equals(row.getKey())) return row;
        }
        Preference found = page.findPreference(key);
        assertNotNull("no row " + key, found);
        return found;
    }

    private static void tap(Preference row) {
        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        ShadowLooper.idleMainLooper();
    }

    private static AlertDialog latest() {
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull("no dialog", dialog);
        return dialog;
    }

    private static void pick(ListView list, int at) {
        assertTrue(list.performItemClick(list.getAdapter().getView(at, null, list), at, list.getItemIdAtPosition(at)));
        ShadowLooper.idleMainLooper();
    }

    private static List<Preference> rowsOf(HushgramPreferenceFragment page) {
        List<Preference> rows = new ArrayList<>();
        collect(page.getPreferenceScreen(), rows);
        return rows;
    }

    private static void collect(PreferenceGroup group, List<Preference> rows) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference preference = group.getPreference(i);
            if (preference instanceof PreferenceGroup) collect((PreferenceGroup) preference, rows);
            else rows.add(preference);
        }
    }

    private static int indexOfKey(List<Preference> rows, String key) {
        for (int i = 0; i < rows.size(); i++) {
            if (key.equals(rows.get(i).getKey())) return i;
        }
        return -1;
    }
}
