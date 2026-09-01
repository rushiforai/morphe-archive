package defpackage;

import android.os.Build;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class eh8 extends fb7 implements tk7, hp6, nx8 {
    public static final tjb N = new tjb();
    public static final zo6 O = new zo6();
    public static final float[] P = pk7.a();
    public static final xsa Q;
    public static final uob R;
    public float A;
    public e78 B;
    public zo6 C;
    public boolean E;
    public boolean F;
    public of5 G;
    public e61 H;
    public lo I;
    public boolean K;
    public lx8 L;
    public of5 M;
    public final aq6 o;
    public eh8 p;
    public eh8 q;
    public boolean r;
    public boolean s;
    public x45 t;
    public m73 u;
    public ip6 v;
    public al7 x;
    public t68 y;
    public float w = 0.8f;
    public long z = 0;
    public m3c D = rv8.r;
    public final bh8 J = new bh8(this, 1);

    static {
        int i = 20;
        Q = new xsa(i);
        R = new uob(i);
    }

    public eh8(aq6 aq6Var) {
        this.o = aq6Var;
        this.u = aq6Var.y;
        this.v = aq6Var.z;
    }

    public static eh8 j1(hp6 hp6Var) {
        eh8 eh8Var;
        ib7 ib7Var = hp6Var instanceof ib7 ? (ib7) hp6Var : null;
        if (ib7Var != null && (eh8Var = ib7Var.a.o) != null) {
            return eh8Var;
        }
        hp6Var.getClass();
        return (eh8) hp6Var;
    }

    @Override // defpackage.fb7
    public final void C0() {
        of5 of5Var = this.M;
        long j = this.z;
        if (of5Var != null) {
            a0(j, this.A, of5Var);
        } else {
            X(j, this.A, this.t);
        }
    }

    @Override // defpackage.hp6
    public final long D(hp6 hp6Var, long j) {
        return G(hp6Var, j);
    }

    public final void D0(eh8 eh8Var, e78 e78Var, boolean z) {
        if (eh8Var == this) {
            return;
        }
        eh8 eh8Var2 = this.q;
        if (eh8Var2 != null) {
            eh8Var2.D0(eh8Var, e78Var, z);
        }
        long j = this.z;
        float f = (int) (j >> 32);
        e78Var.a -= f;
        e78Var.c -= f;
        float f2 = (int) (j & 4294967295L);
        e78Var.b -= f2;
        e78Var.d -= f2;
        lx8 lx8Var = this.L;
        if (lx8Var != null) {
            rf5 rf5Var = (rf5) lx8Var;
            float[] fArrA = rf5Var.a();
            if (!rf5Var.s) {
                if (fArrA == null) {
                    e78Var.a = 0.0f;
                    e78Var.b = 0.0f;
                    e78Var.c = 0.0f;
                    e78Var.d = 0.0f;
                } else {
                    pk7.c(fArrA, e78Var);
                }
            }
            if (this.s && z) {
                long j2 = this.c;
                e78Var.a(0.0f, 0.0f, (int) (j2 >> 32), (int) (j2 & 4294967295L));
            }
        }
    }

    public final long E0(eh8 eh8Var, long j) {
        if (eh8Var == this) {
            return j;
        }
        eh8 eh8Var2 = this.q;
        return (eh8Var2 == null || g76.L(eh8Var, eh8Var2)) ? L0(j) : L0(eh8Var2.E0(eh8Var, j));
    }

    @Override // defpackage.hp6
    public final long F(long j) {
        if (!O0().n) {
            b26.b("LayoutCoordinate operations are only valid when isAttached is true");
        }
        return G(sgg.K(this), ((mn) dq6.a(this.o)).H(j));
    }

    public final long F0(long j) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j >> 32)) - R();
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j & 4294967295L)) - P();
        return (((long) Float.floatToRawIntBits(Math.max(0.0f, fIntBitsToFloat / 2.0f))) << 32) | (((long) Float.floatToRawIntBits(Math.max(0.0f, fIntBitsToFloat2 / 2.0f))) & 4294967295L);
    }

    @Override // defpackage.hp6
    public final long G(hp6 hp6Var, long j) {
        if (hp6Var instanceof ib7) {
            ib7 ib7Var = (ib7) hp6Var;
            ib7Var.a.o.X0();
            return ib7Var.G(this, j ^ (-9223372034707292160L)) ^ (-9223372034707292160L);
        }
        eh8 eh8VarJ1 = j1(hp6Var);
        eh8VarJ1.X0();
        eh8 eh8VarK0 = K0(eh8VarJ1);
        while (eh8VarJ1 != eh8VarK0) {
            lx8 lx8Var = eh8VarJ1.L;
            if (lx8Var != null) {
                rf5 rf5Var = (rf5) lx8Var;
                float[] fArrB = rf5Var.b();
                if (!rf5Var.s) {
                    j = pk7.b(j, fArrB);
                }
            }
            j = d46.W(j, eh8VarJ1.z);
            eh8VarJ1 = eh8VarJ1.q;
            eh8VarJ1.getClass();
        }
        return E0(eh8VarK0, j);
    }

    public final float G0(long j, long j2) {
        if (R() >= Float.intBitsToFloat((int) (j2 >> 32)) && P() >= Float.intBitsToFloat((int) (j2 & 4294967295L))) {
            return Float.POSITIVE_INFINITY;
        }
        long jF0 = F0(j2);
        float fIntBitsToFloat = Float.intBitsToFloat((int) (jF0 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jF0 & 4294967295L));
        float fIntBitsToFloat3 = Float.intBitsToFloat((int) (j >> 32));
        float fMax = Math.max(0.0f, fIntBitsToFloat3 < 0.0f ? -fIntBitsToFloat3 : fIntBitsToFloat3 - R());
        float fIntBitsToFloat4 = Float.intBitsToFloat((int) (j & 4294967295L));
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fMax)) << 32) | (((long) Float.floatToRawIntBits(Math.max(0.0f, fIntBitsToFloat4 < 0.0f ? -fIntBitsToFloat4 : fIntBitsToFloat4 - P()))) & 4294967295L);
        if (fIntBitsToFloat > 0.0f || fIntBitsToFloat2 > 0.0f) {
            int i = (int) (jFloatToRawIntBits >> 32);
            if (Float.intBitsToFloat(i) <= fIntBitsToFloat) {
                int i2 = (int) (jFloatToRawIntBits & 4294967295L);
                if (Float.intBitsToFloat(i2) <= fIntBitsToFloat2) {
                    float fIntBitsToFloat5 = Float.intBitsToFloat(i);
                    float fIntBitsToFloat6 = Float.intBitsToFloat(i2);
                    return (fIntBitsToFloat6 * fIntBitsToFloat6) + (fIntBitsToFloat5 * fIntBitsToFloat5);
                }
            }
        }
        return Float.POSITIVE_INFINITY;
    }

    @Override // defpackage.hp6
    public final zwa H(hp6 hp6Var, boolean z) {
        if (!O0().n) {
            b26.b("LayoutCoordinate operations are only valid when isAttached is true");
        }
        if (!hp6Var.m()) {
            b26.b("LayoutCoordinates " + hp6Var + " is not attached!");
        }
        eh8 eh8VarJ1 = j1(hp6Var);
        eh8VarJ1.X0();
        eh8 eh8VarK0 = K0(eh8VarJ1);
        e78 e78Var = this.B;
        if (e78Var == null) {
            e78Var = new e78();
            this.B = e78Var;
        }
        e78Var.a = 0.0f;
        e78Var.b = 0.0f;
        e78Var.c = (int) (hp6Var.j() >> 32);
        e78Var.d = (int) (hp6Var.j() & 4294967295L);
        while (eh8VarJ1 != eh8VarK0) {
            eh8VarJ1.f1(e78Var, z, false);
            if (e78Var.b()) {
                return zwa.e;
            }
            eh8VarJ1 = eh8VarJ1.q;
            eh8VarJ1.getClass();
        }
        D0(eh8VarK0, e78Var, z);
        return new zwa(e78Var.a, e78Var.b, e78Var.c, e78Var.d);
    }

    public final void H0(e61 e61Var, of5 of5Var) {
        lx8 lx8Var = this.L;
        if (lx8Var == null) {
            long j = this.z;
            float f = (int) (j >> 32);
            float f2 = (int) (j & 4294967295L);
            e61Var.p(f, f2);
            I0(e61Var, of5Var);
            e61Var.p(-f, -f2);
            return;
        }
        rf5 rf5Var = (rf5) lx8Var;
        g61 g61Var = rf5Var.m;
        rf5Var.g();
        rf5Var.t = rf5Var.a.a.L() > 0.0f;
        m50 m50Var = g61Var.b;
        m50Var.M(e61Var);
        m50Var.c = of5Var;
        g76.V(g61Var, rf5Var.a);
    }

    @Override // defpackage.hp6
    public final long I(long j) {
        if (!O0().n) {
            b26.b("LayoutCoordinate operations are only valid when isAttached is true");
        }
        X0();
        while (this != null) {
            aq6 aq6Var = this.o;
            if (this == ((eh8) aq6Var.F.e) && !aq6Var.c) {
                long jB = ((mn) dq6.a(aq6Var)).getRectManager().b(aq6Var);
                if (!k46.b(jB, 9223372034707292159L)) {
                    return d46.W(j, jB);
                }
            }
            lx8 lx8Var = this.L;
            if (lx8Var != null) {
                rf5 rf5Var = (rf5) lx8Var;
                float[] fArrB = rf5Var.b();
                if (!rf5Var.s) {
                    j = pk7.b(j, fArrB);
                }
            }
            j = d46.W(j, this.z);
            this = this.q;
        }
        return j;
    }

    public final void I0(e61 e61Var, of5 of5Var) {
        eh8 eh8Var;
        e61 e61Var2;
        of5 of5Var2;
        q28 q28VarP0 = P0(4);
        if (q28VarP0 == null) {
            d1(e61Var, of5Var);
            return;
        }
        aq6 aq6Var = this.o;
        aq6Var.getClass();
        cq6 sharedDrawScope = ((mn) dq6.a(aq6Var)).getSharedDrawScope();
        long jC0 = nk7.C0(this.c);
        sharedDrawScope.getClass();
        o78 o78Var = null;
        while (q28VarP0 != null) {
            if (q28VarP0 instanceof xl3) {
                eh8Var = this;
                e61Var2 = e61Var;
                of5Var2 = of5Var;
                sharedDrawScope.c(e61Var2, jC0, eh8Var, (xl3) q28VarP0, of5Var2);
            } else {
                eh8Var = this;
                e61Var2 = e61Var;
                of5Var2 = of5Var;
                if ((q28VarP0.c & 4) != 0 && (q28VarP0 instanceof b43)) {
                    int i = 0;
                    for (q28 q28Var = ((b43) q28VarP0).p; q28Var != null; q28Var = q28Var.f) {
                        if ((q28Var.c & 4) != 0) {
                            i++;
                            if (i == 1) {
                                q28VarP0 = q28Var;
                            } else {
                                if (o78Var == null) {
                                    o78Var = new o78(new q28[16]);
                                }
                                if (q28VarP0 != null) {
                                    o78Var.b(q28VarP0);
                                    q28VarP0 = null;
                                }
                                o78Var.b(q28Var);
                            }
                        }
                    }
                    if (i == 1) {
                    }
                }
                e61Var = e61Var2;
                this = eh8Var;
                of5Var = of5Var2;
            }
            q28VarP0 = flb.q0(o78Var);
            e61Var = e61Var2;
            this = eh8Var;
            of5Var = of5Var2;
        }
    }

    public abstract void J0();

    public final eh8 K0(eh8 eh8Var) {
        aq6 aq6VarV = eh8Var.o;
        aq6 aq6Var = this.o;
        if (aq6VarV == aq6Var) {
            q28 q28VarO0 = eh8Var.O0();
            q28 q28VarO02 = O0();
            if (!q28VarO02.a.n) {
                b26.b("visitLocalAncestors called on an unattached node");
            }
            for (q28 q28Var = q28VarO02.a.e; q28Var != null; q28Var = q28Var.e) {
                if ((q28Var.c & 2) != 0 && q28Var == q28VarO0) {
                    return eh8Var;
                }
            }
            return this;
        }
        while (aq6VarV.p > aq6Var.p) {
            aq6VarV = aq6VarV.v();
            aq6VarV.getClass();
        }
        aq6 aq6VarV2 = aq6Var;
        while (aq6VarV2.p > aq6VarV.p) {
            aq6VarV2 = aq6VarV2.v();
            aq6VarV2.getClass();
        }
        while (aq6VarV != aq6VarV2) {
            aq6VarV = aq6VarV.v();
            aq6VarV2 = aq6VarV2.v();
            if (aq6VarV == null || aq6VarV2 == null) {
                ay0.e("layouts are not part of the same hierarchy");
                return null;
            }
        }
        if (aq6VarV2 != aq6Var) {
            if (aq6VarV != eh8Var.o) {
                return (l26) aq6VarV.F.d;
            }
            return eh8Var;
        }
        return this;
    }

    public final long L0(long j) {
        long j2 = this.z;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j >> 32)) - ((int) (j2 >> 32));
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (j & 4294967295L)) - ((int) (j2 & 4294967295L)))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
        lx8 lx8Var = this.L;
        if (lx8Var != null) {
            rf5 rf5Var = (rf5) lx8Var;
            float[] fArrA = rf5Var.a();
            if (fArrA == null) {
                return 9187343241974906880L;
            }
            if (!rf5Var.s) {
                return pk7.b(jFloatToRawIntBits, fArrA);
            }
        }
        return jFloatToRawIntBits;
    }

    public abstract hb7 M0();

    public final long N0() {
        return this.u.m0(this.o.A.e());
    }

    public abstract q28 O0();

    public final q28 P0(int i) {
        boolean zG = fh8.g(i);
        q28 q28VarO0 = O0();
        if (!zG && (q28VarO0 = q28VarO0.e) == null) {
            return null;
        }
        for (q28 q28VarQ0 = Q0(zG); q28VarQ0 != null && (q28VarQ0.d & i) != 0; q28VarQ0 = q28VarQ0.f) {
            if ((q28VarQ0.c & i) != 0) {
                return q28VarQ0;
            }
            if (q28VarQ0 == q28VarO0) {
                return null;
            }
        }
        return null;
    }

    public final q28 Q0(boolean z) {
        q28 q28VarO0;
        hj0 hj0Var = this.o.F;
        if (((eh8) hj0Var.e) == this) {
            return (q28) hj0Var.g;
        }
        eh8 eh8Var = this.q;
        if (!z) {
            if (eh8Var != null) {
                return eh8Var.O0();
            }
            return null;
        }
        if (eh8Var == null || (q28VarO0 = eh8Var.O0()) == null) {
            return null;
        }
        return q28VarO0.f;
    }

    public final void R0(q28 q28Var, ah8 ah8Var, long j, yn5 yn5Var, int i, boolean z) {
        if (q28Var == null) {
            U0(ah8Var, j, yn5Var, i, z);
            return;
        }
        if (!ah8Var.n(q28Var)) {
            R0(qq7.t(q28Var, ah8Var.l()), ah8Var, j, yn5Var, i, z);
            return;
        }
        int i2 = yn5Var.c;
        x68 x68Var = yn5Var.a;
        yn5Var.f(i2 + 1, x68Var.b);
        yn5Var.c++;
        x68Var.a(q28Var);
        yn5Var.b.a(k50.v(-1.0f, z, false));
        R0(qq7.t(q28Var, ah8Var.l()), ah8Var, j, yn5Var, i, z);
        yn5Var.c = i2;
    }

    public final void S0(q28 q28Var, ah8 ah8Var, long j, yn5 yn5Var, int i, boolean z, float f) {
        if (q28Var == null) {
            U0(ah8Var, j, yn5Var, i, z);
            return;
        }
        if (!ah8Var.n(q28Var)) {
            S0(qq7.t(q28Var, ah8Var.l()), ah8Var, j, yn5Var, i, z, f);
            return;
        }
        int i2 = yn5Var.c;
        x68 x68Var = yn5Var.a;
        yn5Var.f(i2 + 1, x68Var.b);
        yn5Var.c++;
        x68Var.a(q28Var);
        yn5Var.b.a(k50.v(f, z, false));
        c1(qq7.t(q28Var, ah8Var.l()), ah8Var, j, yn5Var, i, z, f, true);
        yn5Var.c = i2;
    }

    public final void T0(ah8 ah8Var, long j, yn5 yn5Var, int i, boolean z) {
        boolean z2;
        x68 x68Var = yn5Var.a;
        q28 q28VarP0 = P0(ah8Var.l());
        boolean z3 = false;
        if (!p1(j)) {
            if (i == 1) {
                float fG0 = G0(j, N0());
                if ((Float.floatToRawIntBits(fG0) & Integer.MAX_VALUE) < 2139095040) {
                    if (yn5Var.c != x68Var.b - 1) {
                        if (op8.L(yn5Var.d(), k50.v(fG0, false, false)) <= 0) {
                            return;
                        }
                    }
                    S0(q28VarP0, ah8Var, j, yn5Var, i, false, fG0);
                    return;
                }
                return;
            }
            return;
        }
        if (q28VarP0 == null) {
            U0(ah8Var, j, yn5Var, i, z);
            return;
        }
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j & 4294967295L));
        if (fIntBitsToFloat >= 0.0f && fIntBitsToFloat2 >= 0.0f && fIntBitsToFloat < R() && fIntBitsToFloat2 < P()) {
            R0(q28VarP0, ah8Var, j, yn5Var, i, z);
            return;
        }
        float fG02 = i == 1 ? G0(j, N0()) : Float.POSITIVE_INFINITY;
        if ((Float.floatToRawIntBits(fG02) & Integer.MAX_VALUE) < 2139095040) {
            if (yn5Var.c == x68Var.b - 1) {
                z2 = z;
            } else {
                z2 = z;
                if (op8.L(yn5Var.d(), k50.v(fG02, z2, false)) > 0) {
                }
            }
            z3 = true;
        } else {
            z2 = z;
        }
        c1(q28VarP0, ah8Var, j, yn5Var, i, z2, fG02, z3);
    }

    @Override // defpackage.m73
    public final float U() {
        return this.o.y.U();
    }

    public void U0(ah8 ah8Var, long j, yn5 yn5Var, int i, boolean z) {
        eh8 eh8Var = this.p;
        if (eh8Var != null) {
            eh8Var.T0(ah8Var, eh8Var.L0(j), yn5Var, i, z);
        }
    }

    public final void V0() {
        lx8 lx8Var = this.L;
        if (lx8Var != null) {
            ((rf5) lx8Var).c();
            return;
        }
        eh8 eh8Var = this.q;
        if (eh8Var != null) {
            eh8Var.V0();
        }
    }

    public final boolean W0() {
        if (this.L != null && this.w <= 0.0f) {
            return true;
        }
        eh8 eh8Var = this.q;
        if (eh8Var != null) {
            return eh8Var.W0();
        }
        return false;
    }

    public final void X0() {
        this.o.G.b();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v12 */
    /* JADX WARN: Type inference failed for: r7v13 */
    /* JADX WARN: Type inference failed for: r7v14 */
    /* JADX WARN: Type inference failed for: r7v15 */
    /* JADX WARN: Type inference failed for: r7v4 */
    /* JADX WARN: Type inference failed for: r7v5, types: [q28] */
    /* JADX WARN: Type inference failed for: r7v7, types: [q28] */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v10 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v2, types: [o78] */
    /* JADX WARN: Type inference failed for: r8v3 */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5 */
    /* JADX WARN: Type inference failed for: r8v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r8v8 */
    /* JADX WARN: Type inference failed for: r8v9 */
    /* JADX WARN: Type inference failed for: r9v5 */
    public final void Y0() {
        q28 q28VarO0;
        boolean zG = fh8.g(128);
        q28 q28VarQ0 = Q0(zG);
        if (q28VarQ0 == null || (q28VarQ0.a.d & 128) == 0) {
            return;
        }
        oic oicVarA = vn7.A();
        x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
        oic oicVarG = vn7.G(oicVarA);
        try {
            if (!zG) {
                q28VarO0 = O0().e;
                if (q28VarO0 == null) {
                }
            }
            q28VarO0 = O0();
            for (q28 q28VarQ02 = Q0(zG); q28VarQ02 != null; q28VarQ02 = q28VarQ02.f) {
                if ((q28VarQ02.d & 128) == 0) {
                    break;
                }
                if ((q28VarQ02.c & 128) != 0) {
                    ?? Q0 = q28VarQ02;
                    ?? o78Var = 0;
                    while (Q0 != 0) {
                        if (Q0 instanceof fl7) {
                            ((fl7) Q0).p(this.c);
                        } else if ((Q0.c & 128) != 0 && (Q0 instanceof b43)) {
                            q28 q28Var = ((b43) Q0).p;
                            int i = 0;
                            Q0 = Q0;
                            o78Var = o78Var;
                            while (q28Var != null) {
                                if ((q28Var.c & 128) != 0) {
                                    i++;
                                    o78Var = o78Var;
                                    if (i == 1) {
                                        Q0 = q28Var;
                                    } else {
                                        if (o78Var == 0) {
                                            o78Var = new o78(new q28[16]);
                                        }
                                        if (Q0 != 0) {
                                            o78Var.b(Q0);
                                            Q0 = 0;
                                        }
                                        o78Var.b(q28Var);
                                    }
                                }
                                q28Var = q28Var.f;
                                Q0 = Q0;
                                o78Var = o78Var;
                            }
                            if (i == 1) {
                            }
                        }
                        Q0 = flb.q0(o78Var);
                    }
                }
                if (q28VarQ02 == q28VarO0) {
                    break;
                }
            }
        } finally {
            vn7.T(oicVarA, oicVarG, x45VarE);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v0 */
    /* JADX WARN: Type inference failed for: r4v1, types: [q28] */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v4, types: [q28] */
    /* JADX WARN: Type inference failed for: r4v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v6 */
    /* JADX WARN: Type inference failed for: r4v7 */
    /* JADX WARN: Type inference failed for: r4v8 */
    /* JADX WARN: Type inference failed for: r4v9 */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3, types: [o78] */
    /* JADX WARN: Type inference failed for: r5v4 */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Type inference failed for: r5v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r5v8 */
    /* JADX WARN: Type inference failed for: r5v9 */
    /* JADX WARN: Type inference failed for: r6v4 */
    public final void Z0() {
        boolean zG = fh8.g(4194304);
        q28 q28VarO0 = O0();
        if (!zG && (q28VarO0 = q28VarO0.e) == null) {
            return;
        }
        for (q28 q28VarQ0 = Q0(zG); q28VarQ0 != null && (q28VarQ0.d & 4194304) != 0; q28VarQ0 = q28VarQ0.f) {
            if ((q28VarQ0.c & 4194304) != 0) {
                ?? Q0 = q28VarQ0;
                ?? o78Var = 0;
                while (Q0 != 0) {
                    if (Q0 instanceof fp6) {
                        ((fp6) Q0).l(this);
                    } else if ((Q0.c & 4194304) != 0 && (Q0 instanceof b43)) {
                        q28 q28Var = ((b43) Q0).p;
                        int i = 0;
                        Q0 = Q0;
                        o78Var = o78Var;
                        while (q28Var != null) {
                            if ((q28Var.c & 4194304) != 0) {
                                i++;
                                o78Var = o78Var;
                                if (i == 1) {
                                    Q0 = q28Var;
                                } else {
                                    if (o78Var == 0) {
                                        o78Var = new o78(new q28[16]);
                                    }
                                    if (Q0 != 0) {
                                        o78Var.b(Q0);
                                        Q0 = 0;
                                    }
                                    o78Var.b(q28Var);
                                }
                            }
                            q28Var = q28Var.f;
                            Q0 = Q0;
                            o78Var = o78Var;
                        }
                        if (i == 1) {
                        }
                    }
                    Q0 = flb.q0(o78Var);
                }
            }
            if (q28VarQ0 == q28VarO0) {
                return;
            }
        }
    }

    @Override // defpackage.t99
    public abstract void a0(long j, float f, of5 of5Var);

    public final void a1() {
        this.r = true;
        this.J.invoke();
        g1();
        if (k46.b(this.z, 0L)) {
            return;
        }
        this.o.N(this);
    }

    @Override // defpackage.m73
    public final float b() {
        return this.o.y.b();
    }

    public final void b1() {
        boolean zG = fh8.g(1048576);
        q28 q28VarQ0 = Q0(zG);
        if (q28VarQ0 == null || (q28VarQ0.a.d & 1048576) == 0) {
            return;
        }
        q28 q28VarO0 = O0();
        if (!zG && (q28VarO0 = q28VarO0.e) == null) {
            return;
        }
        for (q28 q28VarQ02 = Q0(zG); q28VarQ02 != null && (q28VarQ02.d & 1048576) != 0; q28VarQ02 = q28VarQ02.f) {
            if ((q28VarQ02.c & 1048576) != 0) {
                q28 q28VarQ03 = q28VarQ02;
                o78 o78Var = null;
                while (q28VarQ03 != null) {
                    if ((q28VarQ03.c & 1048576) != 0 && (q28VarQ03 instanceof b43)) {
                        int i = 0;
                        for (q28 q28Var = ((b43) q28VarQ03).p; q28Var != null; q28Var = q28Var.f) {
                            if ((q28Var.c & 1048576) != 0) {
                                i++;
                                if (i == 1) {
                                    q28VarQ03 = q28Var;
                                } else {
                                    if (o78Var == null) {
                                        o78Var = new o78(new q28[16]);
                                    }
                                    if (q28VarQ03 != null) {
                                        o78Var.b(q28VarQ03);
                                        q28VarQ03 = null;
                                    }
                                    o78Var.b(q28Var);
                                }
                            }
                        }
                        if (i == 1) {
                        }
                    }
                    q28VarQ03 = flb.q0(o78Var);
                }
            }
            if (q28VarQ02 == q28VarO0) {
                return;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01a8 A[PHI: r4
      0x01a8: PHI (r4v7 ??) = (r4v1 ??), (r4v1 ??), (r4v9 ??) binds: [B:59:0x0174, B:61:0x0178, B:75:0x01a2] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v2, types: [q28] */
    /* JADX WARN: Type inference failed for: r3v21, types: [q28] */
    /* JADX WARN: Type inference failed for: r3v22 */
    /* JADX WARN: Type inference failed for: r3v23, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v24 */
    /* JADX WARN: Type inference failed for: r3v25 */
    /* JADX WARN: Type inference failed for: r3v26 */
    /* JADX WARN: Type inference failed for: r3v27 */
    /* JADX WARN: Type inference failed for: r3v28 */
    /* JADX WARN: Type inference failed for: r3v29 */
    /* JADX WARN: Type inference failed for: r3v30 */
    /* JADX WARN: Type inference failed for: r4v0 */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v11, types: [o78] */
    /* JADX WARN: Type inference failed for: r4v13 */
    /* JADX WARN: Type inference failed for: r4v14 */
    /* JADX WARN: Type inference failed for: r4v15 */
    /* JADX WARN: Type inference failed for: r4v16 */
    /* JADX WARN: Type inference failed for: r4v17 */
    /* JADX WARN: Type inference failed for: r4v7, types: [o78] */
    /* JADX WARN: Type inference failed for: r4v8 */
    /* JADX WARN: Type inference failed for: r4v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c1(defpackage.q28 r16, defpackage.ah8 r17, long r18, defpackage.yn5 r20, int r21, boolean r22, float r23, boolean r24) {
        /*
            Method dump skipped, instruction units count: 443
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.eh8.c1(q28, ah8, long, yn5, int, boolean, float, boolean):void");
    }

    @Override // defpackage.hp6
    public final long d(long j) {
        long jI = I(j);
        mn mnVar = (mn) dq6.a(this.o);
        mnVar.D();
        return pk7.b(jI, mnVar.s0);
    }

    public abstract void d1(e61 e61Var, of5 of5Var);

    public final void e1(long j, float f, x45 x45Var, of5 of5Var) {
        int i = 0;
        aq6 aq6Var = this.o;
        if (of5Var != null) {
            if (x45Var != null) {
                b26.a("both ways to create layers shouldn't be used together");
            }
            if (this.M != of5Var) {
                this.M = null;
                n1(null, false);
                this.M = of5Var;
            }
            if (this.L == null) {
                mx8 mx8VarA = dq6.a(aq6Var);
                lo loVar = this.I;
                if (loVar == null) {
                    lo loVar2 = new lo(this, 4, new bh8(this, i));
                    this.I = loVar2;
                    loVar = loVar2;
                }
                bh8 bh8Var = this.J;
                lx8 lx8VarJ = ((mn) mx8VarA).j(loVar, bh8Var, of5Var);
                rf5 rf5Var = (rf5) lx8VarJ;
                rf5Var.e(this.c);
                rf5Var.d(j);
                this.L = lx8VarJ;
                aq6Var.J = true;
                bh8Var.invoke();
            }
        } else {
            if (this.M != null) {
                this.M = null;
                n1(null, false);
            }
            n1(x45Var, false);
        }
        if (!k46.b(this.z, j)) {
            ((mn) dq6.a(aq6Var)).N(-4.0f);
            this.z = j;
            lx8 lx8Var = this.L;
            if (lx8Var != null) {
                ((rf5) lx8Var).d(j);
            } else {
                eh8 eh8Var = this.q;
                if (eh8Var != null) {
                    eh8Var.V0();
                }
            }
            aq6Var.N(this);
            fb7.A0(this);
            mx8 mx8Var = aq6Var.n;
            if (mx8Var != null) {
                ((mn) mx8Var).z(aq6Var);
            }
        }
        this.A = f;
        if (this == ((eh8) aq6Var.F.e)) {
            ((mn) dq6.a(aq6Var)).getRectManager().f(aq6Var);
        }
        if (this.k) {
            return;
        }
        o0(w0());
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0081  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void f1(defpackage.e78 r13, boolean r14, boolean r15) {
        /*
            Method dump skipped, instruction units count: 273
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.eh8.f1(e78, boolean, boolean):void");
    }

    public final void g1() {
        if (this.L != null) {
            if (this.M != null) {
                this.M = null;
            }
            n1(null, false);
            this.o.U(false);
        }
    }

    @Override // defpackage.y66
    public final ip6 getLayoutDirection() {
        return this.o.z;
    }

    @Override // defpackage.hp6
    public final void h(float[] fArr) {
        mx8 mx8VarA = dq6.a(this.o);
        eh8 eh8VarJ1 = j1(sgg.K(this));
        m1(eh8VarJ1, fArr);
        if (mx8VarA instanceof rk7) {
            ((mn) ((rk7) mx8VarA)).t(fArr);
            return;
        }
        long jP = eh8VarJ1.p(0L);
        if ((9223372034707292159L & jP) != 9205357640488583168L) {
            pk7.h(fArr, Float.intBitsToFloat((int) (jP >> 32)), Float.intBitsToFloat((int) (jP & 4294967295L)));
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v5 */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1, types: [q28] */
    /* JADX WARN: Type inference failed for: r8v12 */
    /* JADX WARN: Type inference failed for: r8v13 */
    /* JADX WARN: Type inference failed for: r8v3 */
    /* JADX WARN: Type inference failed for: r8v4, types: [q28] */
    /* JADX WARN: Type inference failed for: r8v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r8v6 */
    /* JADX WARN: Type inference failed for: r8v7 */
    /* JADX WARN: Type inference failed for: r8v8 */
    /* JADX WARN: Type inference failed for: r8v9 */
    /* JADX WARN: Type inference failed for: r9v13 */
    /* JADX WARN: Type inference failed for: r9v14 */
    /* JADX WARN: Type inference failed for: r9v15 */
    /* JADX WARN: Type inference failed for: r9v16 */
    /* JADX WARN: Type inference failed for: r9v2 */
    /* JADX WARN: Type inference failed for: r9v3 */
    /* JADX WARN: Type inference failed for: r9v4 */
    /* JADX WARN: Type inference failed for: r9v5, types: [o78] */
    /* JADX WARN: Type inference failed for: r9v6 */
    /* JADX WARN: Type inference failed for: r9v7 */
    /* JADX WARN: Type inference failed for: r9v8, types: [o78] */
    public final void h1(al7 al7Var) {
        eh8 eh8Var;
        al7 al7Var2 = this.x;
        if (al7Var != al7Var2) {
            this.x = al7Var;
            aq6 aq6Var = this.o;
            int i = 0;
            if (al7Var2 == null || al7Var.b() != al7Var2.b() || al7Var.a() != al7Var2.a()) {
                int iB = al7Var.b();
                int iA = al7Var.a();
                lx8 lx8Var = this.L;
                if (lx8Var != null) {
                    ((rf5) lx8Var).e((((long) iB) << 32) | (((long) iA) & 4294967295L));
                } else if (aq6Var.I() && (eh8Var = this.q) != null) {
                    eh8Var.V0();
                }
                d0((((long) iA) & 4294967295L) | (((long) iB) << 32));
                if (this.t != null) {
                    o1(false);
                }
                boolean zG = fh8.g(4);
                q28 q28VarO0 = O0();
                if (zG || (q28VarO0 = q28VarO0.e) != null) {
                    for (q28 q28VarQ0 = Q0(zG); q28VarQ0 != null && (q28VarQ0.d & 4) != 0; q28VarQ0 = q28VarQ0.f) {
                        if ((q28VarQ0.c & 4) != 0) {
                            ?? Q0 = q28VarQ0;
                            ?? o78Var = 0;
                            while (Q0 != 0) {
                                if (Q0 instanceof xl3) {
                                    ((xl3) Q0).L();
                                } else if ((Q0.c & 4) != 0 && (Q0 instanceof b43)) {
                                    q28 q28Var = ((b43) Q0).p;
                                    int i2 = 0;
                                    Q0 = Q0;
                                    o78Var = o78Var;
                                    while (q28Var != null) {
                                        if ((q28Var.c & 4) != 0) {
                                            i2++;
                                            o78Var = o78Var;
                                            if (i2 == 1) {
                                                Q0 = q28Var;
                                            } else {
                                                if (o78Var == 0) {
                                                    o78Var = new o78(new q28[16]);
                                                }
                                                if (Q0 != 0) {
                                                    o78Var.b(Q0);
                                                    Q0 = 0;
                                                }
                                                o78Var.b(q28Var);
                                            }
                                        }
                                        q28Var = q28Var.f;
                                        Q0 = Q0;
                                        o78Var = o78Var;
                                    }
                                    if (i2 == 1) {
                                    }
                                }
                                Q0 = flb.q0(o78Var);
                            }
                        }
                        if (q28VarQ0 == q28VarO0) {
                            break;
                        }
                    }
                }
                mx8 mx8Var = aq6Var.n;
                if (mx8Var != null) {
                    ((mn) mx8Var).z(aq6Var);
                }
                aq6Var.N(this);
            }
            t68 t68Var = this.y;
            if ((t68Var == null || t68Var.e == 0) && al7Var.c().isEmpty()) {
                return;
            }
            t68 t68Var2 = this.y;
            Map mapC = al7Var.c();
            if (t68Var2 != null && t68Var2.e == mapC.size()) {
                Object[] objArr = t68Var2.b;
                int[] iArr = t68Var2.c;
                long[] jArr = t68Var2.a;
                int length = jArr.length - 2;
                if (length < 0) {
                    return;
                }
                int i3 = 0;
                loop0: while (true) {
                    long j = jArr[i3];
                    if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                        int i4 = 8 - ((~(i3 - length)) >>> 31);
                        for (int i5 = i; i5 < i4; i5++) {
                            if ((255 & j) < 128) {
                                int i6 = (i3 << 3) + i5;
                                Object obj = objArr[i6];
                                int i7 = iArr[i6];
                                Integer num = (Integer) mapC.get((yd) obj);
                                if (num == null || num.intValue() != i7) {
                                    break loop0;
                                }
                            }
                            j >>= 8;
                        }
                        if (i4 != 8) {
                            return;
                        }
                    }
                    if (i3 == length) {
                        return;
                    }
                    i3++;
                    i = 0;
                }
            }
            aq6Var.G.p.y.f();
            t68 t68Var3 = this.y;
            if (t68Var3 == null) {
                t68 t68Var4 = om8.a;
                t68Var3 = new t68();
                this.y = t68Var3;
            }
            t68Var3.a();
            for (Map.Entry entry : al7Var.c().entrySet()) {
                t68Var3.g(((Number) entry.getValue()).intValue(), entry.getKey());
            }
        }
    }

    @Override // defpackage.hp6
    public final void i(hp6 hp6Var, float[] fArr) {
        eh8 eh8VarJ1 = j1(hp6Var);
        eh8VarJ1.X0();
        eh8 eh8VarK0 = K0(eh8VarJ1);
        pk7.d(fArr);
        eh8VarJ1.m1(eh8VarK0, fArr);
        l1(eh8VarK0, fArr);
    }

    public final void i1(q28 q28Var, ah8 ah8Var, long j, yn5 yn5Var, int i, boolean z, float f) {
        int i2;
        x68 x68Var = yn5Var.a;
        if (q28Var == null) {
            U0(ah8Var, j, yn5Var, i, z);
            return;
        }
        if (!ah8Var.n(q28Var)) {
            i1(qq7.t(q28Var, ah8Var.l()), ah8Var, j, yn5Var, i, z, f);
            return;
        }
        if (!ah8Var.j(q28Var)) {
            c1(qq7.t(q28Var, ah8Var.l()), ah8Var, j, yn5Var, i, z, f, false);
            return;
        }
        dh8 dh8Var = new dh8(this, q28Var, ah8Var, j, yn5Var, i, z, f);
        o68 o68Var = yn5Var.b;
        int i3 = yn5Var.c;
        int i4 = x68Var.b;
        if (i3 != i4 - 1) {
            long jD = yn5Var.d();
            int i5 = yn5Var.c;
            int i6 = x68Var.b;
            int i7 = i6 - 1;
            yn5Var.c = i7;
            yn5Var.f(i6, x68Var.b);
            yn5Var.c++;
            x68Var.a(q28Var);
            o68Var.a(k50.v(f, z, false));
            dh8Var.invoke();
            yn5Var.c = i7;
            long jD2 = yn5Var.d();
            if (yn5Var.c + 1 >= x68Var.b - 1 || op8.L(jD, jD2) <= 0) {
                yn5Var.f(yn5Var.c + 1, x68Var.b);
            } else {
                int i8 = i5 + 1;
                boolean zC0 = op8.c0(jD2);
                int i9 = yn5Var.c;
                yn5Var.f(i8, zC0 ? i9 + 2 : i9 + 1);
            }
            yn5Var.c = i5;
            return;
        }
        int i10 = i3 + 1;
        yn5Var.f(i10, i4);
        yn5Var.c++;
        x68Var.a(q28Var);
        o68Var.a(k50.v(f, z, false));
        dh8Var.invoke();
        yn5Var.c = i3;
        if (i10 == x68Var.b - 1 || op8.c0(yn5Var.d())) {
            int i11 = yn5Var.c;
            int i12 = i11 + 1;
            x68Var.k(i12);
            if (i12 < 0 || i12 >= (i2 = o68Var.b)) {
                z10.i("Index must be between 0 and size");
                return;
            }
            long[] jArr = o68Var.a;
            long j2 = jArr[i12];
            if (i12 != i2 - 1) {
                k80.i0(jArr, jArr, i12, i11 + 2, i2);
            }
            o68Var.b--;
        }
    }

    @Override // defpackage.hp6
    public final long j() {
        return this.c;
    }

    public final zwa k1() {
        if (O0().n) {
            hp6 hp6VarK = sgg.K(this);
            e78 e78Var = this.B;
            if (e78Var == null) {
                e78Var = new e78();
                this.B = e78Var;
            }
            long jF0 = F0(N0());
            int i = (int) (jF0 >> 32);
            e78Var.a = -Float.intBitsToFloat(i);
            int i2 = (int) (jF0 & 4294967295L);
            e78Var.b = -Float.intBitsToFloat(i2);
            e78Var.c = Float.intBitsToFloat(i) + R();
            e78Var.d = Float.intBitsToFloat(i2) + P();
            while (this != hp6VarK) {
                this.f1(e78Var, false, true);
                if (!e78Var.b()) {
                    this = this.q;
                    this.getClass();
                }
            }
            return new zwa(e78Var.a, e78Var.b, e78Var.c, e78Var.d);
        }
        return zwa.e;
    }

    public final void l1(eh8 eh8Var, float[] fArr) {
        float[] fArrA;
        if (g76.L(eh8Var, this)) {
            return;
        }
        eh8 eh8Var2 = this.q;
        eh8Var2.getClass();
        eh8Var2.l1(eh8Var, fArr);
        if (!k46.b(this.z, 0L)) {
            float[] fArr2 = P;
            pk7.d(fArr2);
            long j = this.z;
            pk7.h(fArr2, -((int) (j >> 32)), -((int) (j & 4294967295L)));
            pk7.g(fArr, fArr2);
        }
        lx8 lx8Var = this.L;
        if (lx8Var == null || (fArrA = ((rf5) lx8Var).a()) == null) {
            return;
        }
        pk7.g(fArr, fArrA);
    }

    @Override // defpackage.hp6
    public final boolean m() {
        return O0().n;
    }

    public final void m1(eh8 eh8Var, float[] fArr) {
        while (!this.equals(eh8Var)) {
            lx8 lx8Var = this.L;
            if (lx8Var != null) {
                pk7.g(fArr, ((rf5) lx8Var).b());
            }
            if (!k46.b(this.z, 0L)) {
                float[] fArr2 = P;
                pk7.d(fArr2);
                pk7.h(fArr2, (int) (r0 >> 32), (int) (r0 & 4294967295L));
                pk7.g(fArr, fArr2);
            }
            this = this.q;
            this.getClass();
        }
    }

    public final void n1(x45 x45Var, boolean z) {
        mx8 mx8Var;
        o78 o78Var;
        Reference referencePoll;
        if (x45Var != null && this.M != null) {
            b26.a("layerBlock can't be provided when explicitLayer is provided");
        }
        int i = 0;
        aq6 aq6Var = this.o;
        boolean z2 = (!z && this.t == x45Var && g76.L(this.u, aq6Var.y) && this.v == aq6Var.z) ? false : true;
        this.u = aq6Var.y;
        this.v = aq6Var.z;
        boolean zH = aq6Var.H();
        bh8 bh8Var = this.J;
        if (zH && x45Var != null) {
            this.t = x45Var;
            if (this.L != null) {
                if (z2) {
                    o1(true);
                    return;
                }
                return;
            }
            mx8 mx8VarA = dq6.a(aq6Var);
            lo loVar = this.I;
            if (loVar == null) {
                lo loVar2 = new lo(this, 4, new bh8(this, i));
                this.I = loVar2;
                loVar = loVar2;
            }
            lx8 lx8VarJ = ((mn) mx8VarA).j(loVar, bh8Var, null);
            rf5 rf5Var = (rf5) lx8VarJ;
            rf5Var.e(this.c);
            rf5Var.d(this.z);
            this.L = lx8VarJ;
            o1(true);
            aq6Var.J = true;
            bh8Var.invoke();
            return;
        }
        this.t = null;
        lx8 lx8Var = this.L;
        if (lx8Var != null) {
            rf5 rf5Var2 = (rf5) lx8Var;
            if (!qk7.u(rf5Var2.b())) {
                aq6Var.N(this);
            }
            rf5Var2.d = null;
            rf5Var2.e = null;
            rf5Var2.g = true;
            rf5Var2.f(false);
            lf5 lf5Var = rf5Var2.b;
            if (lf5Var != null) {
                lf5Var.a(rf5Var2.a);
                mn mnVar = rf5Var2.c;
                mya myaVar = mnVar.N0;
                do {
                    ReferenceQueue referenceQueue = (ReferenceQueue) myaVar.c;
                    o78Var = (o78) myaVar.b;
                    referencePoll = referenceQueue.poll();
                    if (referencePoll != null) {
                        o78Var.l(referencePoll);
                    }
                } while (referencePoll != null);
                o78Var.b(new WeakReference(rf5Var2, (ReferenceQueue) myaVar.c));
                mnVar.E.j(rf5Var2);
            }
            this.L = null;
            aq6Var.J = true;
            bh8Var.invoke();
            if (O0().n && aq6Var.I() && (mx8Var = aq6Var.n) != null) {
                ((mn) mx8Var).z(aq6Var);
            }
        }
        this.K = false;
    }

    public final void o1(boolean z) {
        char c;
        mn mnVar;
        boolean z2;
        mx8 mx8Var;
        m45 m45Var;
        int i;
        m45 m45Var2;
        if (this.M != null) {
            return;
        }
        lx8 lx8Var = this.L;
        x45 x45Var = this.t;
        if (lx8Var == null) {
            if (x45Var == null) {
                return;
            }
            b26.b("null layer with a non-null layerBlock");
            return;
        }
        if (x45Var == null) {
            throw lv8.v("updateLayerParameters requires a non-null layerBlock");
        }
        tjb tjbVar = N;
        tjbVar.a();
        aq6 aq6Var = this.o;
        tjbVar.s = aq6Var.y;
        tjbVar.t = aq6Var.z;
        tjbVar.r = nk7.C0(this.c);
        ((mn) dq6.a(aq6Var)).getSnapshotObserver().a.d(this, zu2.y, new cn(x45Var, 16, this));
        zo6 zo6Var = this.C;
        if (zo6Var == null) {
            zo6Var = new zo6();
            this.C = zo6Var;
        }
        zo6 zo6Var2 = O;
        zo6Var2.getClass();
        zo6Var2.a = zo6Var.a;
        zo6Var2.b = zo6Var.b;
        zo6Var2.c = zo6Var.c;
        zo6Var2.d = zo6Var.d;
        zo6Var2.e = zo6Var.e;
        zo6Var2.f = zo6Var.f;
        zo6Var2.g = zo6Var.g;
        zo6Var2.h = zo6Var.h;
        zo6Var2.i = zo6Var.i;
        float f = tjbVar.b;
        zo6Var.a = f;
        zo6Var.b = tjbVar.c;
        zo6Var.c = tjbVar.e;
        zo6Var.d = tjbVar.f;
        zo6Var.e = tjbVar.j;
        zo6Var.f = tjbVar.k;
        zo6Var.g = tjbVar.l;
        zo6Var.h = tjbVar.m;
        long j = tjbVar.n;
        zo6Var.i = j;
        rf5 rf5Var = (rf5) lx8Var;
        mn mnVar2 = rf5Var.c;
        int i2 = tjbVar.a | rf5Var.n;
        rf5Var.l = tjbVar.t;
        rf5Var.k = tjbVar.s;
        int i3 = i2 & 4096;
        if (i3 != 0) {
            rf5Var.o = j;
        }
        if ((i2 & 1) != 0) {
            qf5 qf5Var = rf5Var.a.a;
            if (qf5Var.c() != f) {
                qf5Var.z(f);
            }
        }
        if ((i2 & 2) != 0) {
            of5 of5Var = rf5Var.a;
            float f2 = tjbVar.c;
            qf5 qf5Var2 = of5Var.a;
            if (qf5Var2.M() != f2) {
                qf5Var2.n(f2);
            }
        }
        if ((i2 & 4) != 0) {
            rf5Var.a.g(tjbVar.d);
        }
        if ((i2 & 8) != 0) {
            of5 of5Var2 = rf5Var.a;
            float f3 = tjbVar.e;
            qf5 qf5Var3 = of5Var2.a;
            if (qf5Var3.B() != f3) {
                qf5Var3.H(f3);
            }
        }
        if ((i2 & 16) != 0) {
            of5 of5Var3 = rf5Var.a;
            float f4 = tjbVar.f;
            qf5 qf5Var4 = of5Var3.a;
            if (qf5Var4.v() != f4) {
                qf5Var4.g(f4);
            }
        }
        if ((i2 & 32) != 0) {
            of5 of5Var4 = rf5Var.a;
            float f5 = tjbVar.g;
            qf5 qf5Var5 = of5Var4.a;
            if (qf5Var5.L() != f5) {
                qf5Var5.d(f5);
                of5Var4.g = true;
                of5Var4.a();
            }
            if (tjbVar.g > 0.0f && !rf5Var.t && (m45Var2 = rf5Var.e) != null) {
                m45Var2.invoke();
            }
        }
        if ((i2 & 64) != 0) {
            of5 of5Var5 = rf5Var.a;
            long j2 = tjbVar.h;
            qf5 qf5Var6 = of5Var5.a;
            long jT = qf5Var6.t();
            int i4 = uu1.i;
            if (!ezd.a(j2, jT)) {
                qf5Var6.x(j2);
            }
        }
        if ((i2 & 128) != 0) {
            of5 of5Var6 = rf5Var.a;
            long j3 = tjbVar.i;
            qf5 qf5Var7 = of5Var6.a;
            long jW = qf5Var7.w();
            int i5 = uu1.i;
            if (!ezd.a(j3, jW)) {
                qf5Var7.I(j3);
            }
        }
        if ((i2 & 1024) != 0) {
            of5 of5Var7 = rf5Var.a;
            float f6 = tjbVar.l;
            qf5 qf5Var8 = of5Var7.a;
            if (qf5Var8.r() != f6) {
                qf5Var8.f(f6);
            }
        }
        if ((i2 & 256) != 0) {
            of5 of5Var8 = rf5Var.a;
            float f7 = tjbVar.j;
            qf5 qf5Var9 = of5Var8.a;
            if (qf5Var9.E() != f7) {
                qf5Var9.N(f7);
            }
        }
        if ((i2 & 512) != 0) {
            of5 of5Var9 = rf5Var.a;
            float f8 = tjbVar.k;
            qf5 qf5Var10 = of5Var9.a;
            if (qf5Var10.p() != f8) {
                qf5Var10.b(f8);
            }
        }
        if ((i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0) {
            of5 of5Var10 = rf5Var.a;
            float f9 = tjbVar.m;
            qf5 qf5Var11 = of5Var10.a;
            if (qf5Var11.A() != f9) {
                qf5Var11.K(f9);
            }
        }
        if (i3 != 0) {
            c = ' ';
            boolean zA = nrd.a(rf5Var.o, nrd.b);
            of5 of5Var11 = rf5Var.a;
            if (!zA) {
                long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (rf5Var.o & 4294967295L)) * ((int) (rf5Var.f & 4294967295L)))) & 4294967295L) | (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (rf5Var.o >> 32)) * ((int) (rf5Var.f >> 32)))) << 32);
                if (!ip8.b(of5Var11.v, jFloatToRawIntBits)) {
                    of5Var11.v = jFloatToRawIntBits;
                    of5Var11.a.s(jFloatToRawIntBits);
                }
            } else if (!ip8.b(of5Var11.v, 9205357640488583168L)) {
                of5Var11.v = 9205357640488583168L;
                of5Var11.a.s(9205357640488583168L);
            }
        } else {
            c = ' ';
        }
        if ((i2 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0) {
            of5 of5Var12 = rf5Var.a;
            boolean z3 = tjbVar.p;
            if (of5Var12.w != z3) {
                of5Var12.w = z3;
                of5Var12.g = true;
                of5Var12.a();
            }
        }
        if ((131072 & i2) != 0) {
            of5 of5Var13 = rf5Var.a;
            ts0 ts0Var = tjbVar.u;
            qf5 qf5Var12 = of5Var13.a;
            if (!g76.L(qf5Var12.e(), ts0Var)) {
                qf5Var12.C(ts0Var);
            }
        }
        if ((262144 & i2) != 0) {
            qf5 qf5Var13 = rf5Var.a.a;
            if (!g76.L(qf5Var13.m(), null)) {
                qf5Var13.y();
            }
        }
        if ((524288 & i2) != 0) {
            of5 of5Var14 = rf5Var.a;
            int i6 = tjbVar.v;
            qf5 qf5Var14 = of5Var14.a;
            if (qf5Var14.O() != i6) {
                qf5Var14.i(i6);
            }
        }
        if ((32768 & i2) != 0) {
            of5 of5Var15 = rf5Var.a;
            int i7 = tjbVar.q;
            if (i7 == 0) {
                i = 0;
            } else if (i7 == 1) {
                i = 1;
            } else {
                i = 2;
                if (i7 != 2) {
                    ygf.f("Not supported composition strategy");
                    return;
                }
            }
            qf5 qf5Var15 = of5Var15.a;
            if (qf5Var15.l() != i) {
                qf5Var15.G(i);
            }
        }
        if ((i2 & 7963) != 0) {
            rf5Var.q = true;
            rf5Var.r = true;
        }
        if (g76.L(rf5Var.p, tjbVar.w)) {
            mnVar = mnVar2;
            z2 = false;
        } else {
            er7 er7Var = tjbVar.w;
            rf5Var.p = er7Var;
            if (er7Var == null) {
                mnVar = mnVar2;
            } else {
                of5 of5Var16 = rf5Var.a;
                if (er7Var instanceof ow8) {
                    zwa zwaVar = ((ow8) er7Var).d;
                    float f10 = zwaVar.a;
                    float f11 = zwaVar.b;
                    mnVar = mnVar2;
                    of5Var16.h(0.0f, (((long) Float.floatToRawIntBits(f10)) << c) | (((long) Float.floatToRawIntBits(f11)) & 4294967295L), (((long) Float.floatToRawIntBits(zwaVar.c - f10)) << c) | (((long) Float.floatToRawIntBits(zwaVar.d - f11)) & 4294967295L));
                } else {
                    mnVar = mnVar2;
                    if (er7Var instanceof nw8) {
                        br brVar = ((nw8) er7Var).d;
                        of5Var16.k = null;
                        of5Var16.i = 9205357640488583168L;
                        of5Var16.h = 0L;
                        of5Var16.j = 0.0f;
                        of5Var16.g = true;
                        of5Var16.n = false;
                        of5Var16.l = brVar;
                        of5Var16.a();
                    } else {
                        if (!(er7Var instanceof pw8)) {
                            ygf.a();
                            return;
                        }
                        pw8 pw8Var = (pw8) er7Var;
                        br brVar2 = pw8Var.e;
                        if (brVar2 != null) {
                            of5Var16.k = null;
                            of5Var16.i = 9205357640488583168L;
                            of5Var16.h = 0L;
                            of5Var16.j = 0.0f;
                            of5Var16.g = true;
                            of5Var16.n = false;
                            of5Var16.l = brVar2;
                            of5Var16.a();
                        } else {
                            wlb wlbVar = pw8Var.d;
                            float f12 = wlbVar.b;
                            float f13 = wlbVar.a;
                            of5Var16.h(Float.intBitsToFloat((int) (wlbVar.h >> c)), (((long) Float.floatToRawIntBits(f13)) << c) | (((long) Float.floatToRawIntBits(f12)) & 4294967295L), (((long) Float.floatToRawIntBits(wlbVar.c - f13)) << c) | (((long) Float.floatToRawIntBits(wlbVar.d - f12)) & 4294967295L));
                        }
                    }
                }
                if (Build.VERSION.SDK_INT < 33 && (((er7Var instanceof nw8) || ((er7Var instanceof pw8) && !ur7.B(((pw8) er7Var).d))) && (m45Var = rf5Var.e) != null)) {
                    m45Var.invoke();
                }
            }
            z2 = true;
        }
        rf5Var.n = tjbVar.a;
        if (i2 != 0 || z2) {
            if (Build.VERSION.SDK_INT >= 26) {
                u36.q(mnVar);
            } else {
                mnVar.invalidate();
            }
            if (mn.p()) {
                mnVar.N(0.0f);
            }
        }
        boolean z4 = this.s;
        this.s = tjbVar.p;
        this.w = tjbVar.d;
        boolean z5 = zo6Var2.a == zo6Var.a && zo6Var2.b == zo6Var.b && zo6Var2.c == zo6Var.c && zo6Var2.d == zo6Var.d && zo6Var2.e == zo6Var.e && zo6Var2.f == zo6Var.f && zo6Var2.g == zo6Var.g && zo6Var2.h == zo6Var.h && nrd.a(zo6Var2.i, zo6Var.i);
        if (z && ((!z5 || z4 != this.s) && (mx8Var = aq6Var.n) != null)) {
            ((mn) mx8Var).z(aq6Var);
        }
        if (z5) {
            return;
        }
        aq6Var.N(this);
        if (aq6Var.P > 0) {
            mn mnVar3 = (mn) dq6.a(aq6Var);
            gg5 gg5Var = (gg5) mnVar3.o0.f;
            if (aq6Var.P > 0) {
                ((o78) gg5Var.b).b(aq6Var);
                aq6Var.O = true;
            }
            mnVar3.G(null);
        }
    }

    @Override // defpackage.hp6
    public final long p(long j) {
        if (!O0().n) {
            b26.b("LayoutCoordinate operations are only valid when isAttached is true");
        }
        return ((mn) dq6.a(this.o)).u(I(j));
    }

    /* JADX WARN: Removed duplicated region for block: B:62:0x017a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean p1(long r24) {
        /*
            Method dump skipped, instruction units count: 432
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.eh8.p1(long):boolean");
    }

    @Override // defpackage.fb7
    public final fb7 r0() {
        return this.p;
    }

    @Override // defpackage.nx8
    public final boolean t() {
        return (this.L == null || this.r || !this.o.H()) ? false : true;
    }

    @Override // defpackage.fb7
    public final boolean u0() {
        return this.x != null;
    }

    @Override // defpackage.hp6
    public final long v(long j) {
        if (!O0().n) {
            b26.b("LayoutCoordinate operations are only valid when isAttached is true");
        }
        hp6 hp6VarK = sgg.K(this);
        mn mnVar = (mn) dq6.a(this.o);
        mnVar.D();
        return G(hp6VarK, ip8.d(pk7.b(j, mnVar.t0), hp6VarK.I(0L)));
    }

    @Override // defpackage.fb7
    public final aq6 v0() {
        return this.o;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v12 */
    /* JADX WARN: Type inference failed for: r4v13 */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r4v3, types: [q28] */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r4v6, types: [q28] */
    /* JADX WARN: Type inference failed for: r4v7, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v8 */
    /* JADX WARN: Type inference failed for: r4v9 */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3, types: [o78] */
    /* JADX WARN: Type inference failed for: r5v4 */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Type inference failed for: r5v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r5v8 */
    /* JADX WARN: Type inference failed for: r5v9 */
    /* JADX WARN: Type inference failed for: r6v5 */
    @Override // defpackage.t99, defpackage.tk7
    public final Object w() {
        aq6 aq6Var = this.o;
        if (!aq6Var.F.e(64)) {
            return null;
        }
        O0();
        Object objV = null;
        for (q28 q28Var = (ffd) aq6Var.F.f; q28Var != null; q28Var = q28Var.e) {
            if ((q28Var.c & 64) != 0) {
                ?? Q0 = q28Var;
                ?? o78Var = 0;
                while (Q0 != 0) {
                    if (Q0 instanceof m49) {
                        objV = ((m49) Q0).v(aq6Var.y, objV);
                    } else if ((Q0.c & 64) != 0 && (Q0 instanceof b43)) {
                        q28 q28Var2 = ((b43) Q0).p;
                        int i = 0;
                        Q0 = Q0;
                        o78Var = o78Var;
                        while (q28Var2 != null) {
                            if ((q28Var2.c & 64) != 0) {
                                i++;
                                o78Var = o78Var;
                                if (i == 1) {
                                    Q0 = q28Var2;
                                } else {
                                    if (o78Var == 0) {
                                        o78Var = new o78(new q28[16]);
                                    }
                                    if (Q0 != 0) {
                                        o78Var.b(Q0);
                                        Q0 = 0;
                                    }
                                    o78Var.b(q28Var2);
                                }
                            }
                            q28Var2 = q28Var2.f;
                            Q0 = Q0;
                            o78Var = o78Var;
                        }
                        if (i == 1) {
                        }
                    }
                    Q0 = flb.q0(o78Var);
                }
            }
        }
        return objV;
    }

    @Override // defpackage.fb7
    public final al7 w0() {
        al7 al7Var = this.x;
        if (al7Var != null) {
            return al7Var;
        }
        ygf.f("Asking for measurement result of unmeasured layout modifier");
        return null;
    }

    @Override // defpackage.fb7
    public final fb7 x0() {
        return this.q;
    }

    @Override // defpackage.hp6
    public final hp6 y() {
        boolean z = O0().n;
        aq6 aq6Var = this.o;
        if (!z) {
            StringBuilder sb = new StringBuilder("LayoutCoordinate operations are only valid when isAttached is true");
            for (aq6 aq6VarV = aq6Var; aq6VarV != null; aq6VarV = aq6VarV.v()) {
                sb.append("\n|");
                sb.append(aq6VarV);
                sb.append(" isAttached=");
                sb.append(aq6VarV.H());
                sb.append(" modifier=");
                sb.append(aq6VarV.K);
                sb.append(" tail=");
                sb.append(O0());
            }
            b26.b(sb.toString());
        }
        X0();
        return ((eh8) aq6Var.F.e).q;
    }

    @Override // defpackage.fb7
    public final long y0() {
        return this.z;
    }

    @Override // defpackage.fb7
    public final hp6 s0() {
        return this;
    }
}
