package eb0;

import java.lang.reflect.Method;

/* loaded from: classes5.dex */
public final class d0 extends w0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f52549d;

    /* renamed from: e, reason: collision with root package name */
    public final Method f52550e;

    /* renamed from: f, reason: collision with root package name */
    public final int f52551f;

    public /* synthetic */ d0(Method method, int i5, int i11) {
        this.f52549d = i11;
        this.f52550e = method;
        this.f52551f = i5;
    }

    @Override // eb0.w0
    public final void a(m0 m0Var, Object obj) {
        switch (this.f52549d) {
            case 0:
                x80.u uVar = (x80.u) obj;
                if (uVar == null) {
                    throw w0.o(this.f52550e, this.f52551f, "Headers parameter must not be null.", new Object[0]);
                }
                o2.h hVar = m0Var.f52584f;
                hVar.getClass();
                int size = uVar.size();
                for (int i5 = 0; i5 < size; i5++) {
                    hVar.c(uVar.c(i5), uVar.e(i5));
                }
                return;
            default:
                if (obj == null) {
                    throw w0.o(this.f52550e, this.f52551f, "@Url parameter is null.", new Object[0]);
                }
                m0Var.f52581c = obj.toString();
                return;
        }
    }
}
