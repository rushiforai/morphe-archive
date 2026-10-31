package c0;

/* loaded from: classes2.dex */
public final class e0 implements d0 {

    /* renamed from: a, reason: collision with root package name */
    public final float f18765a;

    /* renamed from: b, reason: collision with root package name */
    public final k1 f18766b;

    public e0(float f11, float f12, float f13) {
        this.f18765a = f13;
        k1 k1Var = new k1();
        k1Var.f18851a = 1.0f;
        k1Var.f18852b = Math.sqrt(50.0d);
        k1Var.f18853c = 1.0f;
        if (f11 < 0.0f) {
            w0.a("Damping ratio must be non-negative");
        }
        k1Var.f18853c = f11;
        double d5 = k1Var.f18852b;
        if (((float) (d5 * d5)) <= 0.0f) {
            w0.a("Spring stiffness constant must be positive.");
        }
        k1Var.f18852b = Math.sqrt(f12);
        this.f18766b = k1Var;
    }

    @Override // c0.d0
    public final float b(float f11, float f12, float f13) {
        return 0.0f;
    }

    @Override // c0.d0
    public final float c(long j11, float f11, float f12, float f13) {
        k1 k1Var = this.f18766b;
        k1Var.f18851a = f12;
        return Float.intBitsToFloat((int) (k1Var.a(f11, f13, j11 / 1000000) >> 32));
    }

