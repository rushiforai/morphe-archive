package fe;

/* loaded from: classes3.dex */
public final class q0 implements e {

    /* renamed from: f, reason: collision with root package name */
    public static final q0 f54964f = new q0(-9223372036854775807L, -9223372036854775807L, -9223372036854775807L, -3.4028235E38f, -3.4028235E38f);

    /* renamed from: a, reason: collision with root package name */
    public final long f54965a;

    /* renamed from: b, reason: collision with root package name */
    public final long f54966b;

    /* renamed from: c, reason: collision with root package name */
    public final long f54967c;

    /* renamed from: d, reason: collision with root package name */
    public final float f54968d;

    /* renamed from: e, reason: collision with root package name */
    public final float f54969e;

    public q0(long j11, long j12, long j13, float f11, float f12) {
        this.f54965a = j11;
        this.f54966b = j12;
        this.f54967c = j13;
        this.f54968d = f11;
        this.f54969e = f12;
    }

    public final p0 a() {
        p0 p0Var = new p0();
        p0Var.f54949a = this.f54965a;
        p0Var.f54950b = this.f54966b;
        p0Var.f54951c = this.f54967c;
        p0Var.f54952d = this.f54968d;
        p0Var.f54953e = this.f54969e;
        return p0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q0)) {
            return false;
        }
        q0 q0Var = (q0) obj;
        return this.f54965a == q0Var.f54965a && this.f54966b == q0Var.f54966b && this.f54967c == q0Var.f54967c && this.f54968d == q0Var.f54968d && this.f54969e == q0Var.f54969e;
    }

    public final int hashCode() {
        long j11 = this.f54965a;
        long j12 = this.f54966b;
        int i5 = ((((int) (j11 ^ (j11 >>> 32))) * 31) + ((int) (j12 ^ (j12 >>> 32)))) * 31;
        long j13 = this.f54967c;
        int i11 = (i5 + ((int) ((j13 >>> 32) ^ j13))) * 31;
        float f11 = this.f54968d;
        int iFloatToIntBits = (i11 + (f11 != 0.0f ? Float.floatToIntBits(f11) : 0)) * 31;
        float f12 = this.f54969e;
        return iFloatToIntBits + (f12 != 0.0f ? Float.floatToIntBits(f12) : 0);
    }
}
