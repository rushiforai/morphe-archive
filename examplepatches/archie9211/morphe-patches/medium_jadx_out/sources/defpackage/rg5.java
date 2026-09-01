package defpackage;

import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rg5 extends hj5 {
    public int A0;
    public eg5 n0;
    public int o0;
    public int p0;
    public int q0;
    public int r0;
    public int s0;
    public int t0;
    public float u0;
    public float v0;
    public String w0;
    public String x0;
    public String y0;
    public String z0;

    public rg5(qpc qpcVar, opc opcVar) {
        super(qpcVar, opcVar);
        this.o0 = 0;
        this.p0 = 0;
        this.q0 = 0;
        if (opcVar == opc.ROW) {
            this.s0 = 1;
        } else if (opcVar == opc.COLUMN) {
            this.t0 = 1;
        }
    }

    @Override // defpackage.hj5, defpackage.c62, defpackage.sya
    public final void apply() {
        s();
        eg5 eg5Var = this.n0;
        int i = this.r0;
        eg5Var.getClass();
        if ((i == 0 || i == 1) && eg5Var.P0 != i) {
            eg5Var.P0 = i;
        }
        int i2 = this.s0;
        if (i2 != 0) {
            eg5 eg5Var2 = this.n0;
            if (i2 > 50) {
                eg5Var2.getClass();
            } else if (eg5Var2.G0 != i2) {
                eg5Var2.G0 = i2;
                eg5Var2.j0();
                eg5Var2.f0();
            }
        }
        int i3 = this.t0;
        if (i3 != 0) {
            eg5 eg5Var3 = this.n0;
            if (i3 > 50) {
                eg5Var3.getClass();
            } else if (eg5Var3.I0 != i3) {
                eg5Var3.I0 = i3;
                eg5Var3.j0();
                eg5Var3.f0();
            }
        }
        float f = this.u0;
        if (f != 0.0f) {
            eg5 eg5Var4 = this.n0;
            if (f < 0.0f) {
                eg5Var4.getClass();
            } else if (eg5Var4.J0 != f) {
                eg5Var4.J0 = f;
            }
        }
        float f2 = this.v0;
        if (f2 != 0.0f) {
            eg5 eg5Var5 = this.n0;
            if (f2 < 0.0f) {
                eg5Var5.getClass();
            } else if (eg5Var5.K0 != f2) {
                eg5Var5.K0 = f2;
            }
        }
        String str = this.w0;
        if (str != null && !str.isEmpty()) {
            eg5 eg5Var6 = this.n0;
            String str2 = this.w0;
            String str3 = eg5Var6.L0;
            if (str3 == null || !str3.equals(str2)) {
                eg5Var6.L0 = str2;
            }
        }
        String str4 = this.x0;
        if (str4 != null && !str4.isEmpty()) {
            eg5 eg5Var7 = this.n0;
            String str5 = this.x0;
            String str6 = eg5Var7.M0;
            if (str6 == null || !str6.equals(str5)) {
                eg5Var7.M0 = str5;
            }
        }
        String str7 = this.y0;
        if (str7 != null && !str7.isEmpty()) {
            eg5 eg5Var8 = this.n0;
            String str8 = this.y0;
            String str9 = eg5Var8.N0;
            if (str9 == null || !str9.equals(str8.toString())) {
                eg5Var8.E0 = false;
                eg5Var8.N0 = str8.toString();
            }
        }
        String str10 = this.z0;
        if (str10 != null && !str10.isEmpty()) {
            eg5 eg5Var9 = this.n0;
            String str11 = this.z0;
            String str12 = eg5Var9.O0;
            if (str12 == null || !str12.equals(str11)) {
                eg5Var9.E0 = false;
                eg5Var9.O0 = str11;
            }
        }
        eg5 eg5Var10 = this.n0;
        eg5Var10.U0 = this.A0;
        int i4 = this.o0;
        eg5Var10.v0 = i4;
        eg5Var10.w0 = i4;
        eg5Var10.t0 = this.p0;
        eg5Var10.u0 = this.q0;
        r();
    }

    @Override // defpackage.hj5
    public final jj5 s() {
        int[][] iArrH0;
        int[][] iArrH02;
        boolean[][] zArr;
        eg5 eg5Var = this.n0;
        if (eg5Var == null) {
            eg5Var = new eg5();
            eg5Var.E0 = false;
            eg5Var.Q0 = 0;
            eg5Var.S0 = new HashSet();
            eg5Var.W0 = 0;
            eg5Var.j0();
            int[][] iArr = eg5Var.T0;
            boolean z = iArr != null && iArr.length == eg5Var.s0 && (zArr = eg5Var.R0) != null && zArr.length == eg5Var.F0 && zArr[0].length == eg5Var.H0;
            if (!z) {
                eg5Var.f0();
            }
            if (z) {
                for (int i = 0; i < eg5Var.R0.length; i++) {
                    int i2 = 0;
                    while (true) {
                        boolean[][] zArr2 = eg5Var.R0;
                        if (i2 < zArr2[0].length) {
                            zArr2[i][i2] = true;
                            i2++;
                        }
                    }
                }
                for (int i3 = 0; i3 < eg5Var.T0.length; i3++) {
                    int i4 = 0;
                    while (true) {
                        int[][] iArr2 = eg5Var.T0;
                        if (i4 < iArr2[0].length) {
                            iArr2[i3][i4] = -1;
                            i4++;
                        }
                    }
                }
            }
            eg5Var.Q0 = 0;
            String str = eg5Var.O0;
            if (str != null && !str.trim().isEmpty() && (iArrH02 = eg5Var.h0(eg5Var.O0, false)) != null) {
                eg5Var.d0(iArrH02);
            }
            String str2 = eg5Var.N0;
            if (str2 != null && !str2.trim().isEmpty() && (iArrH0 = eg5Var.h0(eg5Var.N0, true)) != null) {
                eg5Var.e0(iArrH0);
            }
            this.n0 = eg5Var;
        }
        return eg5Var;
    }
}
