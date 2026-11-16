package app.onlynazril.extension.tiktok.ui;

import android.content.Context;

/**
 * The control a choice row carries: an {@link ActionView} that shows the current label and opens
 * {@link ChoiceDialog} to change it.
 * <p>
 * The value lives in the settings, and the label is what the dialog last saved; a control keeping
 * its own copy could disagree with what the feature reads.
 */
public final class ChoiceAction {
    public interface OnChoiceChangeListener {
        void onChoiceChanged(int index);
    }

    /**
     * The example lines, resolved when the dialog opens rather than when the page was built, so a
     * sample can follow a switch that changed after the row was drawn.
     */
    public interface Details {
        String[] get();
    }

    private ChoiceAction() {}

    public static ActionView create(
            Context context,
            String title,
            String hint,
            String[] labels,
            int selected,
            OnChoiceChangeListener save) {
        return create(context, title, hint, labels, (String[]) null, selected, save);
    }

    public static ActionView create(
            Context context,
            String title,
            String hint,
            String[] labels,
            Details details,
            int selected,
            OnChoiceChangeListener save) {
        int[] current = {selected};
        ActionView[] button = new ActionView[1];
        button[0] = new ActionView(context, labels[current[0]], () -> ChoiceDialog.show(
                context, title, hint, labels, details == null ? null : details.get(), current[0],
                index -> {
                    current[0] = index;
                    button[0].setText(labels[index]);
                    save.onChoiceChanged(index);
                }));
        return button[0];
    }

    /**
     * The same control with one example line per option, so a raw format pattern is not the only
     * thing the dialog shows. The examples are display-only and never stored.
     */
    public static ActionView create(
            Context context,
            String title,
            String hint,
            String[] labels,
            String[] details,
            int selected,
            OnChoiceChangeListener save) {
        int[] current = {selected};
        ActionView[] button = new ActionView[1];
        button[0] = new ActionView(context, labels[current[0]], () -> ChoiceDialog.show(
                context, title, hint, labels, details, current[0], index -> {
                    current[0] = index;
                    button[0].setText(labels[index]);
                    save.onChoiceChanged(index);
                }));
        return button[0];
    }
}
