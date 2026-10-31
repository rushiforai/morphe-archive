package c0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class m1 implements m {

    /* renamed from: a, reason: collision with root package name */
    public final m f18875a;

    /* renamed from: b, reason: collision with root package name */
    public final long f18876b;

    public m1(c0 c0Var, long j11) {
        this.f18875a = c0Var;
        this.f18876b = j11;
    }

    @Override // c0.m
    public final j2 a(i2 i2Var) {
        return new n1(this.f18875a.a(i2Var), this.f18876b);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof m1)) {
            return false;
        }
        m1 m1Var = (m1) obj;
        return m1Var.f18876b == this.f18876b && Intrinsics.b(m1Var.f18875a, this.f18875a);
    }

    public final int hashCode() {
        return Long.hashCode(this.f18876b) + (this.f18875a.hashCode() * 31);
    }
}
