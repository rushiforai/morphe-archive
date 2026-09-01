package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zu8 extends zl4 {
    public static final zu8 d = new zu8(0, 1, 1);

    @Override // defpackage.zl4
    public final void c(ym0 ym0Var, x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var) {
        mwa mwaVar = (mwa) ym0Var.i(0);
        f78 f78Var = (f78) l3bVar.j;
        m69 m69Var = f78Var != null ? (m69) f78Var.g(mwaVar) : null;
        if (m69Var != null) {
            ArrayList arrayList = (ArrayList) l3bVar.k;
            if (arrayList == null) {
                arrayList = new ArrayList();
                l3bVar.k = arrayList;
            }
            arrayList.add((o78) l3bVar.d);
            l3bVar.d = m69Var.b;
        }
    }
}
