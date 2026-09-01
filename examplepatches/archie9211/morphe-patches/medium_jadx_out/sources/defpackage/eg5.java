package defpackage;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eg5 extends dwe {
    public c72 C0;
    public b72[] D0;
    public boolean E0;
    public int F0;
    public int G0;
    public int H0;
    public int I0;
    public float J0;
    public float K0;
    public String L0;
    public String M0;
    public String N0;
    public String O0;
    public int P0;
    public int Q0;
    public boolean[][] R0;
    public HashSet S0;
    public int[][] T0;
    public int U0;
    public int[][] V0;
    public int W0;

    public static void Z(b72 b72Var) {
        b72Var.m0[1] = -1.0f;
        b72Var.K.j();
        b72Var.M.j();
        b72Var.N.j();
    }

    public static float[] i0(int i, String str) {
        if (str == null || str.trim().isEmpty()) {
            return null;
        }
        String[] strArrSplit = str.split(",");
        float[] fArr = new float[i];
        for (int i2 = 0; i2 < i; i2++) {
            if (i2 < strArrSplit.length) {
                try {
                    fArr[i2] = Float.parseFloat(strArrSplit[i2]);
                } catch (Exception e) {
                    System.err.println("Error parsing `" + strArrSplit[i2] + "`: " + e.getMessage());
                    fArr[i2] = 1.0f;
                }
            } else {
                fArr[i2] = 1.0f;
            }
        }
        return fArr;
    }

    @Override // defpackage.dwe
    public final void X(int i, int i2, int i3, int i4) {
        int[][] iArrH0;
        this.C0 = this.V;
        if (this.F0 >= 1 && this.H0 >= 1) {
            this.Q0 = 0;
            String str = this.O0;
            if (str != null && !str.trim().isEmpty() && (iArrH0 = h0(this.O0, false)) != null) {
                d0(iArrH0);
            }
            String str2 = this.N0;
            if (str2 != null && !str2.trim().isEmpty()) {
                this.V0 = h0(this.N0, true);
            }
            int iMax = Math.max(this.F0, this.H0);
            b72[] b72VarArr = this.D0;
            if (b72VarArr == null) {
                this.D0 = new b72[iMax];
                int i5 = 0;
                while (true) {
                    b72[] b72VarArr2 = this.D0;
                    if (i5 >= b72VarArr2.length) {
                        break;
                    }
                    b72 b72Var = new b72();
                    a72 a72Var = a72.MATCH_CONSTRAINT;
                    a72[] a72VarArr = b72Var.U;
                    a72VarArr[0] = a72Var;
                    a72VarArr[1] = a72Var;
                    b72Var.k = String.valueOf(b72Var.hashCode());
                    b72VarArr2[i5] = b72Var;
                    i5++;
                }
            } else if (iMax != b72VarArr.length) {
                b72[] b72VarArr3 = new b72[iMax];
                for (int i6 = 0; i6 < iMax; i6++) {
                    b72[] b72VarArr4 = this.D0;
                    if (i6 < b72VarArr4.length) {
                        b72VarArr3[i6] = b72VarArr4[i6];
                    } else {
                        b72 b72Var2 = new b72();
                        a72 a72Var2 = a72.MATCH_CONSTRAINT;
                        a72[] a72VarArr2 = b72Var2.U;
                        a72VarArr2[0] = a72Var2;
                        a72VarArr2[1] = a72Var2;
                        b72Var2.k = String.valueOf(b72Var2.hashCode());
                        b72VarArr3[i6] = b72Var2;
                    }
                }
                while (true) {
                    b72[] b72VarArr5 = this.D0;
                    if (iMax >= b72VarArr5.length) {
                        break;
                    }
                    b72 b72Var3 = b72VarArr5[iMax];
                    this.C0.r0.remove(b72Var3);
                    b72Var3.D();
                    iMax++;
                }
                this.D0 = b72VarArr3;
            }
            int[][] iArr = this.V0;
            if (iArr != null) {
                e0(iArr);
            }
        }
        c72 c72Var = this.C0;
        b72[] b72VarArr6 = this.D0;
        c72Var.getClass();
        for (b72 b72Var4 : b72VarArr6) {
            c72Var.V(b72Var4);
        }
    }

    public final void a0(b72 b72Var, int i, int i2, int i3, int i4) {
        b72Var.J.a(this.D0[i2].J, 0);
        b72Var.K.a(this.D0[i].K, 0);
        b72Var.L.a(this.D0[(i2 + i4) - 1].L, 0);
        b72Var.M.a(this.D0[(i + i3) - 1].M, 0);
    }

    public final int b0(int i) {
        return this.P0 == 1 ? i / this.F0 : i % this.H0;
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x013d  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x01b4  */
    @Override // defpackage.b72
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c(defpackage.wz6 r13, boolean r14) {
        /*
            Method dump skipped, instruction units count: 452
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.eg5.c(wz6, boolean):void");
    }

    public final int c0(int i) {
        return this.P0 == 1 ? i % this.F0 : i / this.H0;
    }

    public final void d0(int[][] iArr) {
        for (int[] iArr2 : iArr) {
            if (!g0(c0(iArr2[0]), b0(iArr2[0]), iArr2[1], iArr2[2])) {
                return;
            }
        }
    }

    public final void e0(int[][] iArr) {
        if ((this.U0 & 2) > 0) {
            return;
        }
        int i = 0;
        while (i < iArr.length) {
            int iC0 = this.c0(iArr[i][0]);
            int iB0 = this.b0(iArr[i][0]);
            int[] iArr2 = iArr[i];
            if (!this.g0(iC0, iB0, iArr2[1], iArr2[2])) {
                return;
            }
            b72 b72Var = this.r0[i];
            int[] iArr3 = iArr[i];
            eg5 eg5Var = this;
            eg5Var.a0(b72Var, iC0, iB0, iArr3[1], iArr3[2]);
            eg5Var.S0.add(eg5Var.r0[i].k);
            i++;
            this = eg5Var;
        }
    }

    public final void f0() {
        boolean[][] zArr = (boolean[][]) Array.newInstance((Class<?>) Boolean.TYPE, this.F0, this.H0);
        this.R0 = zArr;
        for (boolean[] zArr2 : zArr) {
            Arrays.fill(zArr2, true);
        }
        int i = this.s0;
        if (i > 0) {
            int[][] iArr = (int[][]) Array.newInstance((Class<?>) Integer.TYPE, i, 4);
            this.T0 = iArr;
            for (int[] iArr2 : iArr) {
                Arrays.fill(iArr2, -1);
            }
        }
    }

    public final boolean g0(int i, int i2, int i3, int i4) {
        for (int i5 = i; i5 < i + i3; i5++) {
            for (int i6 = i2; i6 < i2 + i4; i6++) {
                boolean[][] zArr = this.R0;
                if (i5 < zArr.length && i6 < zArr[0].length) {
                    boolean[] zArr2 = zArr[i5];
                    if (zArr2[i6]) {
                        zArr2[i6] = false;
                    }
                }
                return false;
            }
        }
        return true;
    }

    public final int[][] h0(String str, boolean z) {
        int i;
        int i2;
        try {
            String[] strArrSplit = str.split(",");
            Arrays.sort(strArrSplit, new g(9));
            int[][] iArr = (int[][]) Array.newInstance((Class<?>) Integer.TYPE, strArrSplit.length, 3);
            if (this.F0 != 1 && this.H0 != 1) {
                for (int i3 = 0; i3 < strArrSplit.length; i3++) {
                    String[] strArrSplit2 = strArrSplit[i3].trim().split(":");
                    String[] strArrSplit3 = strArrSplit2[1].split("x");
                    iArr[i3][0] = Integer.parseInt(strArrSplit2[0]);
                    if ((this.U0 & 1) > 0) {
                        iArr[i3][1] = Integer.parseInt(strArrSplit3[1]);
                        iArr[i3][2] = Integer.parseInt(strArrSplit3[0]);
                    } else {
                        iArr[i3][1] = Integer.parseInt(strArrSplit3[0]);
                        iArr[i3][2] = Integer.parseInt(strArrSplit3[1]);
                    }
                }
                return iArr;
            }
            int i4 = 0;
            int i5 = 0;
            for (int i6 = 0; i6 < strArrSplit.length; i6++) {
                String[] strArrSplit4 = strArrSplit[i6].trim().split(":");
                iArr[i6][0] = Integer.parseInt(strArrSplit4[0]);
                int[] iArr2 = iArr[i6];
                iArr2[1] = 1;
                iArr2[2] = 1;
                if (this.H0 == 1) {
                    iArr2[1] = Integer.parseInt(strArrSplit4[1]);
                    i4 += iArr[i6][1];
                    if (z) {
                        i4--;
                    }
                }
                if (this.F0 == 1) {
                    iArr[i6][2] = Integer.parseInt(strArrSplit4[1]);
                    i5 += iArr[i6][2];
                    if (z) {
                        i5--;
                    }
                }
            }
            if (i4 != 0 && !this.E0 && (i2 = this.F0 + i4) <= 50 && this.G0 != i2) {
                this.G0 = i2;
                j0();
                f0();
            }
            if (i5 != 0 && !this.E0 && (i = this.H0 + i5) <= 50 && this.I0 != i) {
                this.I0 = i;
                j0();
                f0();
            }
            this.E0 = true;
            return iArr;
        } catch (Exception unused) {
            return null;
        }
    }

    public final void j0() {
        int i;
        int i2 = this.G0;
        if (i2 != 0 && (i = this.I0) != 0) {
            this.F0 = i2;
            this.H0 = i;
            return;
        }
        int i3 = this.I0;
        if (i3 > 0) {
            this.H0 = i3;
            this.F0 = ((this.s0 + i3) - 1) / i3;
        } else if (i2 > 0) {
            this.F0 = i2;
            this.H0 = ((this.s0 + i2) - 1) / i2;
        } else {
            int iSqrt = (int) (Math.sqrt(this.s0) + 1.5d);
            this.F0 = iSqrt;
            this.H0 = ((this.s0 + iSqrt) - 1) / iSqrt;
        }
    }
}
