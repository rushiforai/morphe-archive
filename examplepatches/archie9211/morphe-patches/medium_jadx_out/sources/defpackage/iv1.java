package defpackage;

import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class iv1 {
    public static final sn3 a = new sn3(1, new n7(15));
    public static final sn3 b = new sn3(1, new e73(1));

    public static final long a(fv1 fv1Var, long j) {
        long j2 = fv1Var.a;
        long j3 = fv1Var.U;
        long j4 = fv1Var.Q;
        long j5 = fv1Var.M;
        long j6 = fv1Var.q;
        int i = uu1.i;
        if (ezd.a(j, j2)) {
            return fv1Var.b;
        }
        if (ezd.a(j, fv1Var.f)) {
            return fv1Var.g;
        }
        if (ezd.a(j, fv1Var.j)) {
            return fv1Var.k;
        }
        if (ezd.a(j, fv1Var.n)) {
            return fv1Var.o;
        }
        if (ezd.a(j, fv1Var.w)) {
            return fv1Var.x;
        }
        if (ezd.a(j, fv1Var.c)) {
            return fv1Var.d;
        }
        if (ezd.a(j, fv1Var.h)) {
            return fv1Var.i;
        }
        if (ezd.a(j, fv1Var.l)) {
            return fv1Var.m;
        }
        if (ezd.a(j, fv1Var.y)) {
            return fv1Var.z;
        }
        if (ezd.a(j, fv1Var.u)) {
            return fv1Var.v;
        }
        if (!ezd.a(j, fv1Var.p)) {
            if (ezd.a(j, fv1Var.r)) {
                return fv1Var.s;
            }
            if (!ezd.a(j, fv1Var.D) && !ezd.a(j, fv1Var.F) && !ezd.a(j, fv1Var.G) && !ezd.a(j, fv1Var.H) && !ezd.a(j, fv1Var.I) && !ezd.a(j, fv1Var.J) && !ezd.a(j, fv1Var.E)) {
                return (ezd.a(j, fv1Var.K) || ezd.a(j, fv1Var.L)) ? j5 : (ezd.a(j, fv1Var.O) || ezd.a(j, fv1Var.P)) ? j4 : (ezd.a(j, fv1Var.S) || ezd.a(j, fv1Var.T)) ? j3 : uu1.h;
            }
        }
        return j6;
    }

    public static final long b(long j, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Y(89374938);
        long jA = a((fv1) p65Var.j(a), j);
        if (jA == 16) {
            jA = ((uu1) p65Var.j(c82.a)).a;
        }
        p65Var.p(false);
        return jA;
    }

    public static final long c(fv1 fv1Var, gv1 gv1Var) {
        switch (hv1.a[gv1Var.ordinal()]) {
            case 1:
                return fv1Var.n;
            case 2:
                return fv1Var.w;
            case 3:
                return fv1Var.y;
            case 4:
                return fv1Var.v;
            case 5:
                return fv1Var.e;
            case 6:
                return fv1Var.u;
            case 7:
                return fv1Var.o;
            case 8:
                return fv1Var.x;
            case 9:
                return fv1Var.z;
            case 10:
                return fv1Var.b;
            case 11:
                return fv1Var.d;
            case 12:
                return fv1Var.g;
            case 13:
                return fv1Var.i;
            case 14:
                return fv1Var.q;
            case 15:
                return fv1Var.s;
            case 16:
                return fv1Var.t;
            case 17:
                return fv1Var.k;
            case 18:
                return fv1Var.m;
            case 19:
                return fv1Var.A;
            case 20:
                return fv1Var.B;
            case 21:
                return fv1Var.a;
            case 22:
                return fv1Var.c;
            case 23:
                return fv1Var.C;
            case 24:
                return fv1Var.f;
            case 25:
                return fv1Var.h;
            case 26:
                return fv1Var.p;
            case 27:
                return fv1Var.r;
            case 28:
                return fv1Var.D;
            case 29:
                return fv1Var.F;
            case 30:
                return fv1Var.G;
            case 31:
                return fv1Var.H;
            case 32:
                return fv1Var.I;
            case 33:
                return fv1Var.J;
            case 34:
                return fv1Var.E;
            case 35:
                return fv1Var.j;
            case 36:
                return fv1Var.l;
            case 37:
                return fv1Var.K;
            case 38:
                return fv1Var.L;
            case 39:
                return fv1Var.M;
            case 40:
                return fv1Var.N;
            case 41:
                return fv1Var.O;
            case 42:
                return fv1Var.P;
            case 43:
                return fv1Var.Q;
            case 44:
                return fv1Var.R;
            case 45:
                return fv1Var.S;
            case 46:
                return fv1Var.T;
            case 47:
                return fv1Var.U;
            case 48:
                return fv1Var.V;
            default:
                ygf.a();
                return 0L;
        }
    }

    public static final long d(gv1 gv1Var, x12 x12Var) {
        return c((fv1) ((p65) x12Var).j(a), gv1Var);
    }

    public static fv1 e(long j, long j2, long j3, long j4, long j5, long j6, long j7, long j8, long j9, long j10, long j11, long j12, long j13, int i) {
        long j14 = (i & 1) != 0 ? av1.z : j;
        return new fv1(j14, (i & 2) != 0 ? av1.j : j2, av1.A, av1.k, (i & 16) != 0 ? av1.e : j3, (i & 32) != 0 ? av1.E : j4, (i & 64) != 0 ? av1.n : j5, av1.F, av1.o, (i & 512) != 0 ? av1.R : j6, (i & 1024) != 0 ? av1.t : j7, av1.S, av1.u, (i & 8192) != 0 ? av1.a : j8, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? av1.g : j9, (32768 & i) != 0 ? av1.I : j10, (65536 & i) != 0 ? av1.r : j11, av1.Q, av1.s, j14, av1.f, av1.d, (4194304 & i) != 0 ? av1.b : j12, (i & 8388608) != 0 ? av1.h : j13, av1.c, av1.i, av1.x, av1.y, av1.D, av1.J, av1.P, av1.K, av1.L, av1.M, av1.N, av1.O, av1.B, av1.C, av1.l, av1.m, av1.G, av1.H, av1.p, av1.q, av1.T, av1.U, av1.v, av1.w);
    }
}
