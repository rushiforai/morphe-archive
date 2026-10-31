package c0;

/* loaded from: classes.dex */
public final class f0 implements d0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f18791a;

    /* renamed from: b, reason: collision with root package name */
    public final a0 f18792b;

    /* renamed from: c, reason: collision with root package name */
    public final long f18793c;

    /* renamed from: d, reason: collision with root package name */
    public final long f18794d;

    public f0(int i5, int i11, a0 a0Var) {
        this.f18791a = i5;
        this.f18792b = a0Var;
        this.f18793c = i5 * 1000000;
        this.f18794d = i11 * 1000000;
    }

    @Override // c0.d0
    public final float c(long j11, float f11, float f12, float f13) {
        long j12 = j11 - this.f18794d;
        if (j12 < 0) {
            j12 = 0;
        }
        long j13 = this.f18793c;
        if (j12 > j13) {
            j12 = j13;
        }
        float fB = this.f18792b.b(this.f18791a == 0 ? 1.0f : j12 / j13);
        return (f12 * fB) + ((1 - fB) * f11);
    }

    @Override // c0.d0
    public final float d(long j11, float f11, float f12, float f13) {
        long j12 = j11 - this.f18794d;
        if (j12 < 0) {
            j12 = 0;
        }
        long j13 = this.f18793c;
        long j14 = j12 > j13 ? j13 : j12;
        if (j14 == 0) {
            return f13;
        }
        return (c(j14, f11, f12, f13) - c(j14 - 1000000, f11, f12, f13)) * 1000.0f;
    }

    @Override // c0.d0
    public final long e(float f11, float f12, float f13) {
        return this.f18794d + this.f18793c;
    }
}
