/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.TypedArray;
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

import java.lang.reflect.Method;

import app.morphe.extension.facebook.theme.TonePalette;

/**
 * Every Hushfacebook title in Facebook's blues: every stop reads at 7:1 on each surface a title
 * sits on and keeps its hue there, a sheen sweeps as the title opens and once each period, the
 * colours drift without a jump, a worn title is drawn in more than one colour and in different ones
 * as time passes, and it keeps moving on screen with Android's animations off, as the S22 runs
 * (2026-10-26).
 */
@RunWith(RobolectricTestRunner.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(sdk = 30, qualifiers = "w411dp-h891dp-xxhdpi")
public class ShimmerTitleTest {
    /** The surfaces titles sit on: each palette's page and dialog, the lock cover, and AMOLED Backgrounds. */
    private static int[] surfaces() {
        ScreenColors light = ScreenColors.of(TonePalette.fallback(), true);
        ScreenColors dark = ScreenColors.of(TonePalette.fallback(), false);
        return new int[]{ScreenColors.DEFAULT.background, ScreenColors.DEFAULT.dialog, light.background, light.dialog,
                dark.background, dark.dialog, Color.BLACK, 0xFF0D1117, 0xFF1E1E2E, 0xFF242526, Color.WHITE};
    }

    /**
     * Inside a frame the animation clock never reads earlier than the last time read outside one.
     * That time outlives each test while Robolectric winds the uptime back, so a test after one that
     * ran its clock further would see the title's clock stand still. A read outside a frame takes
     * the current uptime.
     */
    @Before
    public void startTheAnimationClockFromThisTest() {
        AnimationUtils.currentAnimationTimeMillis();
    }

    @Test
    public void everyGradientStopReadsOnEverySurfaceATitleSitsOn() {
        for (int surface : surfaces()) {
            for (int color : ShimmerTitle.colorsOn(surface)) {
                assertTrue(Integer.toHexString(color) + " on " + Integer.toHexString(surface),
                        ShimmerTitle.contrast(color, surface) >= ShimmerTitle.CONTRAST);
            }
        }
    }

    @Test
    public void everyStopKeepsFacebooksHue() {
        for (int surface : surfaces()) {
            int[] stops = ShimmerTitle.colorsOn(surface);
            for (int i = 0; i < stops.length; i++) {
                float wanted = hue(ShimmerTitle.BRAND[i]);
                float drawn = hue(stops[i]);
                float apart = Math.abs(wanted - drawn);
                assertTrue(Integer.toHexString(stops[i]) + " left the hue of " + Integer.toHexString(ShimmerTitle.BRAND[i]),
                        Math.min(apart, 360f - apart) <= 4f);
            }
        }
    }

    @Test
    public void onTheBlackPageFacebooksBlueIsOnlyLiftedAsFarAsItMustBe() {
        int blue = ShimmerTitle.colorsOn(Color.BLACK)[0];
        assertTrue(ShimmerTitle.contrast(blue, Color.BLACK) < ShimmerTitle.CONTRAST + 0.2);
        assertEquals("the cyan already reads on black", ShimmerTitle.BRAND[1], ShimmerTitle.colorsOn(Color.BLACK)[1]);
    }

    @Test
    public void aSweepRunsAsTheTitleOpensAndOnceEachPeriod() {
        assertEquals(0f, ShimmerTitle.sweep(0L), 0f);
        assertEquals(0.5f, ShimmerTitle.sweep(ShimmerTitle.SWEEP_MS / 2), 0.001f);
        assertEquals(-1f, ShimmerTitle.sweep(ShimmerTitle.SWEEP_MS), 0f);
        assertEquals(-1f, ShimmerTitle.sweep(ShimmerTitle.PERIOD_MS - 1), 0f);
        assertEquals(0f, ShimmerTitle.sweep(ShimmerTitle.PERIOD_MS), 0f);
        assertEquals(-1f, ShimmerTitle.sweep(-5L), 0f);
    }

    @Test
    public void theColoursDriftRoundAndStartAgainWhereTheyBegan() {
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

    @Test
    public void aWornTitleIsDrawnInTheGradientAndChangesAsItDrifts() {
        TextView title = title("Search settings");
        ShimmerTitle.wear(title, ScreenColors.DEFAULT.background);
        assertTrue(ShimmerTitle.wears(title));
        // A whole drift round on, between sweeps: Facebook's blue at the start, its cyan next.
        assertEquals(-1f, ShimmerTitle.sweep(ShimmerTitle.DRIFT_MS), 0f);
        Bitmap still = draw(title, ShimmerTitle.DRIFT_MS);
        assertTrue("blue letters", anyPixel(still, false));
        assertTrue("cyan letters", anyPixel(still, true));
        Bitmap later = draw(title, ShimmerTitle.DRIFT_MS + ShimmerTitle.DRIFT_MS / 4);
        assertFalse("the colours moved", still.sameAs(later));
        Bitmap sweeping = draw(title, ShimmerTitle.SWEEP_MS / 2);
        assertTrue("the sheen pass still shows the gradient", anyPixel(sweeping, true));
    }

    @Test
    public void wearingAgainOnANewSurfaceFollowsIt() {
        TextView title = title("Hushfacebook");
        ShimmerTitle.wear(title, Color.BLACK);
        ShimmerTitle.wear(title, Color.WHITE);
        for (int color : ShimmerTitle.stopsOf(title)) {
            assertTrue(ShimmerTitle.contrast(color, Color.WHITE) >= ShimmerTitle.CONTRAST);
        }
    }

    /** The clipboard offer keeps Facebook's dialog, and its title reads on that dialog's own colour. */
    @Test
    public void aDialogInFacebooksThemeHasItsTitleWornOnItsOwnColour() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            AlertDialog dialog = new AlertDialog.Builder(controller.get())
                    .setTitle("Download the video you copied?").setMessage("link").create();
            dialog.show();
            try {
                ShimmerTitle.wearTitleOf(dialog);
                int titleId = dialog.getContext().getResources().getIdentifier("alertTitle", "id", "android");
                TextView title = dialog.findViewById(titleId);
                assertNotNull(title);
                assertTrue(ShimmerTitle.wears(title));
                TypedArray styled = dialog.getContext().obtainStyledAttributes(new int[]{android.R.attr.colorBackground});
                int surface = styled.getColor(0, Color.BLACK) | 0xFF000000;
                styled.recycle();
                for (int color : ShimmerTitle.stopsOf(title)) {
                    assertTrue(ShimmerTitle.contrast(color, surface) >= ShimmerTitle.CONTRAST);
                }
            } finally {
                dialog.dismiss();
            }
        }
    }

    @Test
    public void aTitleOnScreenKeepsMovingWithAnimationsOff() throws Exception {
        Method scale = ValueAnimator.class.getMethod("setDurationScale", float.class);
        scale.invoke(null, 0f);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            assertFalse(ValueAnimator.areAnimatorsEnabled());
            TextView title = title("Hushfacebook");
            FrameLayout root = new FrameLayout(controller.get());
            root.addView(title);
            controller.get().setContentView(root);
            ShimmerTitle.wear(title, ScreenColors.DEFAULT.background);
            assertNotNull("the gradient is on as the title opens", shift(title, 100));
            // Past the opening sweep the paint holds the drifting gradient alone.
            Float first = shift(title, ShimmerTitle.SWEEP_MS + 200);
            Float later = shift(title, 500);
            assertNotNull(first);
            assertNotNull(later);
            assertTrue("the colours drifted with animations off: " + first + " then " + later, later > first);
        } finally {
            scale.invoke(null, 1f);
        }
    }

    /**
     * Facebook in the background keeps the lock cover and an open settings dialog up with their
     * windows hidden: the title schedules nothing then, and moves again once its window shows.
     */
    @Test
    public void aTitleInAHiddenWindowWakesNothingUntilItShowsAgain() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            TextView title = title("Facebook is locked");
            FrameLayout root = new FrameLayout(controller.get());
            root.addView(title);
            controller.get().setContentView(root);
            ShimmerTitle.wear(title, Color.BLACK);
            ShadowLooper.idleMainLooper(ShimmerTitle.SWEEP_MS + 200, java.util.concurrent.TimeUnit.MILLISECONDS);

            appVisible(title, false);
            ShadowLooper.idleMainLooper(1000, java.util.concurrent.TimeUnit.MILLISECONDS);
            assertEquals(View.GONE, title.getWindowVisibility());
            assertTrue("the hidden title kept waking the main thread",
                    ShadowLooper.shadowMainLooper().getNextScheduledTaskTime().isZero());

            appVisible(title, true);
            // Back on screen the sheen plays as it does on opening, then the drift goes on alone.
            Float first = shift(title, ShimmerTitle.SWEEP_MS + 200);
            Float later = shift(title, 500);
            assertNotNull(first);
            assertNotNull(later);
            assertTrue("the title didn't move again once shown: " + first + " then " + later, later > first);
        }
    }

    /** Android showing or hiding [view]'s window, as it does when Facebook leaves and comes back. */
    public static void appVisible(View view, boolean visible) throws Exception {
        Object viewRoot = View.class.getMethod("getViewRootImpl").invoke(view.getRootView());
        assertNotNull(viewRoot);
        viewRoot.getClass().getMethod("dispatchAppVisibility", boolean.class).invoke(viewRoot, visible);
        ShadowLooper.idleMainLooper();
    }

    /** A worn title doesn't keep itself, or the screen it belongs to, in memory. */
    @Test
    public void aWornTitleCanBeLetGo() {
        java.lang.ref.WeakReference<TextView> gone = wornAndDropped();
        for (int i = 0; i < 20 && gone.get() != null; i++) {
            System.gc();
            System.runFinalization();
        }
        assertNull("the gradient kept its title alive", gone.get());
    }

    private static java.lang.ref.WeakReference<TextView> wornAndDropped() {
        TextView title = title("Hushfacebook");
        ShimmerTitle.wear(title, Color.BLACK);
        assertTrue(ShimmerTitle.wears(title));
        return new java.lang.ref.WeakReference<>(title);
    }

    /** Runs the main looper [ms] on and gives how far the title's shader is moved along x, if any. */
    private static Float shift(TextView title, long ms) {
        ShadowLooper.idleMainLooper(ms, java.util.concurrent.TimeUnit.MILLISECONDS);
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
        title.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
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

    /**
     * Whether a solid letter pixel is clearly cyan (green well over red, blue close to green) or,
     * for not [cyan], clearly Facebook blue (blue well over green).
     */
    private static boolean anyPixel(Bitmap bitmap, boolean cyan) {
        for (int x = 0; x < bitmap.getWidth(); x++) {
            for (int y = 0; y < bitmap.getHeight(); y++) {
                int pixel = bitmap.getPixel(x, y);
                if (Color.alpha(pixel) < 250) continue;
                int red = Color.red(pixel), green = Color.green(pixel), blue = Color.blue(pixel);
                if (cyan ? green - red > 80 && blue - green < 50 : blue - green > 70) return true;
            }
        }
        return false;
    }

    private static float hue(int color) {
        float[] hsv = new float[3];
        Color.colorToHSV(color, hsv);
        return hsv[0];
    }
}
