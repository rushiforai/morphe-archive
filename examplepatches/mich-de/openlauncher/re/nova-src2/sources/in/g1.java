package in;

import com.google.gson.Gson;

/* loaded from: classes.dex */
public final class g1 implements com.google.gson.i0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Class f61692a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Class f61693b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.google.gson.h0 f61694c;

    public g1(Class cls, Class cls2, com.google.gson.h0 h0Var) {
        this.f61692a = cls;
        this.f61693b = cls2;
        this.f61694c = h0Var;
    }

    @Override // com.google.gson.i0
    public final com.google.gson.h0 a(Gson gson, mn.a aVar) {
        Class cls = aVar.f76504a;
        if (cls == this.f61692a || cls == this.f61693b) {
            return this.f61694c;
        }
        return null;
    }

    public final String toString() {
        return "Factory[type=" + this.f61693b.getName() + "+" + this.f61692a.getName() + ",adapter=" + this.f61694c + "]";
    }
}
