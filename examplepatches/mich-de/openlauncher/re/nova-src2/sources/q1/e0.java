package q1;

import p1.a2;
import p1.k2;
import p1.t1;

/* loaded from: classes2.dex */
public final class e0 extends j0 {

    /* renamed from: c, reason: collision with root package name */
    public static final e0 f83385c = new e0(1, 0, 2);

    @Override // q1.j0
    public final void a(l0 l0Var, p1.c cVar, k2 k2Var, x1.l lVar, k0 k0Var) {
        int iH = l0Var.h(0);
        int i5 = k2Var.f81484v;
        int iM = k2Var.M(k2Var.f81466b, k2Var.r(i5));
        int iG = k2Var.g(k2Var.f81466b, k2Var.r(i5 + 1));
        for (int iMax = Math.max(iM, iG - iH); iMax < iG; iMax++) {
            Object obj = k2Var.f81467c[k2Var.h(iMax)];
            if (obj instanceof a2) {
                lVar.e((a2) obj);
            } else if (obj instanceof t1) {
                ((t1) obj).e();
            }
        }
        if (iH <= 0) {
            p1.u.c("Check failed");
        }
        int i11 = k2Var.f81484v;
        int iM2 = k2Var.M(k2Var.f81466b, k2Var.r(i11));
        int iG2 = k2Var.g(k2Var.f81466b, k2Var.r(i11 + 1)) - iH;
        if (iG2 < iM2) {
            p1.u.c("Check failed");
        }
        k2Var.I(iG2, iH, i11);
        int i12 = k2Var.f81473i;
        if (i12 >= iM2) {
            k2Var.f81473i = i12 - iH;
        }
    }
}
