package com.anderson.applemusic.one.theme;

import android.graphics.Outline;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewOutlineProvider;

/**
 * Rounded {@link GradientDrawable} factories and the matching outline clipping, the
 * framework-only equivalent of the companions' {@code RoundedCornerShape} + {@code clip}
 * modifiers. No resources, no shadow animation: elevation is a single painted
 * {@link android.graphics.drawable.LayerDrawable} when needed.
 */
public final class Shapes {

    private Shapes() {
    }

    public static GradientDrawable rounded(int fill, float radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(fill);
        drawable.setCornerRadius(Tokens.dp(radiusDp));
        return drawable;
    }

    public static GradientDrawable rounded(int fill, float radiusDp, int stroke, float strokeDp) {
        GradientDrawable drawable = rounded(fill, radiusDp);
        drawable.setStroke(Tokens.dp(strokeDp), stroke);
        return drawable;
    }

    public static GradientDrawable pill(int fill) {
        return rounded(fill, Tokens.RADIUS_PILL);
    }

    public static GradientDrawable pill(int fill, int stroke, float strokeDp) {
        return rounded(fill, Tokens.RADIUS_PILL, stroke, strokeDp);
    }

    public static GradientDrawable circle(int fill) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.OVAL);
        drawable.setColor(fill);
        return drawable;
    }

    public static GradientDrawable circle(int fill, int stroke, float strokeDp) {
        GradientDrawable drawable = circle(fill);
        drawable.setStroke(Tokens.dp(strokeDp), stroke);
        return drawable;
    }

    /** Bottom-up black scrim painted over a cover so the title stays readable. */
    public static GradientDrawable coverScrim() {
        return new GradientDrawable(GradientDrawable.Orientation.BOTTOM_TOP,
                new int[]{0xF2000000, 0xB3000000, 0x00000000});
    }

    /** Full-player wash: dark tinted top fading into black, derived from the cover. */
    public static GradientDrawable playerWash(int dominant) {
        int top = ColorArt.blend(dominant, 0xFF000000, 0.42f);
        int middle = ColorArt.blend(dominant, 0xFF000000, 0.78f);
        return new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
                new int[]{top, middle, 0xFF000000});
    }

    /** Rounds (and clips) a view, including its children, to {@code radiusDp}. */
    public static void clip(final View view, final float radiusDp) {
        view.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View target, Outline outline) {
                outline.setRoundRect(0, 0, target.getWidth(), target.getHeight(),
                        Tokens.dp(radiusDp));
            }
        });
        view.setClipToOutline(true);
    }

    /** Cheap static elevation: one transparent 2 dp layer, no animator. */
    public static void lift(View view) {
        view.setElevation(Tokens.dp(2));
    }
}
