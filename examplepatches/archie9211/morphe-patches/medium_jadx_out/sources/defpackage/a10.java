package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class a10 {
    public static final sn3 a = new sn3(0, new n7(7));
    public static final sn3 b = new sn3(0, new n7(8));
    public static final pj2 c = new pj2(0.8f, 0.0f, 0.8f, 0.15f);
    public static final float d = 24.0f;
    public static final float e = 28.0f;
    public static final float f = 4.0f;
    public static final float g = 12.0f;

    public static final void a(mz1 mz1Var, r28 r28Var, mz1 mz1Var2, mz1 mz1Var3, float f2, y3f y3fVar, qod qodVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        float f3;
        float f4;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-302230691);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(mz1Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(mz1Var2) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.h(mz1Var3) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i3 = i2 | 24576;
        if ((196608 & i) == 0) {
            i3 |= p65Var2.f(y3fVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i3 |= p65Var2.f(qodVar) ? 1048576 : 524288;
        }
        int i4 = i3 | 12582912;
        if (p65Var2.P(i4 & 1, (4793491 & i4) != 4793490)) {
            p65Var2.U();
            if ((i & 1) == 0 || p65Var2.z()) {
                f4 = rod.a;
            } else {
                p65Var2.S();
                f4 = f2;
            }
            p65Var2.q();
            int i5 = i4 << 12;
            p65Var = p65Var2;
            d(r28Var, mz1Var, pyd.a(e10.a, p65Var2), mkd.d, z46.q, mz1Var2, mz1Var3, (vj3.b(f4, Float.NaN) || vj3.b(f4, Float.POSITIVE_INFINITY)) ? rod.a : f4, y3fVar, qodVar, p65Var, ((i4 >> 3) & 14) | 224256 | ((i4 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (3670016 & i5) | (29360128 & i5) | (i5 & 1879048192), (i4 >> 18) & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            f3 = f4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            f3 = f2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v00(mz1Var, r28Var, mz1Var2, mz1Var3, f3, y3fVar, qodVar, i, 1);
        }
    }

    public static final void b(mz1 mz1Var, r28 r28Var, mz1 mz1Var2, mz1 mz1Var3, float f2, float f3, y3f y3fVar, qod qodVar, uod uodVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        float f4;
        float f5;
        float f6;
        float f7;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1406602045);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(mz1Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(mz1Var2) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.h(mz1Var3) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i3 = i2 | 221184;
        if ((1572864 & i) == 0) {
            i3 |= p65Var2.f(y3fVar) ? 1048576 : 524288;
        }
        if ((12582912 & i) == 0) {
            i3 |= p65Var2.f(qodVar) ? 8388608 : 4194304;
        }
        if ((100663296 & i) == 0) {
            i3 |= p65Var2.f(uodVar) ? 67108864 : 33554432;
        }
        if (p65Var2.P(i3 & 1, (38347923 & i3) != 38347922)) {
            p65Var2.U();
            if ((i & 1) == 0 || p65Var2.z()) {
                f6 = rod.d;
                f7 = rod.e;
            } else {
                p65Var2.S();
                f6 = f2;
                f7 = f3;
            }
            p65Var2.q();
            mkd mkdVarA = pyd.a(c10.a, p65Var2);
            mkd mkdVarA2 = pyd.a(e10.a, p65Var2);
            mkd mkdVar = mkd.d;
            int i4 = i3 >> 3;
            p65Var = p65Var2;
            g(r28Var, mz1Var, mkdVarA, e, mz1Var, mkdVarA2, mkdVar, mkdVar, mz1Var2, mz1Var3, (vj3.b(f6, Float.NaN) || vj3.b(f6, Float.POSITIVE_INFINITY)) ? rod.d : f6, (vj3.b(f7, Float.NaN) || vj3.b(f7, Float.POSITIVE_INFINITY)) ? rod.e : f7, y3fVar, qodVar, uodVar, p65Var, (i4 & 14) | 920128512 | ((i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 << 12) & 57344), (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6 | (i4 & 896) | (458752 & i4) | (3670016 & i4) | (i4 & 29360128));
            f5 = f7;
            f4 = f6;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            f4 = f2;
            f5 = f3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t00(mz1Var, r28Var, mz1Var2, mz1Var3, f4, f5, y3fVar, qodVar, uodVar, i, 1);
        }
    }

    public static final void c(mz1 mz1Var, r28 r28Var, mz1 mz1Var2, c55 c55Var, float f2, float f3, y3f y3fVar, qod qodVar, uod uodVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        float f4;
        float f5;
        float f6;
        float f7;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1378129383);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(mz1Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(mz1Var2) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.h(c55Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i3 = i2 | 221184;
        if ((1572864 & i) == 0) {
            i3 |= p65Var2.f(y3fVar) ? 1048576 : 524288;
        }
        if ((12582912 & i) == 0) {
            i3 |= p65Var2.f(qodVar) ? 8388608 : 4194304;
        }
        if ((100663296 & i) == 0) {
            i3 |= p65Var2.f(uodVar) ? 67108864 : 33554432;
        }
        if (p65Var2.P(i3 & 1, (38347923 & i3) != 38347922)) {
            p65Var2.U();
            if ((i & 1) == 0 || p65Var2.z()) {
                f6 = rod.b;
                f7 = rod.c;
            } else {
                p65Var2.S();
                f6 = f2;
                f7 = f3;
            }
            p65Var2.q();
            mkd mkdVarA = pyd.a(d10.a, p65Var2);
            mkd mkdVarA2 = pyd.a(e10.a, p65Var2);
            mkd mkdVar = mkd.d;
            int i4 = i3 >> 3;
            p65Var = p65Var2;
            g(r28Var, mz1Var, mkdVarA, d, mz1Var, mkdVarA2, mkdVar, mkdVar, mz1Var2, c55Var, (vj3.b(f6, Float.NaN) || vj3.b(f6, Float.POSITIVE_INFINITY)) ? rod.b : f6, (vj3.b(f7, Float.NaN) || vj3.b(f7, Float.POSITIVE_INFINITY)) ? rod.c : f7, y3fVar, qodVar, uodVar, p65Var, (i4 & 14) | 920128512 | ((i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 << 12) & 57344), (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6 | (i4 & 896) | (458752 & i4) | (3670016 & i4) | (i4 & 29360128));
            f5 = f7;
            f4 = f6;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            f4 = f2;
            f5 = f3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t00(mz1Var, r28Var, mz1Var2, c55Var, f4, f5, y3fVar, qodVar, uodVar, i, 0);
        }
    }

    public static final void d(final r28 r28Var, final mz1 mz1Var, final mkd mkdVar, final mkd mkdVar2, final yq0 yq0Var, final mz1 mz1Var2, final c55 c55Var, final float f2, final y3f y3fVar, final qod qodVar, x12 x12Var, final int i, final int i2) {
        int i3;
        mkd mkdVar3;
        yq0 yq0Var2;
        mz1 mz1Var3;
        c55 c55Var2;
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2033800111);
        if ((i & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        if ((i & 48) == 0) {
            i3 |= p65Var.h(mz1Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i3 |= p65Var.f(mkdVar) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i3 |= p65Var.h(null) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            mkdVar3 = mkdVar2;
            i3 |= p65Var.f(mkdVar3) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            mkdVar3 = mkdVar2;
        }
        if ((196608 & i) == 0) {
            yq0Var2 = yq0Var;
            i3 |= p65Var.f(yq0Var2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            yq0Var2 = yq0Var;
        }
        if ((1572864 & i) == 0) {
            mz1Var3 = mz1Var2;
            i3 |= p65Var.h(mz1Var3) ? 1048576 : 524288;
        } else {
            mz1Var3 = mz1Var2;
        }
        if ((12582912 & i) == 0) {
            c55Var2 = c55Var;
            i3 |= p65Var.h(c55Var2) ? 8388608 : 4194304;
        } else {
            c55Var2 = c55Var;
        }
        if ((100663296 & i) == 0) {
            i3 |= p65Var.c(f2) ? 67108864 : 33554432;
        }
        if ((i & 805306368) == 0) {
            i3 |= p65Var.f(y3fVar) ? 536870912 : 268435456;
        }
        if ((i2 & 6) == 0) {
            i4 = i2 | (p65Var.f(qodVar) ? 4 : 2);
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var.f(null) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, ((306783379 & i3) == 306783378 && (i4 & 19) == 18) ? false : true)) {
            ((z13) p65Var.j(a)).a(new sec(r28Var, mz1Var, mkdVar, mkdVar3, yq0Var2, mz1Var3, c55Var2, f2, y3fVar, qodVar), p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: x00
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    a10.d(r28Var, mz1Var, mkdVar, mkdVar2, yq0Var, mz1Var2, c55Var, f2, y3fVar, qodVar, (x12) obj, tr7.y(i | 1), tr7.y(i2));
                    return c1e.a;
                }
            };
        }
    }

    public static final void e(mz1 mz1Var, r28 r28Var, mz1 mz1Var2, c55 c55Var, float f2, y3f y3fVar, qod qodVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        float f3;
        float f4;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1784421840);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(mz1Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(mz1Var2) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.h(c55Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i3 = i2 | 24576;
        if ((196608 & i) == 0) {
            i3 |= p65Var2.f(y3fVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i3 |= p65Var2.f(qodVar) ? 1048576 : 524288;
        }
        int i4 = i3 | 12582912;
        if (p65Var2.P(i4 & 1, (4793491 & i4) != 4793490)) {
            p65Var2.U();
            if ((i & 1) == 0 || p65Var2.z()) {
                f4 = rod.a;
            } else {
                p65Var2.S();
                f4 = f2;
            }
            p65Var2.q();
            int i5 = i4 << 12;
            p65Var = p65Var2;
            d(r28Var, mz1Var, pyd.a(e10.a, p65Var2), mkd.d, z46.p, mz1Var2, c55Var, (vj3.b(f4, Float.NaN) || vj3.b(f4, Float.POSITIVE_INFINITY)) ? rod.a : f4, y3fVar, qodVar, p65Var, ((i4 >> 3) & 14) | 224256 | ((i4 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (3670016 & i5) | (29360128 & i5) | (i5 & 1879048192), (i4 >> 18) & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            f3 = f4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            f3 = f2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v00(mz1Var, r28Var, mz1Var2, c55Var, f3, y3fVar, qodVar, i, 0);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void f(final r28 r28Var, final mn4 mn4Var, final long j, final long j2, final long j3, long j4, final mz1 mz1Var, final mkd mkdVar, final mkd mkdVar2, m45 m45Var, final j70 j70Var, final yq0 yq0Var, final int i, final boolean z, final mz1 mz1Var2, mz1 mz1Var3, final float f2, x12 x12Var, final int i2, final int i3) {
        int i4;
        mz1 mz1Var4;
        p65 p65Var;
        long j5;
        m45 m45Var2;
        uob uobVar;
        r28 go1Var;
        boolean z2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(126395868);
        int i5 = i2 | (p65Var2.f(r28Var) ? 4 : 2) | (p65Var2.f(mn4Var) ? 32 : 16) | (p65Var2.e(j) ? 256 : 128) | (p65Var2.e(j2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.e(j3) ? 16384 : 8192);
        boolean zE = p65Var2.e(j4);
        int i6 = ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        int i7 = i5 | (zE ? 131072 : 65536) | (p65Var2.h(mz1Var) ? 1048576 : 524288) | (p65Var2.f(mkdVar) ? 8388608 : 4194304) | (p65Var2.h(null) ? 67108864 : 33554432) | (p65Var2.f(mkdVar2) ? 536870912 : 268435456);
        if ((i3 & 6) == 0) {
            i4 = i3 | (p65Var2.h(m45Var) ? 4 : 2);
        } else {
            i4 = i3;
        }
        int i8 = i4 | (p65Var2.f(yq0Var) ? 256 : 128);
        if ((i3 & 3072) == 0) {
            i8 |= p65Var2.d(i) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i3 & 24576) == 0) {
            i8 |= p65Var2.g(z) ? 16384 : 8192;
        }
        if ((196608 & i3) == 0) {
            if (p65Var2.h(mz1Var2)) {
                i6 = 131072;
            }
            i8 |= i6;
        }
        int i9 = i8 | (p65Var2.c(f2) ? 8388608 : 4194304);
        if (p65Var2.P(i7 & 1, ((i7 & 306783379) == 306783378 && (4793491 & i9) == 4793490) ? false : true)) {
            boolean z3 = ((i7 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i9 & 896) == 256) | ((i9 & 7168) == 2048) | ((29360128 & i9) == 8388608);
            Object objM = p65Var2.M();
            uob uobVar2 = w12.a;
            if (z3 || objM == uobVar2) {
                tod todVar = new tod(mn4Var, j70Var, yq0Var, i, f2);
                p65Var2.j0(todVar);
                objM = todVar;
            }
            tod todVar2 = (tod) objM;
            int iS = w2g.s(p65Var2);
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, todVar2);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            cu cuVar3 = q12.g;
            if (p65Var2.S || !g76.L(p65Var2.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var2, iS, cuVar3);
            }
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarJ = kng.J(o28Var, "navigationIcon");
            float f3 = f;
            r28 r28VarG = w2g.G(r28VarJ, f3, 0.0f, 0.0f, 0.0f, 14);
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            int iS2 = w2g.s(p65Var2);
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarG);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            if (p65Var2.S || !g76.L(p65Var2.M(), Integer.valueOf(iS2))) {
                lv8.w(iS2, p65Var2, iS2, cuVar3);
            }
            tp7.B(p65Var2, cuVar4, r28VarR2);
            sn3 sn3Var = c82.a;
            k40.c(b09.q(j, sn3Var), mz1Var2, p65Var2, ((i9 >> 12) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 8);
            p65Var2.p(true);
            p65Var2.Y(-1359701523);
            int i10 = 2;
            r28 r28VarE = w2g.E(kng.J(o28Var, "title"), f3, 0.0f, 2);
            if (z) {
                p65Var2.Y(510338172);
                Object objM2 = p65Var2.M();
                uobVar = uobVar2;
                if (objM2 == uobVar) {
                    objM2 = new nx(i10);
                    p65Var2.j0(objM2);
                }
                AtomicInteger atomicInteger = wxb.a;
                go1Var = new go1((x45) objM2);
                p65Var2.p(false);
            } else {
                uobVar = uobVar2;
                p65Var2.Y(510340109);
                p65Var2.p(false);
                go1Var = o28Var;
            }
            r28 r28VarB = r28VarE.b(go1Var);
            boolean z4 = (i9 & 14) == 4;
            Object objM3 = p65Var2.M();
            if (z4 || objM3 == uobVar) {
                m45Var2 = m45Var;
                z2 = false;
                objM3 = new r00(0 == true ? 1 : 0, m45Var2);
                p65Var2.j0(objM3);
            } else {
                m45Var2 = m45Var;
                z2 = false;
            }
            r28 r28VarW = xz5.W(r28VarB, (x45) objM3);
            zk7 zk7VarC2 = dy0.c(ar0Var, z2);
            int iS3 = w2g.s(p65Var2);
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, r28VarW);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            if (p65Var2.S || !g76.L(p65Var2.M(), Integer.valueOf(iS3))) {
                lv8.w(iS3, p65Var2, iS3, cuVar3);
            }
            tp7.B(p65Var2, cuVar4, r28VarR3);
            fo7.v(j2, mkdVar, mz1Var, p65Var2, ((i7 >> 9) & 14) | ((i7 >> 18) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i7 >> 12) & 896));
            p65Var = p65Var2;
            p65Var.p(true);
            p65Var.p(false);
            r28 r28VarG2 = w2g.G(kng.J(o28Var, "actionIcons"), 0.0f, 0.0f, f3, 0.0f, 11);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            int iS4 = w2g.s(p65Var);
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarG2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL4);
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS4))) {
                lv8.w(iS4, p65Var, iS4, cuVar3);
            }
            tp7.B(p65Var, cuVar4, r28VarR4);
            j5 = j4;
            mz1Var4 = mz1Var3;
            k40.c(sn3Var.a(new uu1(j5)), mz1Var4, p65Var, 56);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            mz1Var4 = mz1Var3;
            p65Var = p65Var2;
            j5 = j4;
            m45Var2 = m45Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final mz1 mz1Var5 = mz1Var4;
            final m45 m45Var3 = m45Var2;
            final long j6 = j5;
            mwaVarS.d = new b55(mn4Var, j, j2, j3, j6, mz1Var, mkdVar, mkdVar2, m45Var3, j70Var, yq0Var, i, z, mz1Var2, mz1Var5, f2, i2, i3) { // from class: s00
                public final /* synthetic */ mn4 b;
                public final /* synthetic */ long c;
                public final /* synthetic */ long d;
                public final /* synthetic */ long e;
                public final /* synthetic */ long f;
                public final /* synthetic */ mz1 g;
                public final /* synthetic */ mkd h;
                public final /* synthetic */ mkd i;
                public final /* synthetic */ m45 j;
                public final /* synthetic */ j70 k;
                public final /* synthetic */ yq0 l;
                public final /* synthetic */ int m;
                public final /* synthetic */ boolean n;
                public final /* synthetic */ mz1 o;
                public final /* synthetic */ mz1 p;
                public final /* synthetic */ float q;
                public final /* synthetic */ int r;

                {
                    this.r = i3;
                }

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(1);
                    int iY2 = tr7.y(this.r);
                    a10.f(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, this.p, this.q, (x12) obj, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    public static final void g(final r28 r28Var, final mz1 mz1Var, final mkd mkdVar, final float f2, final mz1 mz1Var2, final mkd mkdVar2, final mkd mkdVar3, final mkd mkdVar4, final mz1 mz1Var3, final c55 c55Var, final float f3, final float f4, final y3f y3fVar, final qod qodVar, final uod uodVar, x12 x12Var, final int i, final int i2) {
        int i3;
        mkd mkdVar5;
        float f5;
        mz1 mz1Var4;
        mkd mkdVar6;
        int i4;
        c55 c55Var2;
        float f6;
        yq0 yq0Var = z46.p;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1092180406);
        if ((i & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        if ((i & 48) == 0) {
            i3 |= p65Var.h(mz1Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            mkdVar5 = mkdVar;
            i3 |= p65Var.f(mkdVar5) ? 256 : 128;
        } else {
            mkdVar5 = mkdVar;
        }
        int i5 = i & 3072;
        int i6 = RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
        if (i5 == 0) {
            f5 = f2;
            i3 |= p65Var.c(f5) ? 2048 : 1024;
        } else {
            f5 = f2;
        }
        if ((i & 24576) == 0) {
            mz1Var4 = mz1Var2;
            i3 |= p65Var.h(mz1Var4) ? 16384 : 8192;
        } else {
            mz1Var4 = mz1Var2;
        }
        int i7 = i & 196608;
        int i8 = ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        if (i7 == 0) {
            i3 |= p65Var.f(mkdVar2) ? 131072 : 65536;
        }
        if ((i & 1572864) == 0) {
            i3 |= p65Var.h(null) ? 1048576 : 524288;
        }
        if ((i & 12582912) == 0) {
            i3 |= p65Var.f(mkdVar3) ? 8388608 : 4194304;
        }
        if ((i & 100663296) == 0) {
            i3 |= p65Var.h(null) ? 67108864 : 33554432;
        }
        if ((805306368 & i) == 0) {
            mkdVar6 = mkdVar4;
            i3 |= p65Var.f(mkdVar6) ? 536870912 : 268435456;
        } else {
            mkdVar6 = mkdVar4;
        }
        if ((i2 & 6) == 0) {
            i4 = i2 | (p65Var.f(yq0Var) ? 4 : 2);
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var.h(mz1Var3) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            c55Var2 = c55Var;
            i4 |= p65Var.h(c55Var2) ? 256 : 128;
        } else {
            c55Var2 = c55Var;
        }
        if ((i2 & 3072) == 0) {
            f6 = f3;
            if (!p65Var.c(f6)) {
                i6 = 1024;
            }
            i4 |= i6;
        } else {
            f6 = f3;
        }
        if ((i2 & 24576) == 0) {
            i4 |= p65Var.c(f4) ? 16384 : 8192;
        }
        if ((i2 & 196608) == 0) {
            if (p65Var.f(y3fVar)) {
                i8 = 131072;
            }
            i4 |= i8;
        }
        if ((i2 & 1572864) == 0) {
            i4 |= p65Var.f(qodVar) ? 1048576 : 524288;
        }
        if ((i2 & 12582912) == 0) {
            i4 |= p65Var.f(uodVar) ? 8388608 : 4194304;
        }
        if (p65Var.P(i3 & 1, ((i3 & 306783379) == 306783378 && (i4 & 4793491) == 4793490) ? false : true)) {
            ((c33) p65Var.j(b)).a(new gud(r28Var, mz1Var, mkdVar5, f5, mz1Var4, mkdVar2, mkdVar3, mkdVar6, mz1Var3, c55Var2, f6, f4, y3fVar, qodVar, uodVar), p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: p00
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i | 1);
                    int iY2 = tr7.y(i2);
                    a10.g(r28Var, mz1Var, mkdVar, f2, mz1Var2, mkdVar2, mkdVar3, mkdVar4, mz1Var3, c55Var, f3, f4, y3fVar, qodVar, uodVar, (x12) obj, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    public static final vod h(x12 x12Var) {
        Object[] objArr = new Object[0];
        mya myaVar = vod.d;
        boolean zC = ((p65) x12Var).c(-3.4028235E38f) | ((p65) x12Var).c(0.0f) | ((p65) x12Var).c(0.0f);
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (zC || objM == w12.a) {
            objM = new n7(9);
            p65Var.j0(objM);
        }
        return (vod) hp7.F(objArr, myaVar, (m45) objM, p65Var, 0);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object i(defpackage.vod r9, float r10, defpackage.xv2 r11, defpackage.ww r12, defpackage.p92 r13) {
        /*
            Method dump skipped, instruction units count: 244
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a10.i(vod, float, xv2, ww, p92):java.lang.Object");
    }
}
