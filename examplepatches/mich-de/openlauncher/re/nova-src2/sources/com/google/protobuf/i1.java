package com.google.protobuf;

/* loaded from: classes3.dex */
public final class i1 {

    /* renamed from: a, reason: collision with root package name */
    public final mg.l f34875a;

    public i1(t2 t2Var, t2 t2Var2, r90.b bVar) {
        this.f34875a = new mg.l(21, t2Var, t2Var2, bVar);
    }

    public static int b(mg.l lVar, Object obj, Object obj2) {
        return b0.c((t2) lVar.f76310c, 2, obj2) + b0.c((t2) lVar.f76309b, 1, obj);
    }

    public static void d(t tVar, mg.l lVar, Object obj, Object obj2) {
        b0.z(tVar, (t2) lVar.f76309b, 1, obj);
        b0.z(tVar, (t2) lVar.f76310c, 2, obj2);
    }

    public final int a(int i5, Object obj, Object obj2) {
        int iG = t.G(i5);
        int iB = b(this.f34875a, obj, obj2);
        return t.H(iB) + iB + iG;
    }

    public final mg.l c() {
        return this.f34875a;
    }
}
