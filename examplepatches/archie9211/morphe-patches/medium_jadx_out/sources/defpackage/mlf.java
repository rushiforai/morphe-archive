package defpackage;

import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mlf implements njg {
    public final byte[] a;
    public final byte[] b;
    public final byte[] c;

    public mlf(byte[] bArr, byte[] bArr2, byte[] bArr3) {
        if (!hk7.M(1)) {
            throw new IllegalStateException(new GeneralSecurityException("Can not use Ed25519 in FIPS-mode."));
        }
        if (bArr.length != 32) {
            ay0.e("Given public key's length is not 32.");
            throw null;
        }
        this.a = (byte[]) bArr.clone();
        this.b = bArr2;
        this.c = bArr3;
        if (ekg.a != null) {
            return;
        }
        ygf.f("Could not initialize Ed25519.");
        throw null;
    }

    public final void a(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArr3 = bArr;
        if (bArr3.length != 64) {
            ygf.l("The length of the signature is not 64.");
            return;
        }
        if (bArr3.length == 64) {
            byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr3, 32, 64);
            int i = 31;
            while (true) {
                if (i < 0) {
                    break;
                }
                int i2 = bArrCopyOfRange[i] & 255;
                int i3 = ht2.n[i] & 255;
                if (i2 == i3) {
                    i--;
                    bArr3 = bArr;
                } else if (i2 < i3) {
                    MessageDigest messageDigest = (MessageDigest) wlf.c.a.a("SHA-512");
                    messageDigest.update(bArr3, 0, 32);
                    byte[] bArr4 = this.a;
                    messageDigest.update(bArr4);
                    messageDigest.update(bArr2);
                    byte[] bArrDigest = messageDigest.digest();
                    long jQ0 = ht2.Q0(0, bArrDigest) & 2097151;
                    long jR0 = ht2.R0(2, bArrDigest) >> 5;
                    long jQ02 = ht2.Q0(5, bArrDigest) >> 2;
                    long jR02 = ht2.R0(7, bArrDigest) >> 7;
                    long jR03 = ht2.R0(10, bArrDigest) >> 4;
                    long jQ03 = ht2.Q0(13, bArrDigest) >> 1;
                    long jR04 = ht2.R0(15, bArrDigest) >> 6;
                    long jQ04 = ht2.Q0(18, bArrDigest) >> 3;
                    long jQ05 = ht2.Q0(21, bArrDigest) & 2097151;
                    long jR05 = ht2.R0(23, bArrDigest) >> 5;
                    long jQ06 = ht2.Q0(26, bArrDigest) >> 2;
                    long jR06 = ht2.R0(28, bArrDigest) >> 7;
                    long jR07 = ht2.R0(31, bArrDigest) >> 4;
                    long jQ07 = ht2.Q0(34, bArrDigest) >> 1;
                    long jR08 = ht2.R0(36, bArrDigest) >> 6;
                    long jQ08 = ht2.Q0(39, bArrDigest) >> 3;
                    long jQ09 = ht2.Q0(42, bArrDigest) & 2097151;
                    long jR09 = ht2.R0(44, bArrDigest) >> 5;
                    long jQ010 = (ht2.Q0(47, bArrDigest) >> 2) & 2097151;
                    long jR010 = (ht2.R0(49, bArrDigest) >> 7) & 2097151;
                    long jR011 = (ht2.R0(52, bArrDigest) >> 4) & 2097151;
                    long jQ011 = (ht2.Q0(55, bArrDigest) >> 1) & 2097151;
                    long jR012 = (ht2.R0(57, bArrDigest) >> 6) & 2097151;
                    long jR013 = ht2.R0(60, bArrDigest) >> 3;
                    long j = (jR011 * 666643) + jQ05;
                    long j2 = (jR010 * 666643) + jQ04;
                    long j3 = (jQ010 * 666643) + (jR04 & 2097151);
                    long j4 = (j3 + 1048576) >> 21;
                    long j5 = j4 << 21;
                    long j6 = (jQ010 * 654183) + (jR010 * 470296) + j;
                    long j7 = (j6 + 1048576) >> 21;
                    long j8 = j7 << 21;
                    long j9 = (jQ010 * 136657) + (((jR011 * 654183) + ((jQ011 * 470296) + ((jR012 * 666643) + (jQ06 & 2097151)))) - (jR010 * 997805));
                    long j10 = (j9 + 1048576) >> 21;
                    long j11 = j10 << 21;
                    long j12 = ((jR011 * 136657) + (((jR012 * 654183) + ((jR013 * 470296) + (jR07 & 2097151))) - (jQ011 * 997805))) - (jR010 * 683901);
                    long j13 = (j12 + 1048576) >> 21;
                    long j14 = ((jR012 * 136657) + ((jR08 & 2097151) - (jR013 * 997805))) - (jQ011 * 683901);
                    long j15 = (j14 + 1048576) >> 21;
                    long j16 = j15 << 21;
                    long j17 = jQ09 - (jR013 * 683901);
                    long j18 = (j17 + 1048576) >> 21;
                    long j19 = (jQ010 * 470296) + j2 + j4;
                    long j20 = (j19 + 1048576) >> 21;
                    long j21 = j20 << 21;
                    long j22 = (((jR010 * 654183) + ((jR011 * 470296) + ((jQ011 * 666643) + (jR05 & 2097151)))) - (jQ010 * 997805)) + j7;
                    long j23 = (j22 + 1048576) >> 21;
                    long j24 = j23 << 21;
                    long j25 = (((jR010 * 136657) + (((jQ011 * 654183) + ((jR012 * 470296) + ((jR013 * 666643) + (jR06 & 2097151)))) - (jR011 * 997805))) - (jQ010 * 683901)) + j10;
                    long j26 = (j25 + 1048576) >> 21;
                    long j27 = j26 << 21;
                    long j28 = (((jQ011 * 136657) + (((jR013 * 654183) + (jQ07 & 2097151)) - (jR012 * 997805))) - (jR011 * 683901)) + j13;
                    long j29 = (j28 + 1048576) >> 21;
                    long j30 = (((jR013 * 136657) + jQ08) - (jR012 * 683901)) + j15;
                    long j31 = (j30 + 1048576) >> 21;
                    long j32 = (j12 - (j13 << 21)) + j26;
                    long j33 = (j32 * 666643) + jQ0;
                    long j34 = (j33 + 1048576) >> 21;
                    long j35 = j34 << 21;
                    long j36 = (j14 - j16) + j29;
                    long j37 = j28 - (j29 << 21);
                    long j38 = (j32 * 654183) + (j37 * 470296) + (j36 * 666643) + (jQ02 & 2097151);
                    long j39 = (j38 + 1048576) >> 21;
                    long j40 = j39 << 21;
                    long j41 = (j17 - (j18 << 21)) + j31;
                    long j42 = j30 - (j31 << 21);
                    long j43 = (j32 * 136657) + (((j36 * 654183) + ((j42 * 470296) + ((j41 * 666643) + (jR03 & 2097151)))) - (j37 * 997805));
                    long j44 = (j43 + 1048576) >> 21;
                    long j45 = j44 << 21;
                    long j46 = (jR09 & 2097151) + j18;
                    long j47 = ((j36 * 136657) + (((j41 * 654183) + ((j46 * 470296) + (j3 - j5))) - (j42 * 997805))) - (j37 * 683901);
                    long j48 = (j47 + 1048576) >> 21;
                    long j49 = j48 << 21;
                    long j50 = ((j41 * 136657) + (((j6 - j8) + j20) - (j46 * 997805))) - (j42 * 683901);
                    long j51 = (j50 + 1048576) >> 21;
                    long j52 = j51 << 21;
                    long j53 = ((j9 - j11) + j23) - (j46 * 683901);
                    long j54 = (j53 + 1048576) >> 21;
                    long j55 = j54 << 21;
                    long j56 = (j32 * 470296) + (j37 * 666643) + (jR0 & 2097151) + j34;
                    long j57 = (j56 + 1048576) >> 21;
                    long j58 = (((j37 * 654183) + ((j36 * 470296) + ((j42 * 666643) + (jR02 & 2097151)))) - (j32 * 997805)) + j39;
                    long j59 = (j58 + 1048576) >> 21;
                    long j60 = (((j37 * 136657) + (((j42 * 654183) + ((j41 * 470296) + ((j46 * 666643) + (jQ03 & 2097151)))) - (j36 * 997805))) - (j32 * 683901)) + j44;
                    long j61 = (j60 + 1048576) >> 21;
                    long j62 = (((j42 * 136657) + (((j46 * 654183) + (j19 - j21)) - (j41 * 997805))) - (j36 * 683901)) + j48;
                    long j63 = (j62 + 1048576) >> 21;
                    long j64 = (((j46 * 136657) + (j22 - j24)) - (j41 * 683901)) + j51;
                    long j65 = (j64 + 1048576) >> 21;
                    long j66 = (j25 - j27) + j54;
                    long j67 = (j66 + 1048576) >> 21;
                    long j68 = j67 << 21;
                    long j69 = (j67 * 666643) + (j33 - j35);
                    long j70 = j69 >> 21;
                    long j71 = j70 << 21;
                    long j72 = (j67 * 470296) + (j56 - (j57 << 21)) + j70;
                    long j73 = j72 >> 21;
                    long j74 = j73 << 21;
                    long j75 = (j67 * 654183) + (j38 - j40) + j57 + j73;
                    long j76 = j75 >> 21;
                    long j77 = j76 << 21;
                    long j78 = ((j58 - (j59 << 21)) - (j67 * 997805)) + j76;
                    long j79 = j78 >> 21;
                    long j80 = j79 << 21;
                    long j81 = (j67 * 136657) + (j43 - j45) + j59 + j79;
                    long j82 = j81 >> 21;
                    long j83 = j82 << 21;
                    long j84 = ((j60 - (j61 << 21)) - (j67 * 683901)) + j82;
                    long j85 = j84 >> 21;
                    long j86 = j85 << 21;
                    long j87 = (j47 - j49) + j61 + j85;
                    long j88 = j87 >> 21;
                    long j89 = j88 << 21;
                    long j90 = (j62 - (j63 << 21)) + j88;
                    long j91 = j90 >> 21;
                    long j92 = j91 << 21;
                    long j93 = (j50 - j52) + j63 + j91;
                    long j94 = j93 >> 21;
                    long j95 = j94 << 21;
                    long j96 = (j64 - (j65 << 21)) + j94;
                    long j97 = j96 >> 21;
                    long j98 = j97 << 21;
                    long j99 = (j53 - j55) + j65 + j97;
                    long j100 = j99 >> 21;
                    long j101 = j100 << 21;
                    long j102 = (j66 - j68) + j100;
                    long j103 = j102 >> 21;
                    long j104 = j103 << 21;
                    long j105 = (666643 * j103) + (j69 - j71);
                    long j106 = j105 >> 21;
                    long j107 = j106 << 21;
                    long j108 = (470296 * j103) + (j72 - j74) + j106;
                    long j109 = j108 >> 21;
                    long j110 = j109 << 21;
                    long j111 = (654183 * j103) + (j75 - j77) + j109;
                    long j112 = j111 >> 21;
                    long j113 = j112 << 21;
                    long j114 = ((j78 - j80) - (997805 * j103)) + j112;
                    long j115 = j114 >> 21;
                    long j116 = j115 << 21;
                    long j117 = (136657 * j103) + (j81 - j83) + j115;
                    long j118 = j117 >> 21;
                    long j119 = j118 << 21;
                    long j120 = ((j84 - j86) - (j103 * 683901)) + j118;
                    long j121 = j120 >> 21;
                    long j122 = j121 << 21;
                    long j123 = (j87 - j89) + j121;
                    long j124 = j123 >> 21;
                    long j125 = j124 << 21;
                    long j126 = (j90 - j92) + j124;
                    long j127 = j126 >> 21;
                    long j128 = j127 << 21;
                    long j129 = (j93 - j95) + j127;
                    long j130 = j129 >> 21;
                    long j131 = j130 << 21;
                    long j132 = (j96 - j98) + j130;
                    long j133 = j132 >> 21;
                    long j134 = j133 << 21;
                    long j135 = (j99 - j101) + j133;
                    long j136 = j135 >> 21;
                    bArrDigest[0] = (byte) (j105 - j107);
                    long j137 = j126 - j128;
                    long j138 = j123 - j125;
                    long j139 = j120 - j122;
                    long j140 = j117 - j119;
                    long j141 = j114 - j116;
                    long j142 = j111 - j113;
                    long j143 = j108 - j110;
                    bArrDigest[1] = (byte) (r10 >> 8);
                    bArrDigest[2] = (byte) ((r10 >> 16) | (j143 << 5));
                    bArrDigest[3] = (byte) (j143 >> 3);
                    bArrDigest[4] = (byte) (j143 >> 11);
                    bArrDigest[5] = (byte) ((j143 >> 19) | (j142 << 2));
                    bArrDigest[6] = (byte) (j142 >> 6);
                    bArrDigest[7] = (byte) ((j142 >> 14) | (j141 << 7));
                    bArrDigest[8] = (byte) (j141 >> 1);
                    bArrDigest[9] = (byte) (j141 >> 9);
                    bArrDigest[10] = (byte) ((j141 >> 17) | (j140 << 4));
                    bArrDigest[11] = (byte) (j140 >> 4);
                    bArrDigest[12] = (byte) (j140 >> 12);
                    bArrDigest[13] = (byte) ((j140 >> 20) | (j139 + j139));
                    bArrDigest[14] = (byte) (j139 >> 7);
                    bArrDigest[15] = (byte) ((j139 >> 15) | (j138 << 6));
                    bArrDigest[16] = (byte) (j138 >> 2);
                    bArrDigest[17] = (byte) (j138 >> 10);
                    bArrDigest[18] = (byte) ((j138 >> 18) | (j137 << 3));
                    long j144 = j135 - (j136 << 21);
                    long j145 = (j102 - j104) + j136;
                    long j146 = j132 - j134;
                    bArrDigest[19] = (byte) (j137 >> 5);
                    bArrDigest[20] = (byte) (j137 >> 13);
                    bArrDigest[21] = (byte) (j129 - j131);
                    bArrDigest[22] = (byte) (r8 >> 8);
                    bArrDigest[23] = (byte) ((r8 >> 16) | (j146 << 5));
                    bArrDigest[24] = (byte) (j146 >> 3);
                    bArrDigest[25] = (byte) (j146 >> 11);
                    bArrDigest[26] = (byte) ((j146 >> 19) | (j144 << 2));
                    bArrDigest[27] = (byte) (j144 >> 6);
                    bArrDigest[28] = (byte) ((j144 >> 14) | (j145 << 7));
                    bArrDigest[29] = (byte) (j145 >> 1);
                    bArrDigest[30] = (byte) (j145 >> 9);
                    bArrDigest[31] = (byte) (j145 >> 17);
                    long[] jArr = new long[10];
                    long[] jArrL0 = vv2.l0(bArr4);
                    long[] jArr2 = new long[10];
                    jArr2[0] = 1;
                    long[] jArr3 = new long[10];
                    long[] jArr4 = new long[10];
                    long[] jArr5 = new long[10];
                    long[] jArr6 = new long[10];
                    long[] jArr7 = new long[10];
                    vv2.k0(jArr4, jArrL0);
                    vv2.j0(jArr5, jArr4, ekg.a);
                    vv2.g0(jArr4, jArr4, jArr2);
                    vv2.f0(jArr5, jArr5, jArr2);
                    long[] jArr8 = new long[10];
                    vv2.k0(jArr8, jArr5);
                    vv2.j0(jArr8, jArr8, jArr5);
                    vv2.k0(jArr, jArr8);
                    vv2.j0(jArr, jArr, jArr5);
                    vv2.j0(jArr, jArr, jArr4);
                    long[] jArr9 = new long[10];
                    long[] jArr10 = new long[10];
                    long[] jArr11 = new long[10];
                    vv2.k0(jArr9, jArr);
                    vv2.k0(jArr10, jArr9);
                    vv2.k0(jArr10, jArr10);
                    vv2.j0(jArr10, jArr, jArr10);
                    vv2.j0(jArr9, jArr9, jArr10);
                    vv2.k0(jArr9, jArr9);
                    vv2.j0(jArr9, jArr10, jArr9);
                    vv2.k0(jArr10, jArr9);
                    for (int i4 = 1; i4 < 5; i4++) {
                        vv2.k0(jArr10, jArr10);
                    }
                    vv2.j0(jArr9, jArr10, jArr9);
                    vv2.k0(jArr10, jArr9);
                    for (int i5 = 1; i5 < 10; i5++) {
                        vv2.k0(jArr10, jArr10);
                    }
                    vv2.j0(jArr10, jArr10, jArr9);
                    vv2.k0(jArr11, jArr10);
                    for (int i6 = 1; i6 < 20; i6++) {
                        vv2.k0(jArr11, jArr11);
                    }
                    vv2.j0(jArr10, jArr11, jArr10);
                    vv2.k0(jArr10, jArr10);
                    for (int i7 = 1; i7 < 10; i7++) {
                        vv2.k0(jArr10, jArr10);
                    }
                    vv2.j0(jArr9, jArr10, jArr9);
                    vv2.k0(jArr10, jArr9);
                    for (int i8 = 1; i8 < 50; i8++) {
                        vv2.k0(jArr10, jArr10);
                    }
                    vv2.j0(jArr10, jArr10, jArr9);
                    vv2.k0(jArr11, jArr10);
                    for (int i9 = 1; i9 < 100; i9++) {
                        vv2.k0(jArr11, jArr11);
                    }
                    vv2.j0(jArr10, jArr11, jArr10);
                    vv2.k0(jArr10, jArr10);
                    for (int i10 = 1; i10 < 50; i10++) {
                        vv2.k0(jArr10, jArr10);
                    }
                    vv2.j0(jArr9, jArr10, jArr9);
                    vv2.k0(jArr9, jArr9);
                    vv2.k0(jArr9, jArr9);
                    vv2.j0(jArr, jArr9, jArr);
                    vv2.j0(jArr, jArr, jArr8);
                    vv2.j0(jArr, jArr, jArr4);
                    vv2.k0(jArr6, jArr);
                    vv2.j0(jArr6, jArr6, jArr5);
                    vv2.g0(jArr7, jArr6, jArr4);
                    if (ht2.J0(jArr7)) {
                        vv2.f0(jArr7, jArr6, jArr4);
                        if (ht2.J0(jArr7)) {
                            ygf.l("Cannot convert given bytes to extended projective coordinates. No square root exists for modulo 2^255-19");
                            return;
                        }
                        vv2.j0(jArr, jArr, ekg.c);
                    }
                    if (!ht2.J0(jArr) && ((bArr4[31] & 255) >> 7) != 0) {
                        ygf.l("Cannot convert given bytes to extended projective coordinates. Computed x is zero and encoded x's least significant bit is not zero");
                        return;
                    }
                    if ((vv2.m0(jArr)[0] & 1) == ((bArr4[31] & 255) >> 7)) {
                        for (int i11 = 0; i11 < 10; i11++) {
                            jArr[i11] = -jArr[i11];
                        }
                    }
                    vv2.j0(jArr3, jArr, jArrL0);
                    tag tagVar = new tag(jArr, jArrL0, jArr2);
                    bkg[] bkgVarArr = new bkg[8];
                    bkgVarArr[0] = new bkg(new zjf(tagVar, 14, jArr3));
                    d2f d2fVar = new d2f(new tag(), 24, new long[10]);
                    ht2.M0(d2fVar, tagVar);
                    zjf zjfVar = new zjf(d2fVar);
                    for (int i12 = 1; i12 < 8; i12++) {
                        ht2.K0(d2fVar, zjfVar, bkgVarArr[i12 - 1]);
                        bkgVarArr[i12] = new bkg(new zjf(d2fVar));
                    }
                    byte[] bArrP0 = ht2.P0(bArrDigest);
                    byte[] bArrP02 = ht2.P0(bArrCopyOfRange);
                    d2f d2fVar2 = new d2f();
                    zjf zjfVar2 = new zjf(14);
                    int i13 = 255;
                    while (i13 >= 0 && bArrP0[i13] == 0 && bArrP02[i13] == 0) {
                        i13--;
                    }
                    while (i13 >= 0) {
                        ht2.M0(d2fVar2, new tag(d2fVar2));
                        byte b = bArrP0[i13];
                        if (b > 0) {
                            zjf.m(zjfVar2, d2fVar2);
                            ht2.K0(d2fVar2, zjfVar2, bkgVarArr[bArrP0[i13] / 2]);
                        } else if (b < 0) {
                            zjf.m(zjfVar2, d2fVar2);
                            ht2.L0(d2fVar2, zjfVar2, bkgVarArr[(-bArrP0[i13]) / 2]);
                        }
                        byte b2 = bArrP02[i13];
                        if (b2 > 0) {
                            zjf.m(zjfVar2, d2fVar2);
                            ht2.K0(d2fVar2, zjfVar2, ekg.e[bArrP02[i13] / 2]);
                        } else if (b2 < 0) {
                            zjf.m(zjfVar2, d2fVar2);
                            ht2.L0(d2fVar2, zjfVar2, ekg.e[(-bArrP02[i13]) / 2]);
                        }
                        i13--;
                    }
                    byte[] bArrI = new tag(d2fVar2).i();
                    for (int i14 = 0; i14 < 32; i14++) {
                        if (bArrI[i14] == bArr[i14]) {
                        }
                    }
                    return;
                }
            }
        }
        ygf.l("Signature check failed.");
    }

    @Override // defpackage.njg
    public final void b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        byte[] bArr3 = this.b;
        int length = bArr3.length;
        byte[] bArr4 = this.c;
        if (length == 0 && bArr4.length == 0) {
            a(bArr, bArr2);
        } else {
            if (!aog.b(bArr3, bArr)) {
                ygf.l("Invalid signature (output prefix mismatch)");
                return;
            }
            if (bArr4.length != 0) {
                bArr2 = pr7.s(bArr2, bArr4);
            }
            a(Arrays.copyOfRange(bArr, length, bArr.length), bArr2);
        }
    }
}
