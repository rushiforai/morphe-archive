package om;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f80504a;

    /* renamed from: b, reason: collision with root package name */
    public final long f80505b;

    /* renamed from: c, reason: collision with root package name */
    public final long f80506c;

    public b(String str, long j11, long j12) {
        this.f80504a = str;
        this.f80505b = j11;
        this.f80506c = j12;
    }

    public static a a() {
        return new a();
    }

    public final String b() {
        return this.f80504a;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof b) {
            b bVar = (b) obj;
            if (this.f80504a.equals(bVar.f80504a) && this.f80505b == bVar.f80505b && this.f80506c == bVar.f80506c) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (this.f80504a.hashCode() ^ 1000003) * 1000003;
        long j11 = this.f80505b;
        long j12 = this.f80506c;
        return ((iHashCode ^ ((int) (j11 ^ (j11 >>> 32)))) * 1000003) ^ ((int) (j12 ^ (j12 >>> 32)));
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("InstallationTokenResult{token=");
        sb2.append(this.f80504a);
        sb2.append(", tokenExpirationTimestamp=");
        sb2.append(this.f80505b);
        sb2.append(", tokenCreationTimestamp=");
        return a2.c.i(this.f80506c, "}", sb2);
    }
}
