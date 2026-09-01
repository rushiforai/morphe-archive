package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rvd extends u55 implements p72 {
    public static final jzb H;
    public final x67 E;
    public final ha3 F;
    public zm1 G;

    static {
        n1b.a.g(new u4a(rvd.class, "withDispatchReceiver", "getWithDispatchReceiver()Lorg/jetbrains/kotlin/descriptors/impl/TypeAliasConstructorDescriptor;", 0));
        H = new jzb();
    }

    public rvd(x67 x67Var, ha3 ha3Var, zm1 zm1Var, rvd rvdVar, ly lyVar, e41 e41Var, jkc jkcVar) {
        super(lyVar, e41Var, ha3Var, rvdVar, olc.e, jkcVar);
        this.E = x67Var;
        this.F = ha3Var;
        a3 a3Var = new a3(this, zm1Var, false, 29);
        x67Var.getClass();
        new t67(x67Var, a3Var);
        this.G = zm1Var;
    }

    @Override // defpackage.u55, defpackage.f41
    public final f41 A(yv2 yv2Var, c28 c28Var, g93 g93Var, e41 e41Var) throws gxd {
        g93Var.getClass();
        e41Var.getClass();
        t55 t55VarE0 = E0(ixd.b);
        t55VarE0.b = yv2Var;
        t55VarE0.c = c28Var;
        t55VarE0.d = g93Var;
        t55VarE0.f = e41Var;
        t55VarE0.m = false;
        u55 u55VarB0 = t55VarE0.x.B0(t55VarE0);
        u55VarB0.getClass();
        return (rvd) u55VarB0;
    }

    @Override // defpackage.u55
    public final u55 A0(ly lyVar, e41 e41Var, yv2 yv2Var, s55 s55Var, n98 n98Var, jkc jkcVar) {
        yv2Var.getClass();
        e41Var.getClass();
        lyVar.getClass();
        e41 e41Var2 = e41.DECLARATION;
        if (e41Var != e41Var2) {
            e41 e41Var3 = e41.SYNTHESIZED;
        }
        return new rvd(this.E, this.F, this.G, this, lyVar, e41Var2, jkcVar);
    }

    @Override // defpackage.u55, defpackage.s55, defpackage.s0d
    /* JADX INFO: renamed from: I0, reason: merged with bridge method [inline-methods] */
    public final rvd f(ixd ixdVar) {
        ixdVar.getClass();
        s55 s55VarF = super.f(ixdVar);
        s55VarF.getClass();
        rvd rvdVar = (rvd) s55VarF;
        mn6 mn6Var = rvdVar.h;
        mn6Var.getClass();
        zm1 zm1VarF = this.G.x0().f(ixd.d(mn6Var));
        if (zm1VarF == null) {
            return null;
        }
        rvdVar.G = zm1VarF;
        return rvdVar;
    }

    @Override // defpackage.bw2, defpackage.zv2, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final c41 x0() {
        s55 s55VarX0 = super.x0();
        s55VarX0.getClass();
        return (rvd) s55VarX0;
    }

    @Override // defpackage.u55, defpackage.c41
    public final mn6 getReturnType() {
        mn6 mn6Var = this.h;
        mn6Var.getClass();
        return mn6Var;
    }

    @Override // defpackage.bw2, defpackage.yv2
    public final do1 h() {
        return this.F;
    }

    @Override // defpackage.p72
    public final boolean q() {
        return this.G.E;
    }

    @Override // defpackage.p72
    public final y28 r() {
        y28 y28VarR = this.G.r();
        y28VarR.getClass();
        return y28VarR;
    }

    @Override // defpackage.bw2
    public final aw2 x0() {
        s55 s55VarX0 = super.x0();
        s55VarX0.getClass();
        return (rvd) s55VarX0;
    }

    @Override // defpackage.bw2, defpackage.yv2
    public final yv2 h() {
        return this.F;
    }

    @Override // defpackage.bw2, defpackage.zv2, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final f41 x0() {
        s55 s55VarX0 = super.x0();
        s55VarX0.getClass();
        return (rvd) s55VarX0;
    }

    @Override // defpackage.bw2, defpackage.zv2, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final yv2 x0() {
        s55 s55VarX0 = super.x0();
        s55VarX0.getClass();
        return (rvd) s55VarX0;
    }

    @Override // defpackage.u55, defpackage.bw2, defpackage.zv2, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final s55 x0() {
        s55 s55VarX0 = super.x0();
        s55VarX0.getClass();
        return (rvd) s55VarX0;
    }
}
