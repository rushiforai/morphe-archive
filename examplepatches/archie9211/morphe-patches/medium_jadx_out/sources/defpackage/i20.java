package defpackage;

import android.app.Dialog;
import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class i20 extends fb3 {
    @Override // defpackage.fb3
    public Dialog a0(Bundle bundle) {
        return new h20(i(), this.r0);
    }

    @Override // defpackage.fb3
    public final void b0(Dialog dialog, int i) {
        if (!(dialog instanceof h20)) {
            super.b0(dialog, i);
            return;
        }
        h20 h20Var = (h20) dialog;
        if (i != 1 && i != 2) {
            if (i != 3) {
                return;
            } else {
                dialog.getWindow().addFlags(24);
            }
        }
        h20Var.d().g(1);
    }
}
