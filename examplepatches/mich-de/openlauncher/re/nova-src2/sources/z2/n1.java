package z2;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public final class n1 extends b3.m0 {

    /* renamed from: b, reason: collision with root package name */
    public static final n1 f98121b = new n1("Undefined intrinsics block and it is required");

    @Override // z2.r0
    public final s0 e(t0 t0Var, List list, long j11) {
        int size = list.size();
        b70.h hVar = b70.h.f17594a;
        if (size == 0) {
            return t0Var.y(y3.a.j(j11), y3.a.i(j11), hVar, j1.f98092l);
        }
        if (size == 1) {
            i1 i1VarH = ((q0) list.get(0)).H(j11);
            return t0Var.y(y3.b.g(i1VarH.f98081a, j11), y3.b.f(i1VarH.f98082b, j11), hVar, new b0.f0(i1VarH, 4));
        }
        ArrayList arrayList = new ArrayList(list.size());
        int size2 = list.size();
        int iMax = 0;
        int iMax2 = 0;
        for (int i5 = 0; i5 < size2; i5++) {
            i1 i1VarH2 = ((q0) list.get(i5)).H(j11);
            iMax = Math.max(i1VarH2.f98081a, iMax);
            iMax2 = Math.max(i1VarH2.f98082b, iMax2);
            arrayList.add(i1VarH2);
        }
        return t0Var.y(y3.b.g(iMax, j11), y3.b.f(iMax2, j11), hVar, new c4.g(arrayList, 2));
    }
}
