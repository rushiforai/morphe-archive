package com.bytedance.sdk.component.zb.ycx.zb;

import b.c0;
import java.net.IDN;
import java.net.InetAddress;
import java.nio.charset.Charset;
import java.util.Locale;

/* loaded from: classes2.dex */
public final class jw {
    public static final Charset ycx = Charset.forName("UTF-8");

    /* JADX WARN: Code restructure failed: missing block: B:41:0x0078, code lost:
    
        if (r4 == 16) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x007a, code lost:
    
        if (r5 != (-1)) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x007c, code lost:
    
        return null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x007d, code lost:
    
        r12 = r4 - r5;
        java.lang.System.arraycopy(r1, r5, r1, 16 - r12, r12);
        java.util.Arrays.fill(r1, r5, (16 - r4) + r5, (byte) 0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x008d, code lost:
    
        return java.net.InetAddress.getByAddress(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x008e, code lost:
    
        r12 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x008f, code lost:
    
        com.bytedance.sdk.openadsdk.oty.sya.ycx(r12, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bCrM=", "bvokmQ==", "X+sumge5QNeWHA==", 186);
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x009f, code lost:
    
        throw new java.lang.AssertionError();
     */
    /* JADX WARN: Removed duplicated region for block: B:31:0x004f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static InetAddress sya(String str, int i5, int i11) {
        int i12;
        byte[] bArr = new byte[16];
        int i13 = 0;
        int i14 = -1;
        int i15 = -1;
        while (true) {
            if (i5 < i11) {
                if (i13 != 16) {
                    int i16 = i5 + 2;
                    if (i16 <= i11 && str.regionMatches(i5, "::", 0, 2)) {
                        if (i14 == -1) {
                            i13 += 2;
                            i14 = i13;
                            if (i16 != i11) {
                                i15 = i16;
                                int i17 = 0;
                                i5 = i15;
                                while (i5 < i11) {
                                }
                                i12 = i5 - i15;
                                if (i12 == 0) {
                                    break;
                                }
                                break;
                                break;
                            }
                            break;
                        }
                        return null;
                    }
                    if (i13 != 0) {
                        if (str.regionMatches(i5, ":", 0, 1)) {
                            i5++;
                        } else {
                            if (!str.regionMatches(i5, ".", 0, 1) || !ycx(str, i15, i11, bArr, i13 - 2)) {
                                return null;
                            }
                            i13 += 2;
                        }
                    }
                    i15 = i5;
                    int i172 = 0;
                    i5 = i15;
                    while (i5 < i11) {
                        int iYcx = ycx(str.charAt(i5));
                        if (iYcx == -1) {
                            break;
                        }
                        i172 = (i172 << 4) + iYcx;
                        i5++;
                    }
                    i12 = i5 - i15;
                    if (i12 == 0 || i12 > 4) {
                        break;
                    }
                    int i18 = i13 + 1;
                    bArr[i13] = (byte) ((i172 >>> 8) & 255);
                    i13 += 2;
                    bArr[i18] = (byte) (i172 & 255);
                } else {
                    return null;
                }
            } else {
                break;
            }
        }
        return null;
    }

    public static int ycx(char c11) {
        if (c11 >= '0' && c11 <= '9') {
            return c11 - '0';
        }
        if (c11 >= 'a' && c11 <= 'f') {
            return c11 - 'W';
        }
        if (c11 < 'A' || c11 > 'F') {
            return -1;
        }
        return c11 - '7';
    }

    public static int zb(String str, int i5, int i11) {
        for (int i12 = i11 - 1; i12 >= i5; i12--) {
            char cCharAt = str.charAt(i12);
            if (cCharAt != '\t' && cCharAt != '\n' && cCharAt != '\f' && cCharAt != '\r' && cCharAt != ' ') {
                return i12 + 1;
            }
        }
        return i5;
    }

    public static void ycx(long j11, long j12, long j13) {
        if ((j12 | j13) < 0 || j12 > j11 || j11 - j12 < j13) {
            throw new ArrayIndexOutOfBoundsException();
        }
    }

    private static boolean zb(String str) {
        for (int i5 = 0; i5 < str.length(); i5++) {
            char cCharAt = str.charAt(i5);
            if (cCharAt <= 31 || cCharAt >= 127 || " #%/:?@[\\]".indexOf(cCharAt) != -1) {
                return true;
            }
        }
        return false;
    }

    public static int ycx(String str, int i5, int i11) {
        while (i5 < i11) {
            char cCharAt = str.charAt(i5);
            if (cCharAt != '\t' && cCharAt != '\n' && cCharAt != '\f' && cCharAt != '\r' && cCharAt != ' ') {
                return i5;
            }
            i5++;
        }
        return i11;
    }

    public static int ycx(String str, int i5, int i11, String str2) {
        while (i5 < i11) {
            if (str2.indexOf(str.charAt(i5)) != -1) {
                return i5;
            }
            i5++;
        }
        return i11;
    }

    public static int ycx(String str, int i5, int i11, char c11) {
        while (i5 < i11) {
            if (str.charAt(i5) == c11) {
                return i5;
            }
            i5++;
        }
        return i11;
    }

    public static String ycx(String str) {
        InetAddress inetAddressSya;
        if (str.contains(":")) {
            if (str.startsWith("[") && str.endsWith("]")) {
                inetAddressSya = sya(str, 1, str.length() - 1);
            } else {
                inetAddressSya = sya(str, 0, str.length());
            }
            if (inetAddressSya == null) {
                return null;
            }
            byte[] address = inetAddressSya.getAddress();
            if (address.length == 16) {
                return ycx(address);
            }
            throw new AssertionError(c0.l("Invalid IPv6 address: '", str, "'"));
        }
        try {
            String lowerCase = IDN.toASCII(str).toLowerCase(Locale.US);
            if (lowerCase.isEmpty()) {
                return null;
            }
            if (zb(lowerCase)) {
                return null;
            }
            return lowerCase;
        } catch (IllegalArgumentException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bCrM=", "bvokmQ==", "WO8jmg21asaMQ81YpB6zPA==", 98);
            return null;
        }
    }

    private static boolean ycx(String str, int i5, int i11, byte[] bArr, int i12) {
        int i13 = i12;
        while (i5 < i11) {
            if (i13 == bArr.length) {
                return false;
            }
            if (i13 != i12) {
                if (str.charAt(i5) != '.') {
                    return false;
                }
                i5++;
            }
            int i14 = i5;
            int i15 = 0;
            while (i14 < i11) {
                char cCharAt = str.charAt(i14);
                if (cCharAt < '0' || cCharAt > '9') {
                    break;
                }
                if ((i15 == 0 && i5 != i14) || (i15 = ((i15 * 10) + cCharAt) - 48) > 255) {
                    return false;
                }
                i14++;
            }
            if (i14 - i5 == 0) {
                return false;
            }
            bArr[i13] = (byte) i15;
            i13++;
            i5 = i14;
        }
        return i13 == i12 + 4;
    }

    private static String ycx(byte[] bArr) {
        int i5 = -1;
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        while (i12 < bArr.length) {
            int i14 = i12;
            while (i14 < 16 && bArr[i14] == 0 && bArr[i14 + 1] == 0) {
                i14 += 2;
            }
            int i15 = i14 - i12;
            if (i15 > i13 && i15 >= 4) {
                i5 = i12;
                i13 = i15;
            }
            i12 = i14 + 2;
        }
        ycx ycxVar = new ycx();
        while (i11 < bArr.length) {
            if (i11 == i5) {
                ycxVar.zb(58);
                i11 += i13;
                if (i11 == 16) {
                    ycxVar.zb(58);
                }
            } else {
                if (i11 > 0) {
                    ycxVar.zb(58);
                }
                ycxVar.zb(((bArr[i11] & 255) << 8) | (bArr[i11 + 1] & 255));
                i11 += 2;
            }
        }
        return ycxVar.sya();
    }

    public static boolean ycx(byte[] bArr, int i5, byte[] bArr2, int i11, int i12) {
        for (int i13 = 0; i13 < i12; i13++) {
            if (bArr[i13 + i5] != bArr2[i13 + i11]) {
                return false;
            }
        }
        return true;
    }
}
