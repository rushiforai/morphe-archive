package app.kyurem39.extension;

import android.content.Context;
import android.content.res.Configuration;

/**
 * Fixed Material Design monochrome palette (neutral grays, no hue) for the patch settings panel.
 */
public final class PanelColors {
    public final boolean isDark;
    public final int background;
    public final int card;
    public final int heading;
    public final int subHeading;
    public final int bodyText;
    public final int secondaryText;
    public final int divider;
    public final int accent;

    private PanelColors(boolean isDark) {
        this.isDark = isDark;
        if (isDark) {
            this.background = 0xFF121212;
            this.card = 0xFF1E1E1E;
            this.heading = 0xFFE0E0E0;
            this.subHeading = 0xFFE0E0E0;
            this.bodyText = 0xFFBDBDBD;
            this.secondaryText = 0xFF9E9E9E;
            this.divider = 0xFF2C2C2C;
            this.accent = 0xFFFFFFFF;
        } else {
            this.background = 0xFFFFFFFF;
            this.card = 0xFFF5F5F5;
            this.heading = 0xFF212121;
            this.subHeading = 0xFF212121;
            this.bodyText = 0xFF424242;
            this.secondaryText = 0xFF616161;
            this.divider = 0xFFE0E0E0;
            this.accent = 0xFF000000;
        }
    }

    public static PanelColors from(Context context) {
        boolean dark = (context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        return new PanelColors(dark);
    }
}

