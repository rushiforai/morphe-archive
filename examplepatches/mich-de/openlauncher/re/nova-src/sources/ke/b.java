package ke;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final long f71377a;

    /* renamed from: b, reason: collision with root package name */
    public final long f71378b;

    /* renamed from: c, reason: collision with root package name */
    public final long f71379c;

    /* renamed from: d, reason: collision with root package name */
    public long f71380d = 0;

    /* renamed from: e, reason: collision with root package name */
    public long f71381e;

    /* renamed from: f, reason: collision with root package name */
    public long f71382f;

    /* renamed from: g, reason: collision with root package name */
    public long f71383g;

    /* renamed from: h, reason: collision with root package name */
    public long f71384h;

    public b(long j11, long j12, long j13, long j14, long j15, long j16) {
        this.f71377a = j11;
        this.f71378b = j12;
        this.f71381e = j13;
        this.f71382f = j14;
        this.f71383g = j15;
        this.f71379c = j16;
        this.f71384h = a(j12, 0L, j13, j14, j15, j16);
    }

    public static long a(long j11, long j12, long j13, long j14, long j15, long j16) {
        if (j14 + 1 >= j15 || j12 + 1 >= j13) {
            return j14;
        }
        long j17 = (long) ((j11 - j12) * ((j15 - j14) / (j13 - j12)));
        return wf.v.i(((j17 + j14) - j16) - (j17 / 20), j14, j15 - 1);
    }
}
