package app.onlynazril.extension.tiktok.ui;

import android.content.Context;

/**
 * The control a Min/Max row carries: an {@link ActionView} that shows the range in force and opens
 * {@link RangeDialog} to change it.
 *
 * A factory rather than a subclass, because the button is the screen's own — this only adds what the
 * label says and what a tap does. The value lives in the settings, and the label is what the dialog
 * last saved; a control keeping its own copy could disagree with what the filter reads.
 */
public final class RangeAction {
    public interface OnRangeChangeListener {
        void onRangeChanged(long min, long max);
    }

    private RangeAction() {}

    public static ActionView create(
            Context context, String title, long min, long max, OnRangeChangeListener save) {
        long[] current = {min, max};
        ActionView[] button = new ActionView[1];
        button[0] = new ActionView(context, label(min, max), () -> RangeDialog.show(
                context, title, current[0], current[1], (newMin, newMax) -> {
                    current[0] = newMin;
                    current[1] = newMax;
                    button[0].setText(label(newMin, newMax));
                    save.onRangeChanged(newMin, newMax);
                }));
        return button[0];
    }

    /** "off" for the whole range, else the bounds, with an open maximum written as infinity. */
    private static String label(long min, long max) {
        if (min == 0 && max == Long.MAX_VALUE) return "off";
        return min + " \u2013 " + (max == Long.MAX_VALUE ? "\u221e" : Long.toString(max));
    }
}
