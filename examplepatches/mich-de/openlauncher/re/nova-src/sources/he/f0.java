package he;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class f0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f59695a;

    /* renamed from: b, reason: collision with root package name */
    public final int f59696b;

    /* renamed from: c, reason: collision with root package name */
    public final float f59697c;

    /* renamed from: d, reason: collision with root package name */
    public final float f59698d;

    /* renamed from: e, reason: collision with root package name */
    public final float f59699e;

    /* renamed from: f, reason: collision with root package name */
    public final int f59700f;

    /* renamed from: g, reason: collision with root package name */
    public final int f59701g;

    /* renamed from: h, reason: collision with root package name */
    public final int f59702h;

    /* renamed from: i, reason: collision with root package name */
    public final short[] f59703i;

    /* renamed from: j, reason: collision with root package name */
    public short[] f59704j;

    /* renamed from: k, reason: collision with root package name */
    public int f59705k;

    /* renamed from: l, reason: collision with root package name */
    public short[] f59706l;

    /* renamed from: m, reason: collision with root package name */
    public int f59707m;
    public short[] n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public int f59708p;

    /* renamed from: q, reason: collision with root package name */
    public int f59709q;

    /* renamed from: r, reason: collision with root package name */
    public int f59710r;

    /* renamed from: s, reason: collision with root package name */
    public int f59711s;

    /* renamed from: t, reason: collision with root package name */
    public int f59712t;

    /* renamed from: u, reason: collision with root package name */
    public int f59713u;

    /* renamed from: v, reason: collision with root package name */
    public int f59714v;

    public f0(float f11, float f12, int i5, int i11, int i12) {
        this.f59695a = i5;
        this.f59696b = i11;
        this.f59697c = f11;
        this.f59698d = f12;
        this.f59699e = i5 / i12;
        this.f59700f = i5 / Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE;
        int i13 = i5 / 65;
        this.f59701g = i13;
        int i14 = i13 * 2;
        this.f59702h = i14;
        this.f59703i = new short[i14];
        this.f59704j = new short[i14 * i11];
        this.f59706l = new short[i14 * i11];
        this.n = new short[i14 * i11];
    }

    public static void e(int i5, int i11, short[] sArr, int i12, short[] sArr2, int i13, short[] sArr3, int i14) {
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

    public final void a(short[] sArr, int i5, int i11) {
        short[] sArrC = c(this.f59706l, this.f59707m, i11);
        this.f59706l = sArrC;
        int i12 = this.f59696b;
        System.arraycopy(sArr, i5 * i12, sArrC, this.f59707m * i12, i12 * i11);
        this.f59707m += i11;
    }

    public final void b(short[] sArr, int i5, int i11) {
        int i12 = this.f59702h / i11;
        int i13 = this.f59696b;
        int i14 = i11 * i13;
        int i15 = i5 * i13;
        for (int i16 = 0; i16 < i12; i16++) {
            int i17 = 0;
            for (int i18 = 0; i18 < i14; i18++) {
                i17 += sArr[(i16 * i14) + i15 + i18];
            }
            this.f59703i[i16] = (short) (i17 / i14);
        }
    }

    public final short[] c(short[] sArr, int i5, int i11) {
        int length = sArr.length;
        int i12 = this.f59696b;
        int i13 = length / i12;
        return i5 + i11 <= i13 ? sArr : Arrays.copyOf(sArr, (((i13 * 3) / 2) + i11) * i12);
    }

    public final int d(short[] sArr, int i5, int i11, int i12) {
        int i13 = i5 * this.f59696b;
        int i14 = 255;
        int i15 = 1;
        int i16 = 0;
        int i17 = 0;
        while (i11 <= i12) {
            int iAbs = 0;
            for (int i18 = 0; i18 < i11; i18++) {
                iAbs += Math.abs(sArr[i13 + i18] - sArr[(i13 + i11) + i18]);
            }
            if (iAbs * i16 < i15 * i11) {
                i16 = i11;
                i15 = iAbs;
            }
            if (iAbs * i14 > i17 * i11) {
                i14 = i11;
                i17 = iAbs;
            }
            i11++;
        }
        this.f59713u = i15 / i16;
        this.f59714v = i17 / i14;
        return i16;
    }

    public final void f() {
        float f11;
        float f12;
        float f13;
        double d5;
        int iD;
        int i5;
        int i11;
        int i12;
        int i13;
        int i14;
        int i15;
        int i16;
        int i17 = this.f59707m;
        float f14 = this.f59697c;
        float f15 = this.f59698d;
        float f16 = f14 / f15;
        float f17 = this.f59699e * f15;
        double d11 = f16;
        int i18 = this.f59695a;
        int i19 = 1;
        int i21 = this.f59696b;
        if (d11 > 1.00001d || d11 < 0.99999d) {
            int i22 = this.f59705k;
            int i23 = this.f59702h;
            if (i22 >= i23) {
                int i24 = 0;
                while (true) {
                    int i25 = this.f59710r;
                    if (i25 > 0) {
                        int iMin = Math.min(i23, i25);
                        a(this.f59704j, i24, iMin);
                        this.f59710r -= iMin;
                        i24 += iMin;
                        f12 = f16;
                        f13 = f17;
                        d5 = d11;
                        f11 = 1.0f;
                    } else {
                        short[] sArr = this.f59704j;
                        int i26 = i18 > 4000 ? i18 / 4000 : i19;
                        f11 = 1.0f;
                        int i27 = this.f59701g;
                        int i28 = this.f59700f;
                        if (i21 == i19 && i26 == i19) {
                            iD = d(sArr, i24, i28, i27);
                            f12 = f16;
                            f13 = f17;
                            d5 = d11;
                        } else {
                            b(sArr, i24, i26);
                            f12 = f16;
                            f13 = f17;
                            short[] sArr2 = this.f59703i;
                            d5 = d11;
                            int iD2 = d(sArr2, 0, i28 / i26, i27 / i26);
                            if (i26 != 1) {
                                int i29 = iD2 * i26;
                                int i31 = i26 * 4;
                                int i32 = i29 - i31;
                                int i33 = i29 + i31;
                                if (i32 >= i28) {
                                    i28 = i32;
                                }
                                if (i33 <= i27) {
                                    i27 = i33;
                                }
                                if (i21 == 1) {
                                    iD = d(sArr, i24, i28, i27);
                                } else {
                                    b(sArr, i24, 1);
                                    iD = d(sArr2, 0, i28, i27);
                                }
                            } else {
                                iD = iD2;
                            }
                        }
                        int i34 = this.f59713u;
                        int i35 = this.f59714v;
                        if (i34 == 0 || (i5 = this.f59711s) == 0 || i35 > i34 * 3 || i34 * 2 <= this.f59712t * 3) {
                            i5 = iD;
                        }
                        this.f59712t = i34;
                        this.f59711s = iD;
                        if (d5 > 1.0d) {
                            short[] sArr3 = this.f59704j;
                            if (f12 >= 2.0f) {
                                i12 = (int) (i5 / (f12 - 1.0f));
                            } else {
                                this.f59710r = (int) (((2.0f - f12) * i5) / (f12 - 1.0f));
                                i12 = i5;
                            }
                            short[] sArrC = c(this.f59706l, this.f59707m, i12);
                            this.f59706l = sArrC;
                            int i36 = i24 + i5;
                            int i37 = i24;
                            int i38 = i12;
                            e(i38, this.f59696b, sArrC, this.f59707m, sArr3, i37, sArr3, i36);
                            this.f59707m += i38;
                            i24 = i5 + i38 + i37;
                        } else {
                            int i39 = i24;
                            short[] sArr4 = this.f59704j;
                            if (f12 < 0.5f) {
                                i11 = (int) ((i5 * f12) / (1.0f - f12));
                            } else {
                                this.f59710r = (int) ((((2.0f * f12) - 1.0f) * i5) / (1.0f - f12));
                                i11 = i5;
                            }
                            int i40 = i5 + i11;
                            short[] sArrC2 = c(this.f59706l, this.f59707m, i40);
                            this.f59706l = sArrC2;
                            System.arraycopy(sArr4, i39 * i21, sArrC2, this.f59707m * i21, i5 * i21);
                            e(i11, this.f59696b, this.f59706l, this.f59707m + i5, sArr4, i39 + i5, sArr4, i39);
                            this.f59707m += i40;
                            i24 = i39 + i11;
                        }
                    }
                    if (i24 + i23 > i22) {
                        break;
                    }
                    i19 = 1;
                    f16 = f12;
                    f17 = f13;
                    d11 = d5;
                }
                int i41 = this.f59705k - i24;
                short[] sArr5 = this.f59704j;
                System.arraycopy(sArr5, i24 * i21, sArr5, 0, i41 * i21);
                this.f59705k = i41;
            }
            if (f13 != f11 || this.f59707m == i17) {
            }
            int i42 = (int) (i18 / f13);
            while (true) {
                if (i42 <= 16384 && i18 <= 16384) {
                    break;
                }
                i42 /= 2;
                i18 /= 2;
            }
            int i43 = this.f59707m - i17;
            short[] sArrC3 = c(this.n, this.o, i43);
            this.n = sArrC3;
            System.arraycopy(this.f59706l, i17 * i21, sArrC3, this.o * i21, i43 * i21);
            this.f59707m = i17;
            this.o += i43;
            int i44 = 0;
            while (true) {
                i13 = this.o;
                i14 = i13 - 1;
                if (i44 >= i14) {
                    break;
                }
                while (true) {
                    i15 = this.f59708p + 1;
                    int i45 = i15 * i42;
                    i16 = this.f59709q;
                    if (i45 <= i16 * i18) {
                        break;
                    }
                    this.f59706l = c(this.f59706l, this.f59707m, 1);
                    for (int i46 = 0; i46 < i21; i46++) {
                        short[] sArr6 = this.f59706l;
                        int i47 = (this.f59707m * i21) + i46;
                        short[] sArr7 = this.n;
                        int i48 = (i44 * i21) + i46;
                        short s11 = sArr7[i48];
                        short s12 = sArr7[i48 + i21];
                        int i49 = this.f59709q * i18;
                        int i51 = this.f59708p;
                        int i52 = i51 * i42;
                        int i53 = (i51 + 1) * i42;
                        int i54 = i53 - i49;
                        int i55 = i53 - i52;
                        sArr6[i47] = (short) ((((i55 - i54) * s12) + (s11 * i54)) / i55);
                    }
                    this.f59709q++;
                    this.f59707m++;
                }
                this.f59708p = i15;
                if (i15 == i18) {
                    this.f59708p = 0;
                    wf.a.i(i16 == i42);
                    this.f59709q = 0;
                }
                i44++;
            }
            if (i14 == 0) {
                return;
            }
            short[] sArr8 = this.n;
            System.arraycopy(sArr8, i14 * i21, sArr8, 0, (i13 - i14) * i21);
            this.o -= i14;
            return;
        }
        a(this.f59704j, 0, this.f59705k);
        this.f59705k = 0;
        f13 = f17;
        f11 = 1.0f;
        if (f13 != f11) {
        }
    }
}
