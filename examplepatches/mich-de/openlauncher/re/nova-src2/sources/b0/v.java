package b0;

/* loaded from: classes2.dex */
public final class v extends l1 {

    /* renamed from: a, reason: collision with root package name */
    public c0.v1 f16252a;

    /* renamed from: b, reason: collision with root package name */
    public p1.e1 f16253b;

    /* renamed from: c, reason: collision with root package name */
    public w f16254c;

    /* renamed from: d, reason: collision with root package name */
    public long f16255d;

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        long j12;
        z2.i1 i1VarH = q0Var.H(j11);
        if (t0Var.l()) {
            j12 = (i1VarH.f98081a << 32) | (i1VarH.f98082b & 4294967295L);
        } else {
            c0.v1 v1Var = this.f16252a;
            if (v1Var == null) {
                j12 = (i1VarH.f98081a << 32) | (i1VarH.f98082b & 4294967295L);
                this.f16255d = j12;
            } else {
                long j13 = (i1VarH.f98082b & 4294967295L) | (i1VarH.f98081a << 32);
                c0.u1 u1VarA = v1Var.a(new u(this, j13, 0), new u(this, j13, 1));
                this.f16254c.getClass();
                j12 = ((y3.m) u1VarA.getValue()).f96611a;
                this.f16255d = ((y3.m) u1VarA.getValue()).f96611a;
            }
        }
        return t0Var.y((int) (j12 >> 32), (int) (4294967295L & j12), b70.h.f17594a, new t(this, i1VarH, j12));
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onReset() {
        super.onReset();
        this.f16255d = androidx.compose.animation.a.f13869a;
    }
}
