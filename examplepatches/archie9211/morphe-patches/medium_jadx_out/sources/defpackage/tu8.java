package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tu8 extends zl4 {
    public static final tu8 d = new tu8(0, 1, 1);

    @Override // defpackage.zl4
    public final void c(ym0 ym0Var, x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var) {
        mwa mwaVar = (mwa) ym0Var.i(0);
        Set set = (Set) l3bVar.a;
        if (set == null) {
            return;
        }
        m69 m69Var = new m69(set);
        f78 f78Var = (f78) l3bVar.j;
        if (f78Var == null) {
            long[] jArr = hqb.a;
            f78Var = new f78();
            l3bVar.j = f78Var;
        }
        f78Var.m(mwaVar, m69Var);
        ((o78) l3bVar.d).b(new t65(m69Var, -1));
    }
}
