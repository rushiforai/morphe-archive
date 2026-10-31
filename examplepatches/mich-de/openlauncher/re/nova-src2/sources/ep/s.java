package ep;

import e1.m0;
import java.lang.reflect.Method;

/* loaded from: classes4.dex */
public final class s extends u {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Method f52902b;

    public s(Method method) {
        this.f52902b = method;
    }

    @Override // ep.u
    public final Object a(Class cls) {
        String strC = m0.c(cls);
        if (strC != null) {
            throw new AssertionError("UnsafeAllocator is used for non-instantiable type: ".concat(strC));
        }
        return this.f52902b.invoke(null, cls, Object.class);
    }
}
