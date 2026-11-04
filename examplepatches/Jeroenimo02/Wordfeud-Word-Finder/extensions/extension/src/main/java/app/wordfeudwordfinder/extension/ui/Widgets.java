package app.wordfeudwordfinder.extension.ui;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.widget.TextView;

/** Small view factories shared by the overlay views (framework widgets only). */
final class Widgets {
    static final int BUTTON_HEIGHT_DP = 36;
    private static final int BUTTON_PADDING_DP = 16;

    private Widgets() {}

    static TextView text(Context ctx, int sp, int color, Typeface face) {
        TextView t = new TextView(ctx);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        t.setTextColor(color);
        t.setTypeface(face);
        t.setSingleLine(false);
        t.setEllipsize(TextUtils.TruncateAt.END);
        return t;
    }

    /** A pill button; {@code accent} for the main action. */
    static TextView button(Context ctx, Theme theme, float density, String label, boolean accent) {
        TextView b = text(ctx, 14, accent ? theme.onAccent : theme.textPrimary, Fonts.interBold(ctx));
        b.setText(label);
        b.setGravity(Gravity.CENTER);
        b.setSingleLine(true);
        int pad = FabPlacement.dp(density, BUTTON_PADDING_DP);
        b.setPadding(pad, 0, pad, 0);
        b.setBackground(rounded(accent ? theme.accent : theme.surface,
                FabPlacement.dp(density, BUTTON_HEIGHT_DP) / 2f));
        b.setClickable(true);
        return b;
    }

    static GradientDrawable rounded(int color, float radius) {
        GradientDrawable g = new GradientDrawable();
        g.setColor(color);
        g.setCornerRadius(radius);
        return g;
    }
}
