package i2;

import android.graphics.BlendMode;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ULong;

/* loaded from: classes.dex */
public abstract class r0 {

    /* renamed from: a, reason: collision with root package name */
    public static final q0 f61135a = new q0();

    /* JADX WARN: Removed duplicated region for block: B:106:0x0160  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x017b  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x01b4  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x01bb  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00fe  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0105  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x011b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final long a(float f11, float f12, float f13, float f14, j2.c cVar) {
        int i5;
        int i11;
        int i12;
        float fB;
        float fA;
        int i13;
        int i14;
        int i15;
        int i16;
        float fB2;
        float fA2;
        int i17;
        int i18;
        int i19;
        if (cVar.c()) {
            float f15 = f14 < 0.0f ? 0.0f : f14;
            if (f15 > 1.0f) {
                f15 = 1.0f;
            }
            int i21 = ((int) ((f15 * 255.0f) + 0.5f)) << 24;
            float f16 = f11 < 0.0f ? 0.0f : f11;
            if (f16 > 1.0f) {
                f16 = 1.0f;
            }
            int i22 = i21 | (((int) ((f16 * 255.0f) + 0.5f)) << 16);
            float f17 = f12 < 0.0f ? 0.0f : f12;
            if (f17 > 1.0f) {
                f17 = 1.0f;
            }
            int i23 = i22 | (((int) ((f17 * 255.0f) + 0.5f)) << 8);
            float f18 = f13 >= 0.0f ? f13 : 0.0f;
            float f19 = f18 <= 1.0f ? f18 : 1.0f;
            ULong.Companion companion = ULong.f71699b;
            long j11 = (i23 | ((int) ((f19 * 255.0f) + 0.5f))) << 32;
            int i24 = s.n;
            return j11;
        }
        long j12 = cVar.f68656b;
        int i25 = j2.b.f68654e;
        if (((int) (j12 >> 32)) != 3) {
            e0.a("Color only works with ColorSpaces with 3 components");
        }
        int i26 = cVar.f68657c;
        if (i26 == -1) {
            e0.a("Unknown color space, please use a color space in ColorSpaces");
        }
        float fB3 = cVar.b(0);
        float fA3 = cVar.a(0);
        if (f11 >= fB3) {
            fB3 = f11;
        }
        if (fB3 <= fA3) {
            fA3 = fB3;
        }
        int iFloatToRawIntBits = Float.floatToRawIntBits(fA3);
        int i27 = iFloatToRawIntBits >>> 31;
        int i28 = (iFloatToRawIntBits >>> 23) & 255;
        int i29 = iFloatToRawIntBits & 8388607;
        if (i28 == 255) {
            i11 = i29 != 0 ? 512 : 0;
            i5 = 31;
        } else {
            i5 = i28 - 112;
            if (i5 >= 31) {
                i11 = 0;
                i5 = 49;
            } else if (i5 > 0) {
                int i31 = i29 >> 13;
                if ((iFloatToRawIntBits & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                    i12 = (((i5 << 10) | i31) + 1) | (i27 << 15);
                    short s11 = (short) i12;
                    fB = cVar.b(1);
                    fA = cVar.a(1);
                    if (f12 >= fB) {
                        fB = f12;
                    }
                    if (fB <= fA) {
                        fA = fB;
                    }
                    int iFloatToRawIntBits2 = Float.floatToRawIntBits(fA);
                    int i32 = iFloatToRawIntBits2 >>> 31;
                    i13 = (iFloatToRawIntBits2 >>> 23) & 255;
                    int i33 = iFloatToRawIntBits2 & 8388607;
                    if (i13 != 255) {
                        i15 = i33 != 0 ? 512 : 0;
                        i14 = 31;
                    } else {
                        i14 = i13 - 112;
                        if (i14 >= 31) {
                            i15 = 0;
                            i14 = 49;
                        } else if (i14 > 0) {
                            int i34 = i33 >> 13;
                            if ((iFloatToRawIntBits2 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                                i16 = (((i14 << 10) | i34) + 1) | (i32 << 15);
                                short s12 = (short) i16;
                                fB2 = cVar.b(2);
                                fA2 = cVar.a(2);
                                if (f13 >= fB2) {
                                    fB2 = f13;
                                }
                                if (fB2 <= fA2) {
                                    fA2 = fB2;
                                }
                                int iFloatToRawIntBits3 = Float.floatToRawIntBits(fA2);
                                int i35 = iFloatToRawIntBits3 >>> 31;
                                i17 = (iFloatToRawIntBits3 >>> 23) & 255;
                                int i36 = 8388607 & iFloatToRawIntBits3;
                                if (i17 == 255) {
                                    i18 = i36 != 0 ? 512 : 0;
                                    i = 31;
                                } else {
                                    int i37 = i17 - 112;
                                    if (i37 >= 31) {
                                        i18 = 0;
                                        i = 49;
                                    } else if (i37 > 0) {
                                        int i38 = i36 >> 13;
                                        if ((iFloatToRawIntBits3 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                                            i19 = (((i37 << 10) | i38) + 1) | (i35 << 15);
                                            long j13 = (i26 & 63) | ((s11 & 65535) << 48) | ((s12 & 65535) << 32) | ((65535 & ((short) i19)) << 16) | ((((int) ((((f14 >= 0.0f ? f14 : 0.0f) <= 1.0f ? r6 : 1.0f) * 1023.0f) + 0.5f)) & 1023) << 6);
                                            ULong.Companion companion2 = ULong.f71699b;
                                            int i39 = s.n;
                                            return j13;
                                        }
                                        i18 = i38;
                                        i = i37;
                                    } else if (i37 >= -10) {
                                        int i40 = (i36 | 8388608) >> (1 - i37);
                                        if ((i40 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                                            i40 += UserMetadata.MAX_INTERNAL_KEY_SIZE;
                                        }
                                        i18 = i40 >> 13;
                                    } else {
                                        i18 = 0;
                                    }
                                }
                                i19 = i18 | (i35 << 15) | (i << 10);
                                if (f14 >= 0.0f) {
                                }
                                long j132 = (i26 & 63) | ((s11 & 65535) << 48) | ((s12 & 65535) << 32) | ((65535 & ((short) i19)) << 16) | ((((int) ((((f14 >= 0.0f ? f14 : 0.0f) <= 1.0f ? r6 : 1.0f) * 1023.0f) + 0.5f)) & 1023) << 6);
                                ULong.Companion companion22 = ULong.f71699b;
                                int i392 = s.n;
                                return j132;
                            }
                            i15 = i34;
                        } else if (i14 >= -10) {
                            int i41 = (i33 | 8388608) >> (1 - i14);
                            if ((i41 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                                i41 += UserMetadata.MAX_INTERNAL_KEY_SIZE;
                            }
                            i15 = i41 >> 13;
                            i14 = 0;
                        } else {
                            i15 = 0;
                            i14 = 0;
                        }
                    }
                    i16 = i15 | (i32 << 15) | (i14 << 10);
                    short s122 = (short) i16;
                    fB2 = cVar.b(2);
                    fA2 = cVar.a(2);
                    if (f13 >= fB2) {
                    }
                    if (fB2 <= fA2) {
                    }
                    int iFloatToRawIntBits32 = Float.floatToRawIntBits(fA2);
                    int i352 = iFloatToRawIntBits32 >>> 31;
                    i17 = (iFloatToRawIntBits32 >>> 23) & 255;
                    int i362 = 8388607 & iFloatToRawIntBits32;
                    if (i17 == 255) {
                    }
                    i19 = i18 | (i352 << 15) | (i << 10);
                    if (f14 >= 0.0f) {
                    }
                    long j1322 = (i26 & 63) | ((s11 & 65535) << 48) | ((s122 & 65535) << 32) | ((65535 & ((short) i19)) << 16) | ((((int) ((((f14 >= 0.0f ? f14 : 0.0f) <= 1.0f ? r6 : 1.0f) * 1023.0f) + 0.5f)) & 1023) << 6);
                    ULong.Companion companion222 = ULong.f71699b;
                    int i3922 = s.n;
                    return j1322;
                }
                i11 = i31;
            } else if (i5 >= -10) {
                int i42 = (i29 | 8388608) >> (1 - i5);
                if ((i42 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                    i42 += UserMetadata.MAX_INTERNAL_KEY_SIZE;
                }
                i11 = i42 >> 13;
                i5 = 0;
            } else {
                i11 = 0;
                i5 = 0;
            }
        }
        i12 = i11 | (i27 << 15) | (i5 << 10);
        short s112 = (short) i12;
        fB = cVar.b(1);
        fA = cVar.a(1);
        if (f12 >= fB) {
        }
        if (fB <= fA) {
        }
        int iFloatToRawIntBits22 = Float.floatToRawIntBits(fA);
        int i322 = iFloatToRawIntBits22 >>> 31;
        i13 = (iFloatToRawIntBits22 >>> 23) & 255;
        int i332 = iFloatToRawIntBits22 & 8388607;
        if (i13 != 255) {
        }
        i16 = i15 | (i322 << 15) | (i14 << 10);
        short s1222 = (short) i16;
        fB2 = cVar.b(2);
        fA2 = cVar.a(2);
        if (f13 >= fB2) {
        }
        if (fB2 <= fA2) {
        }
        int iFloatToRawIntBits322 = Float.floatToRawIntBits(fA2);
        int i3522 = iFloatToRawIntBits322 >>> 31;
        i17 = (iFloatToRawIntBits322 >>> 23) & 255;
        int i3622 = 8388607 & iFloatToRawIntBits322;
        if (i17 == 255) {
        }
        i19 = i18 | (i3522 << 15) | (i << 10);
        if (f14 >= 0.0f) {
        }
        long j13222 = (i26 & 63) | ((s112 & 65535) << 48) | ((s1222 & 65535) << 32) | ((65535 & ((short) i19)) << 16) | ((((int) ((((f14 >= 0.0f ? f14 : 0.0f) <= 1.0f ? r6 : 1.0f) * 1023.0f) + 0.5f)) & 1023) << 6);
        ULong.Companion companion2222 = ULong.f71699b;
        int i39222 = s.n;
        return j13222;
    }

    public static final long b(int i5) {
        long j11 = i5;
        ULong.Companion companion = ULong.f71699b;
        long j12 = j11 << 32;
        int i11 = s.n;
        return j12;
    }

    public static final long c(long j11) {
        long j12 = j11 << 32;
        ULong.Companion companion = ULong.f71699b;
        int i5 = s.n;
        return j12;
    }

    public static long d(int i5, int i11, int i12) {
        return b(((i5 & 255) << 16) | (-16777216) | ((i11 & 255) << 8) | (i12 & 255));
    }

    public static final aa.m0 e() {
        return new aa.m0(new Paint(7));
    }

    public static final long f(float f11, float f12) {
        long jFloatToRawIntBits = (Float.floatToRawIntBits(f12) & 4294967295L) | (Float.floatToRawIntBits(f11) << 32);
        int i5 = y0.f61192c;
        return jFloatToRawIntBits;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00e8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final long g(float f11, float f12, float f13, float f14, j2.c cVar) {
        int i5;
        int i11;
        int i12;
        int i13;
        int i14;
        int i15;
        int i16;
        int i17;
        int i18;
        if (cVar.c()) {
            ULong.Companion companion = ULong.f71699b;
            long j11 = ((((((int) ((f14 * 255.0f) + 0.5f)) << 24) | (((int) ((f11 * 255.0f) + 0.5f)) << 16)) | (((int) ((f12 * 255.0f) + 0.5f)) << 8)) | ((int) ((255.0f * f13) + 0.5f))) << 32;
            int i19 = s.n;
            return j11;
        }
        int iFloatToRawIntBits = Float.floatToRawIntBits(f11);
        int i21 = iFloatToRawIntBits >>> 31;
        int i22 = (iFloatToRawIntBits >>> 23) & 255;
        int i23 = iFloatToRawIntBits & 8388607;
        int i24 = 49;
        int i25 = EventBridgeChannel.QUEUE_CAPACITY;
        int i26 = 0;
        if (i22 == 255) {
            i11 = i23 != 0 ? 512 : 0;
            i5 = 31;
        } else {
            i5 = i22 - 112;
            if (i5 >= 31) {
                i5 = 49;
                i11 = 0;
            } else if (i5 > 0) {
                int i27 = i23 >> 13;
                if ((iFloatToRawIntBits & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                    i12 = (((i5 << 10) | i27) + 1) | (i21 << 15);
                    short s11 = (short) i12;
                    int iFloatToRawIntBits2 = Float.floatToRawIntBits(f12);
                    int i28 = iFloatToRawIntBits2 >>> 31;
                    i13 = (iFloatToRawIntBits2 >>> 23) & 255;
                    int i29 = iFloatToRawIntBits2 & 8388607;
                    if (i13 != 255) {
                        i15 = i29 != 0 ? 512 : 0;
                        i14 = 31;
                    } else {
                        i14 = i13 - 112;
                        if (i14 >= 31) {
                            i14 = 49;
                            i15 = 0;
                        } else if (i14 > 0) {
                            int i31 = i29 >> 13;
                            if ((iFloatToRawIntBits2 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                                i16 = (((i14 << 10) | i31) + 1) | (i28 << 15);
                                short s12 = (short) i16;
                                int iFloatToRawIntBits3 = Float.floatToRawIntBits(f13);
                                int i32 = iFloatToRawIntBits3 >>> 31;
                                i17 = (iFloatToRawIntBits3 >>> 23) & 255;
                                int i33 = 8388607 & iFloatToRawIntBits3;
                                if (i17 != 255) {
                                    int i34 = i17 - 112;
                                    if (i34 < 31) {
                                        if (i34 > 0) {
                                            i26 = i33 >> 13;
                                            if ((iFloatToRawIntBits3 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                                                i18 = (((i34 << 10) | i26) + 1) | (i32 << 15);
                                            } else {
                                                i24 = i34;
                                            }
                                        } else if (i34 >= -10) {
                                            int i35 = (i33 | 8388608) >> (1 - i34);
                                            if ((i35 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                                                i35 += UserMetadata.MAX_INTERNAL_KEY_SIZE;
                                            }
                                            i24 = 0;
                                            i26 = i35 >> 13;
                                        } else {
                                            i24 = 0;
                                        }
                                    }
                                    long jMax = ((((short) i18) & 65535) << 16) | ((s11 & 65535) << 48) | ((s12 & 65535) << 32) | ((((int) ((Math.max(0.0f, Math.min(f14, 1.0f)) * 1023.0f) + 0.5f)) & 1023) << 6) | (cVar.f68657c & 63);
                                    ULong.Companion companion2 = ULong.f71699b;
                                    int i36 = s.n;
                                    return jMax;
                                }
                                if (i33 == 0) {
                                    i25 = 0;
                                }
                                i26 = i25;
                                i24 = 31;
                                i18 = (i32 << 15) | (i24 << 10) | i26;
                                long jMax2 = ((((short) i18) & 65535) << 16) | ((s11 & 65535) << 48) | ((s12 & 65535) << 32) | ((((int) ((Math.max(0.0f, Math.min(f14, 1.0f)) * 1023.0f) + 0.5f)) & 1023) << 6) | (cVar.f68657c & 63);
                                ULong.Companion companion22 = ULong.f71699b;
                                int i362 = s.n;
                                return jMax2;
                            }
                            i15 = i31;
                        } else if (i14 >= -10) {
                            int i37 = (i29 | 8388608) >> (1 - i14);
                            if ((i37 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                                i37 += UserMetadata.MAX_INTERNAL_KEY_SIZE;
                            }
                            i15 = i37 >> 13;
                            i14 = 0;
                        } else {
                            i15 = 0;
                            i14 = 0;
                        }
                    }
                    i16 = i15 | (i28 << 15) | (i14 << 10);
                    short s122 = (short) i16;
                    int iFloatToRawIntBits32 = Float.floatToRawIntBits(f13);
                    int i322 = iFloatToRawIntBits32 >>> 31;
                    i17 = (iFloatToRawIntBits32 >>> 23) & 255;
                    int i332 = 8388607 & iFloatToRawIntBits32;
                    if (i17 != 255) {
                    }
                    i18 = (i322 << 15) | (i24 << 10) | i26;
                    long jMax22 = ((((short) i18) & 65535) << 16) | ((s11 & 65535) << 48) | ((s122 & 65535) << 32) | ((((int) ((Math.max(0.0f, Math.min(f14, 1.0f)) * 1023.0f) + 0.5f)) & 1023) << 6) | (cVar.f68657c & 63);
                    ULong.Companion companion222 = ULong.f71699b;
                    int i3622 = s.n;
                    return jMax22;
                }
                i11 = i27;
            } else if (i5 >= -10) {
                int i38 = (i23 | 8388608) >> (1 - i5);
                if ((i38 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                    i38 += UserMetadata.MAX_INTERNAL_KEY_SIZE;
                }
                i11 = i38 >> 13;
                i5 = 0;
            } else {
                i11 = 0;
                i5 = 0;
            }
        }
        i12 = i11 | (i21 << 15) | (i5 << 10);
        short s112 = (short) i12;
        int iFloatToRawIntBits22 = Float.floatToRawIntBits(f12);
        int i282 = iFloatToRawIntBits22 >>> 31;
        i13 = (iFloatToRawIntBits22 >>> 23) & 255;
        int i292 = iFloatToRawIntBits22 & 8388607;
        if (i13 != 255) {
        }
        i16 = i15 | (i282 << 15) | (i14 << 10);
        short s1222 = (short) i16;
        int iFloatToRawIntBits322 = Float.floatToRawIntBits(f13);
        int i3222 = iFloatToRawIntBits322 >>> 31;
        i17 = (iFloatToRawIntBits322 >>> 23) & 255;
        int i3322 = 8388607 & iFloatToRawIntBits322;
        if (i17 != 255) {
        }
        i18 = (i3222 << 15) | (i24 << 10) | i26;
        long jMax222 = ((((short) i18) & 65535) << 16) | ((s112 & 65535) << 48) | ((s1222 & 65535) << 32) | ((((int) ((Math.max(0.0f, Math.min(f14, 1.0f)) * 1023.0f) + 0.5f)) & 1023) << 6) | (cVar.f68657c & 63);
        ULong.Companion companion2222 = ULong.f71699b;
        int i36222 = s.n;
        return jMax222;
    }

    public static final long h(long j11, long j12) {
        float f11;
        float f12;
        long jA = s.a(j11, s.e(j12));
        float fC = s.c(j12);
        float fC2 = s.c(jA);
        float f13 = 1.0f - fC2;
        float f14 = (fC * f13) + fC2;
        float fG = s.g(jA);
        float fG2 = s.g(j12);
        float f15 = 0.0f;
        if (f14 == 0.0f) {
            f11 = 0.0f;
        } else {
            f11 = (((fG2 * fC) * f13) + (fG * fC2)) / f14;
        }
        float f16 = s.f(jA);
        float f17 = s.f(j12);
        if (f14 == 0.0f) {
            f12 = 0.0f;
        } else {
            f12 = (((f17 * fC) * f13) + (f16 * fC2)) / f14;
        }
        float fD = s.d(jA);
        float fD2 = s.d(j12);
        if (f14 != 0.0f) {
            f15 = (((fD2 * fC) * f13) + (fD * fC2)) / f14;
        }
        return g(f11, f12, f15, f14, s.e(j12));
    }

    public static void i(k2.f fVar, r0 r0Var, long j11) {
        boolean z11 = r0Var instanceof j0;
        k2.j jVar = k2.j.f70871a;
        if (z11) {
            h2.c cVar = ((j0) r0Var).f61125b;
            float f11 = cVar.f59018a;
            float f12 = cVar.f59019b;
            fVar.mo90drawRectnJ9OG0(j11, (Float.floatToRawIntBits(f12) & 4294967295L) | (Float.floatToRawIntBits(f11) << 32), p(cVar), 1.0f, jVar, null, 3);
            return;
        }
        if (!(r0Var instanceof k0)) {
            if (!(r0Var instanceof i0)) {
                throw new NoWhenBranchMatchedException();
            }
            fVar.mo87drawPathLG529CI(((i0) r0Var).f61123b, j11, 1.0f, jVar, null, 3);
            return;
        }
        k0 k0Var = (k0) r0Var;
        h hVar = k0Var.f61127c;
        if (hVar != null) {
            fVar.mo87drawPathLG529CI(hVar, j11, 1.0f, jVar, null, 3);
            return;
        }
        h2.d dVar = k0Var.f61126b;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (dVar.f59029h >> 32));
        float f13 = dVar.f59022a;
        float f14 = dVar.f59023b;
        long jFloatToRawIntBits = (Float.floatToRawIntBits(f14) & 4294967295L) | (Float.floatToRawIntBits(f13) << 32);
        float fB = dVar.b();
        float fA = dVar.a();
        fVar.mo92drawRoundRectuAw5IA(j11, jFloatToRawIntBits, (Float.floatToRawIntBits(fB) << 32) | (Float.floatToRawIntBits(fA) & 4294967295L), (Float.floatToRawIntBits(fIntBitsToFloat) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32), jVar, 1.0f, null, 3);
    }

    public static final boolean k(float[] fArr) {
        return fArr.length >= 16 && fArr[0] == 1.0f && fArr[1] == 0.0f && fArr[2] == 0.0f && fArr[3] == 0.0f && fArr[4] == 0.0f && fArr[5] == 1.0f && fArr[6] == 0.0f && fArr[7] == 0.0f && fArr[8] == 0.0f && fArr[9] == 0.0f && fArr[10] == 1.0f && fArr[11] == 0.0f && fArr[12] == 0.0f && fArr[13] == 0.0f && fArr[14] == 0.0f && fArr[15] == 1.0f;
    }

    public static final long l(float f11, long j11, long j12) {
        j2.l lVar = j2.d.f68679x;
        long jA = s.a(j11, lVar);
        long jA2 = s.a(j12, lVar);
        float fC = s.c(jA);
        float fG = s.g(jA);
        float f12 = s.f(jA);
        float fD = s.d(jA);
        float fC2 = s.c(jA2);
        float fG2 = s.g(jA2);
        float f13 = s.f(jA2);
        float fD2 = s.d(jA2);
        if (f11 < 0.0f) {
            f11 = 0.0f;
        }
        if (f11 > 1.0f) {
            f11 = 1.0f;
        }
        return s.a(g(bh.g.d0(fG, fG2, f11), bh.g.d0(f12, f13, f11), bh.g.d0(fD, fD2, f11), bh.g.d0(fC, fC2, f11), lVar), s.e(j12));
    }

    public static final float m(long j11) {
        j2.c cVarE = s.e(j11);
        if (!j2.b.a(cVarE.f68656b, j2.b.f68650a)) {
            e0.a("The specified color must be encoded in an RGB color space. The supplied color space is " + ((Object) j2.b.b(cVarE.f68656b)));
        }
        j2.m mVar = ((j2.q) cVarE).f68718p;
        double dB = mVar.b(s.g(j11));
        float fB = (float) ((mVar.b(s.d(j11)) * 0.0722d) + (mVar.b(s.f(j11)) * 0.7152d) + (dB * 0.2126d));
        if (fB < 0.0f) {
            fB = 0.0f;
        }
        if (fB > 1.0f) {
            return 1.0f;
        }
        return fB;
    }

    public static final void n(Matrix matrix, float[] fArr) {
        float f11 = fArr[0];
        float f12 = fArr[1];
        float f13 = fArr[2];
        float f14 = fArr[3];
        float f15 = fArr[4];
        float f16 = fArr[5];
        float f17 = fArr[6];
        float f18 = fArr[7];
        float f19 = fArr[8];
        float f21 = fArr[12];
        float f22 = fArr[13];
        float f23 = fArr[15];
        fArr[0] = f11;
        fArr[1] = f15;
        fArr[2] = f21;
        fArr[3] = f12;
        fArr[4] = f16;
        fArr[5] = f22;
        fArr[6] = f14;
        fArr[7] = f18;
        fArr[8] = f23;
        matrix.setValues(fArr);
        fArr[0] = f11;
        fArr[1] = f12;
        fArr[2] = f13;
        fArr[3] = f14;
        fArr[4] = f15;
        fArr[5] = f16;
        fArr[6] = f17;
        fArr[7] = f18;
        fArr[8] = f19;
    }

    public static final void o(Matrix matrix, float[] fArr) {
        matrix.getValues(fArr);
        float f11 = fArr[0];
        float f12 = fArr[1];
        float f13 = fArr[2];
        float f14 = fArr[3];
        float f15 = fArr[4];
        float f16 = fArr[5];
        float f17 = fArr[6];
        float f18 = fArr[7];
        float f19 = fArr[8];
        fArr[0] = f11;
        fArr[1] = f14;
        fArr[2] = 0.0f;
        fArr[3] = f17;
        fArr[4] = f12;
        fArr[5] = f15;
        fArr[6] = 0.0f;
        fArr[7] = f18;
        fArr[8] = 0.0f;
        fArr[9] = 0.0f;
        fArr[10] = 1.0f;
        fArr[11] = 0.0f;
        fArr[12] = f13;
        fArr[13] = f16;
        fArr[14] = 0.0f;
        fArr[15] = f19;
    }

    public static final long p(h2.c cVar) {
        float f11 = cVar.f59020c - cVar.f59018a;
        float f12 = cVar.f59021d - cVar.f59019b;
        return (Float.floatToRawIntBits(f12) & 4294967295L) | (Float.floatToRawIntBits(f11) << 32);
    }

    public static final BlendMode q(int i5) {
        return i5 == 0 ? BlendMode.CLEAR : i5 == 1 ? BlendMode.SRC : i5 == 2 ? BlendMode.DST : i5 == 3 ? BlendMode.SRC_OVER : i5 == 4 ? BlendMode.DST_OVER : i5 == 5 ? BlendMode.SRC_IN : i5 == 6 ? BlendMode.DST_IN : i5 == 7 ? BlendMode.SRC_OUT : i5 == 8 ? BlendMode.DST_OUT : i5 == 9 ? BlendMode.SRC_ATOP : i5 == 10 ? BlendMode.DST_ATOP : i5 == 11 ? BlendMode.XOR : i5 == 12 ? BlendMode.PLUS : i5 == 13 ? BlendMode.MODULATE : i5 == 14 ? BlendMode.SCREEN : i5 == 15 ? BlendMode.OVERLAY : i5 == 16 ? BlendMode.DARKEN : i5 == 17 ? BlendMode.LIGHTEN : i5 == 18 ? BlendMode.COLOR_DODGE : i5 == 19 ? BlendMode.COLOR_BURN : i5 == 20 ? BlendMode.HARD_LIGHT : i5 == 21 ? BlendMode.SOFT_LIGHT : i5 == 22 ? BlendMode.DIFFERENCE : i5 == 23 ? BlendMode.EXCLUSION : i5 == 24 ? BlendMode.MULTIPLY : i5 == 25 ? BlendMode.HUE : i5 == 26 ? BlendMode.SATURATION : i5 == 27 ? BlendMode.COLOR : i5 == 28 ? BlendMode.LUMINOSITY : BlendMode.SRC_OVER;
    }

    public static final int r(long j11) {
        float[] fArr = j2.d.f68658a;
        long jA = s.a(j11, j2.d.f68662e) >>> 32;
        ULong.Companion companion = ULong.f71699b;
        return (int) jA;
    }

    public static final PorterDuff.Mode s(int i5) {
        return i5 == 0 ? PorterDuff.Mode.CLEAR : i5 == 1 ? PorterDuff.Mode.SRC : i5 == 2 ? PorterDuff.Mode.DST : i5 == 3 ? PorterDuff.Mode.SRC_OVER : i5 == 4 ? PorterDuff.Mode.DST_OVER : i5 == 5 ? PorterDuff.Mode.SRC_IN : i5 == 6 ? PorterDuff.Mode.DST_IN : i5 == 7 ? PorterDuff.Mode.SRC_OUT : i5 == 8 ? PorterDuff.Mode.DST_OUT : i5 == 9 ? PorterDuff.Mode.SRC_ATOP : i5 == 10 ? PorterDuff.Mode.DST_ATOP : i5 == 11 ? PorterDuff.Mode.XOR : i5 == 12 ? PorterDuff.Mode.ADD : i5 == 14 ? PorterDuff.Mode.SCREEN : i5 == 15 ? PorterDuff.Mode.OVERLAY : i5 == 16 ? PorterDuff.Mode.DARKEN : i5 == 17 ? PorterDuff.Mode.LIGHTEN : i5 == 13 ? PorterDuff.Mode.MULTIPLY : PorterDuff.Mode.SRC_OVER;
    }

    public static final int t(float f11, int i5, float[] fArr) {
        float f12 = f11 >= 0.0f ? f11 : 0.0f;
        if (f12 > 1.0f) {
            f12 = 1.0f;
        }
        if (Math.abs(f12 - f11) > 1.05E-6f) {
            f12 = Float.NaN;
        }
        fArr[i5] = f12;
        return !Float.isNaN(f12) ? 1 : 0;
    }

    public abstract h2.c j();
}
