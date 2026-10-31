package q1;

import java.util.ArrayList;
import p1.k2;
import p1.t1;
import z.o0;

/* loaded from: classes2.dex */
public final class d0 extends j0 {

    /* renamed from: c, reason: collision with root package name */
    public static final d0 f83383c = new d0(0, 1, 1);

    @Override // q1.j0
    public final void a(l0 l0Var, p1.c cVar, k2 k2Var, x1.l lVar, k0 k0Var) {
        t1 t1Var = (t1) l0Var.i(0);
        o0 o0Var = lVar.f94970i;
        x1.h hVar = o0Var != null ? (x1.h) o0Var.d(t1Var) : null;
        if (hVar != null) {
            ArrayList arrayList = lVar.f94971j;
            if (arrayList == null) {
                arrayList = new ArrayList();
                lVar.f94971j = arrayList;
            }
            arrayList.add(lVar.f94966e);
            lVar.f94966e = hVar.f94958b;
        }
    }
}
