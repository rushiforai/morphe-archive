package android.app;

import android.content.Context;
import android.content.DialogInterface;

/** Dialog construction is permitted in host tests, but confirmation is never accepted implicitly. */
public final class AlertDialog {
    public static final class Builder {
        // Retain callbacks so tests can simulate cancellation and confirmation instead of testing only worker methods.
        public static Builder shown;
        public DialogInterface.OnDismissListener dismiss;
        public DialogInterface.OnClickListener positive;
        public DialogInterface.OnMultiChoiceClickListener choices;
        public Builder(Context context) {}
        public Builder setTitle(CharSequence title) { return this; }
        public Builder setMessage(CharSequence message) { return this; }
        public Builder setPositiveButton(CharSequence title, DialogInterface.OnClickListener listener) { positive = listener; return this; }
        public Builder setOnDismissListener(DialogInterface.OnDismissListener listener) { dismiss = listener; return this; }
        public Builder setNegativeButton(CharSequence title, DialogInterface.OnClickListener listener) { return this; }
        public Builder setNeutralButton(CharSequence title, DialogInterface.OnClickListener listener) { return this; }
        public Builder setMultiChoiceItems(CharSequence[] items, boolean[] checked, DialogInterface.OnMultiChoiceClickListener listener) { choices = listener; return this; }
        public AlertDialog show() { shown = this; return new AlertDialog(); }
    }
}
