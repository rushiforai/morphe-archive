package app.hushmessenger.extension;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.TextView;
import org.junit.After;
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

/** HushGram's restart bar under the list, the search field and Undo, all on the 18 dp line. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36, qualifiers = "w411dp-h914dp-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SettingsRestartBarTest {
    private static final int WIDTH = 411, HEIGHT = 914;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        // Messenger asked for the Meta AI tab before settings opened, and the switch was off.
        Settings.metaAiTab = false;
    }

    @After public void forgetHeldAnswer() { Settings.metaAiTab = null; }

    @Test public void theBarSitsUnderTheListOnBothPagesOnTheEighteenDpLine() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            View bar = root.findViewWithTag("restart_row");
            assertEquals("Off until a change waits on a restart", View.GONE, bar.getVisibility());
            ((Switch) root.findViewWithTag("meta_ai")).performClick();
            lay(root);
            for (String page : new String[] {"controls", "app"}) {
                root.findViewWithTag("tab_" + page).performClick();
                lay(root);
                assertTrue(page, bar.isShown());
                ViewGroup parent = (ViewGroup) bar.getParent();
                assertSame(page + ": under the list, not a row in it", ((View) root.findViewWithTag(page + "_page")).getParent(), parent);
                assertEquals(page + ": last on the screen", parent.getChildCount() - 1, parent.indexOfChild(bar));
                View list = root.findViewWithTag(page + "_page");
                assertTrue(page + ": below the page", top(bar) >= top(list) + list.getHeight() + 8);
                assertEquals(page, 18, left(bar));
                assertEquals(page, WIDTH - 18, left(bar) + bar.getWidth());
                assertTrue(page + ": at least 56 dp", bar.getHeight() >= 56);
                assertTrue(page + ": 8 dp clear of the window's bottom", top(bar) + bar.getHeight() <= HEIGHT - 8);
            }
        }
    }

    @Test public void theWholeBarIsOneButtonThatRestartsOntoThisPage() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            SettingsUi ui = new SettingsUi(screen.get(), false);
            ((Switch) root.findViewWithTag("meta_ai")).performClick();
            View bar = root.findViewWithTag("restart_row");
            assertTrue(bar.isClickable());
            assertTrue(bar.isFocusable());
            assertEquals(56, bar.getMinimumHeight());
            assertEquals(android.widget.Button.class.getName(), bar.createAccessibilityNodeInfo().getClassName().toString());
            TextView waiting = root.findViewWithTag("restart_waiting");
            assertEquals(15f, waiting.getTextSize(), 0.01f);
            assertEquals(ui.text, waiting.getCurrentTextColor());
            Drawable icon = waiting.getCompoundDrawablesRelative()[0];
            assertNotNull("The tools icon leads", icon);
            assertEquals(24, icon.getBounds().width());
            assertEquals(14, waiting.getCompoundDrawablePadding());
            TextView label = root.findViewWithTag("restart_now");
            assertEquals("The repo's own restart label", "Restart Messenger", label.getText().toString());
            assertEquals(ui.heading, label.getCurrentTextColor());
            assertFalse("The bar takes the tap, not its label", label.isClickable());
            assertFalse(label.isFocusable());
            bar.performClick();
            Intent restart = Shadows.shadowOf(screen.get()).getNextStartedActivity();
            assertEquals(RestartActivity.class.getName(), restart.getComponent().getClassName());
            assertEquals("controls", restart.getStringExtra(SettingsReopen.EXTRA));
            root.findViewWithTag("tab_app").performClick();
            bar.performClick();
            assertEquals("app", Shadows.shadowOf(screen.get()).getNextStartedActivity().getStringExtra(SettingsReopen.EXTRA));
        }
    }

    /** Pixel reads run at 2 px per dp: a 1 dp line at 1 px is drawn as a faint hairline in software. */
    @Test @Config(qualifiers = "w411dp-h914dp-xhdpi")
    public void theBarIsTheCardFillInAHeadingColorOutlineWithTwelveDpCorners() {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                SettingsUi ui = new SettingsUi(screen.get(), light);
                ((Switch) root.findViewWithTag("meta_ai")).performClick();
                View bar = lay(root).findViewWithTag("restart_row");
                Drawable states = ((RippleDrawable) bar.getBackground()).getDrawable(0);
                GradientDrawable surface = (GradientDrawable) states.getCurrent();
                assertEquals(ui.dp(12), surface.getCornerRadius(), 0f);
                assertEquals(ui.card, surface.getColor().getDefaultColor());
                Bitmap pixels = draw(bar);
                int middle = pixels.getHeight() / 2, end = pixels.getWidth() - 1;
                String look = light ? "light" : "dark";
                assertEquals(look, Integer.toHexString(ui.heading), Integer.toHexString(pixels.getPixel(0, middle)));
                assertEquals(look, Integer.toHexString(ui.heading), Integer.toHexString(pixels.getPixel(end, middle)));
                assertEquals(look + ": the card fill inside", Integer.toHexString(ui.card), Integer.toHexString(pixels.getPixel(ui.dp(6), middle)));
            }
        }
    }

    @Test public void theSearchIsHushGramsTwelveDpFieldOnTheLine() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = lay(screen.get().getWindow().getDecorView());
            EditText search = root.findViewWithTag("find_control");
            assertEquals(18, left(search));
            assertTrue(search.getHeight() >= 48);
            Drawable states = ((RippleDrawable) search.getBackground()).getDrawable(0);
            assertEquals(12f, ((GradientDrawable) states.getCurrent()).getCornerRadius(), 0f);
            View header = root.findViewWithTag(SettingsHeader.NAME);
            assertTrue("The search comes right under the header", top(search) > top(header));
            View setup = (View) root.findViewWithTag("enabled_count").getParent();
            assertTrue("and before the Pause card", top(setup) > top(search));
        }
    }

    @Test public void undoSitsOnTheSameLine() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().offerUndo("x", () -> { });
            View undo = lay(screen.get().getWindow().getDecorView()).findViewWithTag("undo");
            assertTrue(undo.isShown());
            assertEquals(18, left(undo));
            assertEquals(WIDTH - 18, left(undo) + undo.getWidth());
        }
    }

    @Test public void undoComingAndGoingLeavesTheRowsWhereTheyWere() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = lay(screen.get().getWindow().getDecorView());
            View row = root.findViewWithTag("enabled_count");
            View scroll = row;
            while (!(scroll instanceof android.widget.ScrollView)) scroll = (View) scroll.getParent();
            scroll.scrollTo(0, 120);
            lay(root);
            assertEquals(120, scroll.getScrollY());
            int before = top(row);
            screen.get().offerUndo("x", () -> { });
            lay(root);
            View undo = root.findViewWithTag("undo");
            assertTrue(undo.isShown());
            assertEquals("With Undo showing", before, top(row));
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(SettingsActivity.UNDO_MILLIS + 1));
            lay(root);
            assertFalse(undo.isShown());
            assertEquals("With Undo gone again", before, top(row));
        }
    }

    private static int left(View view) {
        int[] spot = new int[2];
        view.getLocationInWindow(spot);
        return Math.round(spot[0] / view.getResources().getDisplayMetrics().density);
    }

    private static int top(View view) {
        int[] spot = new int[2];
        view.getLocationInWindow(spot);
        return spot[1];
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
