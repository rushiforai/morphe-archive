package hn;

import java.lang.reflect.Method;

/* loaded from: classes3.dex */
public final class u extends w {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Method f59949b;

    public u(Method method) {
        this.f59949b = method;
    }

    @Override // hn.w
    public final Object a(Class cls) {
        String strA = c.a(cls);
        if (strA != null) {
            throw new AssertionError("UnsafeAllocator is used for non-instantiable type: ".concat(strA));
        }
        return this.f59949b.invoke(null, cls, Object.class);
    }
}
