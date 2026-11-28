
package app.hushgram.extension.instagram.settings;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.util.TypedValue;
import android.view.View;

/**
 * Reusable Liquid Glass surfaces for HushGram Settings.
 *
 * This class only controls visual backgrounds.
 * It does not read or modify any setting values.
 */
final class LiquidGlassSurfaces {

    private static final int GLASS_TOP = 0xE62A3044;
    private static final int GLASS_BOTTOM = 0xCC171D2B;
    private static final int GLASS_BORDER = 0x55FFFFFF;
    private static final int GLASS_RIPPLE = 0x33FFFFFF;

    private LiquidGlassSurfaces() {
    }

    /**
     * Main Settings page background.
     */
    static Drawable pageBackground(Context context) {
        GradientDrawable background = new GradientDrawable(
                GradientDrawable.Orientation.TL_BR,
                new int[] {
                        0xFF101827,
                        0xFF111522,
                        0xFF090D17
                }
        );

        background.setGradientType(GradientDrawable.LINEAR_GRADIENT);
        return background;
    }

    /**
     * Default glass card.
     */
    static Drawable card(Context context) {
        return card(context, false, 0xFF9B8CFF);
    }

    /**
     * Glass card with selected state.
     */
    static Drawable card(
            Context context,
            boolean selected,
            int accent
    ) {
        int top = selected
                ? blend(GLASS_TOP, accent, 0.18f)
                : GLASS_TOP;

        int bottom = selected
                ? blend(GLASS_BOTTOM, accent, 0.10f)
                : GLASS_BOTTOM;

        GradientDrawable surface = new GradientDrawable(
                GradientDrawable.Orientation.TL_BR,
                new int[] { top, bottom }
        );

        surface.setCornerRadius(dp(context, 20));

        surface.setStroke(
                dp(context, selected ? 2 : 1),
                selected ? withAlpha(accent, 190) : GLASS_BORDER
        );

        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        mask.setCornerRadius(dp(context, 20));

        return new RippleDrawable(
                ColorStateList.valueOf(GLASS_RIPPLE),
                surface,
                mask
        );
    }

    /**
     * Small glass chip for category navigation.
     */
    static Drawable chip(
            Context context,
            boolean selected,
            int accent
    ) {
        GradientDrawable surface = new GradientDrawable();

        surface.setColor(
                selected
                        ? blend(GLASS_TOP, accent, 0.28f)
                        : 0xCC20283A
        );

        surface.setCornerRadius(dp(context, 24));

        surface.setStroke(
                dp(context, selected ? 2 : 1),
                selected ? withAlpha(accent, 210) : GLASS_BORDER
        );

        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        mask.setCornerRadius(dp(context, 24));

        return new RippleDrawable(
                ColorStateList.valueOf(GLASS_RIPPLE),
                surface,
                mask
        );
    }

    /**
     * Apply a glass card to an existing view.
     */
    static void applyCard(
            View view,
            boolean selected,
            int accent
    ) {
        if (view == null) return;

        view.setBackground(
                card(view.getContext(), selected, accent)
        );
    }

    /**
     * Convert dp to pixels.
     */
    static int dp(Context context, float value) {
        return Math.round(
                TypedValue.applyDimension(
                        TypedValue.COMPLEX_UNIT_DIP,
                        value,
                        context.getResources().getDisplayMetrics()
                )
        );
    }

    /**
     * Blend two RGB colours.
     */
    private static int blend(
            int base,
            int overlay,
            float amount
    ) {
        float ratio = Math.max(0f, Math.min(1f, amount));

        int red = Math.round(
                Color.red(base) * (1f - ratio)
                        + Color.red(overlay) * ratio
        );

        int green = Math.round(
                Color.green(base) * (1f - ratio)
                        + Color.green(overlay) * ratio
        );

        int blue = Math.round(
                Color.blue(base) * (1f - ratio)
                        + Color.blue(overlay) * ratio
        );

        return Color.rgb(red, green, blue);
    }

    /**
     * Set alpha without changing RGB.
     */
    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF)
                | ((alpha & 0xFF) << 24);
    }
}
