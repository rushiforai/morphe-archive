package f1;

import l1.o5;
import l1.q5;
import l1.r5;

/* loaded from: classes2.dex */
public final class o1 implements i2.v {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53814a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f53815b;

    public /* synthetic */ o1(Object obj, int i5) {
        this.f53814a = i5;
        this.f53815b = obj;
    }

    @Override // i2.v
    public final long a() {
        switch (this.f53814a) {
            case 0:
                p1 p1Var = (p1) this.f53815b;
                long jA = p1Var.f53848e.a();
                if (jA != 16) {
                    return jA;
                }
                m3 m3Var = (m3) b3.g.c(p1Var, n3.f53798a);
                if (m3Var != null) {
                    long j11 = m3Var.f53768a;
                    if (j11 != 16) {
                        return j11;
                    }
                }
                long j12 = ((i2.s) b3.g.c(p1Var, c1.f53419a)).f61148a;
                return (((t0) b3.g.c(p1Var, u0.f54013a)).i() || ((double) i2.r0.m(j12)) >= 0.5d) ? j12 : i2.s.f61140f;
            case 1:
                return ((o3) this.f53815b).f53822c;
            case 2:
                p1 p1Var2 = (p1) this.f53815b;
                long jA2 = p1Var2.f53848e.a();
                if (jA2 != 16) {
                    return jA2;
                }
                o5 o5Var = (o5) b3.g.c(p1Var2, q5.f73835b);
                if (o5Var != null) {
                    long j13 = o5Var.f73745a;
                    if (j13 != 16) {
                        return j13;
                    }
                }
                return ((i2.s) b3.g.c(p1Var2, l1.s1.f73932a)).f61148a;
            default:
                return ((r5) this.f53815b).f73915c;
        }
    }
}
