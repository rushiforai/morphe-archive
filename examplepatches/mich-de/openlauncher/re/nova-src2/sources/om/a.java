package om;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public String f80500a;

    /* renamed from: b, reason: collision with root package name */
    public long f80501b;

    /* renamed from: c, reason: collision with root package name */
    public long f80502c;

    /* renamed from: d, reason: collision with root package name */
    public byte f80503d;

    public final b a() {
        String str;
        if (this.f80503d == 3 && (str = this.f80500a) != null) {
            return new b(str, this.f80501b, this.f80502c);
        }
        StringBuilder sb2 = new StringBuilder();
        if (this.f80500a == null) {
            sb2.append(" token");
        }
        if ((this.f80503d & 1) == 0) {
            sb2.append(" tokenExpirationTimestamp");
        }
        if ((this.f80503d & 2) == 0) {
            sb2.append(" tokenCreationTimestamp");
        }
        throw new IllegalStateException(a2.c.k("Missing required properties:", sb2));
    }

    public final void b(String str) {
        if (str == null) {
            throw new NullPointerException("Null token");
        }
        this.f80500a = str;
    }

    public final void c(long j11) {
        this.f80502c = j11;
        this.f80503d = (byte) (this.f80503d | 2);
    }

    public final void d(long j11) {
        this.f80501b = j11;
        this.f80503d = (byte) (this.f80503d | 1);
    }
}
