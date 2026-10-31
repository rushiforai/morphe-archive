package t0;

/* loaded from: classes.dex */
public final class w1 {

    /* renamed from: a, reason: collision with root package name */
    public final m3.l0 f88262a;

    /* renamed from: b, reason: collision with root package name */
    public z2.y f88263b = null;

    /* renamed from: c, reason: collision with root package name */
    public z2.y f88264c;

    public w1(m3.l0 l0Var, z2.y yVar) {
        this.f88262a = l0Var;
        this.f88264c = yVar;
    }

    public final long a(long j11) {
        h2.c cVarI;
        z2.y yVar = this.f88263b;
        h2.c cVar = h2.c.f59017e;
        if (yVar != null) {
            if (yVar.isAttached()) {
                z2.y yVar2 = this.f88264c;
                cVarI = yVar2 != null ? yVar2.i(yVar, true) : null;
            } else {
                cVarI = cVar;
            }
            if (cVarI != null) {
                cVar = cVarI;
            }
        }
        return ps.k.g(j11, cVar);
    }

    public final int b(long j11, boolean z11) {
        if (z11) {
            j11 = a(j11);
        }
        return this.f88262a.f75928b.g(d(j11));
    }

    public final boolean c(long j11) {
        long jD = d(a(j11));
        float fIntBitsToFloat = Float.intBitsToFloat((int) (4294967295L & jD));
        m3.l0 l0Var = this.f88262a;
        int iE = l0Var.f75928b.e(fIntBitsToFloat);
        int i5 = (int) (jD >> 32);
        return Float.intBitsToFloat(i5) >= l0Var.d(iE) && Float.intBitsToFloat(i5) <= l0Var.e(iE);
    }

    public final long d(long j11) {
        z2.y yVar;
        z2.y yVar2 = this.f88263b;
        if (yVar2 == null) {
            return j11;
        }
        if (!yVar2.isAttached()) {
            yVar2 = null;
        }
        if (yVar2 == null || (yVar = this.f88264c) == null) {
            return j11;
        }
        z2.y yVar3 = yVar.isAttached() ? yVar : null;
        return yVar3 == null ? j11 : yVar2.m(yVar3, j11);
    }

    public final long e(long j11) {
        z2.y yVar;
        z2.y yVar2 = this.f88263b;
        if (yVar2 == null) {
            return j11;
        }
        if (!yVar2.isAttached()) {
            yVar2 = null;
        }
        if (yVar2 == null || (yVar = this.f88264c) == null) {
            return j11;
        }
        z2.y yVar3 = yVar.isAttached() ? yVar : null;
        return yVar3 == null ? j11 : yVar3.m(yVar2, j11);
    }
}
