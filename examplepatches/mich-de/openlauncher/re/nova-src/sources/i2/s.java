package i2;

import h6.c1;
import kotlin.ULong;
import kotlin.UnsignedKt;

/* loaded from: classes.dex */
public final class s {

    /* renamed from: b, reason: collision with root package name */
    public static final long f61136b = r0.c(4278190080L);

    /* renamed from: c, reason: collision with root package name */
    public static final long f61137c = r0.c(4282664004L);

    /* renamed from: d, reason: collision with root package name */
    public static final long f61138d = r0.c(4287137928L);

    /* renamed from: e, reason: collision with root package name */
    public static final long f61139e = r0.c(4291611852L);

    /* renamed from: f, reason: collision with root package name */
    public static final long f61140f = r0.c(4294967295L);

    /* renamed from: g, reason: collision with root package name */
    public static final long f61141g = r0.c(4294901760L);

    /* renamed from: h, reason: collision with root package name */
    public static final long f61142h = r0.c(4278255360L);

    /* renamed from: i, reason: collision with root package name */
    public static final long f61143i = r0.c(4278190335L);

    /* renamed from: j, reason: collision with root package name */
    public static final long f61144j = r0.c(4294967040L);

    /* renamed from: k, reason: collision with root package name */
    public static final long f61145k;

    /* renamed from: l, reason: collision with root package name */
    public static final long f61146l;

    /* renamed from: m, reason: collision with root package name */
    public static final long f61147m;
    public static final /* synthetic */ int n = 0;

    /* renamed from: a, reason: collision with root package name */
    public final long f61148a;

    static {
        r0.c(4278255615L);
        f61145k = r0.c(4294902015L);
        f61146l = r0.b(0);
        float[] fArr = j2.d.f68658a;
        f61147m = r0.a(0.0f, 0.0f, 0.0f, 0.0f, j2.d.f68676u);
    }

    public /* synthetic */ s(long j11) {
        this.f61148a = j11;
    }

    public static final long a(long j11, j2.c cVar) {
        j2.g gVarE;
        j2.c cVarE = e(j11);
        int i5 = cVarE.f68657c;
        int i11 = cVar.f68657c;
        if ((i5 | i11) < 0) {
            gVarE = j2.j.e(cVarE, cVar);
        } else {
            z.c0 c0Var = j2.h.f68688a;
            int i12 = i5 | (i11 << 6);
            Object objB = c0Var.b(i12);
            if (objB == null) {
                objB = j2.j.e(cVarE, cVar);
                c0Var.h(i12, objB);
            }
            gVarE = (j2.g) objB;
        }
        return gVarE.a(j11);
    }

    public static long b(float f11, long j11) {
        return r0.a(g(j11), f(j11), d(j11), f11, e(j11));
    }

    public static final float c(long j11) {
        float fB;
        float f11;
        long j12 = 63 & j11;
        ULong.Companion companion = ULong.f71699b;
        if (j12 == 0) {
            fB = (float) UnsignedKt.b((j11 >>> 56) & 255);
            f11 = 255.0f;
        } else {
            fB = (float) UnsignedKt.b((j11 >>> 6) & 1023);
            f11 = 1023.0f;
        }
        return fB / f11;
    }

    public static final float d(long j11) {
        int i5;
        int i11;
        int i12;
        long j12 = 63 & j11;
        ULong.Companion companion = ULong.f71699b;
        if (j12 == 0) {
            return ((float) UnsignedKt.b((j11 >>> 32) & 255)) / 255.0f;
        }
        short s11 = (short) ((j11 >>> 16) & 65535);
        int i13 = Short.MIN_VALUE & s11;
        int i14 = ((65535 & s11) >>> 10) & 31;
        int i15 = s11 & 1023;
        if (i14 != 0) {
            int i16 = i15 << 13;
            if (i14 == 31) {
                i5 = 255;
                if (i16 != 0) {
                    i16 |= 4194304;
                }
            } else {
                i5 = i14 + 112;
            }
            int i17 = i5;
            i11 = i16;
            i12 = i17;
        } else {
            if (i15 != 0) {
                float fIntBitsToFloat = Float.intBitsToFloat(i15 + 1056964608) - y.f61190a;
                return i13 == 0 ? fIntBitsToFloat : -fIntBitsToFloat;
            }
            i12 = 0;
            i11 = 0;
        }
        return Float.intBitsToFloat((i12 << 23) | (i13 << 16) | i11);
    }

