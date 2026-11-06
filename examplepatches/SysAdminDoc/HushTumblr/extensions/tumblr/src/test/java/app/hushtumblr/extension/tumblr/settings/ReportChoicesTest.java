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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Build;
import android.os.Environment;
import android.graphics.Rect;
import android.graphics.Bitmap;
import android.graphics.Canvas;
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
import java.io.File;
import java.io.FileOutputStream;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.DiagnosticCategory;
import app.hushtumblr.extension.shared.settings.preference.LogBufferManager;

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
        RuntimeEnvironment.setFontScale(1f);
        LogBufferManager.clearLogBuffer();
        ShadowToast.reset();
    }

    @Test
    public void bothChoicesShowAsInsetCardsAboveTheButtons() {
        assertCardsShowWhole(1f);
    }

    @Test
    public void reportChoicesCloseWithARecreatedParent() throws Exception {
        AlertDialog choices = openChoices();
        controller.recreate();
        ShadowLooper.idleMainLooper();
        assertFalse("old choices outlived the parent", choices.isShowing());
        assertStaleChoicesDoNothing(choices);
    }

    @Test
    public void reportChoicesCloseWithADismissedParent() throws Exception {
        AlertDialog choices = openChoices();
        SettingsDialog parent = (SettingsDialog) activity().getFragmentManager()
                .findFragmentByTag("hushtumblr_settings");
        parent.dismiss();
        assertFalse("choices outlived the dismissed parent", choices.isShowing());
        assertStaleChoicesDoNothing(choices);
    }

    @Test
    public void reportChoicesCloseWithADismissedParentWindow() throws Exception {
        AlertDialog choices = openChoices();
        SettingsDialog parent = (SettingsDialog) activity().getFragmentManager()
                .findFragmentByTag("hushtumblr_settings");
        android.app.Dialog window = parent.getDialog();
        window.dismiss();
        assertFalse("choices outlived the dismissed parent window", choices.isShowing());
        assertStaleChoicesDoNothing(choices);
        window.dismiss(); // A retained native window may be dismissed again after fragment removal.
    }

    private void assertStaleChoicesDoNothing(AlertDialog choices) throws Exception {
        ShadowToast.reset();
        choices.getListView().performItemClick(null, 0, 0);
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        assertNull("a retained callback exported after its parent closed", ShadowToast.getTextOfLatestToast());
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

    /**
     * A card is the choice: tapping the first copies the quick report and closes the dialog. The
     * result shows under the row, where a toast's two lines can't cut it off, until the next tap.
     */
    @Test
    public void tappingACardRunsItsChoice() throws Exception {
        LogBufferManager.appendEvent(DiagnosticCategory.OTHER, "Probe", "INFO", "something to report");
        AlertDialog dialog = openChoices();
        ListView list = dialog.getListView();
        assertTrue(list.performItemClick(list.getChildAt(0), 0, list.getItemIdAtPosition(0)));
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
        assertFalse("the dialog stayed open", dialog.isShowing());
        Preference export = SettingsL10nTest.pageOf((SettingsDialog) activity().getFragmentManager()
                .findFragmentByTag("hushtumblr_settings")).findPreference(LogBufferManager.EXPORT_ROW_KEY);
        assertEquals("Diagnostic report copied to the clipboard.", SettingsFeedbackTest.message(export));
        assertFalse("also said in a toast",
                "Diagnostic report copied to the clipboard.".equals(ShadowToast.getTextOfLatestToast()));

        export.getOnPreferenceClickListener().onPreferenceClick(export);
        ShadowLooper.idleMainLooper();
        assertNull("the last report's result outlived the next tap", SettingsFeedbackTest.message(export));
        ((AlertDialog) ShadowAlertDialog.getLatestDialog()).dismiss();
    }

    /** A clear that couldn't start says what to do under its row, not in a toast that fades. */
    @Test
    public void aClearThatCannotStartSaysSoUnderTheRow() throws Exception {
        SettingsDialog settings = SettingsL10nTest.show(activity());
        Preference clear = SettingsL10nTest.pageOf(settings).findPreference(LogBufferManager.CLEAR_ROW_KEY);
        assertNotNull("no clear row", clear);
        SettingsL10nTest.openPageOf(SettingsL10nTest.pageOf(settings), LogBufferManager.CLEAR_ROW_KEY);
        try (app.hushtumblr.extension.shared.WorkerPoolForTests full =
                     app.hushtumblr.extension.shared.WorkerPoolForTests.fill()) {
            clear.getOnPreferenceClickListener().onPreferenceClick(clear);
            ShadowLooper.idleMainLooper();
        }
        assertEquals("Couldn't start that. Try again in a moment.", SettingsFeedbackTest.message(clear));
        assertTrue("the row stayed busy", clear.isEnabled());
        assertFalse("also said in a toast",
                "Couldn't start that. Try again in a moment.".equals(ShadowToast.getTextOfLatestToast()));
    }

    @Test @Config(sdk = {29, 30})
    public void saveChoiceAndPreferenceNameTheWritersDirectory() throws Exception {
        SettingsDialog settings = SettingsL10nTest.show(activity());
        Preference export = SettingsL10nTest.pageOf(settings).findPreference("action_export_diagnostic_report");
        String directory = Environment.DIRECTORY_DOWNLOADS + "/Morphe";
        String isolated = app.hushtumblr.extension.shared.L10n.isolate(directory);
        assertNotNull("no export row", export);
        assertTrue(export.getSummary().toString(), export.getSummary().toString().contains(isolated));
        export.getOnPreferenceClickListener().onPreferenceClick(export);
        ShadowLooper.idleMainLooper();
        AlertDialog dialog = (AlertDialog) ShadowAlertDialog.getLatestDialog();
        assertNotNull("the export row opened no dialog", dialog);
        ChoiceCards.Card save = (ChoiceCards.Card) dialog.getListView().getChildAt(1);
        assertEquals("Save the full report in " + isolated + ".", save.detail.getText().toString());
        assertNull(whyNotWhole(dialog));
        View decor = dialog.getWindow().getDecorView();
        Bitmap image = Bitmap.createBitmap(decor.getWidth(), decor.getHeight(), Bitmap.Config.ARGB_8888);
        File folder = new File("build/reports/settings-design");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        try (FileOutputStream output = new FileOutputStream(new File(folder,
                "diagnostic-destination-api" + Build.VERSION.SDK_INT + ".png"))) {
            decor.draw(new Canvas(image));
            assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, output));
        } finally { image.recycle(); }
    }

    /**
     * The control. Android's own two rows, styled after show() the way it was tried on 2026-09-26: the
     * list measures new rows it builds itself, without the styling, and shows the styled ones in that
     * height. The check the cards pass has to fail here, or it proves nothing about them.
     */
    @Test
    public void rowsStyledAfterShowAreCutOffAndTheCheckSaysSo() {
        RuntimeEnvironment.setFontScale(2f);
        AlertDialog stock = new AlertDialog.Builder(HushTumblrPreferenceFragment.themed(activity()))
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
            int gap = dp(5);
            assertEquals(new Rect(dp(16), gap, dp(16), gap), insets);
            assertTrue(inset.getDrawable().getCurrent() instanceof GradientDrawable);
            assertTrue("less than 48 dp to tap", card.getHeight() - 2 * gap >= dp(48));
            // The text sits inside the card's surface, clear of its edge.
            Rect surface = new Rect(dp(16), gap, card.getWidth() - dp(16), card.getHeight() - gap);
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
        SettingsL10nTest.openPageOf(SettingsL10nTest.pageOf(settings), "action_export_diagnostic_report");
        export.getOnPreferenceClickListener().onPreferenceClick(export);
        ShadowLooper.idleMainLooper();
        AlertDialog dialog = (AlertDialog) ShadowAlertDialog.getLatestDialog();
        assertNotNull("the export row opened no dialog", dialog);
        assertTrue(dialog.isShowing());
        return dialog;
    }

    private Activity activity() {
        if (controller == null) controller = Robolectric.buildActivity(Activity.class).setup().visible();
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
