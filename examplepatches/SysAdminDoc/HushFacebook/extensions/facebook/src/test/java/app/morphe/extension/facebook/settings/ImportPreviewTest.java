/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.ScrollView;
import android.widget.TextView;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowLooper;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

/** The import keeps its existing flow while every changed switch gets an individual saved-state row. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "w390dp-h844dp-night-xhdpi")
@SuppressWarnings("deprecation")
public class ImportPreviewTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private ActivityController<Activity> controller;
    private SettingsDialog host;
    private HushfacebookPreferenceFragment page;

    @Before public void open() {
        PatchFamily.inBuildForTests = EnumSet.noneOf(PatchFamily.class);
        PauseForTests.resume();
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        host = SettingsL10nTest.show(controller.get());
        page = SettingsL10nTest.pageOf(host);
    }

    @After public void close() {
        controller.close();
        ShadowLooper.idleMainLooper();
        PatchFamily.inBuildForTests = null;
        ScreenColors.shown = null;
        PauseForTests.resume();
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) setting.resetToDefault();
        Settings.HIDDEN_WORDS.resetToDefault();
        Settings.KEPT_WORDS.resetToDefault();
    }

    @Test public void changedSwitchesShowTheirIndividualNamesWithoutTheirPatchesSelected() throws Exception {
        assertNull(page.findPreference(Settings.HIDE_SPONSORED_POSTS.key));
        assertNull(page.findPreference(Settings.HIDE_SUGGESTED_POSTS.key));
        AlertDialog preview = preview(file(Settings.HIDE_SPONSORED_POSTS.key, false,
                Settings.HIDE_SUGGESTED_POSTS.key, false));
        View sponsored = row(preview, Settings.HIDE_SPONSORED_POSTS);
        View suggested = row(preview, Settings.HIDE_SUGGESTED_POSTS);
        assertTrue(text(sponsored).contains("Hide sponsored posts"));
        assertTrue(text(suggested).contains("Hide page suggestions and Facebook's own promos"));
        assertEquals("2 switches will change.", String.valueOf(shadowOf(preview).getMessage()));
        assertTrue(Settings.HIDE_SPONSORED_POSTS.savedValue());
    }

    @Test public void aPausedPreviewUsesSavedCurrentValuesAndOnlyShowsChangedSwitches() throws Exception {
        Settings.HIDE_SUGGESTED_POSTS.save(false);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(Settings.HIDE_SPONSORED_POSTS.get());
        AlertDialog preview = preview(file(Settings.HIDE_SPONSORED_POSTS.key, false,
                Settings.HIDE_SUGGESTED_POSTS.key, false));
        assertEquals(spoken(),
                String.valueOf(row(preview, Settings.HIDE_SPONSORED_POSTS).getContentDescription()));
        assertNull(find(preview.getWindow().getDecorView(), Settings.HIDE_SUGGESTED_POSTS));
        assertEquals("1 switch will change.", String.valueOf(shadowOf(preview).getMessage()));
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void bothStoriesChoicesAndWholeWordModeRenderWithoutTheirPatchesSelected() throws Exception {
        BooleanSetting[] choices = {Settings.HIDE_TOP_STORIES_TRAY, Settings.HIDE_STORIES_BETWEEN_POSTS,
                Settings.POST_WORDS_WHOLE_WORDS};
        JSONObject values = new JSONObject();
        for (BooleanSetting choice : choices) {
            assertNull(page.findPreference(choice.key));
            values.put(choice.key, !choice.savedValue());
        }
        AlertDialog preview = preview(fileOf(values));
        assertEquals("3 switches will change.", String.valueOf(shadowOf(preview).getMessage()));
        layout(preview);
        for (BooleanSetting choice : choices) {
            View changed = row(preview, choice);
            assertTrue(text(changed), text(changed).contains(SwitchLabels.title(choice)));
            String before = L10n.t(choice.savedValue() ? "On" : "Off");
            String after = L10n.t(choice.savedValue() ? "Off" : "On");
            assertEquals(SwitchLabels.title(choice) + ". "
                    + L10n.f("Saved now %1$s. After import %2$s.", L10n.isolate(before), L10n.isolate(after)),
                    String.valueOf(changed.getContentDescription()));
            assertVisible(changed);
        }
        assertUncutText(preview.getWindow().getDecorView());
        capture("stories-and-whole-words", preview);
    }

    @Test @Config(qualifiers = "de-w390dp-h844dp-night-xhdpi")
    public void bothStoriesChoicesAndWholeWordModeShowTranslatedCurrentAndIncomingStates() throws Exception {
        BooleanSetting[] choices = {Settings.HIDE_TOP_STORIES_TRAY, Settings.HIDE_STORIES_BETWEEN_POSTS,
                Settings.POST_WORDS_WHOLE_WORDS};
        String[] names = {"Stories-Leiste ausblenden", "Stories zwischen Beiträgen ausblenden",
                "Ganze Wörter abgleichen"};
        JSONObject values = new JSONObject();
        for (BooleanSetting choice : choices) values.put(choice.key, !choice.savedValue());
        AlertDialog preview = preview(fileOf(values));
        for (int i = 0; i < choices.length; i++) {
            BooleanSetting choice = choices[i];
            ViewGroup changed = (ViewGroup) row(preview, choice);
            String before = choice.savedValue() ? "Ein" : "Aus";
            String after = choice.savedValue() ? "Aus" : "Ein";
            assertEquals(names[i], ((TextView) changed.getChildAt(0)).getText().toString());
            assertEquals(L10n.isolate(before) + " \u2192 " + L10n.isolate(after),
                    ((TextView) changed.getChildAt(1)).getText().toString());
            assertEquals(names[i] + ". Aktuell gespeichert " + L10n.isolate(before)
                            + ". Nach dem Import " + L10n.isolate(after) + ".",
                    changed.getContentDescription().toString());
        }
    }

    @Test public void aLegacyStoriesImportNamesBothIndependentChoices() throws Exception {
        AlertDialog preview = preview(file(StoriesSetting.LEGACY_KEY, false));
        assertEquals("2 switches will change.", String.valueOf(shadowOf(preview).getMessage()));
        assertTrue(text(row(preview, Settings.HIDE_TOP_STORIES_TRAY)).contains("Hide the Stories tray"));
        assertTrue(text(row(preview, Settings.HIDE_STORIES_BETWEEN_POSTS)).contains("Hide Stories between posts"));
        assertFalse(text(preview.getWindow().getDecorView()).contains(StoriesSetting.LEGACY_KEY));
        assertTrue(Settings.HIDE_TOP_STORIES_TRAY.savedValue());
        assertTrue(Settings.HIDE_STORIES_BETWEEN_POSTS.savedValue());
    }

    @Test public void phraseContentsExcludedKeysAndUnknownNamesStayOutOfThePreview() throws Exception {
        AlertDialog preview = preview(file(Settings.HIDE_SPONSORED_POSTS.key, false,
                Settings.HIDDEN_WORDS.key, "private magnolia", Settings.KEPT_WORDS.key, "private cedar",
                "hushfacebook_pause", true, "unrecognized_private_name", true));
        String shown = text(preview.getWindow().getDecorView()) + descriptions(preview.getWindow().getDecorView());
        assertFalse(shown, shown.contains("private magnolia"));
        assertFalse(shown, shown.contains("private cedar"));
        assertFalse(shown, shown.contains("hushfacebook_pause"));
        assertFalse(shown, shown.contains("unrecognized_private_name"));
        assertTrue(shown, shown.contains("Hide sponsored posts"));
        assertTrue(shown, shown.contains("2 items in that file"));
        assertTrue(shown, shown.contains("hold 1 word or phrase"));
        assertEquals("", Settings.HIDDEN_WORDS.savedValue());
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aMatchingFileKeepsTheExistingOkOnlyFlow() throws Exception {
        AlertDialog preview = preview(file(Settings.HIDE_SPONSORED_POSTS.key, true));
        assertEquals("Your switches already match that file, so nothing will change.",
                String.valueOf(shadowOf(preview).getMessage()));
        assertNull(find(preview.getWindow().getDecorView(), Settings.HIDE_SPONSORED_POSTS));
        assertEquals("OK", preview.getButton(AlertDialog.BUTTON_POSITIVE).getText().toString());
        assertEquals(View.GONE, preview.getButton(AlertDialog.BUTTON_NEGATIVE).getVisibility());
        layout(preview);
        assertVisible(preview.getButton(AlertDialog.BUTTON_POSITIVE));
        assertUncutText(preview.getWindow().getDecorView());
        capture("no-change", preview);
        preview.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        ShadowLooper.idleMainLooper();
        assertNull(page.pendingImport);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void recreationRebuildsTheNamedRowsWithoutAnsweringThePreview() throws Exception {
        AlertDialog before = preview(file(Settings.HIDE_SPONSORED_POSTS.key, false));
        String description = String.valueOf(row(before, Settings.HIDE_SPONSORED_POSTS).getContentDescription());
        controller.recreate();
        ShadowLooper.idleMainLooper();
        host = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag("hushfacebook_settings");
        page = SettingsL10nTest.pageOf(host);
        assertFalse(before.isShowing());
        assertNotSame(before, page.importPreview);
        assertEquals(description, String.valueOf(row(page.importPreview, Settings.HIDE_SPONSORED_POSTS).getContentDescription()));
        assertTrue(Settings.HIDE_SPONSORED_POSTS.savedValue());
        assertNotNull(page.pendingImport);
        layout(page.importPreview);
        assertAlignedText(page.importPreview, Settings.HIDE_SPONSORED_POSTS);
        assertVisible(page.importPreview.getButton(AlertDialog.BUTTON_POSITIVE));
        assertVisible(page.importPreview.getButton(AlertDialog.BUTTON_NEGATIVE));
        capture("recreated", page.importPreview);
    }

    @Test public void eachDifferenceIsOneSpokenEntryWithoutAnActionOrDuplicateChildren() throws Exception {
        View changed = row(preview(file(Settings.HIDE_SPONSORED_POSTS.key, false)), Settings.HIDE_SPONSORED_POSTS);
        AccessibilityNodeInfo info = changed.createAccessibilityNodeInfo();
        assertTrue(info.isScreenReaderFocusable());
        assertEquals(TextView.class.getName(), info.getClassName());
        assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_YES, changed.getImportantForAccessibility());
        assertEquals(spoken(), info.getContentDescription().toString());
        assertFalse(info.isCheckable());
        assertFalse(info.isClickable());
        for (int i = 0; i < ((ViewGroup) changed).getChildCount(); i++) {
            assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_NO,
                    ((ViewGroup) changed).getChildAt(i).getImportantForAccessibility());
        }
    }

    @Test @Config(qualifiers = "de-w390dp-h844dp-night-xhdpi")
    public void namesAndSavedIncomingStatesUseTheCurrentLanguage() throws Exception {
        View changed = row(preview(file(Settings.HIDE_SPONSORED_POSTS.key, false)), Settings.HIDE_SPONSORED_POSTS);
        String spoken = String.valueOf(changed.getContentDescription());
        assertTrue(spoken, spoken.startsWith(L10n.t("Hide sponsored posts")));
        assertFalse(spoken, spoken.contains("Hide sponsored posts"));
        assertFalse(spoken, spoken.contains("Saved now"));
        assertTrue(spoken, spoken.contains(L10n.t("On")));
        assertTrue(spoken, spoken.contains(L10n.t("Off")));
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aFullFileScrollsToItsLastNamedSwitchAndKeepsBothButtonsReachable() throws Exception {
        AlertDialog preview = preview(allChanged());
        layout(preview);
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) {
            View changed = row(preview, setting);
            assertFalse(text(changed).isEmpty());
            assertFalse(text(changed).contains(setting.key));
        }
        ScrollView scroll = scroll(preview);
        assertTrue("the named list cannot scroll", scroll.canScrollVertically(1));
        assertAlignedText(preview, Settings.HIDE_SPONSORED_POSTS);
        capture("long-dark-top", preview);
        scroll.setSmoothScrollingEnabled(false);
        scroll.fullScroll(View.FOCUS_DOWN);
        ShadowLooper.idleMainLooper();
        assertTrue("the full list never scrolled", scroll.getScrollY() > 0);
        assertFalse(scroll.canScrollVertically(1));
        assertVisible(row(preview, SettingsBackup.ALLOWLIST.get(SettingsBackup.ALLOWLIST.size() - 1)));
        assertVisible(preview.getButton(AlertDialog.BUTTON_POSITIVE));
        assertVisible(preview.getButton(AlertDialog.BUTTON_NEGATIVE));
        capture("long-dark-bottom", preview);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h844dp-notnight-xhdpi")
    public void theNamedPreviewRendersInTheLightTheme() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.MATERIAL_YOU_THEME);
        ScreenColors.shown = ScreenColors.forScreen(controller.get());
        AlertDialog preview = preview(file(Settings.HIDE_SPONSORED_POSTS.key, false,
                Settings.HIDE_SUGGESTED_POSTS.key, false, Settings.DOWNLOAD_COMPATIBLE.key, true));
        layout(preview);
        assertAlignedText(preview, Settings.HIDE_SPONSORED_POSTS);
        assertVisible(preview.getButton(AlertDialog.BUTTON_POSITIVE));
        capture("light", preview);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void doubleSizeTextWrapsWithoutHidingTheImportAndCancelActions() throws Exception {
        RuntimeEnvironment.getApplication().getResources().getConfiguration().fontScale = 2f;
        RuntimeEnvironment.getApplication().getResources().getDisplayMetrics().scaledDensity *= 2f;
        AlertDialog preview = preview(allChanged());
        layout(preview);
        assertAlignedText(preview, Settings.HIDE_SPONSORED_POSTS);
        assertUncutText(preview.getWindow().getDecorView());
        assertVisible(preview.getButton(AlertDialog.BUTTON_POSITIVE));
        assertVisible(preview.getButton(AlertDialog.BUTTON_NEGATIVE));
        assertTrue(scroll(preview).canScrollVertically(1));
        capture("large-font", preview);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rXB-ldrtl-w390dp-h844dp-night-xhdpi")
    public void rightToLeftSpeechNamesCurrentAndIncomingStatesClearly() throws Exception {
        AlertDialog preview = preview(file(Settings.HIDE_SPONSORED_POSTS.key, false));
        View changed = row(preview, Settings.HIDE_SPONSORED_POSTS);
        String spoken = String.valueOf(changed.getContentDescription());
        assertEquals(L10n.t("Hide sponsored posts") + ". " + L10n.f("Saved now %1$s. After import %2$s.",
                L10n.isolate(L10n.t("On")), L10n.isolate(L10n.t("Off"))), spoken);
        assertFalse("speech relies on an arrow", spoken.contains("\u2192"));
        layout(preview);
        assertAlignedText(preview, Settings.HIDE_SPONSORED_POSTS);
        assertUncutText(preview.getWindow().getDecorView());
        capture("rtl", preview);
    }

    private AlertDialog preview(String file) throws Exception {
        page.pendingImport = SettingsBackup.parse(file).toBundle();
        SettingsBackupPreference.showPreview(page);
        assertNotNull(page.importPreview);
        return page.importPreview;
    }

    private static String spoken() {
        return L10n.t("Hide sponsored posts") + ". " + L10n.f("Saved now %1$s. After import %2$s.",
                L10n.isolate(L10n.t("On")), L10n.isolate(L10n.t("Off")));
    }

    private static String allChanged() throws Exception {
        JSONObject values = new JSONObject();
        for (BooleanSetting setting : SettingsBackup.ALLOWLIST) values.put(setting.key, !setting.savedValue());
        return fileOf(values);
    }

    private static String file(Object... pairs) throws Exception {
        JSONObject values = new JSONObject();
        for (int i = 0; i < pairs.length; i += 2) values.put((String) pairs[i], pairs[i + 1]);
        return fileOf(values);
    }

    private static String fileOf(JSONObject values) throws Exception {
        return new JSONObject().put("format", SettingsBackup.FORMAT).put("schema", 1).put("settings", values).toString();
    }

    private static View row(AlertDialog preview, BooleanSetting setting) {
        View found = find(preview.getWindow().getDecorView(), setting);
        assertNotNull("no individual difference for " + setting.key, found);
        return found;
    }

    private static View find(View view, Object tag) {
        if (view.getTag() == tag) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = find(group.getChildAt(i), tag);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static String text(View view) {
        List<String> values = new ArrayList<>();
        collect(view, values, false);
        return String.join("\n", values);
    }

    private static String descriptions(View view) {
        List<String> values = new ArrayList<>();
        collect(view, values, true);
        return String.join("\n", values);
    }

    private static void collect(View view, List<String> values, boolean spoken) {
        if (spoken && view.getContentDescription() != null) values.add(view.getContentDescription().toString());
        if (!spoken && view instanceof TextView) values.add(((TextView) view).getText().toString());
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), values, spoken);
        }
    }

    private static ScrollView scroll(AlertDialog preview) {
        ViewParent parent = preview.findViewById(android.R.id.message).getParent();
        while (parent != null && !(parent instanceof ScrollView)) parent = parent.getParent();
        assertTrue("the preview has no scroll container", parent instanceof ScrollView);
        return (ScrollView) parent;
    }

    private static void layout(AlertDialog preview) {
        View decor = preview.getWindow().getDecorView();
        int width = preview.getWindow().getAttributes().width;
        decor.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1500, View.MeasureSpec.AT_MOST));
        decor.layout(0, 0, width, decor.getMeasuredHeight());
        ShadowLooper.idleMainLooper();
    }

    private static void assertVisible(View view) {
        assertTrue("an action is outside the preview", view.getGlobalVisibleRect(new android.graphics.Rect()));
        assertTrue(view.getHeight() > 0);
        assertTrue(view.isEnabled());
    }

    private static void assertAlignedText(AlertDialog preview, BooleanSetting setting) {
        TextView message = preview.findViewById(android.R.id.message);
        View title = ((ViewGroup) row(preview, setting)).getChildAt(0);
        int[] messageAt = new int[2];
        int[] titleAt = new int[2];
        message.getLocationInWindow(messageAt);
        title.getLocationInWindow(titleAt);
        assertEquals("the named rows don't share the summary's text column",
                messageAt[0] + message.getCompoundPaddingLeft(), titleAt[0]);
        assertEquals(message.getWidth() - message.getCompoundPaddingLeft() - message.getCompoundPaddingRight(),
                title.getWidth());
    }

    private static void assertUncutText(View view) {
        if (view instanceof TextView) {
            android.text.Layout text = ((TextView) view).getLayout();
            if (text != null) for (int i = 0; i < text.getLineCount(); i++) assertEquals(0, text.getEllipsisCount(i));
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) assertUncutText(group.getChildAt(i));
        }
    }

    private void capture(String name, AlertDialog preview) throws Exception {
        File folder = new File("build/reports/import-preview");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        View decor = preview.getWindow().getDecorView();
        Bitmap image = Bitmap.createBitmap(780, 1688, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(image);
        host.getView().measure(View.MeasureSpec.makeMeasureSpec(780, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1688, View.MeasureSpec.EXACTLY));
        host.getView().layout(0, 0, 780, 1688);
        host.getView().draw(canvas);
        canvas.drawColor(0x99000000);
        canvas.translate((780 - decor.getWidth()) / 2f, (1688 - decor.getHeight()) / 2f);
        decor.draw(canvas);
        try (FileOutputStream output = new FileOutputStream(new File(folder, name + ".png"))) {
            assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, output));
        }
        image.recycle();
    }
}
