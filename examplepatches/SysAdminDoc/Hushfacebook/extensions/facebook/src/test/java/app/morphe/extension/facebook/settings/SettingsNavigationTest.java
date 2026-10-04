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

/** Exercises the actual dialog host and its filtered view of the original preference model. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "w390dp-h844dp-night-xhdpi")
@SuppressWarnings("deprecation")
public class SettingsNavigationTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private ActivityController<Activity> controller;
    private SettingsDialog dialog;
    private HushfacebookPreferenceFragment page;

    @Before public void open() {
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
        PauseForTests.resume();
    }

    @Test public void homeAndEveryCategoryAreReachableWithoutRemovingTheModel() {
        assertNotNull(page.navigation);
        assertEquals(9, list().getCount());
        assertEquals(19, page.sections().size());
        int total = page.getPreferenceScreen().getRootAdapter().getCount();
        for (Preference section : page.sections()) {
            assertTrue(page.navigation.open(section));
            assertEquals(((PreferenceCategory) section).getPreferenceCount(), list().getCount());
            assertEquals(total, page.getPreferenceScreen().getRootAdapter().getCount());
            assertNotNull(page.findPreference(Settings.TAP_TO_PLAY.key));
            assertTrue(page.navigation.back());
            while (page.navigation.back()) { }
        }
        assertEquals(9, list().getCount());
    }

    @Test public void categoryClickChangesOnlyTheSettingWhoseRowWasTapped() {
        assertTrue(page.navigation.open(page.findPreference(Settings.TAP_TO_PLAY.key)));
        assertTrue(Settings.TAP_TO_PLAY.savedValue());
        tap(Settings.TAP_TO_PLAY.key);
        assertFalse(Settings.TAP_TO_PLAY.savedValue());
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
            assertEquals(app.morphe.extension.shared.L10n.f("Build %1$s",
                    app.morphe.extension.shared.L10n.isolate(app.morphe.extension.shared.Utils.getPatchesBuildIdentity())), lines[1]);
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
     * Pause switched on from its own page is owed a restart: the page says so and Undo takes it
     * back, after which the line goes. A restart owed for a setting a page shows is said there too.
     */
    @Test public void aPauseOrAChangeWaitingOnARestartIsSaidOnItsPage() {
        page.navigation.navigate("Pause, backup and diagnostics");
        tap(BaseSettings.PAUSED.key);
        layout(dialog.getView());
        Preference line = (Preference) list().getItemAtPosition(0);
        assertEquals("Hushfacebook is on", String.valueOf(line.getTitle()));
        assertEquals("Hushfacebook pauses when Facebook restarts.", String.valueOf(line.getSummary()));
        pageAction().performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertEquals(BaseSettings.PAUSED.key, ((Preference) list().getItemAtPosition(0)).getKey());

        page.navigation.back();
        app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                Settings.MARKETPLACE_ONLY.key);
        page.navigation.navigate("Opening Facebook");
        layout(dialog.getView());
        line = (Preference) list().getItemAtPosition(0);
        assertEquals("A change here applies after Facebook restarts.", String.valueOf(line.getTitle()));
        android.view.ViewGroup frame = list().getChildAt(0).findViewById(android.R.id.widget_frame);
        assertTrue("a restart line offered an action", frame == null || frame.getChildCount() == 0);
        page.navigation.back();
        page.navigation.navigate("Playback");
        assertEquals("a restart owed elsewhere was said here", categoryCount("Playback"), list().getCount());
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
        android.view.ViewGroup frame = list().getChildAt(0).findViewById(android.R.id.widget_frame);
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
        assertEquals("Your choices are saved. Tap Resume, then restart Facebook.", lines[0]);
        assertEquals(app.morphe.extension.shared.L10n.f("Build %1$s",
                app.morphe.extension.shared.L10n.isolate(app.morphe.extension.shared.Utils.getPatchesBuildIdentity())), lines[1]);
    }

    /**
     * At twice the text size the button beside the status text left the name too little room and
     * "Hushfacebook" broke inside the word. From one and a half times, the button goes under the text.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
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
        assertEquals(9, list().getCount());
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
     * their names. Every default patch in, the row isn't there (the nine rows of the first test).
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

        assertEquals(10, list().getCount());
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

        assertEquals(10, list().getCount());
        assertEquals(1, position(HushfacebookPreferenceFragment.MISSING_RESTORE_TRUST));
        assertFalse(contains(HushfacebookPreferenceFragment.MISSING_DEFAULTS));
        Preference row = (Preference) list().getItemAtPosition(1);
        assertEquals("Profiles and some Settings pages won't open", String.valueOf(row.getTitle()));
        assertEquals("Patch again with " + L10n.isolate("Restore screens on re-signed builds")
                + " selected. Re-signed builds need it for profiles and some Facebook Settings pages.",
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

        assertEquals(11, list().getCount());
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

        assertEquals(9, list().getCount());
        assertFalse(contains(HushfacebookPreferenceFragment.MISSING_RESTORE_TRUST));
        assertFalse(contains(HushfacebookPreferenceFragment.MISSING_DEFAULTS));
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

    @Test public void recreationKeepsTheCategoryAndSearchQuery() {
        page.navigation.open(page.findPreference(Settings.TAP_TO_PLAY.key));
        recreate();
        assertTrue(contains(Settings.TAP_TO_PLAY.key));
        // Playback: Tap to play, Resume long videos, Default playback quality and its Playback quality list.
        assertEquals(4, list().getCount());
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
        assertEquals(9, list().getCount());
        page.navigation.navigate("About");
        dialog.getDialog().onBackPressed();
        assertEquals(13, list().getCount());
        dialog.getDialog().onBackPressed();
        assertEquals(9, list().getCount());
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
        View heading = list().getChildAt(1);
        assertTrue(heading.createAccessibilityNodeInfo().isHeading());
        View opening = list().getChildAt(2);
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
        assertFalse(Settings.TAP_TO_PLAY.savedValue());
    }

    /** All pages are rendered with the same viewport as the design reference. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void renderEveryPageAndSearchOffscreen() throws Exception {
        capture("00-overview");
        for (Preference section : page.sections()) {
            page.navigation.open(section);
            capture(section.getTitle().toString().toLowerCase(java.util.Locale.ROOT).replaceAll("[^a-z]+", "-"));
        }
        page.navigation.navigate("more");
        capture("more-settings");
        page.navigation.back();
        findSearch(dialog.getView()).setText("video");
        ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
        capture("search-results");
        findSearch(dialog.getView()).setText("noSuchSetting987654");
        ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
        capture("search-empty");
        page.navigation.back();
        page.navigation.navigate("Downloads");
        ValueRows.QualityRow quality = (ValueRows.QualityRow) page.findPreference(Settings.DOWNLOAD_QUALITY.key);
        quality.showDialog(null);
        captureDialog("dialog-quality", (AlertDialog) quality.getDialog());
        quality.getDialog().dismiss();
        ValueRows.FolderRow folder = (ValueRows.FolderRow) page.findPreference(Settings.SAVE_FOLDER.key);
        folder.showDialog(null);
        captureDialog("dialog-folder", (AlertDialog) folder.getDialog());
        folder.getDialog().dismiss();
        ValueRows.FileNameRow name = (ValueRows.FileNameRow) page.findPreference(Settings.FILENAME_TEMPLATE.key);
        name.showDialog(null);
        captureDialog("dialog-file-name", (AlertDialog) name.getDialog());
        name.getDialog().dismiss();
        page.navigation.navigate("Pause, backup and diagnostics");
        Preference export = page.findPreference("action_export_diagnostic_report");
        export.getOnPreferenceClickListener().onPreferenceClick(export);
        AlertDialog report = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        captureDialog("dialog-report", report);
        report.dismiss();
        page.pendingImport = SettingsBackup.parse("{\"format\":\"hushfacebook-settings\",\"schema\":1,\"settings\":{\"hushfacebook_tap_to_play\":false}}").toBundle();
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
    }

    @Test public void fileNameExampleUsesTheSameFormatterAndCancelKeepsTheSavedTemplate() {
        ValueRows.FileNameRow name = (ValueRows.FileNameRow) page.findPreference(Settings.FILENAME_TEMPLATE.key);
        String before = Settings.FILENAME_TEMPLATE.savedValue();
        name.showDialog(null);
        name.getEditText().setText("Example_{video_id}");
        assertEquals("Example_123456.mp4", ValueRows.FileNameRow.previewName("Example_{video_id}", new java.util.Date(0)));
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
        try (FileOutputStream out = new FileOutputStream(new File("build/reports/settings-design", name + ".png"))) {
            assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, out));
        }
        image.recycle();
    }

    private void capture(String name) throws Exception {
        File folder = new File("build/reports/settings-design");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        View root = dialog.getView();
        layout(root);
        Bitmap image = Bitmap.createBitmap(780, 1688, Bitmap.Config.ARGB_8888);
        root.draw(new Canvas(image));
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
        Context context = RuntimeEnvironment.getApplication();
        ShadowPackageManager packages = shadowOf(context.getPackageManager());
        PackageInfo info = new PackageInfo();
        info.packageName = context.getPackageName();
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
