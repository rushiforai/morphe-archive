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
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.SwitchPreference;
import android.view.View;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.settings.BaseSettings;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.FailingStore;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.shared.settings.Setting;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

/** Exercises the actual dialog host and its filtered view of the original preference model. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "w390dp-h844dp-night-xhdpi")
@SuppressWarnings("deprecation")
public class SettingsNavigationTest {
    /**
     * The home page's rows with every patch in the build: Status, Quick setups, the Browse settings
     * heading over Feed, Posts, Interface and Privacy, the More settings heading over Links,
     * Notifications, Tumblr's own settings, Updates, Pause, backup and diagnostics and About, then
     * Report a problem and Support HushTumblr. Every page is one tap from home.
     */
    private static final int HOME_ROWS = 16;
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private ActivityController<Activity> controller;
    private SettingsDialog dialog;
    private HushTumblrPreferenceFragment page;
    /** Whether a test put the window in touch mode, which the next test's window would start in. */
    private boolean touch;

    @Before public void open() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PauseForTests.resume();
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
    }

    @After public void close() {
        if (touch) touchMode(false);
        controller.close();
        PatchFamily.inBuildForTests = null;
        PatchFamily.capabilitiesForTests = null;
        Settings.HIDE_ADVERTISING_ID.resetToDefault();
        Settings.FIX_PUSH_NOTIFICATIONS.resetToDefault();
        Settings.HIDE_TUMBLR_TV.resetToDefault();
        SettingsNavigation.HIDE_QUICK_SETUPS.resetToDefault();
        BaseSettings.PAUSED.resetToDefault();
        app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.remove(
                Settings.HIDE_ADVERTISING_ID.key);
        app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.remove(
                BaseSettings.DEBUG.key);
        PauseForTests.resume();
    }

    @Test @Config(sdk = {29, 30, 33, 36, 37})
    public void homeAndEveryCategoryAreReachableWithoutRemovingTheModel() {
        assertNotNull(page.navigation);
        assertEquals(HOME_ROWS, list().getCount());
        // Feed, Posts, Interface, Privacy, Links, Notifications, Tumblr's own settings, Updates,
        // Pause, backup and diagnostics, and About.
        assertEquals(10, page.sections().size());
        int total = page.getPreferenceScreen().getRootAdapter().getCount();
        for (Preference section : page.sections()) {
            assertTrue(page.navigation.open(section));
            assertEquals(((PreferenceCategory) section).getPreferenceCount(), list().getCount());
            assertEquals(total, page.getPreferenceScreen().getRootAdapter().getCount());
            assertNotNull(page.findPreference(Settings.HIDE_ADVERTISING_ID.key));
            assertTrue(page.navigation.back());
            while (page.navigation.back()) { }
        }
        assertEquals(HOME_ROWS, list().getCount());
    }

    @Test public void theHomePageEndsWithSupportWhichOpensKoFi() {
        Map<String, Object> before = savedValues();
        int last = list().getCount() - 1;
        Preference row = (Preference) list().getItemAtPosition(last);
        assertEquals(HushTumblrPreferenceFragment.SUPPORT, row.getKey());
        assertEquals("Support HushTumblr", String.valueOf(row.getTitle()));
        assertNull("the Ko-fi row carries a title and nothing under it", row.getSummary());
        assertEquals("Report a problem", String.valueOf(((Preference) list().getItemAtPosition(last - 1)).getTitle()));
        assertEquals("About", String.valueOf(((Preference) list().getItemAtPosition(last - 2)).getTitle()));
        assertTrue(list().getAdapter().isEnabled(last));

        tap(HushTumblrPreferenceFragment.SUPPORT);
        Intent started = org.robolectric.Shadows.shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull("nothing opened", started);
        assertEquals(Intent.ACTION_VIEW, started.getAction());
        assertEquals("https://ko-fi.com/X8K126YVER", started.getDataString());
        assertTrue(started.hasCategory(Intent.CATEGORY_BROWSABLE));
        assertTrue("the page would open inside Tumblr's task",
                (started.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        assertNull(started.getComponent());
        assertEquals("the tap left the home page", last + 1, list().getCount());

        org.robolectric.Shadows.shadowOf(org.robolectric.RuntimeEnvironment.getApplication()).checkActivities(true);
        tap(HushTumblrPreferenceFragment.SUPPORT);
        assertEquals("No app on this phone can open the link. The address is " + L10n.isolate("ko-fi.com/X8K126YVER") + ".",
                ShadowToast.getTextOfLatestToast());
        assertFalse(controller.get().isFinishing());
        assertEquals(before, savedValues());
    }

    @Test public void categoryClickChangesOnlyTheSettingWhoseRowWasTapped() {
        assertTrue(page.navigation.open(page.findPreference(Settings.HIDE_ADVERTISING_ID.key)));
        assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
        tap(Settings.HIDE_ADVERTISING_ID.key);
        assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
        assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
    }

    @Test @Config(sdk = {30, 37})
    public void overviewPauseAndUndoUpdateTheSavedSwitchAndRestartNotice() {
        layout(dialog.getView());
        android.widget.Button action = statusAction();
        assertEquals("Pause", action.getText().toString());
        assertTrue(action.getMinimumWidth() <= Math.round(48 * action.getResources().getDisplayMetrics().density));
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertTrue(BaseSettings.PAUSED.savedValue());
        assertTrue(((Preference) list().getItemAtPosition(0)).getSummary().toString()
                .contains("pauses when Tumblr restarts"));
        action = statusAction();
        assertEquals("Undo", action.getText().toString());
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertEquals("Pause", statusAction().getText().toString());
        assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());
    }

    @Test @Config(sdk = {30, 37})
    public void overviewPauseUsesTheSwitchWorkerAndPreventsRepeatedSaves() {
        List<Runnable> writes = new ArrayList<>();
        HushTumblrPreferenceFragment.editWorkerForTests = writes::add;
        try {
            layout(dialog.getView());
            statusAction().performClick();
            assertFalse(BaseSettings.PAUSED.savedValue());
            assertEquals(1, writes.size());
            layout(dialog.getView());
            assertFalse(statusAction().isEnabled());
            statusAction().performClick();
            assertEquals(1, writes.size());
            writes.remove(0).run();
            ShadowLooper.idleMainLooper();
            layout(dialog.getView());
            assertTrue(BaseSettings.PAUSED.savedValue());
            assertEquals("Undo", statusAction().getText().toString());
            assertTrue(statusAction().isEnabled());
        } finally {
            for (Runnable write : writes) write.run();
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
        }
    }

    /** A Resume the store can't keep leaves the pause on screen, in storage and in the switch, and says so. */
    @Test public void aResumeTheStoreCanNotKeepLeavesThePauseAndSaysSo() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView());
        assertEquals("Resume", statusAction().getText().toString());
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS, FailingStore.Fault.COMMIT_THROWS)) {
            statusAction().performClick();
            ShadowLooper.idleMainLooper();
        }
        layout(dialog.getView());
        assertEquals("Couldn't turn HushTumblr back on. Try again.", ShadowToast.getTextOfLatestToast());
        assertTrue(BaseSettings.PAUSED.savedValue());
        assertTrue(Setting.preferences.preferences.getBoolean(BaseSettings.PAUSED.key, false));
        assertTrue(((SwitchPreference) page.findPreference(BaseSettings.PAUSED.key)).isChecked());
        assertEquals("Resume", statusAction().getText().toString());

        // The same tap with the store working turns it back on from the next start.
        statusAction().performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertFalse(((SwitchPreference) page.findPreference(BaseSettings.PAUSED.key)).isChecked());
        assertEquals("Undo", statusAction().getText().toString());
    }

    /** A marker Resume can't remove keeps the Pause switch on, and the card says both steps. */
    @Test public void aMarkerResumeCanNotRemoveKeepsTheSwitchAndSaysWhatToDo() throws Exception {
        File marker = HushTumblrPause.markerFile(controller.get());
        File held = new File(marker, "held");
        // A folder with something in it can't be deleted.
        assertTrue(marker.mkdirs() && held.createNewFile());
        try {
            BaseSettings.PAUSED.save(true);
            PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
            recreate();
            layout(dialog.getView());
            statusAction().performClick();
            ShadowLooper.idleMainLooper();
            layout(dialog.getView());
            assertTrue(BaseSettings.PAUSED.savedValue());
            assertEquals("Resume", statusAction().getText().toString());
            String line = String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary());
            assertTrue(line, line.contains("couldn't be removed") && line.endsWith("then tap Resume again."));
        } finally {
            held.delete();
            marker.delete();
        }
    }

    private static final String PAUSED_LINE = "Until you resume, every switch but Debug logging acts as if it "
            + "were off. Changes made when you patched stay in.";

    /**
     * Paused, a category page opens with a short line that says so, and the saved switches keep
     * showing what was chosen. Resume and Undo act from that line, the page stays where it was, and
     * Back returns to the overview where it was.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void aPausedCategoryPageSaysSoAndKeepsItsPlaceThroughResumeAndUndo() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView(), 1200);
        list().scrollListBy(120);
        int homePosition = list().getFirstVisiblePosition();
        int homeOffset = list().getChildAt(0).getTop();

        page.navigation.navigate("Privacy");
        layout(dialog.getView(), 1200);
        Preference line = (Preference) list().getItemAtPosition(0);
        assertEquals("HushTumblr is paused", String.valueOf(line.getTitle()));
        assertEquals(PAUSED_LINE, String.valueOf(line.getSummary()));
        assertFalse("the line reads as a button of its own", list().getAdapter().isEnabled(0));
        assertTrue("a saved choice was changed to look paused",
                ((SwitchPreference) page.findPreference(Settings.HIDE_ADVERTISING_ID.key)).isChecked());
        assertTrue(Settings.HIDE_ADVERTISING_ID.savedValue());

        list().scrollListBy(40);
        layout(dialog.getView(), 1200);
        int position = list().getFirstVisiblePosition();
        int offset = list().getChildAt(0).getTop();
        android.widget.Button action = pageAction();
        assertEquals("Resume", action.getText().toString());
        assertTrue(action.getMinimumHeight() >= Math.round(48 * action.getResources().getDisplayMetrics().density));
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView(), 1200);
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertEquals("HushTumblr turns back on when Tumblr restarts.",
                String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary()));
        assertTrue("Resume left the page", contains(Settings.HIDE_ADVERTISING_ID.key));
        assertEquals(position, list().getFirstVisiblePosition());
        assertEquals(offset, list().getChildAt(0).getTop());

        action = pageAction();
        assertEquals("Undo", action.getText().toString());
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView(), 1200);
        assertTrue(BaseSettings.PAUSED.savedValue());
        assertEquals(PAUSED_LINE, String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary()));
        assertEquals("Resume", pageAction().getText().toString());
        assertEquals(position, list().getFirstVisiblePosition());
        assertEquals(offset, list().getChildAt(0).getTop());

        assertTrue(page.navigation.back());
        layout(dialog.getView(), 1200);
        assertEquals(homePosition, list().getFirstVisiblePosition());
        assertEquals(homeOffset, list().getChildAt(0).getTop());
    }

    /** Cancelling a pending Pause must not clamp a page after its status line disappears. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void undoPendingPauseKeepsTheCategoryOffset() throws Exception {
        pendingPauseUndoKeepsOffset("Pause, backup and diagnostics", null, false);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void undoPendingPauseKeepsTheSearchOffset() throws Exception {
        pendingPauseUndoKeepsOffset(null, "backup", false);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void undoPendingPauseKeepsTheOffsetWithAnExistingRestartNotice() throws Exception {
        pendingPauseUndoKeepsOffset("Pause, backup and diagnostics", null, true);
    }

    private void pendingPauseUndoKeepsOffset(String route, String search, boolean restart) throws Exception {
        int normalBottomPadding = list().getPaddingBottom();
        if (restart) app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                BaseSettings.DEBUG.key);
        BaseSettings.PAUSED.save(true);
        if (search == null) page.navigation.navigate(route);
        else findSearch(dialog.getView()).setText(search);
        layout(dialog.getView(), 1200);
        list().scrollListBy(40);
        layout(dialog.getView(), 1200);
        int position = list().getFirstVisiblePosition();
        int offset = list().getChildAt(0).getTop();
        assertTrue("regression needs a genuinely scrolled page", offset < 0);
        assertEquals("Undo", pageAction().getText().toString());
        pageAction().performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView(), 1200);
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertFalse(HushTumblrPause.isPaused());
        assertEquals(position, list().getFirstVisiblePosition());
        assertEquals(offset, list().getChildAt(0).getTop());
        if (restart) assertEquals("Restart Tumblr to apply this change",
                String.valueOf(((Preference) list().getItemAtPosition(0)).getTitle()));
        else assertFalse(titles().contains("HushTumblr is on"));
        capture("undo-pending-" + (restart ? "restart" : search == null ? "category" : "search"), 1200);

        page.navigation.navigate("About");
        layout(dialog.getView(), 1200);
        assertEquals(normalBottomPadding, list().getPaddingBottom());
        assertEquals(0, list().getFirstVisiblePosition());
        findSearch(dialog.getView()).setText("Hide");
        layout(dialog.getView(), 1200);
        assertEquals(normalBottomPadding, list().getPaddingBottom());
        assertFalse(titles().contains("HushTumblr is on"));
    }

    /** Search results say it too, and a page with nothing Pause turns off, like About, doesn't. */
    @Test public void pausedSearchSaysSoAndPagesPauseDoesNotReachStayAsTheyAre() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.CRASH_LOOP);
        recreate();
        findSearch(dialog.getView()).setText("Hide advertising");
        ShadowLooper.idleMainLooper();
        assertEquals(PAUSED_LINE, String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary()));
        assertTrue(contains(Settings.HIDE_ADVERTISING_ID.key));
        page.navigation.back();
        page.navigation.navigate("Links");
        // Android's link settings and a note about them: nothing here is Pause's to turn off.
        assertEquals("Links has nothing Pause turns off", categoryCount("Links"), list().getCount());
        assertFalse(contains(Settings.HIDE_ADVERTISING_ID.key));
        while (page.navigation.back()) { }
        // The push notifications switch follows Pause, so its page starts with the line.
        page.navigation.navigate("Notifications");
        assertEquals("Notifications has a Pause-controlled switch", categoryCount("Notifications") + 1, list().getCount());
        assertTrue(contains(Settings.FIX_PUSH_NOTIFICATIONS.key));
        assertEquals(PAUSED_LINE, String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary()));
        while (page.navigation.back()) { }
        page.navigation.navigate("About");
        assertEquals("About", categoryCount("About"), list().getCount());
        while (page.navigation.back()) { }
        // The Privacy page holds a switch Pause turns off, so it starts with the line.
        page.navigation.navigate("Privacy");
        assertEquals("Privacy has a Pause-controlled switch", categoryCount("Privacy") + 1, list().getCount());
        assertEquals("HushTumblr is paused", String.valueOf(((Preference) list().getItemAtPosition(0)).getTitle()));
        assertEquals(PAUSED_LINE, String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary()));
        assertTrue(contains(Settings.HIDE_ADVERTISING_ID.key));
    }

    /** The Privacy row is on the home page only when this build carries a patch its page holds. */
    @Test public void thePrivacyRowIsOnTheHomePageOnlyWithAPatchOfItsPage() {
        assertTrue(hasHomeRow("Privacy"));
        // A patch with no switch still puts its row, and so the page, in the build.
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.SPOOF_SIGNATURE);
        recreate();
        assertTrue(hasHomeRow("Privacy"));
        // Without any of its families there is no Privacy page at all.
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.FIX_PUSH_NOTIFICATIONS);
        recreate();
        assertFalse(hasHomeRow("Privacy"));
        assertHomeListsEveryPage();
        PatchFamily.inBuildForTests = EnumSet.noneOf(PatchFamily.class);
        recreate();
        assertFalse(hasHomeRow("Privacy"));
        assertHomeListsEveryPage();
    }

    /**
     * Pause switched on from its own page is owed a restart: the page says so, the restart row
     * sits under that line, and Undo takes both back. A change owed a restart brings the row up
     * on every page, first on a page without a pause line and under the home page's status card.
     */
    @Test @Config(sdk = {30, 37})
    public void aPauseOrAChangeWaitingOnARestartBringsUpTheRestartRow() {
        touchMode(true);
        page.navigation.navigate("Pause, backup and diagnostics");
        tap(BaseSettings.PAUSED.key);
        layout(dialog.getView());
        Preference line = (Preference) list().getItemAtPosition(0);
        assertEquals("HushTumblr is on", String.valueOf(line.getTitle()));
        assertEquals("HushTumblr pauses when Tumblr restarts.", String.valueOf(line.getSummary()));
        Preference restart = (Preference) list().getItemAtPosition(1);
        assertEquals(SettingsNavigation.RESTART, restart.getKey());
        assertEquals("Restart Tumblr to apply this change", String.valueOf(restart.getTitle()));
        assertEquals("Tumblr closes and reopens on this page.", String.valueOf(restart.getSummary()));
        assertTrue("the restart row can't be tapped", list().getAdapter().isEnabled(1));
        assertNull("a restart saved message went to a toast instead of the row", ShadowToast.getLatestToast());
        pageAction().performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertEquals(BaseSettings.PAUSED.key, ((Preference) list().getItemAtPosition(0)).getKey());
        assertFalse(contains(SettingsNavigation.RESTART));

        page.navigation.back();
        app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                Settings.HIDE_ADVERTISING_ID.key);
        page.navigation.navigate("Privacy");
        layout(dialog.getView());
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(0)).getKey());
        assertEquals(categoryCount("Privacy") + 1, list().getCount());
        page.navigation.back();
        page.navigation.navigate("Links");
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(0)).getKey());
        assertEquals(categoryCount("Links") + 1, list().getCount());
        while (page.navigation.back()) { }
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(1)).getKey());
        assertEquals(HOME_ROWS + 1, list().getCount());

        // Two changes are counted, and the row goes once neither is owed.
        app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                Settings.FIX_PUSH_NOTIFICATIONS.key);
        page.navigation.restartChanged();
        assertEquals("Restart Tumblr to apply 2 changes",
                String.valueOf(((Preference) list().getItemAtPosition(1)).getTitle()));
        app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        page.navigation.restartChanged();
        assertFalse(contains(SettingsNavigation.RESTART));
        assertEquals(HOME_ROWS, list().getCount());
    }

    /** The row restarts Tumblr and leaves a marker that opens the screen again on this page. */
    @Test @Config(sdk = {30, 37})
    public void theRestartRowRestartsIntoThePageItWasTappedOn() {
        List<android.content.Context> restarted = new ArrayList<>();
        app.hushtumblr.extension.shared.settings.preference.ReopenSettingsAfterRestart.setRestarterForTests(restarted::add);
        app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                Settings.FIX_PUSH_NOTIFICATIONS.key);
        page.navigation.navigate("Notifications");
        Map<String, Object> before = savedValues();
        tap(SettingsNavigation.RESTART);
        assertEquals(1, restarted.size());
        assertEquals(before, savedValues());
        assertEquals("Notifications", app.hushtumblr.extension.shared.settings.preference.ReopenSettingsAfterRestart
                .takeFresh(Setting.preferences.preferences, android.os.SystemClock.elapsedRealtime()));
    }

    /**
     * A save still on the edit worker would be cut off by the restart, so the row waits for it,
     * and a second tap meanwhile doesn't queue another restart.
     */
    @Test @Config(sdk = {30, 37})
    public void theRestartRowWaitsForASaveStillRunning() {
        List<android.content.Context> restarted = new ArrayList<>();
        app.hushtumblr.extension.shared.settings.preference.ReopenSettingsAfterRestart.setRestarterForTests(restarted::add);
        List<Runnable> writes = new ArrayList<>();
        HushTumblrPreferenceFragment.editWorkerForTests = writes::add;
        try {
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                    Settings.FIX_PUSH_NOTIFICATIONS.key);
            page.navigation.navigate("Notifications");
            assertTrue(HushTumblrPreferenceFragment.submitEdit(() -> { }));

            tap(SettingsNavigation.RESTART);
            tap(SettingsNavigation.RESTART);
            ShadowLooper.idleMainLooper(SettingsNavigation.RESTART_WAIT_MS * 4, java.util.concurrent.TimeUnit.MILLISECONDS);
            assertTrue("Tumblr restarted with a save still running", restarted.isEmpty());

            writes.remove(0).run();
            ShadowLooper.idleMainLooper(SettingsNavigation.RESTART_WAIT_MS * 4, java.util.concurrent.TimeUnit.MILLISECONDS);
            assertEquals("the restart didn't come once the save landed, or came twice", 1, restarted.size());
            assertEquals("Notifications", app.hushtumblr.extension.shared.settings.preference.ReopenSettingsAfterRestart
                    .takeFresh(Setting.preferences.preferences, android.os.SystemClock.elapsedRealtime()));
        } finally {
            for (Runnable write : writes) write.run();
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
        }
    }

    /** Asked to open on a page, as after that restart, the screen starts there with its title and no search. */
    @Test public void aScreenAskedToStartOnAPageOpensThere() {
        dialog.dismissAllowingStateLoss();
        ShadowLooper.idleMainLooper();
        dialog = SettingsDialog.onPage("Links");
        dialog.show(controller.get().getFragmentManager(), "hushtumblr_settings");
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        page = page(dialog);
        assertTrue(contains(HushTumblrPreferenceFragment.SUPPORTED_LINKS));
        assertEquals(categoryCount("Links"), list().getCount());
        assertEquals(View.GONE, ((View) findSearch(dialog.getView()).getParent()).getVisibility());
        assertTrue(page.navigation.back());
        assertTrue("Back from Links goes home, where Links has its own row",
                contains("section_Links") && contains(HushTumblrPreferenceFragment.SUPPORT));

        // A page this build doesn't have opens the first page, and so does "more", which a restart
        // saved before More settings joined the home page.
        for (String missing : new String[] {"No such page", "more"}) {
            dialog.dismissAllowingStateLoss();
            ShadowLooper.idleMainLooper();
            dialog = SettingsDialog.onPage(missing);
            dialog.show(controller.get().getFragmentManager(), "hushtumblr_settings");
            controller.get().getFragmentManager().executePendingTransactions();
            ShadowLooper.idleMainLooper();
            page = page(dialog);
            assertEquals(missing, HOME_ROWS, list().getCount());
        }
    }

    /** A long press on Quick setups takes it off the home page for good, says where it went, and leaves other rows alone. */
    @Test public void aLongPressHidesQuickSetupsAndStoresTheFlag() {
        Preference row = (Preference) list().getItemAtPosition(position(SettingsNavigation.QUICK_SETUPS));
        assertTrue(String.valueOf(row.getSummary()).endsWith(" Press and hold to hide this row."));
        assertFalse(SettingsNavigation.HIDE_QUICK_SETUPS.savedValue());
        assertTrue("the flag has to answer while paused", SettingsNavigation.HIDE_QUICK_SETUPS.isKeptWhenPaused());
        assertFalse("another row took the long press", longPress(SettingsNavigation.REPORT));
        assertFalse(SettingsNavigation.HIDE_QUICK_SETUPS.savedValue());
        assertEquals(HOME_ROWS, list().getCount());

        assertTrue(longPress(SettingsNavigation.QUICK_SETUPS));
        assertTrue(SettingsNavigation.HIDE_QUICK_SETUPS.savedValue());
        assertFalse(contains(SettingsNavigation.QUICK_SETUPS));
        assertEquals(HOME_ROWS - 1, list().getCount());
        assertEquals("Quick setups hidden. Bring it back from Pause, backup and diagnostics.", ShadowToast.getTextOfLatestToast());
    }

    /** The row on Pause, backup and diagnostics shows the state, brings Quick setups back and hides it again. */
    @Test public void theRestoreRowBringsQuickSetupsBack() {
        page.navigation.navigate("Pause, backup and diagnostics");
        Preference restore = page.findPreference(SettingsNavigation.RESTORE_QUICK_SETUPS);
        assertEquals("Quick setups on the home page", String.valueOf(restore.getTitle()));
        assertEquals("Shown. Tap to hide it.", String.valueOf(restore.getSummary()));
        page.navigation.search("quick setups");
        assertTrue("search lost the restore row", contains(SettingsNavigation.RESTORE_QUICK_SETUPS));
        page.navigation.search("");
        while (page.navigation.back()) { }

        longPress(SettingsNavigation.QUICK_SETUPS);
        page.navigation.navigate("Pause, backup and diagnostics");
        assertEquals("Hidden. Tap to show it again.", String.valueOf(restore.getSummary()));
        tap(SettingsNavigation.RESTORE_QUICK_SETUPS);
        assertEquals("Shown. Tap to hide it.", String.valueOf(restore.getSummary()));
        assertFalse(SettingsNavigation.HIDE_QUICK_SETUPS.savedValue());
        while (page.navigation.back()) { }
        assertTrue(contains(SettingsNavigation.QUICK_SETUPS));
        assertEquals(HOME_ROWS, list().getCount());

        page.navigation.navigate("Pause, backup and diagnostics");
        tap(SettingsNavigation.RESTORE_QUICK_SETUPS);
        assertEquals("Hidden. Tap to show it again.", String.valueOf(restore.getSummary()));
        assertTrue(SettingsNavigation.HIDE_QUICK_SETUPS.savedValue());
        while (page.navigation.back()) { }
        assertFalse(contains(SettingsNavigation.QUICK_SETUPS));
    }

    /** The flag is the screen's own: no settings file carries it and no Quick setups choice moves it. */
    @Test public void theHideFlagStaysOutOfSettingsFilesAndQuickSetups() throws Exception {
        SettingsNavigation.HIDE_QUICK_SETUPS.save(true);
        assertFalse(SettingsBackup.create().contains(SettingsNavigation.HIDE_QUICK_SETUPS.key));
        try {
            for (Map<BooleanSetting, Boolean> preset : Arrays.asList(
                    QuickSetupKeys.quiet(), QuickSetupKeys.privacy(), QuickSetupKeys.defaults())) {
                assertFalse(preset.containsKey(SettingsNavigation.HIDE_QUICK_SETUPS));
                page.applyQuickSetup(preset);
                ShadowLooper.idleMainLooper();
                assertTrue(SettingsNavigation.HIDE_QUICK_SETUPS.savedValue());
            }
        } finally {
            for (BooleanSetting setting : QuickSetupKeys.DEFAULTS) setting.resetToDefault();
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        }
    }

    /** Each Quick setups choice saves its switches on the worker, shows them on their rows and says how many changed. */
    @Test public void quickSetupsChangeTheirSwitchesAndSayHowMany() {
        Preference row = (Preference) list().getItemAtPosition(1);
        assertEquals(SettingsNavigation.QUICK_SETUPS, row.getKey());
        assertEquals("Quick setups", String.valueOf(row.getTitle()));
        tap(SettingsNavigation.QUICK_SETUPS);
        AlertDialog choices = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        assertNotNull("Quick setups opened no dialog", choices);
        android.widget.ListAdapter cards = choices.getListView().getAdapter();
        assertEquals(3, cards.getCount());
        assertTrue(String.valueOf(cards.getItem(0)).startsWith("Quiet\n"));
        assertTrue(String.valueOf(cards.getItem(1)).startsWith("Privacy\n"));
        assertTrue(String.valueOf(cards.getItem(2)).startsWith("Back to defaults\n"));
        try {
            // Hide ads starts on, so Quiet turns on the other fourteen.
            choices.getListView().performItemClick(null, 0, 0);
            ShadowLooper.idleMainLooper();
            for (BooleanSetting setting : QuickSetupKeys.QUIET) {
                assertTrue(setting.key, setting.savedValue());
                assertTrue(setting.key + " was saved but its row still shows off",
                        ((SwitchPreference) page.findPreference(setting.key)).isChecked());
            }
            assertEquals("Changed 14 settings", ShadowToast.getTextOfLatestToast());
            // Turning off screenshot sharing waits for a restart, so the row is up under the status card.
            assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(1)).getKey());

            page.applyQuickSetup(QuickSetupKeys.quiet());
            ShadowLooper.idleMainLooper();
            assertEquals("Changed 0 settings", ShadowToast.getTextOfLatestToast());
            page.applyQuickSetup(QuickSetupKeys.defaults());
            ShadowLooper.idleMainLooper();
            assertEquals("Changed 14 settings", ShadowToast.getTextOfLatestToast());
            for (BooleanSetting setting : QuickSetupKeys.DEFAULTS) {
                assertEquals(setting.key, setting.defaultValue, setting.savedValue());
            }
            assertFalse("putting the switches back left a restart owed", contains(SettingsNavigation.RESTART));

            // Privacy on top of the defaults changes only screenshot sharing.
            page.applyQuickSetup(QuickSetupKeys.privacy());
            ShadowLooper.idleMainLooper();
            assertEquals("Changed 1 setting", ShadowToast.getTextOfLatestToast());
            assertTrue(Settings.TURN_OFF_SCREENSHOT_SHARING.savedValue());
        } finally {
            for (BooleanSetting setting : QuickSetupKeys.DEFAULTS) setting.resetToDefault();
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        }
    }

    /** While a switch is still saving, a Quick setup changes nothing and says to try again. */
    @Test @Config(sdk = {30, 37})
    public void aQuickSetupWaitsForASwitchStillSaving() {
        List<Runnable> writes = new ArrayList<>();
        HushTumblrPreferenceFragment.editWorkerForTests = writes::add;
        try {
            page.navigation.navigate("Feed");
            tap(Settings.HIDE_SUGGESTED_BLOGS.key);
            assertEquals(1, writes.size());
            page.applyQuickSetup(QuickSetupKeys.quiet());
            ShadowLooper.idleMainLooper();
            assertEquals(1, writes.size());
            assertEquals("Couldn't start that. Try again in a moment.", ShadowToast.getTextOfLatestToast());
            assertFalse(Settings.HIDE_WATCH_IT_ROWS.savedValue());
        } finally {
            // The worker first: the save's own refresh would otherwise queue behind it and never run.
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
            for (Runnable write : writes) write.run();
            ShadowLooper.idleMainLooper();
            for (BooleanSetting setting : QuickSetupKeys.DEFAULTS) setting.resetToDefault();
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        }
    }

    /** Report a problem opens GitHub's bug form in a browser with the versions and switches filled in. */
    @Test public void reportAProblemOpensAFilledInGitHubForm() throws Exception {
        Map<String, Object> before = savedValues();
        int last = list().getCount() - 1;
        assertEquals(SettingsNavigation.REPORT, ((Preference) list().getItemAtPosition(last - 1)).getKey());
        tap(SettingsNavigation.REPORT);
        Intent started = org.robolectric.Shadows.shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull("nothing opened", started);
        assertEquals(Intent.ACTION_VIEW, started.getAction());
        assertTrue(started.hasCategory(Intent.CATEGORY_BROWSABLE));
        assertTrue((started.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        String url = started.getDataString();
        assertTrue(url, url.startsWith("https://github.com/SysAdminDoc/HushTumblr/issues/new?template=bug_report.yml&"));
        assertTrue(url, url.length() <= app.hushtumblr.extension.shared.settings.preference.ReportProblem.MAX_LENGTH);
        String decoded = java.net.URLDecoder.decode(url, "UTF-8");
        assertTrue(decoded, decoded.contains("&versions=HushTumblr "));
        assertTrue(decoded, decoded.contains(" on Tumblr "));
        assertTrue(decoded, decoded.contains("&device="));
        assertTrue(decoded, decoded.contains("What happened:"));
        assertTrue(decoded, decoded.contains("What I expected:"));
        // Hide ads starts on, Hide suggested blogs starts off.
        assertTrue(decoded, decoded.contains("Switches on: Hide ads"));
        assertFalse(decoded, decoded.contains("Hide suggested blogs"));
        assertEquals(before, savedValues());

        // No browser: a toast says where to go, and Tumblr stays open.
        org.robolectric.Shadows.shadowOf(org.robolectric.RuntimeEnvironment.getApplication()).checkActivities(true);
        tap(SettingsNavigation.REPORT);
        assertEquals("No app on this phone can open the link. The address is "
                + L10n.isolate("github.com/SysAdminDoc/HushTumblr") + ".", ShadowToast.getTextOfLatestToast());
        assertFalse(controller.get().isFinishing());
    }

    /**
     * The switches that only answer Tumblr's feature flags, which Tumblr reads once a run. A method,
     * not a static field: naming Settings while this class loads sets Setting up before the rule
     * hands the extension its context, and in a fresh sandbox that fails Setting for every test.
     */
    private static List<BooleanSetting> flagBacked() {
        return Arrays.asList(Settings.DISABLE_ANALYTICS, Settings.HIDE_AD_FREE_BANNER, Settings.HIDE_TUMBLR_TV,
                Settings.HIDE_COMMUNITIES_TAB, Settings.HIDE_BLAZE_PROMPTS, Settings.TURN_OFF_SCREENSHOT_SHARING,
                Settings.DISABLE_UPDATE_PROMPTS);
    }

    /**
     * A flag-backed switch owes a restart like any other restart-needing one: the restart row comes
     * up the moment it's flipped, with no toast that offers nothing to tap, and its own summary no
     * longer says the same thing. Turned back to what the running Tumblr has, it owes nothing and
     * the row goes.
     */
    @Test public void flippingARestartGatedSwitchShowsTheRowAtOnce() {
        for (BooleanSetting setting : flagBacked()) {
            assertTrue(setting.key, setting.rebootApp);
            Preference row = page.findPreference(setting.key);
            assertNotNull(setting.key, row);
            assertFalse(setting.key + " repeats the restart sentence",
                    String.valueOf(row.getSummary()).matches("(?is).*restart.*"));
        }
        page.navigation.navigate("Interface");
        layout(dialog.getView());
        assertFalse(contains(SettingsNavigation.RESTART));

        tap(Settings.HIDE_TUMBLR_TV.key);
        layout(dialog.getView());
        assertTrue(Settings.HIDE_TUMBLR_TV.savedValue());
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(0)).getKey());
        assertEquals("Restart Tumblr to apply this change",
                String.valueOf(((Preference) list().getItemAtPosition(0)).getTitle()));
        assertNull("the restart was said in a toast with nothing to tap", ShadowToast.getLatestToast());

        tap(Settings.HIDE_TUMBLR_TV.key);
        layout(dialog.getView());
        assertFalse(Settings.HIDE_TUMBLR_TV.savedValue());
        assertFalse(contains(SettingsNavigation.RESTART));
    }

    /** The paused line on real pages, dark and light, for a look before the phone does. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void renderPausedPages() throws Exception {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        recreate();
        page.navigation.navigate("Privacy");
        capture("paused-privacy");
        assertUncutText(dialog.getView());
        pageAction().performClick();
        ShadowLooper.idleMainLooper();
        capture("paused-privacy-resume-pending");
        page.navigation.back();
        findSearch(dialog.getView()).setText("links");
        capture("paused-search");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(sdk = {29, 30, 33, 36, 37}, qualifiers = "ar-rXB-ldrtl-w390dp-h844dp-night-xhdpi")
    public void aPausedPageKeepsItsLineWholeAtLargeRightToLeftText() throws Exception {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        try {
            recreate();
            page.navigation.navigate("Privacy");
            layout(dialog.getView());
            assertUncutText(dialog.getView());
            capture("large-rtl-paused-privacy");
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    private android.widget.Button pageAction() {
        android.widget.Button action = firstButton(list().getChildAt(0));
        assertNotNull("no status action", action);
        return action;
    }

    private int categoryCount(String title) {
        for (Preference section : page.sections()) {
            if (title.contentEquals(section.getTitle())) return ((PreferenceCategory) section).getPreferenceCount();
        }
        throw new AssertionError("No section " + title);
    }

    /** Paused, the overview says what to do in order. It used to read as if a restart came before Resume. */
    @Test public void aPausedOverviewSaysToTapResumeThenRestart() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView());
        TextView summary = list().getChildAt(0).findViewById(android.R.id.summary);
        assertEquals("Your choices are saved. Tap Resume, then restart Tumblr.", String.valueOf(summary.getText()));
    }

    /**
     * At twice the text size the button beside the status text left the name too little room and
     * "HushTumblr" broke inside the word. The action now sits below the text at every size.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(sdk = {30, 37})
    public void atLargeTextTheStatusActionSitsUnderItsText() {
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        try {
            recreate();
            layout(dialog.getView());
            View row = list().getChildAt(0);
            TextView title = row.findViewById(android.R.id.title);
            TextView summary = row.findViewById(android.R.id.summary);
            android.text.Layout lines = title.getLayout();
            for (int line = 0; line + 1 < lines.getLineCount(); line++) {
                char last = title.getText().charAt(lines.getLineEnd(line) - 1);
                assertTrue("\"" + title.getText() + "\" breaks inside a word after line " + line, Character.isWhitespace(last));
            }
            assertEquals(View.GONE, row.findViewById(android.R.id.widget_frame).getVisibility());
            android.widget.Button action = firstButton(row);
            assertNotNull("no Pause button in the status row", action);
            assertEquals(summary.getParent(), action.getParent());
            assertTrue("the button isn't under the text", action.getTop() >= summary.getBottom());
            assertEquals("Pause", action.getText().toString());
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    private static android.widget.Button firstButton(View view) {
        if (view instanceof android.widget.Button) return (android.widget.Button) view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                android.widget.Button found = firstButton(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private android.widget.Button statusAction() {
        android.widget.Button action = firstButton(list().getChildAt(0));
        assertNotNull("no overview status action", action);
        return action;
    }

    @Test public void searchUsesRealControlsAndClearReturnsHome() {
        EditText search = findSearch(dialog.getView());
        assertNotNull(search);
        search.setText("advertising");
        ShadowLooper.idleMainLooper();
        assertTrue(contains(Settings.HIDE_ADVERTISING_ID.key));
        tap(Settings.HIDE_ADVERTISING_ID.key);
        assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
        search.setText("noSuchSetting987654");
        assertEquals(1, list().getCount());
        assertFalse(list().getAdapter().isEnabled(0));
        assertEquals("No matching settings", ((Preference) list().getItemAtPosition(0)).getTitle());
        assertTrue(page.navigation.back());
        assertEquals("", search.getText().toString());
        assertEquals(HOME_ROWS, list().getCount());
    }

    @Test public void switchRowsNameWhatTheyChangeAndWhenItApplies() {
        summaryContains(Settings.HIDE_ADVERTISING_ID.key, "empty advertising ID", "ad tracking limited",
                "as if you deleted your ad ID");
        summaryContains(Settings.FIX_PUSH_NOTIFICATIONS.key, "sign up for push notifications");
        assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.rebootApp);
        assertFalse(String.valueOf(page.findPreference(Settings.FIX_PUSH_NOTIFICATIONS.key).getSummary())
                .contains("the next time Tumblr starts"));
        summaryContains(Settings.DARK_BACKGROUND.key, "newly opened Dark Mode screens",
                "Open screens keep their colors until Tumblr restarts.");
        summaryContains(Settings.HIDE_TUMBLRMART.key, "when you return to them",
                "Open screens keep their TumblrMart button until Tumblr restarts.");
        summaryContains(Settings.CHECK_FOR_RELEASES.key, "Once a day", "Nothing is downloaded");

        page.navigation.navigate("Notifications");
        layout(dialog.getView());
        assertFalse(contains(SettingsNavigation.RESTART));
        tap(Settings.FIX_PUSH_NOTIFICATIONS.key);
        layout(dialog.getView());
        assertFalse(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(0)).getKey());
        assertNull("the restart was said in a toast with nothing to tap", ShadowToast.getLatestToast());
        tap(Settings.FIX_PUSH_NOTIFICATIONS.key);
        layout(dialog.getView());
        assertTrue(Settings.FIX_PUSH_NOTIFICATIONS.savedValue());
        assertFalse(contains(SettingsNavigation.RESTART));
    }

    @Test public void aliasesKeepAccentMatchingGroupingAndTheSpokenResultCount() {
        Map<String, Object> before = savedValues();
        EditText search = findSearch(dialog.getView());
        // "Alerts" is only in the alias, "push" in the row's title and "notifications" in its heading.
        search.setText("  ÁLERTS  push   notifications  ");
        ShadowLooper.idleMainLooper(2, java.util.concurrent.TimeUnit.SECONDS);
        assertEquals(2, list().getCount());
        assertTrue(list().getItemAtPosition(0) instanceof PreferenceCategory);
        assertEquals("Notifications", ((Preference) list().getItemAtPosition(0)).getTitle());
        assertSame(page.findPreference(Settings.FIX_PUSH_NOTIFICATIONS.key), list().getItemAtPosition(1));
        assertEquals("1 setting found", resultCount(dialog.getView()).getText().toString());
        assertEquals(before, savedValues());
        search.setText("push alerts noSuchTerm987654");
        ShadowLooper.idleMainLooper(2, java.util.concurrent.TimeUnit.SECONDS);
        assertEquals("0 settings found", resultCount(dialog.getView()).getText().toString());
        assertFalse(contains(Settings.FIX_PUSH_NOTIFICATIONS.key));
    }

    @Test public void aliasesCannotAddRowsForPatchesThisBuildDoesNotHave() {
        // Neither switch an alias names is in a build with only Hide hashtags, and no row that build
        // shows holds an alias's words. Disable analytics can't stand in here: its own summary,
        // "Stops Tumblr's own tracking and ad measurement", rightly matches "Ad tracking".
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_HASHTAGS);
        recreate();
        for (Map.Entry<String, String> alias : SettingsNavigation.localizedSearchAliases().entrySet()) {
            assertNull(page.findPreference(alias.getKey()));
            findSearch(dialog.getView()).setText(alias.getValue());
            ShadowLooper.idleMainLooper(2, java.util.concurrent.TimeUnit.SECONDS);
            assertFalse(alias.getKey(), contains(alias.getKey()));
            assertEquals("0 settings found", resultCount(dialog.getView()).getText().toString());
            assertEquals(1, list().getCount());
            assertEquals("No matching settings", ((Preference) list().getItemAtPosition(0)).getTitle());
        }
    }

    @Test public void alternateSearchWordsFindTheActualRowsInEveryShippedLanguage() {
        String[][] languages = {{"en", null}, {"de", "de"}, {"es", "es"}, {"in-rID", "in"}, {"pt-rBR", "pt-rbr"}, {"tr", "tr"}};
        Map<String, String> english = SettingsNavigation.localizedSearchAliases();
        for (String[] language : languages) {
            controller.close();
            org.robolectric.RuntimeEnvironment.setQualifiers("+" + language[0]);
            controller = Robolectric.buildActivity(Activity.class).setup().visible();
            dialog = SettingsL10nTest.show(controller.get());
            page = page(dialog);
            Map<String, String> table = language[1] == null ? new TreeMap<>() : SettingsL10nTest.TranslationsForTests.of(language[1]);
            for (Map.Entry<String, String> alias : english.entrySet()) {
                String words = table.getOrDefault(alias.getValue(), alias.getValue());
                // All words must match together, whatever order they were typed in.
                List<String> terms = Arrays.asList(words.split("\\s+"));
                java.util.Collections.reverse(terms);
                findSearch(dialog.getView()).setText(String.join("  ", terms));
                ShadowLooper.idleMainLooper(2, java.util.concurrent.TimeUnit.SECONDS);
                assertTrue(language[0] + ": " + words + " missed " + alias.getKey(), contains(alias.getKey()));
                assertSame(page.findPreference(alias.getKey()), list().getItemAtPosition(position(alias.getKey())));
            }
        }
    }

    private void summaryContains(String key, String... details) {
        Preference row = page.findPreference(key);
        assertNotNull(key, row);
        String summary = String.valueOf(row.getSummary());
        for (String detail : details) assertTrue(key + ": " + summary, summary.contains(detail));
    }

    /**
     * On the S22 with TalkBack, typing a search said only "Edit box": the list changed without a
     * word. The count now sits in a polite live region, written once the typing settles.
     */
    @Test public void searchSpeaksItsResultCountOnceTheTypingSettles() {
        EditText search = findSearch(dialog.getView());
        TextView before = resultCount(dialog.getView());
        assertTrue(before == null || before.getVisibility() == View.GONE);
        java.util.List<String> spoken = new java.util.ArrayList<>();
        search.setText("h");
        TextView count = resultCount(dialog.getView());
        assertNotNull("a live region for the result count", count);
        count.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int before, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int after) { spoken.add(s.toString()); }
            @Override public void afterTextChanged(android.text.Editable s) { }
        });
        search.setText("hi");
        search.setText("hide");
        search.setText("hide advertising");
        ShadowLooper.idleMainLooper(2, java.util.concurrent.TimeUnit.SECONDS);
        int rows = 0;
        for (int i = 0; i < list().getCount(); i++) if (!(list().getItemAtPosition(i) instanceof PreferenceCategory)) rows++;
        assertTrue(rows > 0);
        assertEquals(java.util.Collections.singletonList(rows + (rows == 1 ? " setting found" : " settings found")), spoken);
        assertEquals(View.VISIBLE, count.getVisibility());
        search.setText("noSuchSetting987654");
        ShadowLooper.idleMainLooper(2, java.util.concurrent.TimeUnit.SECONDS);
        assertEquals("0 settings found", count.getText().toString());
        search.setText("");
        ShadowLooper.idleMainLooper(2, java.util.concurrent.TimeUnit.SECONDS);
        assertEquals(View.GONE, count.getVisibility());
    }

    /**
     * On the S22, Back left TalkBack's focus on the whole screen, so a screen reader user lost
     * their place in the list. It goes back to the row the page was opened from. Robolectric's
     * window has no surface and drops accessibility focus on its next traversal, so the test
     * reads the focus event the row sent rather than the row's state afterwards.
     */
    @Test public void backPutsScreenReaderFocusOnTheRowThePageCameFrom() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        layout(dialog.getView());
        page.navigation.navigate("Privacy");
        layout(dialog.getView());
        page.navigation.back();
        layout(dialog.getView());
        assertEquals("Privacy", focusedTitle(a11y));
        // About's row sits under the More settings heading, below the first screen: scrolled to and
        // tapped, it gets focus back where the list was left.
        list().setSelectionFromTop(position("section_About"), 0);
        layout(dialog.getView());
        int left = list().getFirstVisiblePosition();
        page.navigation.navigate("About");
        layout(dialog.getView());
        page.navigation.back();
        layout(dialog.getView());
        assertEquals("About", focusedTitle(a11y));
        assertEquals(left, list().getFirstVisiblePosition());
    }

    /**
     * A page opened with home never scrolled to its row, as after a restart or from search, leaves
     * that row off screen. Back scrolls it into view, and focus lands on it then rather than
     * whenever it was scrolled to later.
     */
    @Test public void backBringsAnOffScreenRowIntoViewForItsFocus() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        touchMode(true);
        layout(dialog.getView());
        int about = position("section_About");
        assertTrue("About starts off screen", about > list().getLastVisiblePosition());
        page.navigation.navigate("About");
        layout(dialog.getView());
        page.navigation.back();
        // One pass finds the row off screen and scrolls, the next draws it and focuses it.
        layout(dialog.getView());
        layout(dialog.getView());
        assertTrue("About is on screen", about >= list().getFirstVisiblePosition() && about <= list().getLastVisiblePosition());
        assertEquals("About", focusedTitle(a11y));
        // A row Back finds on screen stays where the list was left.
        list().setSelectionFromTop(0, 0);
        layout(dialog.getView());
        page.navigation.navigate("Feed");
        layout(dialog.getView());
        page.navigation.back();
        layout(dialog.getView());
        assertEquals(0, list().getFirstVisiblePosition());
        assertEquals("Feed", focusedTitle(a11y));
    }

    /** The first text of the last row that took accessibility focus. */
    private static String focusedTitle(android.view.accessibility.AccessibilityManager a11y) {
        String title = null;
        for (android.view.accessibility.AccessibilityEvent event : org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents()) {
            if (event.getEventType() != android.view.accessibility.AccessibilityEvent.TYPE_VIEW_ACCESSIBILITY_FOCUSED) continue;
            title = event.getText().isEmpty() ? null : String.valueOf(event.getText().get(0));
        }
        return title;
    }

    private static TextView resultCount(View view) {
        if (view instanceof TextView && !(view instanceof EditText)
                && view.getAccessibilityLiveRegion() == View.ACCESSIBILITY_LIVE_REGION_POLITE) return (TextView) view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = resultCount(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    @Test @Config(sdk = {29, 30, 33, 36, 37})
    public void recreationKeepsTheCategoryAndSearchQuery() {
        page.navigation.open(page.findPreference(Settings.CHECK_FOR_RELEASES.key));
        recreate();
        assertTrue(contains(Settings.CHECK_FOR_RELEASES.key));
        assertEquals(categoryCount("Updates"), list().getCount());
        assertTrue(contains(HushTumblrPreferenceFragment.CHECK_NOW));
        page.navigation.back();
        findSearch(dialog.getView()).setText("new releases");
        recreate();
        assertEquals("new releases", findSearch(dialog.getView()).getText().toString());
        assertTrue(contains(Settings.CHECK_FOR_RELEASES.key));
    }

    @Test public void bothBackPathsReturnToTheIndexBeforeClosingTheDialog() {
        page.navigation.open(page.findPreference(Settings.HIDE_ADVERTISING_ID.key));
        SettingsL10nTest.backOf(dialog).performClick();
        assertTrue(dialog.getDialog().isShowing());
        assertEquals(HOME_ROWS, list().getCount());
        page.navigation.navigate("About");
        dialog.getDialog().onBackPressed();
        // About opens from the home page, so Back goes straight there.
        assertEquals(HOME_ROWS, list().getCount());
        dialog.getDialog().onBackPressed();
        ShadowLooper.idleMainLooper();
        assertFalse(controller.get().isFinishing());
    }

    // A window as short as the layouts below, 400 px, so the window's own layout leaves both the
    // overview and Pause, backup and diagnostics taller than the list and neither snaps back to the top.
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(sdk = {30, 37}, qualifiers = "w390dp-h200dp-night-xhdpi")
    public void aNewPageStartsAtTheTopAfterThePreviousPageWasScrolled() {
        touchMode(true);
        try {
            layout(dialog.getView(), 400);
            assertTrue(list().isInTouchMode());
            list().scrollListBy(120);
            int homePosition = list().getFirstVisiblePosition();
            int homeOffset = list().getChildAt(0).getTop();
            assertTrue(homePosition > 0 || homeOffset < 0);
            page.navigation.navigate("Pause, backup and diagnostics");
            // Preference updates can arrive after navigation but before the next layout.
            ((android.widget.BaseAdapter) page.getPreferenceScreen().getRootAdapter()).notifyDataSetChanged();
            layout(dialog.getView(), 400);
            assertEquals(0, list().getFirstVisiblePosition());
            assertEquals(list().getPaddingTop(), list().getChildAt(0).getTop());
            list().scrollListBy(100);
            int pausePosition = list().getFirstVisiblePosition();
            int pauseOffset = list().getChildAt(0).getTop();
            assertTrue(pausePosition > 0 || pauseOffset < 0);
            assertTrue(page.navigation.back());
            layout(dialog.getView(), 400);
            assertEquals(homePosition, list().getFirstVisiblePosition());
            assertEquals(homeOffset, list().getChildAt(0).getTop());
            // The next page starts at the top, whatever the last page's scroll was.
            page.navigation.navigate("About");
            layout(dialog.getView(), 400);
            assertEquals(0, list().getFirstVisiblePosition());
            assertEquals(list().getPaddingTop(), list().getChildAt(0).getTop());
            // Without a screen reader, home keeps the place it was left even though About's row
            // isn't in it.
            assertTrue(page.navigation.back());
            layout(dialog.getView(), 400);
            assertEquals(homePosition, list().getFirstVisiblePosition());
            assertEquals(homeOffset, list().getChildAt(0).getTop());
        } finally {
            touchMode(false);
        }
    }

    @Test public void visibleNavigationAndSearchKeepTheirAccessibilityRoles() {
        layout(dialog.getView());
        // Quick setups sits between the status card and the Browse settings heading.
        View heading = list().getChildAt(2);
        assertTrue(heading.createAccessibilityNodeInfo().isHeading());
        // The first page row is Feed's.
        View feed = list().getChildAt(3);
        assertEquals(android.widget.Button.class.getName(), feed.createAccessibilityNodeInfo().getClassName());
        assertTrue(feed.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
        assertEquals("Hide ads", ((Preference) list().getItemAtPosition(0)).getTitle());
        page.navigation.back();
        findSearch(dialog.getView()).setText("Hide advertising");
        layout(dialog.getView());
        View toggle = list().getChildAt(position(Settings.HIDE_ADVERTISING_ID.key) - list().getFirstVisiblePosition());
        assertEquals(android.widget.Switch.class.getName(), toggle.createAccessibilityNodeInfo().getClassName());
        assertTrue(toggle.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
        assertFalse(Settings.HIDE_ADVERTISING_ID.savedValue());
    }

    /**
     * The switches live in one application-wide store, and Tumblr can hold several accounts. The
     * About row and both backup rows say so, and each shipped language's word for accounts finds
     * all three in search.
     */
    @Test public void theAccountScopeIsSearchableInEveryShippedLanguage() {
        String[][] languages = {{"en", null}, {"de", "de"}, {"es", "es"}, {"in-rID", "in"}, {"pt-rBR", "pt-rbr"}, {"tr", "tr"}};
        for (String[] language : languages) {
            controller.close();
            org.robolectric.RuntimeEnvironment.setQualifiers("+" + language[0]);
            controller = Robolectric.buildActivity(Activity.class).setup().visible();
            dialog = SettingsL10nTest.show(controller.get());
            page = page(dialog);
            Map<String, String> table = language[1] == null ? new TreeMap<>() : SettingsL10nTest.TranslationsForTests.of(language[1]);
            String word = table.getOrDefault("Accounts", "Accounts").toLowerCase(java.util.Locale.ROOT);
            findSearch(dialog.getView()).setText(word);
            ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
            List<String> found = new ArrayList<>();
            for (int i = 0; i < list().getCount(); i++) {
                Object item = list().getItemAtPosition(i);
                if (item instanceof Preference && !(item instanceof PreferenceCategory)) found.add(String.valueOf(((Preference) item).getTitle()));
            }
            for (String title : Arrays.asList("Accounts", "Export settings", "Import settings")) {
                assertTrue(language[0] + ": searching " + word + " misses " + title + " in " + found,
                        found.contains(table.getOrDefault(title, title)));
            }
        }
    }

    /** All pages are rendered with the same viewport as the design reference. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void renderEveryPageAndSearchOffscreen() throws Exception {
        capture("00-overview");
        for (Preference section : page.sections()) {
            page.navigation.open(section);
            capture(section.getTitle().toString().toLowerCase(java.util.Locale.ROOT).replaceAll("[^a-z]+", "-"));
        }
        // The search box is on the home page, so the search starts there.
        page.navigation.back();
        findSearch(dialog.getView()).setText("links");
        ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
        capture("search-results");
        findSearch(dialog.getView()).setText("noSuchSetting987654");
        ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
        capture("search-empty");
        page.navigation.back();
        page.navigation.navigate("Pause, backup and diagnostics");
        Preference export = page.findPreference("action_export_diagnostic_report");
        export.getOnPreferenceClickListener().onPreferenceClick(export);
        AlertDialog report = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        captureDialog("dialog-report", report);
        report.dismiss();
        page.pendingImport = SettingsBackup.parse("{\"format\":\"hushtumblr-settings\",\"schema\":1,\"settings\":{\"hushtumblr_hide_ad_id\":false}}").toBundle();
        SettingsBackupPreference.onPageResumed(page);
        captureDialog("dialog-import", page.importPreview);
        page.importPreview.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        page.navigation.navigate("About");
        PreferenceCategory about = (PreferenceCategory) page.sections().get(page.sections().size() - 1);
        Preference licenses = null;
        for (int i = 0; i < about.getPreferenceCount(); i++) {
            if ("Licenses".contentEquals(about.getPreference(i).getTitle())) licenses = about.getPreference(i);
        }
        assertNotNull("no Licenses row on About", licenses);
        licenses.getOnPreferenceClickListener().onPreferenceClick(licenses);
        AlertDialog notice = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        captureDialog("dialog-licenses", notice);
        notice.dismiss();
        page.navigation.navigate("Feed");
        Preference words = page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW);
        words.getOnPreferenceClickListener().onPreferenceClick(words);
        AlertDialog editor = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        captureDialog("dialog-words", editor);
        editor.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        page.navigation.navigate("Interface");
        Preference tabs = page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW);
        tabs.getOnPreferenceClickListener().onPreferenceClick(tabs);
        AlertDialog order = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        captureDialog("dialog-tab-order", order);
        order.dismiss();
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(sdk = {30, 37}, qualifiers = "ar-rXB-ldrtl-w390dp-h844dp-night-xhdpi")
    public void largeRightToLeftPagesKeepTheirCompleteText() throws Exception {
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        try {
            recreate();
            capture("large-rtl-overview");
            for (Preference section : page.sections()) {
                page.navigation.open(section);
                layout(dialog.getView());
                assertUncutText(dialog.getView());
            }
            capture("large-rtl-about");
            captureWholePage("Pause, backup and diagnostics", "large-rtl-pause");
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    /**
     * Brazilian Portuguese runs longer than English. Every page still wraps its
     * whole text at twice the text size, and the table is the one on screen.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "pt-rBR-w390dp-h844dp-night-xhdpi")
    public void brazilianPortuguesePagesKeepTheirCompleteText() throws Exception {
        assertEquals("Atualizações", String.valueOf(page.findPreference(Settings.CHECK_FOR_RELEASES.key)
                .getParent().getTitle()));
        capture("pt-br-overview");
        page.navigation.navigate("Privacy");
        capture("pt-br-privacy");
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        try {
            recreate();
            for (Preference section : page.sections()) {
                page.navigation.open(section);
                layout(dialog.getView());
                assertUncutText(dialog.getView());
            }
            page.navigation.navigate("Privacy");
            capture("pt-br-large-privacy");
            page.navigation.navigate("Links");
            capture("pt-br-large-links");
            captureWholePage("Pause, backup and diagnostics", "pt-br-large-pause");
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    /** Every row of the page at [route], each scrolled to the top in turn, then [name] at both ends. */
    private void captureWholePage(String route, String name) throws Exception {
        page.navigation.navigate(route);
        for (int i = 0; i < list().getCount(); i++) {
            list().setSelectionFromTop(i, 0);
            layout(dialog.getView());
            assertUncutText(dialog.getView());
        }
        capture(name + "-bottom");
        list().setSelectionFromTop(0, 0);
        capture(name);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(sdk = {30, 37})
    public void recoveryKeepsRetryAndBackVisible() throws Exception {
        dialog.dismiss();
        controller.get().getFragmentManager().executePendingTransactions();
        HushTumblrPreferenceFragment.failNextInitialization = new IllegalStateException("render recovery");
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
        capture("recovery");
        assertNull(page.navigation);
        assertEquals(3, list().getCount());
        assertUncutText(dialog.getView());
    }

    private static void assertUncutText(View view) {
        if (view.getVisibility() != View.VISIBLE) return;
        if (view instanceof android.widget.TextView && !(view instanceof EditText)) {
            android.text.Layout text = ((android.widget.TextView) view).getLayout();
            if (text != null) for (int line = 0; line < text.getLineCount(); line++) assertEquals(0, text.getEllipsisCount(line));
        }
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) assertUncutText(group.getChildAt(i));
        }
    }

    private void captureDialog(String name, AlertDialog modal) throws Exception {
        assertNotNull(modal);
        layout(dialog.getView());
        ShadowLooper.idleMainLooper();
        View content = modal.getWindow().getDecorView();
        assertTrue(content.getWidth() > 0 && content.getHeight() > 0);
        Bitmap image = Bitmap.createBitmap(780, 1688, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(image);
        dialog.getView().draw(canvas);
        canvas.drawColor(0x99000000);
        canvas.translate((780 - content.getWidth()) / 2f, (1688 - content.getHeight()) / 2f);
        content.draw(canvas);
        try (FileOutputStream out = new FileOutputStream(new File("build/reports/settings-design", name + ".png"))) {
            assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, out));
        }
        image.recycle();
    }

    private void capture(String name) throws Exception {
        capture(name, 1688);
    }

    private void capture(String name, int height) throws Exception {
        File folder = new File("build/reports/settings-design");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        View root = dialog.getView();
        layout(root, height);
        Bitmap image = Bitmap.createBitmap(780, height, Bitmap.Config.ARGB_8888);
        root.draw(new Canvas(image));
        try (FileOutputStream out = new FileOutputStream(new File(folder, name + ".png"))) {
            assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, out));
        }
        image.recycle();
    }

    /**
     * Puts the screen's window in touch mode, as it is on a phone, a screen reader's included. Out
     * of it the list keeps a selected row: a row added above takes the selection's place rather
     * than the top, and a scroll to a row that takes no taps lands on the next one that does.
     */
    private void touchMode(boolean on) {
        Object root = org.robolectric.util.ReflectionHelpers.callInstanceMethod(
                dialog.getDialog().getWindow().getDecorView(), "getViewRootImpl");
        org.robolectric.util.ReflectionHelpers.callInstanceMethod(root, "ensureTouchMode",
                org.robolectric.util.ReflectionHelpers.ClassParameter.from(boolean.class, on));
        touch = on;
    }

    private static void layout(View root) {
        layout(root, 1688);
    }

    private static void layout(View root, int height) {
        root.measure(View.MeasureSpec.makeMeasureSpec(780, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 780, height);
        ShadowLooper.idleMainLooper();
        root.measure(View.MeasureSpec.makeMeasureSpec(780, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 780, height);
    }

    private void recreate() {
        controller.recreate();
        ShadowLooper.idleMainLooper();
        dialog = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag("hushtumblr_settings");
        assertNotNull(dialog);
        page = page(dialog);
    }

    private static HushTumblrPreferenceFragment page(SettingsDialog dialog) {
        return (HushTumblrPreferenceFragment) dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
    }

    private ListView list() { return dialog.getView().findViewById(android.R.id.list); }

    private boolean hasHomeRow(String id) {
        for (int i = 0; i < list().getCount(); i++) {
            Object item = list().getItemAtPosition(i);
            if (item instanceof Preference && ("section_" + id).equals(((Preference) item).getKey())) return true;
        }
        return false;
    }

    /**
     * Home lists every page this build has, one tap away: Status, Quick setups, a heading over each
     * group that has a page, every page's row, Report a problem and Support. Browse settings heads
     * Feed, Posts, Interface and Privacy, and goes when the build has none of them.
     */
    private void assertHomeListsEveryPage() {
        int links = 0;
        List<String> headings = new ArrayList<>();
        for (int i = 0; i < list().getCount(); i++) {
            Preference row = (Preference) list().getItemAtPosition(i);
            if (row instanceof PreferenceCategory) headings.add(String.valueOf(row.getTitle()));
            else if (row.hasKey() && row.getKey().startsWith("section_")) links++;
        }
        assertEquals("every page has a row on the home page", page.sections().size(), links);
        int browsed = 0;
        for (String id : new String[] {"Feed", "Posts", "Interface", "Privacy"}) if (hasHomeRow(id)) browsed++;
        List<String> expected = new ArrayList<>();
        if (browsed > 0) expected.add("Browse settings");
        if (links > browsed) expected.add("More settings");
        assertEquals("a heading over each group with a page, and no empty one", expected, headings);
        // Status, Quick setups, Report a problem and Support, around the headings and page rows.
        assertEquals(4 + headings.size() + links, list().getCount());
    }

    private boolean contains(String key) {
        return position(key) >= 0;
    }

    private int position(String key) {
        for (int i = 0; i < list().getCount(); i++) {
            if (key.equals(((Preference) list().getItemAtPosition(i)).getKey())) return i;
        }
        return -1;
    }

    private List<String> titles() {
        List<String> titles = new ArrayList<>();
        for (int i = 0; i < list().getCount(); i++) titles.add(String.valueOf(((Preference) list().getItemAtPosition(i)).getTitle()));
        return titles;
    }

    private static Map<String, Object> savedValues() {
        Map<String, Object> values = new TreeMap<>();
        for (Setting<?> setting : Setting.allLoadedSettings()) values.put(setting.key, setting.savedValue());
        return values;
    }

    private boolean longPress(String key) {
        int at = position(key);
        assertTrue("No visible row " + key, at >= 0);
        View row = list().getAdapter().getView(at, null, list());
        boolean took = list().getOnItemLongClickListener().onItemLongClick(list(), row, at, list().getAdapter().getItemId(at));
        ShadowLooper.idleMainLooper();
        return took;
    }

    private void tap(String key) {
        for (int i = 0; i < list().getCount(); i++) {
            if (!key.equals(((Preference) list().getItemAtPosition(i)).getKey())) continue;
            View row = list().getAdapter().getView(i, null, list());
            assertTrue(list().performItemClick(row, i, list().getAdapter().getItemId(i)));
            ShadowLooper.idleMainLooper();
            return;
        }
        fail("No visible row " + key);
    }

    private static EditText findSearch(View view) {
        if (view instanceof EditText) return (EditText) view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                EditText found = findSearch(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }
}
