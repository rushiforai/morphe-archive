package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ku8 extends zl4 {
    public static final ku8 d = new ku8(0, 1, 1);

    @Override // defpackage.zl4
    public final void c(ym0 ym0Var, x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var) {
        o78 o78Var;
        mwa mwaVar = (mwa) ym0Var.i(0);
        f78 f78Var = (f78) l3bVar.j;
        if (f78Var == null || ((m69) f78Var.g(mwaVar)) == null) {
            return;
        }
        ArrayList arrayList = (ArrayList) l3bVar.k;
        if (arrayList != null && (o78Var = (o78) arrayList.remove(arrayList.size() - 1)) != null) {
            l3bVar.d = o78Var;
        }
        f78Var.k(mwaVar);
    }
}
