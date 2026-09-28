/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.view.View;
import android.widget.EditText;
import android.widget.ListView;

import java.io.File;
import java.io.FileOutputStream;
import java.util.EnumSet;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.PauseForTests;

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

    private android.widget.Button statusAction() {
        android.view.ViewGroup frame = list().getChildAt(0).findViewById(android.R.id.widget_frame);
        assertEquals(1, frame.getChildCount());
        return (android.widget.Button) frame.getChildAt(0);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w384dp-h824dp-night-450dpi")
    public void qualityDialogShowsAllSixChoicesWithoutClippingTheLastRow() {
        HushfacebookPreferenceFragment.QualityRow quality = (HushfacebookPreferenceFragment.QualityRow)
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

    @Test public void recreationKeepsTheCategoryAndSearchQuery() {
        page.navigation.open(page.findPreference(Settings.TAP_TO_PLAY.key));
        recreate();
        assertTrue(contains(Settings.TAP_TO_PLAY.key));
        assertEquals(2, list().getCount());
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
        View toggle = list().getChildAt(1);
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
        capture("search-results");
        findSearch(dialog.getView()).setText("noSuchSetting987654");
        capture("search-empty");
        page.navigation.back();
        page.navigation.navigate("Downloads");
        HushfacebookPreferenceFragment.QualityRow quality = (HushfacebookPreferenceFragment.QualityRow) page.findPreference(Settings.DOWNLOAD_QUALITY.key);
        quality.showDialog(null);
        captureDialog("dialog-quality", (AlertDialog) quality.getDialog());
        quality.getDialog().dismiss();
        HushfacebookPreferenceFragment.FolderRow folder = (HushfacebookPreferenceFragment.FolderRow) page.findPreference(Settings.SAVE_FOLDER.key);
        folder.showDialog(null);
        captureDialog("dialog-folder", (AlertDialog) folder.getDialog());
        folder.getDialog().dismiss();
        HushfacebookPreferenceFragment.FileNameRow name = (HushfacebookPreferenceFragment.FileNameRow) page.findPreference(Settings.FILENAME_TEMPLATE.key);
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
        HushfacebookPreferenceFragment.FileNameRow name = (HushfacebookPreferenceFragment.FileNameRow) page.findPreference(Settings.FILENAME_TEMPLATE.key);
        String before = Settings.FILENAME_TEMPLATE.savedValue();
        name.showDialog(null);
        name.getEditText().setText("Example_{video_id}");
        assertEquals("Example_123456.mp4", HushfacebookPreferenceFragment.FileNameRow.previewName("Example_{video_id}", new java.util.Date(0)));
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
        for (int i = 0; i < list().getCount(); i++) {
            if (key.equals(((Preference) list().getItemAtPosition(i)).getKey())) return true;
        }
        return false;
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
