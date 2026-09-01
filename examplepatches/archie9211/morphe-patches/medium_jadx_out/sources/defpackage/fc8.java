package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.data.catalog.KnyB.uvlZTF;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class fc8 {
    public static final float a = hc8.g;
    public static final float b = 8.0f;
    public static final float c = 4.0f;
    public static final float d = 16.0f;
    public static final float e = 4.0f;
    public static final float f = 12.0f;
    public static final float g = 44.0f;
    public static final sn3 h = new sn3(0, new oo7(18));

    public static final void a(r28 r28Var, long j, long j2, y3f y3fVar, mz1 mz1Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1054099326);
        int i2 = i | (p65Var.e(j) ? 32 : 16) | (p65Var.e(j2) ? 256 : 128) | 3072 | (p65Var.f(y3fVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i2 & 1, (74899 & i2) != 74898)) {
            p65Var.U();
            if ((i & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            ((j03) p65Var.j(h)).a(new gc8(r28Var, j, j2, y3fVar, mz1Var), p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new yb8(r28Var, j, j2, y3fVar, mz1Var, i);
        }
    }

    public static final void b(final pmb pmbVar, final boolean z, final m45 m45Var, final mz1 mz1Var, final r28 r28Var, boolean z2, final b55 b55Var, boolean z3, xb8 xb8Var, x12 x12Var, final int i) {
        int i2;
        p65 p65Var;
        final xb8 xb8Var2;
        final boolean z4;
        final boolean z5;
        boolean z6;
        int i3;
        mz1 mz1VarE;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(974293026);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(pmbVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.g(z) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(m45Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.h(mz1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        int i4 = i2 | 196608;
        if ((1572864 & i) == 0) {
            i4 |= p65Var2.h(b55Var) ? 1048576 : 524288;
        }
        int i5 = i4 | 12582912;
        if ((100663296 & i) == 0) {
            i5 |= p65Var2.f(xb8Var) ? 67108864 : 33554432;
        }
        int i6 = i5 | 805306368;
        boolean z7 = true;
        if (p65Var2.P(i6 & 1, (306783379 & i6) != 306783378)) {
            p65Var2.U();
            if ((i & 1) == 0 || p65Var2.z()) {
                z6 = true;
            } else {
                p65Var2.S();
                z6 = z2;
                z7 = z3;
            }
            p65Var2.q();
            p65Var2.Y(-224963495);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = ka1.k(p65Var2);
            }
            m68 m68Var = (m68) objM;
            p65Var2.p(false);
            i48 i48Var = i48.DefaultEffects;
            wlc wlcVarN = ek7.N(i48Var, p65Var2);
            boolean z8 = z7;
            mz1 mz1VarE2 = pxf.E(-876637252, new cc8(xb8Var, z, z6, wlcVarN, b55Var, z7, mz1Var), p65Var2);
            if (b55Var == null) {
                p65Var2.Y(-224036658);
                p65Var2.p(false);
                mz1VarE = null;
                i3 = i6;
                xb8Var2 = xb8Var;
            } else {
                p65Var2.Y(-224036657);
                i3 = i6;
                xb8Var2 = xb8Var;
                mz1VarE = pxf.E(802208206, new dc8(xb8Var, z, z6, wlcVarN, b55Var), p65Var2);
                p65Var2.p(false);
            }
            mz1 mz1Var2 = mz1VarE;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = new h49(0);
                p65Var2.j0(objM2);
            }
            h49 h49Var = (h49) objM2;
            boolean z9 = z6;
            r28 r28VarA = pmbVar.a(1.0f, jfc.b(hlg.P(r28Var, z, m68Var, null, z9, new vkb(4), m45Var), 0.0f, a, 1), true);
            Object objM3 = p65Var2.M();
            if (objM3 == uobVar) {
                objM3 = new d02(h49Var, 3);
                p65Var2.j0(objM3);
            }
            r28 r28VarE = o7f.E(r28VarA, (x45) objM3);
            zk7 zk7VarC = dy0.c(z46.h, true);
            int iS = w2g.s(p65Var2);
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarE);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, zk7VarC);
            tp7.B(p65Var2, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var2.S || !g76.L(p65Var2.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var2, iS, cuVar);
            }
            tp7.B(p65Var2, q12.d, r28VarR);
            p65Var = p65Var2;
            upc upcVarB = zu.b(z ? 1.0f : 0.0f, ek7.N(i48Var, p65Var2), null, p65Var, 0, 28);
            upc upcVarB2 = zu.b(z ? 1.0f : 0.0f, ek7.N(i48.FastSpatial, p65Var), null, p65Var, 0, 28);
            long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(((m73) p65Var.j(z22.h)).Z(f))) & 4294967295L) | (((long) Float.floatToRawIntBits((h49Var.g() - r3.i0(56.0f)) / 2.0f)) << 32);
            boolean zF = p65Var.f(m68Var) | p65Var.e(jFloatToRawIntBits);
            Object objM4 = p65Var.M();
            if (zF || objM4 == uobVar) {
                objM4 = new ai7(m68Var, jFloatToRawIntBits);
                p65Var.j0(objM4);
            }
            mz1 mz1VarE3 = pxf.E(-2082182507, new fx2(5, (ai7) objM4), p65Var);
            mz1 mz1VarE4 = pxf.E(-799524251, new kd(upcVarB, 9, xb8Var2), p65Var);
            boolean zF2 = p65Var.f(upcVarB);
            Object objM5 = p65Var.M();
            if (zF2 || objM5 == uobVar) {
                objM5 = new rr1(upcVarB, 7);
                p65Var.j0(objM5);
            }
            m45 m45Var2 = (m45) objM5;
            boolean zF3 = p65Var.f(upcVarB2);
            Object objM6 = p65Var.M();
            if (zF3 || objM6 == uobVar) {
                objM6 = new rr1(upcVarB2, 8);
                p65Var.j0(objM6);
            }
            c(mz1VarE3, mz1VarE4, mz1VarE2, mz1Var2, z8, m45Var2, (m45) objM6, p65Var, (57344 & (i3 >> 9)) | 438);
            p65Var.p(true);
            z4 = z9;
            z5 = z8;
        } else {
            p65Var = p65Var2;
            xb8Var2 = xb8Var;
            p65Var.S();
            z4 = z2;
            z5 = z3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: zb8
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    fc8.b(pmbVar, z, m45Var, mz1Var, r28Var, z4, b55Var, z5, xb8Var2, (x12) obj, tr7.y(i | 1));
                    return c1e.a;
                }
            };
        }
    }

    public static final void c(mz1 mz1Var, mz1 mz1Var2, mz1 mz1Var3, b55 b55Var, boolean z, m45 m45Var, m45 m45Var2, x12 x12Var, int i) {
        int i2;
        boolean z2;
        b55 b55Var2;
        b55 b55Var3;
        boolean z3;
        b55 b55Var4 = b55Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1019541078);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(mz1Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(mz1Var2) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(mz1Var3) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.h(b55Var4) ? 2048 : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.g(z) ? 16384 : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.h(m45Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i2 |= p65Var.h(m45Var2) ? 1048576 : 524288;
        }
        if (p65Var.P(i2 & 1, (599187 & i2) != 599186)) {
            e02 e02Var = new e02(5);
            o28 o28Var = o28.b;
            r28 r28VarM = dm2.M(o28Var, e02Var);
            int i3 = 57344 & i2;
            boolean z4 = ((i2 & 7168) == 2048) | ((i2 & 3670016) == 1048576) | (i3 == 16384);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z4 || objM == uobVar) {
                objM = new ec8(m45Var2, b55Var4, z);
                p65Var.j0(objM);
            }
            zk7 zk7Var = (zk7) objM;
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarM);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            int i4 = i2;
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7Var);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            cu cuVar3 = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar3);
            }
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            mz1Var.invoke(p65Var, Integer.valueOf(i4 & 14));
            mz1Var2.invoke(p65Var, Integer.valueOf((i4 >> 3) & 14));
            r28 r28VarJ = kng.J(o28Var, "icon");
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            int iS2 = w2g.s(p65Var);
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS2))) {
                lv8.w(iS2, p65Var, iS2, cuVar3);
            }
            tp7.B(p65Var, cuVar4, r28VarR2);
            km4.H((i4 >> 6) & 14, mz1Var3, p65Var, true);
            if (b55Var != null) {
                p65Var.Y(-660471321);
                r28 r28VarJ2 = kng.J(o28Var, uvlZTF.QOebqzQ);
                boolean z5 = (i3 == 16384) | ((i4 & 458752) == 131072);
                Object objM2 = p65Var.M();
                if (z5 || objM2 == uobVar) {
                    z2 = z;
                    objM2 = new xl0(z2, m45Var, 2);
                    p65Var.j0(objM2);
                } else {
                    z2 = z;
                }
                r28 r28VarW = xz5.W(r28VarJ2, (x45) objM2);
                zk7 zk7VarC2 = dy0.c(ar0Var, false);
                int iS3 = w2g.s(p65Var);
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarW);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS3))) {
                    lv8.w(iS3, p65Var, iS3, cuVar3);
                }
                tp7.B(p65Var, cuVar4, r28VarR3);
                b55 b55Var5 = b55Var;
                b55Var5.invoke(p65Var, Integer.valueOf((i4 >> 9) & 14));
                z3 = true;
                p65Var.p(true);
                p65Var.p(false);
                b55Var3 = b55Var5;
            } else {
                b55Var3 = b55Var;
                z2 = z;
                z3 = true;
                p65Var.Y(-660200319);
                p65Var.p(false);
            }
            p65Var.p(z3);
            b55Var2 = b55Var3;
        } else {
            z2 = z;
            p65Var.S();
            b55Var2 = b55Var4;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gu0(mz1Var, mz1Var2, mz1Var3, b55Var2, z2, m45Var, m45Var2, i);
        }
    }
}
