package t0;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public final class d implements z2.r0 {

    /* renamed from: a, reason: collision with root package name */
    public static final d f87960a = new d();

    @Override // z2.r0
    public final z2.s0 e(z2.t0 t0Var, List list, long j11) {
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            arrayList.add(((z2.q0) list.get(i5)).H(j11));
        }
        return t0Var.y(y3.a.h(j11), y3.a.g(j11), b70.h.f17594a, new e1.k0(arrayList, 6));
    }
}
