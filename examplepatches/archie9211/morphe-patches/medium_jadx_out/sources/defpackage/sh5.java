package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sh5 extends b72 {
    public float r0 = -1.0f;
    public int s0 = -1;
    public int t0 = -1;
    public l52 u0 = this.K;
    public int v0 = 0;
    public boolean w0;

    public sh5() {
        this.S.clear();
        this.S.add(this.u0);
        int length = this.R.length;
        for (int i = 0; i < length; i++) {
            this.R[i] = this.u0;
        }
    }

    @Override // defpackage.b72
    public final boolean B() {
        return this.w0;
    }

    @Override // defpackage.b72
    public final boolean C() {
        return this.w0;
    }

    @Override // defpackage.b72
    public final void U(wz6 wz6Var, boolean z) {
        if (this.V == null) {
            return;
        }
        l52 l52Var = this.u0;
        wz6Var.getClass();
        int iN = wz6.n(l52Var);
        if (this.v0 == 1) {
            this.a0 = iN;
            this.b0 = 0;
            N(this.V.l());
            S(0);
            return;
        }
        this.a0 = 0;
        this.b0 = iN;
        S(this.V.r());
        N(0);
    }

    public final void V(int i) {
        this.u0.l(i);
        this.w0 = true;
    }

    public final void W(int i) {
        l52 l52Var;
        if (this.v0 == i) {
            return;
        }
        this.v0 = i;
        ArrayList arrayList = this.S;
        arrayList.clear();
        if (this.v0 == 1) {
            l52Var = this.J;
            this.u0 = l52Var;
        } else {
            l52Var = this.K;
            this.u0 = l52Var;
        }
        arrayList.add(l52Var);
        l52[] l52VarArr = this.R;
        int length = l52VarArr.length;
        for (int i2 = 0; i2 < length; i2++) {
            l52VarArr[i2] = this.u0;
        }
    }

    @Override // defpackage.b72
    public final void c(wz6 wz6Var, boolean z) {
        c72 c72Var = this.V;
        if (c72Var == null) {
            return;
        }
        Object objJ = c72Var.j(k52.LEFT);
        Object objJ2 = c72Var.j(k52.RIGHT);
        c72 c72Var2 = this.V;
        boolean z2 = c72Var2 != null && c72Var2.U[0] == a72.WRAP_CONTENT;
        if (this.v0 == 0) {
            objJ = c72Var.j(k52.TOP);
            objJ2 = c72Var.j(k52.BOTTOM);
            c72 c72Var3 = this.V;
            z2 = c72Var3 != null && c72Var3.U[1] == a72.WRAP_CONTENT;
        }
        if (this.w0) {
            l52 l52Var = this.u0;
            if (l52Var.c) {
                gkc gkcVarK = wz6Var.k(l52Var);
                wz6Var.d(gkcVarK, this.u0.d());
                if (this.s0 != -1) {
                    if (z2) {
                        wz6Var.f(wz6Var.k(objJ2), gkcVarK, 0, 5);
                    }
                } else if (this.t0 != -1 && z2) {
                    gkc gkcVarK2 = wz6Var.k(objJ2);
                    wz6Var.f(gkcVarK, wz6Var.k(objJ), 0, 5);
                    wz6Var.f(gkcVarK2, gkcVarK, 0, 5);
                }
                this.w0 = false;
                return;
            }
        }
        if (this.s0 != -1) {
            gkc gkcVarK3 = wz6Var.k(this.u0);
            wz6Var.e(gkcVarK3, wz6Var.k(objJ), this.s0, 8);
            if (z2) {
                wz6Var.f(wz6Var.k(objJ2), gkcVarK3, 0, 5);
                return;
            }
            return;
        }
        if (this.t0 != -1) {
            gkc gkcVarK4 = wz6Var.k(this.u0);
            gkc gkcVarK5 = wz6Var.k(objJ2);
            wz6Var.e(gkcVarK4, gkcVarK5, -this.t0, 8);
            if (z2) {
                wz6Var.f(gkcVarK4, wz6Var.k(objJ), 0, 5);
                wz6Var.f(gkcVarK5, gkcVarK4, 0, 5);
                return;
            }
            return;
        }
        if (this.r0 != -1.0f) {
            gkc gkcVarK6 = wz6Var.k(this.u0);
            gkc gkcVarK7 = wz6Var.k(objJ2);
            float f = this.r0;
            c80 c80VarL = wz6Var.l();
            c80VarL.d.g(gkcVarK6, -1.0f);
            c80VarL.d.g(gkcVarK7, f);
            wz6Var.c(c80VarL);
        }
    }

    @Override // defpackage.b72
    public final boolean d() {
        return true;
    }

    @Override // defpackage.b72
    public final l52 j(k52 k52Var) {
        int i = qh5.a[k52Var.ordinal()];
        if (i == 1 || i == 2) {
            if (this.v0 == 1) {
                return this.u0;
            }
            return null;
        }
        if ((i == 3 || i == 4) && this.v0 == 0) {
            return this.u0;
        }
        return null;
    }
}
