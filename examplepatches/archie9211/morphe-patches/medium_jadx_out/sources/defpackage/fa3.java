package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fa3 extends r4a implements k93 {
    public final i6a B;
    public final p98 C;
    public final wjc D;
    public final kse E;
    public final u93 F;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fa3(yv2 yv2Var, q4a q4aVar, ly lyVar, c28 c28Var, g93 g93Var, boolean z, n98 n98Var, e41 e41Var, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, i6a i6aVar, p98 p98Var, wjc wjcVar, kse kseVar, u93 u93Var) {
        super(yv2Var, q4aVar, lyVar, c28Var, g93Var, z, n98Var, e41Var, jkc.g0, z2, z3, z6, z4, z5);
        yv2Var.getClass();
        lyVar.getClass();
        c28Var.getClass();
        g93Var.getClass();
        n98Var.getClass();
        e41Var.getClass();
        p98Var.getClass();
        kseVar.getClass();
        this.B = i6aVar;
        this.C = p98Var;
        this.D = wjcVar;
        this.E = kseVar;
        this.F = u93Var;
    }

    @Override // defpackage.r4a
    public final r4a A0(yv2 yv2Var, c28 c28Var, g93 g93Var, q4a q4aVar, e41 e41Var, n98 n98Var) {
        yv2Var.getClass();
        c28Var.getClass();
        g93Var.getClass();
        e41Var.getClass();
        n98Var.getClass();
        return new fa3(yv2Var, q4aVar, getAnnotations(), c28Var, g93Var, this.g, n98Var, e41Var, this.o, this.p, isExternal(), this.s, this.q, this.B, this.C, this.D, this.E, this.F);
    }

    @Override // defpackage.x93
    public final wjc D() {
        return this.D;
    }

    @Override // defpackage.x93
    public final p98 J() {
        return this.C;
    }

    @Override // defpackage.x93
    public final u93 K() {
        return this.F;
    }

    @Override // defpackage.r4a, defpackage.tu7
    public final boolean isExternal() {
        return cm4.E.d(this.B.d).booleanValue();
    }

    @Override // defpackage.x93
    public final q1 s() {
        return this.B;
    }
}
