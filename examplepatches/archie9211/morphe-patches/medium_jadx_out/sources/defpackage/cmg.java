package defpackage;

import android.util.Base64;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class cmg {
    public static final int[] a;

    static {
        int i = (((((~1722060049) & 1087578896) | 70644109) + ((1722060049 & 1625428690) | 673239279)) - 1747544103) ^ (860516127 % 777720504);
        int i2 = (((((~114723506) & 52765200) | 1504827370) + ((114723506 & 100966712) | 1017237868)) - (-1748371200)) ^ (1737518944 % 282828202);
        int i3 = (((((~231602422) & 1981743248) | 619185297) + ((231602422 & 1394017288) | 694738366)) - 848430431) ^ (555996658 % 324763920);
        int i4 = (((((~349517445) & 1770783989) | 1585637523) + ((349517445 & 828130404) | 441534467)) - 1774508072) ^ (1876855542 % 1069755936);
        int i5 = (((((~1516266761) & 1782097396) | 344332582) + ((1516266761 & (-84368174)) | (-1782381821))) - 1275643770) ^ (1941690360 % 410409117);
        int[] iArr = new int[i4];
        iArr[0] = i3;
        iArr[1] = i2;
        iArr[i] = i5;
        iArr[(((((~941804289) & 1357939303) | 957737644) + ((941804289 & 1122967875) | 857694484)) - (-1789630799)) ^ (1983228458 % 1584710873)] = (((((~19485054) & 2051640702) | 149180849) + ((19485054 & 1913244879) | 25584561)) - 774730301) ^ (521035021 % 40610537);
        a = iArr;
    }

    public static String a(String str) {
        int i;
        int i2 = 0;
        byte[] bArrDecode = Base64.decode(str, 0);
        byte[] bArr = new byte[8];
        int i3 = 0;
        while (i3 < bArrDecode.length) {
            int i4 = i3 % 8;
            if (i4 == 0) {
                int i5 = i3 >>> 3;
                int i6 = 766531234;
                int i7 = i2;
                int i8 = i7;
                int i9 = i8;
                int i10 = i9;
                int i11 = i10;
                int i12 = i11;
                int i13 = i12;
                int i14 = i13;
                int i15 = i14;
                int i16 = i15;
                int i17 = i16;
                int i18 = i17;
                int i19 = i18;
                i = i19;
                int i20 = i;
                int i21 = i20;
                int i22 = i21;
                while (i6 != 404765852) {
                    if (i6 == 444298960) {
                        int i23 = (-39533108) + i6;
                        i6 += 346719694;
                        if (i2 >= i7) {
                            i6 = i23;
                        }
                    } else if (i6 != 791018654) {
                        i6 -= 322232274;
                        i14 = 3;
                        i17 = 5;
                        i9 = 255;
                        i12 = 2;
                        i22 = 11;
                        i21 = 1340169305;
                        i15 = 4;
                        i7 = 64;
                        i8 = -236335227;
                        i13 = 16;
                        i18 = 6;
                        i19 = 7;
                        i16 = i5;
                        i2 = i;
                        i20 = i2;
                        i10 = 24;
                        i11 = 8;
                    } else {
                        int i24 = i16 >>> i17;
                        int[] iArr = a;
                        i8 += ((i16 << i15) ^ (i24 + i16)) ^ (i20 + iArr[i20 & i14]);
                        i20 += i21;
                        i16 += ((i8 << i15) ^ (i24 + i8)) ^ (i20 + iArr[(i20 >> i22) & i14]);
                        i2++;
                        i6 -= 346719694;
                    }
                }
                bArr[i] = (byte) (((i8 & i9) << i10) >> i10);
                bArr[1] = (byte) ((((i8 >> i11) & i9) << i10) >> i10);
                bArr[i12] = (byte) ((((i8 >> i13) & i9) << i10) >> i10);
                bArr[i14] = (byte) (i8 >> i10);
                bArr[i15] = (byte) (((i16 & i9) << i10) >> i10);
                bArr[i17] = (byte) ((((i16 >> i11) & i9) << i10) >> i10);
                bArr[i18] = (byte) ((((i16 >> i13) & i9) << i10) >> i10);
                bArr[i19] = (byte) (i16 >> i10);
                i4 = i;
            } else {
                i = i2;
            }
            bArrDecode[i3] = (byte) (((bArrDecode[i3] ^ bArr[i4]) << 24) >> 24);
            i3++;
            i2 = i;
        }
        return new String(bArrDecode, Charset.defaultCharset());
    }
}
