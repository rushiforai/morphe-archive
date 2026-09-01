package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class co4 extends dwe {
    public int C0;
    public int D0;
    public int E0;
    public int F0;
    public int G0;
    public int H0;
    public float I0;
    public float J0;
    public float K0;
    public float L0;
    public float M0;
    public float N0;
    public int O0;
    public int P0;
    public int Q0;
    public int R0;
    public int S0;
    public int T0;
    public int U0;
    public ArrayList V0;
    public b72[] W0;
    public b72[] X0;
    public int[] Y0;
    public b72[] Z0;
    public int a1;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:74:0x010d  */
    @Override // defpackage.dwe
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void X(int r38, int r39, int r40, int r41) {
        /*
            Method dump skipped, instruction units count: 1778
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.co4.X(int, int, int, int):void");
    }

    public final int Z(b72 b72Var, int i) {
        b72 b72Var2;
        if (b72Var == null) {
            return 0;
        }
        a72[] a72VarArr = b72Var.U;
        if (a72VarArr[1] == a72.MATCH_CONSTRAINT) {
            int i2 = b72Var.t;
            if (i2 == 0) {
                return 0;
            }
            if (i2 == 2) {
                int i3 = (int) (b72Var.A * i);
                if (i3 != b72Var.l()) {
                    b72Var.g = true;
                    Y(b72Var, a72VarArr[0], b72Var.r(), a72.FIXED, i3);
                }
                return i3;
            }
            b72Var2 = b72Var;
            if (i2 == 1) {
                return b72Var2.l();
            }
            if (i2 == 3) {
                return (int) ((b72Var2.r() * b72Var2.Y) + 0.5f);
            }
        } else {
            b72Var2 = b72Var;
        }
        return b72Var2.l();
    }

    public final int a0(b72 b72Var, int i) {
        b72 b72Var2;
        if (b72Var == null) {
            return 0;
        }
        a72[] a72VarArr = b72Var.U;
        if (a72VarArr[0] == a72.MATCH_CONSTRAINT) {
            int i2 = b72Var.s;
            if (i2 == 0) {
                return 0;
            }
            if (i2 == 2) {
                int i3 = (int) (b72Var.x * i);
                if (i3 != b72Var.r()) {
                    b72Var.g = true;
                    Y(b72Var, a72.FIXED, i3, a72VarArr[1], b72Var.l());
                }
                return i3;
            }
            b72Var2 = b72Var;
            if (i2 == 1) {
                return b72Var2.r();
            }
            if (i2 == 3) {
                return (int) ((b72Var2.l() * b72Var2.Y) + 0.5f);
            }
        } else {
            b72Var2 = b72Var;
        }
        return b72Var2.r();
    }

    @Override // defpackage.b72
    public final void c(wz6 wz6Var, boolean z) {
        b72 b72Var;
        float f;
        int i;
        ArrayList arrayList = this.V0;
        super.c(wz6Var, z);
        c72 c72Var = this.V;
        boolean z2 = c72Var != null && c72Var.w0;
        int i2 = this.S0;
        if (i2 != 0) {
            if (i2 == 1) {
                int size = arrayList.size();
                int i3 = 0;
                while (i3 < size) {
                    ((ao4) arrayList.get(i3)).b(i3, z2, i3 == size + (-1));
                    i3++;
                }
            } else if (i2 != 2) {
                if (i2 == 3) {
                    int size2 = arrayList.size();
                    int i4 = 0;
                    while (i4 < size2) {
                        ((ao4) arrayList.get(i4)).b(i4, z2, i4 == size2 + (-1));
                        i4++;
                    }
                }
            } else if (this.Y0 != null && this.X0 != null && this.W0 != null) {
                for (int i5 = 0; i5 < this.a1; i5++) {
                    this.Z0[i5].E();
                }
                int[] iArr = this.Y0;
                int i6 = iArr[0];
                int i7 = iArr[1];
                float f2 = this.I0;
                b72 b72Var2 = null;
                int i8 = 0;
                while (i8 < i6) {
                    if (z2) {
                        i = (i6 - i8) - 1;
                        f = 1.0f - this.I0;
                    } else {
                        f = f2;
                        i = i8;
                    }
                    b72 b72Var3 = this.X0[i];
                    if (b72Var3 != null) {
                        l52 l52Var = b72Var3.J;
                        if (b72Var3.i0 != 8) {
                            if (i8 == 0) {
                                b72Var3.g(l52Var, this.J, this.v0);
                                b72Var3.k0 = this.C0;
                                b72Var3.f0 = f;
                            }
                            if (i8 == i6 - 1) {
                                b72Var3.g(b72Var3.L, this.L, this.w0);
                            }
                            if (i8 > 0 && b72Var2 != null) {
                                l52 l52Var2 = b72Var2.L;
                                b72Var3.g(l52Var, l52Var2, this.O0);
                                b72Var2.g(l52Var2, l52Var, 0);
                            }
                            b72Var2 = b72Var3;
                        }
                    }
                    i8++;
                    f2 = f;
                }
                for (int i9 = 0; i9 < i7; i9++) {
                    b72 b72Var4 = this.W0[i9];
                    if (b72Var4 != null) {
                        l52 l52Var3 = b72Var4.K;
                        if (b72Var4.i0 != 8) {
                            if (i9 == 0) {
                                b72Var4.g(l52Var3, this.K, this.t0);
                                b72Var4.l0 = this.D0;
                                b72Var4.g0 = this.J0;
                            }
                            if (i9 == i7 - 1) {
                                b72Var4.g(b72Var4.M, this.M, this.u0);
                            }
                            if (i9 > 0 && b72Var2 != null) {
                                l52 l52Var4 = b72Var2.M;
                                b72Var4.g(l52Var3, l52Var4, this.P0);
                                b72Var2.g(l52Var4, l52Var3, 0);
                            }
                            b72Var2 = b72Var4;
                        }
                    }
                }
                for (int i10 = 0; i10 < i6; i10++) {
                    for (int i11 = 0; i11 < i7; i11++) {
                        int i12 = (i11 * i6) + i10;
                        if (this.U0 == 1) {
                            i12 = (i10 * i7) + i11;
                        }
                        b72[] b72VarArr = this.Z0;
                        if (i12 < b72VarArr.length && (b72Var = b72VarArr[i12]) != null && b72Var.i0 != 8) {
                            b72 b72Var5 = this.X0[i10];
                            b72 b72Var6 = this.W0[i11];
                            if (b72Var != b72Var5) {
                                b72Var.g(b72Var.J, b72Var5.J, 0);
                                b72Var.g(b72Var.L, b72Var5.L, 0);
                            }
                            if (b72Var != b72Var6) {
                                b72Var.g(b72Var.K, b72Var6.K, 0);
                                b72Var.g(b72Var.M, b72Var6.M, 0);
                            }
                        }
                    }
                }
            }
        } else if (arrayList.size() > 0) {
            ((ao4) arrayList.get(0)).b(0, z2, true);
        }
        this.x0 = false;
    }
}