    public static final j2.c e(long j11) {
        float[] fArr = j2.d.f68658a;
        ULong.Companion companion = ULong.f71699b;
        return j2.d.f68680y[(int) (j11 & 63)];
    }

    public static final float f(long j11) {
        int i5;
        int i11;
        int i12;
        long j12 = 63 & j11;
        ULong.Companion companion = ULong.f71699b;
        if (j12 == 0) {
            return ((float) UnsignedKt.b((j11 >>> 40) & 255)) / 255.0f;
        }
        short s11 = (short) ((j11 >>> 32) & 65535);
        int i13 = Short.MIN_VALUE & s11;
        int i14 = ((65535 & s11) >>> 10) & 31;
        int i15 = s11 & 1023;
        if (i14 != 0) {
            int i16 = i15 << 13;
            if (i14 == 31) {
                i5 = 255;
                if (i16 != 0) {
                    i16 |= 4194304;
                }
            } else {
                i5 = i14 + 112;
            }
            int i17 = i5;
            i11 = i16;
            i12 = i17;
        } else {
            if (i15 != 0) {
                float fIntBitsToFloat = Float.intBitsToFloat(i15 + 1056964608) - y.f61190a;
                return i13 == 0 ? fIntBitsToFloat : -fIntBitsToFloat;
            }
            i12 = 0;
            i11 = 0;
        }
        return Float.intBitsToFloat((i12 << 23) | (i13 << 16) | i11);
    }

    public static final float g(long j11) {
        int i5;
        int i11;
        int i12;
        long j12 = 63 & j11;
        ULong.Companion companion = ULong.f71699b;
        if (j12 == 0) {
            return ((float) UnsignedKt.b((j11 >>> 48) & 255)) / 255.0f;
        }
        short s11 = (short) ((j11 >>> 48) & 65535);
        int i13 = Short.MIN_VALUE & s11;
        int i14 = ((65535 & s11) >>> 10) & 31;
        int i15 = s11 & 1023;
        if (i14 != 0) {
            int i16 = i15 << 13;
            if (i14 == 31) {
                i5 = 255;
                if (i16 != 0) {
                    i16 |= 4194304;
                }
            } else {
                i5 = i14 + 112;
            }
            int i17 = i5;
            i11 = i16;
            i12 = i17;
        } else {
            if (i15 != 0) {
                float fIntBitsToFloat = Float.intBitsToFloat(i15 + 1056964608) - y.f61190a;
                return i13 == 0 ? fIntBitsToFloat : -fIntBitsToFloat;
            }
            i12 = 0;
            i11 = 0;
        }
        return Float.intBitsToFloat((i12 << 23) | (i13 << 16) | i11);
    }

    public static String h(long j11) {
        StringBuilder sb2 = new StringBuilder("Color(");
        sb2.append(g(j11));
        sb2.append(", ");
        sb2.append(f(j11));
        sb2.append(", ");
        sb2.append(d(j11));
        sb2.append(", ");
        sb2.append(c(j11));
        sb2.append(", ");
        return c1.t(sb2, e(j11).f68655a, ')');
    }

    public final boolean equals(Object obj) {
        if (obj instanceof s) {
            return this.f61148a == ((s) obj).f61148a;
        }
        return false;
    }

    public final int hashCode() {
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f61148a);
    }

    public final String toString() {
        return h(this.f61148a);
    }
}
