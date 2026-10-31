package nova.branch.engage.sesame_lite.internal;

import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes.dex */
public class MurmurHash3 {
    private static long fmix64(long j11) {
        long j12 = (j11 ^ (j11 >>> 33)) * (-49064778989728563L);
        long j13 = (j12 ^ (j12 >>> 33)) * (-4265267296055464877L);
        return j13 ^ (j13 >>> 33);
    }

    private static long getLongLittleEndian(byte[] bArr, int i5) {
        return (bArr[i5] & 255) | (bArr[i5 + 7] << 56) | ((bArr[i5 + 6] & 255) << 48) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 1] & 255) << 8);
    }

    public static int murmurHash3_x86_32(CharSequence charSequence, int i5, int i11, int i12) {
        int i13 = i5 + i11;
        int i14 = i5;
        int i15 = i12;
        int i16 = 0;
        int i17 = 0;
        int i18 = 0;
        while (i14 < i13) {
            int i19 = i14 + 1;
            int iCharAt = charSequence.charAt(i14);
            int i21 = 8;
            if (iCharAt < 128) {
                i14 = i19;
            } else if (iCharAt < 2048) {
                iCharAt = (((iCharAt & 63) | 128) << 8) | (iCharAt >> 6) | 192;
                i14 = i19;
                i21 = 16;
            } else if (iCharAt < 55296 || iCharAt > 57343 || i19 >= i13) {
                iCharAt = (((iCharAt & 63) | 128) << 16) | (iCharAt >> 12) | Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE | ((((iCharAt >> 6) & 63) | 128) << 8);
                i14 = i19;
                i21 = 24;
            } else {
                i14 += 2;
                int iCharAt2 = ((iCharAt - 55232) << 10) + (charSequence.charAt(i19) & 1023);
                iCharAt = (((iCharAt2 & 63) | 128) << 24) | (((iCharAt2 >> 18) | 240) & 255) | ((((iCharAt2 >> 12) & 63) | 128) << 8) | ((((iCharAt2 >> 6) & 63) | 128) << 16);
                i21 = 32;
            }
            i17 |= iCharAt << i16;
            i16 += i21;
            if (i16 >= 32) {
                int i22 = i17 * (-862048943);
                int i23 = i15 ^ (((i22 >>> 17) | (i22 << 15)) * 461845907);
                i15 = (((i23 >>> 19) | (i23 << 13)) * 5) - 430675100;
                i16 -= 32;
                i17 = i16 != 0 ? iCharAt >>> (i21 - i16) : 0;
                i18 += 4;
            }
        }
        if (i16 > 0) {
            i18 += i16 >> 3;
            int i24 = i17 * (-862048943);
            i15 ^= ((i24 << 15) | (i24 >>> 17)) * 461845907;
        }
        int i25 = i15 ^ i18;
        int i26 = (i25 ^ (i25 >>> 16)) * (-2048144789);
        int i27 = (i26 ^ (i26 >>> 13)) * (-1028477387);
        return i27 ^ (i27 >>> 16);
    }

    public static void murmurhash3_x64_128(byte[] bArr, int i5, int i11, int i12, long[] jArr) {
        char c11;
        char c12;
        if (jArr == null) {
            throw new IllegalArgumentException("Array was null");
        }
        int i13 = i5 + (i11 & (-16));
        long jRotateLeft = i12 & 4294967295L;
        long jRotateLeft2 = jRotateLeft;
        for (int i14 = i5; i14 < i13; i14 += 16) {
            long longLittleEndian = getLongLittleEndian(bArr, i14);
            long longLittleEndian2 = getLongLittleEndian(bArr, i14 + 8);
            jRotateLeft2 = ((Long.rotateLeft(jRotateLeft2 ^ (Long.rotateLeft(longLittleEndian * (-8663945395140668459L), 31) * 5545529020109919103L), 27) + jRotateLeft) * 5) + 1390208809;
            jRotateLeft = ((Long.rotateLeft(jRotateLeft ^ (Long.rotateLeft(longLittleEndian2 * 5545529020109919103L, 33) * (-8663945395140668459L)), 31) + jRotateLeft2) * 5) + 944331445;
        }
        long j11 = 0;
        switch (i11 & 15) {
            case 3:
                j11 |= (bArr[i13 + 2] & 255) << 16;
            case 2:
                j11 |= (bArr[i13 + 1] & 255) << 8;
            case 1:
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
            case 4:
                c11 = 24;
                j11 |= (bArr[i13 + 3] & 255) << c11;
                j11 |= (bArr[i13 + 2] & 255) << 16;
                j11 |= (bArr[i13 + 1] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
            case 5:
                c11 = 24;
                c12 = ' ';
                j11 |= (bArr[i13 + 4] & 255) << c12;
                j11 |= (bArr[i13 + 3] & 255) << c11;
                j11 |= (bArr[i13 + 2] & 255) << 16;
                j11 |= (bArr[i13 + 1] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
            case 6:
                c11 = 24;
                c12 = ' ';
                j11 |= (bArr[i13 + 5] & 255) << 40;
                j11 |= (bArr[i13 + 4] & 255) << c12;
                j11 |= (bArr[i13 + 3] & 255) << c11;
                j11 |= (bArr[i13 + 2] & 255) << 16;
                j11 |= (bArr[i13 + 1] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
            case 7:
                c11 = 24;
                c12 = ' ';
                j11 |= (bArr[i13 + 6] & 255) << 48;
                j11 |= (bArr[i13 + 5] & 255) << 40;
                j11 |= (bArr[i13 + 4] & 255) << c12;
                j11 |= (bArr[i13 + 3] & 255) << c11;
                j11 |= (bArr[i13 + 2] & 255) << 16;
                j11 |= (bArr[i13 + 1] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
            case 8:
                c11 = 24;
                c12 = ' ';
                j11 = bArr[i13 + 7] << 56;
                j11 |= (bArr[i13 + 6] & 255) << 48;
                j11 |= (bArr[i13 + 5] & 255) << 40;
                j11 |= (bArr[i13 + 4] & 255) << c12;
                j11 |= (bArr[i13 + 3] & 255) << c11;
                j11 |= (bArr[i13 + 2] & 255) << 16;
                j11 |= (bArr[i13 + 1] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
            case 9:
                c11 = 24;
                c12 = ' ';
                jRotateLeft ^= Long.rotateLeft((j11 | (bArr[i13 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j11 = bArr[i13 + 7] << 56;
                j11 |= (bArr[i13 + 6] & 255) << 48;
                j11 |= (bArr[i13 + 5] & 255) << 40;
                j11 |= (bArr[i13 + 4] & 255) << c12;
                j11 |= (bArr[i13 + 3] & 255) << c11;
                j11 |= (bArr[i13 + 2] & 255) << 16;
                j11 |= (bArr[i13 + 1] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
            case 10:
                c11 = 24;
                c12 = ' ';
                j11 |= (bArr[i13 + 9] & 255) << 8;
                jRotateLeft ^= Long.rotateLeft((j11 | (bArr[i13 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j11 = bArr[i13 + 7] << 56;
                j11 |= (bArr[i13 + 6] & 255) << 48;
                j11 |= (bArr[i13 + 5] & 255) << 40;
                j11 |= (bArr[i13 + 4] & 255) << c12;
                j11 |= (bArr[i13 + 3] & 255) << c11;
                j11 |= (bArr[i13 + 2] & 255) << 16;
                j11 |= (bArr[i13 + 1] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
            case 11:
                c11 = 24;
                c12 = ' ';
                j11 |= (bArr[i13 + 10] & 255) << 16;
                j11 |= (bArr[i13 + 9] & 255) << 8;
                jRotateLeft ^= Long.rotateLeft((j11 | (bArr[i13 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j11 = bArr[i13 + 7] << 56;
                j11 |= (bArr[i13 + 6] & 255) << 48;
                j11 |= (bArr[i13 + 5] & 255) << 40;
                j11 |= (bArr[i13 + 4] & 255) << c12;
                j11 |= (bArr[i13 + 3] & 255) << c11;
                j11 |= (bArr[i13 + 2] & 255) << 16;
                j11 |= (bArr[i13 + 1] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
            case 12:
                c11 = 24;
                c12 = ' ';
                j11 |= (bArr[i13 + 11] & 255) << c11;
                j11 |= (bArr[i13 + 10] & 255) << 16;
                j11 |= (bArr[i13 + 9] & 255) << 8;
                jRotateLeft ^= Long.rotateLeft((j11 | (bArr[i13 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j11 = bArr[i13 + 7] << 56;
                j11 |= (bArr[i13 + 6] & 255) << 48;
                j11 |= (bArr[i13 + 5] & 255) << 40;
                j11 |= (bArr[i13 + 4] & 255) << c12;
                j11 |= (bArr[i13 + 3] & 255) << c11;
                j11 |= (bArr[i13 + 2] & 255) << 16;
                j11 |= (bArr[i13 + 1] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
            case 13:
                c11 = 24;
                c12 = ' ';
                j11 |= (bArr[i13 + 12] & 255) << c12;
                j11 |= (bArr[i13 + 11] & 255) << c11;
                j11 |= (bArr[i13 + 10] & 255) << 16;
                j11 |= (bArr[i13 + 9] & 255) << 8;
                jRotateLeft ^= Long.rotateLeft((j11 | (bArr[i13 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j11 = bArr[i13 + 7] << 56;
                j11 |= (bArr[i13 + 6] & 255) << 48;
                j11 |= (bArr[i13 + 5] & 255) << 40;
                j11 |= (bArr[i13 + 4] & 255) << c12;
                j11 |= (bArr[i13 + 3] & 255) << c11;
                j11 |= (bArr[i13 + 2] & 255) << 16;
                j11 |= (bArr[i13 + 1] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
            case 14:
                c11 = 24;
                c12 = ' ';
                j11 |= (bArr[i13 + 13] & 255) << 40;
                j11 |= (bArr[i13 + 12] & 255) << c12;
                j11 |= (bArr[i13 + 11] & 255) << c11;
                j11 |= (bArr[i13 + 10] & 255) << 16;
                j11 |= (bArr[i13 + 9] & 255) << 8;
                jRotateLeft ^= Long.rotateLeft((j11 | (bArr[i13 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j11 = bArr[i13 + 7] << 56;
                j11 |= (bArr[i13 + 6] & 255) << 48;
                j11 |= (bArr[i13 + 5] & 255) << 40;
                j11 |= (bArr[i13 + 4] & 255) << c12;
                j11 |= (bArr[i13 + 3] & 255) << c11;
                j11 |= (bArr[i13 + 2] & 255) << 16;
                j11 |= (bArr[i13 + 1] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
            case 15:
                c11 = 24;
                c12 = ' ';
                j11 = (bArr[i13 + 14] & 255) << 48;
                j11 |= (bArr[i13 + 13] & 255) << 40;
                j11 |= (bArr[i13 + 12] & 255) << c12;
                j11 |= (bArr[i13 + 11] & 255) << c11;
                j11 |= (bArr[i13 + 10] & 255) << 16;
                j11 |= (bArr[i13 + 9] & 255) << 8;
                jRotateLeft ^= Long.rotateLeft((j11 | (bArr[i13 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j11 = bArr[i13 + 7] << 56;
                j11 |= (bArr[i13 + 6] & 255) << 48;
                j11 |= (bArr[i13 + 5] & 255) << 40;
                j11 |= (bArr[i13 + 4] & 255) << c12;
                j11 |= (bArr[i13 + 3] & 255) << c11;
                j11 |= (bArr[i13 + 2] & 255) << 16;
                j11 |= (bArr[i13 + 1] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j11 | (bArr[i13] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L;
                break;
        }
        long j12 = i11;
        long j13 = jRotateLeft2 ^ j12;
        long j14 = j12 ^ jRotateLeft;
        long j15 = j13 + j14;
        long j16 = j14 + j15;
        long jFmix64 = fmix64(j15);
        long jFmix642 = fmix64(j16);
        long j17 = jFmix64 + jFmix642;
        jArr[0] = j17;
        jArr[1] = jFmix642 + j17;
    }
}
