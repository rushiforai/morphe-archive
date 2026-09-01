package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yk7 extends t99 implements tk7, de, g48 {
    public boolean B;
    public float F;
    public boolean G;
    public x45 H;
    public of5 I;
    public float K;
    public boolean M;
    public final eq6 f;
    public boolean g;
    public boolean j;
    public boolean k;
    public boolean m;
    public x45 o;
    public of5 p;
    public float q;
    public Object s;
    public boolean t;
    public boolean u;
    public boolean v;
    public boolean w;
    public boolean x;
    public int h = Integer.MAX_VALUE;
    public int i = Integer.MAX_VALUE;
    public yp6 l = yp6.NotUsed;
    public long n = 0;
    public boolean r = true;
    public final bq6 y = new bq6(this, 0);
    public final o78 z = new o78(new yk7[16]);
    public boolean A = true;
    public long C = h72.b(0, 0, 0, 0, 15);
    public final xk7 D = new xk7(this, 1);
    public final xk7 E = new xk7(this, 0);
    public long J = 0;
    public final xk7 L = new xk7(this, 2);

    public yk7(eq6 eq6Var) {
        this.f = eq6Var;
    }

    @Override // defpackage.de
    public final void A(ce ceVar) {
        o78 o78VarZ = this.f.a.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            ceVar.invoke(((aq6) objArr[i2]).G.p);
        }
    }

    @Override // defpackage.g48
    public final void B(boolean z) {
        eq6 eq6Var = this.f;
        if (z != eq6Var.a().i) {
            eq6Var.a().i = z;
            this.M = true;
        }
    }

    @Override // defpackage.de
    public final void C() {
        boolean zV0;
        this.B = true;
        bq6 bq6Var = this.y;
        bq6Var.h();
        boolean z = this.w;
        eq6 eq6Var = this.f;
        if (z) {
            o78 o78VarZ = eq6Var.a.z();
            Object[] objArr = o78VarZ.a;
            int i = o78VarZ.c;
            for (int i2 = 0; i2 < i; i2++) {
                aq6 aq6Var = (aq6) objArr[i2];
                boolean zQ = aq6Var.q();
                eq6 eq6Var2 = aq6Var.G;
                if (zQ && aq6Var.r() == yp6.InMeasureBlock) {
                    yk7 yk7Var = eq6Var2.p;
                    f72 f72Var = yk7Var.j ? new f72(yk7Var.d) : null;
                    if (f72Var != null) {
                        if (aq6Var.C == yp6.NotUsed) {
                            aq6Var.e();
                        }
                        zV0 = eq6Var2.p.v0(f72Var.a);
                    } else {
                        zV0 = false;
                    }
                    if (zV0) {
                        aq6.V(eq6Var.a, false, 7);
                    }
                }
            }
        }
        if (this.x || (!this.m && !e().k && this.w)) {
            this.w = false;
            wp6 wp6Var = eq6Var.d;
            eq6Var.d = wp6.LayingOut;
            eq6Var.g(false);
            aq6 aq6Var2 = eq6Var.a;
            px8 snapshotObserver = ((mn) dq6.a(aq6Var2)).getSnapshotObserver();
            snapshotObserver.getClass();
            snapshotObserver.a.d(aq6Var2, zu2.A, this.E);
            eq6Var.d = wp6Var;
            this.x = false;
        }
        if (bq6Var.d) {
            bq6Var.e = true;
        }
        if (bq6Var.b && bq6Var.e()) {
            bq6Var.g();
        }
        this.B = false;
    }

    @Override // defpackage.de
    public final void K() {
        aq6.V(this.f.a, false, 7);
    }

    @Override // defpackage.tk7
    public final int L(int i) {
        eq6 eq6Var = this.f;
        if (!dm2.L(eq6Var.a)) {
            o0();
            return eq6Var.a().L(i);
        }
        mb7 mb7Var = eq6Var.q;
        mb7Var.getClass();
        return mb7Var.L(i);
    }

    @Override // defpackage.t99
    public final int M(yd ydVar) {
        eq6 eq6Var = this.f;
        aq6 aq6VarV = eq6Var.a.v();
        wp6 wp6Var = aq6VarV != null ? aq6VarV.G.d : null;
        wp6 wp6Var2 = wp6.Measuring;
        bq6 bq6Var = this.y;
        if (wp6Var == wp6Var2) {
            bq6Var.c = true;
        } else {
            aq6 aq6VarV2 = eq6Var.a.v();
            if ((aq6VarV2 != null ? aq6VarV2.G.d : null) == wp6.LayingOut) {
                bq6Var.d = true;
            }
        }
        this.m = true;
        int iM = eq6Var.a().M(ydVar);
        this.m = false;
        return iM;
    }

    @Override // defpackage.t99
    public final int P() {
        return this.f.a().P();
    }

    @Override // defpackage.t99
    public final int R() {
        return this.f.a().R();
    }

    @Override // defpackage.t99
    public final void X(long j, float f, x45 x45Var) throws Throwable {
        u0(j, f, x45Var, null);
    }

    @Override // defpackage.tk7
    public final int a(int i) {
        eq6 eq6Var = this.f;
        if (!dm2.L(eq6Var.a)) {
            o0();
            return eq6Var.a().a(i);
        }
        mb7 mb7Var = eq6Var.q;
        mb7Var.getClass();
        return mb7Var.a(i);
    }

    @Override // defpackage.t99
    public final void a0(long j, float f, of5 of5Var) throws Throwable {
        u0(j, f, null, of5Var);
    }

    @Override // defpackage.de
    public final bq6 c() {
        return this.y;
    }

    @Override // defpackage.de
    public final l26 e() {
        return (l26) this.f.a.F.d;
    }

    @Override // defpackage.de
    public final de g() {
        eq6 eq6Var;
        aq6 aq6VarV = this.f.a.v();
        if (aq6VarV == null || (eq6Var = aq6VarV.G) == null) {
            return null;
        }
        return eq6Var.p;
    }

    public final List j0() {
        eq6 eq6Var = this.f;
        eq6Var.a.f0();
        boolean z = this.A;
        o78 o78Var = this.z;
        if (!z) {
            return o78Var.g();
        }
        aq6 aq6Var = eq6Var.a;
        o78 o78VarZ = aq6Var.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            aq6 aq6Var2 = (aq6) objArr[i2];
            if (o78Var.c <= i2) {
                o78Var.b(aq6Var2.G.p);
            } else {
                yk7 yk7Var = aq6Var2.G.p;
                Object[] objArr2 = o78Var.a;
                Object obj = objArr2[i2];
                objArr2[i2] = yk7Var;
            }
        }
        o78Var.o(((o78) ((v68) aq6Var.n()).b).c, o78Var.c);
        this.A = false;
        return o78Var.g();
    }

    @Override // defpackage.tk7
    public final int k(int i) {
        eq6 eq6Var = this.f;
        if (!dm2.L(eq6Var.a)) {
            o0();
            return eq6Var.a().k(i);
        }
        mb7 mb7Var = eq6Var.q;
        mb7Var.getClass();
        return mb7Var.k(i);
    }

    @Override // defpackage.de
    public final int l() {
        return this.i;
    }

    public final void l0() {
        boolean z = this.t;
        this.t = true;
        eq6 eq6Var = this.f;
        aq6 aq6Var = eq6Var.a;
        hj0 hj0Var = aq6Var.F;
        if (!z) {
            ((l26) hj0Var.d).Z0();
            ((mn) dq6.a(aq6Var)).getRectManager().f(eq6Var.a);
            if (aq6Var.q()) {
                aq6.V(aq6Var, true, 6);
            } else if (aq6Var.G.e) {
                aq6.T(aq6Var, true, 6);
            }
        }
        eh8 eh8Var = ((l26) hj0Var.d).p;
        for (eh8 eh8Var2 = (eh8) hj0Var.e; !g76.L(eh8Var2, eh8Var) && eh8Var2 != null; eh8Var2 = eh8Var2.p) {
            if (eh8Var2.K) {
                eh8Var2.V0();
            }
        }
        o78 o78VarZ = aq6Var.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            aq6 aq6Var2 = (aq6) objArr[i2];
            if (aq6Var2.w() != Integer.MAX_VALUE) {
                aq6Var2.G.p.l0();
                aq6.W(aq6Var2);
            }
        }
    }

    @Override // defpackage.tk7
    public final int n(int i) {
        eq6 eq6Var = this.f;
        if (!dm2.L(eq6Var.a)) {
            o0();
            return eq6Var.a().n(i);
        }
        mb7 mb7Var = eq6Var.q;
        mb7Var.getClass();
        return mb7Var.n(i);
    }

    public final void n0() {
        if (this.t) {
            this.t = false;
            eq6 eq6Var = this.f;
            aq6 aq6Var = eq6Var.a;
            aq6 aq6Var2 = eq6Var.a;
            ((mn) dq6.a(aq6Var)).getRectManager().g(aq6Var2);
            hj0 hj0Var = aq6Var2.F;
            eh8 eh8Var = ((l26) hj0Var.d).p;
            for (eh8 eh8Var2 = (eh8) hj0Var.e; !g76.L(eh8Var2, eh8Var) && eh8Var2 != null; eh8Var2 = eh8Var2.p) {
                eh8Var2.b1();
                eh8Var2.g1();
            }
            o78 o78VarZ = aq6Var2.z();
            Object[] objArr = o78VarZ.a;
            int i = o78VarZ.c;
            for (int i2 = 0; i2 < i; i2++) {
                ((aq6) objArr[i2]).G.p.n0();
            }
        }
    }

    public final void o0() {
        eq6 eq6Var = this.f;
        aq6.V(eq6Var.a, false, 7);
        aq6 aq6Var = eq6Var.a;
        aq6 aq6VarV = aq6Var.v();
        if (aq6VarV == null || aq6Var.C != yp6.NotUsed) {
            return;
        }
        int i = wk7.a[aq6VarV.G.d.ordinal()];
        aq6Var.C = i != 1 ? i != 2 ? aq6VarV.C : yp6.InLayoutBlock : yp6.InMeasureBlock;
    }

    public final void r0() {
        this.G = true;
        eq6 eq6Var = this.f;
        aq6 aq6VarV = eq6Var.a.v();
        float f = e().A;
        aq6 aq6Var = eq6Var.a;
        hj0 hj0Var = aq6Var.F;
        eh8 eh8Var = (eh8) hj0Var.e;
        l26 l26Var = (l26) hj0Var.d;
        while (eh8Var != l26Var) {
            eh8Var.getClass();
            up6 up6Var = (up6) eh8Var;
            f += up6Var.A;
            eh8Var = up6Var.p;
        }
        if (f != this.F) {
            this.F = f;
            if (aq6VarV != null) {
                aq6VarV.O();
            }
            if (aq6VarV != null) {
                aq6VarV.C();
            }
        }
        if (!e().k) {
            boolean z = this.t;
            if (!z || this.y.d()) {
                l0();
            }
            if (z) {
                ((l26) aq6Var.F.d).Z0();
            } else {
                if (aq6VarV != null) {
                    aq6VarV.C();
                }
                if (this.g && aq6VarV != null) {
                    aq6VarV.U(false);
                }
            }
        }
        if (aq6VarV != null) {
            eq6 eq6Var2 = aq6VarV.G;
            if (!this.g && eq6Var2.d == wp6.LayingOut) {
                if (this.i != Integer.MAX_VALUE) {
                    b26.b("Place was called on a node which was placed already");
                }
                int i = eq6Var2.i;
                this.i = i;
                eq6Var2.i = i + 1;
            }
        } else {
            this.i = 0;
        }
        C();
    }

    @Override // defpackage.de
    public final void requestLayout() {
        this.f.a.U(false);
    }

    @Override // defpackage.tk7
    public final t99 s(long j) {
        yp6 yp6Var;
        eq6 eq6Var = this.f;
        aq6 aq6Var = eq6Var.a;
        aq6 aq6Var2 = eq6Var.a;
        yp6 yp6Var2 = aq6Var.C;
        yp6 yp6Var3 = yp6.NotUsed;
        if (yp6Var2 == yp6Var3) {
            aq6Var.e();
        }
        if (dm2.L(aq6Var2)) {
            mb7 mb7Var = eq6Var.q;
            mb7Var.getClass();
            mb7Var.j = yp6Var3;
            mb7Var.s(j);
        }
        aq6 aq6VarV = aq6Var2.v();
        if (aq6VarV != null) {
            eq6 eq6Var2 = aq6VarV.G;
            if (this.l != yp6Var3 && !aq6Var2.E) {
                b26.b("measure() may not be called multiple times on the same Measurable. If you want to get the content size of the Measurable before calculating the final constraints, please use methods like minIntrinsicWidth()/maxIntrinsicWidth() and minIntrinsicHeight()/maxIntrinsicHeight()");
            }
            int i = wk7.a[eq6Var2.d.ordinal()];
            if (i == 1) {
                yp6Var = yp6.InMeasureBlock;
            } else {
                if (i != 2) {
                    rd6.g("Measurable could be only measured from the parent's measure or layout block. Parents state is ", eq6Var2.d);
                    return null;
                }
                yp6Var = yp6.InLayoutBlock;
            }
            this.l = yp6Var;
        } else {
            this.l = yp6Var3;
        }
        v0(j);
        return this;
    }

    public final void s0(long j, float f, x45 x45Var, of5 of5Var) {
        eq6 eq6Var = this.f;
        aq6 aq6Var = eq6Var.a;
        aq6 aq6Var2 = eq6Var.a;
        if (aq6Var.Q) {
            b26.a("place is called on a deactivated node");
        }
        eq6Var.d = wp6.LayingOut;
        this.n = j;
        this.q = f;
        this.o = x45Var;
        this.p = of5Var;
        this.G = false;
        mx8 mx8VarA = dq6.a(aq6Var2);
        if (this.w || !this.t) {
            this.y.g = false;
            eq6Var.f(false);
            this.H = x45Var;
            this.J = j;
            this.K = f;
            this.I = of5Var;
            px8 snapshotObserver = ((mn) mx8VarA).getSnapshotObserver();
            snapshotObserver.getClass();
            snapshotObserver.a.d(aq6Var2, zu2.B, this.L);
        } else {
            eh8 eh8VarA = eq6Var.a();
            eh8VarA.e1(k46.d(j, eh8VarA.e), f, x45Var, of5Var);
            r0();
        }
        eq6Var.d = wp6.Idle;
        if (eq6Var.a().k && (eq6Var.k || eq6Var.j)) {
            requestLayout();
        }
        this.k = true;
    }

    public final void u0(long j, float f, x45 x45Var, of5 of5Var) throws Throwable {
        eq6 eq6Var = this.f;
        aq6 aq6Var = eq6Var.a;
        aq6 aq6Var2 = eq6Var.a;
        try {
            this.u = true;
            if (!k46.b(j, this.n) || x45Var != this.o || this.M) {
                if (eq6Var.k || eq6Var.j || this.M) {
                    this.w = true;
                    this.M = false;
                }
            }
            mb7 mb7Var = eq6Var.q;
            if (mb7Var != null) {
                eq6 eq6Var2 = mb7Var.f;
                if (mb7Var.r == jb7.IsNotPlaced && !dm2.L(eq6Var2.a)) {
                    eq6Var2.c = true;
                }
            }
            mb7 mb7Var2 = eq6Var.q;
            if (mb7Var2 != null && mb7Var2.j0()) {
                eh8 eh8Var = eq6Var.a().q;
                s99 placementScope = eh8Var != null ? eh8Var.l : ((mn) dq6.a(aq6Var2)).getPlacementScope();
                mb7 mb7Var3 = eq6Var.q;
                mb7Var3.getClass();
                aq6 aq6VarV = aq6Var2.v();
                if (aq6VarV != null) {
                    aq6VarV.G.h = 0;
                }
                mb7Var3.i = Integer.MAX_VALUE;
                placementScope.g(mb7Var3, (int) (j >> 32), (int) (4294967295L & j), 0.0f);
            }
            mb7 mb7Var4 = eq6Var.q;
            if (mb7Var4 != null && !mb7Var4.l) {
                b26.b("Error: Placement happened before lookahead.");
            }
            s0(j, f, x45Var, of5Var);
        } catch (Throwable th) {
            aq6Var.Y(th);
            throw null;
        }
    }

    public final boolean v0(long j) {
        eq6 eq6Var = this.f;
        aq6 aq6Var = eq6Var.a;
        aq6 aq6Var2 = eq6Var.a;
        try {
            if (aq6Var.Q) {
                b26.a("measure is called on a deactivated node");
            }
            mx8 mx8VarA = dq6.a(aq6Var2);
            aq6 aq6VarV = aq6Var2.v();
            boolean z = true;
            aq6Var2.E = aq6Var2.E || (aq6VarV != null && aq6VarV.E);
            if (!aq6Var2.q() && f72.b(this.d, j)) {
                ((mn) mx8VarA).l(aq6Var2, false);
                aq6Var2.X();
                return false;
            }
            this.y.f = false;
            o78 o78VarZ = aq6Var2.z();
            Object[] objArr = o78VarZ.a;
            int i = o78VarZ.c;
            for (int i2 = 0; i2 < i; i2++) {
                ((aq6) objArr[i2]).G.p.y.c = false;
            }
            this.j = true;
            long j2 = eq6Var.a().c;
            e0(j);
            wp6 wp6Var = eq6Var.d;
            wp6 wp6Var2 = wp6.Idle;
            if (wp6Var != wp6Var2) {
                b26.b("layout state is not idle before measure starts");
            }
            this.C = j;
            wp6 wp6Var3 = wp6.Measuring;
            eq6Var.d = wp6Var3;
            this.v = false;
            px8 snapshotObserver = ((mn) dq6.a(aq6Var2)).getSnapshotObserver();
            xk7 xk7Var = this.D;
            snapshotObserver.getClass();
            snapshotObserver.a.d(aq6Var2, ox8.b, xk7Var);
            if (eq6Var.d == wp6Var3) {
                this.w = true;
                this.x = true;
                eq6Var.d = wp6Var2;
            }
            if (s46.a(eq6Var.a().c, j2) && eq6Var.a().a == this.a && eq6Var.a().b == this.b) {
                z = false;
            }
            d0((((long) eq6Var.a().b) & 4294967295L) | (((long) eq6Var.a().a) << 32));
            return z;
        } catch (Throwable th) {
            aq6Var.Y(th);
            throw null;
        }
    }

    @Override // defpackage.t99, defpackage.tk7
    public final Object w() {
        return this.s;
    }

    public final void w0() {
        eq6 eq6Var = this.f;
        aq6 aq6Var = eq6Var.a;
        aq6 aq6Var2 = eq6Var.a;
        if (!aq6Var.I() || eq6Var.l <= 0) {
            return;
        }
        eq6 eq6Var2 = aq6Var2.G;
        if ((eq6Var2.j || eq6Var2.k) && !eq6Var2.p.w) {
            aq6Var2.U(false);
        }
        o78 o78VarZ = aq6Var2.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            ((aq6) objArr[i2]).G.p.w0();
        }
    }
}
