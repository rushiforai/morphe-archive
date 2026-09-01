package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class agc {
    public static final float a = cgc.m;
    public static final float b;
    public static final long c;
    public static final float d;
    public static final float e;
    public static final sse f;

    static {
        float f2 = cgc.k;
        b = f2;
        float f3 = cgc.i;
        c = pwd.i(f2, f3);
        pwd.i(f3, f2);
        d = 6.0f;
        e = 2.0f;
        f = new sse(wfc.a);
    }

    public static final void a(float f2, x45 x45Var, r28 r28Var, boolean z, m45 m45Var, qfc qfcVar, m68 m68Var, mz1 mz1Var, mz1 mz1Var2, hp1 hp1Var, x12 x12Var, int i, int i2) {
        int i3;
        qfc qfcVar2;
        m68 m68Var2;
        mz1 mz1Var3;
        mz1 mz1Var4;
        int i4;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(985901935);
        if ((i & 6) == 0) {
            i3 = (p65Var2.c(f2) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        if ((i & 48) == 0) {
            i3 |= p65Var2.h(x45Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i3 |= p65Var2.g(z) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i3 |= p65Var2.h(m45Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            qfcVar2 = qfcVar;
            i3 |= p65Var2.f(qfcVar2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            qfcVar2 = qfcVar;
        }
        if ((1572864 & i) == 0) {
            m68Var2 = m68Var;
            i3 |= p65Var2.f(m68Var2) ? 1048576 : 524288;
        } else {
            m68Var2 = m68Var;
        }
        int i5 = i3 | 12582912;
        if ((100663296 & i) == 0) {
            mz1Var3 = mz1Var;
            i5 |= p65Var2.h(mz1Var3) ? 67108864 : 33554432;
        } else {
            mz1Var3 = mz1Var;
        }
        if ((805306368 & i) == 0) {
            mz1Var4 = mz1Var2;
            i5 |= p65Var2.h(mz1Var4) ? 536870912 : 268435456;
        } else {
            mz1Var4 = mz1Var2;
        }
        if ((i2 & 6) == 0) {
            i4 = i2 | (p65Var2.f(hp1Var) ? 4 : 2);
        } else {
            i4 = i2;
        }
        if (p65Var2.P(i5 & 1, ((i5 & 306783379) == 306783378 && (i4 & 3) == 2) ? false : true)) {
            p65Var2.U();
            if ((i & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            int i6 = i5;
            boolean z2 = ((29360128 & i5) == 8388608) | ((((i4 & 14) ^ 6) > 4 && p65Var2.f(hp1Var)) || (i4 & 6) == 4);
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                objM = new bgc(f2, m45Var, hp1Var);
                p65Var2.j0(objM);
            }
            bgc bgcVar = (bgc) objM;
            bgcVar.a = m45Var;
            bgcVar.d = x45Var;
            bgcVar.d(f2);
            int i7 = i6 >> 9;
            p65Var = p65Var2;
            b(bgcVar, r28Var, z, null, m68Var2, mz1Var3, mz1Var4, p65Var, ((i6 >> 3) & PhotoshopDirectory.TAG_CAPTION) | ((i6 >> 6) & 57344) | (458752 & i7) | (i7 & 3670016));
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cw6(f2, x45Var, r28Var, z, m45Var, qfcVar2, m68Var, mz1Var, mz1Var2, hp1Var, i, i2);
        }
    }

    public static final void b(bgc bgcVar, r28 r28Var, boolean z, qfc qfcVar, m68 m68Var, mz1 mz1Var, mz1 mz1Var2, x12 x12Var, int i) {
        int i2;
        qfc qfcVar2;
        int i3;
        qfc qfcVarE;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(409861960);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(bgcVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.g(z) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.f(m68Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.h(mz1Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i2 |= p65Var.h(mz1Var2) ? 1048576 : 524288;
        }
        if (p65Var.P(i2 & 1, (599187 & i2) != 599186)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                ufc ufcVar = ufc.a;
                i3 = i2 & (-7169);
                qfcVarE = ufc.e((fv1) p65Var.j(iv1.a));
            } else {
                p65Var.S();
                i3 = i2 & (-7169);
                qfcVarE = qfcVar;
            }
            p65Var.q();
            int i4 = i3 >> 3;
            c(r28Var, bgcVar, z, m68Var, mz1Var, mz1Var2, p65Var, (i3 & 896) | (i4 & 14) | ((i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i4 & 7168) | (57344 & i4) | (i4 & 458752));
            qfcVar2 = qfcVarE;
        } else {
            p65Var.S();
            qfcVar2 = qfcVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gu0(bgcVar, r28Var, z, qfcVar2, m68Var, mz1Var, mz1Var2, i);
        }
    }

    public static final void c(r28 r28Var, bgc bgcVar, boolean z, m68 m68Var, mz1 mz1Var, mz1 mz1Var2, x12 x12Var, int i) {
        int i2;
        mz1 mz1Var3;
        bgc bgcVar2;
        mz1 mz1Var4;
        r28 q4dVar;
        boolean z2;
        Object obj;
        mz1 mz1Var5 = mz1Var2;
        hp1 hp1Var = bgcVar.b;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(898172835);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(bgcVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.g(z) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(m68Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.h(mz1Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.h(mz1Var5) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        int i3 = i2;
        boolean z3 = false;
        if (p65Var.P(i3 & 1, (i3 & 74899) != 74898)) {
            boolean z4 = p65Var.j(z22.n) == ip6.Rtl;
            bgcVar.i = z4;
            g49 g49Var = bgcVar.c;
            hw8 hw8Var = bgcVar.l;
            if (hw8Var == hw8.Horizontal && z4) {
                z3 = true;
            }
            o28 o28Var = o28.b;
            if (z) {
                dp dpVar = new dp(5, bgcVar);
                lb9 lb9Var = r4d.a;
                q4dVar = new q4d(bgcVar, m68Var, dpVar, 4);
            } else {
                q4dVar = o28Var;
            }
            hw8 hw8Var2 = bgcVar.l;
            boolean zBooleanValue = ((Boolean) bgcVar.m.getValue()).booleanValue();
            boolean zH = p65Var.h(bgcVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            Object obj2 = objM;
            if (zH || objM == uobVar) {
                i12 i12Var = new i12(bgcVar, (n92) null, 2);
                p65Var.j0(i12Var);
                obj2 = i12Var;
            }
            c55 c55Var = (c55) obj2;
            r28 r28Var2 = q4dVar;
            r28 r28VarA = pl3.a(o28Var, bgcVar, hw8Var2, z, m68Var, zBooleanValue, c55Var, z3, 32);
            boolean z5 = z3;
            bgcVar2 = bgcVar;
            hw8 hw8Var3 = hw8.Vertical;
            r28 r28VarR = hw8Var == hw8Var3 ? jfc.r(kng.J(o28Var, rfc.THUMB), 3) : jfc.t(kng.J(o28Var, rfc.THUMB), null, 3);
            fr5 fr5Var = g56.a;
            r28 r28VarB = r28Var.b(w08.b);
            float f2 = b;
            float f3 = a;
            r28 r28VarB2 = wgf.I(k50.a0(wxb.a(wxb.a(jfc.j(r28VarB, hw8Var == hw8Var3 ? f3 : f2, hw8Var == hw8Var3 ? f2 : f3, 0.0f, 0.0f, 12), false, new xl0(z, bgcVar2, 4)).b(hw8Var == hw8Var3 ? d5.b : d5.a), true, new b4a(g49Var.g(), new hp1(hp1Var.a, hp1Var.b))), z, m68Var), new yfc(z, bgcVar2.d, hp1Var, z5, g49Var.g(), bgcVar2.a)).b(r28Var2).b(r28VarA);
            boolean zH2 = p65Var.h(bgcVar2);
            Object objM2 = p65Var.M();
            Object obj3 = objM2;
            if (zH2 || objM2 == uobVar) {
                d17 d17Var = new d17(1, bgcVar2);
                p65Var.j0(d17Var);
                obj3 = d17Var;
            }
            zk7 zk7Var = (zk7) obj3;
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarB2);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
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
            tp7.B(p65Var, cuVar4, r28VarR2);
            boolean zH3 = p65Var.h(bgcVar2);
            Object objM3 = p65Var.M();
            if (zH3 || objM3 == uobVar) {
                z2 = false;
                vfc vfcVar = new vfc(bgcVar2, false ? 1 : 0);
                p65Var.j0(vfcVar);
                obj = vfcVar;
            } else {
                z2 = false;
                obj = objM3;
            }
            r28 r28VarE = o7f.E(r28VarR, (x45) obj);
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, z2);
            int iS2 = w2g.s(p65Var);
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarE);
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
            tp7.B(p65Var, cuVar4, r28VarR3);
            int i4 = (i3 >> 3) & 14;
            mz1 mz1Var6 = mz1Var;
            mz1Var6.f(bgcVar2, p65Var, Integer.valueOf(((i3 >> 9) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | i4));
            p65Var.p(true);
            r28 r28VarJ = kng.J(o28Var, rfc.TRACK);
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            int iS3 = w2g.s(p65Var);
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarJ);
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
            tp7.B(p65Var, cuVar4, r28VarR4);
            mz1 mz1Var7 = mz1Var2;
            mz1Var7.f(bgcVar2, p65Var, Integer.valueOf(i4 | ((i3 >> 12) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION)));
            p65Var.p(true);
            p65Var.p(true);
            mz1Var3 = mz1Var6;
            mz1Var4 = mz1Var7;
        } else {
            mz1Var3 = mz1Var;
            bgcVar2 = bgcVar;
            p65Var.S();
            mz1Var4 = mz1Var5;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jp0(r28Var, bgcVar2, z, m68Var, mz1Var3, mz1Var4, i);
        }
    }

    public static final float d(float f2, float[] fArr, float f3, float f4) {
        Float fValueOf;
        if (fArr.length == 0) {
            fValueOf = null;
        } else {
            float f5 = fArr[0];
            int i = 1;
            int length = fArr.length - 1;
            if (length == 0) {
                fValueOf = Float.valueOf(f5);
            } else {
                float fAbs = Math.abs(mk7.E(f3, f4, f5) - f2);
                if (1 <= length) {
                    while (true) {
                        float f6 = fArr[i];
                        float fAbs2 = Math.abs(mk7.E(f3, f4, f6) - f2);
                        if (Float.compare(fAbs, fAbs2) > 0) {
                            f5 = f6;
                            fAbs = fAbs2;
                        }
                        if (i == length) {
                            break;
                        }
                        i++;
                    }
                }
                fValueOf = Float.valueOf(f5);
            }
        }
        return fValueOf != null ? mk7.E(f3, f4, fValueOf.floatValue()) : f2;
    }
}
