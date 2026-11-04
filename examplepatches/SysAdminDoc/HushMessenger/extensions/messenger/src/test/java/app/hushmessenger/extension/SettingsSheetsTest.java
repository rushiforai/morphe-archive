package app.hushmessenger.extension;

import android.app.Dialog;
import android.content.res.ColorStateList;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;
import static org.junit.Assert.*;

/** HushGram's dialog parts on HushMessenger's sheets: the title, message, buttons, fields and picked choices. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {29, 36}, qualifiers = "en-rUS-w390dp-h844dp-mdpi")
public class SettingsSheetsTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
    }

    @After public void closeDialog() {
        Dialog dialog = ShadowDialog.getLatestDialog();
        if (dialog != null && dialog.isShowing()) dialog.dismiss();
    }

    @Test public void aSheetWearsHushGramsDialogTypeOnTheDialogFill() {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                SettingsUi ui = new SettingsUi(screen.get(), light);
                Dialog dialog = open(screen.get());
                View root = dialog.getWindow().getDecorView();
                View sheet = root.findViewWithTag("settings_dialog");
                assertEquals(ui.dialog, ((ColorDrawable) sheet.getBackground()).getColor());
                TextView title = root.findViewWithTag("dialog_title");
                assertEquals(20f, title.getTextSize(), 0.01f);
                assertTrue("The title is in the gradient", ShimmerTitle.wears(title));
                assertTrue("and wraps", title.getMaxLines() > 1);
                assertTrue(title.isAccessibilityHeading());
                TextView hint = root.findViewWithTag("dialog_hint");
                assertEquals(14f, hint.getTextSize(), 0.01f);
                assertEquals(ui.muted, hint.getCurrentTextColor());
                assertEquals(2f, hint.getLineSpacingExtra(), 0.01f);
            }
        }
    }

    @Test public void theKeyboardResizesASheetOnceItShows() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Dialog dialog = open(screen.get());
            assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,
                dialog.getWindow().getAttributes().softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST);
        }
    }

    @Test public void sheetButtonsAreHushGramsPrimaryAndSecondary() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsUi ui = new SettingsUi(screen.get(), false);
            View root = open(screen.get()).getWindow().getDecorView();
            Button save = root.findViewWithTag("auto_reply_save"), cancel = root.findViewWithTag("auto_reply_cancel");
            for (Button button : new Button[] {save, cancel}) {
                assertTrue(button.getMinimumHeight() >= 48);
                assertTrue(button.getMinimumWidth() >= 64);
                assertEquals(16f, button.getTextSize(), 0.01f);
                assertNull("Sentence case", button.getTransformationMethod());
                assertTrue("Wraps", button.getMaxLines() > 1);
            }
            assertEquals("Primary: on-accent text on the accent fill", ui.onAccent, save.getCurrentTextColor());
            assertEquals("Secondary: heading-color text on the card fill", ui.heading, cancel.getCurrentTextColor());
        }
    }

    @Test public void aFieldIsHushGramsTwelveDpBoxWithItsHint() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsUi ui = new SettingsUi(screen.get(), false);
            // The single-line field; the reply's two-line minimum is counted in lines, not pixels.
            EditText when = open(screen.get()).getWindow().getDecorView().findViewWithTag("auto_reply_when");
            assertEquals(16f, when.getTextSize(), 0.01f);
            assertTrue("min height " + when.getMinHeight(), when.getMinHeight() >= 48);
            assertEquals(12, when.getPaddingLeft());
            assertEquals(10, when.getPaddingTop());
            assertEquals(ui.hint, when.getCurrentHintTextColor());
        }
    }

    @Test public void thePickedChoiceWearsAThirteenPercentAccentTint() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsUi ui = new SettingsUi(screen.get(), false);
            View root = screen.get().getWindow().getDecorView();
            RadioButton stock = root.findViewWithTag("bubble_stock");
            Drawable states = ((RippleDrawable) stock.getBackground()).getDrawable(0);
            states.setState(new int[] {android.R.attr.state_enabled, android.R.attr.state_checked});
            GradientDrawable surface = (GradientDrawable) states.getCurrent();
            ColorStateList fill = surface.getColor();
            int picked = fill.getColorForState(new int[] {android.R.attr.state_enabled, android.R.attr.state_checked}, 0);
            assertEquals((ui.accent & 0x00ffffff) | 0x22000000, picked);
            assertEquals("An unpicked choice is clear until pressed", 0,
                fill.getColorForState(new int[] {android.R.attr.state_enabled}, 1) >>> 24);
            assertEquals(8f, surface.getCornerRadius(), 0f);
        }
    }

    private static Dialog open(SettingsActivity activity) {
        activity.getWindow().getDecorView().findViewWithTag("auto_reply_edit").performClick();
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertTrue(dialog.isShowing());
        return dialog;
    }
}
