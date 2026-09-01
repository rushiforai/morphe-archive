package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uu1 {
    public static final long b = op8.l(4278190080L);
    public static final long c;
    public static final long d;
    public static final long e;
    public static final long f;
    public static final long g;
    public static final long h;
    public static final /* synthetic */ int i = 0;
    public final long a;

    static {
        op8.l(4282664004L);
        c = op8.l(4287137928L);
        op8.l(4291611852L);
        d = op8.l(4294967295L);
        e = op8.l(4294901760L);
        op8.l(4278255360L);
        f = op8.l(4278190335L);
        op8.l(4294967040L);
        op8.l(4278255615L);
        op8.l(4294902015L);
        g = op8.j(0);
        h = op8.i(0.0f, 0.0f, 0.0f, 0.0f, lv1.u);
    }

    public /* synthetic */ uu1(long j) {
        this.a = j;
    }

    public static final long a(long j, jv1 jv1Var) {
        v42 v42VarY;
        jv1 jv1VarE = e(j);
        int i2 = jv1VarE.c;
        int i3 = jv1Var.c;
        if ((i2 | i3) < 0) {
            v42VarY = f49.y(jv1VarE, jv1Var);
        } else {
            k68 k68Var = w42.a;
            int i4 = i2 | (i3 << 6);
            Object objB = k68Var.b(i4);
            if (objB == null) {
                objB = f49.y(jv1VarE, jv1Var);
                k68Var.i(i4, objB);
            }
            v42VarY = (v42) objB;
        }
        return v42VarY.a(j);
    }

    public static long b(float f2, long j) {
        return op8.i(g(j), f(j), d(j), f2, e(j));
    }

    public static final float c(long j) {
        float fX;
        float f2;
        if ((63 & j) == 0) {
            fX = (float) wo7.x((j >>> 56) & 255);
            f2 = 255.0f;
        } else {
            fX = (float) wo7.x((j >>> 6) & 1023);
            f2 = 1023.0f;
        }
        return fX / f2;
    }

    public static final float d(long j) {
        int i2;
        int i3;
        int i4;
        if ((63 & j) == 0) {
            return ((float) wo7.x((j >>> 32) & 255)) / 255.0f;
        }
        short s = (short) ((j >>> 16) & 65535);
        int i5 = Short.MIN_VALUE & s;
        int i6 = ((65535 & s) >>> 10) & 31;
        int i7 = s & 1023;
        if (i6 != 0) {
            int i8 = i7 << 13;
            if (i6 == 31) {
                i2 = 255;
                if (i8 != 0) {
                    i8 |= 4194304;
                }
            } else {
                i2 = i6 + PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            }
            int i9 = i2;
            i3 = i8;
            i4 = i9;
        } else {
            if (i7 != 0) {
                float fIntBitsToFloat = Float.intBitsToFloat(i7 + 1056964608) - gn4.a;
                return i5 == 0 ? fIntBitsToFloat : -fIntBitsToFloat;
            }
            i4 = 0;
            i3 = 0;
        }
        return Float.intBitsToFloat((i4 << 23) | (i5 << 16) | i3);
    }

    public static final jv1 e(long j) {
        float[] fArr = lv1.a;
        return lv1.y[(int) (j & 63)];
    }

    public static final float f(long j) {
        int i2;
        int i3;
        int i4;
        if ((63 & j) == 0) {
            return ((float) wo7.x((j >>> 40) & 255)) / 255.0f;
        }
        short s = (short) ((j >>> 32) & 65535);
        int i5 = Short.MIN_VALUE & s;
        int i6 = ((65535 & s) >>> 10) & 31;
        int i7 = s & 1023;
        if (i6 != 0) {
            int i8 = i7 << 13;
            if (i6 == 31) {
                i2 = 255;
                if (i8 != 0) {
                    i8 |= 4194304;
                }
            } else {
                i2 = i6 + PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            }
            int i9 = i2;
            i3 = i8;
            i4 = i9;
        } else {
            if (i7 != 0) {
                float fIntBitsToFloat = Float.intBitsToFloat(i7 + 1056964608) - gn4.a;
                return i5 == 0 ? fIntBitsToFloat : -fIntBitsToFloat;
            }
            i4 = 0;
            i3 = 0;
        }
        return Float.intBitsToFloat((i4 << 23) | (i5 << 16) | i3);
    }

    public static final float g(long j) {
        int i2;
        int i3;
        int i4;
        if ((63 & j) == 0) {
            return ((float) wo7.x((j >>> 48) & 255)) / 255.0f;
        }
        short s = (short) ((j >>> 48) & 65535);
        int i5 = Short.MIN_VALUE & s;
        int i6 = ((65535 & s) >>> 10) & 31;
        int i7 = s & 1023;
        if (i6 != 0) {
            int i8 = i7 << 13;
            if (i6 == 31) {
                i2 = 255;
                if (i8 != 0) {
                    i8 |= 4194304;
                }
            } else {
                i2 = i6 + PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            }
            int i9 = i2;
            i3 = i8;
            i4 = i9;
        } else {
            if (i7 != 0) {
                float fIntBitsToFloat = Float.intBitsToFloat(i7 + 1056964608) - gn4.a;
                return i5 == 0 ? fIntBitsToFloat : -fIntBitsToFloat;
            }
            i4 = 0;
            i3 = 0;
        }
        return Float.intBitsToFloat((i4 << 23) | (i5 << 16) | i3);
    }

    public static String h(long j) {
        StringBuilder sb = new StringBuilder("Color(");
        sb.append(g(j));
        sb.append(", ");
        sb.append(f(j));
        sb.append(", ");
        sb.append(d(j));
        sb.append(", ");
        sb.append(c(j));
        sb.append(", ");
        return ev6.z(sb, e(j).a, ')');
    }

    public final boolean equals(Object obj) {
        if (obj instanceof uu1) {
            return this.a == ((uu1) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return ev6.n(this.a);
    }

    public final String toString() {
        return h(this.a);
    }
}
