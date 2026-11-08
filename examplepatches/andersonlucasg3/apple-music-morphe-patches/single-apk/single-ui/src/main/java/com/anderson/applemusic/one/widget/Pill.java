package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.view.Gravity;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Tokens;

/**
 * Pill button with an optional leading icon (Buscar, Conta, Atualizações, Criar Estação,
 * Tentar de novo...). Radius is fully rounded, height >= 44 dp and the touch target is
 * padded to 48 dp by the callers that stack it.
 */
public final class Pill extends LinearLayout {

    private final IconView icon;
    private final TextView label;

    public Pill(Context context, int iconId, String text, int fill, int focusFill, int textColor,
                float heightDp, float iconSizeDp) {
        super(context);
        setOrientation(HORIZONTAL);
        setGravity(Gravity.CENTER);
        setPadding(Tokens.dp(18), 0, Tokens.dp(18), 0);
        setMinimumHeight(Tokens.dp(heightDp));

        icon = iconId == 0 ? null : new IconView(context, iconId, textColor);
        if (icon != null) {
            LinearLayout.LayoutParams iconParams =
                    new LinearLayout.LayoutParams(Tokens.dp(iconSizeDp), Tokens.dp(iconSizeDp));
            iconParams.rightMargin = Tokens.dp(8);
            addView(icon, iconParams);
        }
        label = Inter.text(context, text, 13f, Inter.SEMIBOLD, textColor);
        label.setSingleLine(true);
        addView(label);
        Focus.attach(this, Tokens.RADIUS_PILL, fill, focusFill, null);
    }

    public void setText(String text) {
        label.setText(text);
    }

    public void setIcon(int iconId) {
        if (icon != null) icon.setIcon(iconId);
    }

    public void setTextColor(int color) {
        label.setTextColor(color);
        if (icon != null) icon.setIconColor(color);
    }

    /** Accent-filled pill (primary action). */
    public static Pill accent(Context context, int icon, String text) {
        return new Pill(context, icon, text, Tokens.ACCENT, 0xFFD11F35, Tokens.TEXT, 44f, 18f);
    }

    /** Dark surface pill (secondary action). */
    public static Pill surface(Context context, int icon, String text) {
        return new Pill(context, icon, text, Tokens.SURFACE, Tokens.SURFACE_HOVER,
                Tokens.TEXT, 44f, 18f);
    }

    /** Secondary action drawn on top of a SURFACE panel: one step lighter. */
    public static Pill highlighted(Context context, int icon, String text) {
        return new Pill(context, icon, text, Tokens.SURFACE_HOVER, Tokens.SURFACE_ACTIVE,
                Tokens.TEXT, 44f, 18f);
    }
}
