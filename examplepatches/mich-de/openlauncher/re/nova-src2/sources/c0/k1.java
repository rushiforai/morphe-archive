package c0;

/* loaded from: classes2.dex */
public final class k1 {

    /* renamed from: a, reason: collision with root package name */
    public float f18851a;

    /* renamed from: b, reason: collision with root package name */
    public double f18852b;

    /* renamed from: c, reason: collision with root package name */
    public float f18853c;

    public final long a(float f11, float f12, long j11) {
        double dSin;
        double dCos;
        double dExp;
        double dExp2;
        float f13 = f11 - this.f18851a;
        double d5 = j11 / 1000.0d;
        float f14 = this.f18853c;
        double d11 = f14 * f14;
        double d12 = this.f18852b;
        double d13 = (-f14) * d12;
        if (f14 > 1.0f) {
            double dSqrt = Math.sqrt(d11 - 1) * d12;
            double d14 = d13 + dSqrt;
            double d15 = d13 - dSqrt;
            double d16 = f13;
            double d17 = ((d15 * d16) - f12) / (d15 - d14);
            double d18 = d16 - d17;
            double d19 = d15 * d5;
            double d21 = d5 * d14;
            dSin = (Math.exp(d21) * d17) + (Math.exp(d19) * d18);
            dExp = Math.exp(d19) * d18 * d15;
            dExp2 = Math.exp(d21) * d17 * d14;
        } else {
            if (f14 != 1.0f) {
                double d22 = 1;
                double dSqrt2 = Math.sqrt(d22 - d11) * d12;
                double d23 = f13;
                double d24 = (((-d13) * d23) + f12) * (d22 / dSqrt2);
                double d25 = dSqrt2 * d5;
                double d26 = d5 * d13;
                dSin = ((Math.sin(d25) * d24) + (Math.cos(d25) * d23)) * Math.exp(d26);
                dCos = (((Math.cos(d25) * dSqrt2 * d24) + (Math.sin(d25) * (-dSqrt2) * d23)) * Math.exp(d26)) + (d13 * dSin);
                float f15 = (float) dCos;
                return (Float.floatToRawIntBits(f15) & 4294967295L) | (Float.floatToRawIntBits((float) (dSin + this.f18851a)) << 32);
            }
            double d27 = f13;
            double d28 = (d12 * d27) + f12;
            double d29 = (-d12) * d5;
            double d30 = (d5 * d28) + d27;
            dSin = Math.exp(d29) * d30;
            dExp = Math.exp(d29) * d30 * (-this.f18852b);
            dExp2 = Math.exp(d29) * d28;
        }
        dCos = dExp2 + dExp;
        float f152 = (float) dCos;
        return (Float.floatToRawIntBits(f152) & 4294967295L) | (Float.floatToRawIntBits((float) (dSin + this.f18851a)) << 32);
    }
}
