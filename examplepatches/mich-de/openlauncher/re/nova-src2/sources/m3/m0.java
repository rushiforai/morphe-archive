package m3;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class m0 {

    /* renamed from: a, reason: collision with root package name */
    public final g0 f75936a;

    /* renamed from: b, reason: collision with root package name */
    public final g0 f75937b;

    /* renamed from: c, reason: collision with root package name */
    public final g0 f75938c;

    /* renamed from: d, reason: collision with root package name */
    public final g0 f75939d;

    public m0(g0 g0Var, g0 g0Var2, g0 g0Var3, g0 g0Var4) {
        this.f75936a = g0Var;
        this.f75937b = g0Var2;
        this.f75938c = g0Var3;
        this.f75939d = g0Var4;
    }

    public final g0 a() {
        return this.f75937b;
    }

    public final g0 b() {
        return this.f75938c;
    }

    public final g0 c() {
        return this.f75939d;
    }

    public final g0 d() {
        return this.f75936a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof m0)) {
            return false;
        }
        m0 m0Var = (m0) obj;
        return Intrinsics.b(this.f75936a, m0Var.f75936a) && Intrinsics.b(this.f75937b, m0Var.f75937b) && Intrinsics.b(this.f75938c, m0Var.f75938c) && Intrinsics.b(this.f75939d, m0Var.f75939d);
    }

    public final int hashCode() {
        g0 g0Var = this.f75936a;
        int iHashCode = (g0Var != null ? g0Var.hashCode() : 0) * 31;
        g0 g0Var2 = this.f75937b;
        int iHashCode2 = (iHashCode + (g0Var2 != null ? g0Var2.hashCode() : 0)) * 31;
        g0 g0Var3 = this.f75938c;
        int iHashCode3 = (iHashCode2 + (g0Var3 != null ? g0Var3.hashCode() : 0)) * 31;
        g0 g0Var4 = this.f75939d;
        return iHashCode3 + (g0Var4 != null ? g0Var4.hashCode() : 0);
    }
}
