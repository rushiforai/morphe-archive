package k0;

import java.util.List;

/* loaded from: classes.dex */
public final class o implements z2.r0 {

    /* renamed from: b, reason: collision with root package name */
    public static final o f70690b = new o(0);

    /* renamed from: c, reason: collision with root package name */
    public static final o f70691c = new o(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70692a;

    public /* synthetic */ o(int i5) {
        this.f70692a = i5;
    }

    @Override // z2.r0
    public final z2.s0 e(z2.t0 t0Var, List list, long j11) {
        switch (this.f70692a) {
            case 0:
                return t0Var.y(y3.a.j(j11), y3.a.i(j11), b70.h.f17594a, new h50.i1(24));
            default:
                return t0Var.y(y3.a.f(j11) ? y3.a.h(j11) : 0, y3.a.e(j11) ? y3.a.g(j11) : 0, b70.h.f17594a, new h50.i1(26));
        }
    }
}
