package app.morphe.extension.shared.ui;

import android.app.Dialog;
import android.content.Context;
import android.util.Pair;
import android.widget.EditText;
import android.widget.LinearLayout;

/** Compile-only signature. The patched app uses the dialog provided by official Morphe. */
public class CustomDialog {
    public static native Pair<Dialog, LinearLayout> create(Context c, CharSequence title, CharSequence message,
            EditText input, CharSequence okLabel, Runnable ok, Runnable cancel, CharSequence neutralLabel,
            Runnable neutral, boolean dismissOnNeutral);
}
