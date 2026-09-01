package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tre {
    public final boolean a;
    public final rre b;
    public final int c;
    public final qt2[] d;
    public int e;
    public final float[] f;
    public final float[] g;
    public final float[] h;

    public tre(boolean z, rre rreVar) {
        this.a = z;
        this.b = rreVar;
        if (z && rreVar.equals(rre.Lsq2)) {
            ygf.f("Lsq2 not (yet) supported for differential axes");
            throw null;
        }
        int i = sre.a[rreVar.ordinal()];
        int i2 = 2;
        if (i != 1) {
            if (i != 2) {
                ygf.a();
                throw null;
            }
            i2 = 3;
        }
        this.c = i2;
        this.d = new qt2[20];
        this.f = new float[20];
        this.g = new float[20];
        this.h = new float[3];
    }

    public final void a(float f, long j) {
        int i = (this.e + 1) % 20;
        this.e = i;
        qt2[] qt2VarArr = this.d;
        qt2 qt2Var = qt2VarArr[i];
        if (qt2Var != null) {
            qt2Var.a = j;
            qt2Var.b = f;
        } else {
            qt2 qt2Var2 = new qt2();
            qt2Var2.a = j;
            qt2Var2.b = f;
            qt2VarArr[i] = qt2Var2;
        }
    }

    public final float b(float f) {
        rre rreVar;
        float[] fArr;
        float[] fArr2;
        float f2;
        boolean z;
        int i;
        float f3;
        float fSignum;
        float f4 = 0.0f;
        if (f <= 0.0f) {
            b26.b("maximumVelocity should be a positive value. You specified=" + f);
        }
        int i2 = this.e;
        qt2[] qt2VarArr = this.d;
        qt2 qt2Var = qt2VarArr[i2];
        if (qt2Var == null) {
            f3 = 0.0f;
            f2 = 0.0f;
        } else {
            int i3 = 0;
            qt2 qt2Var2 = qt2Var;
            while (true) {
                qt2 qt2Var3 = qt2VarArr[i2];
                boolean z2 = this.a;
                rreVar = this.b;
                fArr = this.f;
                fArr2 = this.g;
                if (qt2Var3 == null) {
                    f2 = f4;
                    z = z2;
                    i = 1;
                    break;
                }
                long j = qt2Var.a;
                f2 = f4;
                int i4 = i2;
                long j2 = qt2Var3.a;
                float f5 = j - j2;
                z = z2;
                i = 1;
                float fAbs = Math.abs(j2 - qt2Var2.a);
                qt2Var2 = (rreVar == rre.Lsq2 || z) ? qt2Var3 : qt2Var;
                if (f5 > 100.0f || fAbs > 40.0f) {
                    break;
                }
                fArr[i3] = qt2Var3.b;
                fArr2[i3] = -f5;
                i2 = (i4 == 0 ? 20 : i4) - 1;
                i3++;
                if (i3 >= 20) {
                    break;
                }
                f4 = f2;
            }
            if (i3 >= this.c) {
                int i5 = sre.a[rreVar.ordinal()];
                if (i5 == i) {
                    int i6 = i3 - i;
                    float f6 = fArr2[i6];
                    int i7 = i6;
                    float fAbs2 = f2;
                    while (i7 > 0) {
                        int i8 = i7 - 1;
                        float f7 = fArr2[i8];
                        if (f6 != f7) {
                            float f8 = (z ? -fArr[i8] : fArr[i7] - fArr[i8]) / (f6 - f7);
                            fAbs2 += Math.abs(f8) * (f8 - (Math.signum(fAbs2) * ((float) Math.sqrt(Math.abs(fAbs2) * 2.0f))));
                            if (i7 == i6) {
                                fAbs2 *= 0.5f;
                            }
                        }
                        i7--;
                        f6 = f7;
                    }
                    fSignum = Math.signum(fAbs2) * ((float) Math.sqrt(Math.abs(fAbs2) * 2.0f));
                } else {
                    if (i5 != 2) {
                        ygf.a();
                        return f2;
                    }
                    try {
                        float[] fArr3 = this.h;
                        qk7.x(fArr2, fArr, i3, fArr3);
                        fSignum = fArr3[i];
                    } catch (IllegalArgumentException unused) {
                        fSignum = f2;
                    }
                }
                f3 = fSignum * 1000.0f;
            } else {
                f3 = f2;
            }
        }
        if (f3 == f2 || Float.isNaN(f3)) {
            return f2;
        }
        if (f3 <= f2) {
            float f9 = -f;
            if (f3 < f9) {
                return f9;
            }
        } else if (f3 > f) {
            f3 = f;
        }
        return f3;
    }

    public tre() {
        this(true, rre.Impulse);
    }
}
