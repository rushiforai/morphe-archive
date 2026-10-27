package app.hushmessenger.extension;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Switch;
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

/** The lines inside a control card, drawn for real: one between controls, none between a control and its own extras, none under the last. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36, qualifiers = "w411dp-h914dp-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SettingsDividerTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
    }

    @After public void restore() {
        Settings.initialize(RuntimeEnvironment.getApplication());
    }

    @Test public void linesSitBetweenControlsInBothThemes() {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("tab_controls").performClick();
                View facebook = root.findViewWithTag("facebook");
                assertTrue(facebook instanceof Switch);
                View wrapper = facebook;
                while (!"navigation".equals(wrapper.getTag())) wrapper = (View) wrapper.getParent();
                // The Navigation card: Hide Facebook shortcuts first, with its own Keep the Profile button switch under it.
                LinearLayout body = (LinearLayout) wrapper.getParent();
                assertSame(wrapper, body.getChildAt(0));
                int controls = shown(body);
                assertEquals(body.getChildCount(), controls);
                assertTrue("controls in the card: " + controls, controls >= 3);
                View switchRow = ((ViewGroup) wrapper).getChildAt(0);
                lay(root);
                Bitmap pixels = draw(body);
                try {
                    String theme = light ? "light" : "dark";
                    int line = pixels.getPixel(pixels.getWidth() / 2, 0);
                    assertNotEquals(theme + ": the card's border is its line color", pixels.getPixel(pixels.getWidth() / 2, 2), line);
                    assertEquals(theme + ": one line between each pair of controls", controls - 1, lines(body, pixels, line));
                    assertFalse(theme + ": no line between Hide Facebook shortcuts and its Keep the Profile button switch",
                        isLine(body, pixels, wrapper.getTop() + switchRow.getBottom() - 1, line));
                    assertTrue(theme + ": a line under the Keep the Profile button switch",
                        isLine(body, pixels, body.getChildAt(1).getTop() - 1, line));
                    assertFalse(theme + ": no line over the card's border under the last control",
                        isLine(body, pixels, body.getChildAt(controls - 1).getBottom() - 1, line));
                } finally { pixels.recycle(); }

                // A filtered card keeps one line between the controls it still shows, and none for the hidden ones.
                ((EditText) root.findViewWithTag("find_control")).setText(SettingsText.english("facebook_keep_profile"));
                Shadows.shadowOf(Looper.getMainLooper()).idle();
                int shown = shown(body);
                assertTrue("the search hid a control: " + shown, shown >= 1 && shown < controls);
                lay(root);
                Bitmap filtered = draw(body);
                try {
                    int line = filtered.getPixel(filtered.getWidth() / 2, 0);
                    assertEquals(shown - 1, lines(body, filtered, line));
                } finally { filtered.recycle(); }
            }
        }
    }

    private static int shown(LinearLayout body) {
        int shown = 0;
        for (int index = 0; index < body.getChildCount(); index++) if (body.getChildAt(index).getVisibility() == View.VISIBLE) shown++;
        return shown;
    }

    private static void lay(View root) {
        for (int pass = 0; pass < 2; pass++) {
            root.measure(View.MeasureSpec.makeMeasureSpec(411, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(914, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, 411, 914);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
    }

    private static Bitmap draw(View body) {
        Bitmap pixels = Bitmap.createBitmap(body.getWidth(), body.getHeight(), Bitmap.Config.ARGB_8888);
        body.draw(new Canvas(pixels));
        return pixels;
    }

    /** Pixel rows inside the card's border that are line color all the way across the card's inner width. */
    private static int lines(View body, Bitmap pixels, int line) {
        int count = 0;
        for (int y = 1; y < pixels.getHeight() - 1; y++) if (isLine(body, pixels, y, line)) count++;
        return count;
    }

    private static boolean isLine(View body, Bitmap pixels, int y, int line) {
        for (int x = body.getPaddingLeft(); x < pixels.getWidth() - body.getPaddingRight(); x++) if (pixels.getPixel(x, y) != line) return false;
        return true;
    }
}
