package com.google.android.gms.common;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import androidx.fragment.app.DialogFragment;
import sg.w;

/* loaded from: classes3.dex */
public class SupportErrorDialogFragment extends DialogFragment {

    /* renamed from: a, reason: collision with root package name */
    public Dialog f31791a;

    /* renamed from: b, reason: collision with root package name */
    public DialogInterface.OnCancelListener f31792b;

    /* renamed from: c, reason: collision with root package name */
    public AlertDialog f31793c;

    public static SupportErrorDialogFragment o(Dialog dialog, DialogInterface.OnCancelListener onCancelListener) {
        SupportErrorDialogFragment supportErrorDialogFragment = new SupportErrorDialogFragment();
        w.i(dialog, "Cannot display null dialog");
        dialog.setOnCancelListener(null);
        dialog.setOnDismissListener(null);
        supportErrorDialogFragment.f31791a = dialog;
        if (onCancelListener != null) {
            supportErrorDialogFragment.f31792b = onCancelListener;
        }
        return supportErrorDialogFragment;
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnCancelListener
    public final void onCancel(DialogInterface dialogInterface) {
        DialogInterface.OnCancelListener onCancelListener = this.f31792b;
        if (onCancelListener != null) {
            onCancelListener.onCancel(dialogInterface);
        }
    }

    @Override // androidx.fragment.app.DialogFragment
    public final Dialog onCreateDialog(Bundle bundle) {
        Dialog dialog = this.f31791a;
        if (dialog != null) {
            return dialog;
        }
        setShowsDialog(false);
        if (this.f31793c == null) {
            Context context = getContext();
            w.h(context);
            this.f31793c = new AlertDialog.Builder(context).create();
        }
        return this.f31793c;
    }
}
