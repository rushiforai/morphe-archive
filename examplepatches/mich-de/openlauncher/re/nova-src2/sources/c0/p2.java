package c0;

/* loaded from: classes2.dex */
public final class p2 implements m2 {

    /* renamed from: a, reason: collision with root package name */
    public final l2 f18923a;

    /* renamed from: b, reason: collision with root package name */
    public final x0 f18924b;

    /* renamed from: c, reason: collision with root package name */
    public final long f18925c;

    /* renamed from: d, reason: collision with root package name */
    public final long f18926d;

    public p2(l2 l2Var, x0 x0Var, long j11) {
        this.f18923a = l2Var;
        this.f18924b = x0Var;
        this.f18925c = (l2Var.n() + l2Var.l()) * 1000000;
        this.f18926d = j11 * 1000000;
    }

    @Override // c0.j2
    public final long b(s sVar, s sVar2, s sVar3) {
        return (5 * this.f18925c) - this.f18926d;
    }

    public final long c(long j11) {
        long j12 = j11 + this.f18926d;
        if (j12 <= 0) {
            return 0L;
        }
        long j13 = this.f18925c;
        long jMin = Math.min(j12 / j13, 5 - 1);
        return (this.f18924b == x0.f19005a || jMin % ((long) 2) == 0) ? j12 - (jMin * j13) : ((jMin + 1) * j13) - j12;
    }

    public final s d(long j11, s sVar, s sVar2, s sVar3) {
        long j12 = this.f18926d;
        long j13 = j11 + j12;
        long j14 = this.f18925c;
        return j13 > j14 ? p(j14 - j12, sVar, sVar2, sVar3) : sVar2;
    }

    @Override // c0.j2
    public final s k(long j11, s sVar, s sVar2, s sVar3) {
        return this.f18923a.k(c(j11), sVar, sVar2, d(j11, sVar, sVar3, sVar2));
    }

    @Override // c0.j2
    public final s p(long j11, s sVar, s sVar2, s sVar3) {
        return this.f18923a.p(c(j11), sVar, sVar2, d(j11, sVar, sVar3, sVar2));
    }
}
