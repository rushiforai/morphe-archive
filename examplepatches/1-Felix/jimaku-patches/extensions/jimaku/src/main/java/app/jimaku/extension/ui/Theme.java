package app.jimaku.extension.ui;

import android.content.Context;
import android.content.res.Configuration;
import android.util.TypedValue;

/**
 * The colours and measures of YouTube's player sheets, measured on YouTube 21.16.256 in its light
 * and dark theme (design.md of the change youtube-app-watching).
 */
public final class Theme {
    public final boolean dark;
    public final float density;
    public final float scaledDensity;

    public final int sheet;
    public final int handle;
    public final int divider;
    public final int text;
    public final int secondary;
    public final int disabledAlpha = 0x61;
    public final int pressed;
    public final int switchOffTrack;
    public final int switchOnTrack;
    public final int switchKnob;
    public final int roundButton;
    public final int link;
    /** The ground of a row that asks its question, as the extension marks it. */
    public final int asking;
    /** The press on a button filled in the text colour, as a question's tick. */
    public final int pressedOnText;
    /** YouTube dims the screen behind its sheets with black at 60%. */
    public static final float DIM = 0.6f;
    /** Jimaku's sparkle is the extension's lamp red on the menu's rows. */
    public static final int SPARKLE = 0xFFFF4A2A;

    private Theme(Context context, boolean dark) {
        this.dark = dark;
        density = context.getResources().getDisplayMetrics().density;
        scaledDensity = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 1, context.getResources().getDisplayMetrics());
        if (dark) {
            sheet = 0xFF000000;
            handle = 0xFF333333;
            divider = 0xFF333333;
            text = 0xFFF1F1F1;
            secondary = 0xFFAAAAAA;
            pressed = 0x33FFFFFF;
            switchOffTrack = 0xFF666666;
            switchOnTrack = 0xFFE2E2E2;
            switchKnob = 0xFF272727;
            roundButton = 0xFF272727;
            link = 0xFF3EA6FF;
            asking = 0x1AFFFFFF;
            pressedOnText = 0x1F000000;
        } else {
            sheet = 0xFFFFFFFF;
            handle = 0xFFE5E5E5;
            divider = 0xFFCCCCCC;
            text = 0xFF0F0F0F;
            secondary = 0xFF606060;
            pressed = 0x1F000000;
            switchOffTrack = 0xFF999999;
            switchOnTrack = 0xFF0F0F0F;
            switchKnob = 0xFFFFFFFF;
            roundButton = 0xFFF2F2F2;
            link = 0xFF065FD4;
            asking = 0x0D000000;
            pressedOnText = 0x33FFFFFF;
        }
    }

    /**
     * The theme of the app's sheets: dark as the app says, or where it can't say, as the
     * configuration of {@code context} has it.
     */
    public static Theme of(Context context, Boolean dark) {
        if (dark != null) return new Theme(context, dark);
        int night = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return new Theme(context, night == Configuration.UI_MODE_NIGHT_YES);
    }

    public int dp(float value) {
        return Math.round(value * density);
    }

    public float sp(float value) {
        return value * scaledDensity;
    }
}
