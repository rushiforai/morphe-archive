package app.xposed.extension;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

/** X's look for our screens: its three themes, Chirp, and its button and row styles. */
final class Ui {
    static final int ACCENT = 0xFF1D9BF0;

    final Context context;
    final int background, text, secondary, divider, alert, pressed;
    final boolean dark;
    final Typeface regular, bold;

    Ui(Context context) {
        this.context = context;
        // X's light, dim and lights out palettes.
        switch (XTheme.mode()) {
            case LIGHT:
                background = 0xFFFFFFFF; text = 0xFF0F1419; secondary = 0xFF536471; divider = 0xFFEFF3F4; alert = 0xFF895314;
                dark = false;
                break;
            case LIGHTS_OUT:
                background = 0xFF000000; text = 0xFFE7E9EA; secondary = 0xFF71767B; divider = 0xFF2F3336; alert = 0xFFE7B36A;
                dark = true;
                break;
            default:
                background = 0xFF15202B; text = 0xFFF7F9F9; secondary = 0xFF8B98A5; divider = 0xFF38444D; alert = 0xFFE7B36A;
                dark = true;
                break;
        }
        pressed = dark ? 0x22FFFFFF : 0x110F1419;
        regular = font(context, "chirp_regular_400", Typeface.NORMAL);
        bold = font(context, "chirp_bold_700", Typeface.BOLD);
    }

    private static Typeface font(Context context, String name, int fallbackStyle) {
        try {
            Resources res = context.getResources();
            int id = res.getIdentifier(name, "font", context.getPackageName());
            if (id != 0) return res.getFont(id);
        } catch (Exception ignored) {
        }
        return Typeface.create(Typeface.DEFAULT, fallbackStyle);
    }

    int dp(float value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    TextView text(CharSequence s, float sp, boolean isBold, int color) {
        TextView t = new TextView(context);
        t.setText(s);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        t.setTypeface(isBold ? bold : regular);
        t.setTextColor(color);
        return t;
    }

    /** A pill like X's buttons: filled (primary) or outlined. */
    TextView pill(CharSequence label, boolean filled, View.OnClickListener onClick) {
        TextView b = text(label, 15, true, filled ? background : text);
        b.setGravity(Gravity.CENTER);
        b.setSingleLine(true);
        b.setPadding(dp(16), 0, dp(16), 0);
        b.setMinHeight(dp(40));
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(dp(20));
        if (filled) {
            shape.setColor(text);
        } else {
            shape.setColor(Color.TRANSPARENT);
            shape.setStroke(dp(1), divider);
        }
        b.setBackground(new RippleDrawable(ColorStateList.valueOf(pressed), shape, shape));
        b.setOnClickListener(onClick);
        return b;
    }

    /** Pressed feedback for full-width rows. */
    Drawable rowBackground() {
        return new RippleDrawable(ColorStateList.valueOf(pressed), null, new ColorDrawable(Color.WHITE));
    }

    View divider() {
        View v = new View(context);
        v.setBackgroundColor(divider);
        v.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(0.5f))));
        return v;
    }

    static LinearLayout.LayoutParams matchWidth() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }
}
