package app.onlynazril.extension.tiktok.ui;

import android.content.Context;

/**
 * The control a one-number row carries: an {@link ActionView} that shows the value in force and
 * opens {@link NumberDialog} to change it.
 * <p>
 * A factory rather than a subclass, because the button is the screen's own. This only adds what
 * the label says and what a tap does. The value lives in the settings, and the label is what the
 * dialog last saved; a control keeping its own copy could disagree with what the feature reads.
 */
public final class NumberAction {
    public interface OnValueChangeListener {
        void onValueChanged(long value);
    }

    private NumberAction() {}

    public static ActionView create(
            Context context,
            String title,
            String hint,
            String unit,
            long value,
            OnValueChangeListener save) {
        long[] current = {value};
        ActionView[] button = new ActionView[1];
        button[0] = new ActionView(context, label(current[0], unit), () -> NumberDialog.show(
                context, title, hint, current[0], changed -> {
                    current[0] = changed;
                    button[0].setText(label(changed, unit));
                    save.onValueChanged(changed);
                }));
        return button[0];
    }

    /** "off" for zero, otherwise the value with its unit. */
    private static String label(long value, String unit) {
        return value == 0 ? "off" : value + unit;
    }
}
