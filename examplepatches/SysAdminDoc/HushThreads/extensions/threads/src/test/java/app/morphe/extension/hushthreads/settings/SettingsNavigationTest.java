/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at 837bac40e (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.SwitchPreference;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
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

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.FailingStore;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.morphe.extension.shared.settings.preference.ReopenSettingsAfterRestart;

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
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private ActivityController<Activity> controller;
    private SettingsDialog dialog;
    private HushThreadsPreferenceFragment page;

    @Before public void open() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PauseForTests.resume();
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
    }

    @After public void close() {
        controller.close();
        PatchFamily.inBuildForTests = null;
        Settings.HIDE_ADS.resetToDefault();
        Settings.SANITIZE_SHARING_LINKS.resetToDefault();
        Settings.BLOCK_RETURN_REFRESH.resetToDefault();
        Settings.RETURN_REFRESH_NO_LIMIT.resetToDefault();
        Settings.PURE_BLACK.resetToDefault();
        Settings.HIDE_INSTAGRAM_BUTTON.resetToDefault();
        Settings.HIDE_GHOST_POST_BUBBLES.resetToDefault();
        BaseSettings.PAUSED.resetToDefault();
        BaseSettings.HIDE_QUICK_SETUPS.resetToDefault();
        org.robolectric.RuntimeEnvironment.getApplication()
                .getSharedPreferences(SettingsNavigation.VIEW_STORE, Context.MODE_PRIVATE).edit().clear().commit();
        ReopenSettingsAfterRestart.setRestarterForTests(null);
        AbstractPreferenceFragment.restartPending.clear();
        PauseForTests.resume();
    }

    /**
     * The main list with nothing paused or waiting: Quick setups, a button for each of the eleven
     * sections, Support and the build line. Every section folds open in place, one tap from here.
     */
    private static final int HOME_ROWS = 14;

    /** The Comments header says what the section holds, as Privacy's and Downloads' do. */
    @Test public void theCommentsHeaderSaysWhatItHolds() {
        Preference header = (Preference) list().getItemAtPosition(position("section_Comments"));
        assertEquals("Spam replies by words or links", String.valueOf(header.getSummary()));
    }

    @Test public void homeAndEveryCategoryAreReachableWithoutRemovingTheModel() {
        assertNotNull(page.navigation);
        assertEquals(HOME_ROWS, list().getCount());
        assertEquals(11, page.sections().size());
        int total = page.getPreferenceScreen().getRootAdapter().getCount();
        Map<String, Object> before = savedValues();
        assertFalse(titles().contains("More settings"));
        assertFalse("the card shows with nothing to say", titles().contains("HushThreads is on"));
        for (Preference section : page.sections()) {
            // Headers keep their route ids when a section's title is translated.
            String id = page.navigation.sectionId(section);
            String key = "section_" + id;
            assertTrue("missing main header " + id, contains(key));
            assertFalse(page.navigation.isExpanded(id));
            tap(key);
            assertTrue(page.navigation.isExpanded(id));
            int children = ((PreferenceCategory) section).getPreferenceCount();
            assertEquals(HOME_ROWS + children, list().getCount());
            int header = position(key);
            for (int child = 0; child < children; child++) {
                assertTrue("the visible row is a copy in " + id,
                        list().getItemAtPosition(header + child + 1) == ((PreferenceCategory) section).getPreference(child));
            }
            assertEquals(total, page.getPreferenceScreen().getRootAdapter().getCount());
            assertNotNull(page.findPreference(Settings.HIDE_ADS.key));
            assertMainToolbar();
            tap(key);
            assertFalse(page.navigation.isExpanded(id));
            assertEquals(HOME_ROWS, list().getCount());
        }
        assertEquals(before, savedValues());
        assertFalse(page.navigation.back());
    }

    /**
     * Support sits at the foot of the list, folded, over the build line. Opened, it holds Report a
     * problem, Restart Threads and Support HushThreads, a name with no line under it whose tap
     * opens the Ko-fi page in a browser of its own. With no browser a tip names the address and
     * Threads keeps running.
     */
    @Test public void supportKeepsReportsRestartAndTheProjectLinkReachable() {
        Map<String, Object> before = savedValues();
        Preference header = (Preference) list().getItemAtPosition(list().getCount() - 2);
        assertEquals(SettingsNavigation.SUPPORT, header.getKey());
        assertEquals("Support", String.valueOf(header.getTitle()));
        assertEquals("Reports, restart and app information", String.valueOf(header.getSummary()));
        assertFalse(contains(SettingsNavigation.REPORT));
        assertFalse(contains(SettingsNavigation.RESTART_NOW));

        tap(SettingsNavigation.SUPPORT);
        assertTrue(page.navigation.isExpanded(SettingsNavigation.SUPPORT));
        int count = list().getCount();
        Preference row = (Preference) list().getItemAtPosition(count - 2);
        assertEquals(HushThreadsPreferenceFragment.SUPPORT, row.getKey());
        assertEquals("Support HushThreads", String.valueOf(row.getTitle()));
        assertNull("the Support row carries a line under its name", row.getSummary());
        assertTrue(contains(SettingsNavigation.REPORT));
        assertTrue(contains(SettingsNavigation.RESTART_NOW));
        assertTrue(list().getAdapter().isEnabled(count - 2));

        tap(HushThreadsPreferenceFragment.SUPPORT);
        android.content.Intent started = org.robolectric.Shadows.shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull("nothing opened", started);
        assertEquals(android.content.Intent.ACTION_VIEW, started.getAction());
        assertEquals("https://ko-fi.com/X8K126YVER", started.getDataString());
        assertTrue(started.hasCategory(android.content.Intent.CATEGORY_BROWSABLE));
        assertTrue("the page would open inside Threads' task",
                (started.getFlags() & android.content.Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        assertNull(started.getComponent());
        assertEquals("the tap left Support", count, list().getCount());

        org.robolectric.Shadows.shadowOf(org.robolectric.RuntimeEnvironment.getApplication()).checkActivities(true);
        tap(HushThreadsPreferenceFragment.SUPPORT);
        assertEquals("No app on this phone can open the link. The address is " + L10n.isolate("ko-fi.com/X8K126YVER") + ".",
                ShadowToast.getTextOfLatestToast());
        assertFalse(controller.get().isFinishing());
        assertEquals(before, savedValues());
        tap(SettingsNavigation.SUPPORT);
        assertFalse(page.navigation.isExpanded(SettingsNavigation.SUPPORT));
        assertEquals(HOME_ROWS, list().getCount());
    }

    /**
     * A long press takes Quick setups off the main list for good, and the row in Pause, backup and
     * diagnostics brings it back. No other row answers a long press.
     */
    @Test public void quickSetupsHidesOnALongPressAndComesBackFromItsRow() {
        Preference row = (Preference) list().getItemAtPosition(0);
        assertEquals(SettingsNavigation.QUICK_SETUPS, row.getKey());
        assertTrue(String.valueOf(row.getSummary()), String.valueOf(row.getSummary()).endsWith(" Press and hold to hide this row."));
        assertFalse("a long press on another row did something", list().getOnItemLongClickListener()
                .onItemLongClick(list(), null, position("section_Feed"), 0));
        assertTrue(list().getOnItemLongClickListener().onItemLongClick(list(), null, 0, 0));
        ShadowLooper.idleMainLooper();
        assertTrue(BaseSettings.HIDE_QUICK_SETUPS.savedValue());
        assertEquals("Quick setups hidden. Bring it back from Pause, backup and diagnostics.", ShadowToast.getTextOfLatestToast());
        assertFalse(contains(SettingsNavigation.QUICK_SETUPS));
        assertEquals(HOME_ROWS - 1, list().getCount());

        // Back to defaults leaves it as it is, and so does a restart of the screen.
        page.applyQuickSetup(QuickSetupKeys.defaults());
        assertTrue(BaseSettings.HIDE_QUICK_SETUPS.savedValue());
        recreate();
        assertFalse(contains(SettingsNavigation.QUICK_SETUPS));

        tap("section_Pause, backup and diagnostics");
        assertEquals("Hidden. Tap to show it again.",
                String.valueOf(((Preference) list().getItemAtPosition(position(HushThreadsPreferenceFragment.QUICK_SETUPS_HOME))).getSummary()));
        tap(HushThreadsPreferenceFragment.QUICK_SETUPS_HOME);
        assertFalse(BaseSettings.HIDE_QUICK_SETUPS.savedValue());
        assertEquals("Shown. Tap to hide it.",
                String.valueOf(((Preference) list().getItemAtPosition(position(HushThreadsPreferenceFragment.QUICK_SETUPS_HOME))).getSummary()));
        assertFalse("the row asked for a restart", contains(SettingsNavigation.RESTART));
        tap("section_Pause, backup and diagnostics");
        assertEquals(SettingsNavigation.QUICK_SETUPS, ((Preference) list().getItemAtPosition(0)).getKey());
        assertEquals(HOME_ROWS, list().getCount());

        // The same row hides it again.
        tap("section_Pause, backup and diagnostics");
        tap(HushThreadsPreferenceFragment.QUICK_SETUPS_HOME);
        tap("section_Pause, backup and diagnostics");
        assertFalse(contains(SettingsNavigation.QUICK_SETUPS));
    }

    /** A screen reader is offered a long press on Quick setups alone, and that long press hides it. */
    @Test public void onlyQuickSetupsOffersAScreenReaderALongPress() {
        layout(dialog.getView());
        View quick = list().getChildAt(position(SettingsNavigation.QUICK_SETUPS) - list().getFirstVisiblePosition());
        View feed = list().getChildAt(position("section_Feed") - list().getFirstVisiblePosition());
        AccessibilityNodeInfo.AccessibilityAction hold = AccessibilityNodeInfo.AccessibilityAction.ACTION_LONG_CLICK;
        assertTrue(quick.createAccessibilityNodeInfo().getActionList().contains(hold));
        assertTrue(quick.createAccessibilityNodeInfo().isLongClickable());
        assertFalse("a row with no long press offers one", feed.createAccessibilityNodeInfo().getActionList().contains(hold));
        assertFalse(feed.createAccessibilityNodeInfo().isLongClickable());
        assertFalse(feed.performAccessibilityAction(hold.getId(), null));
        assertFalse(BaseSettings.HIDE_QUICK_SETUPS.savedValue());

        assertTrue(quick.performAccessibilityAction(hold.getId(), null));
        ShadowLooper.idleMainLooper();
        assertTrue(BaseSettings.HIDE_QUICK_SETUPS.savedValue());
        assertFalse(contains(SettingsNavigation.QUICK_SETUPS));
    }

    /**
     * The long-press listener makes the list itself long-clickable, and TalkBack stopped on the
     * whole list to say "List, double-tap and hold to long press". The list keeps the touch long
     * press its rows need and offers a screen reader none of its own.
     */
    @Test public void theListItselfOffersAScreenReaderNoLongPress() {
        layout(dialog.getView());
        AccessibilityNodeInfo info = list().createAccessibilityNodeInfo();
        assertFalse("the list offers a long press", info.isLongClickable());
        assertFalse(info.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_LONG_CLICK));
        assertTrue("a touch long press on a row needs the list long-clickable", list().isLongClickable());
    }

    /** Each Quick setups choice changes its switches through their rows and says how many changed. */
    @Test public void quickSetupsChangeTheirSwitchesAndSayHowMany() {
        assertEquals("Quick setups doesn't open the list", 0, position(SettingsNavigation.QUICK_SETUPS));
        assertEquals("Quick setups", String.valueOf(((Preference) list().getItemAtPosition(0)).getTitle()));
        try {
            // All four of Quiet's switches start on, so they go off first.
            Map<BooleanSetting, Boolean> off = new java.util.LinkedHashMap<>();
            for (BooleanSetting setting : QuickSetupKeys.QUIET) off.put(setting, false);
            assertEquals(4, page.applyQuickSetup(off));
            for (BooleanSetting setting : QuickSetupKeys.QUIET) assertFalse(setting.key, setting.savedValue());

            tap(SettingsNavigation.QUICK_SETUPS);
            AlertDialog choices = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
            assertNotNull("Quick setups opened no dialog", choices);
            android.widget.ListAdapter cards = choices.getListView().getAdapter();
            assertEquals(3, cards.getCount());
            assertTrue(String.valueOf(cards.getItem(0)).startsWith("Quiet\n"));
            assertTrue(String.valueOf(cards.getItem(1)).startsWith("Privacy\n"));
            assertTrue(String.valueOf(cards.getItem(2)).startsWith("Back to defaults\n"));
            choices.getListView().performItemClick(null, 0, 0);
            ShadowLooper.idleMainLooper();
            for (BooleanSetting setting : QuickSetupKeys.QUIET) assertTrue(setting.key, setting.savedValue());
            assertEquals("Changed 4 settings", ShadowToast.getTextOfLatestToast());
            assertEquals("the choice changed the main list", HOME_ROWS, list().getCount());

            assertEquals(0, page.applyQuickSetup(QuickSetupKeys.quiet()));
            assertEquals("Changed 0 settings", ShadowToast.getTextOfLatestToast());
            // Of Privacy's three, only Hide screenshots from Threads starts off.
            assertEquals(1, page.applyQuickSetup(QuickSetupKeys.privacy()));
            assertEquals("Changed 1 setting", ShadowToast.getTextOfLatestToast());
            for (BooleanSetting setting : QuickSetupKeys.PRIVACY) assertTrue(setting.key, setting.savedValue());
            assertEquals(1, page.applyQuickSetup(QuickSetupKeys.defaults()));
            for (BooleanSetting setting : QuickSetupKeys.DEFAULTS) {
                assertEquals(setting.key, setting.defaultValue, setting.savedValue());
            }
            assertFalse("nothing waits, yet a restart row showed", contains(SettingsNavigation.RESTART));
        } finally {
            for (BooleanSetting setting : QuickSetupKeys.DEFAULTS) setting.resetToDefault();
        }
    }

    /** Report a problem, in Support, opens GitHub's bug form with the versions and switches filled in. */
    @Test public void reportAProblemOpensAFilledInGitHubForm() throws Exception {
        Map<String, Object> before = savedValues();
        page.navigation.navigate(SettingsNavigation.SUPPORT);
        assertEquals("Report a problem isn't over Restart Threads",
                position(SettingsNavigation.RESTART_NOW) - 1, position(SettingsNavigation.REPORT));
        tap(SettingsNavigation.REPORT);
        android.content.Intent started = org.robolectric.Shadows.shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull("nothing opened", started);
        assertEquals(android.content.Intent.ACTION_VIEW, started.getAction());
        assertTrue(started.hasCategory(android.content.Intent.CATEGORY_BROWSABLE));
        assertTrue((started.getFlags() & android.content.Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        String url = started.getDataString();
        assertTrue(url, url.startsWith("https://github.com/SysAdminDoc/HushThreads/issues/new?template=bug_report.yml&"));
        assertTrue(url, url.length() <= app.morphe.extension.shared.settings.preference.ReportProblem.MAX_LENGTH);
        String decoded = java.net.URLDecoder.decode(url, "UTF-8");
        assertTrue(decoded, decoded.contains("&versions=HushThreads "));
        assertTrue(decoded, decoded.contains(" on Threads "));
        assertTrue(decoded, decoded.contains("&device="));
        assertTrue(decoded, decoded.contains("What happened:"));
        assertTrue(decoded, decoded.contains("What I expected:"));
        // Hide ads starts on, Hide screenshots from Threads starts off.
        assertTrue(decoded, decoded.contains("&additional_context=Switches on: "));
        assertTrue(decoded, decoded.contains("Hide ads"));
        assertFalse(decoded, decoded.contains("Hide screenshots from Threads"));
        assertEquals(before, savedValues());

        org.robolectric.Shadows.shadowOf(org.robolectric.RuntimeEnvironment.getApplication()).checkActivities(true);
        tap(SettingsNavigation.REPORT);
        assertEquals("No app on this phone can open the link. The address is "
                + L10n.isolate("github.com/SysAdminDoc/HushThreads/issues") + ".", ShadowToast.getTextOfLatestToast());
        assertFalse(controller.get().isFinishing());
    }

    @Test public void categoryClickChangesOnlyTheSettingWhoseRowWasTapped() {
        assertTrue(page.navigation.open(page.findPreference(Settings.SANITIZE_SHARING_LINKS.key)));
        assertTrue(page.navigation.isExpanded("Privacy"));
        assertTrue(Settings.SANITIZE_SHARING_LINKS.savedValue());
        tap(Settings.SANITIZE_SHARING_LINKS.key);
        assertFalse(Settings.SANITIZE_SHARING_LINKS.savedValue());
        assertTrue(Settings.DISABLE_ANALYTICS.savedValue());
        assertTrue(Settings.HIDE_ADS.savedValue());
    }

    /** One section open at a time, so opening another folds the one open before. */
    @Test public void openingAHeaderFoldsTheSectionOpenBefore() {
        Map<String, Object> before = savedValues();
        tap("section_Feed");
        tap("section_Privacy");
        assertFalse("the section open before stayed open", page.navigation.isExpanded("Feed"));
        assertTrue(page.navigation.isExpanded("Privacy"));
        assertFalse(contains(Settings.HIDE_ADS.key));
        assertTrue(contains(Settings.SANITIZE_SHARING_LINKS.key));
        assertEquals(HOME_ROWS + categoryCount("Privacy"), list().getCount());
        tap("section_Privacy");
        assertFalse(page.navigation.isExpanded("Privacy"));
        assertEquals(HOME_ROWS, list().getCount());
        tap("section_Privacy");
        assertTrue(page.navigation.open(page.findPreference(Settings.SANITIZE_SHARING_LINKS.key)));
        assertTrue("revealing an open section collapsed it", page.navigation.isExpanded("Privacy"));
        assertTrue(page.navigation.open(page.findPreference(Settings.HIDE_ADS.key)));
        assertTrue(page.navigation.isExpanded("Feed"));
        assertFalse("a jump to a setting left the section open before it", page.navigation.isExpanded("Privacy"));
        assertEquals(HOME_ROWS + categoryCount("Feed"), list().getCount());
        assertEquals(before, savedValues());
        assertMainToolbar();
    }

    /**
     * A header at the bottom edge opens onto the start of its first row. Until the top scrolls away
     * the list runs past the bottom of the screen, and on a phone Updates opened there with every
     * row of it out of sight.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aHeaderAtTheBottomEdgeOpensOntoItsFirstRow() {
        HeaderColumn column = (HeaderColumn) dialog.getView();
        layout(column);
        assertEquals("the top started scrolled away", 0, column.getScrollY());
        assertTrue("the list fit above the bottom edge", column.hiddenBelow() > 0);
        int bottom = column.getHeight() - column.getPaddingBottom();
        int child = Math.round(72 * column.getResources().getDisplayMetrics().density);
        String lowest = null;
        for (int i = 0; i < list().getChildCount(); i++) {
            View row = list().getChildAt(i);
            String key = ((Preference) list().getItemAtPosition(list().getFirstVisiblePosition() + i)).getKey();
            if (key != null && key.startsWith("section_") && shownTop(row) + row.getHeight() / 2 < bottom) lowest = key;
        }
        assertNotNull("no section header on screen", lowest);
        View header = shownRow(lowest);
        assertTrue("the lowest header left room for its row anyway", shownTop(header) + header.getHeight() + child > bottom);

        tap(lowest);
        layout(column);
        header = shownRow(lowest);
        assertTrue(lowest + " didn't open", page.navigation.isExpanded(lowest.substring("section_".length())));
        assertTrue(lowest + " went up under the bar", shownTop(header) >= column.pinnedBottom());
        assertTrue(lowest + " opened with its first row out of sight",
                shownTop(header) + header.getHeight() + child <= bottom + 1);
    }

    /** Where [view] starts on screen, from the top of the settings column, after the top's scroll. */
    private int shownTop(View view) {
        View column = dialog.getView();
        int top = 0;
        for (View at = view; at != column; ) {
            top += at.getTop();
            at = (View) at.getParent();
            top -= at.getScrollY();
        }
        return top;
    }

    /** The laid-out row of the item [key], which has to be on the list's page. */
    private View shownRow(String key) {
        for (int i = 0; i < list().getChildCount(); i++) {
            Object item = list().getItemAtPosition(list().getFirstVisiblePosition() + i);
            if (key.equals(((Preference) item).getKey())) return list().getChildAt(i);
        }
        throw new AssertionError("No laid-out row " + key);
    }

    @Test public void noTimeLimitFollowsTheFeedPositionSwitchWithoutLosingItsChoice() {
        Settings.BLOCK_RETURN_REFRESH.save(false);
        Settings.RETURN_REFRESH_NO_LIMIT.save(true);
        recreate();
        page.navigation.open(page.findPreference(Settings.BLOCK_RETURN_REFRESH.key));
        Preference noLimit = page.findPreference(Settings.RETURN_REFRESH_NO_LIMIT.key);
        assertFalse(noLimit.isEnabled());
        assertTrue(((SwitchPreference) noLimit).isChecked());
        tap(Settings.BLOCK_RETURN_REFRESH.key);
        ShadowLooper.idleMainLooper();
        assertTrue(noLimit.isEnabled());
        assertTrue(Settings.RETURN_REFRESH_NO_LIMIT.savedValue());
        tap(Settings.BLOCK_RETURN_REFRESH.key);
        ShadowLooper.idleMainLooper();
        assertFalse(noLimit.isEnabled());
        assertTrue(Settings.RETURN_REFRESH_NO_LIMIT.savedValue());
    }

    /**
     * Pause sits in the top bar. A pause that waits for the next start brings up the card, which
     * says only that, with the versions left to the header and the build line. Undo takes it away.
     */
    @Test public void overviewPauseAndUndoUpdateTheSavedSwitchAndRestartNotice() {
        layout(dialog.getView());
        android.widget.Button action = statusAction();
        assertEquals("Pause", action.getText().toString());
        assertTrue(action.getMinimumWidth() <= Math.round(48 * action.getResources().getDisplayMetrics().density));
        assertFalse(titles().contains("HushThreads is on"));
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertTrue(BaseSettings.PAUSED.savedValue());
        Preference card = (Preference) list().getItemAtPosition(0);
        assertEquals("HushThreads is on", String.valueOf(card.getTitle()));
        assertEquals("HushThreads pauses when Threads restarts.", String.valueOf(card.getSummary()));
        action = statusAction();
        assertEquals("Undo", action.getText().toString());
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertEquals("Pause", statusAction().getText().toString());
        assertFalse("the card stayed with nothing to say", titles().contains("HushThreads is on"));
        assertTrue(Settings.HIDE_ADS.savedValue());
    }

    /** A Resume the store can't keep leaves the pause on screen, in storage and in the switch, and says so. */
    @Test public void aResumeTheStoreCanNotKeepLeavesThePauseAndSaysSo() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView());
        assertEquals("Resume", statusAction().getText().toString());
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS, FailingStore.Fault.COMMIT_THROWS)) {
            statusAction().performClick();
            ShadowLooper.idleMainLooper();
        }
        layout(dialog.getView());
        assertEquals("Couldn't turn HushThreads back on. Try again.", ShadowToast.getTextOfLatestToast());
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

    /** A marker Resume can't remove keeps the Pause switch on, and the card says both steps and no more. */
    @Test public void aMarkerResumeCanNotRemoveKeepsTheSwitchAndSaysWhatToDo() throws Exception {
        File marker = HushThreadsPause.markerFile(controller.get());
        File held = new File(marker, "held");
        // A folder with something in it can't be deleted.
        assertTrue(marker.mkdirs() && held.createNewFile());
        try {
            BaseSettings.PAUSED.save(true);
            PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
            recreate();
            layout(dialog.getView());
            statusAction().performClick();
            ShadowLooper.idleMainLooper();
            layout(dialog.getView());
            assertTrue(BaseSettings.PAUSED.savedValue());
            assertEquals("Resume", statusAction().getText().toString());
            // The build line under the list names the build, so the card's advice is its whole line.
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
     * Paused, the card stays over an open section, and the saved switches keep showing what was
     * chosen. The top bar's Resume and Undo keep the row in view where it was, and the section open.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void anExpandedPausedSectionKeepsItsPlaceThroughResumeAndUndo() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView(), 1200);
        page.navigation.navigate("Feed");
        layout(dialog.getView(), 1200);
        Preference card = (Preference) list().getItemAtPosition(0);
        assertEquals("HushThreads is paused", String.valueOf(card.getTitle()));
        assertTrue("a saved choice was changed to look paused",
                ((SwitchPreference) page.findPreference(Settings.HIDE_ADS.key)).isChecked());
        assertTrue(Settings.HIDE_ADS.savedValue());

        list().scrollListBy(40);
        layout(dialog.getView(), 1200);
        Preference anchor = (Preference) list().getItemAtPosition(list().getFirstVisiblePosition());
        int offset = list().getChildAt(0).getTop();
        android.widget.Button action = statusAction();
        assertEquals("Resume", action.getText().toString());
        assertTrue(action.getMinimumHeight() >= Math.round(48 * action.getResources().getDisplayMetrics().density));
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView(), 1200);
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertEquals("HushThreads turns back on when Threads restarts.",
                String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary()));
        assertTrue("Resume left the section", contains(Settings.HIDE_ADS.key));
        assertTrue(page.navigation.isExpanded("Feed"));
        assertTrue(anchor == list().getItemAtPosition(list().getFirstVisiblePosition()));
        assertEquals(offset, list().getChildAt(0).getTop());

        action = statusAction();
        assertEquals("Undo", action.getText().toString());
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView(), 1200);
        assertTrue(BaseSettings.PAUSED.savedValue());
        assertEquals("Resume", statusAction().getText().toString());
        assertTrue(anchor == list().getItemAtPosition(list().getFirstVisiblePosition()));
        assertEquals(offset, list().getChildAt(0).getTop());

        assertFalse(page.navigation.back());
        assertTrue(page.navigation.isExpanded("Feed"));
    }

    /**
     * Search results say it too. An open section keeps the one card, and one with nothing Pause
     * turns off, like About, gets no line of its own.
     */
    @Test public void pausedSearchSaysSoAndExpandedSectionsKeepTheirSavedChoices() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.CRASH_LOOP);
        recreate();
        findSearch(dialog.getView()).setText("Hide ads");
        ShadowLooper.idleMainLooper();
        assertEquals(PAUSED_LINE, String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary()));
        assertTrue(contains(Settings.HIDE_ADS.key));
        page.navigation.back();
        for (String quiet : new String[]{"About", "Set when you patched"}) {
            page.navigation.navigate("");
            page.navigation.navigate(quiet);
            assertTrue(page.navigation.isExpanded(quiet));
            assertEquals(quiet, HOME_ROWS + 1 + categoryCount(quiet), list().getCount());
            assertEquals(1, java.util.Collections.frequency(titles(), "HushThreads is paused"));
            assertFalse(page.navigation.back());
        }
    }

    /**
     * Pause switched on from its section is owed a restart: the card says so, the restart row comes
     * up under it, and Undo takes both away without folding the section. A restart owed for a
     * switch puts the row first on the list, counted, and it goes when nothing is owed any more.
     */
    @Test public void aPauseOrAChangeWaitingOnARestartBringsUpTheRestartRow() {
        assertFalse("a restart row with nothing waiting", contains(SettingsNavigation.RESTART));
        page.navigation.navigate("Pause, backup and diagnostics");
        ShadowToast.reset();
        tap(BaseSettings.PAUSED.key);
        layout(dialog.getView());
        Preference line = (Preference) list().getItemAtPosition(0);
        assertEquals("HushThreads is on", String.valueOf(line.getTitle()));
        assertEquals("HushThreads pauses when Threads restarts.", String.valueOf(line.getSummary()));
        Preference restart = (Preference) list().getItemAtPosition(1);
        assertEquals(SettingsNavigation.RESTART, restart.getKey());
        assertEquals("Restart Threads to apply this change", String.valueOf(restart.getTitle()));
        assertEquals("Threads closes and reopens on this page.", String.valueOf(restart.getSummary()));
        assertTrue("the restart row doesn't take a tap", list().getAdapter().isEnabled(1));
        assertNull("the row and a toast both said it", ShadowToast.getLatestToast());
        statusAction().performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertTrue(page.navigation.isExpanded("Pause, backup and diagnostics"));
        assertTrue(contains(BaseSettings.PAUSED.key));
        assertFalse("Undo left the restart row", contains(SettingsNavigation.RESTART));
        assertEquals("Undo left the card", SettingsNavigation.QUICK_SETUPS, ((Preference) list().getItemAtPosition(0)).getKey());

        page.navigation.navigate("");
        AbstractPreferenceFragment.restartPending.add(Settings.PURE_BLACK.key);
        for (String section : new String[]{"Feed", "Privacy", "Appearance"}) {
            page.navigation.navigate(section);
            assertEquals(section, 0, position(SettingsNavigation.RESTART));
            assertEquals(section, categoryCount(section) + HOME_ROWS + 1, list().getCount());
        }
        page.navigation.navigate("");
        assertEquals(0, position(SettingsNavigation.RESTART));
        assertEquals(HOME_ROWS + 1, list().getCount());
        findSearch(dialog.getView()).setText("Hide ads");
        ShadowLooper.idleMainLooper();
        assertEquals(0, position(SettingsNavigation.RESTART));
        assertTrue(contains(Settings.HIDE_ADS.key));
        assertTrue(page.navigation.back());

        // Two changes are counted, and the row goes once neither is owed.
        AbstractPreferenceFragment.restartPending.add(Settings.HIDE_INSTAGRAM_BUTTON.key);
        page.navigation.restartChanged();
        ShadowLooper.idleMainLooper();
        restart = (Preference) list().getItemAtPosition(0);
        assertEquals(SettingsNavigation.RESTART, restart.getKey());
        assertEquals("Restart Threads to apply 2 changes", String.valueOf(restart.getTitle()));
        AbstractPreferenceFragment.restartPending.clear();
        page.navigation.restartChanged();
        ShadowLooper.idleMainLooper();
        assertFalse("the row stayed with nothing waiting", contains(SettingsNavigation.RESTART));
        assertEquals(HOME_ROWS, list().getCount());
    }

    /**
     * A switch that waits for a restart used to leave a toast and nothing to tap. Each one brings
     * the row up as it flips, counted, with no toast, and flipping them back takes it away.
     */
    @Test public void flippingARestartGatedSwitchShowsTheRowAtOnce() {
        page.navigation.navigate("Appearance");
        assertFalse(contains(SettingsNavigation.RESTART));
        ShadowToast.reset();
        String[] gated = {Settings.PURE_BLACK.key, Settings.HIDE_INSTAGRAM_BUTTON.key, Settings.HIDE_GHOST_POST_BUBBLES.key};
        String[] titles = {"Restart Threads to apply this change", "Restart Threads to apply 2 changes",
                "Restart Threads to apply 3 changes"};
        for (int i = 0; i < gated.length; i++) {
            tap(gated[i]);
            assertEquals(gated[i], Boolean.TRUE, Setting.getSettingFromPath(gated[i]).savedValue());
            assertEquals(gated[i], 0, position(SettingsNavigation.RESTART));
            assertEquals(titles[i], String.valueOf(((Preference) list().getItemAtPosition(0)).getTitle()));
            assertEquals(categoryCount("Appearance") + HOME_ROWS + 1, list().getCount());
            assertNull(gated[i] + " left a toast as well", ShadowToast.getLatestToast());
        }
        layout(dialog.getView());
        TextView status = dialog.getView().findViewWithTag(SettingsDialog.RESTART_STATUS);
        assertEquals("a screen reader isn't told the count", titles[2], status.getText().toString());
        assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, status.getAccessibilityLiveRegion());

        for (int i = gated.length - 1; i >= 0; i--) {
            tap(gated[i]);
            assertEquals(gated[i], Boolean.FALSE, Setting.getSettingFromPath(gated[i]).savedValue());
            assertEquals(gated[i], i > 0, contains(SettingsNavigation.RESTART));
        }
        assertEquals(categoryCount("Appearance") + HOME_ROWS, list().getCount());
        assertTrue(page.navigation.isExpanded("Appearance"));
        assertEquals("", status.getText().toString());
    }

    /**
     * Support offers a restart of its own when nothing is waiting. A waiting change swaps it for
     * the counting restart row, and a restart from Support opens Support again.
     */
    @Test public void supportHasItsOwnRestartRowUntilAChangeWaits() {
        List<Context> restarted = new ArrayList<>();
        ReopenSettingsAfterRestart.setRestarterForTests(restarted::add);
        page.navigation.navigate(SettingsNavigation.SUPPORT);
        int own = position(SettingsNavigation.RESTART_NOW);
        // Help and restart heads Report a problem and Restart Threads, and Support the project heads the Ko-fi row.
        assertEquals(list().getCount() - 4, own);
        assertEquals("Help and restart", String.valueOf(((Preference) list().getItemAtPosition(own - 2)).getTitle()));
        assertEquals(SettingsNavigation.REPORT, ((Preference) list().getItemAtPosition(own - 1)).getKey());
        assertEquals("Support the project", String.valueOf(((Preference) list().getItemAtPosition(own + 1)).getTitle()));
        Preference row = (Preference) list().getItemAtPosition(own);
        assertEquals("Restart Threads", String.valueOf(row.getTitle()));
        assertEquals("Threads closes and reopens on this page.", String.valueOf(row.getSummary()));
        assertFalse(contains(SettingsNavigation.RESTART));

        AbstractPreferenceFragment.restartPending.add(Settings.PURE_BLACK.key);
        page.navigation.restartChanged();
        ShadowLooper.idleMainLooper();
        assertFalse("two restart rows on one page", contains(SettingsNavigation.RESTART_NOW));
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(0)).getKey());
        AbstractPreferenceFragment.restartPending.clear();
        page.navigation.restartChanged();
        ShadowLooper.idleMainLooper();
        assertFalse(contains(SettingsNavigation.RESTART));
        assertEquals(own, position(SettingsNavigation.RESTART_NOW));

        // Opening another section folds Support, and its actions go with it.
        page.navigation.navigate("Privacy");
        assertFalse(page.navigation.isExpanded(SettingsNavigation.SUPPORT));
        assertFalse(contains(SettingsNavigation.RESTART_NOW));
        page.navigation.navigate("");

        Map<String, Object> before = savedValues();
        page.navigation.navigate(SettingsNavigation.SUPPORT);
        tap(SettingsNavigation.RESTART_NOW);
        assertEquals(1, restarted.size());
        assertNull("the restart waited on a dialog", org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog());
        assertEquals(before, savedValues());
        reopenFromRestart();
        assertTrue(page.navigation.isExpanded(SettingsNavigation.SUPPORT));
        assertTrue(contains(SettingsNavigation.RESTART_NOW));
        assertTrue(contains(SettingsNavigation.REPORT));
        assertMainToolbar();
    }

    /**
     * A tap on the restart row restarts at once, with no question first, and changes no saved
     * switch. A screen reader finds it as a button, and its double tap does what a tap does.
     *
     * <p>It runs on a phone-sized screen, since the row has to be on screen to be tapped and
     * Robolectric's default screen is shorter than any phone's, one row short once the main list
     * holds eleven sections.
     */
    @org.robolectric.annotation.Config(qualifiers = "w411dp-h891dp")
    @Test public void theRestartRowRestartsAtOnceAndAScreenReaderFindsItAsAButton() {
        List<Context> restarted = new ArrayList<>();
        ReopenSettingsAfterRestart.setRestarterForTests(restarted::add);
        AbstractPreferenceFragment.restartPending.add(Settings.PURE_BLACK.key);
        page.navigation.restartChanged();
        Map<String, Object> before = savedValues();
        layout(dialog.getView());
        View row = visibleRow(SettingsNavigation.RESTART);
        TextView title = row.findViewById(android.R.id.title);
        assertEquals("Restart Threads to apply this change", title.getText().toString());
        assertEquals(android.widget.Button.class.getName(), row.createAccessibilityNodeInfo().getClassName());
        assertTrue(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
        assertEquals("the tap didn't restart, or asked first", 1, restarted.size());
        assertNull("the restart waited on a dialog", org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog());
        assertEquals(before, savedValues());
        reopenFromRestart();
        assertEquals(HOME_ROWS, list().getCount());
        assertMainToolbar();
    }

    /** A restart brings back the open section and the row that was in view, though the restart row goes. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void theRestartRowRestoresExpandedSectionsAndTheVisibleAnchor() {
        List<Context> restarted = new ArrayList<>();
        ReopenSettingsAfterRestart.setRestarterForTests(restarted::add);
        AbstractPreferenceFragment.restartPending.add(Settings.PURE_BLACK.key);
        page.navigation.navigate("Feed");
        page.navigation.navigate("Privacy");
        layout(dialog.getView(), 1200);
        list().setSelectionFromTop(position(Settings.SANITIZE_SHARING_LINKS.key), -24);
        layout(dialog.getView(), 1200);
        String first = ((Preference) list().getItemAtPosition(list().getFirstVisiblePosition())).getKey();
        int offset = list().getChildAt(0).getTop();
        Map<String, Object> before = savedValues();
        tap(SettingsNavigation.RESTART);
        assertEquals(1, restarted.size());
        assertEquals(before, savedValues());
        reopenFromRestart();
        layout(dialog.getView(), 1200);
        assertFalse(page.navigation.isExpanded("Feed"));
        assertTrue(page.navigation.isExpanded("Privacy"));
        assertEquals(first, ((Preference) list().getItemAtPosition(list().getFirstVisiblePosition())).getKey());
        assertEquals(offset, list().getChildAt(0).getTop());
        assertFalse(contains(SettingsNavigation.RESTART));
        assertEquals(before, savedValues());
        assertMainToolbar();
    }

    @Test public void restartingFromSearchRestoresItsQueryAndTheExpandedMainList() {
        List<Context> restarted = new ArrayList<>();
        ReopenSettingsAfterRestart.setRestarterForTests(restarted::add);
        page.navigation.navigate("Feed");
        page.navigation.navigate("Downloads");
        AbstractPreferenceFragment.restartPending.add(Settings.PURE_BLACK.key);
        findSearch(dialog.getView()).setText("shared links");
        ShadowLooper.idleMainLooper();
        Map<String, Object> before = savedValues();
        tap(SettingsNavigation.RESTART);
        assertEquals(1, restarted.size());
        reopenFromRestart();
        assertEquals("shared links", findSearch(dialog.getView()).getText().toString());
        assertTrue(contains(Settings.SANITIZE_SHARING_LINKS.key));
        assertTrue(page.navigation.back());
        assertFalse(page.navigation.isExpanded("Feed"));
        assertTrue(page.navigation.isExpanded("Downloads"));
        assertFalse(contains(Settings.HIDE_ADS.key));
        assertTrue(contains(app.morphe.extension.hushthreads.download.SaveSettings.DOWNLOAD_QUALITY.key));
        assertEquals(before, savedValues());
        assertMainToolbar();
    }

    /**
     * A page name from an older restart opens its section on the main list. "more", the page More
     * settings had, and a page this build doesn't have open the main list with nothing open.
     */
    @Test public void aLegacyPageRequestExpandsItsSectionOnTheMainList() {
        for (String section : new String[]{"Links", "Appearance"}) {
            reopenOn(section);
            assertTrue(page.navigation.isExpanded(section));
            assertEquals(HOME_ROWS + categoryCount(section), list().getCount());
            assertMainToolbar();
            assertFalse(page.navigation.back());
        }
        assertTrue(contains(Settings.PURE_BLACK.key));
        for (String legacy : new String[]{"more", "A page from another build"}) {
            reopenOn(legacy);
            assertEquals(legacy, HOME_ROWS, list().getCount());
            assertFalse(page.navigation.isExpanded("Links"));
            assertFalse(titles().contains("More settings"));
            assertMainToolbar();
        }
    }

    /**
     * The toggle under search shows every section's rows on the one list under their headings,
     * Support's rows too, with no button to open. The choice is kept for the next time the screen
     * opens, and the same toggle goes back to the sections.
     */
    @Test public void theListViewShowsEverySettingUnderItsHeadingAndIsKept() {
        View toggle = dialog.getView().findViewWithTag(SettingsDialog.VIEW_TOGGLE);
        assertNotNull("no list toggle", toggle);
        assertEquals("Show all settings as a list", toggleLabel(toggle));
        Map<String, Object> before = savedValues();
        assertTrue(toggle.performClick());
        ShadowLooper.idleMainLooper();
        assertTrue(page.navigation.listMode());
        assertEquals("Show settings by category", toggleLabel(dialog.getView().findViewWithTag(SettingsDialog.VIEW_TOGGLE)));
        // Quick setups, then each section with rows as a heading over them.
        int rows = 1;
        for (Preference section : page.sections()) {
            int children = ((PreferenceCategory) section).getPreferenceCount();
            if (children > 0) rows += 1 + children;
            assertFalse("a section button in the list view", contains("section_" + page.navigation.sectionId(section)));
        }
        // Support's heading, its two subheadings, Report a problem, Restart Threads, the Ko-fi row and the build line.
        assertEquals(rows + 7, list().getCount());
        assertTrue(contains(Settings.HIDE_ADS.key));
        assertTrue(contains(Settings.PURE_BLACK.key));
        assertTrue(contains(SettingsNavigation.REPORT));
        assertTrue(contains(HushThreadsPreferenceFragment.SUPPORT));
        assertFalse(contains(SettingsNavigation.SUPPORT));

        reopenOn("");
        assertTrue("the list view wasn't kept", page.navigation.listMode());
        assertEquals(rows + 7, list().getCount());
        assertTrue(dialog.getView().findViewWithTag(SettingsDialog.VIEW_TOGGLE).performClick());
        ShadowLooper.idleMainLooper();
        assertFalse(page.navigation.listMode());
        assertEquals(HOME_ROWS, list().getCount());
        reopenOn("");
        assertEquals(HOME_ROWS, list().getCount());
        assertEquals(before, savedValues());
    }

    private static String toggleLabel(View toggle) {
        android.view.ViewGroup row = (android.view.ViewGroup) toggle;
        for (int i = 0; i < row.getChildCount(); i++) {
            if (row.getChildAt(i) instanceof TextView) return ((TextView) row.getChildAt(i)).getText().toString();
        }
        throw new AssertionError("the toggle has no label");
    }

    /** The paused card over a real section, for a look before the phone does. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void renderPausedPages() throws Exception {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        recreate();
        page.navigation.navigate("Feed");
        capture("paused-feed");
        assertUncutText(dialog.getView());
        statusAction().performClick();
        ShadowLooper.idleMainLooper();
        capture("paused-feed-resume-pending");
        findSearch(dialog.getView()).setText("links");
        capture("paused-search");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rXB-ldrtl-w390dp-h844dp-night-xhdpi")
    public void aPausedPageKeepsItsLineWholeAtLargeRightToLeftText() throws Exception {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
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

    private int categoryCount(String id) {
        for (Preference section : page.sections()) {
            if (id.equals(page.navigation.sectionId(section))) return ((PreferenceCategory) section).getPreferenceCount();
        }
        throw new AssertionError("No section " + id);
    }

    /** Paused, the card says what to do in order. It used to read as if a restart came before Resume. */
    @Test public void aPausedOverviewSaysToTapResumeThenRestart() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView());
        TextView summary = list().getChildAt(0).findViewById(android.R.id.summary);
        assertEquals("Your choices are saved. Tap Resume, then restart Threads.", summary.getText().toString());
        assertEquals("Resume", statusAction().getText().toString());
        assertTrue(((PreferenceCategory) page.sections().get(page.sections().size() - 1)).getPreference(0)
                .getSummary().toString().contains(app.morphe.extension.shared.Utils.getPatchesBuildIdentity()));
    }

    /**
     * At twice the text size the button beside the status text left the name too little room and
     * "HushThreads" broke inside the word. The top bar stacks them, so the name keeps whole and
     * Pause stays in full view.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void toolbarPauseRemainsVisibleAtLargeText() {
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        try {
            recreate();
            layout(dialog.getView());
            android.widget.Button action = statusAction();
            TextView title = pageTitle();
            assertEquals("Pause", action.getText().toString());
            assertTrue(action.getParent() == title.getParent());
            android.text.Layout lines = title.getLayout();
            assertNotNull(lines);
            for (int line = 0; line + 1 < lines.getLineCount(); line++) {
                char last = title.getText().charAt(lines.getLineEnd(line) - 1);
                assertTrue("\"" + title.getText() + "\" breaks inside a word after line " + line, Character.isWhitespace(last));
            }
            android.graphics.Rect shown = new android.graphics.Rect();
            assertTrue(action.getGlobalVisibleRect(shown));
            assertEquals(action.getHeight(), shown.height());
            assertEquals(action.getWidth(), shown.width());
            assertFalse(titles().contains("HushThreads is on"));
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

    /**
     * The button's floor is 48 dp, but its frame took the row's height, which the text alone set:
     * on a Galaxy S22 the overview's Pause laid out 39.5 dp tall. Laid out, the top bar's Pause and
     * Resume and the paused card's Resume are 48 dp or more.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w780dp-h1688dp-mdpi")
    public void theStatusButtonsAreLaidOutAtLeast48dpTall() {
        layout(dialog.getView());
        int floor = Math.round(48 * list().getResources().getDisplayMetrics().density);
        assertTrue("Pause is " + statusAction().getHeight() + " px tall", statusAction().getHeight() >= floor);

        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView());
        assertTrue("Resume is " + statusAction().getHeight() + " px tall", statusAction().getHeight() >= floor);
        android.widget.Button card = firstButton(list().getChildAt(0));
        assertNotNull("no Resume on the paused card", card);
        assertEquals("Resume", card.getText().toString());
        assertTrue("the card's Resume is " + card.getHeight() + " px tall", card.getHeight() >= floor);
    }

    private android.widget.Button statusAction() {
        android.widget.Button action = dialog.getView().findViewWithTag(SettingsDialog.PAUSE_ACTION);
        assertNotNull("no Pause in the top bar", action);
        return action;
    }

    private TextView pageTitle() {
        TextView title = dialog.getView().findViewWithTag(SettingsDialog.PAGE_TITLE);
        assertNotNull("no title in the top bar", title);
        return title;
    }

    @Test public void searchUsesRealControlsAndClearReturnsHome() {
        EditText search = findSearch(dialog.getView());
        assertNotNull(search);
        search.setText("shared links");
        ShadowLooper.idleMainLooper();
        assertTrue(contains(Settings.SANITIZE_SHARING_LINKS.key));
        tap(Settings.SANITIZE_SHARING_LINKS.key);
        assertFalse(Settings.SANITIZE_SHARING_LINKS.savedValue());
        search.setText("noSuchSetting987654");
        assertEquals(1, list().getCount());
        assertFalse(list().getAdapter().isEnabled(0));
        assertEquals("No matching settings", ((Preference) list().getItemAtPosition(0)).getTitle());
        assertTrue(page.navigation.back());
        assertEquals("", search.getText().toString());
        assertEquals(HOME_ROWS, list().getCount());
    }

    @Test public void searchFindsSupportActionsWhileSupportIsCollapsed() {
        EditText search = findSearch(dialog.getView());
        search.setText("Report a problem");
        assertTrue(contains(SettingsNavigation.REPORT));
        assertFalse(page.navigation.isExpanded(SettingsNavigation.SUPPORT));
        assertTrue(list().getAdapter().isEnabled(position(SettingsNavigation.REPORT)));
        search.setText("Restart Threads");
        assertTrue(contains(SettingsNavigation.RESTART_NOW));
        assertTrue(list().getAdapter().isEnabled(position(SettingsNavigation.RESTART_NOW)));
        assertFalse(page.navigation.isExpanded(SettingsNavigation.SUPPORT));
        assertTrue(page.navigation.back());
        assertFalse(contains(SettingsNavigation.REPORT));
        assertFalse(contains(SettingsNavigation.RESTART_NOW));
        assertEquals(HOME_ROWS, list().getCount());
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
        search.setText("hide ads");
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
     * Folding a section leaves screen-reader focus on its header, so nobody loses their place.
     * Robolectric's window has no surface and drops accessibility focus on its next traversal, so
     * the test reads the focus event the row sent rather than the row's state afterwards.
     */
    @Test public void collapsingASectionKeepsScreenReaderFocusOnItsHeader() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        layout(dialog.getView());
        page.navigation.navigate("Privacy");
        layout(dialog.getView());
        tap("section_Privacy");
        layout(dialog.getView());
        assertFalse(page.navigation.isExpanded("Privacy"));
        assertEquals("Privacy", focusedTitle(a11y));
        page.navigation.navigate("About");
        layout(dialog.getView());
        tap("section_About");
        layout(dialog.getView());
        assertFalse(page.navigation.isExpanded("About"));
        assertEquals("About", focusedTitle(a11y));
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

    @Test public void recreationKeepsExpandedSectionsTheirRowsAndTheSearchQuery() {
        page.navigation.open(page.findPreference(Settings.SANITIZE_SHARING_LINKS.key));
        recreate();
        assertTrue(page.navigation.isExpanded("Privacy"));
        assertTrue(contains(Settings.SANITIZE_SHARING_LINKS.key));
        // Privacy includes its five switches, the SIM region under the last of them and the address
        // coverage disclosed by this build.
        assertEquals(7, categoryCount("Privacy"));
        assertEquals(HOME_ROWS + 7, list().getCount());
        assertTrue(titles().contains("Analytics address coverage"));
        findSearch(dialog.getView()).setText("shared links");
        recreate();
        assertEquals("shared links", findSearch(dialog.getView()).getText().toString());
        assertTrue(contains(Settings.SANITIZE_SHARING_LINKS.key));
        assertTrue(page.navigation.back());
        assertTrue("clearing the search folded the section", page.navigation.isExpanded("Privacy"));
    }

    /** The top bar's Back and the phone's Back both clear a search first, then close the screen. */
    @Test public void bothBackPathsClearSearchThenCloseWithoutCollapsingSections() {
        for (boolean toolbar : new boolean[]{true, false}) {
            reopenOn("");
            page.navigation.navigate("Feed");
            page.navigation.navigate("About");
            findSearch(dialog.getView()).setText("Hide ads");
            android.app.Dialog shown = dialog.getDialog();
            if (toolbar) SettingsL10nTest.backOf(dialog).performClick();
            else shown.onBackPressed();
            ShadowLooper.idleMainLooper();
            assertTrue(shown.isShowing());
            assertEquals("", findSearch(dialog.getView()).getText().toString());
            assertFalse(page.navigation.isExpanded("Feed"));
            assertTrue(page.navigation.isExpanded("About"));
            if (toolbar) SettingsL10nTest.backOf(dialog).performClick();
            else shown.onBackPressed();
            ShadowLooper.idleMainLooper();
            assertFalse("Back walked through the open sections", shown.isShowing());
            assertFalse(controller.get().isFinishing());
        }
    }

    // A window as short as the layouts below, 1200 px, so folding a section and clearing a search
    // keep the row in view where it was.
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void sectionChangesAndSearchClearKeepTheVisibleRowAndExpandedSections() {
        forceTouchMode(true);
        try {
            layout(dialog.getView(), 1200);
            assertTrue(list().isInTouchMode());
            // Every section folded, with Feed's header scrolled off above the row in view.
            page.navigation.navigate("");
            layout(dialog.getView(), 1200);
            list().setSelectionFromTop(position("section_Feed") + 3, -24);
            layout(dialog.getView(), 1200);
            Preference anchor = (Preference) list().getItemAtPosition(list().getFirstVisiblePosition());
            assertTrue(list().getFirstVisiblePosition() > position("section_Feed"));
            int offset = list().getChildAt(0).getTop();
            tap("section_Feed");
            assertTrue(page.navigation.isExpanded("Feed"));
            // Source preference updates can arrive before the new expansion has laid out.
            ((android.widget.BaseAdapter) page.getPreferenceScreen().getRootAdapter()).notifyDataSetChanged();
            layout(dialog.getView(), 1200);
            assertTrue(anchor == list().getItemAtPosition(list().getFirstVisiblePosition()));
            assertEquals(offset, list().getChildAt(0).getTop());
            tap("section_Feed");
            layout(dialog.getView(), 1200);
            assertTrue(anchor == list().getItemAtPosition(list().getFirstVisiblePosition()));
            assertEquals(offset, list().getChildAt(0).getTop());
            findSearch(dialog.getView()).setText("shared links");
            assertTrue(contains(Settings.SANITIZE_SHARING_LINKS.key));
            assertFalse(page.navigation.isExpanded("Privacy"));
            assertTrue(page.navigation.back());
            layout(dialog.getView(), 1200);
            assertFalse(page.navigation.isExpanded("Feed"));
            assertFalse(page.navigation.isExpanded("Privacy"));
            assertTrue(anchor == list().getItemAtPosition(list().getFirstVisiblePosition()));
            assertEquals(offset, list().getChildAt(0).getTop());
        } finally {
            forceTouchMode(false);
        }
    }

    @Test public void visibleNavigationAndSearchKeepTheirAccessibilityRoles() {
        layout(dialog.getView());
        assertTrue(pageTitle().createAccessibilityNodeInfo().isHeading());
        View feed = visibleRow("section_Feed");
        assertEquals(android.widget.Button.class.getName(), feed.createAccessibilityNodeInfo().getClassName());
        assertTrue(feed.createAccessibilityNodeInfo().isHeading());
        assertTrue(feed.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
        assertTrue(page.navigation.isExpanded("Feed"));
        assertTrue(contains(Settings.HIDE_ADS.key));
        findSearch(dialog.getView()).setText("Hide ads");
        layout(dialog.getView());
        View toggle = list().getChildAt(position(Settings.HIDE_ADS.key) - list().getFirstVisiblePosition());
        assertEquals(android.widget.Switch.class.getName(), toggle.createAccessibilityNodeInfo().getClassName());
        assertTrue(toggle.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
        assertFalse(Settings.HIDE_ADS.savedValue());
    }

    @Test public void accordionHeadersExposeAndPerformTheirCurrentExpandedAction() {
        layout(dialog.getView());
        String key = "section_Feed";
        View header = visibleRow(key);
        AccessibilityNodeInfo closed = header.createAccessibilityNodeInfo();
        assertTrue(closed.isHeading());
        assertEquals(android.widget.Button.class.getName(), String.valueOf(closed.getClassName()));
        assertNotNull(closed.getStateDescription());
        assertFalse(closed.getStateDescription().toString().isEmpty());
        assertTrue(closed.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_EXPAND));
        assertFalse(closed.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_COLLAPSE));
        assertTrue(header.performAccessibilityAction(AccessibilityNodeInfo.ACTION_EXPAND, null));
        layout(dialog.getView());
        assertTrue(page.navigation.isExpanded("Feed"));
        header = visibleRow(key);
        assertTrue(header.performAccessibilityAction(AccessibilityNodeInfo.ACTION_EXPAND, null));
        assertTrue("an explicit Expand toggled the section closed", page.navigation.isExpanded("Feed"));
        AccessibilityNodeInfo opened = header.createAccessibilityNodeInfo();
        assertTrue(opened.isHeading());
        assertNotEquals(closed.getStateDescription(), opened.getStateDescription());
        assertTrue(opened.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_COLLAPSE));
        assertFalse(opened.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_EXPAND));
        assertTrue(header.performAccessibilityAction(AccessibilityNodeInfo.ACTION_COLLAPSE, null));
        layout(dialog.getView());
        assertFalse(page.navigation.isExpanded("Feed"));
        assertFalse(contains(Settings.HIDE_ADS.key));
        assertEquals(closed.getStateDescription(), visibleRow(key).createAccessibilityNodeInfo().getStateDescription());
    }

    /** Both coverage states are rendered through the settings dialog's actual layout. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(shadows = AnalyticsCoverageTest.Status.class,
            instrumentedPackages = "app.morphe.extension.hushthreads.settings")
    public void completeAndPartialAnalyticsCoverageAreReadableOffscreen() throws Exception {
        try {
            AnalyticsCoverageTest.Status.included = true;
            for (int mask : new int[]{7, 1}) {
                AnalyticsCoverageTest.Status.mask = mask;
                recreate();
                page.navigation.open(page.findPreference(Settings.DISABLE_ANALYTICS.key));
                assertTrue(titles().contains("Analytics address coverage"));
                capture(mask == 7 ? "analytics-complete" : "analytics-partial", 1734);
            }
        } finally {
            AnalyticsCoverageTest.Status.mask = 0;
            AnalyticsCoverageTest.Status.included = false;
        }
    }

    /** Feed's button describes the feed rules selected for this build, including single-rule builds. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void feedOverviewAndRowsMatchSelectedRules() throws Exception {
        List<EnumSet<PatchFamily>> selections = Arrays.asList(
                EnumSet.of(PatchFamily.HIDE_ADS),
                EnumSet.of(PatchFamily.HIDE_SUGGESTED_USERS),
                EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.HIDE_SUGGESTED_USERS));
        String[] summaries = {"Sponsored posts in For you and Following",
                "Suggested accounts in your feed", "Ads and suggested accounts in your feed"};
        String[] names = {"ads-only", "suggestions-only", "both-rules"};
        for (int i = 0; i < selections.size(); i++) {
            PatchFamily.inBuildForTests = selections.get(i);
            recreate();
            assertTrue(contains("section_Feed"));
            Preference feed = (Preference) list().getItemAtPosition(position("section_Feed"));
            assertEquals(summaries[i], String.valueOf(feed.getSummary()));
            capture("feed-overview-" + names[i]);
            tap("section_Feed");
            assertEquals(selections.get(i).contains(PatchFamily.HIDE_ADS), contains(Settings.HIDE_ADS.key));
            assertEquals(selections.get(i).contains(PatchFamily.HIDE_SUGGESTED_USERS),
                    contains(Settings.HIDE_SUGGESTED_USERS.key));
            ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
            capture("feed-" + names[i]);
            // Folded again, so the next build's screen opens with nothing open.
            tap("section_Feed");
            assertFalse(page.navigation.isExpanded("Feed"));
        }
        PatchFamily.inBuildForTests = EnumSet.noneOf(PatchFamily.class);
        recreate();
        assertFalse(contains("section_Feed"));
    }

    /** Every section is rendered with the same viewport as the design reference. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void renderEveryPageAndSearchOffscreen() throws Exception {
        capture("00-overview", 1734);
        // Support, opened at the foot of the list, over the build line.
        page.navigation.navigate(SettingsNavigation.SUPPORT);
        list().setSelection(list().getCount() - 1);
        capture("00-overview-bottom", 1734);
        assertVisible(HushThreadsPreferenceFragment.SUPPORT);
        assertEquals("Support HushThreads", String.valueOf(((Preference) list().getItemAtPosition(
                position(HushThreadsPreferenceFragment.SUPPORT))).getTitle()));
        for (Preference section : page.sections()) {
            page.navigation.open(section);
            String name = section.getTitle().toString().toLowerCase(java.util.Locale.ROOT).replaceAll("[^a-z]+", "-");
            int height = name.equals("feed") ? 1829 : 1734;
            capture(name, height);
            if (list().canScrollVertically(1)) {
                list().setSelection(position("section_" + page.navigation.sectionId(section))
                        + ((PreferenceCategory) section).getPreferenceCount());
                capture(name + "-end", height);
            }
        }
        findSearch(dialog.getView()).setText("links");
        ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
        capture("search-results");
        findSearch(dialog.getView()).requestFocus();
        capture("search-focused");
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
        page.navigation.navigate("Downloads");
        for (String[] action : new String[][]{
                {app.morphe.extension.hushthreads.download.SaveSettings.DOWNLOAD_QUALITY.key, "dialog-quality"},
                {app.morphe.extension.hushthreads.download.SaveSettings.SAVE_FOLDER.key, "dialog-folder"},
                {app.morphe.extension.hushthreads.download.SaveSettings.FILENAME_TEMPLATE.key, "dialog-filename"}}) {
            tap(action[0]);
            AlertDialog choice = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
            captureDialog(action[1], choice);
            choice.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        }
        page.navigation.navigate("Pause, backup and diagnostics");
        page.pendingImport = SettingsBackup.parse("{\"format\":\"hushthreads-settings\",\"schema\":1,\"settings\":{\"hushthreads_hide_ads\":false}}").toBundle();
        SettingsBackupPreference.onPageResumed(page);
        captureDialog("dialog-import", page.importPreview);
        page.importPreview.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        page.navigation.navigate("About");
        Preference about = page.sections().get(page.sections().size() - 1);
        Preference licenses = ((PreferenceCategory) about).getPreference(2);
        licenses.getOnPreferenceClickListener().onPreferenceClick(licenses);
        AlertDialog notice = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        captureDialog("dialog-licenses", notice);
        notice.dismiss();
        // Everything folded, so the screen recreated below opens on the main list alone.
        page.navigation.navigate("");

        PatchFamily.inBuildForTests = PatchFamily.DEFAULT_SELECTION;
        recreate();
        assertTrue("the default overview isn't the main list", contains(SettingsNavigation.QUICK_SETUPS));
        capture("default-overview", 1734);
        for (Preference section : page.sections()) {
            page.navigation.open(section);
            String name = section.getTitle().toString().toLowerCase(java.util.Locale.ROOT).replaceAll("[^a-z]+", "-");
            capture("default-" + name, name.equals("feed") ? 1829 : 1734);
        }
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
     * Brazilian Portuguese runs longer than English. Every section still wraps its
     * whole text at twice the text size, and the table is the one on screen.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "pt-rBR-w390dp-h844dp-night-xhdpi")
    public void brazilianPortuguesePagesKeepTheirCompleteText() throws Exception {
        assertEquals("Privacidade", String.valueOf(page.sections().get(1).getTitle()));
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
            page.navigation.navigate("Pause, backup and diagnostics");
            capture("pt-br-large-pause");
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void recoveryKeepsRetryAndBackVisible() throws Exception {
        dialog.dismiss();
        controller.get().getFragmentManager().executePendingTransactions();
        HushThreadsPreferenceFragment.failNextInitialization = new IllegalStateException("render recovery");
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
        // Match the reference raster density while keeping the native viewport 390 dp wide.
        int width = height == 1734 ? 841 : height == 1829 ? 819 : 780;
        float densityScale = width / 780f;
        Bitmap image = Bitmap.createBitmap(width, Math.round(height * densityScale), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(image);
        canvas.scale(densityScale, densityScale);
        root.draw(canvas);
        try (FileOutputStream out = new FileOutputStream(new File(folder, name + ".png"))) {
            assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, out));
        }
        image.recycle();
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
        dialog = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag("hushthreads_settings");
        assertNotNull(dialog);
        page = page(dialog);
    }

    /** Closes the screen and shows it again the way a restart does, on [state]. */
    private void reopenOn(String state) {
        if (dialog != null && dialog.isAdded()) dialog.dismissAllowingStateLoss();
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        dialog = SettingsDialog.onPage(state);
        dialog.show(controller.get().getFragmentManager(), "hushthreads_settings");
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        page = page(dialog);
        assertNotNull(page.navigation);
    }

    private void reopenFromRestart() {
        String state = ReopenSettingsAfterRestart.takeFresh(Setting.preferences.preferences, android.os.SystemClock.elapsedRealtime());
        assertNotNull("restart did not save where settings was", state);
        assertNull("restart state was not consumed",
                ReopenSettingsAfterRestart.takeFresh(Setting.preferences.preferences, android.os.SystemClock.elapsedRealtime()));
        AbstractPreferenceFragment.restartPending.clear();
        reopenOn(state);
    }

    private void assertMainToolbar() {
        assertEquals("HushThreads", pageTitle().getText().toString());
        assertTrue(pageTitle().isAccessibilityHeading());
        assertEquals(View.VISIBLE, ((View) findSearch(dialog.getView()).getParent()).getVisibility());
    }

    private void forceTouchMode(boolean touch) {
        Object root = org.robolectric.util.ReflectionHelpers.callInstanceMethod(
                dialog.getDialog().getWindow().getDecorView(), "getViewRootImpl");
        org.robolectric.util.ReflectionHelpers.callInstanceMethod(root, "ensureTouchMode",
                org.robolectric.util.ReflectionHelpers.ClassParameter.from(boolean.class, touch));
    }

    private void assertVisible(String key) {
        int row = position(key);
        assertTrue(key + " is off screen at " + row + " of " + list().getFirstVisiblePosition() + ".."
                        + list().getLastVisiblePosition(),
                row >= list().getFirstVisiblePosition() && row <= list().getLastVisiblePosition());
    }

    private View visibleRow(String key) {
        assertVisible(key);
        return list().getChildAt(position(key) - list().getFirstVisiblePosition());
    }

    private static HushThreadsPreferenceFragment page(SettingsDialog dialog) {
        return (HushThreadsPreferenceFragment) dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
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

    // Disclosure behavior ported from Hushfacebook 814acd23.
    @Test public void theOverviewNamesTheDefaultPatchesABuildLacks() {
        assertFalse(contains(HushThreadsPreferenceFragment.MISSING_DEFAULTS));
        controller.close();
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.inBuildForTests.remove(PatchFamily.VERSION_CODE);
        PatchFamily.inBuildForTests.remove(PatchFamily.HIDE_SUGGESTED_USERS);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
        Map<String, Object> before = savedValues();

        // With no card to sit under, the line opens the list and Quick setups follows it.
        assertEquals(HOME_ROWS + 1, list().getCount());
        assertEquals(0, position(HushThreadsPreferenceFragment.MISSING_DEFAULTS));
        assertEquals(1, position(SettingsNavigation.QUICK_SETUPS));
        Preference row = (Preference) list().getItemAtPosition(0);
        assertEquals("1 default patch isn't in this build", String.valueOf(row.getTitle()));
        assertEquals("Tap to see which.", String.valueOf(row.getSummary()));
        tap(HushThreadsPreferenceFragment.MISSING_DEFAULTS);
        assertEquals("Not in this build: " + L10n.isolate("Hide suggested users") + ". Morphe Manager selects it by "
                + "default. Patch again with it selected to get what it does.", String.valueOf(row.getSummary()));
        tap(HushThreadsPreferenceFragment.MISSING_DEFAULTS);
        assertEquals("Tap to see which.", String.valueOf(row.getSummary()));
        assertEquals(before, savedValues());

        // Paused, the card comes first and the line sits under it.
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        recreate();
        assertEquals("HushThreads is paused", String.valueOf(((Preference) list().getItemAtPosition(0)).getTitle()));
        assertEquals(1, position(HushThreadsPreferenceFragment.MISSING_DEFAULTS));
        assertEquals(2, position(SettingsNavigation.QUICK_SETUPS));
        BaseSettings.PAUSED.resetToDefault();
        PauseForTests.resume();

        controller.close();
        PatchFamily.inBuildForTests.remove(PatchFamily.HIDE_ADS);
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
        row = (Preference) list().getItemAtPosition(position(HushThreadsPreferenceFragment.MISSING_DEFAULTS));
        assertEquals("2 default patches aren't in this build", String.valueOf(row.getTitle()));
        tap(HushThreadsPreferenceFragment.MISSING_DEFAULTS);
        assertEquals("Not in this build: " + L10n.isolate("Hide ads") + " and "
                + L10n.isolate("Hide suggested users") + ". Morphe Manager selects them by default. Patch again with "
                + "them selected to get what they do.", String.valueOf(row.getSummary()));
    }
}
