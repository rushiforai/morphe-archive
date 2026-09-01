package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class p5d {
    public static final float a = 14.0f;
    public static final cud b = new cud(100, (yn3) null, 6);
    public static final float c = 1.0f;
    public static final float d = 6.0f;
    public static final float e = 125.0f;

    public static final void a(boolean z, x45 x45Var, r28 r28Var, boolean z2, m68 m68Var, h23 h23Var, x12 x12Var, int i) {
        int i2;
        m68 m68Var2;
        int i3;
        boolean z3;
        uob uobVar;
        m68 m68Var3;
        r28 r28VarE0;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(25866825);
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
        if ((i & 3072) == 0) {
            i2 |= p65Var.g(z2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.f(m68Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.f(h23Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        int i4 = i2;
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var.U();
            if ((i & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            uob uobVar2 = w12.a;
            if (m68Var == null) {
                p65Var.Y(1799771122);
                Object objM = p65Var.M();
                if (objM == uobVar2) {
                    objM = ka1.k(p65Var);
                }
                p65Var.p(false);
                m68Var2 = (m68) objM;
            } else {
                p65Var.Y(-911774843);
                p65Var.p(false);
                m68Var2 = m68Var;
            }
            sn3 sn3Var = z22.h;
            float fZ = ((m73) p65Var.j(sn3Var)).Z(14.0f);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar2) {
                objM2 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM2);
            }
            l78 l78Var = (l78) objM2;
            final float fZ2 = ((m73) p65Var.j(sn3Var)).Z(e);
            boolean zC = p65Var.c(fZ) | p65Var.c(fZ2);
            Object objM3 = p65Var.M();
            Object obj = objM3;
            if (zC || objM3 == uobVar2) {
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                linkedHashMap.put(Boolean.FALSE, Float.valueOf(0.0f));
                linkedHashMap.put(Boolean.TRUE, Float.valueOf(fZ));
                hh7 hh7Var = new hh7(linkedHashMap);
                Boolean boolValueOf = Boolean.valueOf(z);
                sl slVar = new sl(boolValueOf, new d3d(3), new m45() { // from class: n5d
                    @Override // defpackage.m45
                    public final Object invoke() {
                        return Float.valueOf(fZ2);
                    }
                }, b, new b5(28));
                slVar.l.setValue(hh7Var);
                slVar.i(boolValueOf);
                p65Var.j0(slVar);
                obj = slVar;
            }
            sl slVar2 = (sl) obj;
            int i5 = i4 >> 3;
            l78 l78VarY = qo7.y(x45Var, p65Var);
            int i6 = i4 & 14;
            l78 l78VarY2 = qo7.y(Boolean.valueOf(z), p65Var);
            boolean zF = p65Var.f(slVar2) | p65Var.f(l78VarY2) | p65Var.f(l78VarY);
            Object objM4 = p65Var.M();
            if (zF || objM4 == uobVar2) {
                objM4 = new rna(slVar2, l78VarY2, l78VarY, l78Var, null, 25);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, slVar2);
            Boolean boolValueOf2 = Boolean.valueOf(z);
            Boolean bool = (Boolean) l78Var.getValue();
            bool.getClass();
            boolean zF2 = (i6 == 4) | p65Var.f(slVar2);
            Object objM5 = p65Var.M();
            int i7 = 6;
            if (zF2 || objM5 == uobVar2) {
                objM5 = new wd0(z, slVar2, (n92) null, i7);
                p65Var.j0(objM5);
            }
            kyd.l(boolValueOf2, bool, (b55) objM5, p65Var);
            boolean z4 = p65Var.j(z22.n) == ip6.Rtl;
            r28 r28Var2 = o28.b;
            if (x45Var != null) {
                i3 = 6;
                z3 = false;
                uobVar = uobVar2;
                m68Var3 = m68Var2;
                r28VarE0 = dm2.e0(r28Var2, z, m68Var3, z2, new vkb(2), x45Var);
            } else {
                i3 = 6;
                z3 = false;
                uobVar = uobVar2;
                m68Var3 = m68Var2;
                r28VarE0 = r28Var2;
            }
            if (x45Var != null) {
                sn3 sn3Var2 = h56.a;
                r28Var2 = x08.b;
            }
            r28 r28VarI = jfc.i(w2g.C(jfc.s(pl3.a(r28Var.b(r28Var2).b(r28VarE0), slVar2.f, hw8.Horizontal, (!z2 || x45Var == null) ? z3 : true, m68Var3, false, new kk(slVar2, null, 1), z4, 32), z46.h, 2), 2.0f), 34.0f, 20.0f);
            zk7 zk7VarC = dy0.c(z46.d, z3);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarI);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            boolean zBooleanValue = ((Boolean) slVar2.h.getValue()).booleanValue();
            boolean zF3 = p65Var.f(slVar2);
            Object objM6 = p65Var.M();
            if (zF3 || objM6 == uobVar) {
                objM6 = new dl(slVar2, 4);
                p65Var.j0(objM6);
            }
            b(zBooleanValue, z2, h23Var, (m45) objM6, m68Var3, p65Var, i3 | (i5 & 896) | ((i4 >> 6) & 7168));
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b88(z, x45Var, r28Var, z2, m68Var, h23Var, i, 3);
        }
    }

    public static final void b(boolean z, boolean z2, h23 h23Var, m45 m45Var, d56 d56Var, x12 x12Var, int i) {
        int i2;
        long jA;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(70908914);
        int i3 = i & 6;
        iy0 iy0Var = iy0.a;
        if (i3 == 0) {
            i2 = (p65Var.f(iy0Var) ? 4 : 2) | i;
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
            i2 |= p65Var.f(h23Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.h(m45Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.f(d56Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var.P(i2 & 1, (74899 & i2) != 74898)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new ejc();
                p65Var.j0(objM);
            }
            ejc ejcVar = (ejc) objM;
            boolean z3 = (458752 & i2) == 131072;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                objM2 = new k11(d56Var, ejcVar, null, 4);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, d56Var);
            float f = !ejcVar.isEmpty() ? d : c;
            h23Var.getClass();
            p65Var.Y(-1176343362);
            l78 l78VarY = qo7.y(new uu1(z2 ? z ? h23Var.b : h23Var.d : z ? h23Var.f : h23Var.h), p65Var);
            p65Var.p(false);
            ar0 ar0Var = z46.h;
            o28 o28Var = o28.b;
            r28 r28VarB = iy0Var.a(o28Var, ar0Var).b(jfc.c);
            boolean zF = p65Var.f(l78VarY);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                objM3 = new ws(l78VarY, 25);
                p65Var.j0(objM3);
            }
            pxf.a(r28VarB, (x45) objM3, p65Var, 0);
            p65Var.Y(-66424183);
            l78 l78VarY2 = qo7.y(new uu1(z2 ? z ? h23Var.a : h23Var.c : z ? h23Var.e : h23Var.g), p65Var);
            p65Var.p(false);
            uy2 uy2Var = (uy2) p65Var.j(nw3.a);
            float f2 = ((vj3) p65Var.j(nw3.b)).a + f;
            int i4 = i2;
            if (!ezd.a(((uu1) l78VarY2.getValue()).a, ((sv1) p65Var.j(tv1.a)).e()) || uy2Var == null) {
                p65Var.Y(-674751066);
                p65Var.p(false);
                jA = ((uu1) l78VarY2.getValue()).a;
            } else {
                p65Var.Y(-674840005);
                jA = uy2.a(((uu1) l78VarY2.getValue()).a, f2, p65Var, 0);
                p65Var.p(false);
            }
            upc upcVarA = wec.a(jA, null, null, p65Var, 0, 14);
            r28 r28VarA = iy0Var.a(o28Var, z46.g);
            boolean z4 = (i4 & 57344) == 16384;
            Object objM4 = p65Var.M();
            if (z4 || objM4 == uobVar) {
                objM4 = new r00(10, m45Var);
                p65Var.j0(objM4);
            }
            r28 r28VarH = jfc.h(s06.a(guc.R(r28VarA, (x45) objM4), d56Var, rkb.a(4, 0L, false)), 20.0f);
            amb ambVar = bmb.a;
            hp7.t(p65Var, flb.a0(wo7.w(r28VarH, f, ambVar, 0L, 0L, 24), ((uu1) upcVarA.getValue()).a, ambVar));
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new leb(z, z2, h23Var, m45Var, d56Var, i);
        }
    }
}
