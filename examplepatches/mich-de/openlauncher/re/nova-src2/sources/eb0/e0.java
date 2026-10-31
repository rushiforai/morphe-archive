package eb0;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Map;

/* loaded from: classes5.dex */
public final class e0 extends w0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f52552d = 1;

    /* renamed from: e, reason: collision with root package name */
    public final Method f52553e;

    /* renamed from: f, reason: collision with root package name */
    public final int f52554f;

    /* renamed from: g, reason: collision with root package name */
    public final m f52555g;

    /* renamed from: h, reason: collision with root package name */
    public final Object f52556h;

    public e0(Method method, int i5, m mVar, String str) {
        this.f52553e = method;
        this.f52554f = i5;
        this.f52555g = mVar;
        this.f52556h = str;
    }

    @Override // eb0.w0
    public final void a(m0 m0Var, Object obj) {
        switch (this.f52552d) {
            case 0:
                if (obj == null) {
                    return;
                }
                try {
                    m0Var.c((x80.u) this.f52556h, (x80.k0) this.f52555g.convert(obj));
                    return;
                } catch (IOException e3) {
                    throw w0.o(this.f52553e, this.f52554f, "Unable to convert " + obj + " to RequestBody", e3);
                }
            default:
                Map map = (Map) obj;
                int i5 = this.f52554f;
                Method method = this.f52553e;
                if (map == null) {
                    throw w0.o(method, i5, "Part map was null.", new Object[0]);
                }
                for (Map.Entry entry : map.entrySet()) {
                    String str = (String) entry.getKey();
                    if (str == null) {
                        throw w0.o(method, i5, "Part map contained null key.", new Object[0]);
                    }
                    Object value = entry.getValue();
                    if (value == null) {
                        throw w0.o(method, i5, b.c0.l("Part map contained null value for key '", str, "'."), new Object[0]);
                    }
                    m0Var.c(v4.a.o("Content-Disposition", b.c0.l("form-data; name=\"", str, "\""), "Content-Transfer-Encoding", (String) this.f52556h), (x80.k0) this.f52555g.convert(value));
                }
                return;
        }
    }

    public e0(Method method, int i5, x80.u uVar, m mVar) {
        this.f52553e = method;
        this.f52554f = i5;
        this.f52556h = uVar;
        this.f52555g = mVar;
    }
}
