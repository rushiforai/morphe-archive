package tk;

/* loaded from: classes3.dex */
public final class k implements m {

    /* renamed from: c, reason: collision with root package name */
    public static final Object f89430c = new Object();

    /* renamed from: a, reason: collision with root package name */
    public volatile l f89431a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Object f89432b;

    /* JADX WARN: Multi-variable type inference failed */
    public static k b(l lVar) {
        if (lVar instanceof k) {
            return (k) lVar;
        }
        k kVar = new k();
        kVar.f89432b = f89430c;
        kVar.f89431a = lVar;
        return kVar;
    }

    @Override // tk.m
    public final Object a() {
        Object objA;
        Object obj = this.f89432b;
        Object obj2 = f89430c;
        if (obj != obj2) {
            return obj;
        }
        synchronized (this) {
            try {
                objA = this.f89432b;
                if (objA == obj2) {
                    objA = this.f89431a.a();
                    Object obj3 = this.f89432b;
                    if (obj3 != obj2 && obj3 != objA) {
                        throw new IllegalStateException("Scoped provider was invoked recursively returning different results: " + obj3 + " & " + objA + ". This is likely due to a circular dependency.");
                    }
                    this.f89432b = objA;
                    this.f89431a = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return objA;
    }
}
