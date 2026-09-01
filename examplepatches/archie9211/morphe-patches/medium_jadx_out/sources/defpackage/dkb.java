package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dkb extends jv1 {
    public static final lg8 r = new lg8(23);
    public final u2f d;
    public final float e;
    public final float f;
    public final krd g;
    public final float[] h;
    public final float[] i;
    public final float[] j;
    public final aj3 k;
    public final ckb l;
    public final zjb m;
    public final aj3 n;
    public final ckb o;
    public final zjb p;
    public final boolean q;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x01e8  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x01ec  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0230  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public dkb(java.lang.String r36, float[] r37, defpackage.u2f r38, float[] r39, defpackage.aj3 r40, defpackage.aj3 r41, float r42, float r43, defpackage.krd r44, int r45) {
        /*
            Method dump skipped, instruction units count: 630
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dkb.<init>(java.lang.String, float[], u2f, float[], aj3, aj3, float, float, krd, int):void");
    }

    @Override // defpackage.jv1
    public final float a(int i) {
        return this.f;
    }

    @Override // defpackage.jv1
    public final float b(int i) {
        return this.e;
    }

    @Override // defpackage.jv1
    public final boolean c() {
        return this.q;
    }

    @Override // defpackage.jv1
    public final long d(float f, float f2, float f3) {
        double d = f;
        zjb zjbVar = this.p;
        float fA = (float) zjbVar.a(d);
        float fA2 = (float) zjbVar.a(f2);
        float fA3 = (float) zjbVar.a(f3);
        float[] fArr = this.i;
        if (fArr.length < 9) {
            return 0L;
        }
        return (((long) Float.floatToRawIntBits((fArr[6] * fA3) + ((fArr[3] * fA2) + (fArr[0] * fA)))) << 32) | (4294967295L & ((long) Float.floatToRawIntBits((fArr[7] * fA3) + (fArr[4] * fA2) + (fArr[1] * fA))));
    }

    @Override // defpackage.jv1
    public final float e(float f, float f2, float f3) {
        double d = f;
        zjb zjbVar = this.p;
        float fA = (float) zjbVar.a(d);
        float fA2 = (float) zjbVar.a(f2);
        float fA3 = (float) zjbVar.a(f3);
        float[] fArr = this.i;
        return (fArr[8] * fA3) + (fArr[5] * fA2) + (fArr[2] * fA);
    }

    @Override // defpackage.jv1
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || dkb.class != obj.getClass() || !super.equals(obj)) {
            return false;
        }
        dkb dkbVar = (dkb) obj;
        if (Float.compare(dkbVar.e, this.e) != 0 || Float.compare(dkbVar.f, this.f) != 0 || !g76.L(this.d, dkbVar.d) || !Arrays.equals(this.h, dkbVar.h)) {
            return false;
        }
        krd krdVar = dkbVar.g;
        krd krdVar2 = this.g;
        if (krdVar2 != null) {
            return g76.L(krdVar2, krdVar);
        }
        if (krdVar == null) {
            return true;
        }
        if (g76.L(this.k, dkbVar.k)) {
            return g76.L(this.n, dkbVar.n);
        }
        return false;
    }

    @Override // defpackage.jv1
    public final long f(float f, float f2, float f3, float f4, jv1 jv1Var) {
        float[] fArr = this.j;
        float f5 = (fArr[6] * f3) + (fArr[3] * f2) + (fArr[0] * f);
        float f6 = (fArr[7] * f3) + (fArr[4] * f2) + (fArr[1] * f);
        float f7 = (fArr[8] * f3) + (fArr[5] * f2) + (fArr[2] * f);
        zjb zjbVar = this.m;
        return op8.i((float) zjbVar.a(f5), (float) zjbVar.a(f6), (float) zjbVar.a(f7), f4, jv1Var);
    }

    @Override // defpackage.jv1
    public final int hashCode() {
        int iHashCode = (Arrays.hashCode(this.h) + ((this.d.hashCode() + (super.hashCode() * 31)) * 31)) * 31;
        float f = this.e;
        int iFloatToIntBits = (iHashCode + (f == 0.0f ? 0 : Float.floatToIntBits(f))) * 31;
        float f2 = this.f;
        int iFloatToIntBits2 = (iFloatToIntBits + (f2 == 0.0f ? 0 : Float.floatToIntBits(f2))) * 31;
        krd krdVar = this.g;
        int iHashCode2 = iFloatToIntBits2 + (krdVar != null ? krdVar.hashCode() : 0);
        if (krdVar != null) {
            return iHashCode2;
        }
        return this.n.hashCode() + ((this.k.hashCode() + (iHashCode2 * 31)) * 31);
    }

    public dkb(String str, float[] fArr, u2f u2fVar, final krd krdVar, int i) {
        double d;
        aj3 aj3Var;
        aj3 aj3Var2;
        double d2 = krdVar.a;
        final int i2 = 0;
        final int i3 = 1;
        boolean z = d2 == -3.0d;
        double d3 = krdVar.g;
        double d4 = krdVar.f;
        if (z) {
            d = -3.0d;
            final int i4 = 4;
            aj3Var = new aj3() { // from class: bkb
                @Override // defpackage.aj3
                public final double a(double d5) {
                    int i5 = i4;
                    krd krdVar2 = krdVar;
                    switch (i5) {
                        case 0:
                            float[] fArr2 = lv1.a;
                            return lv1.a(krdVar2, d5);
                        case 1:
                            float[] fArr3 = lv1.a;
                            return lv1.c(krdVar2, d5);
                        case 2:
                            double d6 = krdVar2.b;
                            return d5 >= krdVar2.e ? Math.pow((d6 * d5) + krdVar2.c, krdVar2.a) : krdVar2.d * d5;
                        case 3:
                            double d7 = krdVar2.b;
                            double d8 = krdVar2.c;
                            double d9 = krdVar2.d;
                            return d5 >= krdVar2.e ? Math.pow((d7 * d5) + d8, krdVar2.a) + krdVar2.f : (d9 * d5) + krdVar2.g;
                        case 4:
                            float[] fArr4 = lv1.a;
                            return lv1.b(krdVar2, d5);
                        case 5:
                            float[] fArr5 = lv1.a;
                            return lv1.d(krdVar2, d5);
                        case 6:
                            double d10 = krdVar2.b;
                            double d11 = krdVar2.c;
                            double d12 = krdVar2.d;
                            return d5 >= krdVar2.e * d12 ? (Math.pow(d5, 1.0d / krdVar2.a) - d11) / d10 : d5 / d12;
                        default:
                            double d13 = krdVar2.b;
                            double d14 = krdVar2.c;
                            double d15 = krdVar2.d;
                            return d5 >= krdVar2.e * d15 ? (Math.pow(d5 - krdVar2.f, 1.0d / krdVar2.a) - d14) / d13 : (d5 - krdVar2.g) / d15;
                    }
                }
            };
        } else {
            d = -3.0d;
            if (d2 == -2.0d) {
                final int i5 = 5;
                aj3Var = new aj3() { // from class: bkb
                    @Override // defpackage.aj3
                    public final double a(double d5) {
                        int i52 = i5;
                        krd krdVar2 = krdVar;
                        switch (i52) {
                            case 0:
                                float[] fArr2 = lv1.a;
                                return lv1.a(krdVar2, d5);
                            case 1:
                                float[] fArr3 = lv1.a;
                                return lv1.c(krdVar2, d5);
                            case 2:
                                double d6 = krdVar2.b;
                                return d5 >= krdVar2.e ? Math.pow((d6 * d5) + krdVar2.c, krdVar2.a) : krdVar2.d * d5;
                            case 3:
                                double d7 = krdVar2.b;
                                double d8 = krdVar2.c;
                                double d9 = krdVar2.d;
                                return d5 >= krdVar2.e ? Math.pow((d7 * d5) + d8, krdVar2.a) + krdVar2.f : (d9 * d5) + krdVar2.g;
                            case 4:
                                float[] fArr4 = lv1.a;
                                return lv1.b(krdVar2, d5);
                            case 5:
                                float[] fArr5 = lv1.a;
                                return lv1.d(krdVar2, d5);
                            case 6:
                                double d10 = krdVar2.b;
                                double d11 = krdVar2.c;
                                double d12 = krdVar2.d;
                                return d5 >= krdVar2.e * d12 ? (Math.pow(d5, 1.0d / krdVar2.a) - d11) / d10 : d5 / d12;
                            default:
                                double d13 = krdVar2.b;
                                double d14 = krdVar2.c;
                                double d15 = krdVar2.d;
                                return d5 >= krdVar2.e * d15 ? (Math.pow(d5 - krdVar2.f, 1.0d / krdVar2.a) - d14) / d13 : (d5 - krdVar2.g) / d15;
                        }
                    }
                };
            } else if (d4 == 0.0d && d3 == 0.0d) {
                final int i6 = 6;
                aj3Var = new aj3() { // from class: bkb
                    @Override // defpackage.aj3
                    public final double a(double d5) {
                        int i52 = i6;
                        krd krdVar2 = krdVar;
                        switch (i52) {
                            case 0:
                                float[] fArr2 = lv1.a;
                                return lv1.a(krdVar2, d5);
                            case 1:
                                float[] fArr3 = lv1.a;
                                return lv1.c(krdVar2, d5);
                            case 2:
                                double d6 = krdVar2.b;
                                return d5 >= krdVar2.e ? Math.pow((d6 * d5) + krdVar2.c, krdVar2.a) : krdVar2.d * d5;
                            case 3:
                                double d7 = krdVar2.b;
                                double d8 = krdVar2.c;
                                double d9 = krdVar2.d;
                                return d5 >= krdVar2.e ? Math.pow((d7 * d5) + d8, krdVar2.a) + krdVar2.f : (d9 * d5) + krdVar2.g;
                            case 4:
                                float[] fArr4 = lv1.a;
                                return lv1.b(krdVar2, d5);
                            case 5:
                                float[] fArr5 = lv1.a;
                                return lv1.d(krdVar2, d5);
                            case 6:
                                double d10 = krdVar2.b;
                                double d11 = krdVar2.c;
                                double d12 = krdVar2.d;
                                return d5 >= krdVar2.e * d12 ? (Math.pow(d5, 1.0d / krdVar2.a) - d11) / d10 : d5 / d12;
                            default:
                                double d13 = krdVar2.b;
                                double d14 = krdVar2.c;
                                double d15 = krdVar2.d;
                                return d5 >= krdVar2.e * d15 ? (Math.pow(d5 - krdVar2.f, 1.0d / krdVar2.a) - d14) / d13 : (d5 - krdVar2.g) / d15;
                        }
                    }
                };
            } else {
                final int i7 = 7;
                aj3Var = new aj3() { // from class: bkb
                    @Override // defpackage.aj3
                    public final double a(double d5) {
                        int i52 = i7;
                        krd krdVar2 = krdVar;
                        switch (i52) {
                            case 0:
                                float[] fArr2 = lv1.a;
                                return lv1.a(krdVar2, d5);
                            case 1:
                                float[] fArr3 = lv1.a;
                                return lv1.c(krdVar2, d5);
                            case 2:
                                double d6 = krdVar2.b;
                                return d5 >= krdVar2.e ? Math.pow((d6 * d5) + krdVar2.c, krdVar2.a) : krdVar2.d * d5;
                            case 3:
                                double d7 = krdVar2.b;
                                double d8 = krdVar2.c;
                                double d9 = krdVar2.d;
                                return d5 >= krdVar2.e ? Math.pow((d7 * d5) + d8, krdVar2.a) + krdVar2.f : (d9 * d5) + krdVar2.g;
                            case 4:
                                float[] fArr4 = lv1.a;
                                return lv1.b(krdVar2, d5);
                            case 5:
                                float[] fArr5 = lv1.a;
                                return lv1.d(krdVar2, d5);
                            case 6:
                                double d10 = krdVar2.b;
                                double d11 = krdVar2.c;
                                double d12 = krdVar2.d;
                                return d5 >= krdVar2.e * d12 ? (Math.pow(d5, 1.0d / krdVar2.a) - d11) / d10 : d5 / d12;
                            default:
                                double d13 = krdVar2.b;
                                double d14 = krdVar2.c;
                                double d15 = krdVar2.d;
                                return d5 >= krdVar2.e * d15 ? (Math.pow(d5 - krdVar2.f, 1.0d / krdVar2.a) - d14) / d13 : (d5 - krdVar2.g) / d15;
                        }
                    }
                };
            }
        }
        if (d2 == d) {
            aj3Var2 = new aj3() { // from class: bkb
                @Override // defpackage.aj3
                public final double a(double d5) {
                    int i52 = i2;
                    krd krdVar2 = krdVar;
                    switch (i52) {
                        case 0:
                            float[] fArr2 = lv1.a;
                            return lv1.a(krdVar2, d5);
                        case 1:
                            float[] fArr3 = lv1.a;
                            return lv1.c(krdVar2, d5);
                        case 2:
                            double d6 = krdVar2.b;
                            return d5 >= krdVar2.e ? Math.pow((d6 * d5) + krdVar2.c, krdVar2.a) : krdVar2.d * d5;
                        case 3:
                            double d7 = krdVar2.b;
                            double d8 = krdVar2.c;
                            double d9 = krdVar2.d;
                            return d5 >= krdVar2.e ? Math.pow((d7 * d5) + d8, krdVar2.a) + krdVar2.f : (d9 * d5) + krdVar2.g;
                        case 4:
                            float[] fArr4 = lv1.a;
                            return lv1.b(krdVar2, d5);
                        case 5:
                            float[] fArr5 = lv1.a;
                            return lv1.d(krdVar2, d5);
                        case 6:
                            double d10 = krdVar2.b;
                            double d11 = krdVar2.c;
                            double d12 = krdVar2.d;
                            return d5 >= krdVar2.e * d12 ? (Math.pow(d5, 1.0d / krdVar2.a) - d11) / d10 : d5 / d12;
                        default:
                            double d13 = krdVar2.b;
                            double d14 = krdVar2.c;
                            double d15 = krdVar2.d;
                            return d5 >= krdVar2.e * d15 ? (Math.pow(d5 - krdVar2.f, 1.0d / krdVar2.a) - d14) / d13 : (d5 - krdVar2.g) / d15;
                    }
                }
            };
        } else if (d2 == -2.0d) {
            aj3Var2 = new aj3() { // from class: bkb
                @Override // defpackage.aj3
                public final double a(double d5) {
                    int i52 = i3;
                    krd krdVar2 = krdVar;
                    switch (i52) {
                        case 0:
                            float[] fArr2 = lv1.a;
                            return lv1.a(krdVar2, d5);
                        case 1:
                            float[] fArr3 = lv1.a;
                            return lv1.c(krdVar2, d5);
                        case 2:
                            double d6 = krdVar2.b;
                            return d5 >= krdVar2.e ? Math.pow((d6 * d5) + krdVar2.c, krdVar2.a) : krdVar2.d * d5;
                        case 3:
                            double d7 = krdVar2.b;
                            double d8 = krdVar2.c;
                            double d9 = krdVar2.d;
                            return d5 >= krdVar2.e ? Math.pow((d7 * d5) + d8, krdVar2.a) + krdVar2.f : (d9 * d5) + krdVar2.g;
                        case 4:
                            float[] fArr4 = lv1.a;
                            return lv1.b(krdVar2, d5);
                        case 5:
                            float[] fArr5 = lv1.a;
                            return lv1.d(krdVar2, d5);
                        case 6:
                            double d10 = krdVar2.b;
                            double d11 = krdVar2.c;
                            double d12 = krdVar2.d;
                            return d5 >= krdVar2.e * d12 ? (Math.pow(d5, 1.0d / krdVar2.a) - d11) / d10 : d5 / d12;
                        default:
                            double d13 = krdVar2.b;
                            double d14 = krdVar2.c;
                            double d15 = krdVar2.d;
                            return d5 >= krdVar2.e * d15 ? (Math.pow(d5 - krdVar2.f, 1.0d / krdVar2.a) - d14) / d13 : (d5 - krdVar2.g) / d15;
                    }
                }
            };
        } else if (d4 == 0.0d && d3 == 0.0d) {
            final int i8 = 2;
            aj3Var2 = new aj3() { // from class: bkb
                @Override // defpackage.aj3
                public final double a(double d5) {
                    int i52 = i8;
                    krd krdVar2 = krdVar;
                    switch (i52) {
                        case 0:
                            float[] fArr2 = lv1.a;
                            return lv1.a(krdVar2, d5);
                        case 1:
                            float[] fArr3 = lv1.a;
                            return lv1.c(krdVar2, d5);
                        case 2:
                            double d6 = krdVar2.b;
                            return d5 >= krdVar2.e ? Math.pow((d6 * d5) + krdVar2.c, krdVar2.a) : krdVar2.d * d5;
                        case 3:
                            double d7 = krdVar2.b;
                            double d8 = krdVar2.c;
                            double d9 = krdVar2.d;
                            return d5 >= krdVar2.e ? Math.pow((d7 * d5) + d8, krdVar2.a) + krdVar2.f : (d9 * d5) + krdVar2.g;
                        case 4:
                            float[] fArr4 = lv1.a;
                            return lv1.b(krdVar2, d5);
                        case 5:
                            float[] fArr5 = lv1.a;
                            return lv1.d(krdVar2, d5);
                        case 6:
                            double d10 = krdVar2.b;
                            double d11 = krdVar2.c;
                            double d12 = krdVar2.d;
                            return d5 >= krdVar2.e * d12 ? (Math.pow(d5, 1.0d / krdVar2.a) - d11) / d10 : d5 / d12;
                        default:
                            double d13 = krdVar2.b;
                            double d14 = krdVar2.c;
                            double d15 = krdVar2.d;
                            return d5 >= krdVar2.e * d15 ? (Math.pow(d5 - krdVar2.f, 1.0d / krdVar2.a) - d14) / d13 : (d5 - krdVar2.g) / d15;
                    }
                }
            };
        } else {
            final int i9 = 3;
            aj3Var2 = new aj3() { // from class: bkb
                @Override // defpackage.aj3
                public final double a(double d5) {
                    int i52 = i9;
                    krd krdVar2 = krdVar;
                    switch (i52) {
                        case 0:
                            float[] fArr2 = lv1.a;
                            return lv1.a(krdVar2, d5);
                        case 1:
                            float[] fArr3 = lv1.a;
                            return lv1.c(krdVar2, d5);
                        case 2:
                            double d6 = krdVar2.b;
                            return d5 >= krdVar2.e ? Math.pow((d6 * d5) + krdVar2.c, krdVar2.a) : krdVar2.d * d5;
                        case 3:
                            double d7 = krdVar2.b;
                            double d8 = krdVar2.c;
                            double d9 = krdVar2.d;
                            return d5 >= krdVar2.e ? Math.pow((d7 * d5) + d8, krdVar2.a) + krdVar2.f : (d9 * d5) + krdVar2.g;
                        case 4:
                            float[] fArr4 = lv1.a;
                            return lv1.b(krdVar2, d5);
                        case 5:
                            float[] fArr5 = lv1.a;
                            return lv1.d(krdVar2, d5);
                        case 6:
                            double d10 = krdVar2.b;
                            double d11 = krdVar2.c;
                            double d12 = krdVar2.d;
                            return d5 >= krdVar2.e * d12 ? (Math.pow(d5, 1.0d / krdVar2.a) - d11) / d10 : d5 / d12;
                        default:
                            double d13 = krdVar2.b;
                            double d14 = krdVar2.c;
                            double d15 = krdVar2.d;
                            return d5 >= krdVar2.e * d15 ? (Math.pow(d5 - krdVar2.f, 1.0d / krdVar2.a) - d14) / d13 : (d5 - krdVar2.g) / d15;
                    }
                }
            };
        }
        this(str, fArr, u2fVar, null, aj3Var, aj3Var2, 0.0f, 1.0f, krdVar, i);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public dkb(String str, float[] fArr, u2f u2fVar, final double d, float f, float f2, int i) {
        aj3 aj3Var;
        aj3 aj3Var2 = r;
        if (d == 1.0d) {
            aj3Var = aj3Var2;
        } else {
            final int i2 = 0;
            aj3Var = new aj3() { // from class: akb
                @Override // defpackage.aj3
                public final double a(double d2) {
                    switch (i2) {
                        case 0:
                            if (d2 < 0.0d) {
                                d2 = 0.0d;
                            }
                            return Math.pow(d2, 1.0d / d);
                        default:
                            if (d2 < 0.0d) {
                                d2 = 0.0d;
                            }
                            return Math.pow(d2, d);
                    }
                }
            };
        }
        if (d != 1.0d) {
            final int i3 = 1;
            aj3Var2 = new aj3() { // from class: akb
                @Override // defpackage.aj3
                public final double a(double d2) {
                    switch (i3) {
                        case 0:
                            if (d2 < 0.0d) {
                                d2 = 0.0d;
                            }
                            return Math.pow(d2, 1.0d / d);
                        default:
                            if (d2 < 0.0d) {
                                d2 = 0.0d;
                            }
                            return Math.pow(d2, d);
                    }
                }
            };
        }
        aj3 aj3Var3 = aj3Var2;
        this(str, fArr, u2fVar, null, aj3Var, aj3Var3, f, f2, new krd(d, 1.0d, 0.0d, 0.0d, 0.0d), i);
    }
}
