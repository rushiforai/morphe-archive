package defpackage;

import android.app.Dialog;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eb3 extends gx1 {
    public final /* synthetic */ d15 v;
    public final /* synthetic */ fb3 w;

    public eb3(fb3 fb3Var, d15 d15Var) {
        this.w = fb3Var;
        this.v = d15Var;
    }

    @Override // defpackage.gx1
    public final View T(int i) {
        d15 d15Var = this.v;
        if (d15Var.U()) {
            return d15Var.T(i);
        }
        Dialog dialog = this.w.x0;
        if (dialog != null) {
            return dialog.findViewById(i);
        }
        return null;
    }

    @Override // defpackage.gx1
    public final boolean U() {
        return this.v.U() || this.w.B0;
    }
}
