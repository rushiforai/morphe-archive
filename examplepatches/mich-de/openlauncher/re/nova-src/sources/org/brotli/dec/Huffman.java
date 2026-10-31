package org.brotli.dec;

/* loaded from: classes5.dex */
final class Huffman {
    private static final int MAX_LENGTH = 15;

    public static int buildHuffmanTable(int[] iArr, int i5, int i11, int[] iArr2, int i12) {
        int i13 = iArr[i5];
        int[] iArr3 = new int[i12];
        char c11 = 16;
        int[] iArr4 = new int[16];
        int[] iArr5 = new int[16];
        int nextKey = 0;
        for (int i14 = 0; i14 < i12; i14++) {
            int i15 = iArr2[i14];
            iArr4[i15] = iArr4[i15] + 1;
        }
        iArr5[1] = 0;
        int i16 = 1;
        while (i16 < 15) {
            int i17 = i16 + 1;
            iArr5[i17] = iArr5[i16] + iArr4[i16];
            i16 = i17;
        }
        for (int i18 = 0; i18 < i12; i18++) {
            int i19 = iArr2[i18];
            if (i19 != 0) {
                int i21 = iArr5[i19];
                iArr5[i19] = i21 + 1;
                iArr3[i21] = i18;
            }
        }
        int i22 = 1 << i11;
        if (iArr5[15] == 1) {
            for (int i23 = 0; i23 < i22; i23++) {
                iArr[i13 + i23] = iArr3[0];
            }
            return i22;
        }
        int i24 = 0;
        int i25 = 1;
        for (int i26 = 1; i26 <= i11; i26++) {
            i25 <<= 1;
            while (iArr4[i26] > 0) {
                replicateValue(iArr, i13 + nextKey, i25, i22, iArr3[i24] | (i26 << 16));
                nextKey = getNextKey(nextKey, i26);
                iArr4[i26] = iArr4[i26] - 1;
                i24++;
            }
        }
        int i27 = i22 - 1;
        int i28 = i13;
        int i29 = 1;
        int i31 = -1;
        int nextKey2 = nextKey;
        int i32 = i24;
        int i33 = i22;
        for (int i34 = i11 + 1; i34 <= 15; i34++) {
            i29 <<= 1;
            while (iArr4[i34] > 0) {
                char c12 = c11;
                int i35 = nextKey2 & i27;
                if (i35 != i31) {
                    i28 += i33;
                    int iNextTableBitSize = nextTableBitSize(iArr4, i34, i11);
                    int i36 = 1 << iNextTableBitSize;
                    i22 += i36;
                    iArr[i13 + i35] = ((iNextTableBitSize + i11) << 16) | ((i28 - i13) - i35);
                    i33 = i36;
                    i31 = i35;
                }
                replicateValue(iArr, i28 + (nextKey2 >> i11), i29, i33, ((i34 - i11) << 16) | iArr3[i32]);
                nextKey2 = getNextKey(nextKey2, i34);
                iArr4[i34] = iArr4[i34] - 1;
                c11 = c12;
                i32++;
            }
        }
        return i22;
    }

    private static int getNextKey(int i5, int i11) {
        int i12 = 1 << (i11 - 1);
        while ((i5 & i12) != 0) {
            i12 >>= 1;
        }
        return (i5 & (i12 - 1)) + i12;
    }

    private static int nextTableBitSize(int[] iArr, int i5, int i11) {
        int i12;
        int i13 = 1 << (i5 - i11);
        while (i5 < 15 && (i12 = i13 - iArr[i5]) > 0) {
            i5++;
            i13 = i12 << 1;
        }
        return i5 - i11;
    }

    private static void replicateValue(int[] iArr, int i5, int i11, int i12, int i13) {
        while (i12 > 0) {
            i12 -= i11;
            iArr[i5 + i12] = i13;
        }
    }
}
