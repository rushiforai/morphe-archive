package tk;

/* loaded from: classes3.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final int f89433a;

    /* renamed from: b, reason: collision with root package name */
    public final long f89434b;

    public n(int i5, long j11) {
        this.f89433a = i5;
        this.f89434b = j11;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        return this.f89433a == nVar.f89433a && this.f89434b == nVar.f89434b;
    }

    public final int hashCode() {
        long j11 = this.f89434b;
        return ((int) ((j11 >>> 32) ^ j11)) ^ ((this.f89433a ^ 1000003) * 1000003);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("EventRecord{eventType=");
        sb2.append(this.f89433a);
        sb2.append(", eventTimestamp=");
        return a2.c.i(this.f89434b, "}", sb2);
    }
}
