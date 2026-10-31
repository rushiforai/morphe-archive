package ok;

/* loaded from: classes3.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final long f80486a;

    public n(long j11) {
        this.f80486a = j11;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        return (obj instanceof n) && this.f80486a == ((n) obj).f80486a;
    }

    public final int hashCode() {
        long j11 = this.f80486a;
        return (((int) ((j11 >>> 32) ^ j11)) ^ 1000003) * 1000003;
    }

    public final String toString() {
        return a2.c.i(this.f80486a, ", webViewRequestMode=0}", new StringBuilder("PrepareIntegrityTokenRequest{cloudProjectNumber="));
    }
}
