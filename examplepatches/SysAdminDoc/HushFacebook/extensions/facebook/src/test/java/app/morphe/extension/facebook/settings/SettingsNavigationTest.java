/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.Process;
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

import app.morphe.extension.facebook.misc.FacebookSignature;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.FailingStore;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.Setting;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowPackageManager;
import org.robolectric.shadows.ShadowSigningInfo;
import org.robolectric.shadows.ShadowToast;

/**
 * Exercises the actual dialog host and its filtered view of the original preference model, on
 * Android 11 and on Android 17 (sdk 37).
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {30, 37}, qualifiers = "w390dp-h844dp-night-xhdpi")
@SuppressWarnings("deprecation")
public class SettingsNavigationTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private ActivityController<Activity> controller;
    private SettingsDialog dialog;
    private HushfacebookPreferenceFragment page;

    @Before public void open() {
        // Retained outcomes belong to one process. Give each capture a fresh launch.
        org.robolectric.util.ReflectionHelpers.setStaticField(
                app.morphe.extension.facebook.download.SaveControl.class, "lastOutcome", null);
        Class<?> export = app.morphe.extension.shared.settings.preference.ExportDiagnosticReportPreference.class;
        Object exportState = org.robolectric.util.ReflectionHelpers.getStaticField(export, "state");
        org.robolectric.util.ReflectionHelpers.setStaticField(export, "state",
                exportState.getClass().getEnumConstants()[0]);
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.MATERIAL_YOU_THEME);
        PauseForTests.resume();
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
    }

    @After public void close() {
        controller.close();
        PatchFamily.inBuildForTests = null;
        Settings.TAP_TO_PLAY.resetToDefault();
        Settings.DOWNLOAD_COMPATIBLE.resetToDefault();
        BaseSettings.PAUSED.resetToDefault();
        BaseSettings.HIDE_QUICK_SETUPS.resetToDefault();
        PauseForTests.resume();
    }

    @Test public void homeAndEveryCategoryAreReachableWithoutRemovingTheModel() {
        assertNotNull(page.navigation);
        // Status, Quick setups, Browse settings, six feature categories, More settings, Report a
        // problem, Restart Facebook and Support Hushfacebook.
        assertEquals(13, list().getCount());
        assertEquals(21, page.sections().size());
        int total = page.getPreferenceScreen().getRootAdapter().getCount();
        for (Preference section : page.sections()) {
            assertTrue(page.navigation.open(section));
            assertEquals(((PreferenceCategory) section).getPreferenceCount(), list().getCount());
            assertEquals(total, page.getPreferenceScreen().getRootAdapter().getCount());
            assertNotNull(page.findPreference(Settings.TAP_TO_PLAY.key));
            assertTrue(page.navigation.back());
            while (page.navigation.back()) { }
        }
        assertEquals(13, list().getCount());
    }

    /**
     * The home page ends with Support Hushfacebook, under More settings, Report a problem and Restart Facebook. A tap
     * opens the Ko-fi page in a browser of its own, and with no browser a tip names the address and Facebook keeps running.
     */
    @Test public void theHomePageEndsWithSupportWhichOpensKoFi() {
        Map<String, Object> before = savedValues();
        int last = list().getCount() - 1;
        Preference row = (Preference) list().getItemAtPosition(last);
        assertEquals(HushfacebookPages.SUPPORT, row.getKey());
        assertEquals("Support Hushfacebook", String.valueOf(row.getTitle()));
        assertNull(row.getSummary());
        assertEquals("Restart Facebook", String.valueOf(((Preference) list().getItemAtPosition(last - 1)).getTitle()));
        assertEquals("Report a problem", String.valueOf(((Preference) list().getItemAtPosition(last - 2)).getTitle()));
        assertEquals("More settings", String.valueOf(((Preference) list().getItemAtPosition(last - 3)).getTitle()));
        assertTrue(list().getAdapter().isEnabled(last));

        tap(HushfacebookPages.SUPPORT);
        Intent started = shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull("nothing opened", started);
        assertEquals(Intent.ACTION_VIEW, started.getAction());
        assertEquals("https://ko-fi.com/X8K126YVER", started.getDataString());
        assertTrue(started.hasCategory(Intent.CATEGORY_BROWSABLE));
        assertTrue("the page would open inside Facebook's task",
                (started.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        assertNull(started.getComponent());
        assertEquals("the tap left the home page", last + 1, list().getCount());

        shadowOf(RuntimeEnvironment.getApplication()).checkActivities(true);
        tap(HushfacebookPages.SUPPORT);
        assertEquals("No app on this phone can open the link. The address is " + L10n.isolate("ko-fi.com/X8K126YVER") + ".",
                ShadowToast.getTextOfLatestToast());
        assertFalse(controller.get().isFinishing());
        assertEquals(before, savedValues());
    }

    @Test public void categoryClickChangesOnlyTheSettingWhoseRowWasTapped() {
        assertTrue(page.navigation.open(page.findPreference(Settings.TAP_TO_PLAY.key)));
        assertFalse(Settings.TAP_TO_PLAY.savedValue());
        tap(Settings.TAP_TO_PLAY.key);
        assertTrue(Settings.TAP_TO_PLAY.savedValue());
        assertFalse(Settings.DOWNLOAD_COMPATIBLE.savedValue());
    }

    @Test public void overviewPauseAndUndoUpdateTheSavedSwitchAndRestartNotice() {
        layout(dialog.getView());
        android.widget.Button action = statusAction();
        assertEquals("Pause", action.getText().toString());
        assertTrue(action.getMinimumWidth() <= Math.round(48 * action.getResources().getDisplayMetrics().density));
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertTrue(BaseSettings.PAUSED.savedValue());
        assertTrue(((Preference) list().getItemAtPosition(0)).getSummary().toString()
                .contains("pauses when Facebook restarts"));
        action = statusAction();
        assertEquals("Undo", action.getText().toString());
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertEquals("Pause", statusAction().getText().toString());
        assertFalse(Settings.DOWNLOAD_COMPATIBLE.savedValue());
    }

    /** A Resume the store can't keep leaves the pause on screen, in storage and in the switch, and says so. */
    @Test public void aResumeTheStoreCanNotKeepLeavesThePauseAndSaysSo() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView());
        assertEquals("Resume", statusAction().getText().toString());
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS, FailingStore.Fault.COMMIT_THROWS)) {
            statusAction().performClick();
            ShadowLooper.idleMainLooper();
        }
        layout(dialog.getView());
        assertEquals("Couldn't turn Hushfacebook back on. Try again.", ShadowToast.getTextOfLatestToast());
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
        File marker = HushfacebookPause.markerFile(controller.get());
        File held = new File(marker, "held");
        // A folder with something in it can't be deleted.
        assertTrue(marker.mkdirs() && held.createNewFile());
        try {
            BaseSettings.PAUSED.save(true);
            PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
            recreate();
            layout(dialog.getView());
            statusAction().performClick();
            ShadowLooper.idleMainLooper();
            layout(dialog.getView());
            assertTrue(BaseSettings.PAUSED.savedValue());
            assertEquals("Resume", statusAction().getText().toString());
            String[] lines = String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary()).split("\n", 2);
            String line = lines[0];
            assertTrue(line, line.contains("couldn't be removed") && line.endsWith("then tap Resume again."));
            assertEquals(HushfacebookPreferenceFragment.overviewBuildDetails(), lines[1]);
        } finally {
            held.delete();
            marker.delete();
        }
    }

    private static final String PAUSED_LINE = "Until you resume, every switch but Debug logging and Lock Facebook "
            + "acts as if it were off. Changes made when you patched stay in.";

    /**
     * Paused, a category page opens with a short line that says so, and the saved switches keep
     * showing what was chosen. Resume and Undo act from that line, the page stays where it was, and
     * Back returns to the overview where it was.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void aPausedCategoryPageSaysSoAndKeepsItsPlaceThroughResumeAndUndo() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView(), 1200);
        list().scrollListBy(120);
        int homePosition = list().getFirstVisiblePosition();
        int homeOffset = list().getChildAt(0).getTop();

        page.navigation.navigate("News feed");
        layout(dialog.getView(), 1200);
        Preference line = (Preference) list().getItemAtPosition(0);
        assertEquals("Hushfacebook is paused", String.valueOf(line.getTitle()));
        assertEquals(PAUSED_LINE, String.valueOf(line.getSummary()));
        assertFalse("the line reads as a button of its own", list().getAdapter().isEnabled(0));
        assertTrue("a saved choice was changed to look paused",
                ((SwitchPreference) page.findPreference(Settings.HIDE_SPONSORED_POSTS.key)).isChecked());
        assertTrue(Settings.HIDE_SPONSORED_POSTS.savedValue());

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
        assertEquals("Hushfacebook turns back on when Facebook restarts.",
                String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary()));
        assertTrue("Resume left the page", contains(Settings.HIDE_SPONSORED_POSTS.key));
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

    /** Search results say it too, and a page with nothing Pause turns off, like About, doesn't. */
    @Test public void pausedSearchSaysSoAndPagesPauseDoesNotReachStayAsTheyAre() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        recreate();
        findSearch(dialog.getView()).setText("Tap to play");
        ShadowLooper.idleMainLooper();
        assertEquals(PAUSED_LINE, String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary()));
        assertTrue(contains(Settings.TAP_TO_PLAY.key));
        page.navigation.back();
        for (String quiet : new String[]{"About", "Set when you patched"}) {
            page.navigation.navigate(quiet);
            assertEquals(quiet, categoryCount(quiet), list().getCount());
            while (page.navigation.back()) { }
        }
    }

    /**
     * Pause switched on from its own page is owed a restart: the page says so, the restart row
     * sits under that line, and Undo takes both back. A change owed a restart brings the row up
     * on every page, first on a page without a pause line and under the home page's status card.
     */
    @Test public void aPauseOrAChangeWaitingOnARestartBringsUpTheRestartRow() {
        page.navigation.navigate("Pause, backup and diagnostics");
        tap(BaseSettings.PAUSED.key);
        layout(dialog.getView());
        Preference line = (Preference) list().getItemAtPosition(0);
        assertEquals("Hushfacebook is on", String.valueOf(line.getTitle()));
        assertEquals("Hushfacebook pauses when Facebook restarts.", String.valueOf(line.getSummary()));
        Preference restart = (Preference) list().getItemAtPosition(1);
        assertEquals(SettingsNavigation.RESTART, restart.getKey());
        assertEquals("Restart Facebook to apply this change", String.valueOf(restart.getTitle()));
        assertEquals("Facebook closes and reopens on this page.", String.valueOf(restart.getSummary()));
        assertTrue("the restart row can't be tapped", list().getAdapter().isEnabled(1));
        assertNull("a restart saved message went to a toast instead of the row", ShadowToast.getLatestToast());
        pageAction().performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertEquals(BaseSettings.PAUSED.key, ((Preference) list().getItemAtPosition(0)).getKey());
        assertFalse(contains(SettingsNavigation.RESTART));

        page.navigation.back();
        app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                Settings.MARKETPLACE_ONLY.key);
        page.navigation.navigate("Opening Facebook");
        // Keep the viewport shorter than the page, so the first row is the page's own start.
        layout(dialog.getView(), 1200);
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(0)).getKey());
        assertEquals("The opening page must start at the restart row", 0, list().getFirstVisiblePosition());
        TextView boundTitle = list().getChildAt(0).findViewById(android.R.id.title);
        assertEquals("Restart Facebook to apply this change", String.valueOf(boundTitle.getText()));
        assertEquals(categoryCount("Opening Facebook") + 1, list().getCount());
        page.navigation.back();
        page.navigation.navigate("Playback");
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(0)).getKey());
        assertEquals(categoryCount("Playback") + 1, list().getCount());
        while (page.navigation.back()) { }
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(1)).getKey());
        assertEquals(13, list().getCount());

        // Two changes are counted, and the row goes once neither is owed.
        app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                Settings.BOTTOM_TAB_BAR.key);
        page.navigation.restartChanged();
        assertEquals("Restart Facebook to apply 2 changes",
                String.valueOf(((Preference) list().getItemAtPosition(1)).getTitle()));
        app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        page.navigation.restartChanged();
        assertFalse(contains(SettingsNavigation.RESTART));
        assertEquals(13, list().getCount());
    }

    /**
     * A row's icon pushes its text in, so every row of a card has an icon or none does, and the
     * card's text starts in one line. "Forget seen posts" and "Hide reaction counts" started theirs
     * 78 px in from the switches around them (device audit, 2026-10-15). A card is a run of rows of
     * one group, the way the list draws it, on every page, running and paused.
     */
    @Test public void aCardHasAnIconOnEveryRowOrOnNone() {
        List<String> mixed = new ArrayList<>();
        for (boolean paused : new boolean[]{false, true}) {
            if (paused) {
                PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
                recreate();
            }
            mixedCards("home", mixed);
            for (Preference section : page.sections()) {
                String title = String.valueOf(section.getTitle());
                page.navigation.navigate(title);
                mixedCards(title, mixed);
                page.navigation.back();
            }
        }
        assertEquals("cards mixing rows with and without an icon", new ArrayList<String>(), mixed);
    }

    /** Adds each card of the page shown now whose rows mix icons and none to [mixed]. */
    private void mixedCards(String pageName, List<String> mixed) {
        Object card = null;
        List<String> with = new ArrayList<>();
        List<String> without = new ArrayList<>();
        for (int position = 0; position <= list().getCount(); position++) {
            Preference row = position < list().getCount() ? (Preference) list().getItemAtPosition(position) : null;
            Object group = row == null || row instanceof PreferenceCategory ? null : page.navigation.group(row);
            if (group == null || group != card) {
                if (!with.isEmpty() && !without.isEmpty()) mixed.add(pageName + ": " + with + " beside " + without);
                with = new ArrayList<>();
                without = new ArrayList<>();
                card = group;
            }
            if (group != null) (row.getIcon() != null ? with : without).add(String.valueOf(row.getTitle()));
        }
    }

    /** A switch that needs a restart brings the row up the moment it's flipped, and flipping it back takes it away. */
    @Test public void flippingARestartGatedSwitchShowsTheRowAtOnce() {
        try {
            page.navigation.navigate("Privacy");
            assertFalse(contains(SettingsNavigation.RESTART));
            tap(Settings.HOLD_ANALYTICS_UPLOADS.key);
            assertTrue(Settings.HOLD_ANALYTICS_UPLOADS.savedValue());
            assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(0)).getKey());
            assertEquals("Restart Facebook to apply this change",
                    String.valueOf(((Preference) list().getItemAtPosition(0)).getTitle()));
            assertNull("the restart was said in a toast with nothing to tap", ShadowToast.getLatestToast());
            tap(Settings.HOLD_ANALYTICS_UPLOADS.key);
            assertFalse(Settings.HOLD_ANALYTICS_UPLOADS.savedValue());
            assertFalse(contains(SettingsNavigation.RESTART));
        } finally {
            Settings.HOLD_ANALYTICS_UPLOADS.resetToDefault();
        }
    }

    /**
     * The font, emoji, text size and accent rows all tell the person to restart Facebook, so a
     * change to any of them brings the row up rather than leaving the restart to them.
     */
    @Test public void appearanceChoicesThatSayRestartBringUpTheRow() {
        assertTrue(Settings.USE_SYSTEM_FONT.rebootApp);
        assertTrue(Settings.USE_SYSTEM_EMOJI.rebootApp);
        assertTrue(Settings.TEXT_SIZE.rebootApp);
        assertTrue(Settings.ACCENT_COLOR.rebootApp);
        try {
            page.navigation.navigate("Appearance");
            assertFalse(contains(SettingsNavigation.RESTART));
            tap(Settings.USE_SYSTEM_FONT.key);
            assertTrue(Settings.USE_SYSTEM_FONT.savedValue());
            assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(0)).getKey());
        } finally {
            Settings.USE_SYSTEM_FONT.resetToDefault();
        }
    }

    /**
     * The home page's own Restart Facebook row, just above Support, restarts Facebook with no change waiting and brings
     * the screen back on the home page. While a change waits, the counting restart row at the top is the page's only one.
     */
    @Test public void theHomePageHasItsOwnRestartRowUntilAChangeWaits() {
        List<Context> restarted = new ArrayList<>();
        app.morphe.extension.shared.settings.preference.ReopenSettingsAfterRestart.setRestarterForTests(restarted::add);
        int own = position(SettingsNavigation.RESTART_NOW);
        assertEquals(list().getCount() - 2, own);
        Preference row = (Preference) list().getItemAtPosition(own);
        assertEquals("Restart Facebook", String.valueOf(row.getTitle()));
        assertEquals("Facebook closes and reopens on this page.", String.valueOf(row.getSummary()));
        assertFalse(contains(SettingsNavigation.RESTART));

        app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                Settings.HOLD_ANALYTICS_UPLOADS.key);
        page.navigation.restartChanged();
        assertFalse("two restart rows on one page", contains(SettingsNavigation.RESTART_NOW));
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(1)).getKey());
        app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        page.navigation.restartChanged();
        assertFalse(contains(SettingsNavigation.RESTART));
        assertEquals(own, position(SettingsNavigation.RESTART_NOW));

        // Only the home page has it.
        page.navigation.navigate("Privacy");
        assertFalse(contains(SettingsNavigation.RESTART_NOW));
        while (page.navigation.back()) { }

        Map<String, Object> before = savedValues();
        tap(SettingsNavigation.RESTART_NOW);
        assertEquals(1, restarted.size());
        assertEquals(before, savedValues());
        assertEquals("", app.morphe.extension.shared.settings.preference.ReopenSettingsAfterRestart
                .takeFresh(Setting.preferences.preferences, android.os.SystemClock.elapsedRealtime()));
    }

    /** The row restarts Facebook and leaves a marker that opens the screen again on this page. */
    @Test public void theRestartRowRestartsIntoThePageItWasTappedOn() {
        List<Context> restarted = new ArrayList<>();
        app.morphe.extension.shared.settings.preference.ReopenSettingsAfterRestart.setRestarterForTests(restarted::add);
        app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                Settings.HOLD_ANALYTICS_UPLOADS.key);
        page.navigation.navigate("Privacy");
        Map<String, Object> before = savedValues();
        tap(SettingsNavigation.RESTART);
        assertEquals(1, restarted.size());
        assertEquals(before, savedValues());
        assertEquals("Privacy", app.morphe.extension.shared.settings.preference.ReopenSettingsAfterRestart
                .takeFresh(Setting.preferences.preferences, android.os.SystemClock.elapsedRealtime()));
    }

    /** Asked to open on a page, as after that restart, the screen starts there with its title and no search. */
    @Test public void aScreenAskedToStartOnAPageOpensThere() {
        dialog.dismissAllowingStateLoss();
        ShadowLooper.idleMainLooper();
        dialog = SettingsDialog.onPage("Links");
        dialog.show(controller.get().getFragmentManager(), "hushfacebook_settings");
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        page = page(dialog);
        assertTrue(contains(Settings.OPEN_LINKS_EXTERNALLY.key));
        assertEquals(categoryCount("Links"), list().getCount());
        assertEquals(View.GONE, ((View) findSearch(dialog.getView()).getParent()).getVisibility());
        assertTrue(page.navigation.back());
        assertTrue("Back from a More settings page goes to More settings", contains("section_Links"));

        // A page this build doesn't have opens the first page.
        dialog.dismissAllowingStateLoss();
        ShadowLooper.idleMainLooper();
        dialog = SettingsDialog.onPage("No such page");
        dialog.show(controller.get().getFragmentManager(), "hushfacebook_settings");
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        page = page(dialog);
        assertEquals(13, list().getCount());
    }

    /** Each Quick setups choice changes its switches through their rows and says how many changed. */
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
            int quiet = offOnScreen(QuickSetupKeys.QUIET);
            assertTrue("Quiet would change nothing on a fresh install", quiet > 0);
            choices.getListView().performItemClick(null, 0, 0);
            ShadowLooper.idleMainLooper();
            for (BooleanSetting setting : QuickSetupKeys.QUIET) {
                if (page.findPreference(setting.key) != null) assertTrue(setting.key, setting.savedValue());
            }
            assertEquals("Changed " + quiet + " settings", ShadowToast.getTextOfLatestToast());
            assertFalse("Quiet has no switch that waits for a restart", contains(SettingsNavigation.RESTART));

            // Privacy holds back analytics and camera roll processing, which wait for a restart.
            int privacy = offOnScreen(QuickSetupKeys.PRIVACY);
            assertEquals(privacy, page.applyQuickSetup(QuickSetupKeys.privacy()));
            assertEquals("Changed " + privacy + " settings", ShadowToast.getTextOfLatestToast());
            assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(1)).getKey());
            assertEquals("Restart Facebook to apply 2 changes",
                    String.valueOf(((Preference) list().getItemAtPosition(1)).getTitle()));

            assertEquals(0, page.applyQuickSetup(QuickSetupKeys.quiet()));
            assertEquals("Changed 0 settings", ShadowToast.getTextOfLatestToast());
            assertEquals(quiet + privacy, page.applyQuickSetup(QuickSetupKeys.defaults()));
            for (BooleanSetting setting : QuickSetupKeys.DEFAULTS) {
                assertEquals(setting.key, setting.defaultValue, setting.savedValue());
            }
            assertFalse("putting the switches back left the restart owed", contains(SettingsNavigation.RESTART));
        } finally {
            for (BooleanSetting setting : QuickSetupKeys.DEFAULTS) setting.resetToDefault();
        }
    }

    /** A long press on the Quick setups row takes it off the home page and says where it comes back. */
    @Test public void aLongPressOnQuickSetupsHidesTheRowAndSaysWhereItComesBack() {
        Preference row = (Preference) list().getItemAtPosition(1);
        assertEquals(SettingsNavigation.QUICK_SETUPS, row.getKey());
        assertTrue(String.valueOf(row.getSummary()).endsWith(" Press and hold to hide this row."));
        assertTrue(String.valueOf(row.getSummary()).startsWith("Turn on a set of switches in one tap"));
        assertFalse(BaseSettings.HIDE_QUICK_SETUPS.savedValue());
        // Any other row keeps its own behavior.
        assertFalse(longPress(HushfacebookPages.SUPPORT));
        assertFalse(BaseSettings.HIDE_QUICK_SETUPS.savedValue());
        assertTrue(contains(SettingsNavigation.QUICK_SETUPS));

        assertTrue(longPress(SettingsNavigation.QUICK_SETUPS));
        assertTrue(BaseSettings.HIDE_QUICK_SETUPS.savedValue());
        assertTrue(Setting.preferences.preferences.getBoolean(BaseSettings.HIDE_QUICK_SETUPS.key, false));
        assertFalse("the row stayed on the home page", contains(SettingsNavigation.QUICK_SETUPS));
        assertEquals(12, list().getCount());
        assertEquals("Quick setups hidden. Bring it back from Pause, backup and diagnostics.",
                ShadowToast.getTextOfLatestToast());
        assertFalse("hiding the row waits for no restart", contains(SettingsNavigation.RESTART));
    }

    /** The row on Pause, backup and diagnostics shows the state and a tap flips it, home page included. */
    @Test public void theRestoreRowBringsQuickSetupsBackAndFlipsItsSummary() {
        assertTrue(longPress(SettingsNavigation.QUICK_SETUPS));
        page.navigation.navigate("Pause, backup and diagnostics");
        Preference restore = (Preference) list().getItemAtPosition(position(HushfacebookPages.QUICK_SETUPS_HOME));
        assertEquals("Quick setups on the home page", String.valueOf(restore.getTitle()));
        assertEquals("Hidden. Tap to show it again.", String.valueOf(restore.getSummary()));
        assertNull("the row stores nothing of its own", Setting.getSettingFromPath(restore.getKey()));
        tap(HushfacebookPages.QUICK_SETUPS_HOME);
        assertFalse(BaseSettings.HIDE_QUICK_SETUPS.savedValue());
        assertEquals("Shown. Tap to hide it.", String.valueOf(restore.getSummary()));
        while (page.navigation.back()) { }
        assertTrue(contains(SettingsNavigation.QUICK_SETUPS));
        assertEquals(13, list().getCount());
        // And back the other way from the same row.
        page.navigation.navigate("Pause, backup and diagnostics");
        tap(HushfacebookPages.QUICK_SETUPS_HOME);
        assertTrue(BaseSettings.HIDE_QUICK_SETUPS.savedValue());
        assertEquals("Hidden. Tap to show it again.", String.valueOf(restore.getSummary()));
        while (page.navigation.back()) { }
        assertFalse(contains(SettingsNavigation.QUICK_SETUPS));
    }

    /** The restore row shows up in the settings search. */
    @Test public void searchFindsTheQuickSetupsRestoreRow() {
        findSearch(dialog.getView()).setText("quick setups on the home page");
        assertTrue(titles().toString(), titles().contains("Quick setups on the home page"));
    }

    private boolean longPress(String key) {
        for (int i = 0; i < list().getCount(); i++) {
            if (!key.equals(((Preference) list().getItemAtPosition(i)).getKey())) continue;
            View row = list().getAdapter().getView(i, null, list());
            boolean handled = list().getOnItemLongClickListener()
                    .onItemLongClick(list(), row, i, list().getAdapter().getItemId(i));
            ShadowLooper.idleMainLooper();
            return handled;
        }
        fail("No visible row " + key);
        return false;
    }

    /** How many of [settings] have a switch on this screen that's off now. */
    private int offOnScreen(List<BooleanSetting> settings) {
        int off = 0;
        for (BooleanSetting setting : settings) {
            Preference row = page.findPreference(setting.key);
            if (row instanceof android.preference.TwoStatePreference
                    && !((android.preference.TwoStatePreference) row).isChecked()) off++;
        }
        return off;
    }

    /** Report a problem opens GitHub's bug form in a browser with the versions and switches filled in. */
    @Test public void reportAProblemOpensAFilledInGitHubForm() throws Exception {
        Map<String, Object> before = savedValues();
        tap(SettingsNavigation.REPORT);
        Intent started = shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull("nothing opened", started);
        assertEquals(Intent.ACTION_VIEW, started.getAction());
        assertTrue(started.hasCategory(Intent.CATEGORY_BROWSABLE));
        assertTrue((started.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        String url = started.getDataString();
        assertTrue(url, url.startsWith("https://github.com/SysAdminDoc/Hushfacebook/issues/new?template=bug_report.yml&"));
        assertTrue(url, url.length() <= app.morphe.extension.shared.settings.preference.ReportProblem.MAX_LENGTH);
        String decoded = java.net.URLDecoder.decode(url, "UTF-8");
        assertTrue(decoded, decoded.contains("&versions=Hushfacebook "));
        assertTrue(decoded, decoded.contains(" on Facebook "));
        assertTrue(decoded, decoded.contains("&device="));
        assertTrue(decoded, decoded.contains("What happened:"));
        assertTrue(decoded, decoded.contains("What I expected:"));
        // Hide sponsored posts starts on, Marketplace only starts off.
        assertTrue(decoded, decoded.contains("Switches on: "));
        assertTrue(decoded, decoded.contains("Hide sponsored posts"));
        assertFalse(decoded, decoded.contains("Marketplace only"));
        assertEquals(before, savedValues());

        shadowOf(RuntimeEnvironment.getApplication()).checkActivities(true);
        tap(SettingsNavigation.REPORT);
        assertEquals("No app on this phone can open the link. The address is "
                + L10n.isolate("github.com/SysAdminDoc/Hushfacebook") + ".", ShadowToast.getTextOfLatestToast());
        assertFalse(controller.get().isFinishing());
    }

    /** The paused line on real pages, dark and light, for a look before the phone does. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void renderPausedPages() throws Exception {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        recreate();
        page.navigation.navigate("News feed");
        capture("paused-news-feed");
        assertUncutText(dialog.getView());
        pageAction().performClick();
        ShadowLooper.idleMainLooper();
        capture("paused-news-feed-resume-pending");
        page.navigation.back();
        findSearch(dialog.getView()).setText("video");
        capture("paused-search");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h844dp-notnight-xhdpi")
    public void renderPausedPageInTheLightTheme() throws Exception {
        controller.close();
        PatchFamily.inBuildForTests.add(PatchFamily.MATERIAL_YOU_THEME);
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
        assertTrue(ScreenColors.shown.light);
        page.navigation.navigate("Playback");
        capture("light-paused-playback");
        assertUncutText(dialog.getView());
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rXB-ldrtl-w390dp-h844dp-night-xhdpi")
    public void aPausedPageKeepsItsLineWholeAtLargeRightToLeftText() throws Exception {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        try {
            recreate();
            page.navigation.navigate("Playback");
            layout(dialog.getView());
            assertUncutText(dialog.getView());
            capture("large-rtl-paused-playback");
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    private android.widget.Button pageAction() {
        // Bound like tap() binds a row: out of touch mode the list keeps its selected row in place,
        // so a page taller than the viewport can open a row down. A phone has no selection.
        android.view.ViewGroup frame = list().getAdapter().getView(0, null, list())
                .findViewById(android.R.id.widget_frame);
        assertEquals(1, frame.getChildCount());
        return (android.widget.Button) frame.getChildAt(0);
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
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView());
        TextView summary = list().getChildAt(0).findViewById(android.R.id.summary);
        String[] lines = summary.getText().toString().split("\n", 2);
        assertEquals("Tap Resume, then restart Facebook.", lines[0]);
        assertEquals(HushfacebookPreferenceFragment.overviewBuildDetails().replace('\n', ' '), lines[1]);
    }

    /**
     * At twice the text size the button beside the status text left the name too little room and
     * "Hushfacebook" broke inside the word. The button now precedes long recovery advice too.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void atLargeTextTheStatusActionSitsBetweenItsTitleAndAdvice() {
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
            assertTrue("the button overlaps the title", action.getTop() >= title.getBottom());
            assertTrue("the button overlaps the advice", action.getBottom() <= summary.getTop());
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
        android.view.ViewGroup frame = list().getChildAt(0).findViewById(android.R.id.widget_frame);
        assertEquals(1, frame.getChildCount());
        return (android.widget.Button) frame.getChildAt(0);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w384dp-h824dp-night-450dpi")
    public void qualityDialogShowsAllSixChoicesWithoutClippingTheLastRow() {
        ValueRows.QualityRow quality = (ValueRows.QualityRow)
                page.findPreference(Settings.DOWNLOAD_QUALITY.key);
        quality.showDialog(null);
        try {
            layout(dialog.getView());
            ShadowLooper.idleMainLooper();
            ListView choices = ((AlertDialog) quality.getDialog()).getListView();
            assertEquals(6, choices.getCount());
            assertEquals(5, choices.getLastVisiblePosition());
            View last = choices.getChildAt(choices.getChildCount() - 1);
            assertTrue("Last quality choice extends beyond the visible list",
                    last.getBottom() <= choices.getHeight() - choices.getPaddingBottom());
        } finally {
            quality.getDialog().dismiss();
        }
    }

    @Test public void searchUsesRealControlsAndClearReturnsHome() {
        EditText search = findSearch(dialog.getView());
        assertNotNull(search);
        search.setText("other apps");
        ShadowLooper.idleMainLooper();
        assertTrue(contains(Settings.DOWNLOAD_COMPATIBLE.key));
        tap(Settings.DOWNLOAD_COMPATIBLE.key);
        assertTrue(Settings.DOWNLOAD_COMPATIBLE.savedValue());
        search.setText("noSuchSetting987654");
        assertEquals(1, list().getCount());
        assertFalse(list().getAdapter().isEnabled(0));
        assertEquals("No matching settings", ((Preference) list().getItemAtPosition(0)).getTitle());
        assertTrue(page.navigation.back());
        assertEquals("", search.getText().toString());
        assertEquals(13, list().getCount());
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w320dp-h640dp-night-xhdpi")
    public void narrowHeaderAndSearchStayReadableAtLargeText() throws Exception {
        checkHeaderAndSearch(2f, "header-narrow-large");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rXB-ldrtl-w320dp-h640dp-night-xhdpi")
    public void narrowRightToLeftHeaderAndSearchStayReadableAtLargeText() throws Exception {
        checkHeaderAndSearch(2f, "header-narrow-large-rtl");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void ordinaryHeaderAndSearchKeepTheirSpacing() throws Exception {
        checkHeaderAndSearch(1f, "header-ordinary");
    }

    private void checkHeaderAndSearch(float scale, String name) throws Exception {
        RuntimeEnvironment.setFontScale(scale);
        try {
            recreate();
            View root = dialog.getView();
            float density = root.getResources().getDisplayMetrics().density;
            int width = Math.round(root.getResources().getConfiguration().screenWidthDp * density);
            int height = Math.round(root.getResources().getConfiguration().screenHeightDp * density);
            TextView title = findHeading(root);
            assertNotNull("The page title must remain an accessibility heading", title);
            View back = findDescribed(root, L10n.t("Back"));
            assertNotNull("The back action must remain available", back);
            android.view.ViewGroup bar = (android.view.ViewGroup) back.getParent();
            android.view.ViewGroup heading = (android.view.ViewGroup) title.getParent();
            EditText search = findSearch(root);
            View clear = findDescribed(root, L10n.t("Clear search"));
            assertNotNull("The search must retain its clear action", clear);
            for (int pass = 0; pass < 3; pass++) {
                root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
                root.layout(0, 0, width, height);
                ShadowLooper.idleMainLooper();
            }
            File folder = new File("build/reports/settings-design");
            assertTrue(folder.isDirectory() || folder.mkdirs());
            Bitmap image = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            root.draw(new Canvas(image));
            try (FileOutputStream out = new FileOutputStream(new File(folder, name + ".png"))) {
                assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, out));
            }
            image.recycle();
            assertEquals("Hushfacebook", title.getText().toString());
            assertEquals("The app name must not break inside the word", 1, title.getLineCount());
            assertTrue("The whole title must fit", title.getPaint().measureText(title.getText().toString())
                    <= title.getWidth() - title.getCompoundPaddingLeft() - title.getCompoundPaddingRight());
            if (root.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL) {
                assertEquals("The Latin app name must align with the heading's right edge in RTL",
                        title.getWidth() - title.getCompoundPaddingLeft() - title.getCompoundPaddingRight(),
                        title.getLayout().getLineRight(0), 1f);
            }
            assertTrue("The whole search hint must fit", search.getPaint().measureText(search.getHint().toString())
                    <= search.getWidth() - search.getCompoundPaddingLeft() - search.getCompoundPaddingRight());
            assertEquals(L10n.t("Search settings"), search.getContentDescription().toString());
            assertTrue(search.isFocusable());
            assertEquals(L10n.t("Back"), back.getContentDescription().toString());
            assertTrue(back.getWidth() >= 48 * density && back.getHeight() >= 48 * density);
            assertTrue("The page title must sit below the back toolbar", heading.getTop() >= bar.getBottom());
            assertTrue("The search must sit below the page title", search.getTop() + ((View) search.getParent()).getTop()
                    >= heading.getBottom());
            if (scale == 1f) {
                assertEquals(32 * density, title.getTextSize(), 0.1f);
                assertEquals(View.INVISIBLE, clear.getVisibility());
                assertEquals(8 * density, bar.getPaddingStart(), 0.1f);
                assertEquals(20 * density, bar.getPaddingEnd(), 0.1f);
                assertEquals(20 * density, heading.getPaddingStart(), 0.1f);
                assertEquals(20 * density, heading.getPaddingEnd(), 0.1f);
            }
            search.setText("video");
            assertEquals(View.VISIBLE, clear.getVisibility());
            assertTrue(clear.isClickable());
            assertTrue(clear.performClick());
            assertEquals("", search.getText().toString());
            assertEquals(13, list().getCount());
            android.app.Dialog shown = dialog.getDialog();
            assertTrue(back.performClick());
            assertFalse(shown.isShowing());
        } finally {
            RuntimeEnvironment.setFontScale(1f);
        }
    }

    private static TextView findHeading(View view) {
        if (view instanceof TextView && view.isAccessibilityHeading()) return (TextView) view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = findHeading(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static View findDescribed(View view, String description) {
        if (view.getContentDescription() != null && description.contentEquals(view.getContentDescription())) return view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findDescribed(group.getChildAt(i), description);
                if (found != null) return found;
            }
        }
        return null;
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
        search.setText("t");
        TextView count = resultCount(dialog.getView());
        assertNotNull("a live region for the result count", count);
        count.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int before, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int after) { spoken.add(s.toString()); }
            @Override public void afterTextChanged(android.text.Editable s) { }
        });
        search.setText("ta");
        search.setText("tap to");
        search.setText("tap to play");
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
        page.navigation.navigate("Playback");
        layout(dialog.getView());
        page.navigation.back();
        layout(dialog.getView());
        assertEquals("Playback", focusedTitle(a11y));
        page.navigation.navigate("more");
        layout(dialog.getView());
        // A reader reaches About before opening it: it's the last row, below the fold here.
        list().setSelection(list().getCount() - 1);
        layout(dialog.getView());
        page.navigation.navigate("About");
        layout(dialog.getView());
        page.navigation.back();
        layout(dialog.getView());
        assertEquals("About", focusedTitle(a11y));
        page.navigation.back();
        layout(dialog.getView());
        assertEquals("More settings", focusedTitle(a11y));
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

    /**
     * Discussion #17 asked how to block Reels. The words people type reach the map, each line whose
     * patch is in opens its setting's page on that setting's row, and nothing saved changes.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void blockReelsFindsTheMapAndEachLinkOpensItsSettingWithoutChangingOne() throws Exception {
        Map<String, Object> before = savedValues();
        findSearch(dialog.getView()).setText("block reels");
        capture("search-block-reels");
        assertTrue(titles().toString(), titles().containsAll(Arrays.asList("How to block Reels", "Reels in the feed",
                "Reels that play by themselves", "The Reels tab", "Everything except Marketplace")));
        findSearch(dialog.getView()).setText("reels");
        assertTrue(titles().toString(), titles().contains("How to block Reels"));
        page.navigation.back();

        String[][] links = {
                {Settings.HIDE_FEED_REELS.key, "News feed"},
                {Settings.TAP_TO_PLAY.key, "Playback"},
                {Settings.HIDE_REELS_TAB.key, "Reels and Watch"},
                {Settings.MARKETPLACE_ONLY.key, "Opening Facebook"}};
        for (String[] link : links) {
            page.navigation.navigate("Reels and Watch");
            tap("action_show_" + link[0]);
            layout(dialog.getView(), 1200);
            int row = position(link[0]);
            assertTrue(link[0] + " wasn't opened", row >= 0);
            assertEquals(link[1], String.valueOf(((Preference) list().getItemAtPosition(row)).getParent().getTitle()));
            assertTrue(link[0] + " is off screen at " + row + " of " + list().getFirstVisiblePosition() + ".."
                            + list().getLastVisiblePosition(),
                    row >= list().getFirstVisiblePosition() && row <= list().getLastVisiblePosition());
            while (page.navigation.back()) { }
        }
        assertEquals(before, savedValues());
    }

    /**
     * A build that lacks default patches says how many under the card, and a tap opens and closes
     * their names. Every default patch in, the row isn't there (the twelve rows of the first test).
     */
    @Test public void theOverviewNamesTheDefaultPatchesABuildLacks() {
        assertFalse(contains(HushfacebookPreferenceFragment.MISSING_DEFAULTS));
        assertFalse(contains(HushfacebookPreferenceFragment.MISSING_RESTORE_TRUST));
        controller.close();
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.MATERIAL_YOU_THEME);
        PatchFamily.inBuildForTests.remove(PatchFamily.SPONSORED_REELS);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
        Map<String, Object> before = savedValues();

        assertEquals(14, list().getCount());
        assertEquals(1, position(HushfacebookPreferenceFragment.MISSING_DEFAULTS));
        Preference row = (Preference) list().getItemAtPosition(1);
        assertEquals("1 default patch isn't in this build", String.valueOf(row.getTitle()));
        assertEquals("Tap to see which.", String.valueOf(row.getSummary()));
        tap(HushfacebookPreferenceFragment.MISSING_DEFAULTS);
        assertEquals("Not in this build: " + L10n.isolate("Hide sponsored reels") + ". Morphe Manager selects it by "
                + "default. Patch again with it selected to get what it does.", String.valueOf(row.getSummary()));
        tap(HushfacebookPreferenceFragment.MISSING_DEFAULTS);
        assertEquals("Tap to see which.", String.valueOf(row.getSummary()));
        assertEquals(before, savedValues());

        controller.close();
        PatchFamily.inBuildForTests.remove(PatchFamily.SPONSORED_POSTS);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
        row = (Preference) list().getItemAtPosition(1);
        assertEquals("2 default patches aren't in this build", String.valueOf(row.getTitle()));
        tap(HushfacebookPreferenceFragment.MISSING_DEFAULTS);
        assertEquals("Not in this build: " + L10n.isolate("Hide sponsored posts") + " and "
                + L10n.isolate("Hide sponsored reels") + ". Morphe Manager selects them by default. Patch again with "
                + "them selected to get what they do.", String.valueOf(row.getSummary()));
    }

    @Test public void theOverviewExplainsMissingRestoreScreensOnReSignedBuilds() {
        controller.close();
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.MATERIAL_YOU_THEME);
        PatchFamily.inBuildForTests.remove(PatchFamily.RESTORE_TRUST);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);

        assertEquals(14, list().getCount());
        assertEquals(1, position(HushfacebookPreferenceFragment.MISSING_RESTORE_TRUST));
        assertFalse(contains(HushfacebookPreferenceFragment.MISSING_DEFAULTS));
        Preference row = (Preference) list().getItemAtPosition(1);
        assertEquals("Profiles, photos and posts won't open", String.valueOf(row.getTitle()));
        assertEquals("Patch again with " + L10n.isolate("Restore screens on re-signed builds")
                + " selected. A patched Facebook needs it to open profiles, photos, posts and some of Facebook's Settings pages.",
                String.valueOf(row.getSummary()));
        assertFalse(list().getAdapter().isEnabled(1));
    }

    @Test public void missingRestoreScreensComesBeforeOtherMissingDefaults() {
        controller.close();
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.MATERIAL_YOU_THEME);
        PatchFamily.inBuildForTests.remove(PatchFamily.RESTORE_TRUST);
        PatchFamily.inBuildForTests.remove(PatchFamily.SPONSORED_REELS);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);

        assertEquals(15, list().getCount());
        assertEquals(1, position(HushfacebookPreferenceFragment.MISSING_RESTORE_TRUST));
        assertEquals(2, position(HushfacebookPreferenceFragment.MISSING_DEFAULTS));
        Preference defaults = (Preference) list().getItemAtPosition(2);
        assertEquals("1 default patch isn't in this build", String.valueOf(defaults.getTitle()));
        tap(HushfacebookPreferenceFragment.MISSING_DEFAULTS);
        assertEquals("Not in this build: " + L10n.isolate("Hide sponsored reels")
                + ". Morphe Manager selects it by default. Patch again with it selected to get what it does.",
                String.valueOf(defaults.getSummary()));
    }

    @Test public void rootMountInstallDoesNotWarnAboutMissingRestoreScreens() {
        controller.close();
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.MATERIAL_YOU_THEME);
        PatchFamily.inBuildForTests.remove(PatchFamily.RESTORE_TRUST);
        installSelf(metaCertificate());
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);

        assertEquals(13, list().getCount());
        assertFalse(contains(HushfacebookPreferenceFragment.MISSING_RESTORE_TRUST));
        assertFalse(contains(HushfacebookPreferenceFragment.MISSING_DEFAULTS));
    }

    /** A re-signed clone checks its own key, not that of Meta's Facebook installed beside it. */
    @Test public void aCloneBesideStockFacebookIsCheckedForItsOwnKey() {
        controller.close();
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.MATERIAL_YOU_THEME);
        PatchFamily.inBuildForTests.remove(PatchFamily.RESTORE_TRUST);
        install("com.facebook.katana", metaCertificate());
        install(CloneActivity.PACKAGE, new Signature("308201a0b1c2d3"));
        ActivityController<CloneActivity> clone = Robolectric.buildActivity(CloneActivity.class).setup().visible();
        try {
            dialog = SettingsL10nTest.show(clone.get());
            page = page(dialog);
            assertEquals(1, position(HushfacebookPreferenceFragment.MISSING_RESTORE_TRUST));
        } finally {
            clone.close();
        }
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
    }

    /** Pausing turns the controls off, but the build still needs patching again, so the warning stays. */
    @Test public void pauseLeavesTheMissingRestoreScreensWarningUp() {
        controller.close();
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.MATERIAL_YOU_THEME);
        PatchFamily.inBuildForTests.remove(PatchFamily.RESTORE_TRUST);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);

        // Paused with the switch off, the next start turns Hushfacebook back on: the restart row
        // comes first under the card, and the warning stays right under it.
        assertEquals(1, position(SettingsNavigation.RESTART));
        assertEquals(2, position(HushfacebookPreferenceFragment.MISSING_RESTORE_TRUST));
        assertEquals("Profiles, photos and posts won't open",
                String.valueOf(((Preference) list().getItemAtPosition(2)).getTitle()));
    }

    public static class CloneActivity extends Activity {
        static final String PACKAGE = "com.facebook.katana.hushfacebook";
        @Override public String getPackageName() { return PACKAGE; }
    }

    /**
     * A build patched before 32 patches joined the default selection lacks them all, and the opened
     * row named every one. Past nine it names eight and counts the rest, and nine are all named.
     */
    @Test public void aBuildLackingManyDefaultsNamesEightAndCountsTheRest() {
        List<String> names = new ArrayList<>();
        for (int lacking : new int[]{9, 10}) {
            controller.close();
            PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
            PatchFamily.inBuildForTests.remove(PatchFamily.MATERIAL_YOU_THEME);
            names.clear();
            for (PatchFamily family : PatchFamily.values()) {
                if (names.size() == lacking) break;
                if (!PatchFamily.DEFAULT_SELECTION.contains(family) || family == PatchFamily.RESTORE_TRUST) continue;
                PatchFamily.inBuildForTests.remove(family);
                names.add(L10n.isolate(family.patchName));
            }
            controller = Robolectric.buildActivity(Activity.class).setup().visible();
            dialog = SettingsL10nTest.show(controller.get());
            page = page(dialog);

            Preference row = (Preference) list().getItemAtPosition(position(HushfacebookPreferenceFragment.MISSING_DEFAULTS));
            assertEquals(lacking + " default patches aren't in this build", String.valueOf(row.getTitle()));
            tap(HushfacebookPreferenceFragment.MISSING_DEFAULTS);
            List<String> shown = lacking == 9 ? names : new ArrayList<>(names.subList(0, 8));
            if (lacking == 10) shown.add("2 more");
            assertEquals("Not in this build: " + L10n.join(shown) + ". Morphe Manager selects them by default. Patch "
                    + "again with them selected to get what they do.", String.valueOf(row.getSummary()));
        }
    }

    /**
     * After an update from a build made before 32 patches joined the default selection, a note
     * right under the card names the switches that start off now and that nobody set: one turned
     * back on isn't named, and nor is one stored off, which someone chose. A tap opens the names
     * and the note is read, a second tap takes it off the page, and it doesn't come back.
     */
    @Test public void anUpdateShowsWhichSwitchesStartOffNowOnce() {
        // The open page drops a stored value that equals its default, which would undo the
        // stored-off switch below, so it's written with no page listening.
        controller.close();
        ShadowLooper.idleMainLooper();
        forgetStartedOn();
        Settings.TAP_TO_PLAY.save(true);
        // Off and stored, the way a build before stored a switch someone turned off.
        assertTrue(Setting.preferences.preferences.edit().putBoolean(Settings.HIDE_REELS_TAB.key, false).commit());
        StartsOffNote.Stored.STATE.save(StartsOffNote.SHOW);
        try {
            controller = Robolectric.buildActivity(Activity.class).setup().visible();
            dialog = SettingsL10nTest.show(controller.get());
            page = page(dialog);
            assertTrue("the stored-off switch was dropped", Setting.preferences.preferences.contains(Settings.HIDE_REELS_TAB.key));
            assertEquals(1, position(StartsOffNote.KEY));
            Preference note = (Preference) list().getItemAtPosition(1);
            assertEquals("28 switches start off now", String.valueOf(note.getTitle()));
            assertEquals("After this update, a switch you had on may be off now. Tap to see which.",
                    String.valueOf(note.getSummary()));

            tap(StartsOffNote.KEY);
            List<String> names = new ArrayList<>();
            for (BooleanSetting setting : StartsOffNote.startedOn()) {
                if (setting != Settings.TAP_TO_PLAY && setting != Settings.HIDE_REELS_TAB) {
                    names.add(SwitchLabels.title(setting));
                }
            }
            assertEquals(28, names.size());
            assertEquals("Now off: " + L10n.join(names) + ". Turn back on the ones you want in their sections. Tap again "
                    + "to hide this note.", String.valueOf(note.getSummary()));
            assertTrue(String.valueOf(note.getSummary()).contains("Hide Reels in the feed"));
            assertFalse(String.valueOf(note.getSummary()).contains("Tap to play"));
            assertFalse(String.valueOf(note.getSummary()).contains("Hide the Reels tab"));
            assertEquals(StartsOffNote.DONE, (int) StartsOffNote.Stored.STATE.savedValue());
            assertFalse("the note changed a switch", Settings.HIDE_FEED_REELS.savedValue());

            tap(StartsOffNote.KEY);
            assertFalse("a second tap left the note", contains(StartsOffNote.KEY));
            assertNull(page.findPreference(StartsOffNote.KEY));
            recreate();
            assertFalse("the note came back", contains(StartsOffNote.KEY));

            // Owed but with nothing left to name, as when the build has none of those patches, there's no note.
            StartsOffNote.Stored.STATE.save(StartsOffNote.SHOW);
            controller.close();
            PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.SPONSORED_POSTS, PatchFamily.REELS_TAB);
            controller = Robolectric.buildActivity(Activity.class).setup().visible();
            dialog = SettingsL10nTest.show(controller.get());
            page = page(dialog);
            assertFalse(contains(StartsOffNote.KEY));
        } finally {
            StartsOffNote.Stored.STATE.resetToDefault();
            forgetStartedOn();
        }
    }

    /** Every switch the note can name, back to its default and out of the store. */
    private static void forgetStartedOn() {
        for (BooleanSetting setting : StartsOffNote.startedOn()) {
            setting.resetToDefault();
            assertTrue(Setting.preferences.preferences.edit().remove(setting.key).commit());
        }
    }

    /**
     * Owed only to an install an earlier build ran on: Hushfacebook first started before the APK
     * running now went in. Decided at the first start and never again, so a fresh install of this
     * build that later updates never sees it.
     */
    @Test public void theNoteIsOwedOnlyWhenAnEarlierBuildRanHere() {
        Context app = RuntimeEnvironment.getApplication();
        long firstStart = BaseSettings.FIRST_TIME_APP_LAUNCHED.savedValue();
        try {
            StartsOffNote.Stored.STATE.resetToDefault();
            BaseSettings.FIRST_TIME_APP_LAUNCHED.save(1_000L);
            StartsOffNote.installedAtForTests = 2_000L;
            StartsOffNote.onFacebookStart(app);
            assertEquals(StartsOffNote.SHOW, (int) StartsOffNote.Stored.STATE.savedValue());

            // Read, it stays read through a later update.
            StartsOffNote.Stored.STATE.save(StartsOffNote.DONE);
            StartsOffNote.installedAtForTests = 3_000L;
            StartsOffNote.onFacebookStart(app);
            assertEquals(StartsOffNote.DONE, (int) StartsOffNote.Stored.STATE.savedValue());

            // A fresh install's first start comes after its APK went in.
            StartsOffNote.Stored.STATE.resetToDefault();
            StartsOffNote.installedAtForTests = 500L;
            StartsOffNote.onFacebookStart(app);
            assertEquals(StartsOffNote.DONE, (int) StartsOffNote.Stored.STATE.savedValue());
            // And a later update finds it decided.
            StartsOffNote.installedAtForTests = 5_000L;
            StartsOffNote.onFacebookStart(app);
            assertEquals(StartsOffNote.DONE, (int) StartsOffNote.Stored.STATE.savedValue());

            assertFalse("no first start known", StartsOffNote.updated(-1, 2_000L));
            assertFalse("no install time known", StartsOffNote.updated(1_000L, 0));
            assertFalse(StartsOffNote.updated(2_000L, 2_000L));
            assertTrue(StartsOffNote.updated(1_999L, 2_000L));
        } finally {
            StartsOffNote.installedAtForTests = null;
            StartsOffNote.Stored.STATE.resetToDefault();
            BaseSettings.FIRST_TIME_APP_LAUNCHED.save(firstStart);
        }
    }

    /** Without its patch a line names the patch to add, can't be tapped and says nothing is installed. */
    @Test public void aMapLineWithoutItsPatchNamesThePatchAndGoesNowhere() {
        controller.close();
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.SPONSORED_POSTS);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
        Map<String, Object> before = savedValues();
        page.navigation.navigate("Reels and Watch");
        assertEquals(Arrays.asList("How to block Reels", "Reels in the feed", "Reels that play by themselves",
                "The Reels tab", "Everything except Marketplace"), titles());
        String[][] missing = {
                {"Reels in the feed", "Hide Reels in the feed"},
                {"Reels that play by themselves", "Tap to play"},
                {"Everything except Marketplace", "Marketplace only"}};
        for (String[] line : missing) {
            int row = titles().indexOf(line[0]);
            assertFalse(line[0] + " can be tapped", list().getAdapter().isEnabled(row));
            assertEquals("Not in this build. To block this, choose the " + L10n.isolate(line[1])
                    + " patch in Morphe Manager and patch again.",
                    String.valueOf(((Preference) list().getItemAtPosition(row)).getSummary()));
        }
        // Without Hide the Reels tab, the tab's line is Facebook's own setting, and it names the patch.
        int tab = titles().indexOf("The Reels tab");
        assertFalse("The Reels tab can be tapped", list().getAdapter().isEnabled(tab));
        assertEquals("Facebook's own setting blocks it. Open Settings, Tab bar, Customize the bar and choose Hide next "
                        + "to Reels, which some accounts call Video. If neither is listed, choose the "
                        + L10n.isolate("Hide the Reels tab") + " patch in Morphe Manager and patch again.",
                String.valueOf(((Preference) list().getItemAtPosition(tab)).getSummary()));
        assertNull(page.findPreference(Settings.HIDE_FEED_REELS.key));
        assertNull(page.findPreference(Settings.HIDE_REELS_TAB.key));
        assertEquals(before, savedValues());
    }

    private static final List<String> ADS_MAP = Arrays.asList("Where ads and tracking are blocked", "Ads in the feed",
            "Ads on profiles", "Ads in Stories", "Ads in Reels", "Ads in search results", "Ads in Marketplace",
            "Ads in Instant Games", "Ads downloaded in advance", "Ad tracking", "Facebook ads in other apps",
            "Usage statistics uploads", "Reel watch history");

    /**
     * Privacy ends with the map of where ads and tracking are blocked. With every patch in, each
     * line with a switch opens the page the line names on that switch's row, a patch with no
     * switch says patching set it, the blocks that cost something say what, and nothing saved changes.
     */
    @Test public void theAdsMapEndsPrivacyAndEachLineWithASwitchOpensIt() {
        Map<String, Object> before = savedValues();
        page.navigation.navigate("Privacy");
        List<String> titles = titles();
        assertEquals(ADS_MAP, titles.subList(titles.size() - ADS_MAP.size(), titles.size()));
        assertEquals("Its switch is " + L10n.isolate("Hide sponsored posts") + ", in " + L10n.isolate("News feed") + ".",
                summaryOf("Ads in the feed"));
        assertEquals("Blocked since you patched. There's no switch for it. Those apps show their own ads or none, and "
                + "their rewarded ads may fail.", summaryOf("Facebook ads in other apps"));
        assertEquals("Its switch is " + L10n.isolate("Hold back analytics uploads") + ", in " + L10n.isolate("Privacy")
                + ". Facebook's on-phone learning jobs stop too, and a change applies after Facebook restarts.",
                summaryOf("Usage statistics uploads"));
        assertTrue(summaryOf("Reel watch history").endsWith(" Reels you've already seen may come back."));
        while (page.navigation.back()) { }

        int switches = 0;
        for (AdsMap.Line line : AdsMap.lines()) {
            page.navigation.navigate("Privacy");
            BooleanSetting setting = line.setting();
            if (setting == null) {
                assertNull(line.title, line.section);
                assertFalse(line.title + " can be tapped", list().getAdapter().isEnabled(titles().indexOf(line.title)));
                assertTrue(summaryOf(line.title).startsWith("Blocked since you patched. There's no switch for it."));
            } else {
                switches++;
                tap("action_show_" + setting.key);
                layout(dialog.getView(), 1200);
                int row = position(setting.key);
                assertTrue(setting.key + " wasn't opened", row >= 0);
                assertEquals(line.title, line.section,
                        String.valueOf(((Preference) list().getItemAtPosition(row)).getParent().getTitle()));
                assertTrue(setting.key + " is off screen at " + row + " of " + list().getFirstVisiblePosition() + ".."
                                + list().getLastVisiblePosition(),
                        row >= list().getFirstVisiblePosition() && row <= list().getLastVisiblePosition());
            }
            while (page.navigation.back()) { }
        }
        assertEquals(9, switches);
        assertEquals(before, savedValues());
    }

    /**
     * A build without a line's patch says which patch to choose, still says what that block would
     * cost, and the line can't be tapped. One that's in keeps its link.
     */
    @Test public void anAdsMapLineWithoutItsPatchNamesThePatchAndWhatItCosts() {
        controller.close();
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.SPONSORED_POSTS, PatchFamily.AD_PREFETCH);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
        Map<String, Object> before = savedValues();
        page.navigation.navigate("Privacy");
        // Save crashes to Downloads and Close Facebook when you leave it belong to no patch, so every build has them.
        List<String> expected = new ArrayList<>(Arrays.asList("Lock Facebook", "Lock after", "Save crashes to Downloads",
                "Close Facebook when you leave it"));
        expected.addAll(ADS_MAP);
        assertEquals(expected, titles());

        assertTrue(list().getAdapter().isEnabled(titles().indexOf("Ads in the feed")));
        assertEquals("Blocked since you patched. There's no switch for it.", summaryOf("Ads downloaded in advance"));
        assertEquals("Not in this build. To block this, choose the " + L10n.isolate("Disable Audience Network")
                + " patch in Morphe Manager and patch again. Those apps show their own ads or none, and their rewarded "
                + "ads may fail.", summaryOf("Facebook ads in other apps"));
        assertEquals("Not in this build. To block this, choose the " + L10n.isolate("Hold back analytics uploads")
                + " patch in Morphe Manager and patch again. Facebook's on-phone learning jobs stop too, and a change "
                + "applies after Facebook restarts.", summaryOf("Usage statistics uploads"));
        for (AdsMap.Line line : AdsMap.lines()) {
            if (line.family == PatchFamily.SPONSORED_POSTS) continue;
            assertFalse(line.title + " can be tapped", list().getAdapter().isEnabled(titles().indexOf(line.title)));
            if (line.family == PatchFamily.AD_PREFETCH) continue;
            assertTrue(line.title, summaryOf(line.title).startsWith("Not in this build. To block this, choose the "
                    + L10n.isolate(line.family.patchName) + " patch"));
        }
        assertEquals(-1, position("action_show_" + Settings.HIDE_SPONSORED_REELS.key));
        assertEquals(before, savedValues());
    }

    private String summaryOf(String title) {
        int row = titles().indexOf(title);
        assertTrue("No visible row " + title, row >= 0);
        return String.valueOf(((Preference) list().getItemAtPosition(row)).getSummary());
    }

    @Test public void recreationKeepsTheCategoryAndSearchQuery() {
        page.navigation.open(page.findPreference(Settings.TAP_TO_PLAY.key));
        recreate();
        assertTrue(contains(Settings.TAP_TO_PLAY.key));
        // Playback: Tap to play and Only the first reel waits, Resume long videos, Remember what you watch and
        // its Recently watched list, Frame step, Default playback quality and its Playback quality, Reels quality
        // and Stories quality lists, Picture-in-picture and Only from a reel's More menu, Picture-in-picture
        // button, Turn off HDR brightness, Play SDR versions of HDR videos, Skip silent parts, Keep feed videos
        // muted, Keep the progress bar, Show a reel's time and Tap the bar to seek.
        assertEquals(20, list().getCount());
        page.navigation.back();
        findSearch(dialog.getView()).setText("other apps");
        recreate();
        assertEquals("other apps", findSearch(dialog.getView()).getText().toString());
        assertTrue(contains(Settings.DOWNLOAD_COMPATIBLE.key));
    }

    @Test public void bothBackPathsReturnToTheIndexBeforeClosingTheDialog() {
        page.navigation.open(page.findPreference(Settings.TAP_TO_PLAY.key));
        SettingsL10nTest.backOf(dialog).performClick();
        assertTrue(dialog.getDialog().isShowing());
        assertEquals(13, list().getCount());
        page.navigation.navigate("About");
        dialog.getDialog().onBackPressed();
        assertEquals(15, list().getCount());
        dialog.getDialog().onBackPressed();
        assertEquals(13, list().getCount());
        dialog.getDialog().onBackPressed();
        ShadowLooper.idleMainLooper();
        assertFalse(controller.get().isFinishing());
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void aNewPageStartsAtTheTopAfterThePreviousPageWasScrolled() {
        Object root = org.robolectric.util.ReflectionHelpers.callInstanceMethod(
                dialog.getDialog().getWindow().getDecorView(), "getViewRootImpl");
        org.robolectric.util.ReflectionHelpers.callInstanceMethod(root, "ensureTouchMode",
                org.robolectric.util.ReflectionHelpers.ClassParameter.from(boolean.class, true));
        try {
            layout(dialog.getView(), 1200);
            assertTrue(list().isInTouchMode());
            list().scrollListBy(120);
            int homePosition = list().getFirstVisiblePosition();
            int homeOffset = list().getChildAt(0).getTop();
            assertTrue(homePosition > 0 || homeOffset < 0);
            page.navigation.navigate("more");
            layout(dialog.getView(), 1200);
            assertEquals(0, list().getFirstVisiblePosition());
            assertEquals(list().getPaddingTop(), list().getChildAt(0).getTop());
            list().scrollListBy(100);
            int morePosition = list().getFirstVisiblePosition();
            int moreOffset = list().getChildAt(0).getTop();
            assertTrue(morePosition > 0 || moreOffset < 0);
            page.navigation.navigate("Pause, backup and diagnostics");
            // Preference updates can arrive after navigation but before the next layout.
            ((android.widget.BaseAdapter) page.getPreferenceScreen().getRootAdapter()).notifyDataSetChanged();
            layout(dialog.getView(), 1200);
            assertEquals(0, list().getFirstVisiblePosition());
            assertEquals(list().getPaddingTop(), list().getChildAt(0).getTop());
            assertTrue(page.navigation.back());
            layout(dialog.getView(), 1200);
            assertEquals(morePosition, list().getFirstVisiblePosition());
            assertEquals(moreOffset, list().getChildAt(0).getTop());
            assertTrue(page.navigation.back());
            layout(dialog.getView(), 1200);
            assertEquals(homePosition, list().getFirstVisiblePosition());
            assertEquals(homeOffset, list().getChildAt(0).getTop());
        } finally {
            org.robolectric.util.ReflectionHelpers.callInstanceMethod(root, "ensureTouchMode",
                    org.robolectric.util.ReflectionHelpers.ClassParameter.from(boolean.class, false));
        }
    }

    @Test public void visibleNavigationAndSearchKeepTheirAccessibilityRoles() {
        layout(dialog.getView());
        View heading = list().getChildAt(2);
        assertTrue(heading.createAccessibilityNodeInfo().isHeading());
        View opening = list().getChildAt(3);
        assertEquals(android.widget.Button.class.getName(), opening.createAccessibilityNodeInfo().getClassName());
        assertTrue(opening.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
        assertEquals("Marketplace only", ((Preference) list().getItemAtPosition(0)).getTitle());
        page.navigation.back();
        findSearch(dialog.getView()).setText("Tap to play");
        layout(dialog.getView());
        // The Reels map's autoplay line names the switch too, so it's found by its key, not its place.
        View toggle = list().getChildAt(position(Settings.TAP_TO_PLAY.key) - list().getFirstVisiblePosition());
        assertEquals(android.widget.Switch.class.getName(), toggle.createAccessibilityNodeInfo().getClassName());
        assertTrue(toggle.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
        assertTrue(Settings.TAP_TO_PLAY.savedValue());
    }

    /** All pages are rendered with the same viewport as the design reference. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void renderEveryPageAndSearchOffscreen() throws Exception {
        renderPagesAndSearch("");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void renderEveryPageAndSearchInMaterialDarkOffscreen() throws Exception {
        PatchFamily.inBuildForTests.add(PatchFamily.MATERIAL_YOU_THEME);
        recreate();
        assertFalse(ScreenColors.shown.light);
        renderPagesAndSearch("material-dark-");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h844dp-notnight-xhdpi")
    public void renderEveryPageAndSearchInMaterialLightOffscreen() throws Exception {
        PatchFamily.inBuildForTests.add(PatchFamily.MATERIAL_YOU_THEME);
        recreate();
        assertTrue(ScreenColors.shown.light);
        renderPagesAndSearch("material-light-");
    }

    private void renderPagesAndSearch(String prefix) throws Exception {
        capture(prefix + "00-overview");
        for (Preference section : page.sections()) {
            page.navigation.open(section);
            String name = section.getTitle().toString().toLowerCase(java.util.Locale.ROOT).replaceAll("[^a-z]+", "-");
            capture(prefix + name);
            if ("pause-backup-and-diagnostics".equals(name)) {
                TextView title = findHeading(dialog.getView());
                assertEquals(TextView.AUTO_SIZE_TEXT_TYPE_NONE, title.getAutoSizeTextType());
                float scaledDensity = title.getResources().getDisplayMetrics().scaledDensity;
                assertEquals(28 * scaledDensity, title.getTextSize(), 0.1f);
                assertTrue("Long category headings must wrap instead of shrinking", title.getLineCount() > 1);
            }
            assertUncutText(dialog.getView());
            list().setSelection(list().getCount() - 1);
            capture(prefix + name + "-end");
            assertEquals("the last setting is reachable on " + section.getTitle(),
                    list().getCount() - 1, list().getLastVisiblePosition());
            assertUncutText(dialog.getView());
        }
        page.navigation.navigate("more");
        capture(prefix + "more-settings");
        page.navigation.back();
        findSearch(dialog.getView()).setText("video");
        ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
        capture(prefix + "search-results");
        findSearch(dialog.getView()).setText("noSuchSetting987654");
        ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
        capture(prefix + "search-empty");
        page.navigation.back();
        page.navigation.navigate("Downloads");
        ValueRows.QualityRow quality = (ValueRows.QualityRow) page.findPreference(Settings.DOWNLOAD_QUALITY.key);
        quality.showDialog(null);
        captureDialog(prefix + "dialog-quality", (AlertDialog) quality.getDialog());
        quality.getDialog().dismiss();
        ValueRows.FolderRow folder = (ValueRows.FolderRow) page.findPreference(Settings.SAVE_FOLDER.key);
        folder.showDialog(null);
        captureDialog(prefix + "dialog-folder", (AlertDialog) folder.getDialog());
        folder.getDialog().dismiss();
        ValueRows.FileNameRow name = (ValueRows.FileNameRow) page.findPreference(Settings.FILENAME_TEMPLATE.key);
        name.showDialog(null);
        captureDialog(prefix + "dialog-file-name", (AlertDialog) name.getDialog());
        name.getDialog().dismiss();
        page.navigation.navigate("Pause, backup and diagnostics");
        Preference export = page.findPreference("action_export_diagnostic_report");
        export.getOnPreferenceClickListener().onPreferenceClick(export);
        AlertDialog report = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        captureDialog(prefix + "dialog-report", report);
        report.dismiss();
        page.pendingImport = SettingsBackup.parse("{\"format\":\"hushfacebook-settings\",\"schema\":1,\"settings\":{\"hushfacebook_tap_to_play\":false}}").toBundle();
        SettingsBackupPreference.onPageResumed(page);
        captureDialog(prefix + "dialog-import", page.importPreview);
        page.importPreview.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        page.navigation.navigate("About");
        Preference about = page.sections().get(page.sections().size() - 1);
        Preference licenses = ((PreferenceCategory) about).getPreference(2);
        licenses.getOnPreferenceClickListener().onPreferenceClick(licenses);
        AlertDialog notice = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        captureDialog(prefix + "dialog-licenses", notice);
        notice.dismiss();
        renderControlStates(prefix);
    }

    private void renderControlStates(String prefix) throws Exception {
        while (page.navigation.back()) { }
        EditText search = findSearch(dialog.getView());
        search.setText("");
        search.requestFocus();
        capture(prefix + "state-search-focused");
        search.clearFocus();
        page.navigation.navigate("Opening Facebook");
        capture(prefix + "state-dependent-disabled");
        page.navigation.navigate("Downloads");
        ValueRows.QualityRow quality = (ValueRows.QualityRow) page.findPreference(Settings.DOWNLOAD_QUALITY.key);
        quality.showDialog(null);
        AlertDialog choices = (AlertDialog) quality.getDialog();
        int checked = choices.getListView().getCheckedItemPosition();
        ShadowLooper.idleMainLooper();
        Object choiceRoot = org.robolectric.util.ReflectionHelpers.callInstanceMethod(
                choices.getWindow().getDecorView(), "getViewRootImpl");
        assertNotNull("the choice window has not attached", choiceRoot);
        org.robolectric.util.ReflectionHelpers.callInstanceMethod(choiceRoot, "ensureTouchMode",
                org.robolectric.util.ReflectionHelpers.ClassParameter.from(boolean.class, false));
        assertFalse("directional navigation is still in touch mode", choices.getListView().isInTouchMode());
        assertTrue(choices.getListView().requestFocus());
        choices.getListView().dispatchKeyEvent(new android.view.KeyEvent(
                android.view.KeyEvent.ACTION_DOWN, android.view.KeyEvent.KEYCODE_DPAD_DOWN));
        choices.getListView().dispatchKeyEvent(new android.view.KeyEvent(
                android.view.KeyEvent.ACTION_UP, android.view.KeyEvent.KEYCODE_DPAD_DOWN));
        captureDialog(prefix + "state-choice-focused", choices);
        assertTrue("the choice list lost navigation focus", choices.getListView().hasFocus());
        assertNotNull("no choice has navigation focus", choices.getListView().getSelectedView());
        assertTrue("the focused choice has no selected state", choices.getListView().getSelectedView().isSelected());
        assertEquals("moving focus must not change the saved choice", checked,
                choices.getListView().getCheckedItemPosition());
        choices.dismiss();
        ValueRows.FolderRow folder = (ValueRows.FolderRow) page.findPreference(Settings.SAVE_FOLDER.key);
        folder.showDialog(null);
        AlertDialog editor = (AlertDialog) folder.getDialog();
        folder.getEditText().requestFocus();
        captureDialog(prefix + "state-field-focused", editor);
        folder.getEditText().clearFocus();
        editor.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);
        captureDialog(prefix + "state-save-disabled", editor);
        editor.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(true);
        assertTrue(editor.getButton(AlertDialog.BUTTON_POSITIVE).requestFocusFromTouch());
        captureDialog(prefix + "state-save-focused", editor);
        assertTrue(editor.getButton(AlertDialog.BUTTON_POSITIVE).hasFocus());
        editor.dismiss();
        int save = app.morphe.extension.facebook.download.SavesForTests.begin(controller.get().getApplicationContext(), true);
        try {
            app.morphe.extension.facebook.download.SavesForTests.joining(save);
            capture(prefix + "state-save-joining");
            assertTrue(app.morphe.extension.facebook.download.SavesForTests.publishing(save));
            capture(prefix + "state-save-publishing");
        } finally { app.morphe.extension.facebook.download.SavesForTests.end(save); }
        capture(prefix + "state-save-failed");
        page.navigation.navigate("News feed");
        ValueRows.SourcesRow sources = (ValueRows.SourcesRow) page.findPreference(Settings.HIDDEN_SOURCES.key);
        sources.showDialog(null);
        sources.getEditText().setText(new String(new char[app.morphe.extension.facebook.feed.PostSources.MAX_LENGTH + 1]).replace('\0', 'x'));
        AlertDialog sourceEditor = (AlertDialog) sources.getDialog();
        sourceEditor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        assertTrue("a rejected draft must stay open", sourceEditor.isShowing());
        captureDialog(prefix + "state-sources-invalid", sourceEditor);
        sourceEditor.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        page.navigation.navigate("Appearance");
        capture(prefix + "state-font-choice");
        page.navigation.navigate("Pause, backup and diagnostics");
        java.util.concurrent.CountDownLatch entered = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.CountDownLatch release = new java.util.concurrent.CountDownLatch(1);
        app.morphe.extension.shared.settings.preference.LogBufferManager.registerReportSection(
                new app.morphe.extension.shared.settings.preference.LogBufferManager.ReportSection() {
                    @Override public String title() { return "VISUAL CHECK"; }
                    @Override public List<String> lines() {
                        entered.countDown();
                        try {
                            if (!release.await(15, java.util.concurrent.TimeUnit.SECONDS))
                                throw new IllegalStateException("export capture did not release its worker");
                        } catch (InterruptedException interrupted) {
                            Thread.currentThread().interrupt();
                            throw new IllegalStateException(interrupted);
                        }
                        return java.util.Collections.emptyList();
                    }
                });
        Preference export = page.findPreference("action_export_diagnostic_report");
        export.getOnPreferenceClickListener().onPreferenceClick(export);
        AlertDialog chooser = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        try {
            chooser.getListView().performItemClick(null, 0, 0);
            assertTrue("report worker never entered", entered.await(10, java.util.concurrent.TimeUnit.SECONDS));
            assertFalse(export.isEnabled());
            capture(prefix + "state-report-copying");
        } finally { release.countDown(); chooser.dismiss(); }
        app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        assertTrue(export.isEnabled());
        capture(prefix + "state-report-copied");
    }

    @Test public void fileNameExampleUsesTheSameFormatterAndCancelKeepsTheSavedTemplate() {
        ValueRows.FileNameRow name = (ValueRows.FileNameRow) page.findPreference(Settings.FILENAME_TEMPLATE.key);
        String before = Settings.FILENAME_TEMPLATE.savedValue();
        name.showDialog(null);
        name.getEditText().setText("Example_{video_id}");
        assertEquals("Example_123456.mp4", ValueRows.FileNameRow.previewName("Example_{video_id}", new java.util.Date(0), false));
        ((AlertDialog) name.getDialog()).getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        assertEquals(before, Settings.FILENAME_TEMPLATE.savedValue());
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rXB-ldrtl-w390dp-h844dp-night-xhdpi")
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
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    /**
     * Brazilian Portuguese runs longer than English (PR #15's wording). Every page still wraps its
     * whole text at twice the text size, and the table is the one on screen.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "pt-rBR-w390dp-h844dp-night-xhdpi")
    public void brazilianPortuguesePagesKeepTheirCompleteText() throws Exception {
        assertEquals("Feed de not\u00edcias", String.valueOf(page.sections().get(1).getTitle()));
        capture("pt-br-overview");
        page.navigation.navigate("News feed");
        capture("pt-br-news-feed");
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        try {
            recreate();
            for (Preference section : page.sections()) {
                page.navigation.open(section);
                layout(dialog.getView());
                assertUncutText(dialog.getView());
            }
            page.navigation.navigate("News feed");
            capture("pt-br-large-news-feed");
            page.navigation.navigate("Reels and Watch");
            capture("pt-br-large-reels");
            page.navigation.navigate("Pause, backup and diagnostics");
            capture("pt-br-large-pause");
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h844dp-notnight-xhdpi")
    public void lightThemeUsesTheSameNavigationAndReadableRows() throws Exception {
        controller.close();
        PatchFamily.inBuildForTests.add(PatchFamily.MATERIAL_YOU_THEME);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
        assertTrue(ScreenColors.shown.light);
        capture("light-overview");
        page.navigation.navigate("Downloads");
        capture("light-downloads");
        assertUncutText(dialog.getView());
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void recoveryKeepsRetryAndBackVisible() throws Exception {
        dialog.dismiss();
        controller.get().getFragmentManager().executePendingTransactions();
        HushfacebookPreferenceFragment.failNextInitialization = new IllegalStateException("render recovery");
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
        writeCapture(image, name);
        image.recycle();
    }

    private void capture(String name) throws Exception {
        File folder = new File("build/reports/settings-design");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        View root = dialog.getView();
        layout(root);
        Bitmap image = Bitmap.createBitmap(780, 1688, Bitmap.Config.ARGB_8888);
        root.draw(new Canvas(image));
        writeCapture(image, name);
        image.recycle();
    }

    private static void writeCapture(Bitmap image, String name) throws Exception {
        File folder = new File("build/reports/settings-design");
        File sdk = new File(folder, "sdk-" + android.os.Build.VERSION.SDK_INT);
        assertTrue(sdk.isDirectory() || sdk.mkdirs());
        // The flat names remain convenient for documentation. Each SDK also keeps its own proof.
        for (File file : new File[]{new File(folder, name + ".png"), new File(sdk, name + ".png")}) {
            try (FileOutputStream out = new FileOutputStream(file)) {
                assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, out));
            }
        }
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

    /**
     * Issue #214: with AMOLED and no Material You, Appearance has the Light background color row
     * next to Background color. Save turns down a color too dark for light mode's text with the
     * dialog still open, and keeps a light one in capitals. With Material You neither row shows.
     */
    @Test
    public void appearanceHasTheLightBackgroundRowWithoutMaterialYou() {
        try {
            page.navigation.navigate("Appearance");
            assertNotNull("the dark row", page.findPreference(Settings.AMOLED_BACKGROUND.key));
            ValueRows.BackgroundRow light = (ValueRows.BackgroundRow) page.findPreference(Settings.AMOLED_LIGHT_BACKGROUND.key);
            assertNotNull(light);
            assertEquals("Light background color", light.getTitle().toString());
            assertEquals("Uses Facebook's own white. Type a color code to change it.", light.getSummary().toString());

            light.showDialog(null);
            AlertDialog editor = (AlertDialog) light.getDialog();
            light.getEditText().setText("#2D88FF");
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertTrue("a refused color keeps the dialog open", editor.isShowing());
            assertEquals("", Settings.AMOLED_LIGHT_BACKGROUND.savedValue());

            light.getEditText().setText("fff8e7");
            editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertFalse(editor.isShowing());
            assertEquals("#FFF8E7", Settings.AMOLED_LIGHT_BACKGROUND.savedValue());
            assertTrue(light.getSummary().toString(), light.getSummary().toString().contains("#FFF8E7"));

            PatchFamily.inBuildForTests.add(PatchFamily.MATERIAL_YOU_THEME);
            recreate();
            page.navigation.navigate("Appearance");
            assertNull(page.findPreference(Settings.AMOLED_LIGHT_BACKGROUND.key));
            assertNull(page.findPreference(Settings.AMOLED_BACKGROUND.key));
        } finally {
            Settings.AMOLED_LIGHT_BACKGROUND.resetToDefault();
        }
    }

    private void recreate() {
        controller.recreate();
        ShadowLooper.idleMainLooper();
        dialog = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag("hushfacebook_settings");
        assertNotNull(dialog);
        page = page(dialog);
    }

    private static HushfacebookPreferenceFragment page(SettingsDialog dialog) {
        return (HushfacebookPreferenceFragment) dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
    }

    private ListView list() { return dialog.getView().findViewById(android.R.id.list); }

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

    private static void installSelf(Signature certificate) {
        install(RuntimeEnvironment.getApplication().getPackageName(), certificate);
    }

    private static void install(String packageName, Signature certificate) {
        Context context = RuntimeEnvironment.getApplication();
        ShadowPackageManager packages = shadowOf(context.getPackageManager());
        PackageInfo info = new PackageInfo();
        info.packageName = packageName;
        ApplicationInfo app = new ApplicationInfo();
        app.packageName = info.packageName;
        app.uid = Process.myUid();
        info.applicationInfo = app;
        SigningInfo signing = new SigningInfo();
        ((ShadowSigningInfo) Shadow.extract(signing)).setSignatures(new Signature[]{certificate});
        info.signingInfo = signing;
        packages.installPackage(info);
    }

    private static Signature metaCertificate() {
        Context context = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = context.getPackageName();
        ApplicationInfo app = new ApplicationInfo();
        app.packageName = info.packageName;
        app.uid = Process.myUid();
        info.applicationInfo = app;
        return FacebookSignature.originalSigners(info).get(0);
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
