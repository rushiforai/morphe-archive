package app.hushmessenger.extension;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Shader;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.lang.reflect.Method;
import java.util.concurrent.TimeUnit;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowLooper;
import static org.junit.Assert.*;

/**
 * Every HushMessenger title in Messenger's gradient: every stop reads at 7:1 on its theme's page and panels, a sheen
 * sweeps as the title opens and once each period, the colors drift without a jump, a worn title draws in more than one
 * hue and in different ones as time passes, and it keeps moving with Android's animations off, as the S22 runs.
 */
@RunWith(RobolectricTestRunner.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(sdk = {28, 36}, qualifiers = "w411dp-h891dp-xxhdpi")
public class ShimmerTitleTest {
    @Before public void reset() {
        CrashGuard.resetForTests();
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
        // Inside a frame the animation clock reads the later of the frame's time and the last time read on this
        // thread, which outlives a test. After a test that ran its clock far on, every frame here would read that same
        // later time and the title would seem frozen. One read outside a frame brings it back to now.
        AnimationUtils.currentAnimationTimeMillis();
    }

    @Test public void everyStopReadsAtSevenToOneOnItsThemesPageAndPanels() {
        for (boolean light : new boolean[] {false, true}) {
            SettingsUi ui = new SettingsUi(RuntimeEnvironment.getApplication(), light);
            for (int color : light ? ShimmerTitle.LIGHT : ShimmerTitle.DARK)
                for (int behind : new int[] {ui.background, ui.surface})
                    assertTrue(Integer.toHexString(color) + " on " + Integer.toHexString(behind), contrast(color, behind) >= 7.0);
        }
    }

    @Test public void aSweepRunsAsTheTitleOpensAndOnceEachPeriod() {
        assertEquals(0f, ShimmerTitle.sweep(0L), 0f);
        assertEquals(0.5f, ShimmerTitle.sweep(ShimmerTitle.SWEEP_MS / 2), 0.001f);
        assertEquals(-1f, ShimmerTitle.sweep(ShimmerTitle.SWEEP_MS), 0f);
        assertEquals(-1f, ShimmerTitle.sweep(ShimmerTitle.PERIOD_MS - 1), 0f);
        assertEquals(0f, ShimmerTitle.sweep(ShimmerTitle.PERIOD_MS), 0f);
        assertEquals(0f, ShimmerTitle.sweep(3 * ShimmerTitle.PERIOD_MS), 0f);
        assertEquals(-1f, ShimmerTitle.sweep(-5L), 0f);
    }

    @Test public void theColorsDriftRoundAndStartAgainWhereTheyBegan() {
        assertEquals(0f, ShimmerTitle.drift(0L), 0f);
        assertEquals(0f, ShimmerTitle.drift(-5L), 0f);
        assertEquals(0.5f, ShimmerTitle.drift(ShimmerTitle.DRIFT_MS / 2), 0.001f);
        assertEquals(0f, ShimmerTitle.drift(ShimmerTitle.DRIFT_MS), 0f);
        float before = 0f;
        for (int step = 1; step < 20; step++) {
            float now = ShimmerTitle.drift(step * ShimmerTitle.DRIFT_MS / 20);
            assertTrue(now > before);
            before = now;
        }
    }

    @Test public void aWornTitleIsDrawnInTheGradientAndChangesAsItDrifts() {
        for (boolean light : new boolean[] {false, true}) {
            TextView title = title("HushMessenger");
            ShimmerTitle.wear(title, light);
            assertTrue(ShimmerTitle.wears(title));
            assertEquals(Color.WHITE, title.getCurrentTextColor());
            // A whole drift round on, between sweeps: blue at the start, orange at the end.
            assertEquals(-1f, ShimmerTitle.sweep(ShimmerTitle.DRIFT_MS), 0f);
            Bitmap still = draw(title, ShimmerTitle.DRIFT_MS);
            assertTrue(light + " warm letters", anyPixel(still, true));
            assertTrue(light + " cool letters", anyPixel(still, false));
            Bitmap later = draw(title, ShimmerTitle.DRIFT_MS + ShimmerTitle.DRIFT_MS / 4);
            assertFalse(light + " the colors moved", still.sameAs(later));
            Bitmap sweeping = draw(title, ShimmerTitle.SWEEP_MS / 2);
            assertTrue(light + " the sheen pass still shows the gradient", anyPixel(sweeping, true));
        }
    }

    @Test public void wearingATitleTwiceKeepsOneLoop() {
        TextView title = title("HushMessenger");
        ShimmerTitle.wear(title, false);
        draw(title, ShimmerTitle.DRIFT_MS);
        Shader first = title.getPaint().getShader();
        assertNotNull(first);
        ShimmerTitle.wear(title, true);
        draw(title, ShimmerTitle.DRIFT_MS);
        // Still the dark stops: the second wear changed nothing, so the same gradient is reused.
        assertSame(first, title.getPaint().getShader());
    }

    /** Laid out before the loop's first frame, the title is already in the gradient, never plain white. */
    @Test public void aTitleIsInTheGradientFromItsFirstDraw() {
        TextView title = title("HushMessenger");
        ShimmerTitle.wear(title, false);
        assertNull(title.getPaint().getShader());
        title.measure(View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        title.layout(0, 0, title.getMeasuredWidth(), title.getMeasuredHeight());
        assertNotNull("the first draw shows the gradient", title.getPaint().getShader());
    }

    /** A worn title doesn't keep itself, or the screen it belongs to, in memory. */
    @Test public void aWornTitleCanBeLetGo() {
        java.lang.ref.WeakReference<TextView> gone = wornAndDropped();
        for (int round = 0; round < 50 && gone.get() != null; round++) {
            System.gc();
            System.runFinalization();
        }
        assertNull("the gradient kept its title alive", gone.get());
    }

    private static java.lang.ref.WeakReference<TextView> wornAndDropped() {
        TextView title = title("HushMessenger");
        ShimmerTitle.wear(title, false);
        assertTrue(ShimmerTitle.wears(title));
        return new java.lang.ref.WeakReference<>(title);
    }

    @Test public void aTitleOnScreenKeepsMovingWithAnimationsOff() throws Exception {
        Method scale = ValueAnimator.class.getMethod("setDurationScale", float.class);
        scale.invoke(null, 0f);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            assertFalse(ValueAnimator.areAnimatorsEnabled());
            TextView title = title("HushMessenger");
            FrameLayout root = new FrameLayout(controller.get());
            root.addView(title);
            controller.get().setContentView(root);
            ShimmerTitle.wear(title, false);
            assertNotNull("the gradient is on as the title opens", shift(title, 100));
            // Past the opening sweep the paint holds the drifting gradient alone.
            Float first = shift(title, ShimmerTitle.SWEEP_MS + 200);
            Float later = shift(title, 500);
            assertNotNull(first);
            assertNotNull(later);
            assertTrue("the colors drifted with animations off: " + first + " then " + later, later > first);
            // Taken off screen, the loop stops: the shader holds where it was.
            root.removeView(title);
            Float detached = shift(title, 0);
            assertEquals(detached, shift(title, 1000));
        } finally {
            scale.invoke(null, 1f);
        }
    }

    @Test public void everyHushMessengerTitleWearsTheGradient() {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                assertTrue(ShimmerTitle.wears(root.findViewWithTag("wordmark")));
                assertTrue(ShimmerTitle.wears(root.findViewWithTag("empty_title")));
                SettingsDialog sheet = new SettingsDialog(screen.get(), new SettingsUi(screen.get(), light),
                    new SettingsText(screen.get()), "Message log", "hint");
                assertTrue(ShimmerTitle.wears(sheet.findViewWithTag("dialog_title")));
            }
        }
    }

    /** Runs the main looper ms on and gives how far the title's shader is moved along x, if any. */
    private static Float shift(TextView title, long ms) {
        ShadowLooper.idleMainLooper(ms, TimeUnit.MILLISECONDS);
        Shader shader = title.getPaint().getShader();
        if (shader == null) return null;
        Matrix local = new Matrix();
        shader.getLocalMatrix(local);
        float[] values = new float[9];
        local.getValues(values);
        return values[Matrix.MTRANS_X];
    }

    private static TextView title(String text) {
        TextView title = new TextView(RuntimeEnvironment.getApplication());
        // As in the bar: a laid-out TextView reads its layout params when its text changes.
        title.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        title.setText(text);
        return title;
    }

    private static Bitmap draw(TextView title, long sinceStart) {
        title.measure(View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        title.layout(0, 0, title.getMeasuredWidth(), title.getMeasuredHeight());
        ShimmerTitle.frameFor(title, sinceStart);
        Bitmap bitmap = Bitmap.createBitmap(title.getWidth(), title.getHeight(), Bitmap.Config.ARGB_8888);
        title.draw(new Canvas(bitmap));
        return bitmap;
    }

    /** Whether a solid letter pixel is clearly warm (red over blue) or, for not warm, clearly cool. */
    private static boolean anyPixel(Bitmap bitmap, boolean warm) {
        for (int x = 0; x < bitmap.getWidth(); x++)
            for (int y = 0; y < bitmap.getHeight(); y++) {
                int pixel = bitmap.getPixel(x, y);
                if (Color.alpha(pixel) < 250) continue;
                int lean = Color.red(pixel) - Color.blue(pixel);
                if (warm ? lean > 60 : lean < -60) return true;
            }
        return false;
    }

    private static double contrast(int one, int other) {
        double a = Color.luminance(one) + 0.05, b = Color.luminance(other) + 0.05;
        return Math.max(a, b) / Math.min(a, b);
    }
}
