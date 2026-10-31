package pm;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public String f82656a;

    /* renamed from: b, reason: collision with root package name */
    public int f82657b;

    /* renamed from: c, reason: collision with root package name */
    public String f82658c;

    /* renamed from: d, reason: collision with root package name */
    public String f82659d;

    /* renamed from: e, reason: collision with root package name */
    public long f82660e;

    /* renamed from: f, reason: collision with root package name */
    public long f82661f;

    /* renamed from: g, reason: collision with root package name */
    public String f82662g;

    /* renamed from: h, reason: collision with root package name */
    public byte f82663h;

    public final b a() {
        if (this.f82663h == 3 && this.f82657b != 0) {
            return new b(this.f82656a, this.f82657b, this.f82658c, this.f82659d, this.f82660e, this.f82661f, this.f82662g);
        }
        StringBuilder sb2 = new StringBuilder();
        if (this.f82657b == 0) {
            sb2.append(" registrationStatus");
        }
        if ((this.f82663h & 1) == 0) {
            sb2.append(" expiresInSecs");
        }
        if ((this.f82663h & 2) == 0) {
            sb2.append(" tokenCreationEpochInSecs");
        }
        throw new IllegalStateException(a2.c.k("Missing required properties:", sb2));
    }
}
