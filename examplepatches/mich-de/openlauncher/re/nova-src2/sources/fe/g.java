package fe;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final long f54780a;

    /* renamed from: b, reason: collision with root package name */
    public final long f54781b;

    /* renamed from: c, reason: collision with root package name */
    public long f54782c = -9223372036854775807L;

    /* renamed from: d, reason: collision with root package name */
    public long f54783d = -9223372036854775807L;

    /* renamed from: f, reason: collision with root package name */
    public long f54785f = -9223372036854775807L;

    /* renamed from: g, reason: collision with root package name */
    public long f54786g = -9223372036854775807L;

    /* renamed from: j, reason: collision with root package name */
    public float f54789j = 0.97f;

    /* renamed from: i, reason: collision with root package name */
    public float f54788i = 1.03f;

    /* renamed from: k, reason: collision with root package name */
    public float f54790k = 1.0f;

    /* renamed from: l, reason: collision with root package name */
    public long f54791l = -9223372036854775807L;

    /* renamed from: e, reason: collision with root package name */
    public long f54784e = -9223372036854775807L;

    /* renamed from: h, reason: collision with root package name */
    public long f54787h = -9223372036854775807L;

    /* renamed from: m, reason: collision with root package name */
    public long f54792m = -9223372036854775807L;
    public long n = -9223372036854775807L;

    public g(long j11, long j12) {
        this.f54780a = j11;
        this.f54781b = j12;
    }

    public final void a() {
        long j11 = this.f54782c;
        if (j11 != -9223372036854775807L) {
            long j12 = this.f54783d;
            if (j12 != -9223372036854775807L) {
                j11 = j12;
            }
            long j13 = this.f54785f;
            if (j13 != -9223372036854775807L && j11 < j13) {
                j11 = j13;
            }
            long j14 = this.f54786g;
            if (j14 != -9223372036854775807L && j11 > j14) {
                j11 = j14;
            }
        } else {
            j11 = -9223372036854775807L;
        }
        if (this.f54784e == j11) {
            return;
        }
        this.f54784e = j11;
        this.f54787h = j11;
        this.f54792m = -9223372036854775807L;
        this.n = -9223372036854775807L;
        this.f54791l = -9223372036854775807L;
    }
}
