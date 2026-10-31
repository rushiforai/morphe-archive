package b9;

import x8.l;
import x8.r;

/* loaded from: classes.dex */
public final class d implements f {

    /* renamed from: a, reason: collision with root package name */
    public final g f17645a;

    /* renamed from: b, reason: collision with root package name */
    public final l f17646b;

    public d(g gVar, l lVar) {
        this.f17645a = gVar;
        this.f17646b = lVar;
    }

    @Override // b9.f
    public final void a() {
        l lVar = this.f17646b;
        boolean z11 = lVar instanceof r;
        g gVar = this.f17645a;
        if (z11) {
            gVar.g(((r) lVar).f95367a);
        } else if (lVar instanceof x8.e) {
            gVar.u(((x8.e) lVar).f95299a);
        }
    }
}
