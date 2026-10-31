package l1;

import java.util.List;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class i7 implements z2.r0 {
    /* JADX WARN: Removed duplicated region for block: B:64:0x0104 A[PHI: r4 r6
      0x0104: PHI (r4v11 int) = (r4v10 int), (r4v15 int), (r4v15 int) binds: [B:67:0x011e, B:60:0x00f9, B:62:0x00ff] A[DONT_GENERATE, DONT_INLINE]
      0x0104: PHI (r6v8 int) = (r6v7 int), (r6v13 int), (r6v13 int) binds: [B:67:0x011e, B:60:0x00f9, B:62:0x00ff] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // z2.r0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final z2.s0 e(z2.t0 t0Var, List list, long j11) {
        Object obj;
        Object obj2;
        int iMo96roundToPx0680j_4;
        int iMax;
        int i5;
        int iO;
        List list2 = list;
        int iMin = Math.min(y3.a.h(j11), t0Var.mo96roundToPx0680j_4(o7.f73749a));
        int size = list2.size();
        int i11 = 0;
        while (true) {
            if (i11 >= size) {
                obj = null;
                break;
            }
            obj = list2.get(i11);
            if (Intrinsics.b(androidx.compose.ui.layout.a.a((z2.q0) obj), "action")) {
                break;
            }
            i11++;
        }
        z2.q0 q0Var = (z2.q0) obj;
        z2.i1 i1VarH = q0Var != null ? q0Var.H(j11) : null;
        int size2 = list2.size();
        int i12 = 0;
        while (true) {
            if (i12 >= size2) {
                obj2 = null;
                break;
            }
            obj2 = list2.get(i12);
            if (Intrinsics.b(androidx.compose.ui.layout.a.a((z2.q0) obj2), "dismissAction")) {
                break;
            }
            i12++;
        }
        z2.q0 q0Var2 = (z2.q0) obj2;
        z2.i1 i1VarH2 = q0Var2 != null ? q0Var2.H(j11) : null;
        int i13 = i1VarH != null ? i1VarH.f98081a : 0;
        int i14 = i1VarH != null ? i1VarH.f98082b : 0;
        int i15 = i1VarH2 != null ? i1VarH2.f98081a : 0;
        int i16 = i1VarH2 != null ? i1VarH2.f98082b : 0;
        int iMo96roundToPx0680j_42 = ((iMin - i13) - i15) - (i15 == 0 ? t0Var.mo96roundToPx0680j_4(o7.f73754f) : 0);
        int iJ = y3.a.j(j11);
        if (iMo96roundToPx0680j_42 >= iJ) {
            iJ = iMo96roundToPx0680j_42;
        }
        int size3 = list2.size();
        int i17 = 0;
        while (i17 < size3) {
            z2.q0 q0Var3 = (z2.q0) list2.get(i17);
            if (Intrinsics.b(androidx.compose.ui.layout.a.a(q0Var3), "text")) {
                z2.i1 i1VarH3 = q0Var3.H(y3.a.a(j11, 0, iJ, 0, 0, 9));
                z2.n nVar = z2.c.f98028a;
                int iO2 = i1VarH3.O(nVar);
                int iO3 = i1VarH3.O(z2.c.f98029b);
                boolean z11 = true;
                boolean z12 = (iO2 == Integer.MIN_VALUE || iO3 == Integer.MIN_VALUE) ? false : true;
                if (iO2 != iO3 && z12) {
                    z11 = false;
                }
                int i18 = iMin - i15;
                int i19 = i18 - i13;
                if (z11) {
                    iMax = Math.max(t0Var.mo96roundToPx0680j_4(o1.a0.f78932f), Math.max(i14, i16));
                    iMo96roundToPx0680j_4 = (iMax - i1VarH3.f98082b) / 2;
                    i5 = (i1VarH == null || (iO = i1VarH.O(nVar)) == Integer.MIN_VALUE) ? 0 : (iO2 + iMo96roundToPx0680j_4) - iO;
                } else {
                    iMo96roundToPx0680j_4 = t0Var.mo96roundToPx0680j_4(o7.f73750b) - iO2;
                    iMax = Math.max(t0Var.mo96roundToPx0680j_4(o1.a0.f78933g), i1VarH3.f98082b + iMo96roundToPx0680j_4);
                    if (i1VarH != null) {
                        i5 = (iMax - i1VarH.f98082b) / 2;
                    }
                }
                return t0Var.y(iMin, iMax, b70.h.f17594a, new h7(i1VarH3, iMo96roundToPx0680j_4, i1VarH2, i18, i1VarH2 != null ? (iMax - i1VarH2.f98082b) / 2 : 0, i1VarH, i19, i5));
            }
            i17++;
            iJ = iJ;
            list2 = list;
        }
        throw new NoSuchElementException("Collection contains no element matching the predicate.");
    }
}
