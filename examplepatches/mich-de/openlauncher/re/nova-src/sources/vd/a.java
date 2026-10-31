package vd;

/* loaded from: classes.dex */
public final class a implements w60.a {

    /* renamed from: c, reason: collision with root package name */
    public static final Object f92588c = new Object();

    /* renamed from: a, reason: collision with root package name */
    public volatile b f92589a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Object f92590b;

    public static w60.a a(b bVar) {
        if (bVar instanceof a) {
            return bVar;
        }
        a aVar = new a();
        aVar.f92590b = f92588c;
        aVar.f92589a = bVar;
        return aVar;
    }

    @Override // w60.a
    public final Object get() {
        Object obj;
        Object obj2 = this.f92590b;
        Object obj3 = f92588c;
        if (obj2 != obj3) {
            return obj2;
        }
        synchronized (this) {
            try {
                obj = this.f92590b;
                if (obj == obj3) {
                    obj = this.f92589a.get();
                    Object obj4 = this.f92590b;
                    if (obj4 != obj3 && obj4 != obj) {
                        throw new IllegalStateException("Scoped provider was invoked recursively returning different results: " + obj4 + " & " + obj + ". This is likely due to a circular dependency.");
                    }
                    this.f92590b = obj;
                    this.f92589a = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return obj;
    }
}
