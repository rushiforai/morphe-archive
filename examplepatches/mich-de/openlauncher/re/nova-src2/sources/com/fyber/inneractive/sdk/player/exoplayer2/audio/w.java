package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final int f29062a;

    /* renamed from: b, reason: collision with root package name */
    public final int f29063b;

    /* renamed from: c, reason: collision with root package name */
    public final int f29064c;

    /* renamed from: d, reason: collision with root package name */
    public final int f29065d;

    /* renamed from: e, reason: collision with root package name */
    public final int f29066e;

    /* renamed from: f, reason: collision with root package name */
    public final short[] f29067f;

    /* renamed from: g, reason: collision with root package name */
    public int f29068g;

    /* renamed from: h, reason: collision with root package name */
    public short[] f29069h;

    /* renamed from: i, reason: collision with root package name */
    public int f29070i;

    /* renamed from: j, reason: collision with root package name */
    public short[] f29071j;

    /* renamed from: k, reason: collision with root package name */
    public int f29072k;

    /* renamed from: l, reason: collision with root package name */
    public short[] f29073l;

    /* renamed from: q, reason: collision with root package name */
    public int f29076q;

    /* renamed from: r, reason: collision with root package name */
    public int f29077r;

    /* renamed from: s, reason: collision with root package name */
    public int f29078s;

    /* renamed from: t, reason: collision with root package name */
    public int f29079t;

    /* renamed from: v, reason: collision with root package name */
    public int f29081v;

    /* renamed from: w, reason: collision with root package name */
    public int f29082w;

    /* renamed from: x, reason: collision with root package name */
    public int f29083x;

    /* renamed from: m, reason: collision with root package name */
    public int f29074m = 0;
    public int n = 0;

    /* renamed from: u, reason: collision with root package name */
    public int f29080u = 0;
    public float o = 1.0f;

    /* renamed from: p, reason: collision with root package name */
    public float f29075p = 1.0f;

    public w(int i5, int i11) {
        this.f29062a = i5;
        this.f29063b = i11;
        this.f29064c = i5 / Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE;
        int i12 = i5 / 65;
        this.f29065d = i12;
        int i13 = i12 * 2;
        this.f29066e = i13;
        this.f29067f = new short[i13];
        this.f29068g = i13;
        int i14 = i11 * i13;
        this.f29069h = new short[i14];
        this.f29070i = i13;
        this.f29071j = new short[i14];
        this.f29072k = i13;
        this.f29073l = new short[i14];
    }

    public final void a(int i5) {
        int i11 = this.f29076q + i5;
        int i12 = this.f29068g;
        if (i11 > i12) {
            int i13 = (i12 / 2) + i5 + i12;
            this.f29068g = i13;
            this.f29069h = Arrays.copyOf(this.f29069h, i13 * this.f29063b);
        }
    }

    public final void b(int i5) {
        int i11 = this.f29077r + i5;
        int i12 = this.f29070i;
        if (i11 > i12) {
            int i13 = (i12 / 2) + i5 + i12;
            this.f29070i = i13;
            this.f29071j = Arrays.copyOf(this.f29071j, i13 * this.f29063b);
        }
    }

    public final void a(short[] sArr, int i5, int i11) {
        int i12 = this.f29066e / i11;
        int i13 = this.f29063b;
        int i14 = i11 * i13;
        int i15 = i5 * i13;
        for (int i16 = 0; i16 < i12; i16++) {
            int i17 = 0;
            for (int i18 = 0; i18 < i14; i18++) {
                i17 += sArr[(i16 * i14) + i15 + i18];
            }
            this.f29067f[i16] = (short) (i17 / i14);
        }
    }

    public final int a(short[] sArr, int i5, int i11, int i12) {
        int i13 = i5 * this.f29063b;
        int i14 = 255;
        int i15 = 1;
        int i16 = 0;
        int i17 = 0;
        while (i11 <= i12) {
            int i18 = 0;
            for (int i19 = 0; i19 < i11; i19++) {
                short s11 = sArr[i13 + i19];
                short s12 = sArr[i13 + i11 + i19];
                i18 += s11 >= s12 ? s11 - s12 : s12 - s11;
            }
            if (i18 * i16 < i15 * i11) {
                i16 = i11;
                i15 = i18;
            }
            if (i18 * i14 > i17 * i11) {
                i14 = i11;
                i17 = i18;
            }
            i11++;
        }
        this.f29082w = i15 / i16;
        this.f29083x = i17 / i14;
        return i16;
    }

    /* JADX WARN: Removed duplicated region for block: B:103:0x0253 A[LOOP:4: B:13:0x0048->B:103:0x0253, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0175 A[EDGE_INSN: B:113:0x0175->B:65:0x0175 BREAK  A[LOOP:4: B:13:0x0048->B:103:0x0253], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a() {
        int iA;
        int i5;
        float f11;
        int i11;
        int iMin;
        int i12;
        int i13;
        float f12;
        int i14;
        int i15;
        int i16 = this.f29077r;
        float f13 = this.o / this.f29075p;
        double d5 = f13;
        float f14 = 1.0f;
        int i17 = 1;
        if (d5 <= 1.00001d && d5 >= 0.99999d) {
            short[] sArr = this.f29069h;
            int i18 = this.f29076q;
            b(i18);
            int i19 = this.f29063b;
            System.arraycopy(sArr, 0, this.f29071j, this.f29077r * i19, i19 * i18);
            this.f29077r += i18;
            this.f29076q = 0;
        } else {
            int i21 = this.f29076q;
            if (i21 >= this.f29066e) {
                int i22 = 0;
                while (true) {
                    int i23 = this.f29079t;
                    if (i23 > 0) {
                        iMin = Math.min(this.f29066e, i23);
                        short[] sArr2 = this.f29069h;
                        b(iMin);
                        int i24 = this.f29063b;
                        System.arraycopy(sArr2, i22 * i24, this.f29071j, this.f29077r * i24, i24 * iMin);
                        this.f29077r += iMin;
                        this.f29079t -= iMin;
                        f11 = f14;
                        i11 = i17;
                    } else {
                        short[] sArr3 = this.f29069h;
                        int i25 = this.f29062a;
                        int i26 = i25 > 4000 ? i25 / 4000 : i17;
                        if (this.f29063b == i17 && i26 == i17) {
                            iA = a(sArr3, i22, this.f29064c, this.f29065d);
                        } else {
                            a(sArr3, i22, i26);
                            int iA2 = a(this.f29067f, 0, this.f29064c / i26, this.f29065d / i26);
                            if (i26 != i17) {
                                int i27 = iA2 * i26;
                                int i28 = i26 * 4;
                                int i29 = i27 - i28;
                                int i31 = i27 + i28;
                                int i32 = this.f29064c;
                                if (i29 < i32) {
                                    i29 = i32;
                                }
                                int i33 = this.f29065d;
                                if (i31 > i33) {
                                    i31 = i33;
                                }
                                if (this.f29063b == i17) {
                                    iA = a(sArr3, i22, i29, i31);
                                } else {
                                    a(sArr3, i22, i17);
                                    iA = a(this.f29067f, 0, i29, i31);
                                }
                            } else {
                                iA = iA2;
                            }
                        }
                        int i34 = this.f29082w;
                        int i35 = (i34 == 0 || (i13 = this.f29080u) == 0 || this.f29083x > i34 * 3 || i34 * 2 <= this.f29081v * 3) ? iA : i13;
                        this.f29081v = i34;
                        this.f29080u = iA;
                        if (d5 > 1.0d) {
                            short[] sArr4 = this.f29069h;
                            if (f13 >= 2.0f) {
                                i12 = (int) (i35 / (f13 - f14));
                            } else {
                                this.f29079t = (int) (((2.0f - f13) * i35) / (f13 - f14));
                                i12 = i35;
                            }
                            b(i12);
                            int i36 = i35;
                            a(i12, this.f29063b, this.f29071j, this.f29077r, sArr4, i22, sArr4, i22 + i36);
                            this.f29077r += i12;
                            f11 = f14;
                            i11 = i17;
                            i22 = i36 + i12 + i22;
                            if (this.f29066e + i22 <= i21) {
                                break;
                            }
                            f14 = f11;
                            i17 = i11;
                        } else {
                            int i37 = i35;
                            short[] sArr5 = this.f29069h;
                            if (f13 < 0.5f) {
                                i5 = (int) ((i37 * f13) / (f14 - f13));
                            } else {
                                this.f29079t = (int) ((((2.0f * f13) - f14) * i37) / (f14 - f13));
                                i5 = i37;
                            }
                            int i38 = i37 + i5;
                            b(i38);
                            int i39 = this.f29063b;
                            f11 = f14;
                            i11 = i17;
                            System.arraycopy(sArr5, i22 * i39, this.f29071j, this.f29077r * i39, i39 * i37);
                            int i40 = i22;
                            a(i5, this.f29063b, this.f29071j, this.f29077r + i37, sArr5, i22 + i37, sArr5, i40);
                            i22 = i40;
                            this.f29077r += i38;
                            iMin = i5;
                        }
                    }
                    i22 += iMin;
                    if (this.f29066e + i22 <= i21) {
                    }
                }
                int i41 = this.f29076q - i22;
                short[] sArr6 = this.f29069h;
                int i42 = this.f29063b;
                System.arraycopy(sArr6, i22 * i42, sArr6, 0, i42 * i41);
                this.f29076q = i41;
            }
            f12 = this.f29075p;
            if (f12 != f11 || this.f29077r == i16) {
            }
            int i43 = this.f29062a;
            int i44 = (int) (i43 / f12);
            while (true) {
                if (i44 <= 16384 && i43 <= 16384) {
                    break;
                }
                i44 /= 2;
                i43 /= 2;
            }
            int i45 = this.f29077r - i16;
            int i46 = this.f29078s + i45;
            int i47 = this.f29072k;
            if (i46 > i47) {
                int i48 = (i47 / 2) + i45 + i47;
                this.f29072k = i48;
                this.f29073l = Arrays.copyOf(this.f29073l, i48 * this.f29063b);
            }
            short[] sArr7 = this.f29071j;
            int i49 = this.f29063b;
            System.arraycopy(sArr7, i16 * i49, this.f29073l, this.f29078s * i49, i49 * i45);
            this.f29077r = i16;
            this.f29078s += i45;
            int i51 = 0;
            while (true) {
                int i52 = this.f29078s;
                int i53 = i52 - 1;
                if (i51 >= i53) {
                    if (i53 == 0) {
                        return;
                    }
                    short[] sArr8 = this.f29073l;
                    int i54 = this.f29063b;
                    System.arraycopy(sArr8, i53 * i54, sArr8, 0, (i52 - i53) * i54);
                    this.f29078s -= i53;
                    return;
                }
                while (true) {
                    i14 = this.f29074m + 1;
                    int i55 = i14 * i44;
                    i15 = this.n;
                    if (i55 <= i15 * i43) {
                        break;
                    }
                    b(i11);
                    int i56 = 0;
                    while (true) {
                        int i57 = this.f29063b;
                        if (i56 < i57) {
                            short[] sArr9 = this.f29071j;
                            int i58 = (this.f29077r * i57) + i56;
                            short[] sArr10 = this.f29073l;
                            int i59 = (i51 * i57) + i56;
                            short s11 = sArr10[i59];
                            short s12 = sArr10[i59 + i57];
                            int i61 = this.n * i43;
                            int i62 = this.f29074m;
                            int i63 = i62 * i44;
                            int i64 = (i62 + 1) * i44;
                            int i65 = i64 - i61;
                            int i66 = i64 - i63;
                            sArr9[i58] = (short) ((((i66 - i65) * s12) + (s11 * i65)) / i66);
                            i56++;
                        }
                    }
                    i11 = 1;
                    this.n++;
                    this.f29077r++;
                }
                this.f29074m = i14;
                if (i14 == i43) {
                    this.f29074m = 0;
                    if (i15 == i44) {
                        this.n = 0;
                    } else {
                        throw new IllegalStateException();
                    }
                }
                i51++;
            }
        }
        f11 = 1.0f;
        i11 = 1;
        f12 = this.f29075p;
        if (f12 != f11) {
        }
    }

    public static void a(int i5, int i11, short[] sArr, int i12, short[] sArr2, int i13, short[] sArr3, int i14) {
        for (int i15 = 0; i15 < i11; i15++) {
            int i16 = (i12 * i11) + i15;
            int i17 = (i14 * i11) + i15;
            int i18 = (i13 * i11) + i15;
            for (int i19 = 0; i19 < i5; i19++) {
                sArr[i16] = (short) (((sArr3[i17] * i19) + ((i5 - i19) * sArr2[i18])) / i5);
                i16 += i11;
                i18 += i11;
                i17 += i11;
            }
        }
    }
}
