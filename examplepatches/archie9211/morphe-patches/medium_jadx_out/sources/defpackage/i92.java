package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class i92 {
    public static final f92 a;

    static {
        sn3 sn3Var = tr.a;
        long j = uu1.d;
        long j2 = uu1.b;
        a = new f92(j, j2, j2, uu1.b(0.38f, j2), uu1.b(0.38f, j2));
    }

    public static final void a(f92 f92Var, r28 r28Var, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-527864079);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(f92Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            r28Var2 = r28Var;
            i2 |= p65Var.f(r28Var2) ? 32 : 16;
        } else {
            r28Var2 = r28Var;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(mz1Var) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            zq0 zq0Var = h92.a;
            r28 r28VarR = wgf.R(w2g.E(pwd.e0(flb.a0(wo7.w(r28Var2, 3.0f, bmb.a(4.0f), 0L, 0L, 28), f92Var.a, rv8.r), a76.Max), 0.0f, h92.d, 1), wgf.K(p65Var), false, 14);
            int i3 = (i2 << 3) & 7168;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarR);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            mz1Var.f(xv1.a, p65Var, Integer.valueOf(((i3 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6));
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i, 12, r28Var, (Object) f92Var, (Object) mz1Var);
        }
    }

    public static final void b(r28 r28Var, f92 f92Var, x45 x45Var, x12 x12Var, int i, int i2) {
        int i3;
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-625529233);
        int i5 = i2 & 1;
        if (i5 != 0) {
            i3 = i | 6;
        } else {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i;
        }
        int i6 = i2 & 2;
        if (i6 != 0) {
            i4 = i3 | 48;
        } else {
            i4 = i3 | (p65Var.f(f92Var) ? 32 : 16);
        }
        int i7 = i4 | (p65Var.h(x45Var) ? 256 : 128);
        if (p65Var.P(i7 & 1, (i7 & 147) != 146)) {
            if (i5 != 0) {
                r28Var = o28.b;
            }
            if (i6 != 0) {
                f92Var = a;
            }
            a(f92Var, r28Var, pxf.E(-250345048, new ec(x45Var, 21, f92Var), p65Var), p65Var, ((i7 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i7 >> 3) & 14) | 384);
        } else {
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        f92 f92Var2 = f92Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(r28Var2, f92Var2, x45Var, i, i2);
        }
    }

    public static final void c(String str, boolean z, f92 f92Var, r28 r28Var, c55 c55Var, m45 m45Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-2001167027);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(str) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.g(z) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(f92Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.h(c55Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var2.h(m45Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        int i3 = i2;
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            zq0 zq0Var = h92.a;
            float f = h92.c;
            h70 h70Var = new h70(f, true, new z10(21));
            boolean z2 = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((458752 & i3) == 131072);
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                objM = new d42(z, m45Var, 1);
                p65Var2.j0(objM);
            }
            r28 r28VarE = w2g.E(jfc.n(jfc.d(hlg.r(r28Var, z, str, null, (m45) objM, 12), 1.0f), 112.0f, 48.0f, 280.0f, 48.0f), f, 0.0f, 2);
            omb ombVarA = nmb.a(h70Var, zq0Var, p65Var2, 54);
            long j = p65Var2.T;
            int i4 = (int) (j ^ (j >>> 32));
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
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            if (c55Var == null) {
                p65Var2.Y(-1597947094);
                p65Var2.p(false);
            } else {
                p65Var2.Y(-1597947093);
                float f2 = h92.e;
                r28 r28VarJ = jfc.j(o28.b, f2, 0.0f, f2, f2, 2);
                zk7 zk7VarC = dy0.c(z46.d, false);
                long j2 = p65Var2.T;
                int i5 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var2.l();
                r28 r28VarR2 = gx1.R(p65Var2, r28VarJ);
                p65Var2.c0();
                if (p65Var2.S) {
                    p65Var2.k(ot2Var);
                } else {
                    p65Var2.m0();
                }
                tp7.B(p65Var2, cuVar, zk7VarC);
                tp7.B(p65Var2, cuVar2, i89VarL2);
                ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
                tp7.B(p65Var2, cuVar4, r28VarR2);
                c55Var.f(new uu1(z ? f92Var.c : f92Var.e), p65Var2, 0);
                p65Var2.p(true);
                p65Var2.p(false);
            }
            long j3 = z ? f92Var.b : f92Var.d;
            flb.D(str, new sq6(1.0f, true), new mkd(j3, h92.h, h92.i, null, h92.k, h92.b, h92.j, null, 16613240), null, 0, false, 1, 0, null, null, p65Var2, (i3 & 14) | 1572864, 952);
            p65Var = p65Var2;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jp0(str, z, f92Var, r28Var, c55Var, m45Var, i);
        }
    }
}
