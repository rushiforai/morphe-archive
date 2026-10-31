package ul;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final long f91310a;

    /* renamed from: b, reason: collision with root package name */
    public final long f91311b;

    /* renamed from: c, reason: collision with root package name */
    public final long f91312c;

    public a(long j11, long j12, long j13) {
        this.f91310a = j11;
        this.f91311b = j12;
        this.f91312c = j13;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof a) {
            a aVar = (a) obj;
            if (this.f91310a == aVar.f91310a && this.f91311b == aVar.f91311b && this.f91312c == aVar.f91312c) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        long j11 = this.f91310a;
        long j12 = this.f91311b;
        int i5 = (((((int) (j11 ^ (j11 >>> 32))) ^ 1000003) * 1000003) ^ ((int) (j12 ^ (j12 >>> 32)))) * 1000003;
        long j13 = this.f91312c;
        return i5 ^ ((int) ((j13 >>> 32) ^ j13));
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("StartupTime{epochMillis=");
        sb2.append(this.f91310a);
        sb2.append(", elapsedRealtime=");
        sb2.append(this.f91311b);
        sb2.append(", uptimeMillis=");
        return a2.c.i(this.f91312c, "}", sb2);
    }
}
