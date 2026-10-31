package c0;

import ai.w3;

/* loaded from: classes.dex */
public final class i0 implements m {

    /* renamed from: a, reason: collision with root package name */
    public final z f18827a;

    /* renamed from: b, reason: collision with root package name */
    public final x0 f18828b;

    /* renamed from: c, reason: collision with root package name */
    public final long f18829c;

    public i0(z zVar, x0 x0Var, long j11) {
        this.f18827a = zVar;
        this.f18828b = x0Var;
        this.f18829c = j11;
    }

    @Override // c0.m
    public final j2 a(i2 i2Var) {
        return new w3(this.f18827a.a(i2Var), this.f18828b, this.f18829c);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof i0) {
            i0 i0Var = (i0) obj;
            if (i0Var.f18827a.equals(this.f18827a) && i0Var.f18828b == this.f18828b && i0Var.f18829c == this.f18829c) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f18829c) + ((this.f18828b.hashCode() + (this.f18827a.hashCode() * 31)) * 31);
    }
}
