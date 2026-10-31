package ep;

import e1.m0;
import java.lang.reflect.Method;

/* loaded from: classes4.dex */
public final class q extends u {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Method f52898b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f52899c;

    public q(Method method, Object obj) {
        this.f52898b = method;
        this.f52899c = obj;
    }

    @Override // ep.u
    public final Object a(Class cls) {
        String strC = m0.c(cls);
        if (strC != null) {
            throw new AssertionError("UnsafeAllocator is used for non-instantiable type: ".concat(strC));
        }
        return this.f52898b.invoke(this.f52899c, cls);
    }
}
