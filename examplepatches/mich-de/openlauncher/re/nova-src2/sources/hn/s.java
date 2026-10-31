package hn;

import java.lang.reflect.Method;

/* loaded from: classes3.dex */
public final class s extends w {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Method f59945b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f59946c;

    public s(Method method, Object obj) {
        this.f59945b = method;
        this.f59946c = obj;
    }

    @Override // hn.w
    public final Object a(Class cls) {
        String strA = c.a(cls);
        if (strA != null) {
            throw new AssertionError("UnsafeAllocator is used for non-instantiable type: ".concat(strA));
        }
        return this.f59945b.invoke(this.f59946c, cls);
    }
}
