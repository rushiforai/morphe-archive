package app.morphe.extension.twitch.base;

import android.app.Activity;
import android.graphics.Color;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

/**
 * Red colour palette and small view helpers shared by the SEYTTINGS
 * dialog and the feature sections.
 */
public final class MorpheTheme {

    /** Near black with a warm red tint. */
    public static final int COLOR_BG = 0xFF140C0C;
    /** Slightly lighter red-black used for cards. */
    public static final int COLOR_SURFACE = 0xFF221010;
    public static final int COLOR_TEXT = 0xFFF6F0F0;
    public static final int COLOR_MUTED = 0xFFB79B9B;
    /** Dark red highlight for the focused TV row. */
    public static final int COLOR_FOCUS = 0xFF4B1717;
    /** Main Morphe red. */
    public static final int COLOR_ACCENT = 0xFFE53935;
    /** Darker red used for dividers. */
    public static final int COLOR_ACCENT_DARK = 0xFF7F1D1D;

    private MorpheTheme() {
    }

    public static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    public static LinearLayout.LayoutParams matchWidth() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    /**
     * Makes a view usable with a TV remote: focusable, transparent when idle
     * and highlighted with a dark red background when focused.
     */
    public static void makeFocusable(Activity activity, View view) {
        view.setFocusable(true);
        view.setBackgroundColor(Color.TRANSPARENT);
        view.setPadding(
                dp(activity, 10),
                dp(activity, 10),
                dp(activity, 10),
                dp(activity, 10));
        view.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View v, boolean hasFocus) {
                v.setBackgroundColor(hasFocus ? COLOR_FOCUS : Color.TRANSPARENT);
            }
        });
    }
}
