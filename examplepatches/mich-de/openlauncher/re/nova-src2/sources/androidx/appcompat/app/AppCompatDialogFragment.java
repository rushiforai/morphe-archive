package androidx.appcompat.app;

import android.app.Dialog;
import android.os.Bundle;
import androidx.fragment.app.DialogFragment;
import m.h0;

/* loaded from: classes2.dex */
public class AppCompatDialogFragment extends DialogFragment {
    public AppCompatDialogFragment() {
    }

    @Override // androidx.fragment.app.DialogFragment
    public Dialog onCreateDialog(Bundle bundle) {
        return new h0(getContext(), getTheme());
    }

    @Override // androidx.fragment.app.DialogFragment
    public void setupDialog(Dialog dialog, int i5) {
        if (!(dialog instanceof h0)) {
            super.setupDialog(dialog, i5);
            return;
        }
        h0 h0Var = (h0) dialog;
        if (i5 != 1 && i5 != 2) {
            if (i5 != 3) {
                return;
            } else {
                dialog.getWindow().addFlags(24);
            }
        }
        h0Var.c().w(1);
    }

    public AppCompatDialogFragment(int i5) {
        super(i5);
    }
}
