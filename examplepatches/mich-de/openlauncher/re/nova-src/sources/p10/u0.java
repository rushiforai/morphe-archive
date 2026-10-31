package p10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u0 {

    /* renamed from: a, reason: collision with root package name */
    public final t0 f81929a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f81930b;

    public u0(t0 t0Var, boolean z11) {
        this.f81929a = t0Var;
        this.f81930b = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u0)) {
            return false;
        }
        u0 u0Var = (u0) obj;
        return Intrinsics.b(this.f81929a, u0Var.f81929a) && this.f81930b == u0Var.f81930b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f81930b) + (this.f81929a.hashCode() * 31);
    }

    public final String toString() {
        return "RewardOption(reward=" + this.f81929a + ", affordable=" + this.f81930b + ")";
    }
}
