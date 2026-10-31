package kl;

import android.os.Build;
import io.sentry.e3;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.Provider;
import java.security.Security;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: c, reason: collision with root package name */
    public static final e3 f71558c = new e3(26, new fl.l(22, new long[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, new long[]{1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, new long[]{1, 0, 0, 0, 0, 0, 0, 0, 0, 0}), new long[]{1, 0, 0, 0, 0, 0, 0, 0, 0, 0});

    /* renamed from: a, reason: collision with root package name */
    public static final String[] f71556a = {"GmsCore_OpenSSL", "AndroidOpenSSL", "Conscrypt"};

    /* renamed from: b, reason: collision with root package name */
    public static final b f71557b = new b(new long[]{1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, new long[]{1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, new long[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0});

    /* renamed from: d, reason: collision with root package name */
    public static final byte[] f71559d = {-19, -45, -11, 92, 26, 99, 18, 88, -42, -100, -9, -94, -34, -7, -34, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16};

    /* renamed from: e, reason: collision with root package name */
    public static final int[] f71560e = {0, 3, 6, 9, 12, 16, 19, 22, 25, 28};

    /* renamed from: f, reason: collision with root package name */
    public static final int[] f71561f = {0, 2, 3, 5, 6, 0, 1, 3, 4, 6};

    /* renamed from: g, reason: collision with root package name */
    public static final int[] f71562g = {67108863, 33554431};

    /* renamed from: h, reason: collision with root package name */
    public static final int[] f71563h = {26, 25};

    public static boolean a(long[] jArr) {
        long[] jArr2 = new long[jArr.length + 1];
        System.arraycopy(jArr, 0, jArr2, 0, jArr.length);
        p(jArr2);
        byte[] bArrC = c(jArr2);
        for (int i5 = 0; i5 < 32; i5++) {
            if (bArrC[i5] != 0) {
                return true;
            }
        }
        return false;
    }

    public static void b(e3 e3Var, io.sentry.internal.debugmeta.c cVar, b bVar) {
        long[] jArr = new long[10];
        fl.l lVar = (fl.l) e3Var.f67208b;
        long[] jArr2 = (long[]) lVar.f55376d;
        fl.l lVar2 = (fl.l) cVar.f67327a;
        w(jArr2, (long[]) lVar2.f55374b, (long[]) lVar2.f55376d);
        v((long[]) lVar.f55374b, (long[]) lVar2.f55374b, (long[]) lVar2.f55376d);
        long[] jArr3 = (long[]) lVar.f55374b;
        m(jArr3, jArr3, bVar.f71567b);
        long[] jArr4 = (long[]) lVar.f55375c;
        long[] jArr5 = (long[]) lVar.f55376d;
        m(jArr4, jArr5, bVar.f71566a);
        long[] jArr6 = (long[]) e3Var.f67209c;
        m(jArr6, (long[]) cVar.f67328b, bVar.f71568c);
        bVar.b(jArr5, (long[]) lVar2.f55375c);
        w(jArr, jArr5, jArr5);
        v(jArr5, jArr4, jArr3);
        w(jArr3, jArr4, jArr3);
        w(jArr4, jArr, jArr6);
        v(jArr6, jArr, jArr6);
    }

    public static byte[] c(long[] jArr) {
        long j11;
        int[] iArr;
        int i5;
        int[] iArr2;
        long[] jArrCopyOf = Arrays.copyOf(jArr, 10);
        int i11 = 0;
        int i12 = 0;
        while (true) {
            j11 = 19;
            iArr = f71563h;
            if (i12 >= 2) {
                break;
            }
            int i13 = 0;
            while (i13 < 9) {
                long j12 = jArrCopyOf[i13];
                int i14 = -((int) (((j12 >> 31) & j12) >> iArr[i13 & 1]));
                jArrCopyOf[i13] = j12 + (i14 << r15);
                i13++;
                jArrCopyOf[i13] = jArrCopyOf[i13] - i14;
            }
            long j13 = jArrCopyOf[9];
            jArrCopyOf[9] = j13 + (r6 << 25);
            jArrCopyOf[0] = jArrCopyOf[0] - ((-((int) (((j13 >> 31) & j13) >> 25))) * 19);
            i12++;
        }
        long j14 = jArrCopyOf[0];
        jArrCopyOf[0] = j14 + (r3 << 26);
        jArrCopyOf[1] = jArrCopyOf[1] - (-((int) (((j14 >> 31) & j14) >> 26)));
        int i15 = 0;
        while (true) {
            iArr2 = f71562g;
            if (i15 >= 2) {
                break;
            }
            int i16 = i11;
            while (i16 < 9) {
                long j15 = jArrCopyOf[i16];
                int i17 = i16 & 1;
                int i18 = i11;
                int i19 = i15;
                int i21 = (int) (j15 >> iArr[i17]);
                jArrCopyOf[i16] = j15 & iArr2[i17];
                i16++;
                jArrCopyOf[i16] = jArrCopyOf[i16] + i21;
                i11 = i18;
                j11 = j11;
                i15 = i19;
            }
            i15++;
        }
        int i22 = i11;
        jArrCopyOf[9] = jArrCopyOf[9] & 33554431;
        long j16 = (((int) (r2 >> 25)) * j11) + jArrCopyOf[i22];
        jArrCopyOf[i22] = j16;
        int i23 = ~((((int) j16) - 67108845) >> 31);
        for (int i24 = 1; i24 < 10; i24++) {
            int i25 = ~(((int) jArrCopyOf[i24]) ^ iArr2[i24 & 1]);
            int i26 = i25 & (i25 << 16);
            int i27 = i26 & (i26 << 8);
            int i28 = i27 & (i27 << 4);
            int i29 = i28 & (i28 << 2);
            i23 &= (i29 & (i29 << 1)) >> 31;
        }
        jArrCopyOf[i22] = jArrCopyOf[i22] - (67108845 & i23);
        long j17 = 33554431 & i23;
        jArrCopyOf[1] = jArrCopyOf[1] - j17;
        for (i5 = 2; i5 < 10; i5 += 2) {
            jArrCopyOf[i5] = jArrCopyOf[i5] - (67108863 & i23);
            int i31 = i5 + 1;
            jArrCopyOf[i31] = jArrCopyOf[i31] - j17;
        }
        for (int i32 = i22; i32 < 10; i32++) {
            jArrCopyOf[i32] = jArrCopyOf[i32] << f71561f[i32];
        }
        byte[] bArr = new byte[32];
        for (int i33 = i22; i33 < 10; i33++) {
            int i34 = f71560e[i33];
            long j18 = bArr[i34];
            long j19 = jArrCopyOf[i33];
            bArr[i34] = (byte) (j18 | (j19 & 255));
            bArr[i34 + 1] = (byte) (bArr[r5] | ((j19 >> 8) & 255));
            bArr[i34 + 2] = (byte) (bArr[r5] | ((j19 >> 16) & 255));
            bArr[i34 + 3] = (byte) (bArr[r4] | ((j19 >> 24) & 255));
        }
        return bArr;
    }

    public static void d(long[] jArr, long[] jArr2, int i5) {
        int i11 = -i5;
        for (int i12 = 0; i12 < 10; i12++) {
            long j11 = jArr[i12];
            jArr[i12] = ((int) j11) ^ ((((int) j11) ^ ((int) jArr2[i12])) & i11);
        }
    }

    public static void e(fl.l lVar, e3 e3Var) {
        long[] jArr = new long[10];
        fl.l lVar2 = (fl.l) e3Var.f67208b;
        t((long[]) lVar2.f55376d, (long[]) lVar.f55376d);
        long[] jArr2 = (long[]) lVar2.f55375c;
        long[] jArr3 = (long[]) lVar.f55374b;
        t(jArr2, jArr3);
        long[] jArr4 = (long[]) e3Var.f67209c;
        t(jArr4, (long[]) lVar.f55375c);
        w(jArr4, jArr4, jArr4);
        long[] jArr5 = (long[]) lVar2.f55374b;
        w(jArr5, (long[]) lVar.f55376d, jArr3);
        t(jArr, jArr5);
        long[] jArr6 = (long[]) lVar2.f55375c;
        long[] jArr7 = (long[]) lVar2.f55376d;
        w(jArr5, jArr6, jArr7);
        v(jArr6, jArr6, jArr7);
        v(jArr7, jArr, jArr5);
        v(jArr4, jArr4, jArr6);
    }

    public static int f(int i5, int i11) {
        int i12 = (~(i5 ^ i11)) & 255;
        int i13 = i12 & (i12 << 4);
        int i14 = i13 & (i13 << 2);
        return ((i14 & (i14 << 1)) >> 7) & 1;
    }

    public static long[] g(byte[] bArr) {
        long[] jArr = new long[10];
        for (int i5 = 0; i5 < 10; i5++) {
            int i11 = f71560e[i5];
            jArr[i5] = (((((bArr[i11] & 255) | ((bArr[i11 + 1] & 255) << 8)) | ((bArr[i11 + 2] & 255) << 16)) | ((bArr[i11 + 3] & 255) << 24)) >> f71561f[i5]) & f71562g[i5 & 1];
        }
        return jArr;
    }

    public static BigInteger h(byte[] bArr) {
        return new BigInteger(1, bArr);
    }

    public static Integer i() {
        return Integer.valueOf(Build.VERSION.SDK_INT);
    }

    public static byte[] j(byte[] bArr) {
        MessageDigest messageDigest = (MessageDigest) sl.j.f87512e.f87514a.a("SHA-512");
        messageDigest.update(bArr, 0, 32);
        byte[] bArrDigest = messageDigest.digest();
        bArrDigest[0] = (byte) (bArrDigest[0] & 248);
        byte b11 = (byte) (bArrDigest[31] & AbstractJsonLexerKt.TC_INVALID);
        bArrDigest[31] = b11;
        bArrDigest[31] = (byte) (b11 | 64);
        return bArrDigest;
    }

    public static long k(int i5, byte[] bArr) {
        return ((bArr[i5 + 2] & 255) << 16) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8);
    }

    public static long l(int i5, byte[] bArr) {
        return ((bArr[i5 + 3] & 255) << 24) | k(i5, bArr);
    }

    public static void m(long[] jArr, long[] jArr2, long[] jArr3) {
        long j11 = jArr2[0];
        long j12 = jArr3[0];
        long j13 = j11 * j12;
        long j14 = jArr3[1];
        long j15 = jArr2[1];
        long j16 = (j15 * j12) + (j11 * j14);
        long j17 = jArr3[2];
        long j18 = jArr2[2];
        long j19 = (j18 * j12) + (j11 * j17) + (j15 * 2 * j14);
        long j21 = jArr3[3];
        long j22 = jArr2[3];
        long j23 = (j22 * j12) + (j11 * j21) + (j18 * j14) + (j15 * j17);
        long j24 = jArr3[4];
        long j25 = jArr2[4];
        long j26 = (j25 * j12) + (j11 * j24) + (((j22 * j14) + (j15 * j21)) * 2) + (j18 * j17);
        long j27 = jArr3[5];
        long j28 = jArr2[5];
        long j29 = (j28 * j12) + (j11 * j27) + (j25 * j14) + (j15 * j24) + (j22 * j17) + (j18 * j21);
        long j31 = jArr3[6];
        long j32 = (j11 * j31) + (j25 * j17) + (j18 * j24) + (((j28 * j14) + (j15 * j27) + (j22 * j21)) * 2);
        long j33 = jArr2[6];
        long j34 = (j33 * j12) + j32;
        long j35 = jArr3[7];
        long j36 = jArr2[7];
        long j37 = (j36 * j12) + (j11 * j35) + (j33 * j14) + (j15 * j31) + (j28 * j17) + (j18 * j27) + (j25 * j21) + (j22 * j24);
        long j38 = jArr3[8];
        long j39 = jArr2[8];
        long j40 = (j39 * j12) + (j11 * j38) + (j33 * j17) + (j18 * j31) + (((j36 * j14) + (j15 * j35) + (j28 * j21) + (j22 * j27)) * 2) + (j25 * j24);
        long j41 = jArr3[9];
        long j42 = jArr2[9];
        long j43 = (j12 * j42) + (j11 * j41) + (j39 * j14) + (j15 * j38) + (j36 * j17) + (j18 * j35) + (j33 * j21) + (j22 * j31) + (j28 * j24) + (j25 * j27);
        long j44 = j14 * j42;
        long j45 = (j39 * j17) + (j18 * j38) + (j33 * j24) + (j25 * j31) + ((j44 + (j15 * j41) + (j36 * j21) + (j22 * j35) + (j28 * j27)) * 2);
        long j46 = j17 * j42;
        long j47 = j46 + (j18 * j41) + (j39 * j21) + (j22 * j38) + (j36 * j24) + (j25 * j35) + (j33 * j27) + (j28 * j31);
        long j48 = j21 * j42;
        long j49 = j39 * j24;
        long j51 = j24 * j42;
        long j52 = j39 * j31;
        long j53 = j31 * j42;
        o(new long[]{j13, j16, j19, j23, j26, j29, j34, j37, j40, j43, j45, j47, j49 + (j25 * j38) + ((j48 + (j22 * j41) + (j36 * j27) + (j28 * j35)) * 2) + (j33 * j31), j51 + (j25 * j41) + (j39 * j27) + (j28 * j38) + (j36 * j31) + (j33 * j35), j52 + (j33 * j38) + (((j27 * j42) + (j28 * j41) + (j36 * j35)) * 2), j53 + (j33 * j41) + (j39 * j35) + (j36 * j38), (((j35 * j42) + (j36 * j41)) * 2) + (j39 * j38), (j38 * j42) + (j39 * j41), j42 * 2 * j41}, jArr);
    }

    public static Provider n() {
        for (int i5 = 0; i5 < 3; i5++) {
            Provider provider = Security.getProvider(f71556a[i5]);
            if (provider != null) {
                return provider;
            }
        }
        return null;
    }

    public static void o(long[] jArr, long[] jArr2) {
        if (jArr.length != 19) {
            long[] jArr3 = new long[19];
            System.arraycopy(jArr, 0, jArr3, 0, jArr.length);
            jArr = jArr3;
        }
        long j11 = jArr[8];
        long j12 = jArr[18];
        long j13 = j11 + (j12 << 4);
        jArr[8] = j13;
        long j14 = j13 + (j12 << 1);
        jArr[8] = j14;
        jArr[8] = j14 + j12;
        long j15 = jArr[7];
        long j16 = jArr[17];
        long j17 = j15 + (j16 << 4);
        jArr[7] = j17;
        long j18 = j17 + (j16 << 1);
        jArr[7] = j18;
        jArr[7] = j18 + j16;
        long j19 = jArr[6];
        long j21 = jArr[16];
        long j22 = j19 + (j21 << 4);
        jArr[6] = j22;
        long j23 = j22 + (j21 << 1);
        jArr[6] = j23;
        jArr[6] = j23 + j21;
        long j24 = jArr[5];
        long j25 = jArr[15];
        long j26 = j24 + (j25 << 4);
        jArr[5] = j26;
        long j27 = j26 + (j25 << 1);
        jArr[5] = j27;
        jArr[5] = j27 + j25;
        long j28 = jArr[4];
        long j29 = jArr[14];
        long j31 = j28 + (j29 << 4);
        jArr[4] = j31;
        long j32 = j31 + (j29 << 1);
        jArr[4] = j32;
        jArr[4] = j32 + j29;
        long j33 = jArr[3];
        long j34 = jArr[13];
        long j35 = j33 + (j34 << 4);
        jArr[3] = j35;
        long j36 = j35 + (j34 << 1);
        jArr[3] = j36;
        jArr[3] = j36 + j34;
        long j37 = jArr[2];
        long j38 = jArr[12];
        long j39 = j37 + (j38 << 4);
        jArr[2] = j39;
        long j40 = j39 + (j38 << 1);
        jArr[2] = j40;
        jArr[2] = j40 + j38;
        long j41 = jArr[1];
        long j42 = jArr[11];
        long j43 = j41 + (j42 << 4);
        jArr[1] = j43;
        long j44 = j43 + (j42 << 1);
        jArr[1] = j44;
        jArr[1] = j44 + j42;
        long j45 = jArr[0];
        long j46 = jArr[10];
        long j47 = j45 + (j46 << 4);
        jArr[0] = j47;
        long j48 = j47 + (j46 << 1);
        jArr[0] = j48;
        jArr[0] = j48 + j46;
        p(jArr);
        System.arraycopy(jArr, 0, jArr2, 0, 10);
    }

    public static void p(long[] jArr) {
        jArr[10] = 0;
        int i5 = 0;
        while (i5 < 10) {
            long j11 = jArr[i5];
            long j12 = j11 / 67108864;
            jArr[i5] = j11 - (j12 << 26);
            int i11 = i5 + 1;
            long j13 = jArr[i11] + j12;
            jArr[i11] = j13;
            long j14 = j13 / 33554432;
            jArr[i11] = j13 - (j14 << 25);
            i5 += 2;
            jArr[i5] = jArr[i5] + j14;
        }
        long j15 = jArr[0];
        long j16 = jArr[10];
        long j17 = j15 + (j16 << 4);
        jArr[0] = j17;
        long j18 = j17 + (j16 << 1);
        jArr[0] = j18;
        long j19 = j18 + j16;
        jArr[0] = j19;
        jArr[10] = 0;
        long j21 = j19 / 67108864;
        jArr[0] = j19 - (j21 << 26);
        jArr[1] = jArr[1] + j21;
    }

    public static fl.l q(byte[] bArr) {
        int i5;
        byte[] bArr2 = new byte[64];
        int i11 = 0;
        while (true) {
            if (i11 >= 32) {
                break;
            }
            int i12 = i11 * 2;
            bArr2[i12] = (byte) (bArr[i11] & 15);
            bArr2[i12 + 1] = (byte) (((bArr[i11] & 255) >> 4) & 15);
            i11++;
        }
        int i13 = 0;
        int i14 = 0;
        while (i13 < 63) {
            byte b11 = (byte) (bArr2[i13] + i14);
            bArr2[i13] = b11;
            int i15 = (b11 + 8) >> 4;
            bArr2[i13] = (byte) (b11 - (i15 << 4));
            i13++;
            i14 = i15;
        }
        bArr2[63] = (byte) (bArr2[63] + i14);
        e3 e3Var = new e3(26, (byte) 0);
        io.sentry.internal.debugmeta.c cVar = new io.sentry.internal.debugmeta.c(28);
        for (i5 = 1; i5 < 64; i5 += 2) {
            b bVar = new b();
            r(bVar, i5 / 2, bArr2[i5]);
            io.sentry.internal.debugmeta.c.t(cVar, e3Var);
            b(e3Var, cVar, bVar);
        }
        fl.l lVar = new fl.l(22);
        fl.l.n(lVar, e3Var);
        e(lVar, e3Var);
        fl.l.n(lVar, e3Var);
        e(lVar, e3Var);
        fl.l.n(lVar, e3Var);
        e(lVar, e3Var);
        fl.l.n(lVar, e3Var);
        e(lVar, e3Var);
        for (int i16 = 0; i16 < 64; i16 += 2) {
            b bVar2 = new b();
            r(bVar2, i16 / 2, bArr2[i16]);
            io.sentry.internal.debugmeta.c.t(cVar, e3Var);
            b(e3Var, cVar, bVar2);
        }
        fl.l lVar2 = new fl.l(e3Var);
        long[] jArr = new long[10];
        t(jArr, (long[]) lVar2.f55376d);
        long[] jArr2 = new long[10];
        t(jArr2, (long[]) lVar2.f55374b);
        long[] jArr3 = new long[10];
        t(jArr3, (long[]) lVar2.f55375c);
        long[] jArr4 = new long[10];
        t(jArr4, jArr3);
        long[] jArr5 = new long[10];
        v(jArr5, jArr2, jArr);
        m(jArr5, jArr5, jArr3);
        long[] jArr6 = new long[10];
        m(jArr6, jArr, jArr2);
        m(jArr6, jArr6, d.f71573a);
        w(jArr6, jArr6, jArr4);
        o(jArr6, jArr6);
        if (MessageDigest.isEqual(c(jArr5), c(jArr6))) {
            return lVar2;
        }
        throw new IllegalStateException("arithmetic error in scalar multiplication");
    }

    public static void r(b bVar, int i5, byte b11) {
        int i11 = (b11 & 255) >> 7;
        int i12 = b11 - (((-i11) & b11) << 1);
        b[][] bVarArr = d.f71576d;
        bVar.a(bVarArr[i5][0], f(i12, 1));
        bVar.a(bVarArr[i5][1], f(i12, 2));
        bVar.a(bVarArr[i5][2], f(i12, 3));
        bVar.a(bVarArr[i5][3], f(i12, 4));
        bVar.a(bVarArr[i5][4], f(i12, 5));
        bVar.a(bVarArr[i5][5], f(i12, 6));
        bVar.a(bVarArr[i5][6], f(i12, 7));
        bVar.a(bVarArr[i5][7], f(i12, 8));
        long[] jArr = bVar.f71567b;
        long[] jArrCopyOf = Arrays.copyOf(jArr, 10);
        long[] jArr2 = bVar.f71566a;
        long[] jArrCopyOf2 = Arrays.copyOf(jArr2, 10);
        long[] jArr3 = bVar.f71568c;
        long[] jArrCopyOf3 = Arrays.copyOf(jArr3, 10);
        for (int i13 = 0; i13 < jArrCopyOf3.length; i13++) {
            jArrCopyOf3[i13] = -jArrCopyOf3[i13];
        }
        d(jArr2, jArrCopyOf, i11);
        d(jArr, jArrCopyOf2, i11);
        d(jArr3, jArrCopyOf3, i11);
    }

    public static byte[] s(byte[] bArr) {
        int i5;
        byte[] bArr2 = new byte[256];
        for (int i11 = 0; i11 < 256; i11++) {
            bArr2[i11] = (byte) (1 & ((bArr[i11 >> 3] & 255) >> (i11 & 7)));
        }
        for (int i12 = 0; i12 < 256; i12++) {
            if (bArr2[i12] != 0) {
                for (int i13 = 1; i13 <= 6 && (i5 = i12 + i13) < 256; i13++) {
                    byte b11 = bArr2[i5];
                    if (b11 != 0) {
                        byte b12 = bArr2[i12];
                        if ((b11 << i13) + b12 <= 15) {
                            bArr2[i12] = (byte) (b12 + (b11 << i13));
                            bArr2[i5] = 0;
                        } else if (b12 - (b11 << i13) >= -15) {
                            bArr2[i12] = (byte) (b12 - (b11 << i13));
                            while (true) {
                                if (i5 >= 256) {
                                    break;
                                }
                                if (bArr2[i5] == 0) {
                                    bArr2[i5] = 1;
                                    break;
                                }
                                bArr2[i5] = 0;
                                i5++;
                            }
                        }
                    }
                }
            }
        }
        return bArr2;
    }

    public static void t(long[] jArr, long[] jArr2) {
        long j11 = jArr2[0];
        long j12 = j11 * 2;
        long j13 = jArr2[1];
        long j14 = jArr2[2];
        long j15 = jArr2[3];
        long j16 = jArr2[4];
        long j17 = jArr2[5];
        long j18 = jArr2[6];
        long j19 = jArr2[7];
        long j21 = jArr2[8];
        long j22 = jArr2[9];
        o(new long[]{j11 * j11, j12 * j13, ((j11 * j14) + (j13 * j13)) * 2, ((j11 * j15) + (j13 * j14)) * 2, (j12 * j16) + (j13 * 4 * j15) + (j14 * j14), ((j11 * j17) + (j13 * j16) + (j14 * j15)) * 2, ((j13 * 2 * j17) + (j11 * j18) + (j14 * j16) + (j15 * j15)) * 2, ((j11 * j19) + (j13 * j18) + (j14 * j17) + (j15 * j16)) * 2, (((((j15 * j17) + (j13 * j19)) * 2) + (j11 * j21) + (j14 * j18)) * 2) + (j16 * j16), ((j11 * j22) + (j13 * j21) + (j14 * j19) + (j15 * j18) + (j16 * j17)) * 2, ((((j13 * j22) + (j15 * j19)) * 2) + (j14 * j21) + (j16 * j18) + (j17 * j17)) * 2, ((j14 * j22) + (j15 * j21) + (j16 * j19) + (j17 * j18)) * 2, (((((j15 * j22) + (j17 * j19)) * 2) + (j16 * j21)) * 2) + (j18 * j18), ((j16 * j22) + (j17 * j21) + (j18 * j19)) * 2, ((j17 * 2 * j22) + (j18 * j21) + (j19 * j19)) * 2, ((j18 * j22) + (j19 * j21)) * 2, (j19 * 4 * j22) + (j21 * j21), j21 * 2 * j22, 2 * j22 * j22}, jArr);
    }

    public static void u(e3 e3Var, io.sentry.internal.debugmeta.c cVar, b bVar) {
        long[] jArr = new long[10];
        fl.l lVar = (fl.l) e3Var.f67208b;
        long[] jArr2 = (long[]) lVar.f55376d;
        fl.l lVar2 = (fl.l) cVar.f67327a;
        w(jArr2, (long[]) lVar2.f55374b, (long[]) lVar2.f55376d);
        v((long[]) lVar.f55374b, (long[]) lVar2.f55374b, (long[]) lVar2.f55376d);
        long[] jArr3 = (long[]) lVar.f55374b;
        m(jArr3, jArr3, bVar.f71566a);
        long[] jArr4 = (long[]) lVar.f55375c;
        long[] jArr5 = (long[]) lVar.f55376d;
        m(jArr4, jArr5, bVar.f71567b);
        long[] jArr6 = (long[]) e3Var.f67209c;
        m(jArr6, (long[]) cVar.f67328b, bVar.f71568c);
        bVar.b(jArr5, (long[]) lVar2.f55375c);
        w(jArr, jArr5, jArr5);
        v(jArr5, jArr4, jArr3);
        w(jArr3, jArr4, jArr3);
        v(jArr4, jArr, jArr6);
        w(jArr6, jArr, jArr6);
    }

    public static void v(long[] jArr, long[] jArr2, long[] jArr3) {
        for (int i5 = 0; i5 < 10; i5++) {
            jArr[i5] = jArr2[i5] - jArr3[i5];
        }
    }

    public static void w(long[] jArr, long[] jArr2, long[] jArr3) {
        for (int i5 = 0; i5 < 10; i5++) {
            jArr[i5] = jArr2[i5] + jArr3[i5];
        }
    }

    public static byte[] x(int i5, BigInteger bigInteger) throws GeneralSecurityException {
        if (bigInteger.signum() == -1) {
            throw new IllegalArgumentException("integer must be nonnegative");
        }
        byte[] byteArray = bigInteger.toByteArray();
        if (byteArray.length == i5) {
            return byteArray;
        }
        int i11 = i5 + 1;
        if (byteArray.length > i11) {
            throw new GeneralSecurityException("integer too large");
        }
        if (byteArray.length == i11) {
            if (byteArray[0] == 0) {
                return Arrays.copyOfRange(byteArray, 1, byteArray.length);
            }
            throw new GeneralSecurityException("integer too large");
        }
        byte[] bArr = new byte[i5];
        System.arraycopy(byteArray, 0, bArr, i5 - byteArray.length, byteArray.length);
        return bArr;
    }
}
