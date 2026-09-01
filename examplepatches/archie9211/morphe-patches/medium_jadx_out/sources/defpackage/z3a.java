package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.LeicaMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class z3a {
    public static final pj2 a = k48.a;
    public static final pj2 b = k48.c;

    /* JADX WARN: Removed duplicated region for block: B:104:0x01d5  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x01f0  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x01fd  */
    /* JADX WARN: Removed duplicated region for block: B:112:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01c1 A[PHI: r11
      0x01c1: PHI (r11v15 long) = (r11v12 long), (r11v16 long) binds: [B:95:0x01bf, B:91:0x01b8] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(final defpackage.r28 r23, final long r24, final float r26, long r27, int r29, float r30, defpackage.x12 r31, final int r32, final int r33) {
        /*
            Method dump skipped, instruction units count: 525
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z3a.a(r28, long, float, long, int, float, x12, int, int):void");
    }

    public static final void b(final m45 m45Var, final r28 r28Var, final long j, final float f, final long j2, final int i, final float f2, x12 x12Var, final int i2) {
        int i3;
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1798883595);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(m45Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.e(j) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.c(f) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.e(j2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i4 = i;
            i3 |= p65Var.d(i4) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            i4 = i;
        }
        if ((i2 & 1572864) == 0) {
            i3 |= p65Var.c(f2) ? 1048576 : 524288;
        }
        if (p65Var.P(i3 & 1, (i3 & 599187) != 599186)) {
            p65Var.U();
            if ((i2 & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new z23(11, m45Var);
                p65Var.j0(objM);
            }
            final m45 m45Var2 = (m45) objM;
            final uuc uucVar = new uuc(((m73) p65Var.j(z22.h)).Z(f), 0.0f, i4, 0, 26);
            boolean zF = p65Var.f(m45Var2);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new r00(5, m45Var2);
                p65Var.j0(objM2);
            }
            r28 r28VarL = jfc.l(wxb.a(r28Var, true, (x45) objM2), 40.0f);
            boolean zF2 = ((i3 & 458752) == 131072) | p65Var.f(m45Var2) | ((3670016 & i3) == 1048576) | ((i3 & 7168) == 2048) | ((((57344 & i3) ^ 24576) > 16384 && p65Var.e(j2)) || (i3 & 24576) == 16384) | p65Var.h(uucVar) | ((((i3 & 896) ^ 384) > 256 && p65Var.e(j)) || (i3 & 384) == 256);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                x45 x45Var = new x45() { // from class: q3a
                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        zl3 zl3Var = (zl3) obj;
                        float fFloatValue = ((Number) m45Var2.invoke()).floatValue() * 360.0f;
                        int i5 = i;
                        float f3 = f2;
                        if (i5 != 0 && Float.intBitsToFloat((int) (zl3Var.f() & 4294967295L)) <= Float.intBitsToFloat((int) (zl3Var.f() >> 32))) {
                            f3 += f;
                        }
                        float fQ = (f3 / ((float) (((double) zl3Var.Q(Float.intBitsToFloat((int) (zl3Var.f() >> 32)))) * 3.141592653589793d))) * 360.0f;
                        float fMin = Math.min(fFloatValue, fQ) + 270.0f + fFloatValue;
                        float fMin2 = (360.0f - fFloatValue) - (Math.min(fFloatValue, fQ) * 2.0f);
                        long j3 = j2;
                        uuc uucVar2 = uucVar;
                        z3a.e(zl3Var, fMin, fMin2, j3, uucVar2);
                        z3a.e(zl3Var, 270.0f, fFloatValue, j, uucVar2);
                        return c1e.a;
                    }
                };
                p65Var.j0(x45Var);
                objM3 = x45Var;
            }
            pxf.a(r28VarL, (x45) objM3, p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: s3a
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    z3a.b(m45Var, r28Var, j, f, j2, i, f2, (x12) obj, tr7.y(i2 | 1));
                    return c1e.a;
                }
            };
        }
    }

    public static final void c(m45 m45Var, r28 r28Var, final long j, final long j2, int i, float f, final x45 x45Var, x12 x12Var, int i2) {
        int i3;
        int i4;
        float f2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-339970038);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(m45Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.e(j) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.e(j2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i4 = i;
            i3 |= p65Var.d(i4) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            i4 = i;
        }
        if ((196608 & i2) == 0) {
            f2 = f;
            i3 |= p65Var.c(f2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            f2 = f;
        }
        if ((i2 & 1572864) == 0) {
            i3 |= p65Var.h(x45Var) ? 1048576 : 524288;
        }
        if (p65Var.P(i3 & 1, (i3 & 599187) != 599186)) {
            p65Var.U();
            if ((i2 & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new z23(12, m45Var);
                p65Var.j0(objM);
            }
            final m45 m45Var2 = (m45) objM;
            r28 r28VarB = r28Var.b(d5.b);
            boolean zF = p65Var.f(m45Var2);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new r00(6, m45Var2);
                p65Var.j0(objM2);
            }
            r28 r28VarM = jfc.m(wxb.a(r28VarB, true, (x45) objM2), 240.0f, 4.0f);
            boolean zF2 = ((458752 & i3) == 131072) | ((57344 & i3) == 16384) | p65Var.f(m45Var2) | ((((i3 & 7168) ^ 3072) > 2048 && p65Var.e(j2)) || (i3 & 3072) == 2048) | ((((i3 & 896) ^ 384) > 256 && p65Var.e(j)) || (i3 & 384) == 256) | ((((3670016 & i3) ^ 1572864) > 1048576 && p65Var.f(x45Var)) || (i3 & 1572864) == 1048576);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                final int i5 = i4;
                final float f3 = f2;
                objM3 = new x45() { // from class: x3a
                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        zl3 zl3Var = (zl3) obj;
                        float fIntBitsToFloat = Float.intBitsToFloat((int) (zl3Var.f() & 4294967295L));
                        int i6 = i5;
                        float fQ = f3;
                        if (i6 != 0 && Float.intBitsToFloat((int) (4294967295L & zl3Var.f())) <= Float.intBitsToFloat((int) (zl3Var.f() >> 32))) {
                            fQ += zl3Var.Q(fIntBitsToFloat);
                        }
                        float fQ2 = fQ / zl3Var.Q(Float.intBitsToFloat((int) (zl3Var.f() >> 32)));
                        float fFloatValue = ((Number) m45Var2.invoke()).floatValue();
                        float fMin = Math.min(fFloatValue, fQ2) + fFloatValue;
                        if (fMin <= 1.0f) {
                            z3a.f(zl3Var, fMin, 1.0f, j2, fIntBitsToFloat, i6);
                        }
                        z3a.f(zl3Var, 0.0f, fFloatValue, j, fIntBitsToFloat, i6);
                        x45Var.invoke(zl3Var);
                        return c1e.a;
                    }
                };
                p65Var.j0(objM3);
            }
            pxf.a(r28VarM, (x45) objM3, p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y3a(m45Var, r28Var, j, j2, i, f, x45Var, i2);
        }
    }

    public static final void d(final float f, final int i, int i2, final long j, final long j2, x12 x12Var, r28 r28Var) {
        int i3;
        Float fValueOf = Float.valueOf(1.0f);
        Float fValueOf2 = Float.valueOf(0.0f);
        p65 p65Var = (p65) x12Var;
        p65Var.a0(567589233);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.e(j) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.e(j2) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.d(i) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.c(f) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.U();
            if ((i2 & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            n16 n16VarT = rx0.T(p65Var);
            zk6 zk6Var = new zk6();
            zk6Var.a = 1750;
            yk6 yk6VarA = zk6Var.a(fValueOf2, 0);
            pj2 pj2Var = a;
            yk6VarA.b = pj2Var;
            zk6Var.a(fValueOf, PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE);
            final l16 l16VarH = rx0.H(n16VarT, 0.0f, 1.0f, f76.G(new al6(zk6Var), null, 0L, 6), p65Var);
            zk6 zk6Var2 = new zk6();
            zk6Var2.a = 1750;
            zk6Var2.a(fValueOf2, 250).b = pj2Var;
            zk6Var2.a(fValueOf, 1250);
            final l16 l16VarH2 = rx0.H(n16VarT, 0.0f, 1.0f, f76.G(new al6(zk6Var2), null, 0L, 6), p65Var);
            zk6 zk6Var3 = new zk6();
            zk6Var3.a = 1750;
            zk6Var3.a(fValueOf2, 650).b = pj2Var;
            zk6Var3.a(fValueOf, 1500);
            final l16 l16VarH3 = rx0.H(n16VarT, 0.0f, 1.0f, f76.G(new al6(zk6Var3), null, 0L, 6), p65Var);
            zk6 zk6Var4 = new zk6();
            zk6Var4.a = 1750;
            zk6Var4.a(fValueOf2, 900).b = pj2Var;
            zk6Var4.a(fValueOf, 1750);
            final l16 l16VarH4 = rx0.H(n16VarT, 0.0f, 1.0f, f76.G(new al6(zk6Var4), null, 0L, 6), p65Var);
            boolean z = true;
            r28 r28VarM = jfc.m(wxb.a(r28Var.b(d5.b), true, new mr9(14)), 240.0f, 4.0f);
            boolean zF = ((i3 & 7168) == 2048) | ((57344 & i3) == 16384) | p65Var.f(l16VarH) | ((((i3 & 896) ^ 384) > 256 && p65Var.e(j2)) || (i3 & 384) == 256) | p65Var.f(l16VarH2);
            if ((((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) <= 32 || !p65Var.e(j)) && (i3 & 48) != 32) {
                z = false;
            }
            boolean zF2 = zF | z | p65Var.f(l16VarH3) | p65Var.f(l16VarH4);
            Object objM = p65Var.M();
            if (zF2 || objM == w12.a) {
                x45 x45Var = new x45() { // from class: l3a
                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        long j3;
                        zl3 zl3Var = (zl3) obj;
                        float fIntBitsToFloat = Float.intBitsToFloat((int) (zl3Var.f() & 4294967295L));
                        int i4 = i;
                        float fQ = f;
                        if (i4 != 0 && Float.intBitsToFloat((int) (4294967295L & zl3Var.f())) <= Float.intBitsToFloat((int) (zl3Var.f() >> 32))) {
                            fQ += zl3Var.Q(fIntBitsToFloat);
                        }
                        float fQ2 = fQ / zl3Var.Q(Float.intBitsToFloat((int) (zl3Var.f() >> 32)));
                        upc upcVar = l16VarH;
                        float fFloatValue = ((Number) upcVar.getValue()).floatValue();
                        float f2 = 1.0f - fQ2;
                        long j4 = j2;
                        if (fFloatValue < f2) {
                            z3a.f(zl3Var, ((Number) upcVar.getValue()).floatValue() > 0.0f ? ((Number) upcVar.getValue()).floatValue() + fQ2 : 0.0f, 1.0f, j4, fIntBitsToFloat, i4);
                        }
                        long j5 = j4;
                        float fFloatValue2 = ((Number) upcVar.getValue()).floatValue();
                        upc upcVar2 = l16VarH2;
                        float fFloatValue3 = fFloatValue2 - ((Number) upcVar2.getValue()).floatValue();
                        long j6 = j;
                        if (fFloatValue3 > 0.0f) {
                            z3a.f(zl3Var, ((Number) upcVar.getValue()).floatValue(), ((Number) upcVar2.getValue()).floatValue(), j6, fIntBitsToFloat, i4);
                            j3 = j6;
                        } else {
                            j3 = j6;
                        }
                        float fFloatValue4 = ((Number) upcVar2.getValue()).floatValue();
                        upc upcVar3 = l16VarH3;
                        if (fFloatValue4 > fQ2) {
                            z3a.f(zl3Var, ((Number) upcVar3.getValue()).floatValue() > 0.0f ? ((Number) upcVar3.getValue()).floatValue() + fQ2 : 0.0f, ((Number) upcVar2.getValue()).floatValue() < 1.0f ? ((Number) upcVar2.getValue()).floatValue() - fQ2 : 1.0f, j5, fIntBitsToFloat, i4);
                            j5 = j5;
                        }
                        float fFloatValue5 = ((Number) upcVar3.getValue()).floatValue();
                        upc upcVar4 = l16VarH4;
                        if (fFloatValue5 - ((Number) upcVar4.getValue()).floatValue() > 0.0f) {
                            z3a.f(zl3Var, ((Number) upcVar3.getValue()).floatValue(), ((Number) upcVar4.getValue()).floatValue(), j3, fIntBitsToFloat, i4);
                            zl3Var = zl3Var;
                            fIntBitsToFloat = fIntBitsToFloat;
                        }
                        if (((Number) upcVar4.getValue()).floatValue() > fQ2) {
                            z3a.f(zl3Var, 0.0f, ((Number) upcVar4.getValue()).floatValue() < 1.0f ? ((Number) upcVar4.getValue()).floatValue() - fQ2 : 1.0f, j5, fIntBitsToFloat, i4);
                        }
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
            mwaVarS.d = new n3a(r28Var, j, j2, i, f, i2);
        }
    }

    public static final void e(zl3 zl3Var, float f, float f2, long j, uuc uucVar) {
        float f3 = uucVar.R / 2.0f;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (zl3Var.f() >> 32)) - (2.0f * f3);
        ho2.j(zl3Var, j, f, f2, (((long) Float.floatToRawIntBits(f3)) << 32) | (((long) Float.floatToRawIntBits(f3)) & 4294967295L), (((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat)) & 4294967295L), 0.0f, uucVar, LeicaMakernoteDirectory.TAG_IMAGE_ID_NUMBER);
    }

    public static final void f(zl3 zl3Var, float f, float f2, long j, float f3, int i) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (zl3Var.f() >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (zl3Var.f() & 4294967295L));
        float f4 = fIntBitsToFloat2 / 2.0f;
        boolean z = zl3Var.getLayoutDirection() == ip6.Ltr;
        float f5 = (z ? f : 1.0f - f2) * fIntBitsToFloat;
        float f6 = (z ? f2 : 1.0f - f) * fIntBitsToFloat;
        if (i == 0 || fIntBitsToFloat2 > fIntBitsToFloat) {
            ho2.n(zl3Var, j, (((long) Float.floatToRawIntBits(f5)) << 32) | (((long) Float.floatToRawIntBits(f4)) & 4294967295L), (((long) Float.floatToRawIntBits(f6)) << 32) | (((long) Float.floatToRawIntBits(f4)) & 4294967295L), f3, 0, 496);
            return;
        }
        float f7 = f3 / 2.0f;
        float f8 = fIntBitsToFloat - f7;
        if (f5 < f7) {
            f5 = f7;
        }
        if (f5 > f8) {
            f5 = f8;
        }
        if (f6 < f7) {
            f6 = f7;
        }
        if (f6 <= f8) {
            f8 = f6;
        }
        if (Math.abs(f2 - f) > 0.0f) {
            ho2.n(zl3Var, j, (((long) Float.floatToRawIntBits(f5)) << 32) | (((long) Float.floatToRawIntBits(f4)) & 4294967295L), (((long) Float.floatToRawIntBits(f8)) << 32) | (((long) Float.floatToRawIntBits(f4)) & 4294967295L), f3, i, 480);
        }
    }
}
