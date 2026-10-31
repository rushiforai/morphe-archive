package org.brotli.dec;

import com.amplitude.eventbridge.EventBridgeChannel;

/* loaded from: classes5.dex */
final class Context {
    static final int[] LOOKUP;
    private static final String UTF_MAP = "         !!  !                  \"#$##%#$&'##(#)#++++++++++((&*'##,---,---,-----,-----,-----&#'###.///.///./////./////./////&#'# ";
    private static final String UTF_RLE = "A/*  ':  & : $  \u0081 @";

    static {
        int[] iArr = new int[2048];
        LOOKUP = iArr;
        unpackLookupTable(iArr, UTF_MAP, UTF_RLE);
    }

    private static void unpackLookupTable(int[] iArr, String str, String str2) {
        for (int i5 = 0; i5 < 256; i5++) {
            iArr[i5] = i5 & 63;
            iArr[i5 + EventBridgeChannel.QUEUE_CAPACITY] = i5 >> 2;
            iArr[i5 + 1792] = (i5 >> 6) + 2;
        }
        for (int i11 = 0; i11 < 128; i11++) {
            iArr[i11 + 1024] = (str.charAt(i11) - ' ') * 4;
        }
        for (int i12 = 0; i12 < 64; i12++) {
            int i13 = i12 & 1;
            iArr[i12 + 1152] = i13;
            iArr[i12 + 1216] = i13 + 2;
        }
        int i14 = 1280;
        for (int i15 = 0; i15 < 19; i15++) {
            int i16 = i15 & 3;
            int iCharAt = str2.charAt(i15) - ' ';
            int i17 = 0;
            while (i17 < iCharAt) {
                iArr[i14] = i16;
                i17++;
                i14++;
            }
        }
        for (int i18 = 0; i18 < 16; i18++) {
            iArr[i18 + 1792] = 1;
            iArr[i18 + 2032] = 6;
        }
        iArr[1792] = 0;
        iArr[2047] = 7;
        for (int i19 = 0; i19 < 256; i19++) {
            iArr[i19 + 1536] = iArr[i19 + 1792] << 3;
        }
    }
}
