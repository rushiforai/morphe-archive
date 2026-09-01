package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vrb extends q28 implements sp6, xxb {
    public yrb o;
    public boolean p;

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    @Override // defpackage.sp6
    public final int a(fb7 fb7Var, tk7 tk7Var, int i) {
        if (this.p) {
            i = Integer.MAX_VALUE;
        }
        return tk7Var.n(i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        wgf.g(j, this.p ? hw8.Vertical : hw8.Horizontal);
        t99 t99VarS = tk7Var.s(f72.a(j, 0, this.p ? f72.h(j) : Integer.MAX_VALUE, 0, this.p ? Integer.MAX_VALUE : f72.g(j), 5));
        int i = t99VarS.a;
        int iH = f72.h(j);
        if (i > iH) {
            i = iH;
        }
        int i2 = t99VarS.b;
        int iG = f72.g(j);
        if (i2 > iG) {
            i2 = iG;
        }
        int i3 = t99VarS.b - i2;
        int i4 = t99VarS.a - i;
        if (!this.p) {
            i3 = i4;
        }
        yrb yrbVar = this.o;
        h49 h49Var = yrbVar.e;
        h49 h49Var2 = yrbVar.a;
        h49Var.h(i3);
        oic oicVarA = vn7.A();
        x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
        oic oicVarG = vn7.G(oicVarA);
        try {
            if (h49Var2.g() > i3) {
                h49Var2.h(i3);
            }
            vn7.T(oicVarA, oicVarG, x45VarE);
            this.o.b.h(this.p ? i2 : i);
            this.o.c.h(this.p ? t99VarS.b : t99VarS.a);
            return bl7Var.q0(i, i2, fy3.a, new lwa(this, i3, t99VarS, 1));
        } catch (Throwable th) {
            vn7.T(oicVarA, oicVarG, x45VarE);
            throw th;
        }
    }

    @Override // defpackage.sp6
    public final int d(fb7 fb7Var, tk7 tk7Var, int i) {
        if (!this.p) {
            i = Integer.MAX_VALUE;
        }
        return tk7Var.a(i);
    }

    @Override // defpackage.sp6
    public final int e(fb7 fb7Var, tk7 tk7Var, int i) {
        if (!this.p) {
            i = Integer.MAX_VALUE;
        }
        return tk7Var.L(i);
    }

    @Override // defpackage.sp6
    public final int g(fb7 fb7Var, tk7 tk7Var, int i) {
        if (this.p) {
            i = Integer.MAX_VALUE;
        }
        return tk7Var.k(i);
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        gyb.i(jybVar);
        final int i = 0;
        final int i2 = 1;
        lrb lrbVar = new lrb(new m45(this) { // from class: urb
            public final /* synthetic */ vrb b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int iG;
                int i3 = i;
                vrb vrbVar = this.b;
                switch (i3) {
                    case 0:
                        iG = vrbVar.o.a.g();
                        break;
                    default:
                        iG = vrbVar.o.e.g();
                        break;
                }
                return Float.valueOf(iG);
            }
        }, new m45(this) { // from class: urb
            public final /* synthetic */ vrb b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int iG;
                int i3 = i2;
                vrb vrbVar = this.b;
                switch (i3) {
                    case 0:
                        iG = vrbVar.o.a.g();
                        break;
                    default:
                        iG = vrbVar.o.e.g();
                        break;
                }
                return Float.valueOf(iG);
            }
        });
        if (this.p) {
            iyb iybVar = eyb.w;
            fj6 fj6Var = gyb.a[13];
            jybVar.d(iybVar, lrbVar);
        } else {
            iyb iybVar2 = eyb.v;
            fj6 fj6Var2 = gyb.a[12];
            jybVar.d(iybVar2, lrbVar);
        }
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return false;
    }
}
