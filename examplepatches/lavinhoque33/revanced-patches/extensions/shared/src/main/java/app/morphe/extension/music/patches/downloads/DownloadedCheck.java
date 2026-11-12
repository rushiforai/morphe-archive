/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import android.content.Context;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.widget.ImageView;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;

/** The green "downloaded" check: Music's own check-circle icon, tinted green for the current theme. */
final class DownloadedCheck extends ImageView {
    private static final int DARK_THEME_GREEN = 0xFF66BB6A;
    private static final int LIGHT_THEME_GREEN = 0xFF2E7D32;
    private static final String ICON = "yt_fill_downloaded_vd_theme_24";

    private final boolean withBackdrop;
    @Nullable
    private Boolean styledForDarkTheme;

    private DownloadedCheck(Context context, boolean withBackdrop) {
        super(context);
        this.withBackdrop = withBackdrop;
        setScaleType(ScaleType.FIT_CENTER);
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
    }

    static int color(boolean darkTheme) {
        return darkTheme ? DARK_THEME_GREEN : LIGHT_THEME_GREEN;
    }

    /**
     * @param withBackdrop draw the check on a disc in the app background so that it stays readable on top of
     *                     another icon, as the header button's
     * @return the check, or null when this version of the app has no such icon
     */
    @Nullable
    static DownloadedCheck create(Context context, boolean withBackdrop) {
        int icon = ResourceUtils.getDrawableIdentifier(ICON);
        if (icon == 0) return null;

        DownloadedCheck check = new DownloadedCheck(context, withBackdrop);
        check.setImageResource(icon);
        check.restyle();
        return check;
    }

    /**
     * The check as a plain drawable, for a view that cannot take a child of ours (a row of Litho views); tint it
     * with {@link #tint}.
     *
     * @return the drawable, or null when this version of the app has no such icon
     */
    @Nullable
    static Drawable createDrawable(Context context) {
        int icon = ResourceUtils.getDrawableIdentifier(ICON);
        Drawable drawable = icon == 0 ? null : context.getDrawable(icon);
        return drawable == null ? null : drawable.mutate();
    }

    /** Colors a drawable of {@link #createDrawable} for the theme. */
    static void tint(Drawable drawable, boolean darkTheme) {
        drawable.setColorFilter(color(darkTheme), PorterDuff.Mode.SRC_IN);
    }

    /** Re-applies the colors when the theme changed since the check was styled; otherwise does nothing. */
    void restyle() {
        boolean darkTheme = BaseThemeUtils.isDarkModeEnabled();
        if (styledForDarkTheme != null && styledForDarkTheme == darkTheme) return;

        styledForDarkTheme = darkTheme;
        setColorFilter(color(darkTheme), PorterDuff.Mode.SRC_IN);
        if (withBackdrop) {
            GradientDrawable disc = new GradientDrawable();
            disc.setShape(GradientDrawable.OVAL);
            disc.setColor(BaseThemeUtils.getAppBackgroundColor());
            setBackground(disc);
        }
    }

    static int dp(float value) {
        return Utils.dipToPixels(value);
    }

    /** Shows or hides the check, changing nothing when it already is in that state. */
    void setShown(boolean shown) {
        int visibility = shown ? View.VISIBLE : View.GONE;
        if (getVisibility() != visibility) setVisibility(visibility);
    }
}
