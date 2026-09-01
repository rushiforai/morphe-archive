package defpackage;

import android.app.Dialog;
import android.content.DialogInterface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bb3 implements DialogInterface.OnCancelListener {
    public final /* synthetic */ fb3 a;

    public bb3(fb3 fb3Var) {
        this.a = fb3Var;
    }

    @Override // android.content.DialogInterface.OnCancelListener
    public final void onCancel(DialogInterface dialogInterface) {
        fb3 fb3Var = this.a;
        Dialog dialog = fb3Var.x0;
        if (dialog != null) {
            fb3Var.onCancel(dialog);
        }
    }
}
