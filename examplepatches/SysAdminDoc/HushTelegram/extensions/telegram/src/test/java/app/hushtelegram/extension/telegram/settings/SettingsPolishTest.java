/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.Configuration;
import android.graphics.Color;
import android.preference.Preference;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtelegram.extension.shared.settings.FailingStore;
import app.hushtelegram.extension.shared.ui.CustomDialog;
import app.hushtelegram.extension.shared.ui.ShimmerTitle;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SettingsPolishTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After public void reset() {
        PatchFamily.inBuildForTests = null;
        AbstractPreferenceFragment.restartPending.clear();
    }

    @Test public void typingSearchUpdatesTheHeadingAndClearingRestoresTheHome() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            SettingsDialog dialog = show(activity.get());
            HushTelegramPreferenceFragment page = page(dialog);
            EditText search = search(dialog.getView());
            search.requestFocus();
            search.setText("ads");
            TextView title = dialog.getView().findViewWithTag(SettingsDialog.PAGE_TITLE);
            assertEquals("Search settings", title.getText().toString());
            assertTrue("the bar's title wears Telegram's blues", ShimmerTitle.wears(title));
            search.setText("");
            assertEquals("HushTelegram", ((TextView) dialog.getView().findViewWithTag(SettingsDialog.PAGE_TITLE)).getText().toString());
            assertTrue("Deleting the last character must keep editing focus", search.hasFocus());
        }
    }

    @Test public void overviewDoesNotClaimAllChangesAreWorkingBeforeARestart() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        AbstractPreferenceFragment.restartPending.add(Settings.USE_SYSTEM_FONT.key);
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            SettingsDialog dialog = show(activity.get());
            HushTelegramPreferenceFragment page = page(dialog);
            android.widget.ListView list = dialog.getView().findViewById(android.R.id.list);
            // Nothing is paused, so the status card stays out of the list and the restart row, first
            // on it, is what says a change waits. Nothing on the home list says all is well.
            Preference first = page.navigation.getItem(0);
            assertEquals(SettingsNavigation.RESTART, first.getKey());
            assertTrue(String.valueOf(first.getTitle()), String.valueOf(first.getTitle()).contains("Restart"));
            for (int i = 0; i < page.navigation.getCount(); i++) {
                View drawn = page.navigation.getView(i, null, list);
                TextView summary = drawn.findViewById(android.R.id.summary);
                assertFalse("row " + i + " claims the switches are working",
                        summary != null && summary.getText().toString().contains("Your switches are working"));
            }
            // Paused, the card is drawn and says what the next start does, not that all is well.
            app.hushtelegram.extension.shared.settings.BaseSettings.PAUSED.save(true);
            try {
                page.navigation.restartChanged();
                Preference card = page.navigation.getItem(0);
                assertSame(page.getPreferenceScreen().getPreference(0), card);
                TextView line = page.navigation.getView(0, null, list).findViewById(android.R.id.summary);
                assertFalse(line.getText().toString(), line.getText().toString().contains("Your switches are working"));
            } finally {
                app.hushtelegram.extension.shared.settings.BaseSettings.PAUSED.resetToDefault();
            }
        }
    }

    @Test public void disabledExplanationRemainsReadableOnItsActualCard() {
        ScreenColors colors = ScreenColors.DEFAULT;
        int drawn = ScreenColors.dimmedWhenDisabled(colors.summary).getColorForState(new int[0], 0);
        float alpha = Color.alpha(drawn) / 255f;
        int composited = Color.rgb(Math.round(Color.red(drawn) * alpha + Color.red(colors.card) * (1-alpha)),
                Math.round(Color.green(drawn) * alpha + Color.green(colors.card) * (1-alpha)),
                Math.round(Color.blue(drawn) * alpha + Color.blue(colors.card) * (1-alpha)));
        assertTrue("Disabled explanations fall below 4.5:1", ScreenColorsTest.contrast(composited, colors.card) >= 4.5);
    }

    @Test public void everyTranslationFieldUsesTheSettingsPalette() {
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            TranslateServiceEditor.open(activity.get(), new Preference(activity.get()));
            AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
            try {
                for (int id : new int[]{android.R.id.text1, android.R.id.text2, android.R.id.edit}) {
                    EditText field = dialog.findViewById(id);
                    assertNotNull(field);
                    assertEquals(field.getHint().toString(), ScreenColors.DEFAULT.title, field.getCurrentTextColor());
                    assertNull(field.getBackgroundTintList());
                }
            } finally { dialog.dismiss(); }
        }
    }

    @Test public void translationServiceKeyboardMakesRoomForTheButtons() {
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            AlertDialog dialog = TranslateServiceEditor.open(activity.get(), new Preference(activity.get()));
            try { assertResizesForKeyboard(dialog); } finally { dialog.dismiss(); }
        }
    }

    @Test public void titleEmojiKeyboardMakesRoomForTheButtons() {
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            AlertDialog dialog = TitleEmojiEditor.open(activity.get(), new Preference(activity.get()), before -> { });
            try { assertResizesForKeyboard(dialog); } finally { dialog.dismiss(); }
        }
    }

    @Test public void filterEditorKeyboardMakesRoomForTheButtons() {
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            AlertDialog dialog = FilterEditor.open(activity.get(), new Preference(activity.get()),
                    Settings.MESSAGE_FILTERS_GROUPS, "Filters for groups");
            try { assertResizesForKeyboard(dialog); } finally { dialog.dismiss(); }
        }
    }

    private static void assertResizesForKeyboard(AlertDialog dialog) {
        assertEquals("the keyboard makes room rather than covering Save and Cancel",
                android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,
                dialog.getWindow().getAttributes().softInputMode & android.view.WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST);
    }

    @Test public void diagnosticChooserClosesWithSettingsAndReopensWithANewOwner() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            SettingsDialog owner = show(activity.get());
            Preference export = page(owner).findPreference("action_export_diagnostic_report");
            export.getOnPreferenceClickListener().onPreferenceClick(export);
            AlertDialog chooser = ShadowAlertDialog.getLatestAlertDialog();
            assertTrue(chooser.isShowing());
            owner.dismiss();
            activity.get().getFragmentManager().executePendingTransactions();
            ShadowLooper.idleMainLooper();
            assertNull(owner.getView());
            assertFalse("The chooser must not retain the removed settings window", chooser.isShowing());
            export.getOnPreferenceClickListener().onPreferenceClick(export);
            assertSame("A queued click must not open another window for the removed owner",
                    chooser, ShadowAlertDialog.getLatestAlertDialog());
            chooser.getListView().performItemClick(null, 0, 0);
            ShadowLooper.idleMainLooper();
            assertFalse("A stale chooser must not start an export",
                    ((HushTelegramPreferenceFragment.ExportRow) export).isBusy());

            owner = show(activity.get());
            export = page(owner).findPreference("action_export_diagnostic_report");
            export.getOnPreferenceClickListener().onPreferenceClick(export);
            AlertDialog reopened = ShadowAlertDialog.getLatestAlertDialog();
            assertNotSame(chooser, reopened);
            assertTrue(reopened.isShowing());
            reopened.onBackPressed();
            assertFalse(reopened.isShowing());
        }
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE) @Config(qualifiers = "w1000dp-h900dp-xhdpi")
    public void wideDisplayReservesStackedActionsAtTheCappedDialogWidth() {
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity.get()))
                    .setTitle("Translation service")
                    .setPositiveButton("Save settings", null)
                    .setNegativeButton("Keep editing", null)
                    .setNeutralButton("Use Google instead", null).show();
            try {
                ScreenColors.dialog(dialog);
                int panelId = dialog.getContext().getResources().getIdentifier("buttonPanel", "id", "android");
                View panel = dialog.findViewById(panelId);
                assertNotNull(panel);
                int width = dialog.getWindow().getAttributes().width;
                assertEquals(Math.round(560 * panel.getResources().getDisplayMetrics().density), width);
                panel.setMinimumHeight(0);
                int displayWidth = panel.getResources().getDisplayMetrics().widthPixels
                        - Math.round(32 * panel.getResources().getDisplayMetrics().density);
                panel.measure(View.MeasureSpec.makeMeasureSpec(displayWidth, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
                int uncappedHeight = panel.getMeasuredHeight();
                panel.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
                int cappedHeight = panel.getMeasuredHeight();
                assertTrue("Action panel " + panel.getClass().getName() + " at " + width + "/" + displayWidth
                                + " pixels has heights " + cappedHeight + "/" + uncappedHeight,
                        cappedHeight > uncappedHeight);
                ScreenColors.dialog(dialog);
                assertTrue("The form must reserve every stacked action's height",
                        panel.getMinimumHeight() >= cappedHeight);
            } finally { dialog.dismiss(); }
        } finally { org.robolectric.RuntimeEnvironment.setFontScale(1f); }
    }

    @Test public void genericDialogActionsRemainTouchableAndUnclippedAtLargeText() throws Exception {
        java.lang.reflect.Field darkOverride = Utils.class.getDeclaredField("isDarkModeEnabled");
        darkOverride.setAccessible(true);
        Object originalDark = darkOverride.get(null);
        Configuration original = new Configuration(org.robolectric.RuntimeEnvironment.getApplication().getResources().getConfiguration());
        try {
        for (boolean dark : new boolean[]{false, true}) {
            Utils.setIsDarkModeEnabled(dark);
            try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
                Configuration config = new Configuration(activity.get().getResources().getConfiguration());
                config.fontScale = 2;
                activity.get().getResources().updateConfiguration(config, activity.get().getResources().getDisplayMetrics());
                android.util.Pair<android.app.Dialog, LinearLayout> result = CustomDialog.create(activity.get(),
                        "Send this message?", "Choose whether to send it.", null,
                        "Send this message", () -> {}, () -> {}, "Keep editing", () -> {}, true);
                result.first.show();
                try {
                    View root = result.second;
                    int width = Math.round(340 * root.getResources().getDisplayMetrics().density);
                    root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                            View.MeasureSpec.makeMeasureSpec(9000, View.MeasureSpec.AT_MOST));
                    root.layout(0, 0, width, root.getMeasuredHeight());
                    List<Button> buttons = new ArrayList<>();
                    buttons(root, buttons);
                    assertEquals(3, buttons.size());
                    for (Button button : buttons) {
                        assertTrue(button.getText().toString(), button.getHeight() >= Math.round(48 * root.getResources().getDisplayMetrics().density));
                        assertNull(button.getEllipsize());
                        assertTrue(button.getText().toString(), button.getBackground().isStateful());
                    }
                } finally { result.first.dismiss(); }
            }
        }
        } finally {
            darkOverride.set(null, originalDark);
            org.robolectric.RuntimeEnvironment.getApplication().getResources().updateConfiguration(original,
                    org.robolectric.RuntimeEnvironment.getApplication().getResources().getDisplayMetrics());
        }
    }

    @Test public void invalidServiceKeepsAnInlineErrorAtTheFieldAndDoesNotSaveTheKeyInViewState() {
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            AlertDialog dialog = TranslateServiceEditor.open(activity.get(), new Preference(activity.get()));
            try {
                EditText key = dialog.findViewById(android.R.id.edit);
                EditText model = dialog.findViewById(android.R.id.text2);
                assertTrue("Single-line formatting must not remove password masking",
                        key.getTransformationMethod() instanceof android.text.method.PasswordTransformationMethod);
                key.setText("local-test-key");
                model.setText("model with spaces");
                dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                TextView error = dialog.getWindow().getDecorView().findViewWithTag(EditorForm.ERROR);
                assertEquals(View.VISIBLE, error.getVisibility());
                android.view.accessibility.AccessibilityNodeInfo invalid = model.createAccessibilityNodeInfo();
                assertTrue(invalid.isContentInvalid());
                assertEquals(error.getText().toString(), invalid.getError().toString());
                assertNull("Inline validation must not open the framework error popup", model.getError());
                assertTrue(model.hasFocus());
                assertSame(error, ((ViewGroup) model.getParent()).getChildAt(((ViewGroup) model.getParent()).indexOfChild(model) + 1));
                key.setText("other-local-test-key");
                assertEquals("Editing another field must not hide the unresolved error", View.VISIBLE, error.getVisibility());
                model.setText("valid-model");
                assertEquals(View.GONE, error.getVisibility());
                assertNull(model.getError());
                assertFalse(model.createAccessibilityNodeInfo().isContentInvalid());
                assertFalse(key.isSaveEnabled());
                android.util.SparseArray<android.os.Parcelable> state = new android.util.SparseArray<>();
                key.saveHierarchyState(state);
                assertNull("Key text must not enter a view state bundle", state.get(key.getId()));
            } finally { dialog.dismiss(); }
        }
    }

    @Test public void failedStickerSaveKeepsThePickerAndRestoresTheSavedSelection() throws Exception {
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = page(show(activity.get()));
            Preference row = new Preference(activity.get());
            row.setSummary(HushTelegramPreferenceFragment.stickerSizeSummary());
            page.showStickerSizes(activity.get(), row);
            AlertDialog picker = ShadowAlertDialog.getLatestAlertDialog();
            int original = picker.getListView().getCheckedItemPosition();
            try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE)) {
                int choice = original == 0 ? 1 : 0;
                picker.getListView().performItemClick(picker.getListView().getChildAt(choice), choice, choice);
                // The pick's write is on the worker now, and its answer comes back to the main thread.
                Utils.awaitBackgroundTasksForTests();
                ShadowLooper.idleMainLooper();
            }
            try {
                assertTrue(picker.isShowing());
                assertEquals(original, picker.getListView().getCheckedItemPosition());
                assertEquals(HushTelegramPreferenceFragment.stickerSizeSummary(), row.getSummary());
            } finally { picker.dismiss(); }
        }
    }

    private static void buttons(View view, List<Button> result) {
        if (view instanceof Button) result.add((Button) view);
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) buttons(((ViewGroup) view).getChildAt(i), result);
    }

    private static EditText search(View view) {
        if (view instanceof EditText) return (EditText) view;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            EditText found = search(((ViewGroup) view).getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    private static SettingsDialog show(Activity activity) {
        SettingsDialog dialog = new SettingsDialog();
        dialog.show(activity.getFragmentManager(), "hushtelegram_settings");
        activity.getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        return dialog;
    }

    private static HushTelegramPreferenceFragment page(SettingsDialog dialog) {
        return (HushTelegramPreferenceFragment) dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
    }
}
