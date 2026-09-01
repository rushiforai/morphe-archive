package defpackage;

import android.app.Dialog;
import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class dw0 extends i20 {
    @Override // defpackage.fb3
    public final void Y() {
        Dialog dialog = this.x0;
        if (dialog instanceof cw0) {
            boolean z = ((cw0) dialog).g().J;
        }
        Z(false, false);
    }

    @Override // defpackage.i20, defpackage.fb3
    public Dialog a0(Bundle bundle) {
        return new cw0(i(), this.r0);
    }
}
