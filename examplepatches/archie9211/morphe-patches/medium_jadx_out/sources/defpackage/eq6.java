package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eq6 {
    public final aq6 a;
    public boolean b;
    public boolean c;
    public boolean e;
    public boolean f;
    public boolean g;
    public int h;
    public int i;
    public boolean j;
    public boolean k;
    public int l;
    public boolean m;
    public boolean n;
    public int o;
    public mb7 q;
    public wp6 d = wp6.Idle;
    public final yk7 p = new yk7(this);

    public eq6(aq6 aq6Var) {
        this.a = aq6Var;
    }

    public final eh8 a() {
        return (eh8) this.a.F.e;
    }

    public final void b() {
        wp6 wp6Var = this.a.G.d;
        if (wp6Var == wp6.LayingOut || wp6Var == wp6.LookaheadLayingOut) {
            if (this.p.B) {
                g(true);
            } else {
                f(true);
            }
        }
        if (wp6Var == wp6.LookaheadLayingOut) {
            mb7 mb7Var = this.q;
            if (mb7Var == null || !mb7Var.v) {
                h(true);
            } else {
                i(true);
            }
        }
    }

    public final void c(long j) {
        mb7 mb7Var = this.q;
        if (mb7Var != null) {
            wp6 wp6Var = wp6.LookaheadMeasuring;
            eq6 eq6Var = mb7Var.f;
            eq6Var.d = wp6Var;
            aq6 aq6Var = eq6Var.a;
            eq6Var.e = false;
            mb7Var.z = j;
            px8 snapshotObserver = ((mn) dq6.a(aq6Var)).getSnapshotObserver();
            lb7 lb7Var = mb7Var.A;
            snapshotObserver.getClass();
            snapshotObserver.a.d(aq6Var, zu2.E, lb7Var);
            eq6Var.f = true;
            eq6Var.g = true;
            boolean zL = dm2.L(aq6Var);
            yk7 yk7Var = eq6Var.p;
            if (zL) {
                yk7Var.w = true;
                yk7Var.x = true;
            } else {
                yk7Var.v = true;
            }
            eq6Var.d = wp6.Idle;
        }
    }

    public final void d(int i) {
        int i2 = this.l;
        this.l = i;
        if ((i2 == 0) != (i == 0)) {
            aq6 aq6VarV = this.a.v();
            eq6 eq6Var = aq6VarV != null ? aq6VarV.G : null;
            if (eq6Var != null) {
                int i3 = eq6Var.l;
                if (i == 0) {
                    eq6Var.d(i3 - 1);
                } else {
                    eq6Var.d(i3 + 1);
                }
            }
        }
    }

    public final void e(int i) {
        int i2 = this.o;
        this.o = i;
        if ((i2 == 0) != (i == 0)) {
            aq6 aq6VarV = this.a.v();
            eq6 eq6Var = aq6VarV != null ? aq6VarV.G : null;
            if (eq6Var != null) {
                int i3 = eq6Var.o;
                if (i == 0) {
                    eq6Var.e(i3 - 1);
                } else {
                    eq6Var.e(i3 + 1);
                }
            }
        }
    }

    public final void f(boolean z) {
        if (this.k != z) {
            this.k = z;
            if (z && !this.j) {
                d(this.l + 1);
            } else {
                if (z || this.j) {
                    return;
                }
                d(this.l - 1);
            }
        }
    }

    public final void g(boolean z) {
        if (this.j != z) {
            this.j = z;
            if (z && !this.k) {
                d(this.l + 1);
            } else {
                if (z || this.k) {
                    return;
                }
                d(this.l - 1);
            }
        }
    }

    public final void h(boolean z) {
        if (this.n != z) {
            this.n = z;
            if (z && !this.m) {
                e(this.o + 1);
            } else {
                if (z || this.m) {
                    return;
                }
                e(this.o - 1);
            }
        }
    }

    public final void i(boolean z) {
        if (this.m != z) {
            this.m = z;
            if (z && !this.n) {
                e(this.o + 1);
            } else {
                if (z || this.n) {
                    return;
                }
                e(this.o - 1);
            }
        }
    }

    public final void j() {
        yk7 yk7Var = this.p;
        eq6 eq6Var = yk7Var.f;
        Object obj = yk7Var.s;
        aq6 aq6Var = this.a;
        if ((obj != null || eq6Var.a().w() != null) && yk7Var.r) {
            yk7Var.r = false;
            yk7Var.s = eq6Var.a().w();
            aq6 aq6VarV = aq6Var.v();
            if (aq6VarV != null) {
                aq6.V(aq6VarV, false, 7);
            }
        }
        mb7 mb7Var = this.q;
        if (mb7Var != null) {
            eq6 eq6Var2 = mb7Var.f;
            if (mb7Var.y == null) {
                hb7 hb7VarM0 = eq6Var2.a().M0();
                hb7VarM0.getClass();
                if (hb7VarM0.o.w() == null) {
                    return;
                }
            }
            if (mb7Var.x) {
                mb7Var.x = false;
                hb7 hb7VarM02 = eq6Var2.a().M0();
                hb7VarM02.getClass();
                mb7Var.y = hb7VarM02.o.w();
                if (dm2.L(aq6Var)) {
                    aq6 aq6VarV2 = aq6Var.v();
                    if (aq6VarV2 != null) {
                        aq6.V(aq6VarV2, false, 7);
                        return;
                    }
                    return;
                }
                aq6 aq6VarV3 = aq6Var.v();
                if (aq6VarV3 != null) {
                    aq6.T(aq6VarV3, false, 7);
                }
            }
        }
    }
}
