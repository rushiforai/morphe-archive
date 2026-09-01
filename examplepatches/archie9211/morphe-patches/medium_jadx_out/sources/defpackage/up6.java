package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class up6 extends eh8 {
    public static final uq Y;
    public sp6 S;
    public tp6 X;

    static {
        uq uqVarZ = rx0.z();
        uqVarZ.e(uu1.f);
        uqVarZ.k(1.0f);
        uqVarZ.l(1);
        Y = uqVarZ;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public up6(aq6 aq6Var, sp6 sp6Var) {
        super(aq6Var);
        this.S = sp6Var;
        this.X = aq6Var.h != null ? new tp6(this) : null;
        if ((((q28) sp6Var).a.c & 512) == 0) {
            return;
        }
        rd6.m();
        throw null;
    }

    @Override // defpackage.eh8
    public final void J0() {
        if (this.X == null) {
            this.X = new tp6(this);
        }
    }

    @Override // defpackage.tk7
    public final int L(int i) {
        sp6 sp6Var = this.S;
        eh8 eh8Var = this.p;
        eh8Var.getClass();
        return sp6Var.e(this, eh8Var, i);
    }

    @Override // defpackage.eh8
    public final hb7 M0() {
        return this.X;
    }

    @Override // defpackage.eh8
    public final q28 O0() {
        return ((q28) this.S).a;
    }

    @Override // defpackage.t99
    public final void X(long j, float f, x45 x45Var) {
        e1(j, f, x45Var, null);
        q1();
    }

    @Override // defpackage.tk7
    public final int a(int i) {
        sp6 sp6Var = this.S;
        eh8 eh8Var = this.p;
        eh8Var.getClass();
        return sp6Var.d(this, eh8Var, i);
    }

    @Override // defpackage.eh8, defpackage.t99
    public final void a0(long j, float f, of5 of5Var) {
        e1(j, f, null, of5Var);
        q1();
    }

    @Override // defpackage.eh8
    public final void d1(e61 e61Var, of5 of5Var) {
        eh8 eh8Var;
        eh8 eh8Var2 = this.p;
        eh8Var2.getClass();
        eh8Var2.H0(e61Var, of5Var);
        if (!((mn) dq6.a(this.o)).getShowLayoutBounds() || (eh8Var = this.p) == null) {
            return;
        }
        if (s46.a(this.c, eh8Var.c) && k46.b(eh8Var.z, 0L)) {
            return;
        }
        long j = this.c;
        e61Var.l(0.5f, 0.5f, ((int) (j >> 32)) - 0.5f, ((int) (j & 4294967295L)) - 0.5f, Y);
    }

    @Override // defpackage.tk7
    public final int k(int i) {
        sp6 sp6Var = this.S;
        eh8 eh8Var = this.p;
        eh8Var.getClass();
        return sp6Var.g(this, eh8Var, i);
    }

    @Override // defpackage.fb7
    public final int l0(yd ydVar) {
        tp6 tp6Var = this.X;
        if (tp6Var == null) {
            return kng.f(this, ydVar);
        }
        t68 t68Var = tp6Var.t;
        int iD = t68Var.d(ydVar);
        if (iD >= 0) {
            return t68Var.c[iD];
        }
        return Integer.MIN_VALUE;
    }

    @Override // defpackage.tk7
    public final int n(int i) {
        sp6 sp6Var = this.S;
        eh8 eh8Var = this.p;
        eh8Var.getClass();
        return sp6Var.a(this, eh8Var, i);
    }

    public final void q1() {
        if (this.j) {
            return;
        }
        Z0();
        eh8 eh8Var = this.p;
        eh8Var.getClass();
        eh8Var.k = this.k;
        w0().d();
        eh8Var.k = false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void r1(sp6 sp6Var) {
        if (sp6Var.equals(this.S) || (((q28) sp6Var).a.c & 512) == 0) {
            this.S = sp6Var;
        } else {
            rd6.m();
        }
    }

    @Override // defpackage.tk7
    public final t99 s(long j) {
        e0(j);
        sp6 sp6Var = this.S;
        eh8 eh8Var = this.p;
        eh8Var.getClass();
        h1(sp6Var.c(this, eh8Var, j));
        Y0();
        return this;
    }
}
