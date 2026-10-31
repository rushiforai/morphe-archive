package hn;

import java.lang.reflect.Method;

/* loaded from: classes3.dex */
public final class t extends w {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Method f59947b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f59948c;

    public t(Method method, int i5) {
        this.f59947b = method;
        this.f59948c = i5;
    }

    @Override // hn.w
    public final Object a(Class cls) {
        String strA = c.a(cls);
        if (strA != null) {
            throw new AssertionError("UnsafeAllocator is used for non-instantiable type: ".concat(strA));
        }
        return this.f59947b.invoke(null, cls, Integer.valueOf(this.f59948c));
    }
}
