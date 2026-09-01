package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bgc implements sl3 {
    public m45 a;
    public final hp1 b;
    public final g49 c;
    public x45 d;
    public boolean i;
    public final g49 o;
    public final g49 p;
    public final ql q;
    public final z78 r;
    public final boolean e = true;
    public final float[] f = new float[0];
    public final h49 g = new h49(0);
    public final h49 h = new h49(0);
    public final h49 j = new h49(0);
    public final h49 k = new h49(0);
    public final hw8 l = hw8.Horizontal;
    public final k49 m = qo7.u(Boolean.FALSE);
    public final i5b n = new i5b(27, this);

    public bgc(float f, m45 m45Var, hp1 hp1Var) {
        this.a = m45Var;
        this.b = hp1Var;
        this.c = new g49(f);
        float f2 = hp1Var.a;
        float f3 = hp1Var.b - f2;
        this.o = new g49(mk7.E(0.0f, 0.0f, iq7.u(f3 == 0.0f ? 0.0f : (f - f2) / f3, 0.0f, 1.0f)));
        this.p = new g49(0.0f);
        this.q = new ql(3, this);
        this.r = new z78();
    }

    @Override // defpackage.sl3
    public final Object a(s78 s78Var, ku2 ku2Var, dl3 dl3Var) {
        Object objS = o7f.s(new mw9(this, s78Var, ku2Var, (n92) null, 27), dl3Var);
        return objS == tb2.COROUTINE_SUSPENDED ? objS : c1e.a;
    }

    public final void b(float f) {
        float fMax;
        float fMin;
        if (this.l == hw8.Vertical) {
            float fG = this.h.g();
            h49 h49Var = this.k;
            fMax = Math.max(fG - (h49Var.g() / 2.0f), 0.0f);
            fMin = Math.min(h49Var.g() / 2.0f, fMax);
        } else {
            float fG2 = this.g.g();
            h49 h49Var2 = this.j;
            fMax = Math.max(fG2 - (h49Var2.g() / 2.0f), 0.0f);
            fMin = Math.min(h49Var2.g() / 2.0f, fMax);
        }
        g49 g49Var = this.o;
        float fG3 = g49Var.g() + f;
        g49 g49Var2 = this.p;
        g49Var.h(g49Var2.g() + fG3);
        g49Var2.h(0.0f);
        float fD = agc.d(g49Var.g(), this.f, fMin, fMax);
        hp1 hp1Var = this.b;
        float f2 = fMax - fMin;
        float fE = mk7.E(hp1Var.a, hp1Var.b, iq7.u(f2 == 0.0f ? 0.0f : (fD - fMin) / f2, 0.0f, 1.0f));
        if (fE == this.c.g()) {
            return;
        }
        x45 x45Var = this.d;
        if (x45Var != null) {
            x45Var.invoke(Float.valueOf(fE));
        } else {
            d(fE);
        }
    }

    public final float c() {
        hp1 hp1Var = this.b;
        float f = hp1Var.a;
        float f2 = hp1Var.b;
        float fU = iq7.u(this.c.g(), f, f2);
        float f3 = f2 - f;
        return iq7.u(f3 == 0.0f ? 0.0f : (fU - f) / f3, 0.0f, 1.0f);
    }

    public final void d(float f) {
        if (this.e) {
            hp1 hp1Var = this.b;
            float f2 = hp1Var.a;
            float f3 = hp1Var.b;
            f = agc.d(iq7.u(f, f2, f3), this.f, f2, f3);
        }
        this.c.h(f);
    }
}
