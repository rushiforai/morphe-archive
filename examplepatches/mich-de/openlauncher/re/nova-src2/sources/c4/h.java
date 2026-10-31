package c4;

import java.util.ArrayList;
import java.util.List;
import z2.i1;
import z2.q0;
import z2.r0;
import z2.s0;
import z2.t0;

/* loaded from: classes2.dex */
public final class h implements r0 {

    /* renamed from: a, reason: collision with root package name */
    public static final h f19603a = new h();

    @Override // z2.r0
    public final s0 e(t0 t0Var, List list, long j11) {
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        int iJ = 0;
        int i5 = 0;
        for (int i11 = 0; i11 < size; i11++) {
            i1 i1VarH = ((q0) list.get(i11)).H(j11);
            iJ = Math.max(iJ, i1VarH.f98081a);
            i5 = Math.max(i5, i1VarH.f98082b);
            arrayList.add(i1VarH);
        }
        if (list.isEmpty()) {
            iJ = y3.a.j(j11);
            i5 = y3.a.i(j11);
        }
        return t0Var.y(iJ, i5, b70.h.f17594a, new g(arrayList, 0));
    }
}
