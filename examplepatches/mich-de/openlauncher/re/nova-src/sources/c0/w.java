package c0;

import b.c9;

/* loaded from: classes.dex */
public final class w implements a0 {

    /* renamed from: a, reason: collision with root package name */
    public final float f18991a;

    /* renamed from: b, reason: collision with root package name */
    public final float f18992b;

    /* renamed from: c, reason: collision with root package name */
    public final float f18993c;

    /* renamed from: d, reason: collision with root package name */
    public final float f18994d;

    /* renamed from: e, reason: collision with root package name */
    public final float f18995e;

    /* renamed from: f, reason: collision with root package name */
    public final float f18996f;

    public w(float f11, float f12, float f13, float f14) {
        int iT;
        this.f18991a = f11;
        this.f18992b = f12;
        this.f18993c = f13;
        this.f18994d = f14;
        if (!((Float.isNaN(f11) || Float.isNaN(f12) || Float.isNaN(f13) || Float.isNaN(f14)) ? false : true)) {
            w0.a("Parameters to CubicBezierEasing cannot be NaN. Actual parameters are: " + f11 + ", " + f12 + ", " + f13 + ", " + f14 + '.');
        }
        float[] fArr = new float[5];
        float f15 = (f12 - 0.0f) * 3.0f;
        float f16 = (f14 - f12) * 3.0f;
        float f17 = (1.0f - f14) * 3.0f;
        double d5 = f15;
        double d11 = f16;
        double d12 = f17;
        double d13 = d11 * 2.0d;
        double d14 = (d5 - d13) + d12;
        if (d14 == 0.0d) {
            iT = d11 == d12 ? 0 : i2.r0.t((float) ((d13 - d12) / (d13 - (d12 * 2.0d))), 0, fArr);
        } else {
            double d15 = -Math.sqrt((d11 * d11) - (d12 * d5));
            double d16 = (-d5) + d11;
            int iT2 = i2.r0.t((float) ((-(d15 + d16)) / d14), 0, fArr);
            int iT3 = i2.r0.t((float) ((d15 - d16) / d14), iT2, fArr) + iT2;
            if (iT3 > 1) {
                float f18 = fArr[0];
                float f19 = fArr[1];
                if (f18 > f19) {
                    fArr[0] = f19;
                    fArr[1] = f18;
                } else if (f18 == f19) {
                    iT = iT3 - 1;
                }
                iT = iT3;
            } else {
                iT = iT3;
            }
        }
        float f21 = (f16 - f15) * 2.0f;
        int iT4 = i2.r0.t((-f21) / (((f17 - f16) * 2.0f) - f21), iT, fArr) + iT;
        float fMin = Math.min(0.0f, 1.0f);
        float fMax = Math.max(0.0f, 1.0f);
        for (int i5 = 0; i5 < iT4; i5++) {
            float f22 = fArr[i5];
            float f23 = (((((((((f12 - f14) * 3.0f) + 1.0f) - 0.0f) * f22) + (((f14 - (f12 * 2.0f)) + 0.0f) * 3.0f)) * f22) + f15) * f22) + 0.0f;
            fMin = Math.min(fMin, f23);
            fMax = Math.max(fMax, f23);
        }
        long jFloatToRawIntBits = (Float.floatToRawIntBits(fMin) << 32) | (Float.floatToRawIntBits(fMax) & 4294967295L);
        this.f18995e = Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32));
        this.f18996f = Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L));
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0092 A[PHI: r3
      0x0092: PHI (r3v28 float) = (r3v5 float), (r3v16 float), (r3v21 float), (r3v32 float), (r3v37 float) binds: [B:128:0x0236, B:117:0x0206, B:92:0x01bb, B:47:0x00e5, B:22:0x008e] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0162 A[PHI: r12
      0x0162: PHI (r12v41 float) = (r12v25 float), (r12v36 float) binds: [B:68:0x0160, B:81:0x0191] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // c0.a0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final float b(float f11) {
        float f12;
        if (f11 <= 0.0f || f11 >= 1.0f) {
            return f11;
        }
        float fMax = Math.max(f11, 1.1920929E-7f);
        float f13 = this.f18991a;
        float f14 = this.f18993c;
        float f15 = f14 - fMax;
        double d5 = 0.0f - fMax;
        float f16 = 0.0f;
        double d11 = ((d5 - ((f13 - fMax) * 2.0d)) + f15) * 3.0d;
        double d12 = (r7 - r5) * 3.0d;
        double d13 = ((r7 - f15) * 3.0d) + (-r5) + (1.0f - fMax);
        float f17 = Float.NaN;
        if (Math.abs(d13 - 0.0d) >= 1.0E-7d) {
            double d14 = d11 / d13;
            double d15 = d12 / d13;
            double d16 = d5 / d13;
            double d17 = ((d15 * 3.0d) - (d14 * d14)) / 9.0d;
            double d18 = ((d16 * 27.0d) + ((((2.0d * d14) * d14) * d14) - ((9.0d * d14) * d15))) / 54.0d;
            double d19 = d17 * d17 * d17;
            double d21 = (d18 * d18) + d19;
            double d22 = d14 / 3.0d;
            if (d21 < 0.0d) {
                double dSqrt = Math.sqrt(-d19);
                double d23 = (-d18) / dSqrt;
                if (d23 < -1.0d) {
                    d23 = -1.0d;
                }
                if (d23 > 1.0d) {
                    d23 = 1.0d;
                }
                double dAcos = Math.acos(d23);
                double dQ = bh.g.Q((float) dSqrt) * 2.0f;
                float fCos = (float) ((Math.cos(dAcos / 3.0d) * dQ) - d22);
                float f18 = fCos < 0.0f ? 0.0f : fCos;
                if (f18 > 1.0f) {
                    f18 = 1.0f;
                }
                if (Math.abs(f18 - fCos) > 1.05E-6f) {
                    f18 = Float.NaN;
                }
                if (Float.isNaN(f18)) {
                    float fCos2 = (float) ((Math.cos((6.283185307179586d + dAcos) / 3.0d) * dQ) - d22);
                    f18 = fCos2 < 0.0f ? 0.0f : fCos2;
                    if (f18 > 1.0f) {
                        f18 = 1.0f;
                    }
                    if (Math.abs(f18 - fCos2) > 1.05E-6f) {
                        f18 = Float.NaN;
                    }
                    if (Float.isNaN(f18)) {
                        float fCos3 = (float) ((Math.cos((dAcos + 12.566370614359172d) / 3.0d) * dQ) - d22);
                        if (fCos3 >= 0.0f) {
                            f16 = fCos3;
                        }
                        f12 = f16 > 1.0f ? 1.0f : f16;
                        if (Math.abs(f12 - fCos3) <= 1.05E-6f) {
                        }
                    }
                } else {
                    f17 = f18;
                }
            } else if (d21 == 0.0d) {
                float f19 = -bh.g.Q((float) d18);
                float f21 = (float) d22;
                float f22 = (f19 * 2.0f) - f21;
                float f23 = f22 < 0.0f ? 0.0f : f22;
                if (f23 > 1.0f) {
                    f23 = 1.0f;
                }
                if (Math.abs(f23 - f22) > 1.05E-6f) {
                    f23 = Float.NaN;
                }
                if (Float.isNaN(f23)) {
                    float f24 = (-f19) - f21;
                    if (f24 >= 0.0f) {
                        f16 = f24;
                    }
                    f12 = f16 > 1.0f ? 1.0f : f16;
                    if (Math.abs(f12 - f24) <= 1.05E-6f) {
                    }
                } else {
                    f17 = f23;
                }
            } else {
                double dSqrt2 = Math.sqrt(d21);
                float fQ = (float) ((bh.g.Q((float) ((-d18) + dSqrt2)) - bh.g.Q((float) (d18 + dSqrt2))) - d22);
                if (fQ >= 0.0f) {
                    f16 = fQ;
                }
                f12 = f16 > 1.0f ? 1.0f : f16;
                if (Math.abs(f12 - fQ) <= 1.05E-6f) {
                }
            }
        } else if (Math.abs(d11 - 0.0d) >= 1.0E-7d) {
            double dSqrt3 = Math.sqrt((d12 * d12) - ((4.0d * d11) * d5));
            double d24 = d11 * 2.0d;
            float f25 = (float) ((dSqrt3 - d12) / d24);
            float f26 = f25 < 0.0f ? 0.0f : f25;
            if (f26 > 1.0f) {
                f26 = 1.0f;
            }
            if (Math.abs(f26 - f25) > 1.05E-6f) {
                f26 = Float.NaN;
            }
            if (Float.isNaN(f26)) {
                float f27 = (float) (((-d12) - dSqrt3) / d24);
                if (f27 >= 0.0f) {
                    f16 = f27;
                }
                f12 = f16 > 1.0f ? 1.0f : f16;
                if (Math.abs(f12 - f27) <= 1.05E-6f) {
                }
            } else {
                f17 = f26;
            }
        } else if (Math.abs(d12 - 0.0d) >= 1.0E-7d) {
            float f28 = (float) ((-d5) / d12);
            if (f28 >= 0.0f) {
                f16 = f28;
            }
            f12 = f16 > 1.0f ? 1.0f : f16;
            if (Math.abs(f12 - f28) <= 1.05E-6f) {
                f17 = f12;
            }
        }
        boolean zIsNaN = Float.isNaN(f17);
        float f29 = this.f18994d;
        float f31 = this.f18992b;
        if (!zIsNaN) {
            float f32 = ((((((f31 - f29) + 0.33333334f) * f17) + (f29 - (2.0f * f31))) * f17) + f31) * 3.0f * f17;
            float f33 = this.f18995e;
            if (f32 < f33) {
                f32 = f33;
            }
            float f34 = this.f18996f;
            return f32 > f34 ? f34 : f32;
        }
        throw new IllegalArgumentException("The cubic curve with parameters (" + f13 + ", " + f31 + ", " + f14 + ", " + f29 + ") has no solution at " + f11);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof w)) {
            return false;
        }
        w wVar = (w) obj;
        return this.f18991a == wVar.f18991a && this.f18992b == wVar.f18992b && this.f18993c == wVar.f18993c && this.f18994d == wVar.f18994d;
    }

    public final int hashCode() {
        return Float.hashCode(this.f18994d) + a80.m.d(this.f18993c, a80.m.d(this.f18992b, Float.hashCode(this.f18991a) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("CubicBezierEasing(a=");
        sb2.append(this.f18991a);
        sb2.append(", b=");
        sb2.append(this.f18992b);
        sb2.append(", c=");
        sb2.append(this.f18993c);
        sb2.append(", d=");
        return c9.k(sb2, this.f18994d, ')');
    }
}
