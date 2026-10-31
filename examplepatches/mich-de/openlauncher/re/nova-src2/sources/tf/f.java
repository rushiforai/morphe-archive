package tf;

import fe.k0;
import xk.g0;

/* loaded from: classes3.dex */
public final class f implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f89084a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f89085b;

    public f(k0 k0Var, int i5) {
        this.f89084a = (k0Var.f54875d & 1) != 0;
        this.f89085b = o.H(i5, false);
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        f fVar = (f) obj;
        return g0.f95916a.d(this.f89085b, fVar.f89085b).d(this.f89084a, fVar.f89084a).f();
    }
}
