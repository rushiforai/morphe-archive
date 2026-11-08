package com.anderson.applemusic.one.widget;

import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.widget.FrameLayout;

import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;

/**
 * Focus and press feedback for every interactive element.
 *
 * <ul>
 *   <li>D-pad (TV): scale 1.05 over 160 ms plus the accent outline / surface swap.</li>
 *   <li>Touch (phone, head unit): no hover state, only a bounded ripple.</li>
 *   <li>Targets are never smaller than 48 dp; callers size the views.</li>
 * </ul>
 */
public final class Focus {

    private static final int RIPPLE = 0x33FFFFFF;

    private Focus() {
    }

    public static void attach(final View view, final float radiusDp, final int normalFill,
                              final int focusFill, final View outline) {
        attach(view, radiusDp, normalFill, focusFill, outline, true);
    }

    public static void attach(final View view, final float radiusDp, final int normalFill,
                              final int focusFill, final View outline, final boolean scale) {
        view.setFocusable(true);
        view.setClickable(true);
        if (outline != null) outline.setAlpha(0f);
        if (Tokens.touch()) {
            view.setBackground(ripple(normalFill, radiusDp));
            return;
        }
        view.setBackground(Shapes.rounded(normalFill, radiusDp));
        view.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View target, boolean focused) {
                if (scale) {
                    target.animate()
                            .scaleX(focused ? Tokens.FOCUS_SCALE : 1f)
                            .scaleY(focused ? Tokens.FOCUS_SCALE : 1f)
                            .setDuration(Tokens.FOCUS_MS)
                            .start();
                }
                target.setBackground(Shapes.rounded(
                        focused ? focusFill : normalFill, radiusDp));
                if (outline != null) {
                    outline.animate().alpha(focused ? 1f : 0f)
                            .setDuration(Tokens.FOCUS_MS).start();
                }
            }
        });
    }

    /** Adds the touch ripple as a foreground so it paints above cover art. */
    public static void rippleOnTop(View view, float radiusDp) {
        if (!Tokens.touch() || !(view instanceof FrameLayout)) return;
        GradientDrawable mask = Shapes.rounded(0xFFFFFFFF, radiusDp);
        ((FrameLayout) view).setForeground(new RippleDrawable(
                ColorStateList.valueOf(RIPPLE), null, mask));
    }

    private static RippleDrawable ripple(int fill, float radiusDp) {
        GradientDrawable content = Shapes.rounded(fill, radiusDp);
        GradientDrawable mask = Shapes.rounded(0xFFFFFFFF, radiusDp);
        return new RippleDrawable(ColorStateList.valueOf(RIPPLE), content, mask);
    }

    /** Icon-only controls: circular ripple on touch, scale + ring on D-pad. */
    public static void circle(final View view, int fill, final View ring) {
        view.setFocusable(true);
        view.setClickable(true);
        if (ring != null) ring.setAlpha(0f);
        if (Tokens.touch()) {
            GradientDrawable content = Shapes.circle(fill);
            GradientDrawable mask = Shapes.circle(0xFFFFFFFF);
            view.setBackground(new RippleDrawable(ColorStateList.valueOf(RIPPLE), content, mask));
            return;
        }
        view.setBackground(Shapes.circle(fill));
        view.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View target, boolean focused) {
                target.animate()
                        .scaleX(focused ? Tokens.FOCUS_SCALE : 1f)
                        .scaleY(focused ? Tokens.FOCUS_SCALE : 1f)
                        .setDuration(Tokens.FOCUS_MS)
                        .start();
                if (ring != null) {
                    ring.animate().alpha(focused ? 1f : 0f)
                            .setDuration(Tokens.FOCUS_MS).start();
                }
            }
        });
    }
}
