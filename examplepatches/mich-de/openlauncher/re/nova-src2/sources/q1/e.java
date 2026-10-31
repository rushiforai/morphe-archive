package q1;

import p1.a2;
import p1.k2;

/* loaded from: classes.dex */
public final class e extends j0 {

    /* renamed from: c, reason: collision with root package name */
    public static final e f83384c = new e(0, 2, 1);

    @Override // q1.j0
    public final void a(l0 l0Var, p1.c cVar, k2 k2Var, x1.l lVar, k0 k0Var) {
        p1.a aVar = (p1.a) l0Var.i(0);
        Object objI = l0Var.i(1);
        if (objI instanceof a2) {
            a2 a2Var = (a2) objI;
            lVar.f94966e.b(a2Var);
            lVar.f94965d.d(a2Var);
        }
        if (k2Var.n != 0) {
            p1.u.c("Can only append a slot if not current inserting");
        }
        int i5 = k2Var.f81473i;
        int i11 = k2Var.f81474j;
        int iC = k2Var.c(aVar);
        int iG = k2Var.g(k2Var.f81466b, k2Var.r(iC + 1));
        k2Var.f81473i = iG;
        k2Var.f81474j = iG;
        k2Var.w(1, iC);
        if (i5 >= iG) {
            i5++;
            i11++;
        }
        k2Var.f81467c[iG] = objI;
        k2Var.f81473i = i5;
        k2Var.f81474j = i11;
    }
}
