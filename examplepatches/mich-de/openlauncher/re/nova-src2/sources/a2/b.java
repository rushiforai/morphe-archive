package a2;

import java.util.ArrayList;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import p1.f2;
import p1.g2;
import p1.i2;
import p1.k2;
import p1.r;
import p1.u;
import p1.w;
import z.c0;
import z.j0;

/* loaded from: classes2.dex */
public abstract class b {
    public static final List a(f2 f2Var) {
        if (f2Var.f81414f || f2Var.f81411c == 0) {
            return EmptyList.f71733a;
        }
        o oVar = new o(f2Var);
        int iQ = f2Var.f81417i;
        Object objValueOf = Integer.valueOf(f2Var.f81420l - i2.c(f2Var.f81410b, iQ));
        while (iQ >= 0) {
            oVar.b(f2Var.f81409a.g(iQ), objValueOf);
            objValueOf = f2Var.a(iQ);
            iQ = f2Var.q(iQ);
        }
        return oVar.f106a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [a2.a, a2.o] */
    /* JADX WARN: Type inference failed for: r5v0, types: [java.lang.Integer] */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v2, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v3, types: [p1.a] */
    /* JADX WARN: Type inference failed for: r5v7, types: [java.lang.Integer] */
    public static final List b(k2 k2Var, Integer num, int i5, Integer num2) {
        int iD;
        j0 j0Var;
        if (k2Var.f81485w || k2Var.p() == 0) {
            return EmptyList.f71733a;
        }
        ?? oVar = new o(k2Var);
        if (num2 != null) {
            iD = num2.intValue();
        } else {
            iD = k2Var.f81484v;
            if (iD < 0) {
                iD = k2Var.D(k2Var.f81466b, i5);
            }
        }
        if (num == 0) {
            int iM = k2Var.f81473i - k2Var.M(k2Var.f81466b, k2Var.r(i5));
            c0 c0Var = k2Var.f81481s;
            num = Integer.valueOf(iM + ((c0Var == null || (j0Var = (j0) c0Var.b(i5)) == null) ? 0 : j0Var.f97841b));
        }
        while (i5 >= 0) {
            oVar.b(k2Var.N(i5), num);
            num = k2Var.b(i5);
            if (iD >= 0) {
                int i11 = iD;
                iD = k2Var.D(k2Var.f81466b, iD);
                i5 = i11;
            } else {
                i5 = iD;
            }
        }
        return oVar.f106a;
    }

    public static List c(k2 k2Var) {
        return b(k2Var, null, k2Var.f81482t, null);
    }

    public static final Integer d(g2 g2Var, w wVar) {
        f2 f2VarD = g2Var.d();
        try {
            return e(f2VarD, wVar, 0, f2VarD.f81411c);
        } finally {
            f2VarD.c();
        }
    }

    public static final Integer e(f2 f2Var, w wVar, int i5, int i11) {
        Integer numE;
        int[] iArr = f2Var.f81410b;
        while (true) {
            if (i5 >= i11) {
                return null;
            }
            int i12 = iArr[(i5 * 5) + 3] + i5;
            if (f2Var.j(i5) && f2Var.i(i5) == 206 && Intrinsics.b(f2Var.p(iArr, i5), u.f81591e)) {
                Object objH = f2Var.h(i5, 0);
                r rVar = objH instanceof r ? (r) objH : null;
                if (rVar != null && rVar.f81532a.equals(wVar)) {
                    return Integer.valueOf(i5);
                }
            }
            if (f2Var.d(i5) && (numE = e(f2Var, wVar, i5 + 1, i12)) != null) {
                return Integer.valueOf(numE.intValue());
            }
            i5 = i12;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [a2.a, a2.o] */
    /* JADX WARN: Type inference failed for: r7v0, types: [java.lang.Integer] */
    /* JADX WARN: Type inference failed for: r7v1, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r7v3 */
    /* JADX WARN: Type inference failed for: r7v4 */
    /* JADX WARN: Type inference failed for: r7v5 */
    public static final ArrayList f(f2 f2Var, int i5, Integer num) {
        ?? oVar = new o(f2Var);
        int iQ = f2Var.q(i5);
        p1.a aVarA = f2Var.a(i5);
        while (i5 >= 0) {
            oVar.b(f2Var.f81409a.g(i5), num);
            if (iQ >= 0) {
                p1.a aVar = aVarA;
                aVarA = f2Var.a(iQ);
                i5 = iQ;
                iQ = f2Var.q(iQ);
                num = aVar;
            } else {
                i5 = iQ;
                num = aVarA;
            }
        }
        return oVar.f106a;
    }
}
