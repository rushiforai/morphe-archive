package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bn0 extends jj5 {
    public int t0 = 0;
    public boolean u0 = true;
    public int v0 = 0;
    public boolean w0 = false;

    @Override // defpackage.b72
    public final boolean B() {
        return this.w0;
    }

    @Override // defpackage.b72
    public final boolean C() {
        return this.w0;
    }

    public final boolean X() {
        int i;
        int i2;
        int i3;
        boolean z = true;
        int i4 = 0;
        while (true) {
            i = this.s0;
            if (i4 >= i) {
                break;
            }
            b72 b72Var = this.r0[i4];
            if ((this.u0 || b72Var.d()) && ((((i2 = this.t0) == 0 || i2 == 1) && !b72Var.B()) || (((i3 = this.t0) == 2 || i3 == 3) && !b72Var.C()))) {
                z = false;
            }
            i4++;
        }
        if (!z || i <= 0) {
            return false;
        }
        int iMax = 0;
        boolean z2 = false;
        for (int i5 = 0; i5 < this.s0; i5++) {
            b72 b72Var2 = this.r0[i5];
            if (this.u0 || b72Var2.d()) {
                if (!z2) {
                    int i6 = this.t0;
                    if (i6 == 0) {
                        iMax = b72Var2.j(k52.LEFT).d();
                    } else if (i6 == 1) {
                        iMax = b72Var2.j(k52.RIGHT).d();
                    } else if (i6 == 2) {
                        iMax = b72Var2.j(k52.TOP).d();
                    } else if (i6 == 3) {
                        iMax = b72Var2.j(k52.BOTTOM).d();
                    }
                    z2 = true;
                }
                int i7 = this.t0;
                if (i7 == 0) {
                    iMax = Math.min(iMax, b72Var2.j(k52.LEFT).d());
                } else if (i7 == 1) {
                    iMax = Math.max(iMax, b72Var2.j(k52.RIGHT).d());
                } else if (i7 == 2) {
                    iMax = Math.min(iMax, b72Var2.j(k52.TOP).d());
                } else if (i7 == 3) {
                    iMax = Math.max(iMax, b72Var2.j(k52.BOTTOM).d());
                }
            }
        }
        int i8 = iMax + this.v0;
        int i9 = this.t0;
        if (i9 == 0 || i9 == 1) {
            L(i8, i8);
        } else {
            M(i8, i8);
        }
        this.w0 = true;
        return true;
    }

    public final int Y() {
        int i = this.t0;
        if (i == 0 || i == 1) {
            return 0;
        }
        return (i == 2 || i == 3) ? 1 : -1;
    }

    @Override // defpackage.b72
    public final void c(wz6 wz6Var, boolean z) {
        boolean z2;
        int i;
        int i2;
        l52[] l52VarArr = this.R;
        l52 l52Var = this.J;
        l52VarArr[0] = l52Var;
        int i3 = 2;
        l52 l52Var2 = this.K;
        l52VarArr[2] = l52Var2;
        l52 l52Var3 = this.L;
        l52VarArr[1] = l52Var3;
        l52 l52Var4 = this.M;
        l52VarArr[3] = l52Var4;
        for (l52 l52Var5 : l52VarArr) {
            l52Var5.i = wz6Var.k(l52Var5);
        }
        int i4 = this.t0;
        if (i4 < 0 || i4 >= 4) {
            return;
        }
        l52 l52Var6 = l52VarArr[i4];
        if (!this.w0) {
            X();
        }
        if (this.w0) {
            this.w0 = false;
            int i5 = this.t0;
            if (i5 == 0 || i5 == 1) {
                wz6Var.d(l52Var.i, this.a0);
                wz6Var.d(l52Var3.i, this.a0);
                return;
            } else {
                if (i5 == 2 || i5 == 3) {
                    wz6Var.d(l52Var2.i, this.b0);
                    wz6Var.d(l52Var4.i, this.b0);
                    return;
                }
                return;
            }
        }
        for (int i6 = 0; i6 < this.s0; i6++) {
            b72 b72Var = this.r0[i6];
            if ((this.u0 || b72Var.d()) && ((((i2 = this.t0) == 0 || i2 == 1) && b72Var.U[0] == a72.MATCH_CONSTRAINT && b72Var.J.f != null && b72Var.L.f != null) || ((i2 == 2 || i2 == 3) && b72Var.U[1] == a72.MATCH_CONSTRAINT && b72Var.K.f != null && b72Var.M.f != null))) {
                z2 = true;
                break;
            }
        }
        z2 = false;
        boolean z3 = l52Var.g() || l52Var3.g();
        boolean z4 = l52Var2.g() || l52Var4.g();
        int i7 = !(!z2 && (((i = this.t0) == 0 && z3) || ((i == 2 && z4) || ((i == 1 && z3) || (i == 3 && z4))))) ? 4 : 5;
        int i8 = 0;
        while (i8 < this.s0) {
            b72 b72Var2 = this.r0[i8];
            if (this.u0 || b72Var2.d()) {
                gkc gkcVarK = wz6Var.k(b72Var2.R[this.t0]);
                l52[] l52VarArr2 = b72Var2.R;
                int i9 = this.t0;
                l52 l52Var7 = l52VarArr2[i9];
                l52Var7.i = gkcVarK;
                l52 l52Var8 = l52Var7.f;
                int i10 = (l52Var8 == null || l52Var8.d != this) ? 0 : l52Var7.g;
                if (i9 == 0 || i9 == i3) {
                    gkc gkcVar = l52Var6.i;
                    int i11 = this.v0 - i10;
                    c80 c80VarL = wz6Var.l();
                    gkc gkcVarM = wz6Var.m();
                    gkcVarM.d = 0;
                    c80VarL.c(gkcVar, gkcVarK, gkcVarM, i11);
                    wz6Var.c(c80VarL);
                } else {
                    gkc gkcVar2 = l52Var6.i;
                    int i12 = this.v0 + i10;
                    c80 c80VarL2 = wz6Var.l();
                    gkc gkcVarM2 = wz6Var.m();
                    gkcVarM2.d = 0;
                    c80VarL2.b(gkcVar2, gkcVarK, gkcVarM2, i12);
                    wz6Var.c(c80VarL2);
                }
                wz6Var.e(l52Var6.i, gkcVarK, this.v0 + i10, i7);
            }
            i8++;
            i3 = 2;
        }
        int i13 = this.t0;
        if (i13 == 0) {
            wz6Var.e(l52Var3.i, l52Var.i, 0, 8);
            wz6Var.e(l52Var.i, this.V.L.i, 0, 4);
            wz6Var.e(l52Var.i, this.V.J.i, 0, 0);
            return;
        }
        if (i13 == 1) {
            wz6Var.e(l52Var.i, l52Var3.i, 0, 8);
            wz6Var.e(l52Var.i, this.V.J.i, 0, 4);
            wz6Var.e(l52Var.i, this.V.L.i, 0, 0);
        } else if (i13 == 2) {
            wz6Var.e(l52Var4.i, l52Var2.i, 0, 8);
            wz6Var.e(l52Var2.i, this.V.M.i, 0, 4);
            wz6Var.e(l52Var2.i, this.V.K.i, 0, 0);
        } else if (i13 == 3) {
            wz6Var.e(l52Var2.i, l52Var4.i, 0, 8);
            wz6Var.e(l52Var2.i, this.V.K.i, 0, 4);
            wz6Var.e(l52Var2.i, this.V.M.i, 0, 0);
        }
    }

    @Override // defpackage.b72
    public final boolean d() {
        return true;
    }

    @Override // defpackage.b72
    public final String toString() {
        String strV = ka1.v(new StringBuilder("[Barrier] "), this.j0, " {");
        for (int i = 0; i < this.s0; i++) {
            b72 b72Var = this.r0[i];
            if (i > 0) {
                strV = strV.concat(", ");
            }
            strV = strV + b72Var.j0;
        }
        return strV.concat("}");
    }
}
