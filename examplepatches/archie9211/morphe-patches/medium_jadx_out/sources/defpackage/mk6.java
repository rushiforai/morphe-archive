package defpackage;

import android.view.KeyEvent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mk6 extends q28 implements lk6 {
    public x45 o;
    public x45 p;

    @Override // defpackage.lk6
    public final boolean D(KeyEvent keyEvent) {
        x45 x45Var = this.o;
        if (x45Var != null) {
            return ((Boolean) x45Var.invoke(new hk6(keyEvent))).booleanValue();
        }
        return false;
    }

    @Override // defpackage.lk6
    public final boolean j(KeyEvent keyEvent) {
        x45 x45Var = this.p;
        if (x45Var != null) {
            return ((Boolean) x45Var.invoke(new hk6(keyEvent))).booleanValue();
        }
        return false;
    }
}
