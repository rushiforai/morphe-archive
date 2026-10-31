package k0;

import androidx.compose.ui.node.LayoutNode;
import java.util.List;

/* loaded from: classes2.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final b6.e f70582a;

    /* renamed from: b, reason: collision with root package name */
    public static final br.a f70583b;

    /* renamed from: c, reason: collision with root package name */
    public static final j00.k0 f70584c = new j00.k0(1, 0);

    /* renamed from: d, reason: collision with root package name */
    public static final int f70585d = 9;

    /* renamed from: e, reason: collision with root package name */
    public static final int f70586e = 6;

    /* renamed from: f, reason: collision with root package name */
    public static final int f70587f = 10;

    /* renamed from: g, reason: collision with root package name */
    public static final int f70588g = 5;

    /* renamed from: h, reason: collision with root package name */
    public static final int f70589h = 15;

    static {
        int i5 = 12;
        f70582a = new b6.e(i5);
        f70583b = new br.a(i5);
    }

    public static int a(int i5, int i11, List list) {
        if (list.isEmpty()) {
            return 0;
        }
        int iMin = Math.min((list.size() - 1) * i11, i5);
        List list2 = list;
        int size = list2.size();
        int iMax = 0;
        float f11 = 0.0f;
        for (int i12 = 0; i12 < size; i12++) {
            z2.s sVar = (z2.s) list.get(i12);
            float fB = r1.b(r1.a(sVar));
            if (fB == 0.0f) {
                int iMin2 = Math.min(sVar.F(LayoutNode.NotPlacedPlaceOrder), i5 == Integer.MAX_VALUE ? Integer.MAX_VALUE : i5 - iMin);
                iMin += iMin2;
                iMax = Math.max(iMax, sVar.b(iMin2));
            } else if (fB > 0.0f) {
                f11 += fB;
            }
        }
        int iRound = f11 == 0.0f ? 0 : i5 == Integer.MAX_VALUE ? Integer.MAX_VALUE : Math.round(Math.max(i5 - iMin, 0) / f11);
        int size2 = list2.size();
        for (int i13 = 0; i13 < size2; i13++) {
            z2.s sVar2 = (z2.s) list.get(i13);
            float fB2 = r1.b(r1.a(sVar2));
            if (fB2 > 0.0f) {
                iMax = Math.max(iMax, sVar2.b(iRound != Integer.MAX_VALUE ? Math.round(iRound * fB2) : Integer.MAX_VALUE));
            }
        }
        return iMax;
    }

    public static int b(int i5, int i11, List list) {
        if (list.isEmpty()) {
            return 0;
        }
        int size = list.size();
        int iMax = 0;
        int i12 = 0;
        float f11 = 0.0f;
        for (int i13 = 0; i13 < size; i13++) {
            z2.s sVar = (z2.s) list.get(i13);
            float fB = r1.b(r1.a(sVar));
            int iF = sVar.F(i5);
            if (fB == 0.0f) {
                i12 += iF;
            } else if (fB > 0.0f) {
                f11 += fB;
                iMax = Math.max(iMax, Math.round(iF / fB));
            }
        }
        return ((list.size() - 1) * i11) + Math.round(iMax * f11) + i12;
    }

    public static int c(int i5, int i11, List list) {
        if (list.isEmpty()) {
            return 0;
        }
        int iMin = Math.min((list.size() - 1) * i11, i5);
        List list2 = list;
        int size = list2.size();
        int iMax = 0;
        float f11 = 0.0f;
        for (int i12 = 0; i12 < size; i12++) {
            z2.s sVar = (z2.s) list.get(i12);
            float fB = r1.b(r1.a(sVar));
            if (fB == 0.0f) {
                int iMin2 = Math.min(sVar.F(LayoutNode.NotPlacedPlaceOrder), i5 == Integer.MAX_VALUE ? Integer.MAX_VALUE : i5 - iMin);
                iMin += iMin2;
                iMax = Math.max(iMax, sVar.t(iMin2));
            } else if (fB > 0.0f) {
                f11 += fB;
            }
        }
        int iRound = f11 == 0.0f ? 0 : i5 == Integer.MAX_VALUE ? Integer.MAX_VALUE : Math.round(Math.max(i5 - iMin, 0) / f11);
        int size2 = list2.size();
        for (int i13 = 0; i13 < size2; i13++) {
            z2.s sVar2 = (z2.s) list.get(i13);
            float fB2 = r1.b(r1.a(sVar2));
            if (fB2 > 0.0f) {
                iMax = Math.max(iMax, sVar2.t(iRound != Integer.MAX_VALUE ? Math.round(iRound * fB2) : Integer.MAX_VALUE));
            }
        }
        return iMax;
    }

    public static int d(int i5, int i11, List list) {
        if (list.isEmpty()) {
            return 0;
        }
        int size = list.size();
        int iMax = 0;
        int i12 = 0;
        float f11 = 0.0f;
        for (int i13 = 0; i13 < size; i13++) {
            z2.s sVar = (z2.s) list.get(i13);
            float fB = r1.b(r1.a(sVar));
            int iE = sVar.E(i5);
            if (fB == 0.0f) {
                i12 += iE;
            } else if (fB > 0.0f) {
                f11 += fB;
                iMax = Math.max(iMax, Math.round(iE / fB));
            }
        }
        return ((list.size() - 1) * i11) + Math.round(iMax * f11) + i12;
    }

    public static int e(int i5, int i11, List list) {
        if (list.isEmpty()) {
            return 0;
        }
        int size = list.size();
        int iMax = 0;
        int i12 = 0;
        float f11 = 0.0f;
        for (int i13 = 0; i13 < size; i13++) {
            z2.s sVar = (z2.s) list.get(i13);
            float fB = r1.b(r1.a(sVar));
            int iB = sVar.b(i5);
            if (fB == 0.0f) {
                i12 += iB;
            } else if (fB > 0.0f) {
                f11 += fB;
                iMax = Math.max(iMax, Math.round(iB / fB));
            }
        }
        return ((list.size() - 1) * i11) + Math.round(iMax * f11) + i12;
    }

    public static int f(int i5, int i11, List list) {
        if (list.isEmpty()) {
            return 0;
        }
        int iMin = Math.min((list.size() - 1) * i11, i5);
        List list2 = list;
        int size = list2.size();
        int iMax = 0;
        float f11 = 0.0f;
        for (int i12 = 0; i12 < size; i12++) {
            z2.s sVar = (z2.s) list.get(i12);
            float fB = r1.b(r1.a(sVar));
            if (fB == 0.0f) {
                int iMin2 = Math.min(sVar.b(LayoutNode.NotPlacedPlaceOrder), i5 == Integer.MAX_VALUE ? Integer.MAX_VALUE : i5 - iMin);
                iMin += iMin2;
                iMax = Math.max(iMax, sVar.F(iMin2));
            } else if (fB > 0.0f) {
                f11 += fB;
            }
        }
        int iRound = f11 == 0.0f ? 0 : i5 == Integer.MAX_VALUE ? Integer.MAX_VALUE : Math.round(Math.max(i5 - iMin, 0) / f11);
        int size2 = list2.size();
        for (int i13 = 0; i13 < size2; i13++) {
            z2.s sVar2 = (z2.s) list.get(i13);
            float fB2 = r1.b(r1.a(sVar2));
            if (fB2 > 0.0f) {
                iMax = Math.max(iMax, sVar2.F(iRound != Integer.MAX_VALUE ? Math.round(iRound * fB2) : Integer.MAX_VALUE));
            }
        }
        return iMax;
    }

    public static int g(int i5, int i11, List list) {
        if (list.isEmpty()) {
            return 0;
        }
        int size = list.size();
        int iMax = 0;
        int i12 = 0;
        float f11 = 0.0f;
        for (int i13 = 0; i13 < size; i13++) {
            z2.s sVar = (z2.s) list.get(i13);
            float fB = r1.b(r1.a(sVar));
            int iT = sVar.t(i5);
            if (fB == 0.0f) {
                i12 += iT;
            } else if (fB > 0.0f) {
                f11 += fB;
                iMax = Math.max(iMax, Math.round(iT / fB));
            }
        }
        return ((list.size() - 1) * i11) + Math.round(iMax * f11) + i12;
    }

    public static int h(int i5, int i11, List list) {
        if (list.isEmpty()) {
            return 0;
        }
        int iMin = Math.min((list.size() - 1) * i11, i5);
        List list2 = list;
        int size = list2.size();
        int iMax = 0;
        float f11 = 0.0f;
        for (int i12 = 0; i12 < size; i12++) {
            z2.s sVar = (z2.s) list.get(i12);
            float fB = r1.b(r1.a(sVar));
            if (fB == 0.0f) {
                int iMin2 = Math.min(sVar.b(LayoutNode.NotPlacedPlaceOrder), i5 == Integer.MAX_VALUE ? Integer.MAX_VALUE : i5 - iMin);
                iMin += iMin2;
                iMax = Math.max(iMax, sVar.E(iMin2));
            } else if (fB > 0.0f) {
                f11 += fB;
            }
        }
        int iRound = f11 == 0.0f ? 0 : i5 == Integer.MAX_VALUE ? Integer.MAX_VALUE : Math.round(Math.max(i5 - iMin, 0) / f11);
        int size2 = list2.size();
        for (int i13 = 0; i13 < size2; i13++) {
            z2.s sVar2 = (z2.s) list.get(i13);
            float fB2 = r1.b(r1.a(sVar2));
            if (fB2 > 0.0f) {
                iMax = Math.max(iMax, sVar2.E(iRound != Integer.MAX_VALUE ? Math.round(iRound * fB2) : Integer.MAX_VALUE));
            }
        }
        return iMax;
    }

    public static long k(long j11, f1 f1Var) {
        f1 f1Var2 = f1.f70603a;
        return y3.b.a(f1Var == f1Var2 ? y3.a.j(j11) : y3.a.i(j11), f1Var == f1Var2 ? y3.a.h(j11) : y3.a.g(j11), f1Var == f1Var2 ? y3.a.i(j11) : y3.a.j(j11), f1Var == f1Var2 ? y3.a.g(j11) : y3.a.h(j11));
    }

    public static long l(int i5, long j11) {
        return y3.b.a(0, y3.a.h(j11), (i5 & 4) != 0 ? y3.a.i(j11) : 0, y3.a.g(j11));
    }

    public static final long n(long j11) {
        f1 f1Var = f1.f70603a;
        return y3.b.a(y3.a.j(j11), y3.a.h(j11), y3.a.i(j11), y3.a.g(j11));
    }

    public static final void o(String str, StringBuilder sb2) {
        if (sb2.length() > 0) {
            sb2.append('+');
        }
        sb2.append(str);
    }

    public abstract int i(int i5, y3.n nVar, z2.i1 i1Var, int i11);

    public Integer j(z2.i1 i1Var) {
        return null;
    }

    public boolean m() {
        return this instanceof c0;
    }
}
