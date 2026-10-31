package ads_mobile_sdk;

import android.util.Base64;
import b.k9;
import java.nio.charset.Charset;

/* loaded from: classes2.dex */
public abstract class xt3 {

    /* renamed from: a, reason: collision with root package name */
    public static final int[] f11829a;

    static {
        int[] iArr = new int[k9.c(((~783368690) & 1480833986) | 1027924228, (783368690 & 1108040386) | 324812860, -1842830590, 189893399) ^ (1189641421 % 1025202362)];
        iArr[0] = 1612548114;
        iArr[1] = 48721154;
        iArr[2] = -644182789;
        iArr[3] = 1279563090;
        f11829a = iArr;
    }

    public static String a(String str) {
        int i5;
        int iC = k9.c(1282602894, 1058515395, -2143848605, 250071570) ^ 440071176;
        int i11 = 0;
        byte[] bArrDecode = Base64.decode(str, 0);
        byte[] bArr = new byte[iC];
        int i12 = 0;
        while (i12 < bArrDecode.length) {
            int i13 = i12 % iC;
            if (i13 == 0) {
                int i14 = i12 >>> 3;
                int i15 = i11;
                int i16 = i15;
                int i17 = i16;
                int iC2 = i17;
                int i18 = iC2;
                int i19 = i18;
                int i21 = i19;
                int i22 = i21;
                int i23 = i22;
                int i24 = i23;
                int i25 = i24;
                int i26 = i25;
                int i27 = i26;
                int i28 = i27;
                int i29 = i28;
                int i31 = i29;
                int i32 = i31;
                i5 = i32;
                int i33 = 1821351989;
                while (true) {
                    if (i33 == 91464932) {
                        int i34 = 751433995 + i33;
                        i33 += 1234789214;
                        if (i15 >= i16) {
                            i33 = i34;
                        }
                    } else if (i33 == 1326254146) {
                        int i35 = i17 >>> i22;
                        int[] iArr = f11829a;
                        iC2 += ((i17 << i18) ^ (i35 + i17)) ^ (i19 + iArr[i19 & i21]);
                        i19 += i23;
                        i17 += ((iC2 << i18) ^ (i35 + iC2)) ^ (i19 + iArr[(i19 >> i24) & i21]);
                        i15++;
                        i33 -= 1234789214;
                    } else {
                        if (i33 != 1821351989) {
                            break;
                        }
                        iC2 = k9.c(175107337, -47385642, 329249954, 47050943) ^ 119739257;
                        i33 -= 1729887057;
                        i21 = 3;
                        i16 = 64;
                        i18 = 4;
                        i22 = 5;
                        i23 = 1340169305;
                        i24 = 11;
                        i31 = 255;
                        i29 = 8;
                        i32 = 2;
                        i28 = 16;
                        i27 = 6;
                        i25 = 7;
                        i26 = 24;
                        i17 = i14;
                        i15 = i5;
                        i19 = i15;
                    }
                }
                bArr[i5] = (byte) (((iC2 & i31) << i26) >> i26);
                bArr[1] = (byte) ((((iC2 >> i29) & i31) << i26) >> i26);
                bArr[i32] = (byte) ((((iC2 >> i28) & i31) << i26) >> i26);
                bArr[i21] = (byte) (iC2 >> i26);
                bArr[i18] = (byte) (((i17 & i31) << i26) >> i26);
                bArr[i22] = (byte) ((((i17 >> i29) & i31) << i26) >> i26);
                bArr[i27] = (byte) ((((i17 >> i28) & i31) << i26) >> i26);
                bArr[i25] = (byte) (i17 >> i26);
            } else {
                i5 = i11;
            }
            bArrDecode[i12] = (byte) (((bArrDecode[i12] ^ bArr[i13]) << 24) >> 24);
            i12++;
            i11 = i5;
        }
        return new String(bArrDecode, Charset.defaultCharset());
    }
}
