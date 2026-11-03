/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import static app.hushpinterest.extension.pinterest.settings.SaveButtonColorSetting.SAVE_BUTTON_COLOR;

import android.app.Activity;
import android.app.AlertDialog;
import android.widget.EditText;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/** The Save button color: how what's typed is read and saved, and the Interface page row that edits it. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SaveButtonColorSettingTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PauseForTests.resume();
        SAVE_BUTTON_COLOR.resetToDefault();
        SaveButtonColorPreference.shown = null;
    }

    @Test
    public void sixDigitsOrThreeWithOrWithoutTheHashAreAColor() {
        assertEquals("#3366FF", SaveButtonColorSetting.clean("#3366ff"));
        assertEquals("#3366FF", SaveButtonColorSetting.clean(" 3366FF "));
        assertEquals("#3366FF", SaveButtonColorSetting.clean("#36f"));
        assertEquals("#FFCC00", SaveButtonColorSetting.clean("# fc0"));
        assertEquals("", SaveButtonColorSetting.clean("  "));
        for (String typed : new String[]{"#", "blue", "#12345", "#1234567", "#GG0000", "#3366FF80", "rgb(1,2,3)"}) {
            assertNull(typed, SaveButtonColorSetting.clean(typed));
        }
        assertEquals(Integer.valueOf(0xFF3366FF), SaveButtonColorSetting.color("#3366FF"));
        assertNull(SaveButtonColorSetting.color(""));
    }

    @Test
    public void everySaveIsCleanedAndAPauseReadsAsPinterestsRed() {
        SAVE_BUTTON_COLOR.save("36f");
        assertEquals("#3366FF", SAVE_BUTTON_COLOR.savedValue());
        SAVE_BUTTON_COLOR.save("not a color");
        assertEquals("what isn't a color saves as none", "", SAVE_BUTTON_COLOR.savedValue());
        SAVE_BUTTON_COLOR.save("#FC0");
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertEquals("", SAVE_BUTTON_COLOR.get());
        assertEquals("#FFCC00", SAVE_BUTTON_COLOR.savedValue());
    }

    // ---- The row --------------------------------------------------------------------------------

    private interface Check {
        void run(Activity activity, SaveButtonColorPreference row) throws Exception;
    }

    private static void onRow(Check check) throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            check.run(activity, new SaveButtonColorPreference(activity));
        }
    }

    private static AlertDialog tap(SaveButtonColorPreference row) {
        row.getOnPreferenceClickListener().onPreferenceClick(row);
        ShadowLooper.idleMainLooper();
        assertNotNull("no dialog opened", SaveButtonColorPreference.shown);
        return SaveButtonColorPreference.shown;
    }

    @Test
    public void aColorTypedIsSavedAndTheRowSaysIt() throws Exception {
        onRow((activity, row) -> {
            assertEquals("action_save_button_color", row.getKey());
            assertEquals("Save button color", row.getTitle());
            assertEquals("Paints the red Save button on a pin you open in a color you pick. It's Pinterest's red "
                    + "for now.", row.getSummary());
            AlertDialog dialog = tap(row);
            assertFalse("Clear shows with nothing to clear", dialog.getButton(AlertDialog.BUTTON_NEUTRAL).isShown());
            EditText field = dialog.findViewById(android.R.id.edit);
            field.setText("#36f");
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertEquals("#3366FF", SAVE_BUTTON_COLOR.savedValue());
            assertEquals("The Save button turns #3366FF on the next pin you open.", ShadowToast.getTextOfLatestToast());
            assertEquals("Painting the Save button #3366FF. Tap to change it. The change shows on the next pin you "
                    + "open.", row.getSummary());
        });
    }

    @Test
    public void somethingThatIsntAColorChangesNothingAndSaysSo() throws Exception {
        SAVE_BUTTON_COLOR.save("#3366FF");
        onRow((activity, row) -> {
            AlertDialog dialog = tap(row);
            EditText field = dialog.findViewById(android.R.id.edit);
            assertEquals("#3366FF", field.getText().toString());
            field.setText("blue");
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertEquals("#3366FF", SAVE_BUTTON_COLOR.savedValue());
            assertEquals("That isn't a hex color, so nothing changed. Try one like #3366FF.",
                    ShadowToast.getTextOfLatestToast());
        });
    }

    @Test
    public void clearGoesBackToPinterestsRed() throws Exception {
        SAVE_BUTTON_COLOR.save("#3366FF");
        onRow((activity, row) -> {
            AlertDialog dialog = tap(row);
            assertTrue(dialog.getButton(AlertDialog.BUTTON_NEUTRAL).isShown());
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
            ShadowLooper.idleMainLooper();
            assertEquals("", SAVE_BUTTON_COLOR.savedValue());
            assertEquals("The Save button is back to Pinterest's red on the next pin you open.",
                    ShadowToast.getTextOfLatestToast());
            assertNull(SaveButtonColorPreference.shown);
        });
    }
}
