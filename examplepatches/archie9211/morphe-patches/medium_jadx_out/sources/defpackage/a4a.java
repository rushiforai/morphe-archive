package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.LeicaMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class a4a {
    public static final pj2 a = new pj2(0.2f, 0.0f, 0.8f, 1.0f);
    public static final pj2 b = new pj2(0.4f, 0.0f, 1.0f, 1.0f);
    public static final pj2 c = new pj2(0.0f, 0.0f, 0.65f, 1.0f);
    public static final pj2 d = new pj2(0.1f, 0.0f, 0.45f, 1.0f);
    public static final pj2 e = new pj2(0.4f, 0.0f, 0.2f, 1.0f);

    public static final void a(final float f, final r28 r28Var, final long j, final float f2, long j2, x12 x12Var, final int i) {
        int i2;
        final long j3;
        long j4;
        int i3;
        final long j5;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1746618448);
        if ((i & 6) == 0) {
            i2 = (p65Var.c(f) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.e(j) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.c(f2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i4 = i2 | 24576;
        if ((196608 & i) == 0) {
            i4 = 90112 | i2;
        }
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                j4 = uu1.g;
                i3 = i4 & (-458753);
            } else {
                p65Var.S();
                i3 = i4 & (-458753);
                j4 = j2;
            }
            p65Var.q();
            float f3 = f < 0.0f ? 0.0f : f;
            if (f3 > 1.0f) {
                f3 = 1.0f;
            }
            final uuc uucVar = new uuc(((m73) p65Var.j(z22.h)).Z(f2), 0.0f, 0, 0, 26);
            Float fValueOf = Float.valueOf(f3);
            if (Float.isNaN(f3)) {
                fValueOf = null;
            }
            r28 r28VarL = jfc.l(wxb.a(r28Var, true, new b4a(fValueOf != null ? fValueOf.floatValue() : 0.0f, new hp1(0.0f, 1.0f))), 40.0f);
            boolean zC = p65Var.c(f3) | ((57344 & i3) == 16384) | p65Var.h(uucVar) | ((((i3 & 896) ^ 384) > 256 && p65Var.e(j)) || (i3 & 384) == 256);
            Object objM = p65Var.M();
            if (zC || objM == w12.a) {
                final float f4 = f3;
                j5 = j4;
                x45 x45Var = new x45() { // from class: u3a
                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        zl3 zl3Var = (zl3) obj;
                        float f5 = 360.0f * f4;
                        long j6 = j5;
                        uuc uucVar2 = uucVar;
                        a4a.e(zl3Var, 0.0f, 360.0f, j6, uucVar2);
                        a4a.e(zl3Var, 270.0f, f5, j, uucVar2);
                        return c1e.a;
                    }
                };
                p65Var.j0(x45Var);
                objM = x45Var;
            } else {
                j5 = j4;
            }
            pxf.a(r28VarL, (x45) objM, p65Var, 0);
            j3 = j5;
        } else {
            p65Var.S();
            j3 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: w3a
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    a4a.a(f, r28Var, j, f2, j3, (x12) obj, tr7.y(i | 1));
                    return c1e.a;
                }
            };
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:63:0x0181 A[PHI: r5 r8
      0x0181: PHI (r5v14 long) = (r5v11 long), (r5v15 long) binds: [B:62:0x017f, B:58:0x0177] A[DONT_GENERATE, DONT_INLINE]
      0x0181: PHI (r8v15 l16) = (r8v13 l16), (r8v16 l16) binds: [B:62:0x017f, B:58:0x0177] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x018d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(final float r24, int r25, int r26, long r27, long r29, defpackage.x12 r31, defpackage.r28 r32) {
        /*
            Method dump skipped, instruction units count: 454
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a4a.b(float, int, int, long, long, x12, r28):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:79:0x018b A[PHI: r7
      0x018b: PHI (r7v30 l16) = (r7v26 l16), (r7v31 l16) binds: [B:78:0x0189, B:74:0x0181] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:84:0x01a3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void c(defpackage.r28 r17, final long r18, final long r20, defpackage.x12 r22, int r23) {
        /*
            Method dump skipped, instruction units count: 466
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a4a.c(r28, long, long, x12, int):void");
    }

    public static final void d(final float f, final r28 r28Var, final long j, final long j2, x12 x12Var, final int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-531984864);
        if ((i & 6) == 0) {
            i2 = (p65Var.c(f) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.e(j) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.e(j2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.d(0) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        boolean z = true;
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            p65Var.U();
            if ((i & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            float f2 = f < 0.0f ? 0.0f : f;
            if (f2 > 1.0f) {
                f2 = 1.0f;
            }
            r28 r28VarE = w2g.E(wxb.a(dm2.M(r28Var, new u02(28)), true, new mr9(8)), 0.0f, 10.0f, 1);
            Float fValueOf = Float.valueOf(f2);
            if (Float.isNaN(f2)) {
                fValueOf = null;
            }
            r28 r28VarM = jfc.m(wxb.a(r28VarE, true, new b4a(fValueOf != null ? fValueOf.floatValue() : 0.0f, new hp1(0.0f, 1.0f))), 240.0f, 4.0f);
            boolean zC = ((((i2 & 7168) ^ 3072) > 2048 && p65Var.e(j2)) || (i2 & 3072) == 2048) | ((((57344 & i2) ^ 24576) > 16384 && p65Var.d(0)) || (i2 & 24576) == 16384) | p65Var.c(f2);
            if ((((i2 & 896) ^ 384) <= 256 || !p65Var.e(j)) && (i2 & 384) != 256) {
                z = false;
            }
            boolean z2 = zC | z;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                final float f3 = f2;
                x45 x45Var = new x45() { // from class: o3a
                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        zl3 zl3Var = (zl3) obj;
                        float fIntBitsToFloat = Float.intBitsToFloat((int) (zl3Var.f() & 4294967295L));
                        a4a.f(zl3Var, 0.0f, 1.0f, j2, fIntBitsToFloat);
                        a4a.f(zl3Var, 0.0f, f3, j, fIntBitsToFloat);
                        return c1e.a;
                    }
                };
                p65Var.j0(x45Var);
                objM = x45Var;
            }
            pxf.a(r28VarM, (x45) objM, p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: p3a
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    a4a.d(f, r28Var, j, j2, (x12) obj, tr7.y(i | 1));
                    return c1e.a;
                }
            };
        }
    }

    public static final void e(zl3 zl3Var, float f, float f2, long j, uuc uucVar) {
        float f3 = uucVar.R / 2.0f;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (zl3Var.f() >> 32)) - (2.0f * f3);
        ho2.j(zl3Var, j, f, f2, (((long) Float.floatToRawIntBits(f3)) << 32) | (((long) Float.floatToRawIntBits(f3)) & 4294967295L), (((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat)) & 4294967295L), 0.0f, uucVar, LeicaMakernoteDirectory.TAG_IMAGE_ID_NUMBER);
    }

    public static final void f(zl3 zl3Var, float f, float f2, long j, float f3) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (zl3Var.f() >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (zl3Var.f() & 4294967295L)) / 2.0f;
        boolean z = zl3Var.getLayoutDirection() == ip6.Ltr;
        float f4 = (z ? f : 1.0f - f2) * fIntBitsToFloat;
        ho2.n(zl3Var, j, (((long) Float.floatToRawIntBits(f4)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) & 4294967295L), (((long) Float.floatToRawIntBits((z ? f2 : 1.0f - f) * fIntBitsToFloat)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) & 4294967295L), f3, 0, 496);
    }
}
