package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class o5d {
    public static final float a;
    public static final float b;
    public static final float c;
    public static final float d;
    public static final float e;
    public static final nic f;

    static {
        float f2 = q5d.o;
        a = f2;
        b = q5d.x;
        c = q5d.u;
        float f3 = q5d.r;
        d = f3;
        e = (f3 - f2) / 2.0f;
        f = new nic();
    }

    public static final void a(boolean z, x45 x45Var, r28 r28Var, boolean z2, m5d m5dVar, m68 m68Var, x12 x12Var, int i) {
        int i2;
        m68 m68Var2;
        r28 r28VarE0;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-263339167);
        if ((i & 6) == 0) {
            i2 = (p65Var.g(z) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(x45Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(r28Var) ? 256 : 128;
        }
        int i3 = i2 | 3072;
        if ((i & 24576) == 0) {
            i3 |= p65Var.g(z2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i3 |= p65Var.f(m5dVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i3 |= p65Var.f(m68Var) ? 1048576 : 524288;
        }
        int i4 = i3;
        if (p65Var.P(i4 & 1, (599187 & i4) != 599186)) {
            p65Var.U();
            if ((i & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            if (m68Var == null) {
                p65Var.Y(1768604058);
                Object objM = p65Var.M();
                if (objM == w12.a) {
                    objM = ka1.k(p65Var);
                }
                p65Var.p(false);
                m68Var2 = (m68) objM;
            } else {
                p65Var.Y(334145757);
                p65Var.p(false);
                m68Var2 = m68Var;
            }
            if (x45Var != null) {
                fr5 fr5Var = g56.a;
                r28VarE0 = dm2.e0(w08.b, z, m68Var2, z2, new vkb(2), x45Var);
            } else {
                r28VarE0 = o28.b;
            }
            int i5 = i4 << 3;
            int i6 = i4 >> 6;
            b(jfc.i(jfc.s(r28Var.b(r28VarE0), z46.h, 2), c, d), z, z2, m5dVar, m68Var2, z4c.a(q5d.m, p65Var), p65Var, (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i6 & 896) | (i6 & 7168) | (i5 & 57344));
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b88(z, x45Var, r28Var, z2, m5dVar, m68Var, i, 1);
        }
    }

    public static final void b(r28 r28Var, boolean z, boolean z2, m5d m5dVar, d56 d56Var, m3c m3cVar, x12 x12Var, int i) {
        int i2;
        long j;
        long j2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-670917213);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.g(z) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.g(z2) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(m5dVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.h(null) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.f(d56Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i2 |= p65Var.f(m3cVar) ? 1048576 : 524288;
        }
        if (p65Var.P(i2 & 1, (599187 & i2) != 599186)) {
            long j3 = z2 ? z ? m5dVar.b : m5dVar.f : z ? m5dVar.j : m5dVar.n;
            long j4 = z2 ? z ? m5dVar.a : m5dVar.e : z ? m5dVar.i : m5dVar.m;
            m3c m3cVarA = z4c.a(q5d.t, p65Var);
            float f2 = q5d.s;
            if (z2) {
                j = j4;
                j2 = z ? m5dVar.c : m5dVar.g;
            } else {
                j = j4;
                j2 = z ? m5dVar.k : m5dVar.o;
            }
            r28 r28VarA0 = flb.a0(bo.B(r28Var, f2, j2, m3cVarA), j3, m3cVarA);
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA0);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            cu cuVar3 = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar3);
            }
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarA02 = flb.a0(s06.a(iy0.a.a(o28.b, z46.g).b(new rld(d56Var, z, ek7.N(i48.FastSpatial, p65Var))), d56Var, qkb.a(q5d.q / 2.0f, 4, 0L, false)), j, m3cVar);
            zk7 zk7VarC2 = dy0.c(z46.h, false);
            int iS2 = w2g.s(p65Var);
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarA02);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS2))) {
                lv8.w(iS2, p65Var, iS2, cuVar3);
            }
            tp7.B(p65Var, cuVar4, r28VarR2);
            p65Var.Y(1236071411);
            p65Var.p(false);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b88(r28Var, z, z2, m5dVar, d56Var, m3cVar, i);
        }
    }
}
