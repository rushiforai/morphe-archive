package com.google.android.gms.common;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.os.Bundle;
import sg.w;

/* loaded from: classes3.dex */
public class ErrorDialogFragment extends DialogFragment {

    /* renamed from: a, reason: collision with root package name */
    public Dialog f31783a;

    /* renamed from: b, reason: collision with root package name */
    public DialogInterface.OnCancelListener f31784b;

    /* renamed from: c, reason: collision with root package name */
    public AlertDialog f31785c;

    public static ErrorDialogFragment a(Dialog dialog, DialogInterface.OnCancelListener onCancelListener) {
        ErrorDialogFragment errorDialogFragment = new ErrorDialogFragment();
        w.i(dialog, "Cannot display null dialog");
        dialog.setOnCancelListener(null);
        dialog.setOnDismissListener(null);
        errorDialogFragment.f31783a = dialog;
        if (onCancelListener != null) {
            errorDialogFragment.f31784b = onCancelListener;
        }
        return errorDialogFragment;
    }

    @Override // android.app.DialogFragment, android.content.DialogInterface.OnCancelListener
    public final void onCancel(DialogInterface dialogInterface) {
        DialogInterface.OnCancelListener onCancelListener = this.f31784b;
        if (onCancelListener != null) {
            onCancelListener.onCancel(dialogInterface);
        }
    }

    @Override // android.app.DialogFragment
    public final Dialog onCreateDialog(Bundle bundle) {
        Dialog dialog = this.f31783a;
        if (dialog != null) {
            return dialog;
        }
        setShowsDialog(false);
        if (this.f31785c == null) {
            Activity activity = getActivity();
            w.h(activity);
            this.f31785c = new AlertDialog.Builder(activity).create();
        }
        return this.f31785c;
    }
}
