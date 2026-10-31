package xk;

import java.io.Serializable;

/* loaded from: classes.dex */
public final class c1 implements p2, Serializable {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f95883c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final transient v0 f95884a;

    /* renamed from: b, reason: collision with root package name */
    public final transient v0 f95885b;

    static {
        l0 l0Var = v0.f96030b;
        r2 r2Var = r2.f96007e;
    }

    public c1(r2 r2Var, r2 r2Var2) {
        this.f95884a = r2Var;
        this.f95885b = r2Var2;
    }

    public final x0 a() {
        v0 v0Var = this.f95884a;
        if (v0Var.isEmpty()) {
            return w2.f96042g;
        }
        n2 n2Var = n2.f95978c;
        return new i1(new a3(v0Var, i2.f95938c), this.f95885b);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof p2)) {
            return false;
        }
        return vm.d.f(((c1) ((p2) obj)).a(), a());
    }

    public final int hashCode() {
        return a().hashCode();
    }

    public final String toString() {
        return a().toString();
    }
}
