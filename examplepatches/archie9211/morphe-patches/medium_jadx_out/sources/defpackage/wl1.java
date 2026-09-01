package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wl1 {
    public static final jy8 a = w2g.g(2, 8.0f);
    public static final jy8 b;

    static {
        w2g.g(2, 8.0f);
        b = w2g.g(2, 8.0f);
    }

    public static final void a(m45 m45Var, mz1 mz1Var, r28 r28Var, boolean z, m3c m3cVar, nl1 nl1Var, ol1 ol1Var, cu0 cu0Var, x12 x12Var, int i) {
        r28 r28Var2;
        m3c m3cVar2;
        nl1 nl1Var2;
        ol1 ol1Var2;
        cu0 cu0Var2;
        nl1 nl1Var3;
        m3c m3cVar3;
        cu0 cu0VarB;
        ol1 ol1Var3;
        r28 r28Var3;
        nl1 nl1Var4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1192083339);
        int i2 = i | 306930048;
        if (p65Var.P(i2 & 1, (306783379 & i2) != 306783378)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                float f = s80.a;
                m3c m3cVarA = z4c.a(t80.a, p65Var);
                fv1 fv1Var = (fv1) p65Var.j(iv1.a);
                nl1 nl1Var5 = fv1Var.a0;
                if (nl1Var5 == null) {
                    long j = uu1.g;
                    long jC = iv1.c(fv1Var, t80.i);
                    gv1 gv1Var = t80.m;
                    long jC2 = iv1.c(fv1Var, gv1Var);
                    long jC3 = iv1.c(fv1Var, gv1Var);
                    long jB = uu1.b(t80.c, iv1.c(fv1Var, t80.b));
                    gv1 gv1Var2 = t80.k;
                    long jC4 = iv1.c(fv1Var, gv1Var2);
                    float f2 = t80.l;
                    nl1Var3 = new nl1(j, jC, jC2, jC3, j, jB, uu1.b(f2, jC4), uu1.b(f2, iv1.c(fv1Var, gv1Var2)));
                    fv1Var.a0 = nl1Var3;
                } else {
                    nl1Var3 = nl1Var5;
                }
                ol1 ol1Var4 = new ol1(t80.d);
                long jD = iv1.d(t80.g, p65Var);
                long jB2 = uu1.b(t80.f, iv1.d(t80.e, p65Var));
                float f3 = t80.h;
                if (!z) {
                    jD = jB2;
                }
                m3cVar3 = m3cVarA;
                cu0VarB = k40.b(f3, jD);
                ol1Var3 = ol1Var4;
                r28Var3 = o28.b;
                nl1Var4 = nl1Var3;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
                m3cVar3 = m3cVar;
                nl1Var4 = nl1Var;
                ol1Var3 = ol1Var;
                cu0VarB = cu0Var;
            }
            p65Var.q();
            b(r28Var3, m45Var, z, mz1Var, pyd.a(t80.j, p65Var), z ? nl1Var4.b : nl1Var4.f, m3cVar3, nl1Var4, ol1Var3, cu0VarB, s80.a, a, p65Var, 14159286, 28032);
            r28Var2 = r28Var3;
            m3cVar2 = m3cVar3;
            nl1Var2 = nl1Var4;
            ol1Var2 = ol1Var3;
            cu0Var2 = cu0VarB;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            m3cVar2 = m3cVar;
            nl1Var2 = nl1Var;
            ol1Var2 = ol1Var;
            cu0Var2 = cu0Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sl1(m45Var, mz1Var, r28Var2, z, m3cVar2, nl1Var2, ol1Var2, cu0Var2, i);
        }
    }

    public static final void b(final r28 r28Var, final m45 m45Var, final boolean z, final mz1 mz1Var, final mkd mkdVar, final long j, final m3c m3cVar, final nl1 nl1Var, final ol1 ol1Var, final cu0 cu0Var, final float f, final hy8 hy8Var, x12 x12Var, final int i, final int i2) {
        int i3;
        int i4;
        int i5;
        l78 l78Var;
        m68 m68Var;
        int i6;
        ou ouVar;
        int i7;
        boolean z2;
        xw xwVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(892465622);
        if ((i & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        if ((i & 48) == 0) {
            i3 |= p65Var.h(m45Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i3 |= p65Var.g(z) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i3 |= p65Var.h(mz1Var) ? 2048 : 1024;
        }
        if ((i & 24576) == 0) {
            i3 |= p65Var.f(mkdVar) ? 16384 : 8192;
        }
        if ((i & 196608) == 0) {
            i3 |= p65Var.e(j) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((i & 1572864) == 0) {
            i3 |= p65Var.h(null) ? 1048576 : 524288;
        }
        if ((i & 12582912) == 0) {
            i3 |= p65Var.h(null) ? 8388608 : 4194304;
        }
        if ((i & 100663296) == 0) {
            i3 |= p65Var.f(m3cVar) ? 67108864 : 33554432;
        }
        if ((i & 805306368) == 0) {
            i3 |= p65Var.f(nl1Var) ? 536870912 : 268435456;
        }
        if ((i2 & 6) == 0) {
            i4 = i2 | (p65Var.f(ol1Var) ? 4 : 2);
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var.f(cu0Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i4 |= p65Var.c(f) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i4 |= p65Var.f(hy8Var) ? 2048 : 1024;
        }
        int i8 = i3;
        if ((i2 & 24576) == 0) {
            i4 |= p65Var.f(null) ? 16384 : 8192;
        }
        int i9 = i4;
        int i10 = 1;
        if (p65Var.P(i8 & 1, ((i8 & 306783379) == 306783378 && (i9 & 9363) == 9362) ? false : true)) {
            p65Var.Y(1596346437);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = ka1.k(p65Var);
            }
            m68 m68Var2 = (m68) objM;
            p65Var.p(false);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new ql1(i10);
                p65Var.j0(objM2);
            }
            r28 r28VarA = wxb.a(r28Var, false, (x45) objM2);
            long j2 = z ? nl1Var.a : nl1Var.e;
            if (ol1Var == null) {
                p65Var.Y(1596621344);
                p65Var.p(false);
                i5 = i9;
                m68Var = m68Var2;
                i7 = i8;
                xwVar = null;
            } else {
                p65Var.Y(-1333969407);
                int i11 = ((i8 >> 6) & 14) | ((i9 << 6) & 896);
                Object objM3 = p65Var.M();
                if (objM3 == uobVar) {
                    objM3 = new ejc();
                    p65Var.j0(objM3);
                }
                ejc ejcVar = (ejc) objM3;
                Object objM4 = p65Var.M();
                if (objM4 == uobVar) {
                    objM4 = qo7.u(null);
                    p65Var.j0(objM4);
                }
                l78 l78Var2 = (l78) objM4;
                boolean zF = p65Var.f(m68Var2);
                Object objM5 = p65Var.M();
                if (zF || objM5 == uobVar) {
                    i5 = i9;
                    l78Var = l78Var2;
                    objM5 = new k11(m68Var2, ejcVar, null, 2);
                    p65Var.j0(objM5);
                } else {
                    i5 = i9;
                    l78Var = l78Var2;
                }
                kyd.k(p65Var, (b55) objM5, m68Var2);
                c56 c56Var = (c56) bu1.I0(ejcVar);
                float f2 = (!z || (c56Var instanceof h0a) || (c56Var instanceof sr5) || (c56Var instanceof gr4) || !(c56Var instanceof gl3)) ? 0.0f : ol1Var.a;
                Object objM6 = p65Var.M();
                if (objM6 == uobVar) {
                    m68Var = m68Var2;
                    i6 = i11;
                    objM6 = new ou(new vj3(f2), d46.k, null, 12);
                    p65Var.j0(objM6);
                } else {
                    m68Var = m68Var2;
                    i6 = i11;
                }
                ou ouVar2 = (ou) objM6;
                vj3 vj3Var = new vj3(f2);
                boolean zH = p65Var.h(ouVar2) | p65Var.c(f2) | ((((i6 & 14) ^ 6) > 4 && p65Var.g(z)) || (i6 & 6) == 4) | p65Var.h(c56Var);
                Object objM7 = p65Var.M();
                if (zH || objM7 == uobVar) {
                    ouVar = ouVar2;
                    float f3 = f2;
                    i7 = i8;
                    z2 = false;
                    s61 s61Var = new s61(ouVar, f3, z, c56Var, l78Var, (n92) null);
                    p65Var.j0(s61Var);
                    objM7 = s61Var;
                } else {
                    ouVar = ouVar2;
                    i7 = i8;
                    z2 = false;
                }
                kyd.k(p65Var, (b55) objM7, vj3Var);
                xwVar = ouVar.c;
                p65Var.p(z2);
            }
            g3d.b(m45Var, r28VarA, z, m3cVar, j2, 0L, 0.0f, xwVar != null ? ((vj3) xwVar.b.getValue()).a : 0.0f, cu0Var, m68Var, pxf.E(-70915349, new ul1(mz1Var, mkdVar, j, nl1Var, z, f, hy8Var), p65Var), p65Var, ((i7 >> 15) & 7168) | ((i7 >> 3) & 14) | (i7 & 896) | ((i5 << 21) & 234881024), 96);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: tl1
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i | 1);
                    int iY2 = tr7.y(i2);
                    wl1.b(r28Var, m45Var, z, mz1Var, mkdVar, j, m3cVar, nl1Var, ol1Var, cu0Var, f, hy8Var, (x12) obj, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    public static final void c(final mz1 mz1Var, final mkd mkdVar, final long j, final long j2, final long j3, final float f, final hy8 hy8Var, x12 x12Var, final int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1105630840);
        int i2 = i | (p65Var.h(mz1Var) ? 4 : 2) | (p65Var.f(mkdVar) ? 32 : 16) | (p65Var.e(j) ? 256 : 128) | (p65Var.h(null) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.h(null) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.e(j2) ? 1048576 : 524288) | (p65Var.e(j3) ? 8388608 : 4194304) | (p65Var.c(f) ? 67108864 : 33554432) | (p65Var.f(hy8Var) ? 536870912 : 268435456);
        if (p65Var.P(i2 & 1, (306783379 & i2) != 306783378)) {
            k40.d(new o10[]{b09.q(j, c82.a), jjd.a.a(mkdVar)}, pxf.E(-2130105544, new vl1(f, hy8Var, j2, mz1Var, j3), p65Var), p65Var, 56);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(mkdVar, j, j2, j3, f, hy8Var, i) { // from class: pl1
                public final /* synthetic */ mkd b;
                public final /* synthetic */ long c;
                public final /* synthetic */ long d;
                public final /* synthetic */ long e;
                public final /* synthetic */ float f;
                public final /* synthetic */ hy8 g;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(24577);
                    wl1.c(this.a, this.b, this.c, this.d, this.e, this.f, this.g, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void d(m45 m45Var, mz1 mz1Var, r28 r28Var, boolean z, m3c m3cVar, nl1 nl1Var, ol1 ol1Var, cu0 cu0Var, x12 x12Var, int i) {
        m45 m45Var2;
        int i2;
        mz1 mz1Var2;
        r28 r28Var2;
        m3c m3cVar2;
        ol1 ol1Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-252243183);
        if ((i & 6) == 0) {
            m45Var2 = m45Var;
            i2 = (p65Var.h(m45Var2) ? 4 : 2) | i;
        } else {
            m45Var2 = m45Var;
            i2 = i;
        }
        if ((i & 48) == 0) {
            mz1Var2 = mz1Var;
            i2 |= p65Var.h(mz1Var2) ? 32 : 16;
        } else {
            mz1Var2 = mz1Var;
        }
        if ((i & 384) == 0) {
            r28Var2 = r28Var;
            i2 |= p65Var.f(r28Var2) ? 256 : 128;
        } else {
            r28Var2 = r28Var;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.g(z) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.h(null) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            m3cVar2 = m3cVar;
            i2 |= p65Var.f(m3cVar2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            m3cVar2 = m3cVar;
        }
        if ((1572864 & i) == 0) {
            i2 |= p65Var.f(nl1Var) ? 1048576 : 524288;
        }
        if ((i & 12582912) == 0) {
            ol1Var2 = ol1Var;
            i2 |= p65Var.f(ol1Var2) ? 8388608 : 4194304;
        } else {
            ol1Var2 = ol1Var;
        }
        if ((100663296 & i) == 0) {
            i2 |= p65Var.f(cu0Var) ? 67108864 : 33554432;
        }
        if ((805306368 & i) == 0) {
            i2 |= p65Var.f(null) ? 536870912 : 268435456;
        }
        if (p65Var.P(i2 & 1, (306783379 & i2) != 306783378)) {
            p65Var.U();
            if ((i & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            mkd mkdVarA = pyd.a(a1d.d, p65Var);
            long j = z ? nl1Var.b : nl1Var.f;
            float f = z0d.a;
            int i3 = i2 << 6;
            int i4 = i2 << 9;
            int i5 = (i3 & 7168) | 12582912 | ((i2 >> 6) & 14) | ((i2 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i2 >> 3) & 896) | (3670016 & i3) | (234881024 & i4) | (i4 & 1879048192);
            int i6 = i2 >> 21;
            int i7 = ((i2 >> 15) & 57344) | (i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i6 & 14) | 3456;
            mz1 mz1Var3 = mz1Var2;
            r28 r28Var3 = r28Var2;
            b(r28Var3, m45Var2, z, mz1Var3, mkdVarA, j, m3cVar2, nl1Var, ol1Var2, cu0Var, f, b, p65Var, i5, i7);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new rl1(m45Var, mz1Var, r28Var, z, m3cVar, nl1Var, ol1Var, cu0Var, i);
        }
    }

    public static final nl1 e(fv1 fv1Var) {
        nl1 nl1Var = fv1Var.b0;
        if (nl1Var != null) {
            return nl1Var;
        }
        long j = uu1.g;
        long jC = iv1.c(fv1Var, a1d.c);
        long jC2 = iv1.c(fv1Var, a1d.g);
        long j2 = uu1.h;
        nl1 nl1Var2 = new nl1(j, jC, jC2, j2, j, uu1.b(a1d.b, iv1.c(fv1Var, a1d.a)), uu1.b(a1d.f, iv1.c(fv1Var, a1d.e)), j2);
        fv1Var.b0 = nl1Var2;
        return nl1Var2;
    }
}