    @Override // c0.d0
    public final float d(long j11, float f11, float f12, float f13) {
        k1 k1Var = this.f18766b;
        k1Var.f18851a = f12;
        return Float.intBitsToFloat((int) (k1Var.a(f11, f13, j11 / 1000000) & 4294967295L));
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0211  */
    @Override // c0.d0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long e(float f11, float f12, float f13) {
        double dLog;
        int i5;
        long j11;
        k1 k1Var = this.f18766b;
        double d5 = k1Var.f18852b;
        float f14 = (float) (d5 * d5);
        float f15 = k1Var.f18853c;
        float f16 = this.f18765a;
        float f17 = (f11 - f12) / f16;
        float f18 = f13 / f16;
        if (f15 == 0.0f) {
            j11 = 9223372036854L;
        } else {
            double d11 = f14;
            double d12 = f15;
            double d13 = f18;
            double d14 = f17;
            double d15 = 1.0f;
            double dSqrt = d12 * 2.0d * Math.sqrt(d11);
            double d16 = (dSqrt * dSqrt) - (d11 * 4.0d);
            double dSqrt2 = d16 < 0.0d ? 0.0d : Math.sqrt(d16);
            double d17 = -dSqrt;
            double d18 = (d17 + dSqrt2) * 0.5d;
            double dSqrt3 = (d16 < 0.0d ? Math.sqrt(Math.abs(d16)) : 0.0d) * 0.5d;
            double d19 = (d17 - dSqrt2) * 0.5d;
            if (d14 == 0.0d && d13 == 0.0d) {
                j11 = 0;
            } else {
                if (d14 < 0.0d) {
                    d13 = -d13;
                }
                double dAbs = Math.abs(d14);
                double dAbs2 = Double.MAX_VALUE;
                if (d12 > 1.0d) {
                    double d21 = (d18 * dAbs) - d13;
                    double d22 = d18 - d19;
                    double d23 = d21 / d22;
                    double d24 = dAbs - d23;
                    dLog = Math.log(Math.abs(d15 / d24)) / d18;
                    double dLog2 = Math.log(Math.abs(d15 / d23)) / d19;
                    if ((Double.doubleToRawLongBits(dLog) & Long.MAX_VALUE) >= 9218868437227405312L) {
                        dLog = dLog2;
                    } else if ((Double.doubleToRawLongBits(dLog2) & Long.MAX_VALUE) < 9218868437227405312L) {
                        dLog = Math.max(dLog, dLog2);
                    }
                    double d25 = d24 * d18;
                    double dLog3 = Math.log(d25 / ((-d23) * d19)) / (d19 - d18);
                    if (Double.isNaN(dLog3) || dLog3 <= 0.0d) {
                        d15 = -d15;
                    } else if (dLog3 > 0.0d) {
                        if ((-((Math.exp(dLog3 * d19) * d23) + (Math.exp(d18 * dLog3) * d24))) < d15) {
                            d15 = -d15;
                            dLog = (d23 <= 0.0d || d24 >= 0.0d) ? dLog : 0.0d;
                        } else {
                            dLog = Math.log((-((d23 * d19) * d19)) / (d25 * d18)) / d22;
                        }
                    }
                    double d26 = d23 * d19;
                    if (Math.abs((Math.exp(d19 * dLog) * d26) + (Math.exp(d18 * dLog) * d25)) >= 1.0E-4d) {
                        int i11 = 0;
                        while (dAbs2 > 0.001d && i11 < 100) {
                            i11++;
                            double d27 = d18 * dLog;
                            double d28 = d19 * dLog;
                            double dExp = dLog - ((((Math.exp(d28) * d23) + (Math.exp(d27) * d24)) + d15) / ((Math.exp(d28) * d26) + (Math.exp(d27) * d25)));
                            dAbs2 = Math.abs(dLog - dExp);
                            dLog = dExp;
                        }
                    }
                } else if (d12 < 1.0d) {
                    double d29 = (d13 - (d18 * dAbs)) / dSqrt3;
                    dLog = Math.log(d15 / Math.sqrt((d29 * d29) + (dAbs * dAbs))) / d18;
                } else {
                    double d30 = d18 * dAbs;
                    double d31 = d13 - d30;
                    double dLog4 = Math.log(Math.abs(d15 / dAbs)) / d18;
                    double dLog5 = Math.log(Math.abs(d15 / d31));
                    double dLog6 = dLog5;
                    for (int i12 = 0; i12 < 6; i12++) {
                        dLog6 = dLog5 - Math.log(Math.abs(dLog6 / d18));
                    }
                    double d32 = dLog6 / d18;
                    if ((Double.doubleToRawLongBits(dLog4) & Long.MAX_VALUE) >= 9218868437227405312L) {
                        dLog4 = d32;
                    } else if ((Double.doubleToRawLongBits(d32) & Long.MAX_VALUE) < 9218868437227405312L) {
                        dLog4 = Math.max(dLog4, d32);
                    }
                    double d33 = (-(d30 + d31)) / (d18 * d31);
                    double d34 = d18 * d33;
                    double dExp2 = (Math.exp(d34) * d31 * d33) + (Math.exp(d34) * dAbs);
                    if (Double.isNaN(d33) || d33 <= 0.0d) {
                        d15 = -d15;
                        dLog = dLog4;
                        i5 = 0;
                        while (dAbs2 > 0.001d && i5 < 100) {
                            i5++;
                            double d35 = d18 * dLog;
                            double dExp3 = dLog - (((Math.exp(d35) * ((d31 * dLog) + dAbs)) + d15) / (Math.exp(d35) * (((1 + d35) * d31) + d30)));
                            dAbs2 = Math.abs(dLog - dExp3);
                            dLog = dExp3;
                        }
                        break;
                    }
                    if (d33 <= 0.0d || (-dExp2) >= d15) {
                        dLog4 = (-(2.0d / d18)) - (dAbs / d31);
                        dLog = dLog4;
                        i5 = 0;
                        while (dAbs2 > 0.001d) {
                            i5++;
                            double d352 = d18 * dLog;
                            double dExp32 = dLog - (((Math.exp(d352) * ((d31 * dLog) + dAbs)) + d15) / (Math.exp(d352) * (((1 + d352) * d31) + d30)));
                            dAbs2 = Math.abs(dLog - dExp32);
                            dLog = dExp32;
                        }
                    } else {
                        if (d31 < 0.0d && dAbs > 0.0d) {
                            dLog4 = 0.0d;
                        }
                        d15 = -d15;
                        dLog = dLog4;
                        i5 = 0;
                        while (dAbs2 > 0.001d) {
                        }
                    }
                }
                j11 = (long) (dLog * 1000.0d);
            }
        }
        return j11 * 1000000;
    }
}
