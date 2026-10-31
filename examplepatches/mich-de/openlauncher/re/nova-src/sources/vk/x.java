package vk;

/* loaded from: classes.dex */
public final class x implements u {

    /* renamed from: c, reason: collision with root package name */
    public static final w f92836c = new w();

    /* renamed from: a, reason: collision with root package name */
    public volatile u f92837a;

    /* renamed from: b, reason: collision with root package name */
    public Object f92838b;

    @Override // vk.u
    public final Object get() {
        u uVar = this.f92837a;
        w wVar = f92836c;
        if (uVar != wVar) {
            synchronized (this) {
                try {
                    if (this.f92837a != wVar) {
                        Object obj = this.f92837a.get();
                        this.f92838b = obj;
                        this.f92837a = wVar;
                        return obj;
                    }
                } finally {
                }
            }
        }
        return this.f92838b;
    }

    public final String toString() {
        Object obj = this.f92837a;
        StringBuilder sb2 = new StringBuilder("Suppliers.memoize(");
        if (obj == f92836c) {
            obj = "<supplier that returned " + this.f92838b + ">";
        }
        sb2.append(obj);
        sb2.append(")");
        return sb2.toString();
    }
}
