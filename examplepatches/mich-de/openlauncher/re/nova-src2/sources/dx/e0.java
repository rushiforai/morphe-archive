package dx;

import b.c9;

/* loaded from: classes4.dex */
public final class e0 implements g0 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f49696a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f49697b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f49698c;

    public e0(boolean z11, boolean z12, boolean z13) {
        this.f49696a = z11;
        this.f49697b = z12;
        this.f49698c = z13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e0)) {
            return false;
        }
        e0 e0Var = (e0) obj;
        return this.f49696a == e0Var.f49696a && this.f49697b == e0Var.f49697b && this.f49698c == e0Var.f49698c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f49698c) + c9.f(Boolean.hashCode(this.f49696a) * 31, 31, this.f49697b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Resolved(adUserData=");
        sb2.append(this.f49696a);
        sb2.append(", adPersonalization=");
        sb2.append(this.f49697b);
        sb2.append(", deviceStorage=");
        return a80.m.k(sb2, this.f49698c, ")");
    }
}
