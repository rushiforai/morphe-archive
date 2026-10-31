package p10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f81914a;

    /* renamed from: b, reason: collision with root package name */
    public final long f81915b;

    /* renamed from: c, reason: collision with root package name */
    public final long f81916c;

    public t0(String str, long j11, long j12) {
        this.f81914a = str;
        this.f81915b = j11;
        this.f81916c = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t0)) {
            return false;
        }
        t0 t0Var = (t0) obj;
        return Intrinsics.b(this.f81914a, t0Var.f81914a) && this.f81915b == t0Var.f81915b && this.f81916c == t0Var.f81916c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f81916c) + b.c0.d(this.f81914a.hashCode() * 31, 31, this.f81915b);
    }

    public final String toString() {
        return "Reward(id=" + this.f81914a + ", durationMs=" + this.f81915b + ", cost=" + this.f81916c + ")";
    }
}
