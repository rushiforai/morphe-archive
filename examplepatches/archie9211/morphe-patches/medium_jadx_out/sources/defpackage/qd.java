package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qd {
    public static final jy8 a = new jy8(24.0f, 24.0f, 24.0f, 24.0f);
    public static final jy8 b = w2g.h(0.0f, 0.0f, 0.0f, 16.0f, 7);
    public static final jy8 c = w2g.h(0.0f, 0.0f, 0.0f, 16.0f, 7);
    public static final jy8 d = w2g.h(0.0f, 0.0f, 0.0f, 24.0f, 7);
    public static final sn3 e = new sn3(0, new n7(2));

    public static final void a(final mz1 mz1Var, r28 r28Var, final b55 b55Var, final b55 b55Var2, final b55 b55Var3, final m3c m3cVar, final long j, final long j2, final long j3, final long j4, final long j5, x12 x12Var, final int i) {
        final r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1378716401);
        int i2 = i | 48 | (p65Var.h(b55Var) ? 256 : 128) | (p65Var.h(b55Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.h(b55Var3) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(m3cVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.e(j) ? 1048576 : 524288) | (p65Var.c(0.0f) ? 8388608 : 4194304) | (p65Var.e(j2) ? 67108864 : 33554432) | (p65Var.e(j3) ? 536870912 : 268435456);
        if (p65Var.P(i2 & 1, ((306783379 & i2) == 306783378 && (((p65Var.e(j4) ? (char) 4 : (char) 2) | (p65Var.e(j5) ? ' ' : (char) 16)) & 19) == 18) ? false : true)) {
            mz1 mz1VarE = pxf.E(-652798794, new ld(b55Var, b55Var2, b55Var3, j3, j4, j5, j2, mz1Var), p65Var);
            int i3 = i2 >> 12;
            int i4 = (i3 & 896) | (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 12582918 | ((i2 >> 9) & 57344);
            o28 o28Var = o28.b;
            g3d.a(o28Var, m3cVar, j, 0L, 0.0f, 0.0f, null, mz1VarE, p65Var, i4, 104);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(r28Var2, b55Var, b55Var2, b55Var3, m3cVar, j, j2, j3, j4, j5, i) { // from class: ed
                public final /* synthetic */ r28 b;
                public final /* synthetic */ b55 c;
                public final /* synthetic */ b55 d;
                public final /* synthetic */ b55 e;
                public final /* synthetic */ m3c f;
                public final /* synthetic */ long g;
                public final /* synthetic */ long h;
                public final /* synthetic */ long i;
                public final /* synthetic */ long j;
                public final /* synthetic */ long k;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(7);
                    qd.a(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void b(mz1 mz1Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-917637668);
        int i2 = 1;
        if (p65Var.P(i & 1, (i & 147) != 146)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new id(12);
                p65Var.j0(objM);
            }
            zk7 zk7Var = (zk7) objM;
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, o28.b);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7Var);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            km4.H(6, mz1Var, p65Var, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dd(mz1Var, i, i2);
        }
    }

    public static final void c(final m45 m45Var, final mz1 mz1Var, final r28 r28Var, final b55 b55Var, final b55 b55Var2, final b55 b55Var3, final b55 b55Var4, final m3c m3cVar, final long j, final long j2, final long j3, final long j4, final pb3 pb3Var, x12 x12Var, final int i, final int i2) {
        int i3;
        mz1 mz1Var2;
        b55 b55Var5;
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-867616355);
        if ((i & 6) == 0) {
            i3 = (p65Var.h(m45Var) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        if ((i & 48) == 0) {
            mz1Var2 = mz1Var;
            i3 |= p65Var.h(mz1Var2) ? 32 : 16;
        } else {
            mz1Var2 = mz1Var;
        }
        if ((i & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            b55Var5 = b55Var;
            i3 |= p65Var.h(b55Var5) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            b55Var5 = b55Var;
        }
        if ((i & 24576) == 0) {
            i3 |= p65Var.h(b55Var2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((i & 196608) == 0) {
            i3 |= p65Var.h(b55Var3) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((i & 1572864) == 0) {
            i3 |= p65Var.h(b55Var4) ? 1048576 : 524288;
        }
        if ((i & 12582912) == 0) {
            i3 |= p65Var.f(m3cVar) ? 8388608 : 4194304;
        }
        if ((i & 100663296) == 0) {
            i3 |= p65Var.e(j) ? 67108864 : 33554432;
        }
        if ((i & 805306368) == 0) {
            i3 |= p65Var.e(j2) ? 536870912 : 268435456;
        }
        if ((i2 & 6) == 0) {
            i4 = i2 | (p65Var.e(j3) ? 4 : 2);
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var.e(j4) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i4 |= p65Var.c(0.0f) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i4 |= p65Var.f(pb3Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i5 = i4;
        if (p65Var.P(i3 & 1, ((i3 & 306783379) == 306783378 && (i5 & 1171) == 1170) ? false : true)) {
            d(m45Var, r28Var, pb3Var, pxf.E(527420759, new od(b55Var2, b55Var3, b55Var4, m3cVar, j, j2, j3, j4, b55Var5, mz1Var2), p65Var), p65Var, (i3 & 14) | 3072 | ((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i5 >> 3) & 896), 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: cd
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i | 1);
                    int iY2 = tr7.y(i2);
                    qd.c(m45Var, mz1Var, r28Var, b55Var, b55Var2, b55Var3, b55Var4, m3cVar, j, j2, j3, j4, pb3Var, (x12) obj, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    public static final void d(m45 m45Var, r28 r28Var, pb3 pb3Var, mz1 mz1Var, x12 x12Var, int i, int i2) {
        int i3;
        r28 r28Var2;
        pb3 pb3Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(24925658);
        if ((i & 6) == 0) {
            i3 = (p65Var.h(m45Var) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        int i4 = i2 & 2;
        if (i4 != 0) {
            i3 |= 48;
        } else if ((i & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        int i5 = i2 & 4;
        if (i5 != 0) {
            i3 |= 384;
        } else if ((i & 384) == 0) {
            i3 |= p65Var.f(pb3Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i3 |= p65Var.h(mz1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            if (i4 != 0) {
                r28Var = o28.b;
            }
            r28 r28Var3 = r28Var;
            if (i5 != 0) {
                pb3Var = new pb3(7);
            }
            pb3 pb3Var3 = pb3Var;
            ((gx2) p65Var.j(e)).a(new n0c(m45Var, r28Var3, pb3Var3, mz1Var, 4), p65Var, 0);
            r28Var2 = r28Var3;
            pb3Var2 = pb3Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            pb3Var2 = pb3Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fc(m45Var, r28Var2, pb3Var2, mz1Var, i, i2, 1);
        }
    }
}
