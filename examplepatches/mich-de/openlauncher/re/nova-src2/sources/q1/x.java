package q1;

import java.util.Set;
import p1.a2;
import p1.k2;
import p1.t1;
import z.o0;
import z.z0;

/* loaded from: classes2.dex */
public final class x extends j0 {

    /* renamed from: c, reason: collision with root package name */
    public static final x f83424c = new x(0, 1, 1);

    @Override // q1.j0
    public final void a(l0 l0Var, p1.c cVar, k2 k2Var, x1.l lVar, k0 k0Var) {
        t1 t1Var = (t1) l0Var.i(0);
        Set set = lVar.f94962a;
        if (set == null) {
            return;
        }
        x1.h hVar = new x1.h(set);
        o0 o0Var = lVar.f94970i;
        if (o0Var == null) {
            long[] jArr = z0.f97875a;
            o0Var = new o0();
            lVar.f94970i = o0Var;
        }
        o0Var.m(t1Var, hVar);
        lVar.f94966e.b(new a2(hVar, null));
    }
}
