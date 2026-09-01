package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tld extends q28 implements sp6 {
    public d56 o;
    public boolean p;
    public wlc q;
    public boolean r;
    public ou s;
    public ou t;
    public float u;
    public float v;

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        float fZ = bl7Var.Z(this.r ? q5d.n : ((tk7Var.a(f72.h(j)) != 0 && tk7Var.n(f72.g(j)) != 0) || this.p) ? o5d.a : o5d.b);
        ou ouVar = this.t;
        int iFloatValue = (int) (ouVar != null ? ((Number) ouVar.d()).floatValue() : fZ);
        if (!((iFloatValue >= 0) & (iFloatValue >= 0))) {
            d26.a("width and height must be >= 0");
        }
        t99 t99VarS = tk7Var.s(h72.h(iFloatValue, iFloatValue, iFloatValue, iFloatValue));
        float fZ2 = bl7Var.Z((o5d.d - bl7Var.Q(fZ)) / 2.0f);
        float fZ3 = bl7Var.Z((o5d.c - o5d.a) - o5d.e);
        boolean z = this.r;
        if (z && this.p) {
            fZ2 = fZ3 - bl7Var.Z(q5d.s);
        } else if (z && !this.p) {
            fZ2 = bl7Var.Z(q5d.s);
        } else if (this.p) {
            fZ2 = fZ3;
        }
        ou ouVar2 = this.t;
        if (!g76.J(ouVar2 != null ? (Float) ouVar2.e.getValue() : null, fZ)) {
            vx0.c0(u0(), null, null, new sld(this, fZ, null, 0), 3);
        }
        ou ouVar3 = this.s;
        if (!g76.J(ouVar3 != null ? (Float) ouVar3.e.getValue() : null, fZ2)) {
            vx0.c0(u0(), null, null, new sld(this, fZ2, null, 1), 3);
        }
        if (Float.isNaN(this.v) && Float.isNaN(this.u)) {
            this.v = fZ;
            this.u = fZ2;
        }
        return bl7Var.q0(iFloatValue, iFloatValue, fy3.a, new so(t99VarS, this, fZ2));
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.b(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.f(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.h(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    @Override // defpackage.q28
    public final void y0() {
        vx0.c0(u0(), null, null, new xi7(this, null, 29), 3);
    }
}
