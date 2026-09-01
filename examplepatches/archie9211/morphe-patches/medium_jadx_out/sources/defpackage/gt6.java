package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gt6 extends q28 implements sp6 {
    public static final dt6 r = new dt6();
    public ht6 o;
    public rz2 p;
    public hw8 q;

    public final boolean I0(bt6 bt6Var, int i) {
        if (i == 5 || i == 6) {
            if (this.q == hw8.Horizontal) {
                return false;
            }
        } else if (i == 3 || i == 4) {
            if (this.q == hw8.Vertical) {
                return false;
            }
        } else if (i != 1 && i != 2) {
            ygf.f("Lazy list does not support beyond bounds layout for the specified direction");
            return false;
        }
        if (J0(i)) {
            if (bt6Var.b >= this.o.a() - 1) {
                return false;
            }
        } else if (bt6Var.a <= 0) {
            return false;
        }
        return true;
    }

    public final boolean J0(int i) {
        if (i == 1) {
            return false;
        }
        if (i == 2) {
            return true;
        }
        if (i == 5) {
            return false;
        }
        if (i == 6) {
            return true;
        }
        if (i == 3) {
            int i2 = et6.a[flb.v0(this).z.ordinal()];
            if (i2 == 1) {
                return false;
            }
            if (i2 == 2) {
                return true;
            }
            ygf.a();
            return false;
        }
        if (i != 4) {
            ygf.f("Lazy list does not support beyond bounds layout for the specified direction");
            return false;
        }
        int i3 = et6.a[flb.v0(this).z.ordinal()];
        if (i3 == 1) {
            return true;
        }
        if (i3 == 2) {
            return false;
        }
        ygf.a();
        return false;
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        t99 t99VarS = tk7Var.s(j);
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new y0(t99VarS, 8));
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
}
