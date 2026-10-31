package fe;

import android.util.Pair;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes3.dex */
public abstract class z1 implements e {

    /* renamed from: a, reason: collision with root package name */
    public static final w1 f55127a = new w1();

    public int a(boolean z11) {
        return p() ? -1 : 0;
    }

    public abstract int b(Object obj);

    public int c(boolean z11) {
        if (p()) {
            return -1;
        }
        return o() - 1;
    }

    public final int d(int i5, x1 x1Var, y1 y1Var, int i11, boolean z11) {
        int i12 = f(i5, x1Var, false).f55077c;
        if (m(i12, y1Var, 0L).o != i5) {
            return i5 + 1;
        }
        int iE = e(i12, i11, z11);
        if (iE == -1) {
            return -1;
        }
        return m(iE, y1Var, 0L).n;
    }

    public int e(int i5, int i11, boolean z11) {
        if (i11 == 0) {
            if (i5 == c(z11)) {
                return -1;
            }
            return i5 + 1;
        }
        if (i11 == 1) {
            return i5;
        }
        if (i11 == 2) {
            return i5 == c(z11) ? a(z11) : i5 + 1;
        }
        throw new IllegalStateException();
    }

    public final boolean equals(Object obj) {
        int iC;
        if (this != obj) {
            if (obj instanceof z1) {
                z1 z1Var = (z1) obj;
                if (z1Var.o() == o() && z1Var.h() == h()) {
                    y1 y1Var = new y1();
                    x1 x1Var = new x1();
                    y1 y1Var2 = new y1();
                    x1 x1Var2 = new x1();
                    int i5 = 0;
                    while (true) {
                        if (i5 >= o()) {
                            int i11 = 0;
                            while (true) {
                                if (i11 >= h()) {
                                    int iA = a(true);
                                    if (iA == z1Var.a(true) && (iC = c(true)) == z1Var.c(true)) {
                                        while (iA != iC) {
                                            int iE = e(iA, 0, true);
                                            if (iE == z1Var.e(iA, 0, true)) {
                                                iA = iE;
                                            }
                                        }
                                    }
                                } else {
                                    if (!f(i11, x1Var, true).equals(z1Var.f(i11, x1Var2, true))) {
                                        break;
                                    }
                                    i11++;
                                }
                            }
                        } else {
                            if (!m(i5, y1Var, 0L).equals(z1Var.m(i5, y1Var2, 0L))) {
                                break;
                            }
                            i5++;
                        }
                    }
                }
            }
            return false;
        }
        return true;
    }

    public abstract x1 f(int i5, x1 x1Var, boolean z11);

    public x1 g(Object obj, x1 x1Var) {
        return f(b(obj), x1Var, true);
    }

    public abstract int h();

    public final int hashCode() {
        y1 y1Var = new y1();
        x1 x1Var = new x1();
        int iO = o() + Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE;
        for (int i5 = 0; i5 < o(); i5++) {
            iO = (iO * 31) + m(i5, y1Var, 0L).hashCode();
        }
        int iH = h() + (iO * 31);
        for (int i11 = 0; i11 < h(); i11++) {
            iH = (iH * 31) + f(i11, x1Var, true).hashCode();
        }
        int iA = a(true);
        while (iA != -1) {
            iH = (iH * 31) + iA;
            iA = e(iA, 0, true);
        }
        return iH;
    }

    public final Pair i(y1 y1Var, x1 x1Var, int i5, long j11) {
        Pair pairJ = j(y1Var, x1Var, i5, j11, 0L);
        pairJ.getClass();
        return pairJ;
    }

    public final Pair j(y1 y1Var, x1 x1Var, int i5, long j11, long j12) {
        wf.a.h(i5, o());
        m(i5, y1Var, j12);
        if (j11 == -9223372036854775807L) {
            j11 = y1Var.f55109l;
            if (j11 == -9223372036854775807L) {
                return null;
            }
        }
        int i11 = y1Var.n;
        f(i11, x1Var, false);
        while (i11 < y1Var.o && x1Var.f55079e != j11) {
            int i12 = i11 + 1;
            if (f(i12, x1Var, false).f55079e > j11) {
                break;
            }
            i11 = i12;
        }
        f(i11, x1Var, true);
        long jMin = j11 - x1Var.f55079e;
        long j13 = x1Var.f55078d;
        if (j13 != -9223372036854775807L) {
            jMin = Math.min(jMin, j13 - 1);
        }
        long jMax = Math.max(0L, jMin);
        Object obj = x1Var.f55076b;
        obj.getClass();
        return Pair.create(obj, Long.valueOf(jMax));
    }

    public int k(int i5, int i11, boolean z11) {
        if (i11 == 0) {
            if (i5 == a(z11)) {
                return -1;
            }
            return i5 - 1;
        }
        if (i11 == 1) {
            return i5;
        }
        if (i11 == 2) {
            return i5 == a(z11) ? c(z11) : i5 - 1;
        }
        throw new IllegalStateException();
    }

    public abstract Object l(int i5);

    public abstract y1 m(int i5, y1 y1Var, long j11);

    public final void n(int i5, y1 y1Var) {
        m(i5, y1Var, 0L);
    }

    public abstract int o();

    public final boolean p() {
        return o() == 0;
    }
}
