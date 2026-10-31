package m;

/* loaded from: classes2.dex */
public final class o0 {

    /* renamed from: d, reason: collision with root package name */
    public static o0 f75318d;

    /* renamed from: a, reason: collision with root package name */
    public long f75319a;

    /* renamed from: b, reason: collision with root package name */
    public long f75320b;

    /* renamed from: c, reason: collision with root package name */
    public int f75321c;

    public final void a(double d5, double d11, long j11) {
        double d12 = (0.01720197f * ((j11 - 946728000000L) / 8.64E7f)) + 6.24006f;
        double dSin = (Math.sin(r3 * 3.0f) * 5.236000106378924E-6d) + (Math.sin(2.0f * r3) * 3.4906598739326E-4d) + (Math.sin(d12) * 0.03341960161924362d) + d12 + 1.796593063d + 3.141592653589793d;
        double dSin2 = (Math.sin(2.0d * dSin) * (-0.0069d)) + (Math.sin(d12) * 0.0053d) + Math.round((r2 - 9.0E-4f) - r6) + 9.0E-4f + ((-d11) / 360.0d);
        double dAsin = Math.asin(Math.sin(0.4092797040939331d) * Math.sin(dSin));
        double d13 = 0.01745329238474369d * d5;
        double dSin3 = (Math.sin(-0.10471975803375244d) - (Math.sin(dAsin) * Math.sin(d13))) / (Math.cos(dAsin) * Math.cos(d13));
        if (dSin3 >= 1.0d) {
            this.f75321c = 1;
            this.f75319a = -1L;
            this.f75320b = -1L;
        } else {
            if (dSin3 <= -1.0d) {
                this.f75321c = 0;
                this.f75319a = -1L;
                this.f75320b = -1L;
                return;
            }
            double dAcos = (float) (Math.acos(dSin3) / 6.283185307179586d);
            this.f75319a = Math.round((dSin2 + dAcos) * 8.64E7d) + 946728000000L;
            long jRound = Math.round((dSin2 - dAcos) * 8.64E7d) + 946728000000L;
            this.f75320b = jRound;
            if (jRound >= j11 || this.f75319a <= j11) {
                this.f75321c = 1;
            } else {
                this.f75321c = 0;
            }
        }
    }
}
