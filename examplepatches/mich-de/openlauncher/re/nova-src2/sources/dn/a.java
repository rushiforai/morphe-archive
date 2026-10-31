package dn;

/* loaded from: classes3.dex */
public final class a implements c {

    /* renamed from: c, reason: collision with root package name */
    public static final Object f49285c = new Object();

    /* renamed from: a, reason: collision with root package name */
    public volatile b f49286a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Object f49287b;

    public static c a(b bVar) {
        if (bVar instanceof a) {
            return bVar;
        }
        a aVar = new a();
        aVar.f49287b = f49285c;
        aVar.f49286a = bVar;
        return aVar;
    }

    @Override // w60.a
    public final Object get() {
        Object obj;
        Object obj2 = this.f49287b;
        Object obj3 = f49285c;
        if (obj2 != obj3) {
            return obj2;
        }
        synchronized (this) {
            obj = this.f49287b;
            if (obj == obj3) {
                obj = this.f49286a.get();
                Object obj4 = this.f49287b;
                if (obj4 != obj3 && obj4 != obj) {
                    throw new IllegalStateException("Scoped provider was invoked recursively returning different results: " + obj4 + " & " + obj + ". This is likely due to a circular dependency.");
                }
                this.f49287b = obj;
                this.f49286a = null;
            }
        }
        return obj;
    }
}
