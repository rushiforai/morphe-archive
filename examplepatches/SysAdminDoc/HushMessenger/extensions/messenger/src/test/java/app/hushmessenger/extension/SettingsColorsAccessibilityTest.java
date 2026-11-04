package app.hushmessenger.extension;

import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Switch;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** Every color pair of the settings layout at its contrast target in both looks, and every corner on the radius scale. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36, qualifiers = "w411dp-h891dp-mdpi")
public class SettingsColorsAccessibilityTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
    }

    @After public void restore() {
        Settings.initialize(RuntimeEnvironment.getApplication());
    }

    @Test public void textReadsOnThePageTheCardsAndTheDialogs() {
        for (boolean light : new boolean[] {false, true}) {
            SettingsUi ui = new SettingsUi(RuntimeEnvironment.getApplication(), light);
            String look = light ? "light" : "dark";
            for (int ground : new int[] {ui.background, ui.card, ui.dialog}) {
                for (int text : new int[] {ui.text, ui.muted, ui.hint, ui.error})
                    assertAtLeast(look + " text " + hex(text) + " on " + hex(ground), 4.5, text, ground);
                // The heading color reaches 7:1 where Messenger's blue allows it, and never drops under 4.5.
                assertAtLeast(look + " heading on " + hex(ground), light ? 4.5 : 7, ui.heading, ground);
                for (int stop : light ? ShimmerTitle.LIGHT : ShimmerTitle.DARK)
                    assertAtLeast(look + " gradient stop " + hex(stop) + " on " + hex(ground), 7, stop, ground);
            }
            assertAtLeast(look + " white on the accent fill", 4.5, ui.onAccent, ui.accentFill);
            assertAtLeast(look + " warning on its surface", 4.5, ui.warning, ui.warningSurface);
            assertAtLeast(look + " heading on the icon surface", 3, ui.heading, ui.iconSurface);
        }
    }

    @Test public void outlinesSwitchesAndIconsStandOutFromWhatTheySitOn() {
        for (boolean light : new boolean[] {false, true}) {
            SettingsUi ui = new SettingsUi(RuntimeEnvironment.getApplication(), light);
            String look = light ? "light" : "dark";
            for (int ground : new int[] {ui.background, ui.card, ui.dialog}) {
                assertAtLeast(look + " card outline on " + hex(ground), 3, ui.line, ground);
                assertAtLeast(look + " off track on " + hex(ground), 3, ui.switchOff, ground);
                assertAtLeast(look + " field outline on " + hex(ground), 3, ui.outline, ground);
            }
            assertAtLeast(look + " off thumb on the off track", 3, ui.thumb, ui.switchOff);
            assertAtLeast(look + " on thumb on the on track", 3, ui.onAccent, ui.accentFill);
            // The ripple is the heading color at 20 percent.
            assertEquals(ui.heading & 0x00ffffff, ui.ripple & 0x00ffffff);
            assertEquals(0x33, ui.ripple >>> 24);
        }
    }

    @Test public void theDarkLookIsBlackAndKeepsMessengersBlue() {
        SettingsUi ui = new SettingsUi(RuntimeEnvironment.getApplication(), false);
        assertEquals(0xff000000, ui.background);
        assertEquals(0xff000000, ui.card);
        assertEquals(0xff000000, ui.dialog);
        assertEquals(0xff0866ff, ui.accentFill);
    }

    @Test public void switchesAreASquareThumbOnASquaredTrack() {
        for (boolean light : new boolean[] {false, true}) {
            SettingsUi ui = new SettingsUi(RuntimeEnvironment.getApplication(), light);
            Switch toggle = ui.toggle("test", "Test", "", false);
            Drawable thumb = toggle.getThumbDrawable(), track = toggle.getTrackDrawable();
            // A 20 dp thumb with 2 dp of track showing around it, in a 40 by 24 dp track.
            assertEquals(24, thumb.getIntrinsicHeight());
            assertEquals(40, track.getIntrinsicWidth());
            assertEquals(24, track.getIntrinsicHeight());
            int[][] states = {{android.R.attr.state_enabled, android.R.attr.state_checked}, {android.R.attr.state_enabled},
                {android.R.attr.state_checked}, {}};
            int[] thumbs = {ui.onAccent, ui.thumb, SettingsUi.half(ui.onAccent), SettingsUi.half(ui.thumb)};
            // A switch that can't be used shows the off track at half strength, whether it's saved on or off.
            int[] tracks = {ui.accentFill, ui.switchOff, SettingsUi.half(ui.switchOff), SettingsUi.half(ui.switchOff)};
            for (int i = 0; i < states.length; i++) {
                thumb.setState(states[i]);
                track.setState(states[i]);
                GradientDrawable handle = (GradientDrawable) ((InsetDrawable) thumb.getCurrent()).getDrawable();
                GradientDrawable rail = (GradientDrawable) track.getCurrent();
                assertEquals(20, handle.getIntrinsicWidth());
                assertEquals(4f, handle.getCornerRadius(), 0f);
                assertEquals(6f, rail.getCornerRadius(), 0f);
                assertEquals("thumb in state " + i, thumbs[i], handle.getColor().getDefaultColor());
                assertEquals("track in state " + i, tracks[i], rail.getColor().getDefaultColor());
            }
        }
    }

    @Test public void everyCornerOnTheSettingsPageIsOnTheScaleAndNothingIsAPill() {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                List<String> bad = new ArrayList<>();
                int seen = 0;
                for (String tab : new String[] {"tab_controls", "tab_app"}) {
                    root.findViewWithTag(tab).performClick();
                    lay(root);
                    seen += corners(root, bad);
                }
                assertTrue("corners checked: " + seen, seen > 20);
                assertTrue((light ? "light: " : "dark: ") + bad, bad.isEmpty());
            }
        }
    }

    /** A switch that can't be used dims its title and summary, but the line saying why keeps the muted color's full 4.5:1. */
    @Test @Config(sdk = 29) public void theReasonASwitchIsOffLimitsKeepsItsContrast() {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                SettingsUi ui = new SettingsUi(screen.get(), light);
                String look = light ? "light" : "dark";
                android.widget.TextView why = root.findViewWithTag("unavailable_bubbles");
                assertNotNull(look, why);
                assertEquals(look, 1f, why.getAlpha(), 0f);
                assertEquals(look, ui.muted, why.getCurrentTextColor());
                assertAtLeast(look + " reason on the card", 4.5, why.getCurrentTextColor(), ui.card);
                String reason = new SettingsText(screen.get()).format("unavailable");
                assertTrue(look, why.getText().toString().contains(reason));
                Switch bubbles = root.findViewWithTag("bubbles");
                assertTrue(look + ": TalkBack still hears the reason", bubbles.getContentDescription().toString().endsWith(reason));
            }
        }
    }

    @Test public void buttonsThatRemoveSomethingAreTheErrorColorAndLookOffWhenDisabled() {
        for (boolean light : new boolean[] {false, true}) {
            SettingsUi ui = new SettingsUi(RuntimeEnvironment.getApplication(), light);
            String look = light ? "light" : "dark";
            android.widget.Button remove = ui.destructiveButton("Remove");
            assertEquals(look, ui.error, remove.getCurrentTextColor());
            for (int ground : new int[] {ui.card, ui.dialog}) assertAtLeast(look + " remove text on " + hex(ground), 4.5, ui.error, ground);
            remove.setEnabled(false);
            assertEquals(look + " a disabled one is muted like the rest", ui.muted, remove.getCurrentTextColor());
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                android.widget.Button clear = screen.get().getWindow().getDecorView().findViewWithTag("message_log_clear");
                assertNotNull(look, clear);
                assertEquals(look + " Clear log", ui.error, clear.getCurrentTextColor());
            }
        }
    }

    @Test public void notesWarnInAmberAndInformInBlue() {
        for (boolean light : new boolean[] {false, true}) {
            SettingsUi ui = new SettingsUi(RuntimeEnvironment.getApplication(), light);
            String look = light ? "light" : "dark";
            android.widget.TextView caution = ui.notice("Careful", true), info = ui.notice("Note", false);
            assertEquals(look, ui.warning, caution.getCurrentTextColor());
            assertEquals(look, ui.warningSurface, ((GradientDrawable) caution.getBackground()).getColor().getDefaultColor());
            assertEquals(look, ui.infoSurface, ((GradientDrawable) info.getBackground()).getColor().getDefaultColor());
            assertAtLeast(look + " muted on the info surface", 4.5, ui.muted, ui.infoSurface);
        }
    }

    /** Counts the rounded shapes behind every view, adding any off the 0, 4, 6, 8, 10, 12 dp scale or round end to end. */
    private static int corners(View view, List<String> bad) {
        int seen = shapes(view.getBackground(), view, bad);
        if (view instanceof ViewGroup)
            for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) seen += corners(((ViewGroup) view).getChildAt(i), bad);
        return seen;
    }

    private static int shapes(Drawable drawable, View owner, List<String> bad) {
        if (drawable == null) return 0;
        int seen = 0;
        if (drawable instanceof LayerDrawable) {
            LayerDrawable layers = (LayerDrawable) drawable;
            for (int i = 0; i < layers.getNumberOfLayers(); i++) seen += shapes(layers.getDrawable(i), owner, bad);
        } else if (drawable instanceof StateListDrawable) {
            StateListDrawable states = (StateListDrawable) drawable;
            for (int i = 0; i < states.getStateCount(); i++) seen += shapes(states.getStateDrawable(i), owner, bad);
        } else if (drawable instanceof InsetDrawable) {
            seen += shapes(((InsetDrawable) drawable).getDrawable(), owner, bad);
        } else if (drawable instanceof GradientDrawable) {
            GradientDrawable shape = (GradientDrawable) drawable;
            float density = owner.getResources().getDisplayMetrics().density;
            float[] radii = shape.getCornerRadii();
            float[] each = radii != null ? radii : new float[] {shape.getCornerRadius()};
            for (float radius : each) {
                float dp = radius / density;
                boolean onScale = false;
                for (int step : new int[] {0, 4, 6, 8, 10, 12}) onScale |= Math.abs(dp - step) < 0.01f;
                if (!onScale) bad.add(owner.getTag() + " radius " + dp);
                int side = Math.min(owner.getWidth(), owner.getHeight());
                if (radius > 0 && side > 0 && 2 * radius >= side) bad.add(owner.getTag() + " pill " + dp + " on " + side);
            }
            if (shape.getShape() == GradientDrawable.OVAL) bad.add(owner.getTag() + " oval");
            seen++;
        }
        return seen;
    }

    private static void lay(View root) {
        for (int pass = 0; pass < 2; pass++) {
            root.measure(View.MeasureSpec.makeMeasureSpec(411, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(891, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, 411, 891);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
    }

    private static void assertAtLeast(String what, double target, int first, int second) {
        double ratio = contrast(first, second);
        assertTrue(what + ": " + String.format(java.util.Locale.ROOT, "%.2f", ratio) + " under " + target, ratio >= target);
    }

    private static String hex(int color) { return String.format("#%06X", color & 0xffffff); }

    private static double contrast(int first, int second) {
        double[] luminance = new double[2], weights = {0.2126, 0.7152, 0.0722};
        int[] colors = {first, second};
        for (int color = 0; color < 2; color++) for (int channel = 0; channel < 3; channel++) {
            double value = ((colors[color] >>> (16 - 8 * channel)) & 255) / 255.0;
            luminance[color] += weights[channel] * (value <= 0.04045 ? value / 12.92 : Math.pow((value + 0.055) / 1.055, 2.4));
        }
        return (Math.max(luminance[0], luminance[1]) + 0.05) / (Math.min(luminance[0], luminance[1]) + 0.05);
    }
}
