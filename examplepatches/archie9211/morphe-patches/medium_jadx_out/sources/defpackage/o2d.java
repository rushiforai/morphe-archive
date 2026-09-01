package defpackage;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class o2d extends fb3 {
    public Dialog C0;
    public DialogInterface.OnCancelListener D0;
    public AlertDialog E0;

    @Override // defpackage.fb3
    public final Dialog a0(Bundle bundle) {
        Dialog dialog = this.C0;
        if (dialog != null) {
            return dialog;
        }
        this.t0 = false;
        AlertDialog alertDialog = this.E0;
        if (alertDialog != null) {
            return alertDialog;
        }
        Context contextI = i();
        vp7.p(contextI);
        AlertDialog alertDialogCreate = new AlertDialog.Builder(contextI).create();
        this.E0 = alertDialogCreate;
        return alertDialogCreate;
    }

    @Override // defpackage.fb3, android.content.DialogInterface.OnCancelListener
    public final void onCancel(DialogInterface dialogInterface) {
        DialogInterface.OnCancelListener onCancelListener = this.D0;
        if (onCancelListener != null) {
            onCancelListener.onCancel(dialogInterface);
        }
    }
}
