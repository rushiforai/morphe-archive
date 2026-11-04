package app.hushmessenger.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

/** The header wears HushMessenger's own logo, the blue tile with the white H, and not the patched shield. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, qualifiers = "w400dp-h900dp-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SettingsLogoTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
    }

    @Test public void theHeaderShowsTheHushMessengerLogoInItsOwnColors() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            ImageView icon = screen.get().getWindow().getDecorView().findViewWithTag(SettingsHeader.ICON);
            Drawable shown = icon.getDrawable();
            assertTrue("The header shows a picture: " + shown, shown instanceof BitmapDrawable);
            Bitmap picture = ((BitmapDrawable) shown).getBitmap();
            // 256 px for the 64 dp spot, so it stays sharp up to 640 dpi.
            assertEquals(256, picture.getWidth());
            assertEquals(256, picture.getHeight());
            assertEquals(64, shown.getIntrinsicWidth());
            assertEquals(64, shown.getIntrinsicHeight());

            // Drawn as the header draws it. A tint would turn every solid pixel one color, the way it does the shield.
            Drawable copy = shown.getConstantState().newDrawable(icon.getResources());
            Bitmap drawn = Bitmap.createBitmap(64, 64, Bitmap.Config.ARGB_8888);
            copy.setBounds(0, 0, 64, 64);
            copy.draw(new Canvas(drawn));
            int white = 0, blue = 0;
            for (int x = 0; x < 64; x++)
                for (int y = 0; y < 64; y++) {
                    int pixel = drawn.getPixel(x, y);
                    if (Color.alpha(pixel) < 250) continue;
                    if (Color.red(pixel) >= 230 && Color.green(pixel) >= 230 && Color.blue(pixel) >= 230) white++;
                    else if (Color.blue(pixel) - Color.red(pixel) >= 120) blue++;
                }
            assertEquals("The tile's corners are see-through", 0, Color.alpha(drawn.getPixel(0, 0)));
            assertTrue("The white H: " + white, white >= 400);
            assertTrue("The blue tile: " + blue, blue >= 1500);
        }
    }

    @Test public void everyHeaderGetsItsOwnDrawableOfOnePicture() {
        var app = RuntimeEnvironment.getApplication();
        BitmapDrawable first = (BitmapDrawable) SettingsLogo.drawable(app);
        BitmapDrawable second = (BitmapDrawable) SettingsLogo.drawable(app);
        // Decoded once, but a page's bounds or alpha never reach another page's copy.
        assertTrue(first != second);
        assertTrue(first.getBitmap() == second.getBitmap());
    }
}
