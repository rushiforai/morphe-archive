package defpackage;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class c62 implements sya {
    public Object a;
    public final qpc b;
    public float b0;
    public float c0;
    public we3 e0;
    public we3 f0;
    public tk7 g0;
    public b72 h0;
    public final HashMap i0;
    public final HashMap j0;
    public u84 c = null;
    public int d = 0;
    public int e = 0;
    public float f = -1.0f;
    public float g = -1.0f;
    public float h = 0.5f;
    public float i = 0.5f;
    public int j = 0;
    public int k = 0;
    public int l = 0;
    public int m = 0;
    public int n = 0;
    public int o = 0;
    public int p = 0;
    public int q = 0;
    public int r = 0;
    public int s = 0;
    public int t = 0;
    public int u = 0;
    public int v = 0;
    public int w = 0;
    public float x = Float.NaN;
    public float y = Float.NaN;
    public float z = Float.NaN;
    public float A = Float.NaN;
    public float B = Float.NaN;
    public float C = Float.NaN;
    public float D = Float.NaN;
    public float E = Float.NaN;
    public float F = Float.NaN;
    public float G = Float.NaN;
    public float H = Float.NaN;
    public int I = 0;
    public Object J = null;
    public Object K = null;
    public Object L = null;
    public Object M = null;
    public Object N = null;
    public Object O = null;
    public Object P = null;
    public Object Q = null;
    public Object R = null;
    public Object S = null;
    public c62 T = null;
    public Object U = null;
    public Object V = null;
    public c62 W = null;
    public Object X = null;
    public Object Y = null;
    public Object Z = null;
    public Object a0 = null;
    public mpc d0 = null;

    public c62(qpc qpcVar) {
        String str = we3.h;
        we3 we3Var = new we3(str);
        String str2 = we3.i;
        we3Var.f = str2;
        this.e0 = we3Var;
        we3 we3Var2 = new we3(str);
        we3Var2.f = str2;
        this.f0 = we3Var2;
        this.i0 = new HashMap();
        this.j0 = new HashMap();
        this.b = qpcVar;
    }

    @Override // defpackage.sya
    public final void a(b72 b72Var) {
        if (b72Var == null) {
            return;
        }
        this.h0 = b72Var;
        b72Var.h0 = this.g0;
    }

    @Override // defpackage.sya
    public void apply() {
        if (this.h0 == null) {
            return;
        }
        u84 u84Var = this.c;
        if (u84Var != null) {
            u84Var.apply();
        }
        this.e0.a(this.h0, 0);
        this.f0.a(this.h0, 1);
        this.J = j(this.J);
        this.K = j(this.K);
        this.L = j(this.L);
        this.M = j(this.M);
        this.N = j(this.N);
        this.O = j(this.O);
        this.P = j(this.P);
        this.Q = j(this.Q);
        this.R = j(this.R);
        this.S = j(this.S);
        this.U = j(this.U);
        this.V = j(this.V);
        this.X = j(this.X);
        this.Y = j(this.Y);
        this.Z = j(this.Z);
        d(this.h0, this.J, mpc.LEFT_TO_LEFT);
        d(this.h0, this.K, mpc.LEFT_TO_RIGHT);
        d(this.h0, this.L, mpc.RIGHT_TO_LEFT);
        d(this.h0, this.M, mpc.RIGHT_TO_RIGHT);
        d(this.h0, this.N, mpc.START_TO_START);
        d(this.h0, this.O, mpc.START_TO_END);
        d(this.h0, this.P, mpc.END_TO_START);
        d(this.h0, this.Q, mpc.END_TO_END);
        d(this.h0, this.R, mpc.TOP_TO_TOP);
        d(this.h0, this.S, mpc.TOP_TO_BOTTOM);
        d(this.h0, this.T, mpc.TOP_TO_BASELINE);
        d(this.h0, this.U, mpc.BOTTOM_TO_TOP);
        d(this.h0, this.V, mpc.BOTTOM_TO_BOTTOM);
        d(this.h0, this.W, mpc.BOTTOM_TO_BASELINE);
        d(this.h0, this.X, mpc.BASELINE_TO_BASELINE);
        d(this.h0, this.Y, mpc.BASELINE_TO_TOP);
        d(this.h0, this.Z, mpc.BASELINE_TO_BOTTOM);
        d(this.h0, this.a0, mpc.CIRCULAR_CONSTRAINT);
        int i = this.d;
        if (i != 0) {
            this.h0.k0 = i;
        }
        int i2 = this.e;
        if (i2 != 0) {
            this.h0.l0 = i2;
        }
        float f = this.f;
        if (f != -1.0f) {
            this.h0.m0[0] = f;
        }
        float f2 = this.g;
        if (f2 != -1.0f) {
            this.h0.m0[1] = f2;
        }
        b72 b72Var = this.h0;
        b72Var.f0 = this.h;
        b72Var.g0 = this.i;
        i3f i3fVar = b72Var.j;
        i3fVar.f = this.x;
        i3fVar.g = this.y;
        i3fVar.h = this.z;
        i3fVar.i = this.A;
        i3fVar.j = this.B;
        i3fVar.k = this.C;
        i3fVar.l = this.D;
        i3fVar.m = this.E;
        i3fVar.n = this.G;
        i3fVar.o = this.H;
        i3fVar.p = this.F;
        int i3 = this.I;
        i3fVar.q = i3;
        b72Var.i0 = i3;
        HashMap map = this.i0;
        for (String str : map.keySet()) {
            Integer num = (Integer) map.get(str);
            i3f i3fVar2 = this.h0.j;
            int iIntValue = num.intValue();
            HashMap map2 = i3fVar2.r;
            if (map2.containsKey(str)) {
                ((jm2) map2.get(str)).c = iIntValue;
            } else {
                jm2 jm2Var = new jm2();
                jm2Var.d = Float.NaN;
                jm2Var.a = str;
                jm2Var.b = 902;
                jm2Var.c = iIntValue;
                map2.put(str, jm2Var);
            }
        }
        HashMap map3 = this.j0;
        for (String str2 : map3.keySet()) {
            float fFloatValue = ((Float) map3.get(str2)).floatValue();
            HashMap map4 = this.h0.j.r;
            if (map4.containsKey(str2)) {
                ((jm2) map4.get(str2)).d = fFloatValue;
            } else {
                jm2 jm2Var2 = new jm2();
                jm2Var2.c = Integer.MIN_VALUE;
                jm2Var2.a = str2;
                jm2Var2.b = 901;
                jm2Var2.d = fFloatValue;
                map4.put(str2, jm2Var2);
            }
        }
    }

    @Override // defpackage.sya
    public b72 b() {
        b72 b72Var = this.h0;
        if (b72Var != null) {
            return b72Var;
        }
        b72 b72Var2 = new b72(this.e0.d, this.f0.d);
        this.h0 = b72Var2;
        b72Var2.h0 = this.g0;
        return b72Var2;
    }

    @Override // defpackage.sya
    public final u84 c() {
        return this.c;
    }

    public final void d(b72 b72Var, Object obj, mpc mpcVar) {
        b72 b72VarB = obj instanceof sya ? ((sya) obj).b() : null;
        if (b72VarB == null) {
            return;
        }
        int[] iArr = b62.a;
        int i = iArr[mpcVar.ordinal()];
        switch (iArr[mpcVar.ordinal()]) {
            case 1:
                k52 k52Var = k52.LEFT;
                b72Var.j(k52Var).b(b72VarB.j(k52Var), this.j, this.p, false);
                break;
            case 2:
                b72Var.j(k52.LEFT).b(b72VarB.j(k52.RIGHT), this.j, this.p, false);
                break;
            case 3:
                b72Var.j(k52.RIGHT).b(b72VarB.j(k52.LEFT), this.k, this.q, false);
                break;
            case 4:
                k52 k52Var2 = k52.RIGHT;
                b72Var.j(k52Var2).b(b72VarB.j(k52Var2), this.k, this.q, false);
                break;
            case 5:
                k52 k52Var3 = k52.LEFT;
                b72Var.j(k52Var3).b(b72VarB.j(k52Var3), this.l, this.r, false);
                break;
            case 6:
                b72Var.j(k52.LEFT).b(b72VarB.j(k52.RIGHT), this.l, this.r, false);
                break;
            case 7:
                b72Var.j(k52.RIGHT).b(b72VarB.j(k52.LEFT), this.m, this.s, false);
                break;
            case 8:
                k52 k52Var4 = k52.RIGHT;
                b72Var.j(k52Var4).b(b72VarB.j(k52Var4), this.m, this.s, false);
                break;
            case 9:
                k52 k52Var5 = k52.TOP;
                b72Var.j(k52Var5).b(b72VarB.j(k52Var5), this.n, this.t, false);
                break;
            case 10:
                b72Var.j(k52.TOP).b(b72VarB.j(k52.BOTTOM), this.n, this.t, false);
                break;
            case 11:
                b72Var.w(k52.TOP, b72VarB, k52.BASELINE, this.n, this.t);
                break;
            case 12:
                b72Var.j(k52.BOTTOM).b(b72VarB.j(k52.TOP), this.o, this.u, false);
                break;
            case 13:
                k52 k52Var6 = k52.BOTTOM;
                b72Var.j(k52Var6).b(b72VarB.j(k52Var6), this.o, this.u, false);
                break;
            case 14:
                b72Var.w(k52.BOTTOM, b72VarB, k52.BASELINE, this.o, this.u);
                break;
            case 15:
                b72Var.w(k52.BASELINE, b72VarB, k52.BOTTOM, this.v, this.w);
                break;
            case 16:
                b72Var.w(k52.BASELINE, b72VarB, k52.TOP, this.v, this.w);
                break;
            case 17:
                k52 k52Var7 = k52.BASELINE;
                b72Var.w(k52Var7, b72VarB, k52Var7, this.v, this.w);
                break;
            case 18:
                float f = this.b0;
                int i2 = (int) this.c0;
                k52 k52Var8 = k52.CENTER;
                b72Var.w(k52Var8, b72VarB, k52Var8, i2, 0);
                b72Var.E = f;
                break;
        }
    }

    public final void e(Object obj) {
        this.d0 = mpc.BOTTOM_TO_BOTTOM;
        this.V = obj;
    }

    public final void f() {
        mpc mpcVar = this.d0;
        if (mpcVar == null) {
            this.J = null;
            this.K = null;
            this.j = 0;
            this.L = null;
            this.M = null;
            this.k = 0;
            this.N = null;
            this.O = null;
            this.l = 0;
            this.P = null;
            this.Q = null;
            this.m = 0;
            this.R = null;
            this.S = null;
            this.n = 0;
            this.U = null;
            this.V = null;
            this.o = 0;
            this.X = null;
            this.a0 = null;
            this.h = 0.5f;
            this.i = 0.5f;
            this.p = 0;
            this.q = 0;
            this.r = 0;
            this.s = 0;
            this.t = 0;
            this.u = 0;
            return;
        }
        switch (b62.a[mpcVar.ordinal()]) {
            case 1:
            case 2:
                this.J = null;
                this.K = null;
                this.j = 0;
                this.p = 0;
                break;
            case 3:
            case 4:
                this.L = null;
                this.M = null;
                this.k = 0;
                this.q = 0;
                break;
            case 5:
            case 6:
                this.N = null;
                this.O = null;
                this.l = 0;
                this.r = 0;
                break;
            case 7:
            case 8:
                this.P = null;
                this.Q = null;
                this.m = 0;
                this.s = 0;
                break;
            case 9:
            case 10:
            case 11:
                this.R = null;
                this.S = null;
                this.T = null;
                this.n = 0;
                this.t = 0;
                break;
            case 12:
            case 13:
            case 14:
                this.U = null;
                this.V = null;
                this.W = null;
                this.o = 0;
                this.u = 0;
                break;
            case 17:
                this.X = null;
                break;
            case 18:
                this.a0 = null;
                break;
        }
    }

    public final void g() {
        if (this.N != null) {
            this.d0 = mpc.START_TO_START;
        } else {
            this.d0 = mpc.START_TO_END;
        }
        f();
        if (this.P != null) {
            this.d0 = mpc.END_TO_START;
        } else {
            this.d0 = mpc.END_TO_END;
        }
        f();
        if (this.J != null) {
            this.d0 = mpc.LEFT_TO_LEFT;
        } else {
            this.d0 = mpc.LEFT_TO_RIGHT;
        }
        f();
        if (this.L != null) {
            this.d0 = mpc.RIGHT_TO_LEFT;
        } else {
            this.d0 = mpc.RIGHT_TO_RIGHT;
        }
        f();
    }

    @Override // defpackage.sya
    public final Object getKey() {
        return this.a;
    }

    public final void h() {
        if (this.R != null) {
            this.d0 = mpc.TOP_TO_TOP;
        } else {
            this.d0 = mpc.TOP_TO_BOTTOM;
        }
        f();
        this.d0 = mpc.BASELINE_TO_BASELINE;
        f();
        if (this.U != null) {
            this.d0 = mpc.BOTTOM_TO_TOP;
        } else {
            this.d0 = mpc.BOTTOM_TO_BOTTOM;
        }
        f();
    }

    public final void i(Object obj) {
        this.d0 = mpc.END_TO_END;
        this.Q = obj;
    }

    public final Object j(Object obj) {
        if (obj == null) {
            return null;
        }
        return !(obj instanceof c62) ? (sya) this.b.c.get(obj) : obj;
    }

    public c62 k(int i) {
        mpc mpcVar = this.d0;
        if (mpcVar == null) {
            this.j = i;
            this.k = i;
            this.l = i;
            this.m = i;
            this.n = i;
            this.o = i;
            return this;
        }
        switch (b62.a[mpcVar.ordinal()]) {
            case 1:
            case 2:
                this.j = i;
                break;
            case 3:
            case 4:
                this.k = i;
                break;
            case 5:
            case 6:
                this.l = i;
                break;
            case 7:
            case 8:
                this.m = i;
                break;
            case 9:
            case 10:
            case 11:
                this.n = i;
                break;
            case 12:
            case 13:
            case 14:
                this.o = i;
                break;
            case 15:
            case 16:
            case 17:
                this.v = i;
                break;
            case 18:
                this.c0 = i;
                break;
        }
        return this;
    }

    public c62 l(Float f) {
        return k(this.b.c(f));
    }

    public final void m(int i) {
        mpc mpcVar = this.d0;
        if (mpcVar == null) {
            this.p = i;
            this.q = i;
            this.r = i;
            this.s = i;
            this.t = i;
            this.u = i;
            return;
        }
        switch (b62.a[mpcVar.ordinal()]) {
            case 1:
            case 2:
                this.p = i;
                break;
            case 3:
            case 4:
                this.q = i;
                break;
            case 5:
            case 6:
                this.r = i;
                break;
            case 7:
            case 8:
                this.s = i;
                break;
            case 9:
            case 10:
            case 11:
                this.t = i;
                break;
            case 12:
            case 13:
            case 14:
                this.u = i;
                break;
            case 15:
            case 16:
            case 17:
                this.w = i;
                break;
        }
    }

    public final void n(Float f) {
        m(this.b.c(f));
    }

    public final void o(Object obj) {
        this.d0 = mpc.START_TO_START;
        this.N = obj;
    }

    public final void p(Object obj) {
        this.d0 = mpc.TOP_TO_TOP;
        this.R = obj;
    }
}
