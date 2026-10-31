package j2;

import h6.c1;
import i2.r0;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class q extends c {

    /* renamed from: r, reason: collision with root package name */
    public static final gl.l f68707r = new gl.l(23);

    /* renamed from: d, reason: collision with root package name */
    public final s f68708d;

    /* renamed from: e, reason: collision with root package name */
    public final float f68709e;

    /* renamed from: f, reason: collision with root package name */
    public final float f68710f;

    /* renamed from: g, reason: collision with root package name */
    public final r f68711g;

    /* renamed from: h, reason: collision with root package name */
    public final float[] f68712h;

    /* renamed from: i, reason: collision with root package name */
    public final float[] f68713i;

    /* renamed from: j, reason: collision with root package name */
    public final float[] f68714j;

    /* renamed from: k, reason: collision with root package name */
    public final i f68715k;

    /* renamed from: l, reason: collision with root package name */
    public final p f68716l;

    /* renamed from: m, reason: collision with root package name */
    public final m f68717m;
    public final i n;
    public final p o;

    /* renamed from: p, reason: collision with root package name */
    public final m f68718p;

    /* renamed from: q, reason: collision with root package name */
    public final boolean f68719q;

    public q(String str, float[] fArr, s sVar, final r rVar, int i5) {
        i iVar;
        i iVar2;
        double d5 = rVar.f68720a;
        boolean z11 = d5 == -3.0d;
        double d11 = rVar.f68726g;
        double d12 = rVar.f68725f;
        if (z11) {
            final int i11 = 4;
            iVar = new i() { // from class: j2.o
                @Override // j2.i
                public final double b(double d13) {
                    int i12 = i11;
                    r rVar2 = rVar;
                    switch (i12) {
                        case 0:
                            float[] fArr2 = d.f68658a;
                            return d.a(rVar2, d13);
                        case 1:
                            float[] fArr3 = d.f68658a;
                            return d.c(rVar2, d13);
                        case 2:
                            double d14 = rVar2.f68721b;
                            return d13 >= rVar2.f68724e ? Math.pow((d14 * d13) + rVar2.f68722c, rVar2.f68720a) : d13 * rVar2.f68723d;
                        case 3:
                            double d15 = rVar2.f68721b;
                            double d16 = rVar2.f68722c;
                            double d17 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e ? Math.pow((d15 * d13) + d16, rVar2.f68720a) + rVar2.f68725f : (d17 * d13) + rVar2.f68726g;
                        case 4:
                            float[] fArr4 = d.f68658a;
                            return d.b(rVar2, d13);
                        case 5:
                            float[] fArr5 = d.f68658a;
                            return d.d(rVar2, d13);
                        case 6:
                            double d18 = rVar2.f68721b;
                            double d19 = rVar2.f68722c;
                            double d21 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d21 ? (Math.pow(d13, 1.0d / rVar2.f68720a) - d19) / d18 : d13 / d21;
                        default:
                            double d22 = rVar2.f68721b;
                            double d23 = rVar2.f68722c;
                            double d24 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d24 ? (Math.pow(d13 - rVar2.f68725f, 1.0d / rVar2.f68720a) - d23) / d22 : (d13 - rVar2.f68726g) / d24;
                    }
                }
            };
        } else if (d5 == -2.0d) {
            final int i12 = 5;
            iVar = new i() { // from class: j2.o
                @Override // j2.i
                public final double b(double d13) {
                    int i122 = i12;
                    r rVar2 = rVar;
                    switch (i122) {
                        case 0:
                            float[] fArr2 = d.f68658a;
                            return d.a(rVar2, d13);
                        case 1:
                            float[] fArr3 = d.f68658a;
                            return d.c(rVar2, d13);
                        case 2:
                            double d14 = rVar2.f68721b;
                            return d13 >= rVar2.f68724e ? Math.pow((d14 * d13) + rVar2.f68722c, rVar2.f68720a) : d13 * rVar2.f68723d;
                        case 3:
                            double d15 = rVar2.f68721b;
                            double d16 = rVar2.f68722c;
                            double d17 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e ? Math.pow((d15 * d13) + d16, rVar2.f68720a) + rVar2.f68725f : (d17 * d13) + rVar2.f68726g;
                        case 4:
                            float[] fArr4 = d.f68658a;
                            return d.b(rVar2, d13);
                        case 5:
                            float[] fArr5 = d.f68658a;
                            return d.d(rVar2, d13);
                        case 6:
                            double d18 = rVar2.f68721b;
                            double d19 = rVar2.f68722c;
                            double d21 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d21 ? (Math.pow(d13, 1.0d / rVar2.f68720a) - d19) / d18 : d13 / d21;
                        default:
                            double d22 = rVar2.f68721b;
                            double d23 = rVar2.f68722c;
                            double d24 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d24 ? (Math.pow(d13 - rVar2.f68725f, 1.0d / rVar2.f68720a) - d23) / d22 : (d13 - rVar2.f68726g) / d24;
                    }
                }
            };
        } else if (d12 == 0.0d && d11 == 0.0d) {
            final int i13 = 6;
            iVar = new i() { // from class: j2.o
                @Override // j2.i
                public final double b(double d13) {
                    int i122 = i13;
                    r rVar2 = rVar;
                    switch (i122) {
                        case 0:
                            float[] fArr2 = d.f68658a;
                            return d.a(rVar2, d13);
                        case 1:
                            float[] fArr3 = d.f68658a;
                            return d.c(rVar2, d13);
                        case 2:
                            double d14 = rVar2.f68721b;
                            return d13 >= rVar2.f68724e ? Math.pow((d14 * d13) + rVar2.f68722c, rVar2.f68720a) : d13 * rVar2.f68723d;
                        case 3:
                            double d15 = rVar2.f68721b;
                            double d16 = rVar2.f68722c;
                            double d17 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e ? Math.pow((d15 * d13) + d16, rVar2.f68720a) + rVar2.f68725f : (d17 * d13) + rVar2.f68726g;
                        case 4:
                            float[] fArr4 = d.f68658a;
                            return d.b(rVar2, d13);
                        case 5:
                            float[] fArr5 = d.f68658a;
                            return d.d(rVar2, d13);
                        case 6:
                            double d18 = rVar2.f68721b;
                            double d19 = rVar2.f68722c;
                            double d21 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d21 ? (Math.pow(d13, 1.0d / rVar2.f68720a) - d19) / d18 : d13 / d21;
                        default:
                            double d22 = rVar2.f68721b;
                            double d23 = rVar2.f68722c;
                            double d24 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d24 ? (Math.pow(d13 - rVar2.f68725f, 1.0d / rVar2.f68720a) - d23) / d22 : (d13 - rVar2.f68726g) / d24;
                    }
                }
            };
        } else {
            final int i14 = 7;
            iVar = new i() { // from class: j2.o
                @Override // j2.i
                public final double b(double d13) {
                    int i122 = i14;
                    r rVar2 = rVar;
                    switch (i122) {
                        case 0:
                            float[] fArr2 = d.f68658a;
                            return d.a(rVar2, d13);
                        case 1:
                            float[] fArr3 = d.f68658a;
                            return d.c(rVar2, d13);
                        case 2:
                            double d14 = rVar2.f68721b;
                            return d13 >= rVar2.f68724e ? Math.pow((d14 * d13) + rVar2.f68722c, rVar2.f68720a) : d13 * rVar2.f68723d;
                        case 3:
                            double d15 = rVar2.f68721b;
                            double d16 = rVar2.f68722c;
                            double d17 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e ? Math.pow((d15 * d13) + d16, rVar2.f68720a) + rVar2.f68725f : (d17 * d13) + rVar2.f68726g;
                        case 4:
                            float[] fArr4 = d.f68658a;
                            return d.b(rVar2, d13);
                        case 5:
                            float[] fArr5 = d.f68658a;
                            return d.d(rVar2, d13);
                        case 6:
                            double d18 = rVar2.f68721b;
                            double d19 = rVar2.f68722c;
                            double d21 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d21 ? (Math.pow(d13, 1.0d / rVar2.f68720a) - d19) / d18 : d13 / d21;
                        default:
                            double d22 = rVar2.f68721b;
                            double d23 = rVar2.f68722c;
                            double d24 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d24 ? (Math.pow(d13 - rVar2.f68725f, 1.0d / rVar2.f68720a) - d23) / d22 : (d13 - rVar2.f68726g) / d24;
                    }
                }
            };
        }
        if (d5 == -3.0d) {
            final int i15 = 0;
            iVar2 = new i() { // from class: j2.o
                @Override // j2.i
                public final double b(double d13) {
                    int i122 = i15;
                    r rVar2 = rVar;
                    switch (i122) {
                        case 0:
                            float[] fArr2 = d.f68658a;
                            return d.a(rVar2, d13);
                        case 1:
                            float[] fArr3 = d.f68658a;
                            return d.c(rVar2, d13);
                        case 2:
                            double d14 = rVar2.f68721b;
                            return d13 >= rVar2.f68724e ? Math.pow((d14 * d13) + rVar2.f68722c, rVar2.f68720a) : d13 * rVar2.f68723d;
                        case 3:
                            double d15 = rVar2.f68721b;
                            double d16 = rVar2.f68722c;
                            double d17 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e ? Math.pow((d15 * d13) + d16, rVar2.f68720a) + rVar2.f68725f : (d17 * d13) + rVar2.f68726g;
                        case 4:
                            float[] fArr4 = d.f68658a;
                            return d.b(rVar2, d13);
                        case 5:
                            float[] fArr5 = d.f68658a;
                            return d.d(rVar2, d13);
                        case 6:
                            double d18 = rVar2.f68721b;
                            double d19 = rVar2.f68722c;
                            double d21 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d21 ? (Math.pow(d13, 1.0d / rVar2.f68720a) - d19) / d18 : d13 / d21;
                        default:
                            double d22 = rVar2.f68721b;
                            double d23 = rVar2.f68722c;
                            double d24 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d24 ? (Math.pow(d13 - rVar2.f68725f, 1.0d / rVar2.f68720a) - d23) / d22 : (d13 - rVar2.f68726g) / d24;
                    }
                }
            };
        } else if (d5 == -2.0d) {
            final int i16 = 1;
            iVar2 = new i() { // from class: j2.o
                @Override // j2.i
                public final double b(double d13) {
                    int i122 = i16;
                    r rVar2 = rVar;
                    switch (i122) {
                        case 0:
                            float[] fArr2 = d.f68658a;
                            return d.a(rVar2, d13);
                        case 1:
                            float[] fArr3 = d.f68658a;
                            return d.c(rVar2, d13);
                        case 2:
                            double d14 = rVar2.f68721b;
                            return d13 >= rVar2.f68724e ? Math.pow((d14 * d13) + rVar2.f68722c, rVar2.f68720a) : d13 * rVar2.f68723d;
                        case 3:
                            double d15 = rVar2.f68721b;
                            double d16 = rVar2.f68722c;
                            double d17 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e ? Math.pow((d15 * d13) + d16, rVar2.f68720a) + rVar2.f68725f : (d17 * d13) + rVar2.f68726g;
                        case 4:
                            float[] fArr4 = d.f68658a;
                            return d.b(rVar2, d13);
                        case 5:
                            float[] fArr5 = d.f68658a;
                            return d.d(rVar2, d13);
                        case 6:
                            double d18 = rVar2.f68721b;
                            double d19 = rVar2.f68722c;
                            double d21 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d21 ? (Math.pow(d13, 1.0d / rVar2.f68720a) - d19) / d18 : d13 / d21;
                        default:
                            double d22 = rVar2.f68721b;
                            double d23 = rVar2.f68722c;
                            double d24 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d24 ? (Math.pow(d13 - rVar2.f68725f, 1.0d / rVar2.f68720a) - d23) / d22 : (d13 - rVar2.f68726g) / d24;
                    }
                }
            };
        } else if (d12 == 0.0d && d11 == 0.0d) {
            final int i17 = 2;
            iVar2 = new i() { // from class: j2.o
                @Override // j2.i
                public final double b(double d13) {
                    int i122 = i17;
                    r rVar2 = rVar;
                    switch (i122) {
                        case 0:
                            float[] fArr2 = d.f68658a;
                            return d.a(rVar2, d13);
                        case 1:
                            float[] fArr3 = d.f68658a;
                            return d.c(rVar2, d13);
                        case 2:
                            double d14 = rVar2.f68721b;
                            return d13 >= rVar2.f68724e ? Math.pow((d14 * d13) + rVar2.f68722c, rVar2.f68720a) : d13 * rVar2.f68723d;
                        case 3:
                            double d15 = rVar2.f68721b;
                            double d16 = rVar2.f68722c;
                            double d17 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e ? Math.pow((d15 * d13) + d16, rVar2.f68720a) + rVar2.f68725f : (d17 * d13) + rVar2.f68726g;
                        case 4:
                            float[] fArr4 = d.f68658a;
                            return d.b(rVar2, d13);
                        case 5:
                            float[] fArr5 = d.f68658a;
                            return d.d(rVar2, d13);
                        case 6:
                            double d18 = rVar2.f68721b;
                            double d19 = rVar2.f68722c;
                            double d21 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d21 ? (Math.pow(d13, 1.0d / rVar2.f68720a) - d19) / d18 : d13 / d21;
                        default:
                            double d22 = rVar2.f68721b;
                            double d23 = rVar2.f68722c;
                            double d24 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d24 ? (Math.pow(d13 - rVar2.f68725f, 1.0d / rVar2.f68720a) - d23) / d22 : (d13 - rVar2.f68726g) / d24;
                    }
                }
            };
        } else {
            final int i18 = 3;
            iVar2 = new i() { // from class: j2.o
                @Override // j2.i
                public final double b(double d13) {
                    int i122 = i18;
                    r rVar2 = rVar;
                    switch (i122) {
                        case 0:
                            float[] fArr2 = d.f68658a;
                            return d.a(rVar2, d13);
                        case 1:
                            float[] fArr3 = d.f68658a;
                            return d.c(rVar2, d13);
                        case 2:
                            double d14 = rVar2.f68721b;
                            return d13 >= rVar2.f68724e ? Math.pow((d14 * d13) + rVar2.f68722c, rVar2.f68720a) : d13 * rVar2.f68723d;
                        case 3:
                            double d15 = rVar2.f68721b;
                            double d16 = rVar2.f68722c;
                            double d17 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e ? Math.pow((d15 * d13) + d16, rVar2.f68720a) + rVar2.f68725f : (d17 * d13) + rVar2.f68726g;
                        case 4:
                            float[] fArr4 = d.f68658a;
                            return d.b(rVar2, d13);
                        case 5:
                            float[] fArr5 = d.f68658a;
                            return d.d(rVar2, d13);
                        case 6:
                            double d18 = rVar2.f68721b;
                            double d19 = rVar2.f68722c;
                            double d21 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d21 ? (Math.pow(d13, 1.0d / rVar2.f68720a) - d19) / d18 : d13 / d21;
                        default:
                            double d22 = rVar2.f68721b;
                            double d23 = rVar2.f68722c;
                            double d24 = rVar2.f68723d;
                            return d13 >= rVar2.f68724e * d24 ? (Math.pow(d13 - rVar2.f68725f, 1.0d / rVar2.f68720a) - d23) / d22 : (d13 - rVar2.f68726g) / d24;
                    }
                }
            };
        }
        this(str, fArr, sVar, null, iVar, iVar2, 0.0f, 1.0f, rVar, i5);
    }

    @Override // j2.c
    public final float a(int i5) {
        return this.f68710f;
    }

    @Override // j2.c
    public final float b(int i5) {
        return this.f68709e;
    }

    @Override // j2.c
    public final boolean c() {
        return this.f68719q;
    }

    @Override // j2.c
    public final long d(float f11, float f12, float f13) {
        double d5 = f11;
        m mVar = this.f68718p;
        float fB = (float) mVar.b(d5);
        float fB2 = (float) mVar.b(f12);
        float fB3 = (float) mVar.b(f13);
        float[] fArr = this.f68713i;
        if (fArr.length < 9) {
            return 0L;
        }
        float f14 = (fArr[6] * fB3) + (fArr[3] * fB2) + (fArr[0] * fB);
        float f15 = (fArr[7] * fB3) + (fArr[4] * fB2) + (fArr[1] * fB);
        return (Float.floatToRawIntBits(f15) & 4294967295L) | (Float.floatToRawIntBits(f14) << 32);
    }

    @Override // j2.c
    public final float e(float f11, float f12, float f13) {
        double d5 = f11;
        m mVar = this.f68718p;
        float fB = (float) mVar.b(d5);
        float fB2 = (float) mVar.b(f12);
        float fB3 = (float) mVar.b(f13);
        float[] fArr = this.f68713i;
        return (fArr[8] * fB3) + (fArr[5] * fB2) + (fArr[2] * fB);
    }

    @Override // j2.c
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || q.class != obj.getClass() || !super.equals(obj)) {
            return false;
        }
        q qVar = (q) obj;
        r rVar = qVar.f68711g;
        if (Float.compare(qVar.f68709e, this.f68709e) != 0 || Float.compare(qVar.f68710f, this.f68710f) != 0 || !Intrinsics.b(this.f68708d, qVar.f68708d) || !Arrays.equals(this.f68712h, qVar.f68712h)) {
            return false;
        }
        r rVar2 = this.f68711g;
        if (rVar2 != null) {
            return Intrinsics.b(rVar2, rVar);
        }
        if (rVar == null) {
            return true;
        }
        if (Intrinsics.b(this.f68715k, qVar.f68715k)) {
            return Intrinsics.b(this.n, qVar.n);
        }
        return false;
    }

    @Override // j2.c
    public final long f(float f11, float f12, float f13, float f14, c cVar) {
        float[] fArr = this.f68714j;
        float f15 = (fArr[6] * f13) + (fArr[3] * f12) + (fArr[0] * f11);
        float f16 = (fArr[7] * f13) + (fArr[4] * f12) + (fArr[1] * f11);
        float f17 = (fArr[8] * f13) + (fArr[5] * f12) + (fArr[2] * f11);
        m mVar = this.f68717m;
        return r0.a((float) mVar.b(f15), (float) mVar.b(f16), (float) mVar.b(f17), f14, cVar);
    }

    @Override // j2.c
    public final int hashCode() {
        int iHashCode = (Arrays.hashCode(this.f68712h) + ((this.f68708d.hashCode() + (super.hashCode() * 31)) * 31)) * 31;
        float f11 = this.f68709e;
        int iFloatToIntBits = (iHashCode + (f11 == 0.0f ? 0 : Float.floatToIntBits(f11))) * 31;
        float f12 = this.f68710f;
        int iFloatToIntBits2 = (iFloatToIntBits + (f12 == 0.0f ? 0 : Float.floatToIntBits(f12))) * 31;
        r rVar = this.f68711g;
        int iHashCode2 = iFloatToIntBits2 + (rVar != null ? rVar.hashCode() : 0);
        if (rVar == null) {
            return this.n.hashCode() + ((this.f68715k.hashCode() + (iHashCode2 * 31)) * 31);
        }
        return iHashCode2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:42:0x01e8  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x022c  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x025e  */
    /* JADX WARN: Type inference failed for: r26v0 */
    /* JADX WARN: Type inference failed for: r26v1 */
    /* JADX WARN: Type inference failed for: r26v4 */
    /* JADX WARN: Type inference failed for: r41v1 */
    /* JADX WARN: Type inference failed for: r41v2 */
    /* JADX WARN: Type inference failed for: r41v3 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public q(String str, float[] fArr, s sVar, float[] fArr2, i iVar, i iVar2, float f11, float f12, r rVar, int i5) {
        ?? r26;
        ?? r41;
        float f13;
        float f14;
        boolean z11;
        double d5;
        super(str, b.f68650a, i5);
        this.f68708d = sVar;
        this.f68709e = f11;
        this.f68710f = f12;
        this.f68711g = rVar;
        this.f68715k = iVar;
        int i11 = 1;
        this.f68716l = new p(this, i11);
        int i12 = 0;
        this.f68717m = new m(this, i12);
        this.n = iVar2;
        this.o = new p(this, i12);
        this.f68718p = new m(this, i11);
        if (fArr.length != 6 && fArr.length != 9) {
            throw new IllegalArgumentException("The color space's primaries must be defined as an array of 6 floats in xyY or 9 floats in XYZ");
        }
        if (f11 < f12) {
            float[] fArr3 = new float[6];
            if (fArr.length == 9) {
                float f15 = fArr[0];
                float f16 = fArr[1];
                float f17 = f15 + f16 + fArr[2];
                fArr3[0] = f15 / f17;
                fArr3[1] = f16 / f17;
                float f18 = fArr[3];
                float f19 = fArr[4];
                float f21 = f18 + f19 + fArr[5];
                fArr3[2] = f18 / f21;
                fArr3[3] = f19 / f21;
                float f22 = fArr[6];
                float f23 = fArr[7];
                float f24 = f22 + f23 + fArr[8];
                fArr3[4] = f22 / f24;
                fArr3[5] = f23 / f24;
            } else {
                System.arraycopy(fArr, 0, fArr3, 0, 6);
            }
            this.f68712h = fArr3;
            if (fArr2 == null) {
                float f25 = fArr3[0];
                float f26 = fArr3[1];
                float f27 = fArr3[2];
                float f28 = fArr3[3];
                float f29 = fArr3[4];
                float f31 = fArr3[5];
                f13 = 1.0f;
                float f32 = sVar.f68727a;
                r41 = 0;
                float f33 = sVar.f68728b;
                float f34 = 1;
                float f35 = (f34 - f25) / f26;
                float f36 = (f34 - f27) / f28;
                float f37 = (f34 - f29) / f31;
                float f38 = (f34 - f32) / f33;
                float f39 = f25 / f26;
                float f40 = f32 / f33;
                float f41 = (f27 / f28) - f39;
                float f42 = f40 - f39;
                float f43 = f36 - f35;
                float f44 = ((f38 - f35) * f41) - (f42 * f43);
                float f45 = (f37 - f35) * f41;
                r26 = 1;
                float f46 = (f29 / f31) - f39;
                float f47 = f44 / (f45 - (f43 * f46));
                float f48 = c1.f(f47, f46, f42, f41);
                float f49 = (1.0f - f48) - f47;
                float f51 = f49 / f26;
                float f52 = f48 / f28;
                float f53 = f47 / f31;
                this.f68713i = new float[]{f51 * f25, f49, ((1.0f - f25) - f26) * f51, f52 * f27, f48, ((1.0f - f27) - f28) * f52, f53 * f29, f47, ((1.0f - f29) - f31) * f53};
            } else {
                r26 = 1;
                r41 = 0;
                f13 = 1.0f;
                if (fArr2.length == 9) {
                    this.f68713i = fArr2;
                } else {
                    throw new IllegalArgumentException("Transform must have 9 entries! Has " + fArr2.length);
                }
            }
            this.f68714j = j.f(this.f68713i);
            float fB = j.b(fArr3);
            float[] fArr4 = d.f68658a;
            if (fB / j.b(d.f68659b) > 0.9f) {
                float[] fArr5 = d.f68658a;
                float f54 = fArr3[r41];
                float f55 = fArr5[r41];
                float f56 = fArr3[r26];
                float f57 = fArr5[r26];
                float f58 = fArr3[2];
                float f59 = fArr5[2];
                float f61 = fArr3[3];
                float f62 = fArr5[3];
                float f63 = fArr3[4];
                float f64 = fArr5[4];
                float f65 = fArr3[5];
                float f66 = fArr5[5];
                f14 = 0.0f;
                float[] fArr6 = new float[6];
                fArr6[r41] = f54 - f55;
                fArr6[r26] = f56 - f57;
                fArr6[2] = f58 - f59;
                fArr6[3] = f61 - f62;
                fArr6[4] = f63 - f64;
                fArr6[5] = f65 - f66;
                float f67 = fArr6[r41];
                float f68 = fArr6[r26];
                if (((f57 - f66) * f67) - ((f55 - f64) * f68) >= 0.0f && ((f55 - f59) * f68) - ((f57 - f62) * f67) >= 0.0f) {
                    float f69 = fArr6[2];
                    float f70 = fArr6[3];
                    if (((f62 - f57) * f69) - ((f59 - f55) * f70) >= 0.0f && ((f59 - f64) * f70) - ((f62 - f66) * f69) >= 0.0f) {
                        float f71 = fArr6[4];
                        float f72 = fArr6[5];
                        if (((f66 - f62) * f71) - ((f64 - f59) * f72) < 0.0f || ((f64 - f55) * f72) - ((f66 - f57) * f71) < 0.0f) {
                        }
                    }
                }
                if (i5 != 0) {
                    float[] fArr7 = d.f68658a;
                    if (fArr3 == fArr7) {
                        if (j.d(sVar, j.f68692d) && f11 == f14 && f12 == f13) {
                            float[] fArr8 = d.f68658a;
                            q qVar = d.f68662e;
                            for (d5 = 0.0d; d5 <= 1.0d; d5 += 0.00392156862745098d) {
                                if (Math.abs(iVar.b(d5) - qVar.f68715k.b(d5)) <= 0.001d && Math.abs(iVar2.b(d5) - qVar.n.b(d5)) <= 0.001d) {
                                }
                            }
                            z11 = r26;
                        }
                        z11 = r41;
                        break;
                    }
                    for (int i13 = r41; i13 < 6; i13++) {
                        if (Float.compare(fArr3[i13], fArr7[i13]) != 0 && Math.abs(fArr3[i13] - fArr7[i13]) > 0.001f) {
                            break;
                        }
                    }
                    if (j.d(sVar, j.f68692d)) {
                        float[] fArr82 = d.f68658a;
                        q qVar2 = d.f68662e;
                        while (d5 <= 1.0d) {
                        }
                        z11 = r26;
                    }
                    z11 = r41;
                    break;
                }
                z11 = r26;
                this.f68719q = z11;
                return;
            }
            f14 = 0.0f;
            int i14 = (f11 > f14 ? 1 : (f11 == f14 ? 0 : -1));
            if (i5 != 0) {
            }
            this.f68719q = z11;
            return;
        }
        throw new IllegalArgumentException("Invalid range: min=" + f11 + ", max=" + f12 + "; min must be strictly < max");
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public q(String str, float[] fArr, s sVar, final double d5, float f11, float f12, int i5) {
        i iVar;
        i iVar2 = f68707r;
        if (d5 == 1.0d) {
            iVar = iVar2;
        } else {
            final int i11 = 0;
            iVar = new i() { // from class: j2.n
                @Override // j2.i
                public final double b(double d11) {
                    switch (i11) {
                        case 0:
                            if (d11 < 0.0d) {
                                d11 = 0.0d;
                            }
                            return Math.pow(d11, 1.0d / d5);
                        default:
                            if (d11 < 0.0d) {
                                d11 = 0.0d;
                            }
                            return Math.pow(d11, d5);
                    }
                }
            };
        }
        if (d5 != 1.0d) {
            final int i12 = 1;
            iVar2 = new i() { // from class: j2.n
                @Override // j2.i
                public final double b(double d11) {
                    switch (i12) {
                        case 0:
                            if (d11 < 0.0d) {
                                d11 = 0.0d;
                            }
                            return Math.pow(d11, 1.0d / d5);
                        default:
                            if (d11 < 0.0d) {
                                d11 = 0.0d;
                            }
                            return Math.pow(d11, d5);
                    }
                }
            };
        }
        i iVar3 = iVar2;
        this(str, fArr, sVar, null, iVar, iVar3, f11, f12, new r(d5, 1.0d, 0.0d, 0.0d, 0.0d), i5);
    }
}
