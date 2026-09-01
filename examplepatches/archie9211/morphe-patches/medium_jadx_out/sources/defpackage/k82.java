package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k82 extends q28 implements u22, fl7 {
    public hw8 o;
    public final vsb p;
    public boolean q;
    public xy0 r;
    public final isb s;
    public boolean u;
    public boolean w;
    public final zm7 t = new zm7(6);
    public long v = -1;

    public k82(hw8 hw8Var, vsb vsbVar, boolean z, xy0 xy0Var, isb isbVar) {
        this.o = hw8Var;
        this.p = vsbVar;
        this.q = z;
        this.r = xy0Var;
        this.s = isbVar;
    }

    public static boolean K0(k82 k82Var, zwa zwaVar, long j, long j2, int i) {
        if ((i & 1) != 0) {
            j = k82Var.J0();
        }
        long j3 = j;
        if ((i & 2) != 0) {
            j2 = 0;
        }
        long jM0 = k82Var.M0(zwaVar, j3, j2);
        return Math.abs(Float.intBitsToFloat((int) (jM0 >> 32))) <= 0.5f && Math.abs(Float.intBitsToFloat((int) (jM0 & 4294967295L))) <= 0.5f;
    }

    public final float I0(xy0 xy0Var, long j) {
        char c;
        float f;
        long j2;
        zwa zwaVar;
        int iCompare;
        long j3 = this.v;
        o78 o78Var = (o78) this.t.b;
        int i = o78Var.c - 1;
        Object[] objArr = o78Var.a;
        if (i < objArr.length) {
            zwaVar = null;
            while (true) {
                if (i < 0) {
                    c = ' ';
                    f = 0.0f;
                    j2 = 4294967295L;
                    break;
                }
                zwa zwaVar2 = (zwa) ((g82) objArr[i]).a.invoke();
                if (zwaVar2 != null) {
                    long jC = zwaVar2.c();
                    long jC0 = nk7.C0(J0());
                    f = 0.0f;
                    int i2 = h82.a[this.o.ordinal()];
                    if (i2 == 1) {
                        c = ' ';
                        j2 = 4294967295L;
                        iCompare = Float.compare(Float.intBitsToFloat((int) (jC & 4294967295L)), Float.intBitsToFloat((int) (jC0 & 4294967295L)));
                    } else {
                        if (i2 != 2) {
                            ygf.a();
                            return 0.0f;
                        }
                        c = ' ';
                        j2 = 4294967295L;
                        iCompare = Float.compare(Float.intBitsToFloat((int) (jC >> 32)), Float.intBitsToFloat((int) (jC0 >> 32)));
                    }
                    if (iCompare <= 0) {
                        zwaVar = zwaVar2;
                    } else if (zwaVar == null) {
                        zwaVar = zwaVar2;
                    }
                }
                i--;
            }
        } else {
            c = ' ';
            f = 0.0f;
            j2 = 4294967295L;
            zwaVar = null;
        }
        if (zwaVar == null) {
            zwa zwaVar3 = this.u ? (zwa) this.s.invoke() : null;
            if (zwaVar3 == null) {
                return f;
            }
            zwaVar = zwaVar3;
        }
        long jC02 = nk7.C0(j3);
        int i3 = h82.a[this.o.ordinal()];
        if (i3 == 1) {
            float f2 = zwaVar.b;
            return xy0Var.a(f2 - ((int) (j & j2)), zwaVar.d - f2, Float.intBitsToFloat((int) (jC02 & j2)));
        }
        if (i3 == 2) {
            float f3 = zwaVar.a;
            return xy0Var.a(f3 - ((int) (j >> c)), zwaVar.c - f3, Float.intBitsToFloat((int) (jC02 >> c)));
        }
        ygf.a();
        return f;
    }

    public final long J0() {
        long j = this.v;
        if (s46.a(j, -1L)) {
            return 0L;
        }
        return j;
    }

    public final void L0(long j) {
        xy0 xy0Var = this.r;
        if (xy0Var == null) {
            xy0Var = (xy0) bo.K(this, yy0.a);
        }
        xy0 xy0Var2 = xy0Var;
        if (this.w) {
            e26.c("launchAnimation called when previous animation was running");
        }
        xy0 xy0Var3 = this.r;
        if (xy0Var3 == null) {
            xy0Var3 = (xy0) bo.K(this, yy0.a);
        }
        vx0.c0(u0(), null, wb2.UNDISPATCHED, new j82(this, new d4e(xy0Var3.b()), xy0Var2, j, (n92) null, 0), 1);
    }

    public final long M0(zwa zwaVar, long j, long j2) {
        long jC0 = nk7.C0(j);
        int i = h82.a[this.o.ordinal()];
        if (i == 1) {
            xy0 xy0Var = this.r;
            if (xy0Var == null) {
                xy0Var = (xy0) bo.K(this, yy0.a);
            }
            float f = zwaVar.b;
            return (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(xy0Var.a(f - ((int) (j2 & 4294967295L)), zwaVar.d - f, Float.intBitsToFloat((int) (jC0 & 4294967295L))))) & 4294967295L);
        }
        if (i != 2) {
            ygf.a();
            return 0L;
        }
        xy0 xy0Var2 = this.r;
        if (xy0Var2 == null) {
            xy0Var2 = (xy0) bo.K(this, yy0.a);
        }
        float f2 = zwaVar.a;
        return (((long) Float.floatToRawIntBits(xy0Var2.a(f2 - ((int) (j2 >> 32)), zwaVar.c - f2, Float.intBitsToFloat((int) (jC0 >> 32))))) << 32) | (((long) Float.floatToRawIntBits(0.0f)) & 4294967295L);
    }

    @Override // defpackage.fl7
    public final void p(long j) {
        int iQ;
        long jJ0 = J0();
        this.v = j;
        int i = h82.a[this.o.ordinal()];
        if (i == 1) {
            iQ = g76.Q((int) (j & 4294967295L), (int) (jJ0 & 4294967295L));
        } else {
            if (i != 2) {
                ygf.a();
                return;
            }
            iQ = g76.Q((int) (j >> 32), (int) (jJ0 >> 32));
        }
        if (iQ >= 0) {
            return;
        }
        long j2 = !this.q ? this.o == hw8.Vertical ? ((long) (((int) (jJ0 & 4294967295L)) - ((int) (j & 4294967295L)))) & 4294967295L : ((long) (((int) (jJ0 >> 32)) - ((int) (j >> 32)))) << 32 : 0L;
        zwa zwaVar = (zwa) this.s.invoke();
        if (zwaVar == null || this.w || this.u || !K0(this, zwaVar, jJ0, 0L, 2) || K0(this, zwaVar, 0L, j2, 1)) {
            return;
        }
        this.u = true;
        L0(j2);
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }
}
