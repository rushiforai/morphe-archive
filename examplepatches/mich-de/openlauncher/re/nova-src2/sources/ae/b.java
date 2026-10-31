package ae;

import java.util.Set;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final long f12737a;

    /* renamed from: b, reason: collision with root package name */
    public final long f12738b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f12739c;

    public b(long j11, long j12, Set set) {
        this.f12737a = j11;
        this.f12738b = j12;
        this.f12739c = set;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof b) {
            b bVar = (b) obj;
            if (this.f12737a == bVar.f12737a && this.f12738b == bVar.f12738b && this.f12739c.equals(bVar.f12739c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        long j11 = this.f12737a;
        int i5 = (((int) (j11 ^ (j11 >>> 32))) ^ 1000003) * 1000003;
        long j12 = this.f12738b;
        return ((i5 ^ ((int) ((j12 >>> 32) ^ j12))) * 1000003) ^ this.f12739c.hashCode();
    }

    public final String toString() {
        return "ConfigValue{delta=" + this.f12737a + ", maxAllowedDelay=" + this.f12738b + ", flags=" + this.f12739c + "}";
    }
}
