package app.template.extension.settings;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * A selectable, bordered card used by the "Reveal style" and "Bottom nav selected style" pickers:
 * a preview on top, a label + selection dot below. Shared so both dialogs behave and read
 * identically instead of being a plain stack of preview/label pairs with no visual separation.
 */
final class OptionCard {

    private OptionCard() {}

    /** No preview — just the label + selection dot, for pickers where a preview adds nothing. */
    static View build(Context ctx, float density, String label, boolean selected, int accent,
                      final Runnable onPick) {
        return build(ctx, density, null, 0f, label, selected, accent, onPick);
    }

    static View build(Context ctx, float density, View preview, float previewHeightDp,
                      String label, boolean selected, int accent, final Runnable onPick) {
        LinearLayout card = new LinearLayout(ctx);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setClickable(true);
        int pad = dp(density, 12);
        card.setPadding(pad, pad, pad, pad);

        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(dp(density, 14));
        int surface = SurfaceColors.elevated(ctx);
        bg.setColor(selected ? blend(accent, surface, 0.16f) : surface);
        bg.setStroke(dp(density, selected ? 2f : 1f), selected ? accent : 0xFF2E2E2E);
        card.setBackground(bg);

        if (preview != null) {
            LinearLayout.LayoutParams plp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, dp(density, previewHeightDp));
            card.addView(preview, plp);
        }

        LinearLayout row = new LinearLayout(ctx);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams rlp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        if (preview != null) rlp.topMargin = dp(density, 10);
        card.addView(row, rlp);

        TextView text = new TextView(ctx);
        text.setText(label);
        text.setTextColor(selected ? 0xFFFFFFFF : 0xFFCDCDCD);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        if (selected) text.setTypeface(text.getTypeface(), Typeface.BOLD);
        LinearLayout.LayoutParams tlp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        row.addView(text, tlp);
        row.addView(dot(ctx, density, selected, accent));

        card.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { onPick.run(); }
        });

        LinearLayout.LayoutParams outer = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        outer.bottomMargin = dp(density, 10);
        card.setLayoutParams(outer);
        return card;
    }

    /** A filled, accent-coloured checkmark when selected; a plain hollow ring otherwise. */
    private static View dot(Context ctx, float density, boolean selected, int accent) {
        int size = dp(density, 20);
        GradientDrawable d = new GradientDrawable();
        d.setShape(GradientDrawable.OVAL);
        if (selected) {
            d.setColor(accent);
            TextView check = new TextView(ctx);
            check.setText("✓");
            check.setGravity(Gravity.CENTER);
            check.setTextColor(0xFF10120F);
            check.setTypeface(check.getTypeface(), Typeface.BOLD);
            check.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            check.setBackground(d);
            check.setLayoutParams(new LinearLayout.LayoutParams(size, size));
            return check;
        }
        d.setColor(Color.TRANSPARENT);
        d.setStroke(dp(density, 1.5f), 0xFF52565C);
        View v = new View(ctx);
        v.setBackground(d);
        v.setLayoutParams(new LinearLayout.LayoutParams(size, size));
        return v;
    }

    private static int dp(float density, float v) {
        return Math.round(v * density);
    }

    /** Mixes [fg] over [bg] by [amount] (0..1), keeping full alpha. */
    private static int blend(int fg, int bg, float amount) {
        int fr = (fg >> 16) & 0xFF, fg2 = (fg >> 8) & 0xFF, fb = fg & 0xFF;
        int br = (bg >> 16) & 0xFF, bg2 = (bg >> 8) & 0xFF, bb = bg & 0xFF;
        int r = Math.round(fr * amount + br * (1 - amount));
        int g = Math.round(fg2 * amount + bg2 * (1 - amount));
        int b = Math.round(fb * amount + bb * (1 - amount));
        return 0xFF000000 | (r << 16) | (g << 8) | b;
    }
}
