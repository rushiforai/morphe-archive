package app.hushmessenger.extension;

import android.content.pm.ApplicationInfo;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

/** HushGram's cards: the 18 dp line, section cards and headings, row icons, and overview rows whose side lines sit off screen. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36, qualifiers = "w411dp-h914dp-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SettingsCardsTest {
    private static final int WIDTH = 411, HEIGHT = 914;
    private static final String[] APP_SECTIONS = {"quick_access", "quick_setups", "appearance", "about", "choices", "usage"};
    private static final String[] OVERVIEW = {"log_out", "source_licenses", "report_problem", "support"};

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
    }

    @Test public void bothPagesAndTheTabsSitOnTheEighteenDpLine() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = lay(screen.get().getWindow().getDecorView());
            for (String page : new String[] {"controls_page", "app_page"}) {
                LinearLayout content = content(root, page);
                assertEquals(page, 18, content.getPaddingLeft());
                assertEquals(page, 18, content.getPaddingRight());
            }
            View tabs = (View) root.findViewWithTag("tab_controls").getParent();
            assertEquals("The tabs line up with the cards", 18, left(tabs));
            assertEquals(WIDTH - 18, left(tabs) + tabs.getWidth());
            View search = root.findViewWithTag("find_control");
            assertEquals("Search sits on the same line", 18, left(search));
        }
    }

    @Test public void eachSectionIsOneTenDpCardOnTheLineUnderAHushGramHeading() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = lay(screen.get().getWindow().getDecorView());
            SettingsUi ui = new SettingsUi(screen.get(), false);
            List<String> ids = new ArrayList<>();
            for (String[] spec : SettingsActivity.CONTROLS) if (!ids.contains(spec[3]) && root.findViewWithTag("section_" + spec[3]) != null) ids.add(spec[3]);
            assertTrue("Controls sections shown: " + ids, ids.size() >= 3);
            for (String id : ids) {
                LinearLayout body = card(root, id);
                assertEquals(id + " keeps 1 dp for its outline and 4 dp more above and below its rows",
                    Arrays.asList(1, 4, 1, 4), Arrays.asList(body.getPaddingLeft(), body.getPaddingTop(), body.getPaddingRight(), body.getPaddingBottom()));
                checkSection(root, ui, id);
            }
            root.findViewWithTag("tab_app").performClick();
            lay(root);
            int shown = 0;
            for (String id : APP_SECTIONS) if (root.findViewWithTag("section_" + id) != null) {
                checkSection(root, ui, id);
                shown++;
            }
            assertTrue("App sections shown: " + shown, shown >= 4);
        }
    }

    private static void checkSection(View root, SettingsUi ui, String id) {
        LinearLayout body = card(root, id);
        GradientDrawable shape = (GradientDrawable) body.getBackground();
        assertEquals(id, 10f, shape.getCornerRadius(), 0f);
        assertEquals(id, ui.card, shape.getColor().getDefaultColor());
        assertEquals(id + " starts 18 dp in", 18, left(body));
        assertEquals(id + " ends 18 dp in", WIDTH - 18, left(body) + body.getWidth());
        LinearLayout header = root.findViewWithTag("section_" + id);
        assertEquals(id, Arrays.asList(4, 20, 4, 8), Arrays.asList(header.getPaddingLeft(), header.getPaddingTop(), header.getPaddingRight(), header.getPaddingBottom()));
        TextView heading = (TextView) header.getChildAt(0);
        assertEquals(id + "'s heading starts 22 dp in", 22, left(heading));
        assertEquals(12f, heading.getTextSize(), 0.01f);
        assertEquals(0.055f, heading.getLetterSpacing(), 0.0001f);
        assertEquals(heading.getText().toString().toUpperCase(Locale.ROOT), heading.getText().toString());
        assertTrue(heading.isAccessibilityHeading());
        assertEquals(ui.heading, heading.getCurrentTextColor());
        assertFalse(id + ": an open section wears no outline", header.isActivated());
    }

    /** Pixel reads run at 2 px a dp: at mdpi Skia draws a 1 px stroke as a faint hairline, which no phone shows. */
    @Test @Config(qualifiers = "w411dp-h914dp-xhdpi") public void cardEdgesAreTheOutlineDrawnForReal() {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = lay(screen.get().getWindow().getDecorView());
                SettingsUi ui = new SettingsUi(screen.get(), light);
                LinearLayout body = card(root, "navigation");
                View first = body.getChildAt(0);
                Bitmap pixels = draw(body);
                try {
                    int y = first.getTop() + first.getHeight() / 2, end = pixels.getWidth() - 1;
                    assertEquals("1 dp outline at the start", ui.line, pixels.getPixel(0, y));
                    assertEquals(ui.line, pixels.getPixel(1, y));
                    assertEquals("1 dp outline at the end", ui.line, pixels.getPixel(end, y));
                    assertEquals(ui.line, pixels.getPixel(end - 1, y));
                    assertNotEquals("and only 1 dp", ui.line, pixels.getPixel(2, y));
                    assertNotEquals("and only 1 dp", ui.line, pixels.getPixel(end - 2, y));
                } finally { pixels.recycle(); }
            }
        }
    }

    @Test public void everyRowCarriesItsIconOnTheThirtyDpLine() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = lay(screen.get().getWindow().getDecorView());
            int checked = 0;
            for (String[] spec : SettingsActivity.CONTROLS) {
                View control = root.findViewWithTag(spec[0]);
                if (!(control instanceof Switch)) continue;
                checked += checkRow(spec[0], (LinearLayout) control.getParent(), true);
            }
            assertTrue("rows checked: " + checked, checked >= 10);
            assertEquals(1, checkRow("paused", (LinearLayout) root.findViewWithTag("paused").getParent(), false));
            root.findViewWithTag("tab_app").performClick();
            lay(root);
            for (String key : new String[] {"light", "check_updates", Settings.HIDE_ICON_SHORTCUTS})
                assertEquals(key, 1, checkRow(key, (LinearLayout) root.findViewWithTag(key).getParent(), false));
        }
    }

    @Test @Config(sdk = 29) public void anUnusableRowDimsItsTitleSummaryAndIcon() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = lay(screen.get().getWindow().getDecorView());
            Switch bubbles = root.findViewWithTag("bubbles");
            assertFalse(bubbles.isEnabled());
            LinearLayout row = (LinearLayout) bubbles.getParent();
            assertFalse(row.isEnabled());
            LinearLayout labels = (LinearLayout) row.getChildAt(0);
            TextView title = (TextView) ((ViewGroup) labels.getChildAt(0)).getChildAt(0);
            TextView summary = (TextView) labels.getChildAt(1);
            assertEquals(0.38f, title.getAlpha(), 0.001f);
            assertEquals(0.75f, summary.getAlpha(), 0.001f);
            Drawable icon = ((LayerDrawable) row.getBackground()).getDrawable(1);
            assertTrue("The icon follows the row's enabled state", icon.isStateful());
            for (int state : icon.getState()) assertNotEquals("and so is drawn dimmed", android.R.attr.state_enabled, state);
            View people = root.findViewWithTag("people");
            TextView usable = (TextView) ((ViewGroup) ((ViewGroup) ((ViewGroup) people.getParent()).getChildAt(0)).getChildAt(0)).getChildAt(0);
            assertEquals(1f, usable.getAlpha(), 0f);
        }
    }

    @Test public void overviewRowsRunEdgeToEdgeWithTheirSideLinesOffScreen() {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("tab_app").performClick();
                lay(root);
                SettingsUi ui = new SettingsUi(screen.get(), light);
                for (String tag : OVERVIEW) {
                    LinearLayout row = root.findViewWithTag(tag);
                    assertEquals(tag, 0, left(row));
                    assertEquals(tag, WIDTH, row.getWidth());
                    assertEquals(tag, Arrays.asList(20, 6, 20, 6),
                        Arrays.asList(row.getPaddingLeft(), row.getPaddingTop(), row.getPaddingRight(), row.getPaddingBottom()));
                    assertTrue(tag, row.getHeight() >= 52);
                    TextView title = (TextView) row.getChildAt(0);
                    assertEquals(15f, title.getTextSize(), 0.01f);
                    assertEquals(ui.text, title.getCurrentTextColor());
                    assertEquals("The title clears the icon", 58, left(title));
                    if (row.getChildCount() > 1) {
                        TextView help = (TextView) row.getChildAt(1);
                        assertEquals(12f, help.getTextSize(), 0.01f);
                        assertEquals(ui.muted, help.getCurrentTextColor());
                    }
                    LayerDrawable parts = bounded(row);
                    Rect fill = parts.getDrawable(0).getBounds();
                    assertEquals(tag + "'s start line is 1 dp off screen", -1, fill.left);
                    assertEquals(tag + "'s end line is 1 dp off screen", WIDTH + 1, fill.right);
                    Rect icon = parts.getDrawable(1).getBounds();
                    assertEquals(tag, 20, icon.left);
                    assertEquals(24, icon.width());
                    boolean opens = !"log_out".equals(tag);
                    assertEquals(tag + (opens ? " opens a page, so it ends in a chevron" : " acts in place, so no chevron"), opens ? 3 : 2, parts.getNumberOfLayers());
                    if (opens) {
                        Chevron chevron = (Chevron) parts.getDrawable(2);
                        assertTrue(chevron.isAutoMirrored());
                        assertEquals(ui.muted, chevron.color);
                        Rect slot = parts.getDrawable(2).getBounds();
                        assertEquals(16, slot.width());
                        assertEquals(24, slot.height());
                        assertEquals(WIDTH - 20, slot.right);
                    }
                }
                // Report and Support are one card: Support's top line is Report's bottom one.
                View report = root.findViewWithTag("report_problem");
                View support = root.findViewWithTag("support");
                assertEquals(report.getBottom(), support.getTop());
                assertEquals(-1, bounded(support).getDrawable(0).getBounds().top);
                assertEquals(0, bounded(report).getDrawable(0).getBounds().top);
            }
        }
    }

    @Test @Config(qualifiers = "w411dp-h914dp-xhdpi") public void overviewLinesAreDrawnOnlyAlongTheBottom() {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("tab_app").performClick();
                lay(root);
                SettingsUi ui = new SettingsUi(screen.get(), light);
                int drawn = 0;
                for (String tag : OVERVIEW) {
                    View row = root.findViewWithTag(tag);
                    // Log out greys out while no account is signed in, and its line dims with it.
                    if (!row.isEnabled()) continue;
                    drawn++;
                    Bitmap pixels = draw(row);
                    try {
                        int y = pixels.getHeight() / 2, middle = pixels.getWidth() / 2, bottom = pixels.getHeight() - 1;
                        assertNotEquals(tag + ": no line down the screen's left edge", ui.line, pixels.getPixel(0, y));
                        assertNotEquals(tag + ": no line down the screen's right edge", ui.line, pixels.getPixel(pixels.getWidth() - 1, y));
                        assertEquals(tag + ": a line along the bottom", ui.line, pixels.getPixel(middle, bottom));
                        assertEquals(tag + ": 1 dp of it", ui.line, pixels.getPixel(middle, bottom - 1));
                        assertNotEquals(tag + ": and no more", ui.line, pixels.getPixel(middle, bottom - 2));
                    } finally { pixels.recycle(); }
                }
                assertTrue("rows drawn: " + drawn, drawn >= 3);
                Bitmap joined = draw(root.findViewWithTag("support"));
                try {
                    assertNotEquals("no second line where Report and Support meet", ui.line, joined.getPixel(joined.getWidth() / 2, 0));
                } finally { joined.recycle(); }
            }
        }
    }

    @Test public void iconsAndChevronsMirrorInRightToLeftLanguages() {
        RuntimeEnvironment.setQualifiers("ar-rEG-ldrtl-w411dp-h914dp-mdpi");
        RuntimeEnvironment.getApplication().getApplicationInfo().flags |= ApplicationInfo.FLAG_SUPPORTS_RTL;
        SettingsTranslations.LOCALES.put("ar", java.util.Map.of("tab_controls", "Controls in Arabic"));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
            lay(root);
            LinearLayout row = (LinearLayout) root.findViewWithTag("people").getParent();
            assertEquals(View.LAYOUT_DIRECTION_RTL, row.getLayoutDirection());
            assertEquals("The icon sits at the start, on the right", row.getWidth() - 11, bounded(row).getDrawable(1).getBounds().right);
            root.findViewWithTag("tab_app").performClick();
            lay(root);
            LinearLayout support = root.findViewWithTag("support");
            LayerDrawable parts = bounded(support);
            assertEquals(WIDTH - 20, parts.getDrawable(1).getBounds().right);
            assertEquals("The chevron sits at the end, on the left", 20, parts.getDrawable(2).getBounds().left);
            assertEquals(View.LAYOUT_DIRECTION_RTL, parts.getDrawable(2).getLayoutDirection());
            Chevron chevron = (Chevron) parts.getDrawable(2);
            float[] points = chevron.points();
            assertTrue("It points left, the way the row reads", points[2] < points[0]);
        } finally { SettingsTranslations.LOCALES.remove("ar"); }
    }

    /** Checks [row]'s icon and text, and returns 1. In a section card the icon is 30 dp from the screen edge. */
    private static int checkRow(String key, LinearLayout row, boolean inCard) {
        LayerDrawable parts = bounded(row);
        Drawable icon = parts.getDrawable(1);
        assertTrue(key + " has an icon", icon instanceof BitmapDrawable);
        assertEquals(key, Gravity.START | Gravity.CENTER_VERTICAL, parts.getLayerGravity(1));
        assertEquals(key, 24, parts.getLayerWidth(1));
        assertEquals(key, 24, parts.getLayerHeight(1));
        if (row.getWidth() > 0) {
            assertEquals(key + "'s icon is 30 dp from the screen edge", 30, left(row) + icon.getBounds().left);
            assertEquals(24, icon.getBounds().width());
        }
        LinearLayout labels = (LinearLayout) row.getChildAt(0);
        assertEquals(key, 38, ((ViewGroup.MarginLayoutParams) labels.getLayoutParams()).getMarginStart());
        TextView title = (TextView) ((ViewGroup) labels.getChildAt(0)).getChildAt(0);
        assertEquals(key, 16f, title.getTextSize(), 0.01f);
        if (labels.getChildCount() > 1 && labels.getChildAt(1) instanceof TextView && !"".contentEquals(((TextView) labels.getChildAt(1)).getText())
                && labels.getChildAt(1).getTag() == null)
            assertEquals(key, 13f, ((TextView) labels.getChildAt(1)).getTextSize(), 0.01f);
        if (inCard) assertTrue(key + " is at least 64 dp tall", row.getMinimumHeight() >= 64);
        return 1;
    }

    private static LinearLayout content(View root, String page) {
        ScrollView scroll = (ScrollView) ((ViewGroup) root.findViewWithTag(page)).getChildAt(0);
        return (LinearLayout) scroll.getChildAt(0);
    }

    private static LinearLayout card(View root, String id) {
        return (LinearLayout) ((ViewGroup) root.findViewWithTag(id)).getChildAt(1);
    }

    /** [row]'s background laid out at the row's size, as drawing it would. */
    private static LayerDrawable bounded(View row) {
        LayerDrawable parts = (LayerDrawable) row.getBackground();
        parts.setBounds(0, 0, row.getWidth(), row.getHeight());
        return parts;
    }

    private static int left(View view) {
        int[] spot = new int[2];
        view.getLocationInWindow(spot);
        return spot[0];
    }

    private static View lay(View root) {
        float density = root.getResources().getDisplayMetrics().density;
        int width = Math.round(WIDTH * density), height = Math.round(HEIGHT * density);
        for (int pass = 0; pass < 2; pass++) {
            root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, width, height);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
        return root;
    }

    private static Bitmap draw(View view) {
        Bitmap pixels = Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.ARGB_8888);
        view.draw(new Canvas(pixels));
        return pixels;
    }
}
