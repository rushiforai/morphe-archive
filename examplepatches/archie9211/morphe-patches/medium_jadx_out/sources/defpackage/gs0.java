package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gs0 extends q28 implements sp6, xxb {
    public x45 o;

    public gs0(x45 x45Var) {
        this.o = x45Var;
    }

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        t99 t99VarS = tk7Var.s(j);
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new jr(t99VarS, 7, this));
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

    @Override // defpackage.xxb
    public final boolean i() {
        return false;
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        m3c m3cVar;
        boolean z;
        eh8 eh8VarT0 = flb.t0(this, 2);
        if (eh8VarT0.F) {
            m3cVar = eh8VarT0.D;
            z = eh8VarT0.E;
        } else {
            tjb tjbVar = xz5.i;
            if (tjbVar == null) {
                xz5.i = new tjb();
            } else {
                tjbVar.a();
            }
            tjb tjbVar2 = xz5.i;
            tjbVar2.getClass();
            tjbVar2.s = eh8VarT0.o.y;
            tjbVar2.r = nk7.C0(eh8VarT0.c);
            oic oicVarA = vn7.A();
            x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
            oic oicVarG = vn7.G(oicVarA);
            try {
                this.o.invoke(tjbVar2);
                vn7.T(oicVarA, oicVarG, x45VarE);
                m3cVar = tjbVar2.o;
                z = tjbVar2.p;
            } catch (Throwable th) {
                vn7.T(oicVarA, oicVarG, x45VarE);
                throw th;
            }
        }
        if (z) {
            gyb.h(jybVar, m3cVar);
        }
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return false;
    }

    public final String toString() {
        return "BlockGraphicsLayerModifier(block=" + this.o + ')';
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }
}
