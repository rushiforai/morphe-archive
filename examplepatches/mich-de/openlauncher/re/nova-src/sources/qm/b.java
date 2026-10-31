package qm;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public String f84252a;

    /* renamed from: b, reason: collision with root package name */
    public long f84253b;

    /* renamed from: c, reason: collision with root package name */
    public int f84254c;

    /* renamed from: d, reason: collision with root package name */
    public byte f84255d;

    public final c a() {
        if (this.f84255d == 1) {
            return new c(this.f84252a, this.f84253b, this.f84254c);
        }
        throw new IllegalStateException("Missing required properties: tokenExpirationTimestamp");
    }

    public final void b(int i5) {
        this.f84254c = i5;
    }

    public final void c(String str) {
        this.f84252a = str;
    }

    public final void d(long j11) {
        this.f84253b = j11;
        this.f84255d = (byte) (this.f84255d | 1);
    }
}
