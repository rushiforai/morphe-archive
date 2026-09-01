package defpackage;

import com.google.zxing.FormatException;
import java.util.EnumMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wn3 extends fp7 {
    public final /* synthetic */ int h;

    public /* synthetic */ wn3(int i) {
        this.h = i;
    }

    @Override // defpackage.fp7
    public final boolean[] j(String str) {
        boolean[] zArr = null;
        switch (this.h) {
            case 0:
                int length = str.length();
                if (length != 12) {
                    if (length == 13) {
                        try {
                            if (!jzd.F(str)) {
                                throw new IllegalArgumentException("Contents do not pass checksum");
                            }
                        } catch (FormatException unused) {
                            ay0.e("Illegal contents");
                        }
                    } else {
                        ay0.e("Requested contents should be 12 or 13 digits long, but got ".concat(String.valueOf(length)));
                    }
                    return zArr;
                }
                try {
                    str = b09.w(jzd.G(str), str);
                } catch (FormatException e) {
                    throw new IllegalArgumentException(e);
                }
                int i = vn3.j[Character.digit(str.charAt(0), 10)];
                zArr = new boolean[95];
                int iH = fp7.h(zArr, 0, jzd.e, true);
                for (int i2 = 1; i2 <= 6; i2++) {
                    int iDigit = Character.digit(str.charAt(i2), 10);
                    if (((i >> (6 - i2)) & 1) == 1) {
                        iDigit += 10;
                    }
                    iH += fp7.h(zArr, iH, jzd.i[iDigit], false);
                }
                int iH2 = fp7.h(zArr, iH, jzd.f, false) + iH;
                for (int i3 = 7; i3 <= 12; i3++) {
                    iH2 += fp7.h(zArr, iH2, jzd.h[Character.digit(str.charAt(i3), 10)], true);
                }
                fp7.h(zArr, iH2, jzd.e, true);
                return zArr;
            case 1:
                int length2 = str.length();
                if (length2 != 7) {
                    if (length2 == 8) {
                        try {
                            if (!jzd.F(str)) {
                                throw new IllegalArgumentException("Contents do not pass checksum");
                            }
                        } catch (FormatException unused2) {
                            ay0.e("Illegal contents");
                        }
                    } else {
                        ay0.e("Requested contents should be 8 digits long, but got ".concat(String.valueOf(length2)));
                    }
                    return zArr;
                }
                try {
                    str = b09.w(jzd.G(str), str);
                } catch (FormatException e2) {
                    throw new IllegalArgumentException(e2);
                }
                zArr = new boolean[67];
                int iH3 = fp7.h(zArr, 0, jzd.e, true);
                for (int i4 = 0; i4 <= 3; i4++) {
                    iH3 += fp7.h(zArr, iH3, jzd.h[Character.digit(str.charAt(i4), 10)], false);
                }
                int iH4 = fp7.h(zArr, iH3, jzd.f, false) + iH3;
                for (int i5 = 4; i5 <= 7; i5++) {
                    iH4 += fp7.h(zArr, iH4, jzd.h[Character.digit(str.charAt(i5), 10)], true);
                }
                fp7.h(zArr, iH4, jzd.e, true);
                return zArr;
            default:
                int length3 = str.length();
                if (length3 != 7) {
                    if (length3 == 8) {
                        try {
                            if (!jzd.F(str)) {
                                throw new IllegalArgumentException("Contents do not pass checksum");
                            }
                        } catch (FormatException unused3) {
                            ay0.e("Illegal contents");
                        }
                    } else {
                        ay0.e("Requested contents should be 8 digits long, but got ".concat(String.valueOf(length3)));
                    }
                    return zArr;
                }
                try {
                    str = b09.w(jzd.G(vn3.H(str)), str);
                } catch (FormatException e3) {
                    throw new IllegalArgumentException(e3);
                }
                int iDigit2 = Character.digit(str.charAt(0), 10);
                if (iDigit2 == 0 || iDigit2 == 1) {
                    int i6 = vn3.k[iDigit2][Character.digit(str.charAt(7), 10)];
                    zArr = new boolean[51];
                    int iH5 = fp7.h(zArr, 0, jzd.e, true);
                    for (int i7 = 1; i7 <= 6; i7++) {
                        int iDigit3 = Character.digit(str.charAt(i7), 10);
                        if (((i6 >> (6 - i7)) & 1) == 1) {
                            iDigit3 += 10;
                        }
                        iH5 += fp7.h(zArr, iH5, jzd.i[iDigit3], false);
                    }
                    fp7.h(zArr, iH5, jzd.g, false);
                } else {
                    ay0.e("Number system must be 0 or 1");
                }
                return zArr;
        }
    }

    @Override // defpackage.fp7, defpackage.k9f
    public final sr0 l(String str, xm0 xm0Var, EnumMap enumMap) {
        switch (this.h) {
            case 0:
                if (xm0Var != xm0.EAN_13) {
                    ay0.e("Can only encode EAN_13, but got ".concat(String.valueOf(xm0Var)));
                }
                break;
            case 1:
                if (xm0Var != xm0.EAN_8) {
                    ay0.e("Can only encode EAN_8, but got ".concat(String.valueOf(xm0Var)));
                }
                break;
            default:
                if (xm0Var != xm0.UPC_E) {
                    ay0.e("Can only encode UPC_E, but got ".concat(String.valueOf(xm0Var)));
                }
                break;
        }
        return null;
    }

    @Override // defpackage.fp7
    public final int m() {
        return 9;
    }
}
