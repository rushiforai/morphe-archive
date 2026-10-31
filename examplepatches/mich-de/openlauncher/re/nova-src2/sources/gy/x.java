package gy;

import f1.o2;

/* loaded from: classes4.dex */
public final class x implements z2.c0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f58578a;

    public x(long j11) {
        this.f58578a = j11;
    }

    public final boolean equals(Object obj) {
        x xVar = obj instanceof x ? (x) obj : null;
        return xVar != null && this.f58578a == xVar.f58578a;
    }

    public final int hashCode() {
        return Long.hashCode(this.f58578a);
    }

    @Override // z2.c0
    /* renamed from: measure-3p2s80s, reason: not valid java name */
    public final z2.s0 mo295measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        z2.i1 i1VarH = q0Var.H(j11);
        int i5 = i1VarH.f98081a;
        long j12 = this.f58578a;
        int iMax = Math.max(i5, t0Var.mo96roundToPx0680j_4(y3.i.b(j12)));
        int iMax2 = Math.max(i1VarH.f98082b, t0Var.mo96roundToPx0680j_4(y3.i.a(j12)));
        return t0Var.y(iMax, iMax2, b70.h.f17594a, new o2(iMax, iMax2, 1, i1VarH));
    }
}
