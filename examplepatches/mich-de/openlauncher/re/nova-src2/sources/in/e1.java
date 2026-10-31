package in;

import com.google.gson.Gson;

/* loaded from: classes.dex */
public final class e1 implements com.google.gson.i0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61682a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Class f61683b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.google.gson.h0 f61684c;

    public /* synthetic */ e1(Class cls, com.google.gson.h0 h0Var, int i5) {
        this.f61682a = i5;
        this.f61683b = cls;
        this.f61684c = h0Var;
    }

    @Override // com.google.gson.i0
    public final com.google.gson.h0 a(Gson gson, mn.a aVar) {
        switch (this.f61682a) {
            case 0:
                if (aVar.f76504a == this.f61683b) {
                    return this.f61684c;
                }
                return null;
            default:
                Class<?> cls = aVar.f76504a;
                if (this.f61683b.isAssignableFrom(cls)) {
                    return new c(this, cls);
                }
                return null;
        }
    }

    public final String toString() {
        switch (this.f61682a) {
            case 0:
                return "Factory[type=" + this.f61683b.getName() + ",adapter=" + this.f61684c + "]";
            default:
                return "Factory[typeHierarchy=" + this.f61683b.getName() + ",adapter=" + this.f61684c + "]";
        }
    }
}
