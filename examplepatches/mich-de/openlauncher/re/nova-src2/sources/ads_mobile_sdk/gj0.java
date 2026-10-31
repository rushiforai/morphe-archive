package ads_mobile_sdk;

/* loaded from: classes.dex */
public final class gj0 implements b.m5, b.w4 {

    /* renamed from: c, reason: collision with root package name */
    public static final Object f3860c = new Object();

    /* renamed from: a, reason: collision with root package name */
    public volatile b.m5 f3861a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Object f3862b = f3860c;

    public gj0(b.m5 m5Var) {
        this.f3861a = m5Var;
    }

    public static b.w4 a(b.m5 m5Var) {
        if (m5Var instanceof b.w4) {
            return (b.w4) m5Var;
        }
        m5Var.getClass();
        return new gj0(m5Var);
    }

    @Override // b.m5
    public final Object get() {
        Object obj;
        Object obj2 = this.f3862b;
        Object obj3 = f3860c;
        if (obj2 != obj3) {
            return obj2;
        }
        synchronized (this) {
            try {
                obj = this.f3862b;
                if (obj == obj3) {
                    obj = this.f3861a.get();
                    Object obj4 = this.f3862b;
                    if (obj4 != obj3 && obj4 != obj) {
                        throw new IllegalStateException("Scoped provider was invoked recursively returning different results: " + obj4 + " & " + obj + ". This is likely due to a circular dependency.");
                    }
                    this.f3862b = obj;
                    this.f3861a = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return obj;
    }
}
