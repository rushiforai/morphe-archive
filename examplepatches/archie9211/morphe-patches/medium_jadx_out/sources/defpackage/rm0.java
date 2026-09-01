package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lrm0;", "Lu28;", "Lsm0;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class rm0 extends u28 {
    public final long b;
    public final ez0 c;
    public final m3c d;

    public rm0(long j, oz6 oz6Var, m3c m3cVar, int i) {
        j = (i & 1) != 0 ? uu1.h : j;
        oz6Var = (i & 2) != 0 ? null : oz6Var;
        this.b = j;
        this.c = oz6Var;
        this.d = m3cVar;
    }

    public final boolean equals(Object obj) {
        rm0 rm0Var = obj instanceof rm0 ? (rm0) obj : null;
        if (rm0Var == null) {
            return false;
        }
        long j = rm0Var.b;
        int i = uu1.i;
        return ezd.a(this.b, j) && g76.L(this.c, rm0Var.c) && g76.L(this.d, rm0Var.d);
    }

    @Override // defpackage.u28
    public final q28 f() {
        sm0 sm0Var = new sm0();
        sm0Var.o = this.b;
        sm0Var.p = this.c;
        sm0Var.q = 1.0f;
        sm0Var.r = this.d;
        sm0Var.s = 9205357640488583168L;
        return sm0Var;
    }

    public final int hashCode() {
        int i = uu1.i;
        int iN = ev6.n(this.b) * 31;
        ez0 ez0Var = this.c;
        return this.d.hashCode() + km4.p(1.0f, (iN + (ez0Var != null ? ez0Var.hashCode() : 0)) * 31, 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        sm0 sm0Var = (sm0) q28Var;
        sm0Var.o = this.b;
        sm0Var.p = this.c;
        sm0Var.q = 1.0f;
        m3c m3cVar = sm0Var.r;
        m3c m3cVar2 = this.d;
        if (!g76.L(m3cVar, m3cVar2)) {
            sm0Var.r = m3cVar2;
            dl7.u(sm0Var);
        }
        wgf.y(sm0Var);
    }
}
