package s40;

/* loaded from: classes4.dex */
public final class b implements d {

    /* renamed from: a, reason: collision with root package name */
    public h f86654a;

    public static void a(h hVar, h hVar2) {
        b bVar = (b) hVar;
        if (bVar.f86654a != null) {
            throw new IllegalStateException();
        }
        bVar.f86654a = hVar2;
    }

    @Override // w60.a
    public final Object get() {
        h hVar = this.f86654a;
        if (hVar != null) {
            return hVar.get();
        }
        throw new IllegalStateException();
    }
}
