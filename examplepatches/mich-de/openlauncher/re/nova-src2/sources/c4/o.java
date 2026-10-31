package c4;

import b0.a1;
import java.util.ArrayList;
import java.util.List;
import z2.i1;
import z2.q0;
import z2.r0;
import z2.s0;
import z2.t0;

/* loaded from: classes2.dex */
public final class o implements r0 {

    /* renamed from: a, reason: collision with root package name */
    public static final o f19624a = new o();

    @Override // z2.r0
    public final s0 e(t0 t0Var, List list, long j11) {
        int size = list.size();
        b70.h hVar = b70.h.f17594a;
        if (size == 0) {
            return t0Var.y(0, 0, hVar, d.o);
        }
        if (size == 1) {
            i1 i1VarH = ((q0) list.get(0)).H(j11);
            return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, hVar, new a1(i1VarH, 2));
        }
        ArrayList arrayList = new ArrayList(list.size());
        int size2 = list.size();
        int iMax = 0;
        int iMax2 = 0;
        for (int i5 = 0; i5 < size2; i5++) {
            i1 i1VarH2 = ((q0) list.get(i5)).H(j11);
            iMax = Math.max(iMax, i1VarH2.f98081a);
            iMax2 = Math.max(iMax2, i1VarH2.f98082b);
            arrayList.add(i1VarH2);
        }
        return t0Var.y(iMax, iMax2, hVar, new g(arrayList, 1));
    }
}
