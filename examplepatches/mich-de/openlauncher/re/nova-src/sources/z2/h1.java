package z2;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public abstract class h1 implements y3.c {

    /* renamed from: a, reason: collision with root package name */
    public boolean f98075a;

    /* JADX WARN: Multi-variable type inference failed */
    public static final void a(h1 h1Var, i1 i1Var) {
        h1Var.getClass();
        if (i1Var instanceof b3.k1) {
            ((b3.k1) i1Var).n(h1Var.f98075a);
        }
    }

    public static void k(h1 h1Var, i1 i1Var, long j11) {
        h1Var.getClass();
        a(h1Var, i1Var);
        i1Var.S(0.0f, y3.k.d(j11, i1Var.f98085e), null);
    }

    public static void m(h1 h1Var, i1 i1Var, int i5, int i11) {
        long j11 = (i5 << 32) | (i11 & 4294967295L);
        if (h1Var.f() == y3.n.f96612a || h1Var.g() == 0) {
            a(h1Var, i1Var);
            i1Var.S(0.0f, y3.k.d(j11, i1Var.f98085e), null);
        } else {
            int iG = (h1Var.g() - i1Var.f98081a) - ((int) (j11 >> 32));
            a(h1Var, i1Var);
            i1Var.S(0.0f, y3.k.d((iG << 32) | (((int) (j11 & 4294967295L)) & 4294967295L), i1Var.f98085e), null);
        }
    }

    public static void n(h1 h1Var, i1 i1Var, int i5, int i11) {
        int i12 = k1.f98101b;
        j1 j1Var = j1.f98091k;
        long j11 = (i5 << 32) | (i11 & 4294967295L);
        if (h1Var.f() == y3.n.f96612a || h1Var.g() == 0) {
            a(h1Var, i1Var);
            i1Var.S(0.0f, y3.k.d(j11, i1Var.f98085e), j1Var);
        } else {
            int iG = (h1Var.g() - i1Var.f98081a) - ((int) (j11 >> 32));
            a(h1Var, i1Var);
            i1Var.S(0.0f, y3.k.d((iG << 32) | (((int) (j11 & 4294967295L)) & 4294967295L), i1Var.f98085e), j1Var);
        }
    }

    public static void o(h1 h1Var, i1 i1Var, long j11) {
        int i5 = k1.f98101b;
        j1 j1Var = j1.f98091k;
        if (h1Var.f() == y3.n.f96612a || h1Var.g() == 0) {
            a(h1Var, i1Var);
            i1Var.S(0.0f, y3.k.d(j11, i1Var.f98085e), j1Var);
        } else {
            int iG = (h1Var.g() - i1Var.f98081a) - ((int) (j11 >> 32));
            a(h1Var, i1Var);
            i1Var.S(0.0f, y3.k.d((((int) (j11 & 4294967295L)) & 4294967295L) | (iG << 32), i1Var.f98085e), j1Var);
        }
    }

    public static void q(h1 h1Var, i1 i1Var, long j11, l2.b bVar) {
        if (h1Var.f() == y3.n.f96612a || h1Var.g() == 0) {
            a(h1Var, i1Var);
            i1Var.T(y3.k.d(j11, i1Var.f98085e), 0.0f, bVar);
        } else {
            int iG = (h1Var.g() - i1Var.f98081a) - ((int) (j11 >> 32));
            a(h1Var, i1Var);
            i1Var.T(y3.k.d((((int) (j11 & 4294967295L)) & 4294967295L) | (iG << 32), i1Var.f98085e), 0.0f, bVar);
        }
    }

    public static void t(h1 h1Var, i1 i1Var, int i5, int i11, Function1 function1, int i12) {
        if ((i12 & 8) != 0) {
            int i13 = k1.f98101b;
            function1 = j1.f98091k;
        }
        h1Var.getClass();
        a(h1Var, i1Var);
        i1Var.S(0.0f, y3.k.d((i11 & 4294967295L) | (i5 << 32), i1Var.f98085e), function1);
    }

    public static void x(h1 h1Var, i1 i1Var, long j11) {
        int i5 = k1.f98101b;
        j1 j1Var = j1.f98091k;
        h1Var.getClass();
        a(h1Var, i1Var);
        i1Var.S(0.0f, y3.k.d(j11, i1Var.f98085e), j1Var);
    }

    public float b(p pVar) {
        return Float.NaN;
    }

    public abstract y3.n f();

    public abstract int g();

    public final void i(i1 i1Var, int i5, int i11, float f11) {
        a(this, i1Var);
        i1Var.S(f11, y3.k.d((i11 & 4294967295L) | (i5 << 32), i1Var.f98085e), null);
    }
}
