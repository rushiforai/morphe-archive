package cp;

/* loaded from: classes4.dex */
public final class l extends z {

    /* renamed from: a, reason: collision with root package name */
    public z f47753a;

    @Override // cp.z
    public final Object b(kp.a aVar) {
        z zVar = this.f47753a;
        if (zVar != null) {
            return zVar.b(aVar);
        }
        throw new IllegalStateException("Adapter for type with cyclic dependency has been used before dependency has been resolved");
    }

    @Override // cp.z
    public final void c(kp.b bVar, Object obj) {
        z zVar = this.f47753a;
        if (zVar == null) {
            throw new IllegalStateException("Adapter for type with cyclic dependency has been used before dependency has been resolved");
        }
        zVar.c(bVar, obj);
    }
}
