package e1;

import java.util.ArrayList;
import java.util.List;
import z2.i1;

/* loaded from: classes.dex */
public final class l0 implements z2.r0 {

    /* renamed from: a, reason: collision with root package name */
    public static final l0 f51328a = new l0();

    @Override // z2.r0
    public final z2.s0 e(z2.t0 t0Var, List list, long j11) {
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        int iMax = 0;
        int iMax2 = 0;
        for (int i5 = 0; i5 < size; i5++) {
            i1 i1VarH = ((z2.q0) list.get(i5)).H(j11);
            iMax = Math.max(iMax, i1VarH.f98081a);
            iMax2 = Math.max(iMax2, i1VarH.f98082b);
            arrayList.add(i1VarH);
        }
        return t0Var.y(iMax, iMax2, b70.h.f17594a, new k0(arrayList, 0));
    }
}
