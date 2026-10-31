package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u0 implements w0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f49799a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49800b;

    public u0(int i5, String type) {
        Intrinsics.g(type, "type");
        this.f49799a = i5;
        this.f49800b = type;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u0)) {
            return false;
        }
        u0 u0Var = (u0) obj;
        return this.f49799a == u0Var.f49799a && Intrinsics.b(this.f49800b, u0Var.f49800b);
    }

    public final int hashCode() {
        return this.f49800b.hashCode() + (Integer.hashCode(this.f49799a) * 31);
    }

    public final String toString() {
        return "Earned(amount=" + this.f49799a + ", type=" + this.f49800b + ")";
    }
}
