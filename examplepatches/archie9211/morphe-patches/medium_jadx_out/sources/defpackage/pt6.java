package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pt6 extends q28 implements xl3 {
    public st6 o;

    @Override // defpackage.q28
    public final void A0() {
        st6 st6Var = this.o;
        st6Var.e();
        st6Var.b = null;
        st6Var.c = -1;
    }

    @Override // defpackage.xl3
    public final void e0(cq6 cq6Var) {
        g61 g61Var = cq6Var.a;
        ArrayList arrayList = this.o.i;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            mt6 mt6Var = (mt6) arrayList.get(i);
            of5 of5Var = mt6Var.n;
            if (of5Var != null) {
                long j = mt6Var.m;
                long j2 = of5Var.t;
                float f = ((int) (j >> 32)) - ((int) (j2 >> 32));
                float f2 = ((int) (j & 4294967295L)) - ((int) (4294967295L & j2));
                ((md5) g61Var.b.b).C(f, f2);
                try {
                    g76.V(cq6Var, of5Var);
                } finally {
                    ((md5) g61Var.b.b).C(-f, -f2);
                }
            }
        }
        cq6Var.a();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof pt6) && g76.L(this.o, ((pt6) obj).o);
    }

    public final int hashCode() {
        return this.o.hashCode();
    }

    public final String toString() {
        return "DisplayingDisappearingItemsNode(animator=" + this.o + ')';
    }

    @Override // defpackage.q28
    public final void y0() {
        this.o.j = this;
    }

    @Override // defpackage.xl3
    public final void L() {
    }
}
