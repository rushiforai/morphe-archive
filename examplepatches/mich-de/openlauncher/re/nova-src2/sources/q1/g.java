package q1;

import java.util.List;
import p1.k2;

/* loaded from: classes2.dex */
public final class g extends j0 {

    /* renamed from: c, reason: collision with root package name */
    public static final g f83388c = new g(0, 2, 1);

    @Override // q1.j0
    public final void a(l0 l0Var, p1.c cVar, k2 k2Var, x1.l lVar, k0 k0Var) {
        int i5 = ((x1.g) l0Var.i(0)).f94956a;
        List list = (List) l0Var.i(1);
        int size = list.size();
        for (int i11 = 0; i11 < size; i11++) {
            Object obj = list.get(i11);
            int i12 = i5 + i11;
            cVar.m(i12, obj);
            cVar.j(i12, obj);
        }
    }
}
