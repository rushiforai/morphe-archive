package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hre extends c09 {
    public final k49 f = qo7.u(new dfc(0));
    public final k49 g = qo7.u(Boolean.FALSE);
    public final rqe h;
    public final k49 i;
    public float j;
    public bs0 k;

    public hre(wg5 wg5Var) {
        rqe rqeVar = new rqe(wg5Var);
        rqeVar.f = new bd9(28, this);
        this.h = rqeVar;
        this.i = new k49(c1e.a, y3b.h);
        this.j = 1.0f;
    }

    @Override // defpackage.c09
    public final boolean a(float f) {
        this.j = f;
        return true;
    }

    @Override // defpackage.c09
    public final boolean e(bs0 bs0Var) {
        this.k = bs0Var;
        return true;
    }

    @Override // defpackage.c09
    public final long h() {
        return ((dfc) this.f.getValue()).a;
    }

    @Override // defpackage.c09
    public final void i(zl3 zl3Var) {
        bs0 bs0Var = this.k;
        rqe rqeVar = this.h;
        if (bs0Var == null) {
            bs0Var = (bs0) rqeVar.g.getValue();
        }
        if (((Boolean) this.g.getValue()).booleanValue() && zl3Var.getLayoutDirection() == ip6.Rtl) {
            long jK0 = zl3Var.k0();
            m50 m50VarB0 = zl3Var.b0();
            long jB = m50VarB0.B();
            m50VarB0.x().h();
            try {
                ((md5) m50VarB0.b).z(-1.0f, 1.0f, jK0);
                rqeVar.e(zl3Var, this.j, bs0Var);
            } finally {
                y30.x(m50VarB0, jB);
            }
        } else {
            rqeVar.e(zl3Var, this.j, bs0Var);
        }
        this.i.getValue();
    }
}
