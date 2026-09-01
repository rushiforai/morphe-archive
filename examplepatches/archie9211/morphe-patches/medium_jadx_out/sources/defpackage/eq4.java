package defpackage;

import java.util.ArrayList;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eq4 extends hj5 {
    public int A0;
    public int B0;
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
    public co4 n0;
    public HashMap o0;
    public HashMap p0;
    public HashMap q0;
    public int r0;
    public int s0;
    public int t0;
    public int u0;
    public int v0;
    public int w0;
    public int x0;
    public int y0;
    public int z0;

    public eq4(qpc qpcVar, opc opcVar) {
        super(qpcVar, opcVar);
        this.r0 = 0;
        this.s0 = -1;
        this.t0 = -1;
        this.u0 = -1;
        this.v0 = -1;
        this.w0 = -1;
        this.x0 = -1;
        this.y0 = 2;
        this.z0 = 2;
        this.A0 = 0;
        this.B0 = 0;
        this.C0 = 0;
        this.D0 = 0;
        this.E0 = 0;
        this.F0 = 0;
        this.G0 = -1;
        this.H0 = 0;
        this.I0 = 0.5f;
        this.J0 = 0.5f;
        this.K0 = 0.5f;
        this.L0 = 0.5f;
        if (opcVar == opc.VERTICAL_FLOW) {
            this.H0 = 1;
        }
    }

    @Override // defpackage.hj5, defpackage.c62, defpackage.sya
    public final void apply() {
        s();
        a(this.n0);
        co4 co4Var = this.n0;
        co4Var.U0 = this.H0;
        co4Var.S0 = this.r0;
        int i = this.G0;
        if (i != -1) {
            co4Var.T0 = i;
        }
        int i2 = this.C0;
        if (i2 != 0) {
            co4Var.v0 = i2;
        }
        int i3 = this.E0;
        if (i3 != 0) {
            co4Var.t0 = i3;
        }
        int i4 = this.D0;
        if (i4 != 0) {
            co4Var.w0 = i4;
        }
        int i5 = this.F0;
        if (i5 != 0) {
            co4Var.u0 = i5;
        }
        int i6 = this.B0;
        if (i6 != 0) {
            co4Var.O0 = i6;
        }
        int i7 = this.A0;
        if (i7 != 0) {
            co4Var.P0 = i7;
        }
        float f = this.h;
        if (f != 0.5f) {
            co4Var.I0 = f;
        }
        float f2 = this.K0;
        if (f2 != 0.5f) {
            co4Var.K0 = f2;
        }
        float f3 = this.L0;
        if (f3 != 0.5f) {
            co4Var.M0 = f3;
        }
        float f4 = this.i;
        if (f4 != 0.5f) {
            co4Var.J0 = f4;
        }
        float f5 = this.I0;
        if (f5 != 0.5f) {
            co4Var.L0 = f5;
        }
        float f6 = this.J0;
        if (f6 != 0.5f) {
            co4Var.N0 = f6;
        }
        int i8 = this.z0;
        if (i8 != 2) {
            co4Var.Q0 = i8;
        }
        int i9 = this.y0;
        if (i9 != 2) {
            co4Var.R0 = i9;
        }
        int i10 = this.s0;
        if (i10 != -1) {
            co4Var.D0 = i10;
        }
        int i11 = this.t0;
        if (i11 != -1) {
            co4Var.F0 = i11;
        }
        int i12 = this.u0;
        if (i12 != -1) {
            co4Var.H0 = i12;
        }
        int i13 = this.v0;
        if (i13 != -1) {
            co4Var.C0 = i13;
        }
        int i14 = this.w0;
        if (i14 != -1) {
            co4Var.E0 = i14;
        }
        int i15 = this.x0;
        if (i15 != -1) {
            co4Var.G0 = i15;
        }
        r();
    }

    @Override // defpackage.hj5
    public final jj5 s() {
        co4 co4Var = this.n0;
        if (co4Var != null) {
            return co4Var;
        }
        co4 co4Var2 = new co4();
        co4Var2.C0 = -1;
        co4Var2.D0 = -1;
        co4Var2.E0 = -1;
        co4Var2.F0 = -1;
        co4Var2.G0 = -1;
        co4Var2.H0 = -1;
        co4Var2.I0 = 0.5f;
        co4Var2.J0 = 0.5f;
        co4Var2.K0 = 0.5f;
        co4Var2.L0 = 0.5f;
        co4Var2.M0 = 0.5f;
        co4Var2.N0 = 0.5f;
        co4Var2.O0 = 0;
        co4Var2.P0 = 0;
        co4Var2.Q0 = 2;
        co4Var2.R0 = 2;
        co4Var2.S0 = 0;
        co4Var2.T0 = -1;
        co4Var2.U0 = 0;
        co4Var2.V0 = new ArrayList();
        co4Var2.W0 = null;
        co4Var2.X0 = null;
        co4Var2.Y0 = null;
        co4Var2.a1 = 0;
        this.n0 = co4Var2;
        return co4Var2;
    }
}
