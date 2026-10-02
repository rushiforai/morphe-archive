/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.app.Activity;
import android.app.Fragment;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Switch;
import android.widget.TextView;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.hushtelegram.extension.shared.SettingsContextRule;

/**
 * WCAG 2.2 AA for what HushTelegram draws itself: the settings screen, its dialogs and its
 * switches, on the black page. Text needs 4.5:1 against what it sits on, a switch 3:1 against the
 * page (success criteria 1.4.3 and 1.4.11).
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class ScreenColorsTest {
    /** WCAG 2.2 AA for text smaller than 18pt, or 14pt bold. */
    static final double TEXT = 4.5;
    /** WCAG 2.2 AA for large text and for the parts of a control that show its state. */
    static final double NON_TEXT = 3.0;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
    }

    /** WCAG's relative luminance of an opaque sRGB colour, 0 for black to 1 for white. */
    static double luminance(int color) {
        double[] channels = new double[3];
        for (int shift = 16, i = 0; i < 3; shift -= 8, i++) {
            double value = ((color >> shift) & 0xFF) / 255.0;
            channels[i] = value <= 0.04045 ? value / 12.92 : Math.pow((value + 0.055) / 1.055, 2.4);
        }
        return 0.2126 * channels[0] + 0.7152 * channels[1] + 0.0722 * channels[2];
    }

    /** The WCAG contrast ratio of two opaque colours, 1 to 21. */
    static double contrast(int one, int two) {
        double a = luminance(one) + 0.05;
        double b = luminance(two) + 0.05;
        return Math.max(a, b) / Math.min(a, b);
    }

    /** Every pair on the screen and in its dialogs, by where it's drawn. */
    static Map<String, int[]> pairs(ScreenColors c) {
        Map<String, int[]> text = new LinkedHashMap<>();
        text.put("row title on its card", new int[]{c.title, c.card});
        text.put("title of a row a tap acts on, on its card", new int[]{c.heading, c.card});
        text.put("row summary on its card", new int[]{c.summary, c.card});
        text.put("section title on the page", new int[]{c.heading, c.background});
        text.put("title bar and back arrow on the page", new int[]{c.title, c.background});
        text.put("dialog title on the dialog", new int[]{c.title, c.dialog});
        text.put("dialog message on the dialog", new int[]{c.summary, c.dialog});
        // A dialog's choice cards are outlined cards in the card tone (ChoiceCards), so their text
        // is read against that.
        text.put("dialog choice's name on its card", new int[]{c.title, c.card});
        text.put("dialog choice's detail on its card", new int[]{c.summary, c.card});
        text.put("primary action text on its fill", new int[]{c.onAccent, c.accent});
        text.put("secondary action on the dialog", new int[]{c.secondaryActionText(), c.dialog});
        text.put("secondary recovery action on its card", new int[]{c.secondaryActionText(), c.card});
        return text;
    }

    static Map<String, int[]> controls(ScreenColors c) {
        Map<String, int[]> parts = new LinkedHashMap<>();
        parts.put("switch on, against its card", new int[]{c.accent, c.card});
        parts.put("switch off, against its card", new int[]{c.switchOff, c.card});
        // The thumb shows where the switch is, so it needs 3:1 against the track it sits on.
        parts.put("switch off's thumb, against its track", new int[]{c.offThumb(), c.switchOff});
        parts.put("chevron of a row a tap opens something from, against its card", new int[]{c.summary, c.card});
        return parts;
    }

    /** Fails naming the pair when a ratio is under what it needs. */
    static void assertMeets(String palette, Map<String, int[]> pairs, double needed) {
        for (Map.Entry<String, int[]> pair : pairs.entrySet()) {
            double ratio = contrast(pair.getValue()[0], pair.getValue()[1]);
            if (ratio < needed) {
                fail(String.format(java.util.Locale.ROOT, "%s: %s is %.2f:1, under %.1f:1 (#%08X on #%08X)",
                        palette, pair.getKey(), ratio, needed, pair.getValue()[0], pair.getValue()[1]));
            }
        }
    }

    /** The black page. Its dialogs' Cancel once read at 3.4:1, accent blue on the dialog's grey. */
    @Test
    public void theBlackPageMeetsAa() {
        assertMeets("black page", pairs(ScreenColors.DEFAULT), TEXT);
        assertMeets("black page", controls(ScreenColors.DEFAULT), NON_TEXT);
    }

    /** What the ratios actually are, so a reader of a failure elsewhere knows the margin. */
    @Test
    public void theBlackPagesRatios() {
        ScreenColors page = ScreenColors.DEFAULT;
        assertEquals(19.24, contrast(page.title, page.background), 0.01);
        assertEquals(9.50, contrast(page.summary, page.background), 0.01);
        assertEquals(8.58, contrast(page.heading, page.background), 0.01);
        assertEquals(4.85, contrast(page.onAccent, page.accent), 0.01);
        assertEquals(3.34, contrast(page.offThumb(), page.switchOff), 0.01);
    }

    /**
     * The negative control: a low-contrast pair has to fail the same check. Grey 40% on grey 50%
     * is legible to nobody.
     */
    @Test
    public void aLowContrastPairFails() {
        Map<String, int[]> weak = new LinkedHashMap<>();
        weak.put("#666666 on #808080", new int[]{0xFF666666, 0xFF808080});
        try {
            assertMeets("control", weak, TEXT);
        } catch (AssertionError expected) {
            assertTrue(expected.getMessage(), expected.getMessage().contains("#666666 on #808080"));
            // A pair that clears 3:1 and not 4.5:1 passes as a control and fails as text.
            Map<String, int[]> between = new LinkedHashMap<>();
            between.put("#808080 on white", new int[]{0xFF808080, Color.WHITE});
            assertMeets("control", between, NON_TEXT);
            try {
                assertMeets("control", between, TEXT);
            } catch (AssertionError alsoExpected) {
                return;
            }
            fail("#808080 on white passed as text at " + contrast(0xFF808080, Color.WHITE));
        }
        fail("a pair at " + contrast(0xFF666666, 0xFF808080) + ":1 passed");
    }

    /**
     * The screen is black, built on the dark Material theme, and every row it draws takes the
     * page's colours: titles and summaries that read on it, and switches in the accent.
     */
    @Test
    public void theScreenIsBlackAndEveryRowTakesItsColours() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        assertEquals(android.R.style.Theme_Material_NoActionBar, ScreenColors.THEME);
        ScreenColors colors = ScreenColors.DEFAULT;
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            SettingsDialog dialog = show(controller.get());
            assertEquals(Color.BLACK, ((ColorDrawable) dialog.getView().getBackground()).getColor());

            int titles = 0;
            int switches = 0;
            for (View row : rows(dialog)) {
                TextView title = row.findViewById(android.R.id.title);
                if (title == null) continue;
                int drawn = title.getCurrentTextColor();
                int enabledColor = drawn | 0xFF000000;
                assertTrue("\"" + title.getText() + "\" is " + Integer.toHexString(drawn),
                        enabledColor == colors.title || enabledColor == colors.heading);
                assertEquals(title.getText().toString(),
                        title.isEnabled() || !title.getTextColors().isStateful() ? 255 : 0x61, Color.alpha(drawn));
                assertTrue(contrast(enabledColor, colors.background) >= TEXT);
                titles++;
                TextView summary = row.findViewById(android.R.id.summary);
                if (summary != null && summary.getVisibility() == View.VISIBLE) {
                    int expected = summary.isEnabled() ? colors.summary : (colors.summary & 0x00FFFFFF) | 0x61000000;
                    assertEquals(expected, summary.getCurrentTextColor());
                }
                View widget = row.findViewById(android.R.id.switch_widget);
                if (widget instanceof Switch) {
                    assertNotNull(((Switch) widget).getThumbTintList());
                    assertEquals(colors.onAccent, ((Switch) widget).getThumbTintList()
                            .getColorForState(new int[]{android.R.attr.state_enabled, android.R.attr.state_checked}, 0));
                    assertEquals(colors.accent, ((Switch) widget).getTrackTintList()
                            .getColorForState(new int[]{android.R.attr.state_enabled, android.R.attr.state_checked}, 0));
                    assertEquals(ScreenColors.half(colors.accent), ((Switch) widget).getTrackTintList()
                            .getColorForState(new int[]{android.R.attr.state_checked}, 0));
                    switches++;
                }
            }
            assertTrue("only " + titles + " row titles were painted", titles > 10);
            // Hide ads, the two privacy switches, the release check, Pause and Debug logging.
            assertTrue("only " + switches + " switches were painted", switches >= 6);
        }
    }

    /**
     * The filled primary action keeps the framework button's own insets, 4dp at the sides and 6dp
     * above and below, like every Material button. The fill used to take the button's whole
     * bounds, which left it about 3dp from the dialog's bottom edge against 11dp at the side.
     */
    @Test
    public void theFilledDialogActionKeepsItsInsets() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            android.app.AlertDialog dialog = new android.app.AlertDialog.Builder(controller.get())
                    .setTitle("Import settings").setPositiveButton("Import", null).setNegativeButton("Cancel", null).create();
            dialog.show();
            try {
                ScreenColors.DEFAULT.paint(dialog);
                for (int which : new int[]{android.app.AlertDialog.BUTTON_POSITIVE, android.app.AlertDialog.BUTTON_NEGATIVE}) {
                    Button button = dialog.getButton(which);
                    RippleDrawable background = (RippleDrawable) button.getBackground();
                    float density = button.getResources().getDisplayMetrics().density;
                    assertEquals(Math.round(4 * density), background.getLayerInsetStart(0));
                    assertEquals(Math.round(6 * density), background.getLayerInsetTop(0));
                    assertEquals(Math.round(4 * density), background.getLayerInsetEnd(0));
                    assertEquals(Math.round(6 * density), background.getLayerInsetBottom(0));
                }
            } finally {
                dialog.dismiss();
            }
        }
    }

    /**
     * The recovery page's title and message are centred, and so is the space they're centred in.
     * Wrapping its own text, the message sat at the start while the title, wide enough to fill the
     * row, looked centred.
     */
    @Test
    public void theRecoveryMessageIsCentredAcrossTheRow() {
        android.widget.RelativeLayout row = new android.widget.RelativeLayout(RuntimeEnvironment.getApplication());
        TextView title = new TextView(row.getContext());
        title.setId(android.R.id.title);
        TextView summary = new TextView(row.getContext());
        summary.setId(android.R.id.summary);
        row.addView(title, new android.widget.RelativeLayout.LayoutParams(
                android.view.ViewGroup.LayoutParams.WRAP_CONTENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT));
        row.addView(summary, new android.widget.RelativeLayout.LayoutParams(
                android.view.ViewGroup.LayoutParams.WRAP_CONTENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT));
        ScreenColors.recoveryMessage(row);
        for (TextView text : new TextView[]{title, summary}) {
            assertEquals(android.view.ViewGroup.LayoutParams.MATCH_PARENT, text.getLayoutParams().width);
            assertEquals(android.view.Gravity.CENTER, text.getGravity() & android.view.Gravity.CENTER);
        }
    }

    /**
     * From 2x text Samsung builds a switch row from tw_preference_switch_large, which puts a 16dp
     * end padding on the icon itself and leaves out the -4dp start margin preference_material gives
     * the icon's frame, which it nests in a line of its own. On an S25 the padding squeezed the
     * glyph to a third of its box and the text started 11px right of its neighbors'. Painted, both
     * shapes draw a full 24dp icon inside its line and start their text at the same place.
     */
    @Test
    public void samsungsLargeTextSwitchRowKeepsItsIconAndTextEdge() {
        android.content.Context context = RuntimeEnvironment.getApplication();
        android.preference.Preference preference = new android.preference.Preference(context);
        preference.setTitle("Hide ads");
        preference.setIcon(new ColorDrawable(Color.WHITE));
        int dp = Math.round(context.getResources().getDisplayMetrics().density);
        int[] textStart = new int[2];
        for (int shape = 0; shape < 2; shape++) {
            boolean samsungLarge = shape == 1;
            android.widget.LinearLayout row = new android.widget.LinearLayout(context);
            row.setOrientation(samsungLarge ? android.widget.LinearLayout.VERTICAL : android.widget.LinearLayout.HORIZONTAL);
            android.widget.LinearLayout line = samsungLarge ? new android.widget.LinearLayout(context) : row;
            android.widget.LinearLayout frame = new android.widget.LinearLayout(context);
            frame.setId(android.R.id.icon_frame);
            android.widget.ImageView icon = new android.widget.ImageView(context);
            icon.setId(android.R.id.icon);
            icon.setImageDrawable(preference.getIcon());
            android.widget.LinearLayout.LayoutParams frameSize = new android.widget.LinearLayout.LayoutParams(
                    android.view.ViewGroup.LayoutParams.WRAP_CONTENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
            if (samsungLarge) {
                icon.setPaddingRelative(0, 0, 16 * dp, 0);
            } else {
                frameSize.setMarginStart(-4 * dp);
                frame.setMinimumWidth(60 * dp);
                frame.setPaddingRelative(0, 4 * dp, 12 * dp, 4 * dp);
            }
            frame.addView(icon);
            line.addView(frame, frameSize);
            android.widget.RelativeLayout text = new android.widget.RelativeLayout(context);
            TextView title = new TextView(context);
            title.setId(android.R.id.title);
            title.setText(preference.getTitle());
            text.addView(title);
            line.addView(text, new android.widget.LinearLayout.LayoutParams(0, android.view.ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            if (samsungLarge) {
                row.addView(line);
                Switch toggle = new Switch(context);
                toggle.setId(android.R.id.switch_widget);
                row.addView(toggle);
            }

            ScreenColors.DEFAULT.paintRow(row, preference);
            row.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            row.layout(0, 0, 1080, row.getMeasuredHeight());

            String which = samsungLarge ? "the large-text row" : "the standard row";
            assertEquals(which + " pads its icon", 0, icon.getPaddingStart() + icon.getPaddingEnd()
                    + icon.getPaddingTop() + icon.getPaddingBottom());
            assertEquals(which + "'s icon box", 24 * dp, icon.getWidth());
            assertTrue(which + " moves its icon past the edge of the line that clips it", frame.getLeft() >= 0);
            int x = 0;
            for (View at = title; at != row; at = (View) at.getParent()) x += at.getLeft();
            textStart[shape] = x;
        }
        assertEquals("the large-text row's text starts somewhere else", textStart[0], textStart[1]);
    }

    private static SettingsDialog show(Activity activity) {
        SettingsDialog dialog = new SettingsDialog();
        dialog.show(activity.getFragmentManager(), "hushtelegram_settings");
        activity.getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        Fragment page = dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
        assertTrue("no preference page", page instanceof HushTelegramPreferenceFragment);
        return dialog;
    }

    /** Every row the list draws, laid out tall enough that none is left off. */
    private static List<View> rows(SettingsDialog dialog) {
        ListView list = dialog.getView().findViewById(android.R.id.list);
        assertNotNull("no list in the dialog", list);
        HushTelegramPreferenceFragment page = (HushTelegramPreferenceFragment) dialog.getChildFragmentManager()
                .findFragmentById(SettingsDialog.CONTAINER_ID);
        // Verify every preference row independently of the category shell.
        list.setAdapter(page.getPreferenceScreen().getRootAdapter());
        list.setOnItemClickListener(page.getPreferenceScreen());
        list.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(40000, View.MeasureSpec.EXACTLY));
        list.layout(0, 0, 1080, 40000);
        List<View> rows = new ArrayList<>();
        for (int index = 0; index < list.getChildCount(); index++) rows.add(list.getChildAt(index));
        return rows;
    }

    /**
     * A dialog's text field takes the accent for its cursor and handles where Android lets code set
     * them, from Android 10 on. Android 9 has no such call, so painting a field there must not
     * reach for one.
     */
    @Test
    @Config(sdk = 28)
    public void aTextFieldIsPaintedOnAndroid9WithoutTheCursorCalls() {
        android.widget.EditText field = new android.widget.EditText(org.robolectric.RuntimeEnvironment.getApplication());
        ScreenColors.DEFAULT.paintField(field);
        assertEquals(ScreenColors.DEFAULT.title, field.getCurrentTextColor());
    }
}
