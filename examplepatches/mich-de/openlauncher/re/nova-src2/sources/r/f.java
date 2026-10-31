package r;

/* loaded from: classes2.dex */
public final class f implements q.v {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i f84703a;

    @Override // q.v
    public void b(q.k kVar, boolean z11) {
        if (kVar instanceof q.c0) {
            ((q.c0) kVar).f83190z.k().c(false);
        }
        q.v vVar = this.f84703a.f84729e;
        if (vVar != null) {
            vVar.b(kVar, z11);
        }
    }

    @Override // q.v
    public boolean m(q.k kVar) {
        i iVar = this.f84703a;
        if (kVar == iVar.f84727c) {
            return false;
        }
        ((q.c0) kVar).A.getClass();
        iVar.getClass();
        q.v vVar = iVar.f84729e;
        if (vVar != null) {
            return vVar.m(kVar);
        }
        return false;
    }
}
