package p10;

/* loaded from: classes4.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f81740a;

    /* renamed from: b, reason: collision with root package name */
    public final int f81741b;

    public d0(long j11, int i5) {
        this.f81740a = j11;
        this.f81741b = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d0)) {
            return false;
        }
        d0 d0Var = (d0) obj;
        return this.f81740a == d0Var.f81740a && this.f81741b == d0Var.f81741b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f81741b) + (Long.hashCode(this.f81740a) * 31);
    }

    public final String toString() {
        return "MerchTeaser(priceCoins=" + this.f81740a + ", minStreakDays=" + this.f81741b + ")";
    }
}
