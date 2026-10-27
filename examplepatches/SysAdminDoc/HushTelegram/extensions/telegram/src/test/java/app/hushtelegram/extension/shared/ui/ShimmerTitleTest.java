/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 *
 * Ported from https://github.com/SysAdminDoc/HushGram ShimmerTitleTest (2026-10-26).
 */
package app.hushtelegram.extension.shared.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Shader;
import android.util.Pair;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowLooper;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;

/**
 * Every HushTelegram title in Telegram's blues: every stop reads on black, a sheen sweeps as the
 * title opens and once each period, the colours drift without a jump, a worn title is drawn in
 * more than one blue and in different ones as time passes, it keeps moving on screen with
 * Android's animations off, as the S22 runs, and a dialog that follows a light Telegram theme
 * keeps its own title colour (2026-10-26).
 */
@RunWith(RobolectricTestRunner.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(sdk = 30, qualifiers = "w411dp-h891dp-xxhdpi")
public class ShimmerTitleTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Test
    public void everyGradientStopReadsOnBlackAndNoneOnWhite() {
        for (int color : ShimmerTitle.COLORS) {
            assertTrue(Integer.toHexString(color), ShimmerTitle.contrast(color, Color.BLACK) >= 7.0);
        }
        assertTrue(ShimmerTitle.readsOn(Color.BLACK));
        assertFalse("Telegram's light theme can't carry the blues", ShimmerTitle.readsOn(Color.WHITE));
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
        ShimmerTitle.wear(title);
        assertTrue(ShimmerTitle.wears(title));
        // A whole drift round on, between sweeps: sky blue at the start, periwinkle at the end.
        assertEquals(-1f, ShimmerTitle.sweep(ShimmerTitle.DRIFT_MS), 0f);
        Bitmap still = draw(title, ShimmerTitle.DRIFT_MS);
        assertTrue("sky blue letters", anyPixel(still, true));
        assertTrue("periwinkle letters", anyPixel(still, false));
        Bitmap later = draw(title, ShimmerTitle.DRIFT_MS + ShimmerTitle.DRIFT_MS / 4);
        assertFalse("the colours moved", still.sameAs(later));
        Bitmap sweeping = draw(title, ShimmerTitle.SWEEP_MS / 2);
        assertTrue("the sheen pass still shows the gradient", anyPixel(sweeping, true));
    }

    @Test
    public void aTitleOnScreenKeepsMovingWithAnimationsOff() throws Exception {
        Method scale = ValueAnimator.class.getMethod("setDurationScale", float.class);
        scale.invoke(null, 0f);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            assertFalse(ValueAnimator.areAnimatorsEnabled());
            TextView title = title("HushTelegram");
            FrameLayout root = new FrameLayout(controller.get());
            root.addView(title);
            controller.get().setContentView(root);
            ShimmerTitle.wear(title);
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
     * A worn title that's gone is let go, and with it its dialog and activity. Held strongly by
     * the map's own value, every dialog title stayed for good and a run of settings tests ran out
     * of memory.
     */
    @Test
    public void aTitleNoLongerUsedIsLetGo() throws Exception {
        java.lang.ref.WeakReference<TextView> gone = wornAndDropped();
        for (int i = 0; i < 20 && gone.get() != null; i++) {
            System.gc();
            Thread.sleep(10);
        }
        assertEquals(null, gone.get());
    }

    private static java.lang.ref.WeakReference<TextView> wornAndDropped() {
        TextView title = title("Reset all settings?");
        ShimmerTitle.wear(title);
        return new java.lang.ref.WeakReference<>(title);
    }

    /**
     * HushTelegram's own dialogs over a chat follow Telegram's theme. On a dark one the title
     * wears the blues, and on a light one, where they can't reach 7:1, it keeps the theme's text.
     */
    @Test
    public void aChatDialogTitleWearsTheBluesOnlyOnADarkTheme() throws Exception {
        Field dark = Utils.class.getDeclaredField("isDarkModeEnabled");
        dark.setAccessible(true);
        Object before = dark.get(null);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            dark.set(null, Boolean.TRUE);
            assertTrue("worn on a dark theme", ShimmerTitle.wears(dialogTitle(controller.get(), "Send message?")));
            dark.set(null, Boolean.FALSE);
            TextView light = dialogTitle(controller.get(), "Send message?");
            assertFalse("not worn on a light theme", ShimmerTitle.wears(light));
            assertEquals(Utils.getAppForegroundColor(), light.getCurrentTextColor());
        } finally {
            dark.set(null, before);
        }
    }

    private static TextView dialogTitle(Activity activity, String text) {
        Pair<Dialog, LinearLayout> dialog = CustomDialog.create(activity, text, null, null,
                "Send", () -> {}, () -> {}, null, null, true);
        try {
            View found = findText(dialog.second, text);
            assertNotNull(text, found);
            return (TextView) found;
        } finally {
            dialog.first.dismiss();
        }
    }

    private static View findText(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findText(group.getChildAt(i), text);
                if (found != null) return found;
            }
        }
        return null;
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
     * Whether a solid letter pixel is clearly Telegram's sky blue (a hue under 208) or, for not
     * [sky], clearly the periwinkle neighbour (a hue over 218).
     */
    private static boolean anyPixel(Bitmap bitmap, boolean sky) {
        float[] hsv = new float[3];
        for (int x = 0; x < bitmap.getWidth(); x++) {
            for (int y = 0; y < bitmap.getHeight(); y++) {
                int pixel = bitmap.getPixel(x, y);
                if (Color.alpha(pixel) < 250) continue;
                Color.colorToHSV(pixel, hsv);
                if (hsv[1] < 0.25f) continue;
                if (sky ? hsv[0] > 190 && hsv[0] < 208 : hsv[0] > 218 && hsv[0] < 240) return true;
            }
        }
        return false;
    }
}
