package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ao4 {
    public int a;
    public l52 d;
    public l52 e;
    public l52 f;
    public l52 g;
    public int h;
    public int i;
    public int j;
    public int k;
    public int q;
    public final /* synthetic */ co4 r;
    public b72 b = null;
    public int c = 0;
    public int l = 0;
    public int m = 0;
    public int n = 0;
    public int o = 0;
    public int p = 0;

    public ao4(co4 co4Var, int i, l52 l52Var, l52 l52Var2, l52 l52Var3, l52 l52Var4, int i2) {
        this.r = co4Var;
        this.a = i;
        this.d = l52Var;
        this.e = l52Var2;
        this.f = l52Var3;
        this.g = l52Var4;
        this.h = co4Var.v0;
        this.i = co4Var.t0;
        this.j = co4Var.w0;
        this.k = co4Var.u0;
        this.q = i2;
    }

    public final void a(b72 b72Var) {
        int i = this.a;
        int i2 = this.q;
        co4 co4Var = this.r;
        if (i == 0) {
            int iA0 = co4Var.a0(b72Var, i2);
            if (b72Var.U[0] == a72.MATCH_CONSTRAINT) {
                this.p++;
                iA0 = 0;
            }
            this.l = iA0 + (b72Var.i0 != 8 ? co4Var.O0 : 0) + this.l;
            int iZ = co4Var.Z(b72Var, this.q);
            if (this.b == null || this.c < iZ) {
                this.b = b72Var;
                this.c = iZ;
                this.m = iZ;
            }
        } else {
            int iA02 = co4Var.a0(b72Var, i2);
            int iZ2 = co4Var.Z(b72Var, this.q);
            if (b72Var.U[1] == a72.MATCH_CONSTRAINT) {
                this.p++;
                iZ2 = 0;
            }
            this.m = iZ2 + (b72Var.i0 != 8 ? co4Var.P0 : 0) + this.m;
            if (this.b == null || this.c < iA02) {
                this.b = b72Var;
                this.c = iA02;
                this.l = iA02;
            }
        }
        this.o++;
    }

    /* JADX WARN: Removed duplicated region for block: B:89:0x0105 A[PHI: r5 r9
      0x0105: PHI (r5v25 int) = (r5v23 int), (r5v26 int) binds: [B:95:0x0115, B:88:0x0103] A[DONT_GENERATE, DONT_INLINE]
      0x0105: PHI (r9v24 float) = (r9v22 float), (r9v27 float) binds: [B:95:0x0115, B:88:0x0103] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b(int r23, boolean r24, boolean r25) {
        /*
            Method dump skipped, instruction units count: 724
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ao4.b(int, boolean, boolean):void");
    }

    public final int c() {
        int i = this.a;
        int i2 = this.m;
        return i == 1 ? i2 - this.r.P0 : i2;
    }

    public final int d() {
        int i = this.a;
        int i2 = this.l;
        return i == 0 ? i2 - this.r.O0 : i2;
    }

    public final void e(int i) {
        co4 co4Var;
        int i2;
        int i3 = this.p;
        if (i3 == 0) {
            return;
        }
        int i4 = this.o;
        int i5 = i / i3;
        int i6 = 0;
        while (true) {
            co4Var = this.r;
            if (i6 >= i4 || (i2 = this.n + i6) >= co4Var.a1) {
                break;
            }
            b72 b72Var = co4Var.Z0[i2];
            if (this.a == 0) {
                if (b72Var != null) {
                    a72[] a72VarArr = b72Var.U;
                    if (a72VarArr[0] == a72.MATCH_CONSTRAINT && b72Var.s == 0) {
                        co4Var.Y(b72Var, a72.FIXED, i5, a72VarArr[1], b72Var.l());
                    }
                }
            } else if (b72Var != null) {
                a72[] a72VarArr2 = b72Var.U;
                if (a72VarArr2[1] == a72.MATCH_CONSTRAINT && b72Var.t == 0) {
                    int i7 = i5;
                    co4Var.Y(b72Var, a72VarArr2[0], b72Var.r(), a72.FIXED, i7);
                    i5 = i7;
                }
            }
            i6++;
        }
        this.l = 0;
        this.m = 0;
        this.b = null;
        this.c = 0;
        int i8 = this.o;
        for (int i9 = 0; i9 < i8; i9++) {
            int i10 = this.n + i9;
            if (i10 >= co4Var.a1) {
                return;
            }
            b72 b72Var2 = co4Var.Z0[i10];
            if (this.a == 0) {
                int iR = b72Var2.r();
                int i11 = co4Var.O0;
                if (b72Var2.i0 == 8) {
                    i11 = 0;
                }
                this.l = iR + i11 + this.l;
                int iZ = co4Var.Z(b72Var2, this.q);
                if (this.b == null || this.c < iZ) {
                    this.b = b72Var2;
                    this.c = iZ;
                    this.m = iZ;
                }
            } else {
                int iA0 = co4Var.a0(b72Var2, this.q);
                int iZ2 = co4Var.Z(b72Var2, this.q);
                int i12 = co4Var.P0;
                if (b72Var2.i0 == 8) {
                    i12 = 0;
                }
                this.m = iZ2 + i12 + this.m;
                if (this.b == null || this.c < iA0) {
                    this.b = b72Var2;
                    this.c = iA0;
                    this.l = iA0;
                }
            }
        }
    }

    public final void f(int i, l52 l52Var, l52 l52Var2, l52 l52Var3, l52 l52Var4, int i2, int i3, int i4, int i5, int i6) {
        this.a = i;
        this.d = l52Var;
        this.e = l52Var2;
        this.f = l52Var3;
        this.g = l52Var4;
        this.h = i2;
        this.i = i3;
        this.j = i4;
        this.k = i5;
        this.q = i6;
    }
}
