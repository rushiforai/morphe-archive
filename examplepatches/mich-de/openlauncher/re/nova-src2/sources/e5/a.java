package e5;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public int f52167a;

    /* renamed from: b, reason: collision with root package name */
    public int f52168b;

    /* renamed from: c, reason: collision with root package name */
    public float f52169c;

    /* renamed from: d, reason: collision with root package name */
    public long f52170d;

    /* renamed from: e, reason: collision with root package name */
    public long f52171e;

    /* renamed from: f, reason: collision with root package name */
    public long f52172f;

    /* renamed from: g, reason: collision with root package name */
    public float f52173g;

    /* renamed from: h, reason: collision with root package name */
    public int f52174h;

    public final float a(long j11) {
        if (j11 < this.f52170d) {
            return 0.0f;
        }
        long j12 = this.f52172f;
        if (j12 < 0 || j11 < j12) {
            return e.b((j11 - r0) / this.f52167a, 0.0f, 1.0f) * 0.5f;
        }
        float f11 = this.f52173g;
        return (e.b((j11 - j12) / this.f52174h, 0.0f, 1.0f) * f11) + (1.0f - f11);
    }
}
