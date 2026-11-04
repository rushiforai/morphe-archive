package app.hushmessenger.extension;

import android.app.Dialog;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.os.Looper;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.widget.EditText;
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
import org.robolectric.shadows.ShadowDialog;
import static org.junit.Assert.*;

/**
 * HushGram's gradient titles on every HushMessenger title: the bar, the header's name, the empty search, a sheet and
 * the restart screen, each in its own look's stops, since the other look's stops read at about 1:1 on its page.
 */
@RunWith(RobolectricTestRunner.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(sdk = 36, qualifiers = "w411dp-h914dp-xhdpi")
public class SettingsGradientTitlesTest {
    private static final int WIDTH = 411, HEIGHT = 914;

    @Before public void reset() {
        CrashGuard.resetForTests();
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        // The animation clock can stand where an earlier test ran it to; one read outside a frame brings it back to now.
        AnimationUtils.currentAnimationTimeMillis();
    }

    @After public void closeDialog() {
        Dialog dialog = ShadowDialog.getLatestDialog();
        if (dialog != null && dialog.isShowing()) dialog.dismiss();
    }

    @Test public void theBarTheHeaderAndTheEmptySearchWearTheirLooksStops() {
        for (boolean light : new boolean[] {false, true}) {
            look(light);
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                for (String tag : new String[] {"wordmark", SettingsHeader.NAME, "empty_title"})
                    assertArrayEquals(name(light) + " " + tag, stops(light), ShimmerTitle.stopsOf(root.findViewWithTag(tag)));
            }
        }
    }

    @Test public void aSheetsTitleWearsItsLooksStops() {
        for (boolean light : new boolean[] {false, true}) {
            look(light);
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                screen.get().getWindow().getDecorView().findViewWithTag("auto_reply_edit").performClick();
                Dialog dialog = ShadowDialog.getLatestDialog();
                assertTrue(dialog.isShowing());
                TextView title = dialog.getWindow().getDecorView().findViewWithTag("dialog_title");
                assertArrayEquals(name(light), stops(light), ShimmerTitle.stopsOf(title));
                dialog.dismiss();
            }
        }
    }

    @Test public void theRestartScreensTitlesWearTheirLooksStops() {
        for (boolean light : new boolean[] {false, true}) {
            look(light);
            try (var screen = Robolectric.buildActivity(RestartActivity.class).setup()) {
                View pane = screen.get().findViewById(android.R.id.content).findViewWithTag("restart_page");
                for (String tag : new String[] {"restart_brand", "restart_status"})
                    assertArrayEquals(name(light) + " " + tag, stops(light), ShimmerTitle.stopsOf(pane.findViewWithTag(tag)));
            }
        }
    }

    /** The bar's words change to Search settings, and the gradient spans the new words, not a plain color. */
    @Test public void searchSettingsInTheBarIsDrawnInTheGradient() {
        for (boolean light : new boolean[] {false, true}) {
            look(light);
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = lay(screen.get().getWindow().getDecorView());
                EditText search = root.findViewWithTag("find_control");
                search.setText("Stickers");
                lay(root);
                TextView wordmark = root.findViewWithTag("wordmark");
                assertEquals(new SettingsText(screen.get()).get("search_settings"), wordmark.getText().toString());
                assertArrayEquals(stops(light), ShimmerTitle.stopsOf(wordmark));
                // A whole drift round on and between sweeps, the words run from sky blue at the start to royal at the end.
                ShimmerTitle.frameFor(wordmark, ShimmerTitle.DRIFT_MS);
                Bitmap pixels = Bitmap.createBitmap(wordmark.getWidth(), wordmark.getHeight(), Bitmap.Config.ARGB_8888);
                wordmark.draw(new Canvas(pixels));
                assertTrue(name(light) + ": sky to royal letters", hueSpread(pixels) >= 20f);
            }
        }
    }

    @Test public void aTitleWithNoGradientHasNoStops() {
        assertNull(ShimmerTitle.stopsOf(new TextView(RuntimeEnvironment.getApplication())));
    }

    @Test public void theStopsHandedOutAreACopy() {
        TextView title = new TextView(RuntimeEnvironment.getApplication());
        ShimmerTitle.wear(title, false);
        ShimmerTitle.stopsOf(title)[0] = Color.BLACK;
        assertArrayEquals(ShimmerTitle.DARK, ShimmerTitle.stopsOf(title));
    }

    private static void look(boolean light) {
        Settings.preferences.edit().clear().putBoolean("light", light).commit();
    }

    private static int[] stops(boolean light) { return light ? ShimmerTitle.LIGHT : ShimmerTitle.DARK; }

    private static String name(boolean light) { return light ? "light" : "dark"; }

    /** Whether a solid letter pixel is clearly warm (red over blue) or, for not warm, clearly cool. */
    /** How many degrees of hue the solid, colored letters span. Soft edges and anything near white don't count. */
    private static float hueSpread(Bitmap bitmap) {
        float low = 360f, high = 0f;
        float[] hsv = new float[3];
        for (int x = 0; x < bitmap.getWidth(); x++)
            for (int y = 0; y < bitmap.getHeight(); y++) {
                int pixel = bitmap.getPixel(x, y);
                if (Color.alpha(pixel) < 250) continue;
                Color.colorToHSV(pixel, hsv);
                if (hsv[1] < 0.4f) continue;
                low = Math.min(low, hsv[0]);
                high = Math.max(high, hsv[0]);
            }
        return high < low ? 0f : high - low;
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
}
