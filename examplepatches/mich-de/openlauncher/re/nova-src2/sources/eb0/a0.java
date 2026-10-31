package eb0;

import java.io.IOException;
import java.lang.reflect.Method;

/* loaded from: classes5.dex */
public final class a0 extends w0 {

    /* renamed from: d, reason: collision with root package name */
    public final Method f52537d;

    /* renamed from: e, reason: collision with root package name */
    public final int f52538e;

    /* renamed from: f, reason: collision with root package name */
    public final m f52539f;

    public a0(Method method, int i5, m mVar) {
        this.f52537d = method;
        this.f52538e = i5;
        this.f52539f = mVar;
    }

    @Override // eb0.w0
    public final void a(m0 m0Var, Object obj) {
        int i5 = this.f52538e;
        Method method = this.f52537d;
        if (obj == null) {
            throw w0.o(method, i5, "Body parameter value must not be null.", new Object[0]);
        }
        try {
            m0Var.f52589k = (x80.k0) this.f52539f.convert(obj);
        } catch (IOException e3) {
            throw w0.p(method, e3, i5, "Unable to convert " + obj + " to RequestBody", new Object[0]);
        }
    }
}
