package c0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class n1 implements j2 {

    /* renamed from: a, reason: collision with root package name */
    public final j2 f18887a;

    /* renamed from: b, reason: collision with root package name */
    public final long f18888b;

    public n1(j2 j2Var, long j11) {
        this.f18887a = j2Var;
        this.f18888b = j11;
    }

    @Override // c0.j2
    public final boolean a() {
        return this.f18887a.a();
    }

    @Override // c0.j2
    public final long b(s sVar, s sVar2, s sVar3) {
        return this.f18887a.b(sVar, sVar2, sVar3) + this.f18888b;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof n1)) {
            return false;
        }
        n1 n1Var = (n1) obj;
        return n1Var.f18888b == this.f18888b && Intrinsics.b(n1Var.f18887a, this.f18887a);
    }

    public final int hashCode() {
        return Long.hashCode(this.f18888b) + (this.f18887a.hashCode() * 31);
    }

    @Override // c0.j2
    public final s k(long j11, s sVar, s sVar2, s sVar3) {
        long j12 = this.f18888b;
        return j11 < j12 ? sVar : this.f18887a.k(j11 - j12, sVar, sVar2, sVar3);
    }

    @Override // c0.j2
    public final s p(long j11, s sVar, s sVar2, s sVar3) {
        long j12 = this.f18888b;
        return j11 < j12 ? sVar3 : this.f18887a.p(j11 - j12, sVar, sVar2, sVar3);
    }
}
