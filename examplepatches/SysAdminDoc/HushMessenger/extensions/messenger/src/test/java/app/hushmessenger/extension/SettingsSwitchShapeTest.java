package app.hushmessenger.extension;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.view.View;
import android.widget.Switch;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

/**
 * The switch as Android lays it out and draws it, not as its drawables are sized: a thumb inset on its own drawable
 * made Switch shrink the track to 36 by 20 dp and hang the thumb 2 dp past its end, on the phone and here alike.
 * Pixel reads run at 2 px per dp, so each 2 dp band is 4 px and its middle is clear of the edges' blending.
 */
@RunWith(RobolectricTestRunner.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(sdk = 36, qualifiers = "w411dp-h914dp-xhdpi")
public class SettingsSwitchShapeTest {
    @Test public void theSquareThumbSitsTwoDpInsideAFortyByTwentyFourTrackOffAndOn() {
        for (boolean light : new boolean[] {false, true}) {
            SettingsUi ui = new SettingsUi(RuntimeEnvironment.getApplication(), light);
            for (boolean on : new boolean[] {false, true}) {
                String name = (light ? "light" : "dark") + (on ? " on" : " off");
                Switch toggle = ui.toggle("test", "Test", "", on);
                Bitmap pixels = draw(toggle);
                Rect track = toggle.getTrackDrawable().getBounds();
                assertEquals(name + " track width", ui.dp(40), track.width());
                assertEquals(name + " track height", ui.dp(24), track.height());
                int rail = on ? ui.accentFill : ui.switchOff, knob = on ? ui.onAccent : ui.thumb;
                int two = ui.dp(2), side = ui.dp(20), band = two / 2;
                int left = track.left + (on ? ui.dp(18) : two), top = track.top + two, middle = track.centerY();
                int across = left + side / 2;
                // Across the middle: 2 dp of track, the 20 dp square, then track again to the end.
                assertPixel(name + " track before the thumb", rail, pixels, left - band, middle);
                assertPixel(name + " thumb's first column", knob, pixels, left + band, middle);
                assertPixel(name + " thumb's last column", knob, pixels, left + side - 1 - band, middle);
                assertPixel(name + " track after the thumb", rail, pixels, left + side + band, middle);
                // Down the thumb's middle: 2 dp of track above and below it.
                assertPixel(name + " track above the thumb", rail, pixels, across, top - band);
                assertPixel(name + " thumb's top row", knob, pixels, across, top + band);
                assertPixel(name + " thumb's bottom row", knob, pixels, across, top + side - 1 - band);
                assertPixel(name + " track below the thumb", rail, pixels, across, top + side + band);
                if (on) assertEquals(name + ": 2 dp of track at the far end too", track.right - two, left + side);
            }
        }
    }

    /** HushGram's off thumb: a white one on the light look's white card left only its track's gray end showing. */
    @Test public void theOffThumbStandsOutFromTheCardAndItsTrackInBothLooks() {
        for (boolean light : new boolean[] {false, true}) {
            SettingsUi ui = new SettingsUi(RuntimeEnvironment.getApplication(), light);
            String look = light ? "light" : "dark";
            assertEquals(look, light ? ui.text : Color.WHITE, ui.thumb);
            assertTrue(look + " off thumb on the card", contrast(ui.thumb, ui.card) >= 3);
            assertTrue(look + " off thumb on its track", contrast(ui.thumb, ui.switchOff) >= 3);
        }
    }

    private static Bitmap draw(Switch toggle) {
        int any = View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED);
        toggle.measure(any, any);
        toggle.layout(0, 0, toggle.getMeasuredWidth(), toggle.getMeasuredHeight());
        Bitmap pixels = Bitmap.createBitmap(toggle.getWidth(), toggle.getHeight(), Bitmap.Config.ARGB_8888);
        toggle.draw(new Canvas(pixels));
        return pixels;
    }

    private static void assertPixel(String what, int expected, Bitmap pixels, int x, int y) {
        assertEquals(what + " at " + x + "," + y, Integer.toHexString(expected), Integer.toHexString(pixels.getPixel(x, y)));
    }

    private static double contrast(int a, int b) {
        double one = Color.luminance(a), other = Color.luminance(b);
        return (Math.max(one, other) + 0.05) / (Math.min(one, other) + 0.05);
    }
}
