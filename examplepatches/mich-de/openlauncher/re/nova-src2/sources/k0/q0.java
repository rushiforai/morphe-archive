package k0;

import b.u4;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes2.dex */
public final class q0 {

    /* renamed from: a, reason: collision with root package name */
    public final p0 f70714a;

    /* renamed from: b, reason: collision with root package name */
    public z2.q0 f70715b;

    /* renamed from: c, reason: collision with root package name */
    public z2.i1 f70716c;

    /* renamed from: d, reason: collision with root package name */
    public z2.q0 f70717d;

    /* renamed from: e, reason: collision with root package name */
    public z2.i1 f70718e;

    /* renamed from: f, reason: collision with root package name */
    public z.j f70719f;

    /* renamed from: g, reason: collision with root package name */
    public z.j f70720g;

    public q0(p0 p0Var) {
        this.f70714a = p0Var;
    }

    public final z.j a(int i5, int i11, boolean z11) {
        int iOrdinal = this.f70714a.ordinal();
        if (iOrdinal == 0 || iOrdinal == 1) {
            return null;
        }
        if (iOrdinal == 2) {
            if (z11) {
                return this.f70719f;
            }
            return null;
        }
        if (iOrdinal != 3) {
            throw new NoWhenBranchMatchedException();
        }
        if (z11) {
            return this.f70719f;
        }
        if (i5 + 1 < 0 || i11 < 0) {
            return null;
        }
        return this.f70720g;
    }

    public final void b(z2.s sVar, z2.s sVar2, long j11) {
        long jK = d.k(j11, f1.f70603a);
        if (sVar != null) {
            int iG = y3.a.g(jK);
            e0 e0Var = o0.f70693a;
            int iE = sVar.E(iG);
            this.f70719f = new z.j(z.j.a(iE, sVar.t(iE)));
            this.f70715b = sVar instanceof z2.q0 ? (z2.q0) sVar : null;
            this.f70716c = null;
        }
        if (sVar2 != null) {
            int iG2 = y3.a.g(jK);
            e0 e0Var2 = o0.f70693a;
            int iE2 = sVar2.E(iG2);
            this.f70720g = new z.j(z.j.a(iE2, sVar2.t(iE2)));
            this.f70717d = sVar2 instanceof z2.q0 ? (z2.q0) sVar2 : null;
            this.f70718e = null;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof q0) && this.f70714a == ((q0) obj).f70714a;
    }

    public final int hashCode() {
        return Integer.hashCode(0) + u4.a(0, this.f70714a.hashCode() * 31, 31);
    }

    public final String toString() {
        return "FlowLayoutOverflowState(type=" + this.f70714a + ", minLinesToShowCollapse=0, minCrossAxisSizeToShowCollapse=0)";
    }
}
