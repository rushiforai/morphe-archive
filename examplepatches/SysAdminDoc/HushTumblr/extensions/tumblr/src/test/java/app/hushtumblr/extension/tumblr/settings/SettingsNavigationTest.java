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
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
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
        // Saves run in line. On the real worker a save finished whenever it did, before or after
        // the test's next layout, and what was said under a switch depended on which.
        HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
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
        Settings.HIDE_ADS.resetToDefault();
        app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.remove(
                Settings.HIDE_ADS.key);
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
        // The address stays under the row it came from, with a way to copy it, instead of a toast that fades.
        assertEquals("No app on this phone can open the link. The address is " + L10n.isolate("ko-fi.com/X8K126YVER") + ".",
                SettingsFeedbackTest.message((Preference) list().getItemAtPosition(last)));
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
        Preference card = (Preference) list().getAdapter().getItem(0);
        assertEquals("Couldn't turn HushTumblr back on. Try again.", SettingsFeedbackTest.message(card));
        TextView said = list().getChildAt(0).findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        assertNotNull("the card doesn't show what to do", said);
        assertEquals("Couldn't turn HushTumblr back on. Try again.", said.getText().toString());
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

    /**
     * Resume tapped on a page's pause line says what it left to do under that line, the one in
     * view, rather than under the home card. At 2x text in RTL the button sits below the note.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rXB-ldrtl-w390dp-h600dp-night-xhdpi")
    public void aResumeFromAPagesPauseLineSaysWhatItLeftUnderThatLine() {
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        recreate();
        assertEquals(2f, dialog.getView().getResources().getConfiguration().fontScale, 0f);
        page.navigation.navigate("Privacy");
        layout(dialog.getView(), 1200);
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS, FailingStore.Fault.COMMIT_THROWS)) {
            pageAction().performClick();
            ShadowLooper.idleMainLooper();
        }
        layout(dialog.getView(), 1200);
        assertTrue(BaseSettings.PAUSED.savedValue());
        Preference line = (Preference) list().getItemAtPosition(0);
        String left = SettingsFeedbackTest.message(line);
        assertNotNull("the pause line that was tapped doesn't say what to do", left);
        assertNull("said under the home card, which isn't in view",
                SettingsFeedbackTest.message(page.getPreferenceScreen().getPreference(0)));
        View row = list().getChildAt(0);
        TextView said = row.findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        assertNotNull(said);
        assertEquals(left, said.getText().toString());
        View region = row.findViewWithTag(SettingsFeedback.REGION_TAG);
        android.widget.Button action = pageAction();
        assertSame("the button and the note share the text column", region.getParent(), action.getParent());
        assertTrue("Resume covers the note: note ends at " + region.getBottom() + ", button starts at " + action.getTop(),
                action.getTop() >= region.getBottom());
        assertTrue("the row cuts the button off", ((View) action.getParent()).getHeight() >= action.getBottom());
    }

    /** A result for a row on another page waits for that page, where it's then shown in full. */
    @Test public void aResultForARowOnAnotherPageWaitsForThatPage() {
        String failed = "Couldn't save that change. Try again.";
        HushTumblrPreferenceFragment.unseenResult(Settings.HIDE_ADVERTISING_ID.key, failed);
        ShadowLooper.idleMainLooper();
        Preference privacy = page.findPreference(Settings.HIDE_ADVERTISING_ID.key);
        assertNull("shown under a switch on a page that isn't open", SettingsFeedbackTest.message(privacy));
        assertEquals(failed, ShadowToast.getTextOfLatestToast());
        page.navigation.navigate("Privacy");
        ShadowLooper.idleMainLooper();
        assertEquals(failed, SettingsFeedbackTest.message(privacy));
    }

    /** Two results waiting for one page both show there, though showing the first rebuilds the page. */
    @Test public void twoResultsWaitingForOnePageBothShowThere() {
        page.navigation.navigate("Privacy");
        String other = null;
        for (int i = 0; i < list().getCount() && other == null; i++) {
            Object item = list().getItemAtPosition(i);
            if (item instanceof SwitchPreference && !Settings.HIDE_ADVERTISING_ID.key.equals(((Preference) item).getKey())) {
                other = ((Preference) item).getKey();
            }
        }
        assertNotNull("Privacy has a second switch", other);
        page.navigation.navigate("");
        String first = "Couldn't save that change. Try again.";
        String second = "Couldn't save this one either. Try again.";
        HushTumblrPreferenceFragment.unseenResult(Settings.HIDE_ADVERTISING_ID.key, first);
        HushTumblrPreferenceFragment.unseenResult(other, second);
        ShadowLooper.idleMainLooper();
        page.navigation.navigate("Privacy");
        ShadowLooper.idleMainLooper();
        assertEquals(first, SettingsFeedbackTest.message(page.findPreference(Settings.HIDE_ADVERTISING_ID.key)));
        assertEquals(second, SettingsFeedbackTest.message(page.findPreference(other)));
    }

    /** A result that comes back while Tumblr is in the background shows under its row once settings is back. */
    @Test public void aResultWhileTumblrIsInTheBackgroundShowsWhenSettingsIsBack() {
        page.navigation.navigate("Privacy");
        ShadowLooper.idleMainLooper();
        controller.pause().stop();
        String failed = "Couldn't save that change. Try again.";
        HushTumblrPreferenceFragment.unseenResult(Settings.HIDE_ADVERTISING_ID.key, failed);
        ShadowLooper.idleMainLooper();
        Preference privacy = page.findPreference(Settings.HIDE_ADVERTISING_ID.key);
        assertEquals(failed, ShadowToast.getTextOfLatestToast());
        controller.start().resume();
        ShadowLooper.idleMainLooper();
        assertEquals(failed, SettingsFeedbackTest.message(privacy));
    }

    /** A Resume from home answers for the pause too, so a page's pause line drops what the last one said. */
    @Test public void aResumeFromHomeClearsWhatAPagesPauseLineLastSaid() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        recreate();
        page.navigation.navigate("Privacy");
        layout(dialog.getView());
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS, FailingStore.Fault.COMMIT_THROWS)) {
            pageAction().performClick();
            ShadowLooper.idleMainLooper();
        }
        Preference line = (Preference) list().getItemAtPosition(0);
        assertNotNull(SettingsFeedbackTest.message(line));
        page.navigation.navigate("");
        layout(dialog.getView());
        statusAction().performClick();
        ShadowLooper.idleMainLooper();
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertNull("the pause line still says the last Resume failed", SettingsFeedbackTest.message(line));
    }

    /** A page opened with a keyboard starts at its pause line, which no key lands on, not at the first row a key does. */
    @Test public void aPageOpenedWithoutTouchStartsAtItsPauseLine() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        recreate();
        assertFalse("the list is driven by keys here", list().isInTouchMode());
        page.navigation.navigate("Pause, backup and diagnostics");
        layout(dialog.getView());
        assertEquals(0, list().getFirstVisiblePosition());
        assertEquals(SettingsNavigation.PAGE_STATUS, ((Preference) list().getItemAtPosition(0)).getKey());
        assertTrue("a key still lands on the first setting", list().getSelectedItemPosition() > 0);
    }

    /**
     * Seen with a D-pad: a switch flipped with the center key handed the selection to the switch
     * under it while it saved, so the next press flipped that one. The keys stay on the switch.
     */
    @Test public void aSwitchFlippedByKeyKeepsTheSelection() {
        page.navigation.navigate("Feed");
        flipBannerByKey(false);
    }

    /**
     * Seen with a D-pad on search results scrolled down: the restart row came in above the rows
     * in view, the list held its first row in place, and holding it took the selection there.
     */
    @Test public void aSwitchFlippedByKeyBelowTheTopOfScrolledResultsKeepsTheSelection() {
        findSearch(dialog.getView()).setText("hide");
        ShadowLooper.idleMainLooper();
        flipBannerByKey(true);
    }

    private void flipBannerByKey(boolean belowTheTop) {
        assertFalse("the list is driven by keys here", list().isInTouchMode());
        layout(dialog.getView());
        int at = position(Settings.HIDE_AD_FREE_BANNER.key);
        assertTrue(at >= 0);
        Preference banner = (Preference) list().getItemAtPosition(at);
        assertTrue("a switch sits under it", list().getItemAtPosition(at + 1) instanceof HushTumblrPreferenceFragment.Toggle);
        boolean before = Settings.HIDE_AD_FREE_BANNER.savedValue();
        List<Runnable> writes = new ArrayList<>();
        HushTumblrPreferenceFragment.editWorkerForTests = writes::add;
        try {
            assertTrue(list().requestFocus());
            list().setSelection(at);
            layout(dialog.getView());
            // The row above it shows at the top, part-way.
            if (belowTheTop) list().scrollListBy(-40);
            layout(dialog.getView());
            assertEquals(at, list().getSelectedItemPosition());
            if (belowTheTop) assertTrue("the restart row comes in above the rows in view, and another row is at the top: first "
                    + list().getFirstVisiblePosition() + ", switch " + at,
                    list().getFirstVisiblePosition() > 0 && list().getFirstVisiblePosition() < at);
            int top = list().getSelectedView().getTop();
            assertTrue(list().dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DPAD_CENTER)));
            assertTrue(list().dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_DPAD_CENTER)));
            assertEquals("the key flipped nothing", 1, writes.size());
            layout(dialog.getView());
            assertEquals("the selection left the switch while it saved", at, list().getSelectedItemPosition());
            list().dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DPAD_CENTER));
            list().dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_DPAD_CENTER));
            ShadowLooper.idleMainLooper();
            assertEquals("a press while it saved flipped it again", 1, writes.size());
            assertEquals(before, Settings.HIDE_AD_FREE_BANNER.savedValue());
            writes.remove(0).run();
            ShadowLooper.idleMainLooper();
            layout(dialog.getView());
            assertEquals(!before, Settings.HIDE_AD_FREE_BANNER.savedValue());
            // Its restart row may come in above it once it saved, so it's found by the row.
            assertSame("the selection left the switch once it saved", banner, list().getSelectedItem());
            if (belowTheTop) assertEquals("the switch moved on screen", top, list().getSelectedView().getTop());
            assertTrue(list().hasFocus());
        } finally {
            for (Runnable write : writes) write.run();
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
            Settings.HIDE_AD_FREE_BANNER.save(before);
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.remove(
                    Settings.HIDE_AD_FREE_BANNER.key);
        }
    }

    /**
     * Without touch, home comes back with the heading or status card it was left on at the top,
     * part-way scrolled as it was, rather than the row a key lands on after it. That row stays the
     * one a key lands on.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void homeComesBackWithoutTouchOnTheHeadingItWasLeftOn() {
        touchMode(false);
        layout(dialog.getView(), 1200);
        assertFalse("the list is driven by keys here", list().isInTouchMode());
        List<Integer> unselectable = new ArrayList<>();
        StringBuilder rows = new StringBuilder();
        for (int i = 0; i < list().getChildCount(); i++) {
            rows.append(i).append(list().getAdapter().isEnabled(i) ? "+" : "-").append('@').append(list().getChildAt(i).getTop()).append(' ');
            if (i + 1 < list().getCount() && !list().getAdapter().isEnabled(i) && list().getAdapter().isEnabled(i + 1)) unselectable.add(i);
        }
        assertTrue("home shows the status card and a heading, each above a row a key lands on: " + rows,
                unselectable.contains(0) && unselectable.size() >= 2);
        for (int row : unselectable) {
            putAtTop(row);

            page.navigation.navigate("About");
            layout(dialog.getView(), 1200);
            assertTrue(page.navigation.back());
            layout(dialog.getView(), 1200);
            assertHomeAt(row, "Back");

            findSearch(dialog.getView()).setText("Hide");
            layout(dialog.getView(), 1200);
            findSearch(dialog.getView()).setText("");
            layout(dialog.getView(), 1200);
            assertHomeAt(row, "a cleared search");

            findSearch(dialog.getView()).setText("Hide");
            layout(dialog.getView(), 1200);
            assertTrue(page.navigation.back());
            layout(dialog.getView(), 1200);
            assertHomeAt(row, "Back from a search");

            page.navigation.navigate("About");
            layout(dialog.getView(), 1200);
            recreate();
            layout(dialog.getView(), 1200);
            assertFalse(list().isInTouchMode());
            assertTrue(page.navigation.back());
            layout(dialog.getView(), 1200);
            assertHomeAt(row, "Back after a recreate");
        }
    }

    /**
     * Without touch, a row that goes from above home's place while home isn't showing (here the
     * restart row, once nothing waits for a restart) can't leave a key landing past the first row
     * in view that takes one.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void homeWithoutTouchStillSelectsTheFirstKeyRowWhenARowAboveWentWhileAway() {
        app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                BaseSettings.DEBUG.key);
        recreate();
        touchMode(false);
        layout(dialog.getView(), 1200);
        assertEquals("Restart Tumblr to apply this change",
                String.valueOf(((Preference) list().getItemAtPosition(1)).getTitle()));
        int heading = -1;
        for (int i = 2; i + 1 < list().getCount() && heading < 0; i++) {
            if (!list().getAdapter().isEnabled(i) && list().getAdapter().isEnabled(i + 1)) heading = i;
        }
        assertTrue("home has a heading below the restart row", heading > 1);
        putAtTop(heading);

        page.navigation.navigate("About");
        layout(dialog.getView(), 1200);
        app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.remove(
                BaseSettings.DEBUG.key);
        assertTrue(page.navigation.back());
        layout(dialog.getView(), 1200);
        assertFalse("the restart row is gone", titles().contains("Restart Tumblr to apply this change"));
        int firstKeyRow = -1;
        for (int i = list().getFirstVisiblePosition(); i <= list().getLastVisiblePosition() && firstKeyRow < 0; i++) {
            if (list().getAdapter().isEnabled(i)) firstKeyRow = i;
        }
        assertTrue(firstKeyRow >= 0);
        assertEquals("a key lands on the first row in view that takes one", firstKeyRow, list().getSelectedItemPosition());
    }

    /** Scrolls home until [row] is the top row, 10 pixels above the top of the list. */
    private void putAtTop(int row) {
        for (int i = 0; i < 20 && (row < list().getFirstVisiblePosition() || row > list().getLastVisiblePosition()); i++) {
            list().scrollListBy(row < list().getFirstVisiblePosition() ? -200 : 200);
            layout(dialog.getView(), 1200);
        }
        list().scrollListBy(list().getChildAt(row - list().getFirstVisiblePosition()).getTop() + 10);
        layout(dialog.getView(), 1200);
        assertEquals(row, list().getFirstVisiblePosition());
        assertEquals(-10, list().getChildAt(0).getTop());
    }

    private void assertHomeAt(int row, String after) {
        assertEquals("home's top row after " + after, row, list().getFirstVisiblePosition());
        assertEquals("home's offset after " + after, -10, list().getChildAt(0).getTop());
        assertEquals("the row a key lands on after " + after, row + 1, list().getSelectedItemPosition());
    }

    /** The Pause switch answers for the pause too, so the pause line drops what a failed Resume said. */
    @Test public void thePauseSwitchClearsWhatAFailedResumeLeftOnThePauseLine() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        recreate();
        page.navigation.navigate("Pause, backup and diagnostics");
        layout(dialog.getView());
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS, FailingStore.Fault.COMMIT_THROWS)) {
            pageAction().performClick();
            ShadowLooper.idleMainLooper();
        }
        Preference line = (Preference) list().getItemAtPosition(0);
        assertEquals(SettingsNavigation.PAGE_STATUS, line.getKey());
        assertNotNull(SettingsFeedbackTest.message(line));
        // An earlier Resume from home that finished while this page showed waits for the card.
        HushTumblrPreferenceFragment.unseenResult(HushTumblrPreferenceFragment.STATUS_CARD,
                "Couldn't turn HushTumblr back on. Try again.");
        ShadowLooper.idleMainLooper();
        tap(BaseSettings.PAUSED.key);
        ShadowLooper.idleMainLooper();
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertNull("the pause line still says the last Resume failed", SettingsFeedbackTest.message(line));
        page.navigation.navigate("");
        layout(dialog.getView());
        ShadowLooper.idleMainLooper();
        Preference card = page.getPreferenceScreen().getPreference(0);
        assertEquals(HushTumblrPreferenceFragment.STATUS_CARD, card.getKey());
        assertNull("the home card still says the last Resume failed", SettingsFeedbackTest.message(card));
    }

    /** A Resume that finishes after the reader opened another page says what it left under that page's pause line. */
    @Test public void aResumeThatFinishesOnAnotherPageSaysSoUnderItsPauseLine() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView());
        List<Runnable> writes = new ArrayList<>();
        HushTumblrPreferenceFragment.editWorkerForTests = writes::add;
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS, FailingStore.Fault.COMMIT_THROWS)) {
            statusAction().performClick();
            assertEquals(1, writes.size());
            page.navigation.navigate("Privacy");
            writes.remove(0).run();
            ShadowLooper.idleMainLooper();
        } finally {
            for (Runnable write : writes) write.run();
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
        }
        assertTrue(BaseSettings.PAUSED.savedValue());
        Preference line = (Preference) list().getItemAtPosition(0);
        assertEquals(SettingsNavigation.PAGE_STATUS, line.getKey());
        assertEquals("Couldn't turn HushTumblr back on. Try again.", SettingsFeedbackTest.message(line));
        assertNull("said under the home card, which isn't in view",
                SettingsFeedbackTest.message(page.getPreferenceScreen().getPreference(0)));
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
            // The steps sit under the card, which a rebuilt screen keeps, not in its summary.
            String line = SettingsFeedbackTest.message((Preference) list().getItemAtPosition(0));
            assertTrue(line, line != null && line.contains("couldn't be removed") && line.endsWith("then tap Resume again."));
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

    /**
     * A change that waits for a restart says so under its own switch, which the reader is on, and
     * is read once from there: no announcement, which Android 16 deprecates, and no toast. A screen
     * Android rebuilds shows the note without reading it again, and the note goes with the restart
     * row once nothing waits.
     */
    @Test @Config(sdk = {26, 36})
    public void aChangeWaitingOnARestartSaysSoUnderItsSwitch() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        String saved = "Saved. Restart Tumblr to apply this change.";
        String key = Settings.FIX_PUSH_NOTIFICATIONS.key;
        try {
            page.navigation.navigate("Notifications");
            layout(dialog.getView());
            tap(key);
            layout(dialog.getView());
            ShadowLooper.idleMainLooper();
            assertTrue(contains(SettingsNavigation.RESTART));
            assertEquals(saved, SettingsFeedbackTest.message(row(key)));
            List<TextView> shown = new ArrayList<>();
            feedbackTexts(list(), shown);
            assertEquals(Arrays.asList(saved), texts(shown));
            assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, shown.get(0).getAccessibilityLiveRegion());
            assertNull("the restart note went to a toast", ShadowToast.getLatestToast());
            assertEquals(0, announcements(a11y));

            recreate();
            layout(dialog.getView());
            ShadowLooper.idleMainLooper();
            assertEquals(saved, SettingsFeedbackTest.message(row(key)));
            shown.clear();
            feedbackTexts(list(), shown);
            assertEquals(Arrays.asList(saved), texts(shown));
            assertEquals("the note was read out again", View.ACCESSIBILITY_LIVE_REGION_NONE, shown.get(0).getAccessibilityLiveRegion());

            // Put back, the switch owes nothing, and neither its note nor the restart row stays.
            tap(key);
            layout(dialog.getView());
            assertFalse(contains(SettingsNavigation.RESTART));
            assertNull(SettingsFeedbackTest.message(row(key)));

            // A note left after another route took the change back goes once nothing waits.
            tap(key);
            assertEquals(saved, SettingsFeedbackTest.message(row(key)));
            Settings.FIX_PUSH_NOTIFICATIONS.resetToDefault();
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
            page.onRestartPendingChanged();
            ShadowLooper.idleMainLooper();
            assertNull(SettingsFeedbackTest.message(row(key)));

            // Its own change taken back, the note goes though another change still waits.
            tap(key);
            assertEquals(saved, SettingsFeedbackTest.message(row(key)));
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                    TextSettings.TAB_ORDER.key);
            Settings.FIX_PUSH_NOTIFICATIONS.resetToDefault();
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.remove(key);
            page.onRestartPendingChanged();
            ShadowLooper.idleMainLooper();
            assertNull("the note outlived its change", SettingsFeedbackTest.message(row(key)));
            assertTrue("the other change no longer shows", contains(SettingsNavigation.RESTART));
            assertEquals(0, announcements(a11y));
        } finally {
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        }
    }

    /**
     * A change the next start makes anyway owes no restart. With safe mode pausing this run and the
     * next, turning Pause off changes nothing a restart would, so no note and no toast says one is
     * owed. A change that does wait still says so.
     */
    @Test public void aChangeTheNextStartMakesAnywaySaysNoRestartIsOwed() {
        String note = "Restart Tumblr to apply this change.";
        try {
            BaseSettings.SAFE_MODE.save(true);
            PauseForTests.pause(HushTumblrPause.Reason.CRASH_LOOP);
            recreate();
            layout(dialog.getView());
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                    BaseSettings.PAUSED.key);
            assertEquals(0, app.hushtumblr.extension.shared.settings.preference.ReopenSettingsAfterRestart
                    .changesWaiting(controller.get()));
            page.restartOwed(BaseSettings.PAUSED.key, note);
            ShadowLooper.idleMainLooper();
            assertNull("a restart was said to be owed in a toast", ShadowToast.getLatestToast());
            List<TextView> shown = new ArrayList<>();
            feedbackTexts(list(), shown);
            assertTrue("a restart was said to be owed: " + texts(shown), shown.isEmpty());

            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                    Settings.FIX_PUSH_NOTIFICATIONS.key);
            page.restartOwed(Settings.FIX_PUSH_NOTIFICATIONS.key, note);
            ShadowLooper.idleMainLooper();
            shown.clear();
            feedbackTexts(list(), shown);
            String toast = ShadowToast.getTextOfLatestToast();
            assertTrue("a change that waits said nothing", texts(shown).contains(note) || note.equals(toast));
        } finally {
            BaseSettings.SAFE_MODE.resetToDefault();
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        }
    }

    /**
     * A page that fits whole doesn't scroll, so a note going from a row there lets the row shrink
     * back. Held at its taller height it would only leave a gap under the switch.
     */
    @Test @Config(sdk = 33) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aRowOnAPageThatFitsShrinksBackWhenItsNoteGoes() {
        String key = Settings.FIX_PUSH_NOTIFICATIONS.key;
        try {
            page.navigation.navigate("Notifications");
            layout(dialog.getView(), 4000);
            assertEquals("the page doesn't fit whole: " + children(), list().getCount() - 1, list().getLastVisiblePosition());
            int resting = rowHeight(key);
            tap(key);
            layout(dialog.getView(), 4000);
            assertNotNull(SettingsFeedbackTest.message(row(key)));
            assertTrue("the note added no height: " + children(), rowHeight(key) > resting);
            tap(key);
            layout(dialog.getView(), 4000);
            layout(dialog.getView(), 4000);
            assertNull(SettingsFeedbackTest.message(row(key)));
            assertEquals(0, list().getFirstVisiblePosition());
            assertEquals("the row kept the note's height: " + children(), resting, rowHeight(key));
        } finally {
            Settings.FIX_PUSH_NOTIFICATIONS.resetToDefault();
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        }
    }

    /** How tall [key]'s row is in view, which fails when the row isn't on screen. */
    private int rowHeight(String key) {
        View row = list().getChildAt(position(key) - list().getFirstVisiblePosition());
        assertNotNull(key + " is off screen", row);
        return row.getHeight();
    }

    private static int announcements(android.view.accessibility.AccessibilityManager a11y) {
        int said = 0;
        for (android.view.accessibility.AccessibilityEvent event : org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents()) {
            if (event.getEventType() == android.view.accessibility.AccessibilityEvent.TYPE_ANNOUNCEMENT) said++;
        }
        return said;
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
        // Said under the link it names, where it stays after a toast would have gone.
        HushTumblrPreferenceFragment.Row tools = page.navigation.sectionLink(SettingsNavigation.TOOLS_PAGE);
        String hint = "Quick setups hidden. Bring it back from Pause, backup and diagnostics.";
        assertEquals(hint, SettingsFeedbackTest.message(tools));
        assertTrue("the hint isn't on the home page", contains(tools.getKey()));
        page.navigation.search("quick");
        page.navigation.search("");
        assertEquals("a search took the hint away", hint, SettingsFeedbackTest.message(tools));

        // Opening the page it names finishes it.
        tap(tools.getKey());
        assertNull(SettingsFeedbackTest.message(tools));
        while (page.navigation.back()) { }

        // So does bringing Quick setups back some other way, such as from a search.
        page.navigation.navigate(SettingsNavigation.TOOLS_PAGE);
        tap(SettingsNavigation.RESTORE_QUICK_SETUPS);
        while (page.navigation.back()) { }
        assertTrue(longPress(SettingsNavigation.QUICK_SETUPS));
        assertEquals(hint, SettingsFeedbackTest.message(tools));
        page.navigation.search("quick setups");
        tap(SettingsNavigation.RESTORE_QUICK_SETUPS);
        page.navigation.search("");
        assertTrue(contains(SettingsNavigation.QUICK_SETUPS));
        assertNull("the hint outlived Quick setups coming back", SettingsFeedbackTest.message(tools));
    }

    /** What a row says after an action stays through Android rebuilding the screen, and isn't read out again. */
    @Test public void resultsUnderRowsComeBackWhenTheScreenIsRebuilt() {
        org.robolectric.Shadows.shadowOf(org.robolectric.RuntimeEnvironment.getApplication()).checkActivities(true);
        tap(HushTumblrPreferenceFragment.SUPPORT);
        String support = SettingsFeedbackTest.message(row(HushTumblrPreferenceFragment.SUPPORT));
        assertNotNull("the Support row said nothing", support);
        assertTrue(longPress(SettingsNavigation.QUICK_SETUPS));
        String hint = SettingsFeedbackTest.message(page.navigation.sectionLink(SettingsNavigation.TOOLS_PAGE));
        assertNotNull(hint);
        String refused = "Settings weren't exported.";
        ((SettingsBackupPreference) page.findPreference("action_export_settings")).feedback.show(refused);
        ShadowLooper.idleMainLooper();

        recreate();
        assertEquals(support, SettingsFeedbackTest.message(row(HushTumblrPreferenceFragment.SUPPORT)));
        assertEquals(hint, SettingsFeedbackTest.message(page.navigation.sectionLink(SettingsNavigation.TOOLS_PAGE)));
        assertEquals(refused, SettingsFeedbackTest.message(page.findPreference("action_export_settings")));

        // On screen again, each is shown and none is announced a second time.
        layout(dialog.getView(), 6000);
        List<TextView> home = new ArrayList<>();
        feedbackTexts(list(), home);
        assertEquals(Arrays.asList(hint, support), texts(home));
        page.navigation.navigate(SettingsNavigation.TOOLS_PAGE);
        layout(dialog.getView(), 6000);
        List<TextView> tools = new ArrayList<>();
        feedbackTexts(list(), tools);
        assertEquals(Arrays.asList(refused), texts(tools));
        home.addAll(tools);
        for (TextView said : home) {
            assertEquals(said.getText() + " was read out again", View.ACCESSIBILITY_LIVE_REGION_NONE, said.getAccessibilityLiveRegion());
        }
    }

    /**
     * The Source row, the status card and the setup guide store no setting, and still keep what
     * they said through a rebuild.
     */
    @Test public void rowsWithNoSettingKeepTheirResultsWhenTheScreenIsRebuilt() {
        String source = "No app on this phone can open the link. The address is https://example.org/source.";
        String status = "Resume didn't take. Try again.";
        String guide = "Android's settings for this app didn't open. Open App info from Tumblr's icon, then Open by default.";
        ((HushTumblrPreferenceFragment.Row) page.findPreference(HushTumblrPreferenceFragment.SOURCE_ROW))
                .feedback.show(source, "https://example.org/source");
        ((HushTumblrPreferenceFragment.Row) page.findPreference(HushTumblrPreferenceFragment.STATUS_CARD))
                .feedback.show(status);
        ((SetupGuidancePreference) page.findPreference(SetupGuidancePreference.KEY)).feedback.show(guide);
        ShadowLooper.idleMainLooper();

        recreate();
        assertEquals(source, SettingsFeedbackTest.message(page.findPreference(HushTumblrPreferenceFragment.SOURCE_ROW)));
        assertEquals(status, SettingsFeedbackTest.message(page.findPreference(HushTumblrPreferenceFragment.STATUS_CARD)));
        assertEquals(guide, SettingsFeedbackTest.message(page.findPreference(SetupGuidancePreference.KEY)));
    }

    private Preference row(String key) {
        int at = position(key);
        assertTrue("No visible row " + key, at >= 0);
        return (Preference) list().getItemAtPosition(at);
    }

    private static void feedbackTexts(View view, List<TextView> into) {
        if (SettingsFeedback.MESSAGE_TAG.equals(view.getTag())) into.add((TextView) view);
        if (!(view instanceof android.view.ViewGroup)) return;
        android.view.ViewGroup group = (android.view.ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) feedbackTexts(group.getChildAt(i), into);
    }

    private static List<String> texts(List<TextView> views) {
        List<String> texts = new ArrayList<>();
        for (TextView view : views) texts.add(view.getText().toString());
        return texts;
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
            // Hide ads starts on, so Quiet turns on the other sixteen.
            choices.getListView().performItemClick(null, 0, 0);
            ShadowLooper.idleMainLooper();
            for (BooleanSetting setting : QuickSetupKeys.QUIET) {
                assertTrue(setting.key, setting.savedValue());
                assertTrue(setting.key + " was saved but its row still shows off",
                        ((SwitchPreference) page.findPreference(setting.key)).isChecked());
            }
            assertEquals("Changed 16 settings", ShadowToast.getTextOfLatestToast());
            // Turning off screenshot sharing waits for a restart, so the row is up under the status card.
            assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(1)).getKey());

            page.applyQuickSetup(QuickSetupKeys.quiet());
            ShadowLooper.idleMainLooper();
            assertEquals("Changed 0 settings", ShadowToast.getTextOfLatestToast());
            page.applyQuickSetup(QuickSetupKeys.defaults());
            ShadowLooper.idleMainLooper();
            assertEquals("Changed 16 settings", ShadowToast.getTextOfLatestToast());
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
            // Quick setups is offered from home, where its row and the note under it are.
            page.navigation.navigate("");
            page.applyQuickSetup(QuickSetupKeys.quiet());
            ShadowLooper.idleMainLooper();
            assertEquals(1, writes.size());
            assertEquals("Couldn't start that. Try again in a moment.",
                    SettingsFeedbackTest.message(page.navigation.ownRow(SettingsNavigation.QUICK_SETUPS)));
            assertFalse(Settings.HIDE_WATCH_IT_ROWS.savedValue());

            // Once the switch has saved, the same choice goes through, and the note under the row
            // says it waits for a restart in place of the refusal.
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
            writes.remove(0).run();
            ShadowLooper.idleMainLooper();
            page.applyQuickSetup(QuickSetupKeys.quiet());
            ShadowLooper.idleMainLooper();
            assertTrue(Settings.HIDE_WATCH_IT_ROWS.savedValue());
            assertEquals("Saved. Restart Tumblr to apply this change.",
                    SettingsFeedbackTest.message(page.navigation.ownRow(SettingsNavigation.QUICK_SETUPS)));
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

        // A missing browser leaves recovery beside the action.
        org.robolectric.Shadows.shadowOf(org.robolectric.RuntimeEnvironment.getApplication()).checkActivities(true);
        tap(SettingsNavigation.REPORT);
        assertEquals("No app on this phone can open the link. The address is "
                + L10n.isolate("github.com/SysAdminDoc/HushTumblr") + ".",
                SettingsFeedbackTest.message((Preference) list().getItemAtPosition(last - 1)));
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

    /**
     * A finger tap on a switch near the end of a page leaves the tapped row where it was, whether the
     * restart row comes, stays with a new count, or goes. On a phone the page jumped by up to two
     * rows after a tap there, so the next tap at the same spot flipped a different switch.
     */
    @Test @Config(sdk = 33) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aFingerTapNearThePageEndLeavesTheTappedRowWhereItWas() {
        touchMode(true);
        try {
            // The window's own height: an idle main looper lays the window out at that size anyway.
            page.navigation.navigate("Interface");
            layout(dialog.getView());
            for (int i = 0; i < 20 && list().getLastVisiblePosition() < list().getCount() - 1; i++) {
                list().scrollListBy(2000);
                layout(dialog.getView());
            }
            BooleanSetting dark = Settings.DARK_BACKGROUND;
            BooleanSetting wallpaper = Settings.DARK_BACKGROUND_WALLPAPER;
            assertEquals("the page doesn't end on Match my wallpaper: " + titles(),
                    list().getCount() - 1, position(wallpaper.key));
            assertEquals("the list isn't at its end", list().getCount() - 1, list().getLastVisiblePosition());
            for (BooleanSetting setting : new BooleanSetting[] {dark, wallpaper, wallpaper, wallpaper, dark, dark, wallpaper, dark}) {
                boolean was = setting.savedValue();
                int top = rowTop(setting.key);
                String before = children();
                fingerTap(setting.key);
                layout(dialog.getView());
                assertEquals(setting.key + " didn't flip", !was, setting.savedValue());
                assertEquals(setting.key + " moved after its tap\nbefore " + before + "\nafter  " + children(),
                        top, rowTop(setting.key));
            }
            assertFalse("both switches are back off, so no restart is owed", contains(SettingsNavigation.RESTART));
        } finally {
            Settings.DARK_BACKGROUND.resetToDefault();
            Settings.DARK_BACKGROUND_WALLPAPER.resetToDefault();
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        }
    }

    /**
     * The same taps with each save finishing on the worker after the tap's first layout, as on a
     * phone, and each tap made with the page at its end. The restart row and the switch refresh come
     * a frame after the tap there, and the page slid down a row and a half on the S22.
     */
    @Test @Config(sdk = 33) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aTapWhoseSaveFinishesAfterLayoutLeavesTheTappedRowWhereItWas() {
        List<Runnable> writes = new ArrayList<>();
        touchMode(true);
        HushTumblrPreferenceFragment.editWorkerForTests = writes::add;
        try {
            page.navigation.navigate("Interface");
            layout(dialog.getView());
            BooleanSetting dark = Settings.DARK_BACKGROUND;
            BooleanSetting wallpaper = Settings.DARK_BACKGROUND_WALLPAPER;
            for (BooleanSetting setting : new BooleanSetting[] {dark, wallpaper, wallpaper, wallpaper, dark, dark, wallpaper, dark}) {
                toEnd();
                boolean was = setting.savedValue();
                int top = rowTop(setting.key);
                String before = children();
                fingerTap(setting.key);
                layout(dialog.getView());
                for (int i = 0; i < 10 && !writes.isEmpty(); i++) {
                    writes.remove(0).run();
                    ShadowLooper.idleMainLooper(100, java.util.concurrent.TimeUnit.MILLISECONDS);
                    layout(dialog.getView());
                }
                assertTrue("a save never finished", writes.isEmpty());
                assertEquals(setting.key + " didn't flip", !was, setting.savedValue());
                assertEquals(setting.key + " moved after its tap\nbefore " + before + "\nafter  " + children(),
                        top, rowTop(setting.key));
            }
            assertFalse("both switches are back off, so no restart is owed", contains(SettingsNavigation.RESTART));
        } finally {
            for (Runnable write : writes) write.run();
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
            Settings.DARK_BACKGROUND.resetToDefault();
            Settings.DARK_BACKGROUND_WALLPAPER.resetToDefault();
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        }
    }

    /**
     * On every page, scrolled to its end, the lowest switch in view is flipped and flipped back with
     * its save finishing after layout. No row in view moves, the backup rows that say "Saving
     * changes" meanwhile included.
     */
    @Test @Config(sdk = 33) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void noRowMovesWhileTheLowestSwitchOnAPageSaves() {
        List<Runnable> writes = new ArrayList<>();
        List<Setting<?>> flipped = new ArrayList<>();
        touchMode(true);
        HushTumblrPreferenceFragment.editWorkerForTests = writes::add;
        int checked = 0;
        try {
            for (String name : new String[] {"Feed", "Posts", "Interface", "Privacy", "Notifications", "Links",
                    "Pause, backup and diagnostics", "About"}) {
                while (page.navigation.back()) { }
                page.navigation.navigate(name);
                layout(dialog.getView());
                toEnd();
                String key = null;
                for (int i = 0; i < list().getChildCount(); i++) {
                    Object item = list().getItemAtPosition(list().getFirstVisiblePosition() + i);
                    if (item instanceof HushTumblrPreferenceFragment.Toggle
                            && !BaseSettings.PAUSED.key.equals(((Preference) item).getKey())) key = ((Preference) item).getKey();
                }
                if (key == null) continue;
                checked++;
                flipped.add(Setting.getSettingFromPath(key));
                for (int tap = 0; tap < 2; tap++) {
                    Map<String, Integer> before = tops();
                    String shown = children();
                    fingerTap(key);
                    layout(dialog.getView());
                    for (int i = 0; i < 10 && !writes.isEmpty(); i++) {
                        writes.remove(0).run();
                        ShadowLooper.idleMainLooper(100, java.util.concurrent.TimeUnit.MILLISECONDS);
                        layout(dialog.getView());
                    }
                    Map<String, Integer> after = tops();
                    after.keySet().retainAll(before.keySet());
                    before.keySet().retainAll(after.keySet());
                    assertEquals(name + ": rows moved while " + key + " saved\nbefore " + shown + "\nafter  " + children(),
                            before, after);
                }
            }
            assertTrue("too few pages had a switch at their end: " + checked, checked >= 4);
        } finally {
            for (Runnable write : writes) write.run();
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
            for (Setting<?> setting : flipped) setting.resetToDefault();
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        }
    }

    /** Each row in view with a key, and its top. */
    private Map<String, Integer> tops() {
        Map<String, Integer> out = new java.util.LinkedHashMap<>();
        for (int i = 0; i < list().getChildCount(); i++) {
            Object item = list().getItemAtPosition(list().getFirstVisiblePosition() + i);
            if (item instanceof Preference && ((Preference) item).hasKey()) out.put(((Preference) item).getKey(), list().getChildAt(i).getTop());
        }
        return out;
    }

    /** Scrolls the page to its end. */
    private void toEnd() {
        for (int i = 0; i < 20 && (list().getLastVisiblePosition() < list().getCount() - 1
                || list().getChildAt(list().getChildCount() - 1).getBottom() > list().getHeight() - list().getPaddingBottom()); i++) {
            list().scrollListBy(2000);
            layout(dialog.getView());
        }
        assertEquals("the list isn't at its end", list().getCount() - 1, list().getLastVisiblePosition());
    }

    /** The first position in view, then each row's key and top, for a failure message. */
    private String children() {
        StringBuilder out = new StringBuilder("first=" + list().getFirstVisiblePosition());
        for (int i = 0; i < list().getChildCount(); i++) {
            Object item = list().getAdapter().getItem(list().getFirstVisiblePosition() + i);
            String key = item instanceof android.preference.Preference ? ((android.preference.Preference) item).getKey() : String.valueOf(item);
            out.append(" [").append(key).append('@').append(list().getChildAt(i).getTop())
                    .append('+').append(list().getChildAt(i).getHeight()).append(']');
        }
        return out.toString();
    }

    /** Where [key]'s row starts in the list, which fails when the row isn't on screen. */
    private int rowTop(String key) {
        int position = position(key);
        View row = list().getChildAt(position - list().getFirstVisiblePosition());
        assertNotNull(key + " is off screen", row);
        return row.getTop();
    }

    /** A finger's down and up over the part of [key]'s row that shows, left of its switch, as on a phone. */
    private void fingerTap(String key) {
        int position = position(key);
        View row = list().getChildAt(position - list().getFirstVisiblePosition());
        assertNotNull(key + " is off screen", row);
        float x = row.getWidth() / 3f;
        float y = (Math.max(row.getTop(), 0) + Math.min(row.getBottom(), list().getHeight())) / 2f;
        long now = android.os.SystemClock.uptimeMillis();
        android.view.MotionEvent down = android.view.MotionEvent.obtain(now, now, android.view.MotionEvent.ACTION_DOWN, x, y, 0);
        android.view.MotionEvent up = android.view.MotionEvent.obtain(now, now + 40, android.view.MotionEvent.ACTION_UP, x, y, 0);
        assertTrue(list().dispatchTouchEvent(down));
        assertTrue(list().dispatchTouchEvent(up));
        down.recycle();
        up.recycle();
        ShadowLooper.idleMainLooper(500, java.util.concurrent.TimeUnit.MILLISECONDS);
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
        summaryContains(Settings.DARK_BACKGROUND_WALLPAPER.key, "wallpaper's colors",
                "A new wallpaper shows after Tumblr restarts.");
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
     * Seen with TalkBack: back from the file picker that Choose a font file opened, focus started
     * at the page's header, as the picker took the reader's focus with it and the rows were rebuilt
     * while it was up. The row that opened the picker gets it back, picked or not, and the backup
     * rows' pickers do the same.
     */
    @Test public void backFromAFilePickerPutsScreenReaderFocusOnTheRowThatOpenedIt() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        touchMode(true);
        layout(dialog.getView());
        page.navigation.navigate("Interface");
        layout(dialog.getView());
        page.onActivityResult(HushTumblrPreferenceFragment.FONT_FILE, android.app.Activity.RESULT_CANCELED, null);
        // One pass may scroll the row into view, the next draws it and focuses it.
        layout(dialog.getView());
        layout(dialog.getView());
        assertEquals("Choose a font file", focusedTitle(a11y));

        page.navigation.navigate("");
        layout(dialog.getView());
        page.navigation.navigate("Pause, backup and diagnostics");
        layout(dialog.getView());
        String importTitle = String.valueOf(page.findPreference("action_import_settings").getTitle());
        page.onActivityResult(SettingsBackupPreference.IMPORT, android.app.Activity.RESULT_CANCELED, null);
        layout(dialog.getView());
        layout(dialog.getView());
        assertEquals(importTitle, focusedTitle(a11y));
    }

    /**
     * A small settings file can be read before the list lays out again back from the picker. Its
     * preview then opens first, and the focus meant for the Import row went to it behind the dialog.
     */
    @Test public void aPreviewOpenedBeforeTheListLaysOutKeepsFocusOffTheRowsBehindIt() throws Exception {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        touchMode(true);
        layout(dialog.getView());
        page.navigation.navigate("Pause, backup and diagnostics");
        layout(dialog.getView());
        int before = focusedTitles(a11y).size();
        page.onActivityResult(SettingsBackupPreference.IMPORT, android.app.Activity.RESULT_CANCELED, null);
        page.pendingImport = SettingsBackup.parse(SettingsBackup.create()).toBundle();
        SettingsBackupPreference.showPreview(page);
        assertNotNull(page.importPreview);
        layout(dialog.getView());
        layout(dialog.getView());
        assertEquals("a row behind the preview took focus", before, focusedTitles(a11y).size());
        SettingsBackupPreference.closePreview(page);
    }

    /** Without a screen reader nothing moves back from a picker: the list stays where it was left. */
    @Test public void withoutAScreenReaderBackFromAFilePickerLeavesTheListWhereItWas() {
        layout(dialog.getView());
        page.navigation.navigate("Interface");
        layout(dialog.getView());
        int left = list().getFirstVisiblePosition();
        assertTrue("the font row starts off screen", position(HushTumblrPreferenceFragment.FONT_FILE_ROW) > list().getLastVisiblePosition());
        page.onActivityResult(HushTumblrPreferenceFragment.FONT_FILE, android.app.Activity.RESULT_CANCELED, null);
        layout(dialog.getView());
        layout(dialog.getView());
        assertEquals(left, list().getFirstVisiblePosition());
    }

    /**
     * Seen on the lab emulator: arrow keys did nothing on the settings page. Its root holds focus
     * so a new screen doesn't give it to the search box and raise the keyboard, and it kept it when
     * touch ended, where no arrow key moves from a view that covers every row.
     */
    @Test public void arrowKeysReachTheRowsOnceTouchEnds() {
        View decor = dialog.getDialog().getWindow().getDecorView();
        touchMode(true);
        layout(dialog.getView());
        assertFalse("the search box took focus", decor.findFocus() instanceof EditText);
        touchMode(false);
        layout(dialog.getView());
        View focused = decor.findFocus();
        assertNotNull(focused);
        assertNotEquals("the page's root kept focus", dialog.getView(), focused);
        assertNotNull("no arrow key moves from " + focused, focused.focusSearch(View.FOCUS_DOWN));
        touchMode(true);
        layout(dialog.getView());
        assertEquals("the root holds focus again under touch", dialog.getView(), decor.findFocus());
    }

    /**
     * With TalkBack and a keyboard, Back scrolled the row above into view by selecting it, so the
     * next key press started on that row while TalkBack read the one below. The keys stay on the row.
     */
    @Test public void withoutTouchBackLeavesTheKeysOnTheRowTheReaderIsOn() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        touchMode(false);
        layout(dialog.getView());
        int about = position("section_About");
        assertTrue("About starts off screen", about > list().getLastVisiblePosition());
        assertTrue("the row above About takes keys", list().getAdapter().isEnabled(about - 1));
        page.navigation.navigate("About");
        layout(dialog.getView());
        page.navigation.back();
        // One pass scrolls, the next draws and focuses the row, the last moves the keys onto it.
        layout(dialog.getView());
        layout(dialog.getView());
        layout(dialog.getView());
        assertEquals("About", focusedTitle(a11y));
        assertTrue("About is on screen", about >= list().getFirstVisiblePosition() && about <= list().getLastVisiblePosition());
        assertTrue("the row above shows too", about - 1 >= list().getFirstVisiblePosition());
        assertEquals(about, list().getSelectedItemPosition());
    }

    /**
     * Seen on the lab emulator with TalkBack and a keyboard: Back put home where it was left, with
     * the keys on the first row in view, while TalkBack read the row that opened the page. The next
     * Down went to a row far above it. The keys go back to that row, as TalkBack does.
     */
    @Test public void withoutTouchBackGivesTheKeysToTheRowThatOpenedThePage() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        touchMode(false);
        layout(dialog.getView());
        int about = keysTwoRowsAboveAbout();
        page.navigation.navigate("About");
        layout(dialog.getView());
        page.navigation.back();
        layout(dialog.getView());
        layout(dialog.getView());
        layout(dialog.getView());
        assertEquals("About", focusedTitle(a11y));
        assertEquals(about, list().getSelectedItemPosition());
    }

    /** Without a screen reader too: Enter on a row and then Back leave the keys on that row, and the list where it was. */
    @Test public void withoutAScreenReaderBackGivesTheKeysToTheRowThatOpenedThePage() {
        touchMode(false);
        layout(dialog.getView());
        int about = keysTwoRowsAboveAbout();
        int left = list().getFirstVisiblePosition();
        page.navigation.navigate("About");
        layout(dialog.getView());
        page.navigation.back();
        layout(dialog.getView());
        layout(dialog.getView());
        assertEquals(about, list().getSelectedItemPosition());
        assertEquals(left, list().getFirstVisiblePosition());
    }

    /**
     * Seen on the lab emulator: a larger font remade the screen on a page with the keys on the
     * header's Back button. Back read the page's row on home, and Down went from the header. Moved
     * into the list later, the keys made TalkBack read the row they were about to leave.
     */
    @Test public void backFromTheHeaderGivesTheKeysToTheRowThatOpenedThePage() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        touchMode(false);
        layout(dialog.getView());
        int about = keysTwoRowsAboveAbout();
        page.navigation.navigate("About");
        layout(dialog.getView());
        View back = findBack(dialog.getView());
        assertNotNull(back);
        assertTrue(back.requestFocus());
        int sent = org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents().size();
        page.navigation.back();
        layout(dialog.getView());
        layout(dialog.getView());
        layout(dialog.getView());
        assertTrue("the keys stayed in the header", list().hasFocus());
        assertEquals(about, list().getSelectedItemPosition());
        assertEquals("About", focusedTitle(a11y));
        List<android.view.accessibility.AccessibilityEvent> events = org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents();
        for (android.view.accessibility.AccessibilityEvent event : events.subList(sent, events.size())) {
            if (event.getEventType() != android.view.accessibility.AccessibilityEvent.TYPE_VIEW_FOCUSED) continue;
            String said = event.getText().isEmpty() ? "" : String.valueOf(event.getText().get(0));
            assertTrue("the list's focus read " + said, said.isEmpty() || said.startsWith("About"));
        }
    }

    /**
     * Seen on the lab emulator with TalkBack and a keyboard: after a touch, Down from the search
     * box put the first row a key lands on where the status card was, so the card went off
     * screen, and TalkBack read nothing as the keys came into the list.
     */
    @Test public void theFirstKeyIntoTheRowsAfterATouchKeepsTheStatusCardAndReadsTheRow() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        touchMode(true);
        layout(dialog.getView());
        // Home drawn again by touch, as on a phone: into a page whose row shows at the top, and back.
        page.navigation.navigate("Feed");
        layout(dialog.getView());
        page.navigation.back();
        layout(dialog.getView());
        assertEquals(0, list().getFirstVisiblePosition());
        assertFalse("the status card takes no keys", list().getAdapter().isEnabled(0));
        int cardTop = list().getChildAt(0).getTop();
        int firstKey = 1;
        while (!list().getAdapter().isEnabled(firstKey)) firstKey++;
        String title = String.valueOf(((Preference) list().getAdapter().getItem(firstKey)).getTitle());
        touchMode(false);
        assertFalse(list().hasFocus());
        int sent = org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents().size();
        // Focus coming down from the search box above the list.
        assertTrue(list().requestFocus(View.FOCUS_DOWN, new android.graphics.Rect(0, -60, list().getWidth(), -10)));
        layout(dialog.getView());
        assertEquals("the status card went off screen", 0, list().getFirstVisiblePosition());
        assertEquals(cardTop, list().getChildAt(0).getTop());
        assertEquals(firstKey, list().getSelectedItemPosition());
        String said = null;
        List<android.view.accessibility.AccessibilityEvent> events = org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents();
        for (android.view.accessibility.AccessibilityEvent event : events.subList(sent, events.size())) {
            if (event.getEventType() != android.view.accessibility.AccessibilityEvent.TYPE_VIEW_FOCUSED
                    || !android.widget.ListView.class.getName().equals(String.valueOf(event.getClassName()))) continue;
            said = String.valueOf(event.getText());
        }
        assertNotNull("the list sent no focus event", said);
        assertTrue("the list's focus read " + said, said.contains(title));
    }

    /**
     * Seen on the lab emulator with TalkBack and a keyboard: Up from the first row put the keys on
     * the status card's Pause, and TalkBack said "Pause. Button", but the list's next layout took
     * the keys back to the row, so Enter opened Quick setups.
     */
    @Test public void upFromTheFirstRowLeavesTheListRatherThanStoppingOnTheCardsPause() {
        touchMode(false);
        layout(dialog.getView());
        assertTrue(list().requestFocus());
        layout(dialog.getView());
        int firstKey = 1;
        while (!list().getAdapter().isEnabled(firstKey)) firstKey++;
        assertEquals(firstKey, list().getSelectedItemPosition());
        assertFalse("the list moved up from its first key row",
                list().dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DPAD_UP)));
        // What the window does with an arrow key nothing used: the next view that way takes focus.
        ViewGroup root = (ViewGroup) dialog.getDialog().getWindow().getDecorView();
        View next = list().focusSearch(View.FOCUS_UP);
        assertNotNull(next);
        android.graphics.Rect from = new android.graphics.Rect();
        list().getFocusedRect(from);
        root.offsetDescendantRectToMyCoords(list(), from);
        root.offsetRectIntoDescendantCoords(next, from);
        assertTrue(next.requestFocus(View.FOCUS_UP, from));
        layout(dialog.getView());
        layout(dialog.getView());
        assertFalse("the list took the keys back from " + next, list().hasFocus());
        // A screen reader still reaches and presses it.
        android.widget.Button pause = statusAction();
        assertTrue(pause.isClickable());
        assertTrue(pause.createAccessibilityNodeInfo().getActionList()
                .contains(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK));
    }

    /**
     * Seen on the lab emulator with TalkBack and a keyboard: with the keys on Quick setups, pressing
     * the card's Pause put the restart row in above that row, and the list kept the keys' row where
     * it was, so the card went up off screen.
     */
    @Test public void pausingFromTheCardWithTheKeysOnARowKeepsTheCardInView() {
        pauseFromTheCardWithTheKeysOnARow(false, false);
    }

    /** The same press made by a screen reader, which then stays on the card rather than the restart row. */
    @Test public void pausingFromTheCardWithAScreenReaderAndTheKeysOnARowKeepsTheCardInView() {
        pauseFromTheCardWithTheKeysOnARow(true, false);
    }

    /**
     * Seen on the lab emulator after the fix above: the save finished on its worker after the list
     * had laid out the press, so the restart row came in a layout later and still sent the card off.
     */
    @Test public void pausingFromTheCardWithTheKeysOnARowKeepsTheCardInViewWhenTheSaveLandsLater() {
        pauseFromTheCardWithTheKeysOnARow(false, true);
    }

    @Test public void pausingFromTheCardWithAScreenReaderAndTheKeysOnARowKeepsTheCardInViewWhenTheSaveLandsLater() {
        pauseFromTheCardWithTheKeysOnARow(true, true);
    }

    /**
     * Seen on the lab emulator after both fixes above: a pause rebuilds the page many times, and
     * one that came between a layout and the move it asked for measured the rows already pushed,
     * so the next layout sent the card back off.
     */
    @Test public void pausingFromTheCardWithTheKeysOnARowKeepsTheCardInViewThroughARebuildBeforeTheMove() {
        pauseFromTheCardWithTheKeysOnARow(false, false, true);
    }

    /**
     * The same, with TalkBack, which also left the card's button for Quick setups: the list said
     * that row was selected again at its new place, though the keys never left it.
     */
    @Test public void pausingFromTheCardWithAScreenReaderAndTheKeysOnARowKeepsTheCardInViewThroughARebuildBeforeTheMove() {
        pauseFromTheCardWithTheKeysOnARow(true, false, true);
    }

    /**
     * Seen on the lab emulator: Undo after that pause took the restart row away above the keys'
     * row, the list said that row was selected again at its new place, and TalkBack left Pause for
     * Quick setups.
     */
    @Test public void undoingAPauseFromTheCardWithAScreenReaderAndTheKeysOnARowKeepsTheReaderOnTheCard() {
        pauseFromTheCardWithTheKeysOnARow(true, false, false, true);
    }

    @Test public void undoingAPauseFromTheCardWithAScreenReaderAndTheKeysOnARowKeepsTheReaderOnTheCardWhenTheSaveLandsLater() {
        pauseFromTheCardWithTheKeysOnARow(true, true, false, true);
    }

    @Test public void undoingAPauseFromTheCardWithTheKeysOnARowKeepsTheCardInView() {
        pauseFromTheCardWithTheKeysOnARow(false, true, false, true);
    }

    /**
     * On a phone the list's word that its keys' row is selected at its new place is posted, and the
     * save landing rebuilt the page before it ran. The list then held that word for its next layout,
     * and by then the row's new place was taken for the place the keys stayed at, so it was said.
     */
    @Test public void undoingAPauseFromTheCardWithAScreenReaderAndTheKeysOnARowKeepsTheReaderOnTheCardThroughARebuildBeforeTheListSaysSo() {
        pauseFromTheCardWithTheKeysOnARow(true, false, false, true, true);
    }

    private void pauseFromTheCardWithTheKeysOnARow(boolean reader, boolean saveLater) {
        pauseFromTheCardWithTheKeysOnARow(reader, saveLater, false, false);
    }

    private void pauseFromTheCardWithTheKeysOnARow(boolean reader, boolean saveLater, boolean rebuildBeforeTheMove) {
        pauseFromTheCardWithTheKeysOnARow(reader, saveLater, rebuildBeforeTheMove, false);
    }

    private void pauseFromTheCardWithTheKeysOnARow(boolean reader, boolean saveLater, boolean rebuildBeforeTheMove, boolean undo) {
        pauseFromTheCardWithTheKeysOnARow(reader, saveLater, rebuildBeforeTheMove, undo, false);
    }

    private void pauseFromTheCardWithTheKeysOnARow(boolean reader, boolean saveLater, boolean rebuildBeforeTheMove, boolean undo,
            boolean rebuildBeforeTheUndoIsSaid) {
        List<Runnable> writes = new ArrayList<>();
        if (saveLater) HushTumblrPreferenceFragment.editWorkerForTests = writes::add;
        try {
            pauseFromTheCardWithTheKeysOnARow(reader, writes, rebuildBeforeTheMove, undo, rebuildBeforeTheUndoIsSaid);
        } finally {
            for (Runnable write : writes) write.run();
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
        }
    }

    private void pauseFromTheCardWithTheKeysOnARow(boolean reader, List<Runnable> writes, boolean rebuildBeforeTheMove, boolean undo,
            boolean rebuildBeforeTheUndoIsSaid) {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        if (reader) {
            org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
            org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
            showWindow();
        }
        touchMode(false);
        layout(dialog.getView());
        assertTrue(list().requestFocus());
        layout(dialog.getView());
        int firstKey = 1;
        while (!list().getAdapter().isEnabled(firstKey)) firstKey++;
        assertEquals(firstKey, list().getSelectedItemPosition());
        Object keyed = list().getAdapter().getItem(firstKey);
        assertEquals(0, list().getFirstVisiblePosition());
        int cardTop = list().getChildAt(0).getTop();
        assertFalse(contains(SettingsNavigation.RESTART));
        android.widget.Button pause = statusAction();
        assertEquals("Pause", pause.getText().toString());
        ShadowLooper.idleMainLooper();
        int sent = org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents().size();
        boolean[] rebuilt = {false};
        if (rebuildBeforeTheMove) {
            // A phone's frame waits for the display, so what's already posted runs first. Here a
            // frame comes the moment a layout is asked for, unless frames are paused.
            org.robolectric.shadows.ShadowChoreographer.setPaused(true);
            // The list lays out the press with the card pushed up and asks for the move, and the
            // page rebuilds again before that runs.
            list().addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
                @Override public void onLayoutChange(View view, int left, int top, int right, int bottom,
                        int oldLeft, int oldTop, int oldRight, int oldBottom) {
                    if (list().getChildAt(0).getTop() == cardTop) return;
                    list().removeOnLayoutChangeListener(this);
                    new android.os.Handler(android.os.Looper.getMainLooper()).postAtFrontOfQueue(() -> {
                        rebuilt[0] = true;
                        page.navigation.restartChanged();
                    });
                }
            });
        }
        try {
            if (reader) {
                assertTrue(pause.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
                assertTrue(pause.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
            } else {
                assertTrue(pause.performClick());
            }
            ShadowLooper.idleMainLooper();
            for (int frame = 0; rebuildBeforeTheMove && frame < 6; frame++) {
                org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(16));
            }
        } finally {
            org.robolectric.shadows.ShadowChoreographer.setPaused(false);
        }
        assertEquals("the page rebuilt between the layout and the move", rebuildBeforeTheMove, rebuilt[0]);
        if (rebuildBeforeTheMove) {
            assertEquals("the status card went off screen", 0, list().getFirstVisiblePosition());
            assertEquals(cardTop, list().getChildAt(0).getTop());
        }
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        // A save on its worker finishes after the press is laid out.
        while (!writes.isEmpty()) {
            writes.remove(0).run();
            ShadowLooper.idleMainLooper();
            layout(dialog.getView());
        }
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertTrue(contains(SettingsNavigation.RESTART));
        assertEquals("the status card went off screen", 0, list().getFirstVisiblePosition());
        assertEquals(cardTop, list().getChildAt(0).getTop());
        assertEquals("Undo", statusAction().getText().toString());
        assertSame("the keys left " + keyed, keyed, list().getSelectedItem());
        if (reader) assertReaderStayedOnTheCard(a11y, sent, keyed);
        if (!undo) return;
        android.widget.Button undoButton = statusAction();
        ShadowLooper.idleMainLooper();
        sent = org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents().size();
        int keysAt = list().getSelectedItemPosition();
        boolean[] rebuiltBeforeSaid = {false};
        if (rebuildBeforeTheUndoIsSaid) {
            org.robolectric.shadows.ShadowChoreographer.setPaused(true);
            // The layout that gives the keys' row its new place posts the list's word on it, and
            // the page rebuilds before that runs.
            list().addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
                @Override public void onLayoutChange(View view, int left, int top, int right, int bottom,
                        int oldLeft, int oldTop, int oldRight, int oldBottom) {
                    if (list().getSelectedItemPosition() == keysAt) return;
                    list().removeOnLayoutChangeListener(this);
                    new android.os.Handler(android.os.Looper.getMainLooper()).postAtFrontOfQueue(() -> {
                        rebuiltBeforeSaid[0] = true;
                        page.navigation.restartChanged();
                    });
                }
            });
        }
        try {
            if (reader) {
                // Still on it from the pause.
                assertSame(undoButton, readerFocus(list()));
                assertTrue(undoButton.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
            } else {
                assertTrue(undoButton.performClick());
            }
            ShadowLooper.idleMainLooper();
            layout(dialog.getView());
            for (int frame = 0; rebuildBeforeTheUndoIsSaid && frame < 6; frame++) {
                org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(16));
                layout(dialog.getView());
            }
        } finally {
            org.robolectric.shadows.ShadowChoreographer.setPaused(false);
        }
        assertEquals("the page rebuilt before the list said its keys' row moved", rebuildBeforeTheUndoIsSaid, rebuiltBeforeSaid[0]);
        while (!writes.isEmpty()) {
            writes.remove(0).run();
            ShadowLooper.idleMainLooper();
            layout(dialog.getView());
        }
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertFalse(contains(SettingsNavigation.RESTART));
        assertEquals("the status card went off screen", 0, list().getFirstVisiblePosition());
        assertEquals(cardTop, list().getChildAt(0).getTop());
        assertEquals("Pause", statusAction().getText().toString());
        assertSame("the keys left " + keyed, keyed, list().getSelectedItem());
        if (reader) assertReaderStayedOnTheCard(a11y, sent, keyed);
    }

    /** The reader is on the card's button it pressed, and the list never said its keys' row was selected again. */
    private void assertReaderStayedOnTheCard(android.view.accessibility.AccessibilityManager a11y, int sent, Object keyed) {
        View on = readerFocus(list());
        assertNotNull("the screen reader lost its place", on);
        assertSame("the screen reader went to " + on, statusAction(), on);
        List<android.view.accessibility.AccessibilityEvent> events = org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents();
        for (android.view.accessibility.AccessibilityEvent event : events.subList(sent, events.size())) {
            assertFalse("the list said " + keyed + " was selected again, which takes TalkBack to it ("
                            + event.getClassName() + ": " + event.getText() + ")",
                    event.getEventType() == android.view.accessibility.AccessibilityEvent.TYPE_VIEW_SELECTED);
        }
    }

    /**
     * Without touch the restart row came in above the first row, the switch flipped by key, and
     * the list kept that switch at the top, so the row asking for a restart was never seen. As
     * with touch, a row added at the top of what's in view pushes the rows down.
     */
    @Test public void theRestartRowAboveASwitchFlippedByKeyAtTheTopIsSeen() {
        page.navigation.navigate("Feed");
        touchMode(false);
        layout(dialog.getView());
        int at = position(Settings.HIDE_ADS.key);
        assertEquals("Hide ads is the page's first row", 0, at);
        Preference hideAds = (Preference) list().getItemAtPosition(at);
        boolean before = Settings.HIDE_ADS.savedValue();
        List<Runnable> writes = new ArrayList<>();
        HushTumblrPreferenceFragment.editWorkerForTests = writes::add;
        try {
            assertTrue(list().requestFocus());
            list().setSelectionFromTop(at, 0);
            layout(dialog.getView());
            assertEquals(at, list().getSelectedItemPosition());
            int top = list().getSelectedView().getTop();
            assertFalse(contains(SettingsNavigation.RESTART));
            assertTrue(list().dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DPAD_CENTER)));
            assertTrue(list().dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_DPAD_CENTER)));
            assertEquals(1, writes.size());
            writes.remove(0).run();
            for (int i = 0; i < 4; i++) {
                ShadowLooper.idleMainLooper();
                layout(dialog.getView());
            }
            assertEquals(!before, Settings.HIDE_ADS.savedValue());
            assertEquals("the restart row is first", SettingsNavigation.RESTART,
                    ((Preference) list().getItemAtPosition(0)).getKey());
            assertEquals("the restart row is above the rows in view", 0, list().getFirstVisiblePosition());
            assertEquals(top, list().getChildAt(0).getTop());
            assertSame("the keys left Hide ads", hideAds, list().getSelectedItem());
            assertEquals("Hide ads sits under the restart row", list().getChildAt(0).getBottom() + list().getDividerHeight(),
                    list().getSelectedView().getTop());
        } finally {
            for (Runnable write : writes) write.run();
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
            Settings.HIDE_ADS.save(before);
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.remove(
                    Settings.HIDE_ADS.key);
        }
    }

    /** With touch, a screen reader that pressed the card's Pause is back on that button, now Undo. */
    @Test public void aScreenReaderThatPressedTheCardsPauseStaysOnItsButton() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        touchMode(true);
        layout(dialog.getView());
        int cardTop = list().getChildAt(0).getTop();
        android.widget.Button pause = statusAction();
        assertEquals("Pause", pause.getText().toString());
        assertTrue(pause.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
        assertTrue(pause.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertTrue(contains(SettingsNavigation.RESTART));
        assertEquals(0, list().getFirstVisiblePosition());
        assertEquals(cardTop, list().getChildAt(0).getTop());
        assertEquals("Undo", statusAction().getText().toString());
        assertSame("the screen reader went to " + readerFocus(list()), statusAction(), readerFocus(list()));
    }

    /**
     * Robolectric never tells the dialog's window that the app is visible, and a hidden window
     * drops a screen reader's focus on every traversal. On a phone the dialog is shown, and a
     * layout that moves the rows leaves the reader where it was.
     */
    private void showWindow() {
        Object root = org.robolectric.util.ReflectionHelpers.callInstanceMethod(list(), "getViewRootImpl");
        org.robolectric.util.ReflectionHelpers.setField(root, "mAppVisible", true);
        list().getRootView().requestLayout();
        ShadowLooper.idleMainLooper();
        assertEquals(View.VISIBLE, list().getWindowVisibility());
    }

    private static View readerFocus(View view) {
        if (view.isAccessibilityFocused()) return view;
        if (!(view instanceof ViewGroup)) return null;
        for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            View found = readerFocus(((ViewGroup) view).getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    /**
     * Seen on the lab emulator at a larger font: the row Back went to was cut off at the list's
     * bottom edge, so the first Down only scrolled the rest of it in and read nothing.
     */
    @Test public void backGivesTheKeysToARowCutOffAtTheEdgeWithAllOfItInView() {
        touchMode(false);
        layout(dialog.getView());
        int about = position("section_About");
        list().setSelectionFromTop(about, 0);
        layout(dialog.getView());
        int height = list().getChildAt(about - list().getFirstVisiblePosition()).getHeight();
        int area = list().getHeight() - list().getListPaddingTop() - list().getListPaddingBottom();
        list().setSelectionFromTop(about - 2, area - 2 * height - height / 2);
        layout(dialog.getView());
        int bottom = list().getHeight() - list().getListPaddingBottom();
        View cut = list().getChildAt(about - list().getFirstVisiblePosition());
        assertTrue("About is cut off at the bottom", cut != null && cut.getTop() < bottom && cut.getBottom() > bottom);
        page.navigation.navigate("About");
        layout(dialog.getView());
        page.navigation.back();
        layout(dialog.getView());
        layout(dialog.getView());
        assertEquals(about, list().getSelectedItemPosition());
        View shown = list().getChildAt(about - list().getFirstVisiblePosition());
        assertTrue("About is still cut off", shown.getTop() >= list().getListPaddingTop() && shown.getBottom() <= bottom);
    }

    private static android.widget.ImageButton findBack(View view) {
        if (view instanceof android.widget.ImageButton) return (android.widget.ImageButton) view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                android.widget.ImageButton found = findBack(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    /** Puts home's keys two rows above About with About in view, and answers About's position. */
    private int keysTwoRowsAboveAbout() {
        int about = position("section_About");
        list().setSelectionFromTop(about - 2, 0);
        layout(dialog.getView());
        assertEquals("the keys are two rows above About", about - 2, list().getSelectedItemPosition());
        assertTrue("About shows", about <= list().getLastVisiblePosition());
        return about;
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

    /**
     * With TalkBack on the lab emulator, flipping Hide ads brought the restart row in above it and
     * the list gave focus back by position: TalkBack read the restart row, then the switch's saved
     * note, so the restart was said twice and the switch's new state never. Focus stays on the
     * switch, whose read carries the note, and the note isn't read again on its own.
     */
    @Test public void aFlippedSwitchKeepsScreenReaderFocusWhenTheRestartRowComesAboveIt() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        touchMode(true);
        layout(dialog.getView());
        page.navigation.navigate("Feed");
        layout(dialog.getView());
        int at = position(Settings.HIDE_ADS.key);
        assertTrue("Hide ads is in view", at >= list().getFirstVisiblePosition() && at <= list().getLastVisiblePosition());
        View row = list().getChildAt(at - list().getFirstVisiblePosition());
        assertEquals("the row says it's a switch and its state, so the drawn switch stays quiet",
                View.IMPORTANT_FOR_ACCESSIBILITY_NO, row.findViewById(android.R.id.switch_widget).getImportantForAccessibility());
        assertTrue(row.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
        int before = focusedTitles(a11y).size();

        // A phone measures the list with room to spare as soon as its rows change, before it lays
        // them out, and that measure takes rows for the top of the page from the adapter and
        // throws them away undrawn.
        android.database.DataSetObserver measuresFirst = new android.database.DataSetObserver() {
            @Override public void onChanged() {
                list().measure(View.MeasureSpec.makeMeasureSpec(780, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(1688, View.MeasureSpec.AT_MOST));
            }
        };
        list().getAdapter().registerDataSetObserver(measuresFirst);
        try {
            assertTrue(list().performItemClick(row, at, list().getAdapter().getItemId(at)));
            ShadowLooper.idleMainLooper();
            layout(dialog.getView());
            ShadowLooper.idleMainLooper();
        } finally {
            list().getAdapter().unregisterDataSetObserver(measuresFirst);
        }

        assertFalse(Settings.HIDE_ADS.savedValue());
        assertTrue("the restart row came in above the switch",
                contains(SettingsNavigation.RESTART) && position(SettingsNavigation.RESTART) < position(Settings.HIDE_ADS.key));
        List<String> after = focusedTitles(a11y).subList(before, focusedTitles(a11y).size());
        assertFalse("focus went back to the switch", after.isEmpty());
        // The flip and then the finished save each rebuild the page, and each hands focus to the
        // switch's new row: "Saving the setting" is read, then the switch's state.
        assertEquals("and only there", java.util.Collections.singleton("Hide ads"), new java.util.HashSet<>(after));
        View flipped = list().getChildAt(position(Settings.HIDE_ADS.key) - list().getFirstVisiblePosition());
        TextView note = flipped.findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        assertEquals("Saved. Restart Tumblr to apply this change.", note.getText().toString());
        assertEquals("the note is read with the row, not again on its own",
                View.ACCESSIBILITY_LIVE_REGION_NONE, note.getAccessibilityLiveRegion());
    }

    /**
     * A switch at the bottom of the screen is pushed off it by the restart row coming in at the top
     * of the page. The list scrolls back to it, and focus lands on it then rather than whenever it
     * was scrolled to later.
     */
    @Test public void aFlippedSwitchPushedOffScreenByTheRestartRowIsBroughtBackForItsFocus() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        touchMode(true);
        layout(dialog.getView());
        page.navigation.navigate("Interface");
        layout(dialog.getView());
        int at = position(Settings.TURN_OFF_SCREENSHOT_SHARING.key);
        assertTrue("the switch sits a few rows down its page", at >= 2);
        // The tallest screen that shows no more than a sliver of the switch at its bottom, with the
        // page's top in view.
        int low = 200;
        int high = 6000;
        while (high - low > 1) {
            int mid = (low + high) / 2;
            layout(dialog.getView(), mid);
            int last = list().getLastVisiblePosition();
            boolean tooTall = last > at || last == at
                    && list().getHeight() - list().getChildAt(at - list().getFirstVisiblePosition()).getTop() > 8;
            if (tooTall) high = mid;
            else low = mid;
        }
        int height = low;
        layout(dialog.getView(), height);
        assertEquals(0, list().getFirstVisiblePosition());
        assertEquals("the switch is the last row in view", at, list().getLastVisiblePosition());
        View row = list().getChildAt(at);
        assertTrue(row.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
        int before = focusedTitles(a11y).size();

        assertTrue(list().performItemClick(row, at, list().getAdapter().getItemId(at)));
        ShadowLooper.idleMainLooper();
        // One pass finds the switch pushed off screen and scrolls, the next draws it and focuses it.
        layout(dialog.getView(), height);
        ShadowLooper.idleMainLooper();
        layout(dialog.getView(), height);
        ShadowLooper.idleMainLooper();

        int now = position(Settings.TURN_OFF_SCREENSHOT_SHARING.key);
        assertTrue("the restart row came in above the switch", contains(SettingsNavigation.RESTART)
                && position(SettingsNavigation.RESTART) < now);
        assertTrue("the switch is on screen", now >= list().getFirstVisiblePosition() && now <= list().getLastVisiblePosition());
        List<String> after = focusedTitles(a11y).subList(before, focusedTitles(a11y).size());
        assertFalse("focus went back to the switch", after.isEmpty());
        assertEquals("and only there", java.util.Collections.singleton("Turn off screenshot sharing"), new java.util.HashSet<>(after));
    }

    /** The first text of each row that took accessibility focus, in order. */
    private static List<String> focusedTitles(android.view.accessibility.AccessibilityManager a11y) {
        List<String> titles = new ArrayList<>();
        for (android.view.accessibility.AccessibilityEvent event : org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents()) {
            if (event.getEventType() != android.view.accessibility.AccessibilityEvent.TYPE_VIEW_ACCESSIBILITY_FOCUSED) continue;
            titles.add(event.getText().isEmpty() ? null : String.valueOf(event.getText().get(0)));
        }
        return titles;
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
