package y0;

import c4.f0;

/* loaded from: classes2.dex */
public final class n implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final cm.f f96536a;

    /* renamed from: b, reason: collision with root package name */
    public y3.m f96537b;

    /* renamed from: c, reason: collision with root package name */
    public y3.n f96538c;

    /* renamed from: d, reason: collision with root package name */
    public y3.m f96539d;

    /* renamed from: e, reason: collision with root package name */
    public y3.k f96540e;

    public n(cm.f fVar) {
        this.f96536a = fVar;
    }

    @Override // c4.f0
    public final long s(y3.l lVar, long j11, y3.n nVar, long j12) {
        y3.k kVar = this.f96540e;
        if (kVar != null) {
            y3.m mVar = this.f96537b;
            if ((mVar == null ? false : y3.m.a(mVar.f96611a, j11)) && this.f96538c == nVar) {
                y3.m mVar2 = this.f96539d;
                if (mVar2 != null ? y3.m.a(mVar2.f96611a, j12) : false) {
                    return kVar.f96605a;
                }
            }
        }
        long jS = this.f96536a.s(lVar, j11, nVar, j12);
        this.f96537b = new y3.m(j11);
        this.f96538c = nVar;
        this.f96539d = new y3.m(j12);
        this.f96540e = new y3.k(jS);
        return jS;
    }
}
