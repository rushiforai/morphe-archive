package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ufc {
    public static final ufc a = new ufc();
    public static final float b;
    public static final float c;
    public static final br d;

    static {
        float f = cgc.n;
        b = f;
        c = f;
        d = er.a();
    }

    public static void d(zl3 zl3Var, hw8 hw8Var, long j, long j2, long j3, float f, float f2) {
        wlb wlbVar;
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(f)) << 32) | (((long) Float.floatToRawIntBits(f)) & 4294967295L);
        long jFloatToRawIntBits2 = (((long) Float.floatToRawIntBits(f2)) << 32) | (((long) Float.floatToRawIntBits(f2)) & 4294967295L);
        if (hw8Var == hw8.Vertical) {
            float fIntBitsToFloat = Float.intBitsToFloat((int) (j2 >> 32));
            zwa zwaVarL = lk7.l(j, (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (j2 & 4294967295L)))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32));
            wlbVar = new wlb(zwaVarL.a, zwaVarL.b, zwaVarL.c, zwaVarL.d, jFloatToRawIntBits, jFloatToRawIntBits, jFloatToRawIntBits2, jFloatToRawIntBits2);
        } else {
            float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j2 >> 32));
            zwa zwaVarL2 = lk7.l(j, (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (j2 & 4294967295L)))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat2) << 32));
            wlbVar = new wlb(zwaVarL2.a, zwaVarL2.b, zwaVarL2.c, zwaVarL2.d, jFloatToRawIntBits, jFloatToRawIntBits2, jFloatToRawIntBits2, jFloatToRawIntBits);
        }
        br brVar = d;
        b09.n(brVar, wlbVar);
        ho2.p(zl3Var, brVar, j3, 0.0f, null, 60);
        brVar.a.rewind();
    }

    public static qfc e(fv1 fv1Var) {
        qfc qfcVar = fv1Var.i0;
        if (qfcVar != null) {
            return qfcVar;
        }
        long jC = iv1.c(fv1Var, cgc.h);
        gv1 gv1Var = cgc.a;
        long jC2 = iv1.c(fv1Var, gv1Var);
        gv1 gv1Var2 = cgc.l;
        long jC3 = iv1.c(fv1Var, gv1Var2);
        long jC4 = iv1.c(fv1Var, gv1Var2);
        long jC5 = iv1.c(fv1Var, gv1Var);
        long jM = op8.M(uu1.b(cgc.e, iv1.c(fv1Var, cgc.d)), fv1Var.p);
        gv1 gv1Var3 = cgc.b;
        long jC6 = iv1.c(fv1Var, gv1Var3);
        float f = cgc.c;
        long jB = uu1.b(f, jC6);
        gv1 gv1Var4 = cgc.f;
        long jC7 = iv1.c(fv1Var, gv1Var4);
        float f2 = cgc.g;
        qfc qfcVar2 = new qfc(jC, jC2, jC3, jC4, jC5, jM, jB, uu1.b(f2, jC7), uu1.b(f2, iv1.c(fv1Var, gv1Var4)), uu1.b(f, iv1.c(fv1Var, gv1Var3)));
        fv1Var.i0 = qfcVar2;
        return qfcVar2;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0049  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0137  */
    /* JADX WARN: Removed duplicated region for block: B:82:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(defpackage.m68 r19, defpackage.r28 r20, defpackage.qfc r21, boolean r22, long r23, defpackage.x12 r25, int r26, int r27) {
        /*
            Method dump skipped, instruction units count: 323
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ufc.a(m68, r28, qfc, boolean, long, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:109:0x017f  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x018e  */
    /* JADX WARN: Removed duplicated region for block: B:114:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0043  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00cd  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b(defpackage.bgc r19, defpackage.r28 r20, boolean r21, defpackage.qfc r22, defpackage.b55 r23, defpackage.c55 r24, float r25, float r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 419
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ufc.b(bgc, r28, boolean, qfc, b55, c55, float, float, x12, int, int):void");
    }

    public final void c(final bgc bgcVar, r28 r28Var, boolean z, qfc qfcVar, final b55 b55Var, final c55 c55Var, float f, final float f2, x12 x12Var, int i, int i2) {
        int i3;
        float f3;
        int i4;
        p65 p65Var;
        long j;
        long j2;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(133396521);
        if ((i & 6) == 0) {
            i3 = (p65Var2.h(bgcVar) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        if ((i & 48) == 0) {
            i3 |= p65Var2.c(Float.NaN) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i3 |= p65Var2.g(z) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i3 |= p65Var2.f(qfcVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i3 |= p65Var2.h(b55Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i3 |= p65Var2.h(c55Var) ? 1048576 : 524288;
        }
        if ((12582912 & i) == 0) {
            f3 = f;
            i3 |= p65Var2.c(f3) ? 8388608 : 4194304;
        } else {
            f3 = f;
        }
        if ((i & 100663296) == 0) {
            i3 |= p65Var2.c(f2) ? 67108864 : 33554432;
        }
        if ((i & 805306368) == 0) {
            i3 |= p65Var2.g(false) ? 536870912 : 268435456;
        }
        if ((i2 & 6) == 0) {
            i4 = i2 | (p65Var2.g(false) ? 4 : 2);
        } else {
            i4 = i2;
        }
        if (p65Var2.P(i3 & 1, ((i3 & 306783379) == 306783378 && (i4 & 3) == 2) ? false : true)) {
            final long jA = qfcVar.a(z, false);
            long jA2 = qfcVar.a(z, true);
            if (z) {
                j = jA2;
                j2 = qfcVar.e;
            } else {
                j = jA2;
                j2 = qfcVar.j;
            }
            long j3 = z ? qfcVar.c : qfcVar.h;
            r28 r28VarC = bgcVar.l == hw8.Vertical ? jfc.c(jfc.p(r28Var, agc.a), 1.0f) : jfc.e(jfc.d(r28Var, 1.0f), agc.a);
            int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i6 = i3;
            boolean zH = (i5 == 32) | p65Var2.h(bgcVar);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (zH || objM == uobVar) {
                objM = new nra(5, bgcVar);
                p65Var2.j0(objM);
            }
            r28 r28VarB = r28VarC.b(dm2.M(o28.b, (c55) objM));
            boolean zH2 = ((i6 & 29360128) == 8388608) | (i5 == 32) | p65Var2.h(bgcVar) | p65Var2.e(jA) | p65Var2.e(j) | p65Var2.e(j2) | p65Var2.e(j3) | ((i6 & 234881024) == 67108864) | ((i6 & 458752) == 131072) | ((i6 & 3670016) == 1048576) | ((i6 & 1879048192) == 536870912) | ((i4 & 14) == 4);
            Object objM2 = p65Var2.M();
            if (zH2 || objM2 == uobVar) {
                final long j4 = j3;
                p65Var = p65Var2;
                final long j5 = j2;
                r28Var2 = r28VarB;
                final float f4 = f3;
                final long j6 = j;
                x45 x45Var = new x45() { // from class: sfc
                    /* JADX WARN: Removed duplicated region for block: B:100:0x0253  */
                    /* JADX WARN: Removed duplicated region for block: B:135:0x032a  */
                    @Override // defpackage.x45
                    /*
                        Code decompiled incorrectly, please refer to instructions dump.
                        To view partially-correct add '--show-bad-code' argument
                    */
                    public final java.lang.Object invoke(java.lang.Object r30) {
                        /*
                            Method dump skipped, instruction units count: 959
                            To view this dump add '--comments-level debug' option
                        */
                        throw new UnsupportedOperationException("Method not decompiled: defpackage.sfc.invoke(java.lang.Object):java.lang.Object");
                    }
                };
                p65Var.j0(x45Var);
                objM2 = x45Var;
            } else {
                p65Var = p65Var2;
                r28Var2 = r28VarB;
            }
            pxf.a(r28Var2, (x45) objM2, p65Var, 0);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new tfc(this, bgcVar, r28Var, z, qfcVar, b55Var, c55Var, f, f2, i, i2, 0);
        }
    }
}
