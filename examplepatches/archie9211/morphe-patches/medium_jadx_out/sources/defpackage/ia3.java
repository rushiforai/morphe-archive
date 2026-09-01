package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ia3 extends f1 {
    public final sj0 l;
    public final x6a m;
    public final j93 n;

    /* JADX WARN: Illegal instructions before constructor call */
    public ia3(sj0 sj0Var, x6a x6aVar, int i) {
        pqe pqeVar;
        x67 x67Var = ((i93) sj0Var.a).a;
        yv2 yv2Var = (yv2) sj0Var.c;
        ky kyVar = cd7.e;
        n98 n98VarC = vn7.C((p98) sj0Var.b, x6aVar.e);
        w6a w6aVar = x6aVar.g;
        w6aVar.getClass();
        int i2 = n7a.c[w6aVar.ordinal()];
        if (i2 == 1) {
            pqeVar = pqe.IN_VARIANCE;
        } else if (i2 == 2) {
            pqeVar = pqe.OUT_VARIANCE;
        } else {
            if (i2 != 3) {
                ygf.a();
                throw null;
            }
            pqeVar = pqe.INVARIANT;
        }
        super(i, kyVar, yv2Var, x67Var, n98VarC, pqeVar, x6aVar.f);
        this.l = sj0Var;
        this.m = x6aVar;
        this.n = new j93(x67Var, new v2(11, this));
    }

    @Override // defpackage.b2, defpackage.gx
    public final ly getAnnotations() {
        return this.n;
    }

    @Override // defpackage.c3
    public final List z0() {
        sj0 sj0Var = this.l;
        List listI0 = vn7.i0(this.m, (wjc) sj0Var.d);
        if (listI0.isEmpty()) {
            return d46.Q(f93.e(this).o());
        }
        jz1 jz1Var = (jz1) sj0Var.h;
        ArrayList arrayList = new ArrayList(cu1.k0(listI0, 10));
        Iterator it2 = listI0.iterator();
        while (it2.hasNext()) {
            arrayList.add(jz1Var.G((s6a) it2.next()));
        }
        return arrayList;
    }
}
