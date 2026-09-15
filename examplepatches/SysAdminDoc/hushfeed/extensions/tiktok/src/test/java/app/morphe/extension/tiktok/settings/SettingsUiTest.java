package app.morphe.extension.tiktok.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.drawable.Drawable;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.CheckedTextView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.UiCapture;
import app.morphe.extension.tiktok.settings.preference.SettingsUi;
import app.morphe.extension.tiktok.settings.preference.categories.DebugPreferenceCategory;

import java.lang.reflect.Field;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "w480dp-h960dp-night-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@SuppressWarnings("deprecation")
public class SettingsUiTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    public static class DialogActivity extends Activity {
        @Override
        protected void onCreate(android.os.Bundle state) {
            boolean dark = (getResources().getConfiguration().uiMode & 0x30) == 0x20;
            setTheme(dark ? android.R.style.Theme_Material_NoActionBar
                    : android.R.style.Theme_Material_Light_NoActionBar);
            Utils.setIsDarkModeEnabled(dark);
            super.onCreate(state);
        }
    }

    public static class PreferenceDialogActivity extends PreferenceActivity {
        @Override
        protected void onCreate(android.os.Bundle state) {
            boolean dark = (getResources().getConfiguration().uiMode & 0x30) == 0x20;
            setTheme(dark ? android.R.style.Theme_Material_NoActionBar
                    : android.R.style.Theme_Material_Light_NoActionBar);
            Utils.setIsDarkModeEnabled(dark);
            super.onCreate(state);
        }
    }

    @After
    public void restoreDarkMode() {
        Utils.setIsDarkModeEnabled(true);
    }

    @Test
    public void sharedTextControlsExposeTheirDisabledStateAndActionRole() {
        try (var owner = Robolectric.buildActivity(DialogActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);

            TextView label = SettingsUi.text(
                    activity, "Save", 14, SettingsUi.accent(), android.graphics.Typeface.BOLD);
            assertEquals(SettingsUi.accent(), label.getCurrentTextColor());
            label.setEnabled(false);
            assertEquals("a disabled text control kept its active colour",
                    SettingsUi.textDisabled(), label.getCurrentTextColor());

            TextView action = SettingsUi.text(
                    activity, "Save", 14, SettingsUi.accent(), android.graphics.Typeface.BOLD);
            SettingsUi.styleTextAction(action, true);
            assertEquals(android.widget.Button.class.getName(),
                    action.createAccessibilityNodeInfo().getClassName());

            EditText field = new EditText(activity);
            SettingsUi.styleEditText(field);
            field.setEnabled(false);
            assertEquals("a disabled field kept its active text colour",
                    SettingsUi.textDisabled(), field.getCurrentTextColor());
        }
    }

    @Test
    public void sharedDialogHeadingAndResultStatusCarryAccessibilitySemantics() {
        try (var owner = Robolectric.buildActivity(DialogActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            TextView heading = SettingsUi.text(
                    activity, "Dialog title", 20, SettingsUi.textPrimary(), 1);
            SettingsUi.markDialogHeading(heading);
            assertTrue(heading.isAccessibilityHeading());

            TextView count = SettingsUi.resultCount(activity, "test_result_count");
            SettingsUi.setResultCount(count, 2);
            assertEquals("2 results", count.getText().toString());
            assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE,
                    count.getAccessibilityLiveRegion());
        }
    }

    @Test
    @Config(sdk = 23, qualifiers = "w480dp-h960dp-night-mdpi")
    public void dialogHeadingKeepsItsSemanticsBeforeThePlatformHeadingApi() {
        try (var owner = Robolectric.buildActivity(DialogActivity.class).setup().visible()) {
            Activity activity = owner.get();
            TextView heading = SettingsUi.text(
                    activity, "Dialog title", 20, SettingsUi.textPrimary(), 1);
            SettingsUi.markDialogHeading(heading);
            activity.setContentView(heading);

            AccessibilityNodeInfo info = heading.createAccessibilityNodeInfo();
            assertNotNull("the legacy heading has no collection item metadata",
                    info.getCollectionItemInfo());
            assertTrue("the legacy collection item is not marked as a heading",
                    info.getCollectionItemInfo().isHeading());
        }
    }

    @Test
    public void darkSingleChoiceUsesOneRadioAndNativeSelection() throws Exception {
        assertSingleChoice("dialogs/dark/single-choice.png");
    }

    @Test
    @Config(qualifiers = "w480dp-h960dp-notnight-mdpi")
    public void lightSingleChoiceUsesOneRadioAndNativeSelection() throws Exception {
        assertSingleChoice("dialogs/light/single-choice.png");
    }

    private void assertSingleChoice(String screenshotPath) throws Exception {
        try (var owner = Robolectric.buildActivity(DialogActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            AlertDialog dialog = new AlertDialog.Builder(activity)
                    .setTitle("Playback speed")
                    .setSingleChoiceItems(new String[]{"0.5x", "1x"}, 0, (ignored, which) -> {})
                    .setNegativeButton("Cancel", null)
                    .create();
            dialog.show();
            SettingsUi.styleStandardAlertDialog(dialog);
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            ListView list = dialog.getListView();
            assertEquals(ListView.CHOICE_MODE_SINGLE, list.getChoiceMode());
            CheckedTextView selected = checkedTextView(list, 0);
            CheckedTextView unselected = checkedTextView(list, 1);
            assertNotNull(selected);
            assertNotNull(unselected);
            assertTrue(selected.isChecked());
            assertFalse(unselected.isChecked());
            assertRadio(selected, true);
            assertRadio(unselected, true);
            assertTrue(selected.getCheckMarkDrawable() == null);
            assertTrue(unselected.getCheckMarkDrawable() == null);
            UiCapture.save(dialog.getWindow().getDecorView(), screenshotPath);

            list.performItemClick(unselected, 1, list.getAdapter().getItemId(1));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertTrue(list.isItemChecked(1));
            assertTrue(unselected.isChecked());
            assertEquals("1x", list.getAdapter().getItem(1));
        }
    }

    @Test
    public void darkIncludedDiagnosticsPickerShowsItsRealChoicesAndActions() throws Exception {
        assertIncludedDiagnosticsPicker("dialogs/dark/multi-choice.png");
    }

    @Test
    @Config(qualifiers = "w480dp-h960dp-notnight-mdpi")
    public void lightIncludedDiagnosticsPickerShowsItsRealChoicesAndActions() throws Exception {
        assertIncludedDiagnosticsPicker("dialogs/light/multi-choice.png");
    }

    private void assertIncludedDiagnosticsPicker(String screenshotPath) throws Exception {
        boolean diagnosticsWereEnabled = SettingsStatus.diagnosticsEnabled;
        String savedFilter = BaseSettings.DEBUG_LOG_FILTERS.get();
        try {
            SettingsStatus.diagnosticsEnabled = true;
            BaseSettings.DEBUG_LOG_FILTERS.save("downloads,errors");

            try (var owner = Robolectric.buildActivity(PreferenceDialogActivity.class)
                    .setup().visible()) {
                PreferenceActivity activity = owner.get();
                Utils.setContext(activity);
                PreferenceScreen screen = activity.getPreferenceManager()
                        .createPreferenceScreen(activity);
                new DebugPreferenceCategory(activity, screen);
                activity.setPreferenceScreen(screen);

                Preference row = screen.findPreference("action_included_diagnostics");
                assertNotNull("the shipped Included diagnostics row is gone", row);
                assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
                AlertDialog dialog = (AlertDialog)
                        org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
                Shadows.shadowOf(Looper.getMainLooper()).idle();

                assertEquals("Include diagnostic events",
                        Shadows.shadowOf(dialog).getTitle().toString());
                assertEquals("Apply", dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                        .getText().toString());
                assertEquals("Cancel", dialog.getButton(AlertDialog.BUTTON_NEGATIVE)
                        .getText().toString());
                int visibleActions = 0;
                for (int which : new int[]{AlertDialog.BUTTON_POSITIVE,
                        AlertDialog.BUTTON_NEGATIVE, AlertDialog.BUTTON_NEUTRAL}) {
                    android.widget.Button button = dialog.getButton(which);
                    if (button == null || button.getVisibility() != View.VISIBLE) continue;
                    visibleActions++;
                    assertFalse("the invented Done action came back",
                            "Done".contentEquals(button.getText()));
                }
                assertEquals("the real picker does not have exactly Apply and Cancel",
                        2, visibleActions);

                ListView list = dialog.getListView();
                assertEquals(ListView.CHOICE_MODE_MULTIPLE, list.getChoiceMode());
                String[] expected = {
                        "All events", "Follow probe", "Downloads", "Feed and navigation",
                        "Feature Gate Lab", "Settings", "Errors", "Other"
                };
                assertEquals("the screenshot no longer shows every shipped choice",
                        expected.length, list.getAdapter().getCount());
                for (int i = 0; i < expected.length; i++) {
                    assertEquals(expected[i], String.valueOf(list.getAdapter().getItem(i)));
                }

                CheckedTextView selected = checkedTextView(list, 2);
                CheckedTextView unselected = checkedTextView(list, 1);
                assertNotNull(selected);
                assertNotNull(unselected);
                assertTrue(selected.isChecked());
                assertFalse(unselected.isChecked());
                assertRadio(selected, false);
                assertRadio(unselected, false);
                assertTrue(selected.getCheckMarkDrawable() == null);
                assertTrue(unselected.getCheckMarkDrawable() == null);
                UiCapture.save(dialog.getWindow().getDecorView(), screenshotPath);

                list.performItemClick(unselected, 1, list.getAdapter().getItemId(1));
                Shadows.shadowOf(Looper.getMainLooper()).idle();
                assertTrue(list.isItemChecked(1));
                assertTrue(unselected.isChecked());
                assertTrue(dialog.isShowing());
            }
        } finally {
            BaseSettings.DEBUG_LOG_FILTERS.save(savedFilter);
            SettingsStatus.diagnosticsEnabled = diagnosticsWereEnabled;
        }
    }

    private static CheckedTextView checkedTextView(ListView list, int position) {
        View row = list.getChildAt(position);
        return findCheckedTextView(row);
    }

    private static CheckedTextView findCheckedTextView(View view) {
        if (view instanceof CheckedTextView) {
            return (CheckedTextView) view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                CheckedTextView result = findCheckedTextView(group.getChildAt(i));
                if (result != null) {
                    return result;
                }
            }
        }
        return null;
    }

    /**
     * A chosen row looks different from the one beside it, in both themes.
     *
     * <p>The row is told it is chosen with {@code setActivated}, and the background it draws
     * ignored that: the Lab's selection bar said "2 gates selected" over rows that looked exactly
     * like the rest, and Enable, Disable and Reset then acted on gates nobody could see.
     */
    @Test
    public void aChosenRowIsDrawnDifferentlyFromItsNeighbour() {
        for (boolean dark : new boolean[]{true, false}) {
            Utils.setIsDarkModeEnabled(dark);
            Activity activity = Robolectric.buildActivity(DialogActivity.class).setup().get();
            Utils.setContext(activity);

            int plain = centreOf(SettingsUi.groupedRow(activity, true, true), false);
            int chosen = centreOf(SettingsUi.groupedRow(activity, true, true), true);

            assertNotEquals("a chosen row is painted exactly like an unchosen one, dark=" + dark,
                    plain, chosen);
            // And it is the accent the press already uses, over the surface it already had.
            assertEquals("the chosen fill is not the accent the ripple leaves, dark=" + dark,
                    blend(SettingsUi.activatedFill(), SettingsUi.surface()), chosen);
        }
    }

    /** The colour a row's background paints in the middle, with or without the chosen state. */
    private static int centreOf(Drawable background, boolean activated) {
        background.setState(activated
                ? new int[]{android.R.attr.state_activated} : new int[0]);
        background.setBounds(0, 0, 120, 80);
        android.graphics.Bitmap bitmap =
                android.graphics.Bitmap.createBitmap(120, 80, android.graphics.Bitmap.Config.ARGB_8888);
        background.draw(new android.graphics.Canvas(bitmap));
        int pixel = bitmap.getPixel(60, 40);
        bitmap.recycle();
        return pixel;
    }

    /** What an alpha colour comes out as over an opaque one, the way the canvas composites it. */
    private static int blend(int over, int under) {
        float alpha = android.graphics.Color.alpha(over) / 255f;
        int red = Math.round(android.graphics.Color.red(over) * alpha
                + android.graphics.Color.red(under) * (1 - alpha));
        int green = Math.round(android.graphics.Color.green(over) * alpha
                + android.graphics.Color.green(under) * (1 - alpha));
        int blue = Math.round(android.graphics.Color.blue(over) * alpha
                + android.graphics.Color.blue(under) * (1 - alpha));
        return android.graphics.Color.argb(255, red, green, blue);
    }

    private static void assertRadio(CheckedTextView view, boolean expected) throws Exception {
        Drawable[] drawables = view.getCompoundDrawablesRelative();
        Drawable drawable = drawables[0];
        assertNotNull(drawable);
        assertEquals("DialogCheckMarkDrawable", drawable.getClass().getSimpleName());
        Field field = drawable.getClass().getDeclaredField("radio");
        field.setAccessible(true);
        assertEquals(expected, field.getBoolean(drawable));
    }
}
