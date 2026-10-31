package ys;

import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.Intrinsics;
import z2.i1;

/* loaded from: classes4.dex */
public final class o implements z2.r0 {
    @Override // z2.r0
    public final int c(z2.t tVar, List measurables, int i5) {
        Intrinsics.g(tVar, "<this>");
        Intrinsics.g(measurables, "measurables");
        Iterator it = measurables.iterator();
        if (!it.hasNext()) {
            throw new NoSuchElementException();
        }
        int iT = ((z2.s) it.next()).t(i5);
        while (it.hasNext()) {
            int iT2 = ((z2.s) it.next()).t(i5);
            if (iT < iT2) {
                iT = iT2;
            }
        }
        return iT;
    }

    @Override // z2.r0
    public final z2.s0 e(z2.t0 measure, List measurables, long j11) {
        Intrinsics.g(measure, "$this$measure");
        Intrinsics.g(measurables, "measurables");
        long jA = y3.a.a(j11, 0, 0, 0, 0, 11);
        i1 i1VarH = ((z2.q0) measurables.get(0)).H(jA);
        i1 i1VarH2 = ((z2.q0) measurables.get(2)).H(jA);
        int iH = (y3.a.h(j11) - i1VarH.f98081a) - i1VarH2.f98081a;
        i1 i1VarH3 = ((z2.q0) measurables.get(1)).H(y3.a.a(jA, iH, iH, 0, 0, 12));
        z2.q0 q0Var = (z2.q0) b70.g.Z0(3, measurables);
        i1 i1VarH4 = q0Var != null ? q0Var.H(jA) : null;
        int iMax = Math.max(i1VarH.f98082b, Math.max(i1VarH3.f98082b, i1VarH2.f98082b));
        return measure.y(y3.a.h(j11), Math.max(y3.a.i(j11), (i1VarH4 != null ? i1VarH4.f98082b : 0) + iMax), b70.h.f17594a, new kw.i1(i1VarH, iMax, i1VarH3, i1VarH2, i1VarH4));
    }
}
