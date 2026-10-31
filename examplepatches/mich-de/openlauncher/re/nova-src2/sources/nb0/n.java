package nb0;

import b00.z0;

/* loaded from: classes.dex */
public final class n implements ib0.b {

    /* renamed from: a, reason: collision with root package name */
    public final z0 f78137a;

    public n(z0 z0Var) {
        this.f78137a = z0Var;
    }

    @Override // mb0.b
    /* renamed from: b */
    public final void mo5b(Object obj) {
        ib0.h hVar = (ib0.h) obj;
        int iF = b.c0.F(3);
        h iVar = iF != 0 ? iF != 1 ? iF != 3 ? iF != 4 ? new i(hVar, rb0.d.f85780a) : new i(hVar) : new j(hVar) : new k(hVar) : new m(hVar);
        hVar.d(iVar);
        hVar.g(iVar);
        this.f78137a.mo5b(iVar);
    }
}
