package s40;

/* loaded from: classes4.dex */
public final class c implements h, r40.a {

    /* renamed from: c, reason: collision with root package name */
    public static final Object f86655c = new Object();

    /* renamed from: a, reason: collision with root package name */
    public volatile h f86656a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Object f86657b = f86655c;

    public c(h hVar) {
        this.f86656a = hVar;
    }

    public static r40.a a(h hVar) {
        if (hVar instanceof r40.a) {
            return (r40.a) hVar;
        }
        hVar.getClass();
        return new c(hVar);
    }

    public static h b(h hVar) {
        hVar.getClass();
        return hVar instanceof c ? hVar : new c(hVar);
    }

    @Override // w60.a
    public final Object get() {
        Object obj;
        Object obj2 = this.f86657b;
        Object obj3 = f86655c;
        if (obj2 != obj3) {
            return obj2;
        }
        synchronized (this) {
            obj = this.f86657b;
            if (obj == obj3) {
                obj = this.f86656a.get();
                Object obj4 = this.f86657b;
                if (obj4 != obj3 && obj4 != obj) {
                    throw new IllegalStateException("Scoped provider was invoked recursively returning different results: " + obj4 + " & " + obj + ". This is likely due to a circular dependency.");
                }
                this.f86657b = obj;
                this.f86656a = null;
            }
        }
        return obj;
    }
}
