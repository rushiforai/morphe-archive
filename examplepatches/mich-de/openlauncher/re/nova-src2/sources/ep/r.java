package ep;

import e1.m0;
import java.lang.reflect.Method;

/* loaded from: classes4.dex */
public final class r extends u {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Method f52900b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f52901c;

    public r(Method method, int i5) {
        this.f52900b = method;
        this.f52901c = i5;
    }

    @Override // ep.u
    public final Object a(Class cls) {
        String strC = m0.c(cls);
        if (strC != null) {
            throw new AssertionError("UnsafeAllocator is used for non-instantiable type: ".concat(strC));
        }
        return this.f52900b.invoke(null, cls, Integer.valueOf(this.f52901c));
    }
}
