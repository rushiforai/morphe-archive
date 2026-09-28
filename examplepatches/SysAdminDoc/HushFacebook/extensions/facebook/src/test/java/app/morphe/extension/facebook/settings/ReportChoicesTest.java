/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.preference.Preference;
import android.text.Layout;
import android.util.TypedValue;
import android.view.View;
import android.widget.ListView;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.util.EnumSet;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Export diagnostic report's two choices, as inset cards the list measures at the height it shows
 * them, on a phone 411 dp wide with native text measuring. Styling Android's own rows after the
 * dialog was shown cut the second choice off, and at twice the text size the buttons covered it;
 * the last test here does that once more to show the check below catches it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "w411dp-h891dp-xxhdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@SuppressWarnings("deprecation")
public class ReportChoicesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Built by the first dialog a test opens, after it has set the text size it wants. */
    private ActivityController<Activity> controller;

    @Before
    public void everyPatchIn() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
    }

    @After
    public void restore() {
        if (controller != null) controller.close();
        PatchFamily.inBuildForTests = null;
        ScreenColors.shown = null;
        RuntimeEnvironment.setFontScale(1f);
        LogBufferManager.clearLogBuffer();
        ShadowToast.reset();
    }

    @Test
    public void bothChoicesShowAsInsetCardsAboveTheButtons() {
        assertCardsShowWhole(1f);
    }

    @Test
    public void atTwiceTheTextSizeBothCardsStillShowAboveTheButtons() {
        assertCardsShowWhole(2f);
    }

    @Test
    @Config(qualifiers = "+ar-rXB-ldrtl")
    public void inRightToLeftAtTwiceTheTextSizeBothCardsStillShow() {
        assertCardsShowWhole(2f);
    }

    /** A card is the choice: tapping the first copies the quick report and closes the dialog. */
    @Test
    public void tappingACardRunsItsChoice() throws Exception {
        LogBufferManager.appendEvent(DiagnosticCategory.OTHER, "Probe", "INFO", "something to report");
        AlertDialog dialog = openChoices();
        ListView list = dialog.getListView();
        assertTrue(list.performItemClick(list.getChildAt(0), 0, list.getItemIdAtPosition(0)));
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        assertFalse("the dialog stayed open", dialog.isShowing());
        assertEquals("Diagnostic report copied to the clipboard.", ShadowToast.getTextOfLatestToast());
    }

    /**
     * The control. Android's own two rows, styled after show() the way it was tried on 2026-09-26: the
     * list measures new rows it builds itself, without the styling, and shows the styled ones in that
     * height. The check the cards pass has to fail here, or it proves nothing about them.
     */
    @Test
    public void rowsStyledAfterShowAreCutOffAndTheCheckSaysSo() {
        RuntimeEnvironment.setFontScale(2f);
        AlertDialog stock = new AlertDialog.Builder(HushfacebookPreferenceFragment.themed(activity()))
                .setTitle("Export diagnostic report")
                .setItems(new CharSequence[]{"Copy quick report\nCopy a short report to the clipboard.",
                        "Save full report\nSave the full report in Download/Morphe."}, null)
                .setNegativeButton("Cancel", null)
                .show();
        ShadowLooper.idleMainLooper();
        assertNull("the unstyled list doesn't fit to begin with", whyNotWhole(stock));

        ListView list = stock.getListView();
        for (int index = 0; index < list.getChildCount(); index++) {
            View row = list.getChildAt(index);
            GradientDrawable surface = new GradientDrawable();
            surface.setCornerRadius(dp(12));
            row.setBackground(new InsetDrawable(surface, dp(16), dp(4), dp(16), dp(4)));
            row.setPaddingRelative(dp(32), dp(16), dp(32), dp(16));
            row.setMinimumHeight(dp(72));
        }
        list.requestLayout();
        ShadowLooper.idleMainLooper();
        assertNotNull("rows styled after show() came out whole", whyNotWhole(stock));
        stock.dismiss();
    }

    /** Opens the dialog at [fontScale], and holds it to everything the cards promise. */
    private void assertCardsShowWhole(float fontScale) {
        RuntimeEnvironment.setFontScale(fontScale);
        AlertDialog dialog = openChoices();
        assertEquals(fontScale, activity().getResources().getConfiguration().fontScale, 0f);
        ListView list = dialog.getListView();
        assertTrue("the choices aren't cards: " + list.getAdapter(), list.getAdapter() instanceof ChoiceCards);
        assertEquals(2, list.getAdapter().getCount());
        assertNull(whyNotWhole(dialog));

        int wrapped = 0;
        for (int index = 0; index < list.getChildCount(); index++) {
            View card = list.getChildAt(index);
            assertTrue(card.getClass().getName(), card instanceof ChoiceCards.Card);
            // Inset from the list's sides and from the next card, over a surface with an edge.
            assertTrue(card.getBackground() instanceof RippleDrawable);
            InsetDrawable inset = (InsetDrawable) ((RippleDrawable) card.getBackground()).getDrawable(0);
            Rect insets = new Rect();
            inset.getPadding(insets);
            assertEquals(new Rect(dp(16), dp(4), dp(16), dp(4)), insets);
            assertTrue(inset.getDrawable() instanceof GradientDrawable);
            assertTrue("less than 48 dp to tap", card.getHeight() - 2 * dp(4) >= dp(48));
            // The text sits inside the card's surface, clear of its edge.
            Rect surface = new Rect(dp(16), dp(4), card.getWidth() - dp(16), card.getHeight() - dp(4));
            for (TextView text : new TextView[]{((ChoiceCards.Card) card).name, ((ChoiceCards.Card) card).detail}) {
                assertEquals("\"" + text.getText() + "\" was cut off", 0, cutOff(text));
                if (text.getLineCount() > 1) wrapped++;
                Rect bounds = new Rect();
                text.getDrawingRect(bounds);
                ((android.view.ViewGroup) card).offsetDescendantRectToMyCoords(text, bounds);
                assertTrue("\"" + text.getText() + "\" runs to the card's edge: " + bounds
                        + " in " + surface, bounds.left >= surface.left + dp(12) && bounds.right <= surface.right - dp(12));
                assertTrue("\"" + text.getText() + "\" runs to the card's top or bottom",
                        bounds.top >= surface.top + dp(8) && bounds.bottom <= surface.bottom - dp(8));
            }
        }
        if (fontScale > 1f) assertTrue("nothing wrapped at twice the text size, so this proves little", wrapped > 0);
    }

    /**
     * Null when both choices show whole: laid out at the height they were measured, inside the
     * list, with nothing left to scroll to, and above the dialog's buttons. Otherwise what's wrong.
     */
    private static String whyNotWhole(AlertDialog dialog) {
        ListView list = dialog.getListView();
        if (list.getChildCount() != list.getAdapter().getCount()) {
            return list.getChildCount() + " of " + list.getAdapter().getCount() + " choices laid out";
        }
        int shown = list.getHeight() - list.getPaddingBottom();
        for (int index = 0; index < list.getChildCount(); index++) {
            View row = list.getChildAt(index);
            if (row.getTop() < list.getPaddingTop() || row.getBottom() > shown) {
                return "choice " + index + " runs " + row.getTop() + ".." + row.getBottom() + " in a list showing "
                        + list.getPaddingTop() + ".." + shown;
            }
        }
        if (list.canScrollVertically(1) || list.canScrollVertically(-1)) return "the list scrolls";
        int[] listAt = new int[2];
        list.getLocationInWindow(listAt);
        View buttons = (View) dialog.getButton(AlertDialog.BUTTON_NEGATIVE).getParent();
        int[] buttonsAt = new int[2];
        buttons.getLocationInWindow(buttonsAt);
        int lastBottom = listAt[1] + list.getChildAt(list.getChildCount() - 1).getBottom();
        if (lastBottom > buttonsAt[1]) return "the buttons start at " + buttonsAt[1] + ", over a choice that ends at " + lastBottom;
        return null;
    }

    private AlertDialog openChoices() {
        SettingsDialog settings = SettingsL10nTest.show(activity());
        Preference export = SettingsL10nTest.pageOf(settings).findPreference("action_export_diagnostic_report");
        assertNotNull("no export row", export);
        export.getOnPreferenceClickListener().onPreferenceClick(export);
        ShadowLooper.idleMainLooper();
        AlertDialog dialog = (AlertDialog) ShadowAlertDialog.getLatestDialog();
        assertNotNull("the export row opened no dialog", dialog);
        assertTrue(dialog.isShowing());
        return dialog;
    }

    private Activity activity() {
        if (controller == null) controller = Robolectric.buildActivity(Activity.class).setup();
        return controller.get();
    }

    /** How many characters [text] leaves off behind an ellipsis. */
    private static int cutOff(TextView text) {
        Layout layout = text.getLayout();
        assertNotNull("\"" + text.getText() + "\" was never laid out", layout);
        int cut = 0;
        for (int line = 0; line < layout.getLineCount(); line++) cut += layout.getEllipsisCount(line);
        return cut;
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                activity().getResources().getDisplayMetrics()));
    }
}
