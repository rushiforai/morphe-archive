package bm;

/* loaded from: classes.dex */
public final class m implements nm.c {

    /* renamed from: c, reason: collision with root package name */
    public static final Object f18095c = new Object();

    /* renamed from: a, reason: collision with root package name */
    public volatile Object f18096a = f18095c;

    /* renamed from: b, reason: collision with root package name */
    public volatile nm.c f18097b;

    public m(nm.c cVar) {
        this.f18097b = cVar;
    }

    @Override // nm.c
    public final Object get() {
        Object obj;
        Object obj2 = this.f18096a;
        Object obj3 = f18095c;
        if (obj2 != obj3) {
            return obj2;
        }
        synchronized (this) {
            try {
                obj = this.f18096a;
                if (obj == obj3) {
                    obj = this.f18097b.get();
                    this.f18096a = obj;
                    this.f18097b = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return obj;
    }
}
