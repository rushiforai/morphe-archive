package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.IOException;

@MetaExoPlayerCustomization
/* renamed from: com.facebook.ads.redexgen.X.b8, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1483b8 {
    public static String[] A00 = {"byjuLDSAzhwRGO7eKKPI3or4AjnenBfg", "BT7bwZqbuVe6NV2hX8Ecfp0mExchBrJu", "aAG2C4tSMMggRHfXlZpibIt7s3KN1quw", "20ZxdlGZmGUMkXVcBqc3NOAHKm2atkKo", "d84S0i0AZIa6E3JHHu7iVpzB1yidxeR7", "LrYdV1XxeE5MkXAYS54WiQwkvWuBaZAe", "Si4gdBsV7XbcFojchbGSMgBQBQBK0sit", "BYheausTDQAkRyRY2BEjJPVsFpUkSvHM"};
    public static final int[] A01 = {1769172845, 1769172786, 1769172787, 1769172788, 1769172789, 1769172790, 1769172793, 1635148593, 1752589105, 1751479857, 1635135537, 1836069937, 1836069938, 862401121, 862401122, 862417462, 862417718, 862414134, 862414646, 1295275552, 1295270176, 1714714144, 1801741417, 1295275600, 1903435808, 1297305174, 1684175153, 1769172332, 1885955686};

    public static boolean A00(int i5, boolean z11) {
        if ((i5 >>> 8) == 3368816) {
            return true;
        }
        if (i5 == 1751476579 && z11) {
            return true;
        }
        for (int i11 : A01) {
            if (i11 == i5) {
                return true;
            }
        }
        return false;
    }

    public static boolean A01(Q9 q92) throws IOException {
        return A03(q92, true, false);
    }

    public static boolean A02(Q9 q92, boolean z11) throws IOException {
        return A03(q92, false, z11);
    }

    /* JADX WARN: Code restructure failed: missing block: B:66:0x0124, code lost:
    
        if (r18 != false) goto L97;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0126, code lost:
    
        return false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A03(Q9 q92, boolean z11, boolean z12) throws IOException {
        long jA90 = q92.A90();
        long inputLength = 4096;
        if (jA90 != -1 && jA90 <= 4096) {
            inputLength = jA90;
        }
        int i5 = (int) inputLength;
        C1084Mk c1084Mk = new C1084Mk(64);
        int i11 = 0;
        boolean z13 = false;
        boolean z14 = false;
        while (i11 < i5) {
            int i12 = 8;
            c1084Mk.A0d(8);
            boolean zAI7 = q92.AI7(c1084Mk.A0l(), 0, 8, true);
            String[] strArr = A00;
            if (strArr[2].charAt(4) != strArr[3].charAt(4)) {
                A00[5] = "m00lnZKg3AS2XW8qA0V7ArZlWhVusfYO";
                if (!zAI7) {
                    break;
                }
                long jA0Q = c1084Mk.A0Q();
                int headerSize = c1084Mk.A0C();
                if (jA0Q == 1) {
                    i12 = 16;
                    q92.AI6(c1084Mk.A0l(), 8, 8);
                    c1084Mk.A0e(16);
                    jA0Q = c1084Mk.A0P();
                } else if (jA0Q == 0) {
                    long jA902 = q92.A90();
                    if (jA902 != -1) {
                        jA0Q = (jA902 - q92.A9L()) + 8;
                    }
                }
                long j11 = i12;
                if (A00[0].charAt(4) != 'L') {
                    throw new RuntimeException();
                }
                A00[5] = "UtmF8gcvAmDE2tg754qnRZQuWqRLyGBv";
                if (jA0Q < j11) {
                    return false;
                }
                i11 += i12;
                if (headerSize == 1836019574) {
                    i5 += (int) jA0Q;
                    if (jA90 != -1 && i5 > jA90) {
                        i5 = (int) jA90;
                    }
                } else {
                    if (headerSize == 1836019558 || headerSize == 1836475768) {
                        z14 = true;
                        break;
                    }
                    if ((i11 + jA0Q) - i12 >= i5) {
                        break;
                    }
                    int atomDataSize = (int) (jA0Q - i12);
                    i11 += atomDataSize;
                    if (headerSize == 1718909296) {
                        if (atomDataSize >= 8) {
                            c1084Mk.A0d(atomDataSize);
                            q92.AI6(c1084Mk.A0l(), 0, atomDataSize);
                            int bytesToSearch = atomDataSize / 4;
                            int i13 = 0;
                            while (true) {
                                if (i13 >= bytesToSearch) {
                                    break;
                                }
                                if (i13 == 1) {
                                    int brandsCount = A00[0].charAt(4);
                                    if (brandsCount != 76) {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr2 = A00;
                                    strArr2[2] = "dzqLaRrB8roYzptOlyeuWukPOQGnaBr5";
                                    strArr2[3] = "tCGCFdpd4Lxzt3Z9CL7bUlzjSUebpCXv";
                                    c1084Mk.A0g(4);
                                } else if (A00(c1084Mk.A0C(), z12)) {
                                    z13 = true;
                                    break;
                                }
                                i13++;
                            }
                        } else {
                            return false;
                        }
                    } else if (atomDataSize != 0) {
                        q92.A4X(atomDataSize);
                    }
                }
            } else {
                throw new RuntimeException();
            }
        }
        return z13 && z11 == z14;
    }
}
