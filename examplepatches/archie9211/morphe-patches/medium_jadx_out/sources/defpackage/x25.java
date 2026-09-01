package defpackage;

import java.io.EOFException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x25 extends w05 {
    public static final h21 c;
    public final kz0 b;

    static {
        h21 h21Var = h21.d;
        c = dq1.n("0021F904");
    }

    public x25(zz0 zz0Var) {
        super(zz0Var);
        this.b = new kz0();
    }

    public final boolean f(long j) {
        kz0 kz0Var = this.b;
        long j2 = kz0Var.b;
        if (j2 >= j) {
            return true;
        }
        long j3 = j - j2;
        return this.a.q0(kz0Var, j3) == j3;
    }

    @Override // defpackage.w05, defpackage.ikc
    public final long q0(kz0 kz0Var, long j) throws EOFException {
        long j2;
        long j3;
        f(j);
        kz0 kz0Var2 = this.b;
        long j4 = 0;
        if (kz0Var2.b == 0) {
            return j == 0 ? 0L : -1L;
        }
        long j5 = 0;
        while (true) {
            long jN = -1;
            while (true) {
                h21 h21Var = c;
                j2 = j4;
                jN = kz0Var2.N(h21Var.a[0], jN + 1, Long.MAX_VALUE);
                if (jN == -1 || (f(h21Var.a.length) && kz0Var2.R(h21Var.e(), jN, h21Var))) {
                    break;
                }
                j4 = j2;
            }
            if (jN == -1) {
                break;
            }
            long jQ0 = kz0Var2.q0(kz0Var, jN + 4);
            if (jQ0 < j2) {
                jQ0 = j2;
            }
            j5 += jQ0;
            if (f(5L) && kz0Var2.L(4L) == 0 && (((kz0Var2.L(2L) & 255) << 8) | (kz0Var2.L(1L) & 255)) < 2) {
                kz0Var.K0(kz0Var2.L(j2));
                kz0Var.K0(10);
                kz0Var.K0(0);
                kz0Var2.skip(3L);
            }
            j4 = 0;
        }
        if (j5 < j) {
            long jQ02 = kz0Var2.q0(kz0Var, j - j5);
            j3 = 0;
            if (jQ02 < 0) {
                jQ02 = 0;
            }
            j5 += jQ02;
        } else {
            j3 = 0;
        }
        if (j5 == j3) {
            return -1L;
        }
        return j5;
    }
}
