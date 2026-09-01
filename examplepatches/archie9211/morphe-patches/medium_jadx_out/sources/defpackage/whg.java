package defpackage;

import java.nio.charset.StandardCharsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class whg extends rr7 {
    public static final whg d = new whg();

    public static long H(long j, long j2) {
        long j3 = (j2 ^ j) * (-4132994306676758123L);
        long j4 = (j ^ (j3 ^ (j3 >>> 47))) * (-4132994306676758123L);
        return (j4 ^ (j4 >>> 47)) * (-4132994306676758123L);
    }

    public static void I(byte[] bArr, int i, long j, long j2, long[] jArr) {
        hig higVar = kig.a;
        long jZza = higVar.zza(bArr, i) + j;
        long jZza2 = higVar.zza(bArr, i + 8);
        long jZza3 = higVar.zza(bArr, i + 16);
        long jZza4 = higVar.zza(bArr, i + 24);
        long j3 = jZza2 + jZza + jZza3;
        long jRotateRight = Long.rotateRight(j3, 23) + Long.rotateRight(j2 + jZza + jZza4, 51);
        jArr[0] = j3 + jZza4;
        jArr[1] = jRotateRight + jZza;
    }

    @Override // defpackage.rr7
    public final big E(String str) {
        long j;
        long j2;
        long j3;
        long j4;
        long jRotateRight;
        long[] jArr;
        long jH;
        int i;
        int i2;
        long j5;
        byte[] bytes = str.toString().getBytes(StandardCharsets.UTF_8);
        int length = bytes.length;
        jq7.D(0, length, bytes.length);
        if (length <= 32) {
            long j6 = -4132994306676758123L;
            long j7 = (((long) length) * (-4132994306676758123L)) ^ (-1397348546323613475L);
            int i3 = 0;
            while (true) {
                i2 = length & (-8);
                if (i3 >= i2) {
                    break;
                }
                long jZza = kig.a.zza(bytes, i3) * (-4132994306676758123L);
                j7 = (j7 ^ ((jZza ^ (jZza >>> 47)) * (-4132994306676758123L))) * (-4132994306676758123L);
                i3 += 8;
            }
            int i4 = length & 7;
            if (i4 != 0) {
                hig higVar = kig.a;
                int iMin = Math.min(i4, 8);
                int i5 = 0;
                long j8 = 0;
                while (i5 < iMin) {
                    j8 |= (((long) bytes[i2 + i5]) & 255) << (i5 * 8);
                    i5++;
                    j6 = j6;
                }
                j5 = j6;
                j7 = (j7 ^ j8) * j5;
            } else {
                j5 = -4132994306676758123L;
            }
            long j9 = (j7 ^ (j7 >>> 47)) * j5;
            jH = j9 ^ (j9 >>> 47);
            i = 8;
            j = -6505348102511208375L;
            j2 = 0;
        } else {
            if (length <= 64) {
                hig higVar2 = kig.a;
                long jZza2 = higVar2.zza(bytes, 24);
                int i6 = length - 16;
                j2 = 0;
                long jZza3 = ((((long) length) + higVar2.zza(bytes, i6)) * (-6505348102511208375L)) + higVar2.zza(bytes, 0);
                j = -6505348102511208375L;
                long jRotateRight2 = Long.rotateRight(jZza3 + jZza2, 52);
                long jRotateRight3 = Long.rotateRight(jZza3, 37);
                long jZza4 = higVar2.zza(bytes, 8) + jZza3;
                long jRotateRight4 = Long.rotateRight(jZza4, 7) + jRotateRight3;
                long jZza5 = higVar2.zza(bytes, 16) + jZza4;
                long j10 = jZza2 + jZza5;
                long jRotateRight5 = Long.rotateRight(jZza5, 31) + jRotateRight2;
                long jZza6 = higVar2.zza(bytes, length - 32) + higVar2.zza(bytes, 16);
                long jZza7 = higVar2.zza(bytes, length - 8);
                long jRotateRight6 = Long.rotateRight(jZza6 + jZza7, 52);
                long jRotateRight7 = Long.rotateRight(jZza6, 37);
                long jZza8 = higVar2.zza(bytes, length - 24) + jZza6;
                long jRotateRight8 = Long.rotateRight(jZza8, 7) + jRotateRight7;
                long jZza9 = higVar2.zza(bytes, i6) + jZza8;
                long j11 = jRotateRight5 + jRotateRight4;
                long jRotateRight9 = ((Long.rotateRight(jZza9, 31) + jRotateRight6 + jRotateRight8 + j10) * (-4288712594273399085L)) + ((jZza9 + jZza7 + j11) * (-6505348102511208375L));
                long j12 = ((jRotateRight9 ^ (jRotateRight9 >>> 47)) * (-6505348102511208375L)) + j11;
                jH = (-4288712594273399085L) * (j12 ^ (j12 >>> 47));
            } else {
                j = -6505348102511208375L;
                j2 = 0;
                hig higVar3 = kig.a;
                long jZza10 = higVar3.zza(bytes, 0);
                long jZza11 = higVar3.zza(bytes, length - 16) ^ (-8261664234251669945L);
                long jZza12 = higVar3.zza(bytes, length - 56) ^ (-6505348102511208375L);
                long j13 = length;
                long[] jArr2 = new long[2];
                long[] jArr3 = new long[2];
                I(bytes, length - 64, j13, jZza11, jArr2);
                I(bytes, length - 32, j13 * (-8261664234251669945L), -6505348102511208375L, jArr3);
                long j14 = jArr2[1];
                long j15 = ((j14 ^ (j14 >>> 47)) * (-8261664234251669945L)) + jZza12;
                long jRotateRight10 = Long.rotateRight(jZza10 + j15, 39) * (-8261664234251669945L);
                long jRotateRight11 = Long.rotateRight(jZza11, 33) * (-8261664234251669945L);
                int i7 = (length - 1) & (-64);
                int i8 = 0;
                char c = 0;
                while (true) {
                    long j16 = jRotateRight10 + jRotateRight11 + jArr2[c];
                    hig higVar4 = kig.a;
                    long jRotateRight12 = Long.rotateRight(higVar4.zza(bytes, i8 + 16) + j16, 37) * (-8261664234251669945L);
                    long jRotateRight13 = Long.rotateRight(higVar4.zza(bytes, i8 + 48) + jRotateRight11 + jArr2[1], 42) * (-8261664234251669945L);
                    j3 = jArr3[1] ^ jRotateRight12;
                    c = 0;
                    j4 = jRotateRight13 ^ jArr2[0];
                    jRotateRight = Long.rotateRight(j15 ^ jArr3[0], 33);
                    I(bytes, i8, jArr2[1] * (-8261664234251669945L), jArr3[0] + j3, jArr2);
                    jArr = jArr3;
                    I(bytes, i8 + 32, jRotateRight + jArr3[1], j4, jArr);
                    i8 += 64;
                    i7 -= 64;
                    if (i7 == 0) {
                        break;
                    }
                    jArr3 = jArr;
                    j15 = j3;
                    jRotateRight11 = j4;
                    jRotateRight10 = jRotateRight;
                }
                jH = H(((j4 ^ (j4 >>> 47)) * (-8261664234251669945L)) + H(jArr2[0], jArr[0]) + j3, H(jArr2[1], jArr[1]) + jRotateRight);
            }
            i = 8;
        }
        long jH2 = H(jH + (length >= 9 ? kig.a.zza(bytes, length - 8) : j), length >= i ? kig.a.zza(bytes, 0) : j);
        if (jH2 == j2) {
            jH2 -= 2;
        } else if (jH2 == 1) {
            jH2 = 1;
            jH2 -= 2;
        }
        return new zhg(jH2);
    }

    public final String toString() {
        return "Hashing.fingerprint2011()";
    }
}
