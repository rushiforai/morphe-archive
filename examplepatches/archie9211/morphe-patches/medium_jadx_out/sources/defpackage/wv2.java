package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wv2 implements nw {
    public final nre a;
    public final hud b;
    public final Object c;
    public final dx d;
    public final dx e;
    public final dx f;
    public final Object g;
    public final long h;

    public wv2(xv2 xv2Var, hud hudVar, Object obj, dx dxVar) {
        nre nreVar = new nre(xv2Var.a);
        this.a = nreVar;
        this.b = hudVar;
        this.c = obj;
        dx dxVar2 = (dx) hudVar.a.invoke(obj);
        this.d = dxVar2;
        this.e = nk7.m0(dxVar);
        x45 x45Var = hudVar.b;
        dx dxVarC = nreVar.d;
        if (dxVarC == null) {
            dxVarC = dxVar2.c();
            nreVar.d = dxVarC;
        }
        int iB = dxVarC.b();
        int i = 0;
        while (true) {
            dx dxVar3 = nreVar.d;
            ln4 ln4Var = nreVar.a;
            if (i >= iB) {
                if (dxVar3 == null) {
                    g76.g0("targetVector");
                    throw null;
                }
                this.g = x45Var.invoke(dxVar3);
                dx dxVarC2 = nreVar.c;
                if (dxVarC2 == null) {
                    dxVarC2 = dxVar2.c();
                    nreVar.c = dxVarC2;
                }
                int iB2 = dxVarC2.b();
                long jMax = 0;
                for (int i2 = 0; i2 < iB2; i2++) {
                    dxVar2.getClass();
                    jMax = Math.max(jMax, ln4Var.o(dxVar.a(i2)));
                }
                this.h = jMax;
                dx dxVarM0 = nk7.m0(this.a.a(jMax, this.d, dxVar));
                this.f = dxVarM0;
                int iB3 = dxVarM0.b();
                for (int i3 = 0; i3 < iB3; i3++) {
                    dx dxVar4 = this.f;
                    float fA = dxVar4.a(i3);
                    float f = this.a.e;
                    dxVar4.e(i3, iq7.u(fA, -f, f));
                }
                return;
            }
            if (dxVar3 == null) {
                g76.g0("targetVector");
                throw null;
            }
            dxVar3.e(i, ln4Var.p(dxVar2.a(i), dxVar.a(i)));
            i++;
        }
    }

    @Override // defpackage.nw
    public final boolean b() {
        return false;
    }

    @Override // defpackage.nw
    public final long c() {
        return this.h;
    }

    @Override // defpackage.nw
    public final hud d() {
        return this.b;
    }

    @Override // defpackage.nw
    public final dx e(long j) {
        if (lv8.a(this, j)) {
            return this.f;
        }
        return this.a.a(j, this.d, this.e);
    }

    @Override // defpackage.nw
    public final /* synthetic */ boolean f(long j) {
        return lv8.a(this, j);
    }

    @Override // defpackage.nw
    public final Object g(long j) {
        if (lv8.a(this, j)) {
            return this.g;
        }
        x45 x45Var = this.b.b;
        nre nreVar = this.a;
        dx dxVarC = nreVar.b;
        dx dxVar = this.d;
        if (dxVarC == null) {
            dxVarC = dxVar.c();
            nreVar.b = dxVarC;
        }
        int iB = dxVarC.b();
        int i = 0;
        while (true) {
            dx dxVar2 = nreVar.b;
            if (i >= iB) {
                if (dxVar2 != null) {
                    return x45Var.invoke(dxVar2);
                }
                g76.g0("valueVector");
                throw null;
            }
            if (dxVar2 == null) {
                g76.g0("valueVector");
                throw null;
            }
            dxVar2.e(i, nreVar.a.k(dxVar.a(i), this.e.a(i), j));
            i++;
        }
    }

    @Override // defpackage.nw
    public final Object h() {
        return this.g;
    }
}
