package y80;

import com.vungle.ads.internal.protos.Sdk;
import h6.c1;
import java.net.IDN;
import java.net.InetAddress;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;
import m90.g;
import r70.j;
import r70.k;

/* loaded from: classes.dex */
public abstract class a {
    /* JADX WARN: Code restructure failed: missing block: B:64:0x00cb, code lost:
    
        if (r7 == 16) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x00cd, code lost:
    
        if (r8 != (-1)) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x00d1, code lost:
    
        r0 = r7 - r8;
        java.lang.System.arraycopy(r3, r8, r3, 16 - r0, r0);
        java.util.Arrays.fill(r3, r8, (16 - r7) + r8, (byte) 0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x00e1, code lost:
    
        return java.net.InetAddress.getByAddress(r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:?, code lost:
    
        return null;
     */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00a2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final InetAddress a(int i5, int i11, String str) {
        int i12;
        byte[] bArr = new byte[16];
        int i13 = i5;
        int i14 = 0;
        int i15 = -1;
        int i16 = -1;
        while (true) {
            if (i13 >= i11) {
                break;
            }
            if (i14 == 16) {
                return null;
            }
            int i17 = i13 + 2;
            if (i17 <= i11 && j.H0(i13, str, "::", false)) {
                if (i15 != -1) {
                    return null;
                }
                i14 += 2;
                i15 = i14;
                if (i17 == i11) {
                    break;
                }
                i16 = i17;
                int i18 = 0;
                i13 = i16;
                while (i13 < i11) {
                }
                i12 = i13 - i16;
                return i12 == 0 ? null : null;
            }
            if (i14 != 0) {
                if (j.H0(i13, str, ":", false)) {
                    i13++;
                } else {
                    if (!j.H0(i13, str, ".", false)) {
                        return null;
                    }
                    int i19 = i14 - 2;
                    int i21 = i19;
                    while (i16 < i11) {
                        if (i21 == 16) {
                            return null;
                        }
                        if (i21 != i19) {
                            if (str.charAt(i16) != '.') {
                                return null;
                            }
                            i16++;
                        }
                        int i22 = 0;
                        int i23 = i16;
                        while (i23 < i11) {
                            char cCharAt = str.charAt(i23);
                            if (Intrinsics.h(cCharAt, 48) < 0 || Intrinsics.h(cCharAt, 57) > 0) {
                                break;
                            }
                            if ((i22 == 0 && i16 != i23) || ((i22 * 10) + cCharAt) - 48 > 255) {
                                return null;
                            }
                            i23++;
                        }
                        if (i23 - i16 == 0) {
                            return null;
                        }
                        bArr[i21] = (byte) i22;
                        i21++;
                        i16 = i23;
                    }
                    if (i21 != i14 + 2) {
                        return null;
                    }
                    i14 += 2;
                }
            }
            i16 = i13;
            int i182 = 0;
            i13 = i16;
            while (i13 < i11) {
                int iP = c.p(str.charAt(i13));
                if (iP == -1) {
                    break;
                }
                i182 = (i182 << 4) + iP;
                i13++;
            }
            i12 = i13 - i16;
            if (i12 == 0 && i12 <= 4) {
                int i24 = i14 + 1;
                bArr[i14] = (byte) (255 & (i182 >>> 8));
                i14 += 2;
                bArr[i24] = (byte) (i182 & 255);
            }
        }
    }

    public static final String b(String str) {
        Intrinsics.g(str, "<this>");
        int i5 = 0;
        int i11 = -1;
        if (!k.K0(str, ":", false)) {
            try {
                String ascii = IDN.toASCII(str);
                Intrinsics.f(ascii, "toASCII(host)");
                Locale US = Locale.US;
                Intrinsics.f(US, "US");
                String lowerCase = ascii.toLowerCase(US);
                Intrinsics.f(lowerCase, "this as java.lang.String).toLowerCase(locale)");
                if (lowerCase.length() == 0) {
                    return null;
                }
                int length = lowerCase.length();
                for (int i12 = 0; i12 < length; i12++) {
                    char cCharAt = lowerCase.charAt(i12);
                    if (Intrinsics.h(cCharAt, 31) <= 0 || Intrinsics.h(cCharAt, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) >= 0 || k.R0(cCharAt, 0, 6, " #%/:?@[\\]") != -1) {
                        return null;
                    }
                }
                return lowerCase;
            } catch (IllegalArgumentException unused) {
                return null;
            }
        }
        InetAddress inetAddressA = (j.I0(str, "[", false) && j.A0(str, "]", false)) ? a(1, str.length() - 1, str) : a(0, str.length(), str);
        if (inetAddressA == null) {
            return null;
        }
        byte[] address = inetAddressA.getAddress();
        if (address.length != 16) {
            if (address.length == 4) {
                return inetAddressA.getHostAddress();
            }
            throw new AssertionError(c1.m('\'', "Invalid IPv6 address: '", str));
        }
        int i13 = 0;
        int i14 = 0;
        while (i13 < address.length) {
            int i15 = i13;
            while (i15 < 16 && address[i15] == 0 && address[i15 + 1] == 0) {
                i15 += 2;
            }
            int i16 = i15 - i13;
            if (i16 > i14 && i16 >= 4) {
                i11 = i13;
                i14 = i16;
            }
            i13 = i15 + 2;
        }
        g gVar = new g();
        while (i5 < address.length) {
            if (i5 == i11) {
                gVar.g0(58);
                i5 += i14;
                if (i5 == 16) {
                    gVar.g0(58);
                }
            } else {
                if (i5 > 0) {
                    gVar.g0(58);
                }
                byte b11 = address[i5];
                byte[] bArr = c.f96853a;
                gVar.i0(((b11 & 255) << 8) | (address[i5 + 1] & 255));
                i5 += 2;
            }
        }
        return gVar.P();
    }
}
