package defpackage;

import android.content.res.Resources;
import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.reader.R;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class pla {
    public static final void a(hna hnaVar, x45 x45Var, nla nlaVar, pkf pkfVar, my6 my6Var, zm7 zm7Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        String string;
        g49 g49Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-694818327);
        int i2 = i | (p65Var2.f(hnaVar) ? 4 : 2) | (p65Var2.f(nlaVar) ? 256 : 128) | (p65Var2.f(pkfVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.f(my6Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var2.f(zm7Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var2.f(r28Var) ? 1048576 : 524288);
        if (p65Var2.P(i2 & 1, (599187 & i2) != 599186)) {
            int i3 = i2 & 896;
            boolean z = i3 == 256;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            n92 n92Var = null;
            if (z || objM == uobVar) {
                objM = new lo5(nlaVar, n92Var, 26);
                p65Var2.j0(objM);
            }
            kyd.k(p65Var2, (b55) objM, c1e.a);
            Resources resources = (Resources) p65Var2.j(eo.c);
            boolean zF = p65Var2.f(hnaVar.d);
            Object objM2 = p65Var2.M();
            if (zF || objM2 == uobVar) {
                az5<PublicationTab> az5Var = hnaVar.d;
                ArrayList arrayList = new ArrayList(cu1.k0(az5Var, 10));
                for (PublicationTab publicationTab : az5Var) {
                    if (publicationTab instanceof PublicationTab.About) {
                        string = resources.getString(R.string.publication_tab_about);
                    } else if (publicationTab instanceof PublicationTab.Home) {
                        string = resources.getString(R.string.publication_tab_home);
                    } else {
                        if (!(publicationTab instanceof PublicationTab.Newsletter)) {
                            ygf.a();
                            return;
                        }
                        string = resources.getString(R.string.publication_tab_newsletter);
                    }
                    arrayList.add(string);
                }
                objM2 = bo.f0(arrayList);
                p65Var2.j0(objM2);
            }
            az5 az5Var2 = (az5) objM2;
            int i4 = hnaVar.g;
            boolean zF2 = p65Var2.f(az5Var2);
            Object objM3 = p65Var2.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new lla(az5Var2, 0);
                p65Var2.j0(objM3);
            }
            d13 d13VarB = jz8.b(i4, (m45) objM3, p65Var2, 0, 2);
            m73 m73Var = (m73) p65Var2.j(z22.h);
            Object[] objArr = new Object[0];
            Object objM4 = p65Var2.M();
            if (objM4 == uobVar) {
                objM4 = new lg9(6);
                p65Var2.j0(objM4);
            }
            g49 g49Var2 = (g49) hp7.E(objArr, (m45) objM4, p65Var2, 48);
            Object[] objArr2 = new Object[0];
            Object objM5 = p65Var2.M();
            if (objM5 == uobVar) {
                objM5 = new lg9(7);
                p65Var2.j0(objM5);
            }
            g49 g49Var3 = (g49) hp7.E(objArr2, (m45) objM5, p65Var2, 48);
            Object objM6 = p65Var2.M();
            if (objM6 == uobVar) {
                objM6 = new mla(g49Var3, g49Var2, x45Var);
                p65Var2.j0(objM6);
            }
            r28 r28VarN = bgf.N(rv8.J(r28Var.b(jfc.c), (mla) objM6, null), "publication");
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j = p65Var2.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            pia piaVar = hnaVar.c;
            boolean zF3 = p65Var2.f(g49Var2);
            Object objM7 = p65Var2.M();
            if (zF3 || objM7 == uobVar) {
                objM7 = new w35(g49Var2, 4);
                p65Var2.j0(objM7);
            }
            o28 o28Var = o28.b;
            r28 r28VarV = pwd.V(o28Var, (x45) objM7);
            boolean zF4 = p65Var2.f(g49Var3);
            Object objM8 = p65Var2.M();
            if (zF4 || objM8 == uobVar) {
                g49Var = g49Var2;
                objM8 = new w35(g49Var3, 5);
                p65Var2.j0(objM8);
            } else {
                g49Var = g49Var2;
            }
            ek7.o(piaVar, nlaVar, guc.R(r28VarV, (x45) objM8), p65Var2, (i2 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
            float fG = g49Var3.g() + g49Var.g();
            if (fG < 0.0f) {
                fG = 0.0f;
            }
            r28 r28VarG = w2g.G(o28Var, 0.0f, m73Var.Q(fG), 0.0f, 0.0f, 13);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j2 = p65Var2.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarG);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.r(o28Var, 3), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.h, false);
            long j3 = p65Var2.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j4 = p65Var2.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarD2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC3);
            tp7.B(p65Var2, cuVar2, i89VarL4);
            ka1.z(i8, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR4);
            int i9 = hnaVar.g;
            int i10 = i2 & 14;
            boolean z2 = (i10 == 4) | (i3 == 256);
            Object objM9 = p65Var2.M();
            if (z2 || objM9 == uobVar) {
                objM9 = new pda(nlaVar, 2, hnaVar);
                p65Var2.j0(objM9);
            }
            n92 n92Var2 = null;
            ns7.a(0.0f, i9, 0, 504, 0L, 0L, p65Var2, (x45) objM9, null, null, null, az5Var2);
            p65Var2.p(true);
            p65Var2.p(true);
            kk7.c(d13VarB, null, null, null, null, null, false, null, null, null, pxf.E(1744765260, new vx4(hnaVar, pkfVar, my6Var, zm7Var, 1), p65Var2), p65Var2, 0, 16382);
            p65Var = p65Var2;
            p65Var.p(true);
            p65Var.p(true);
            PublicationTab publicationTab2 = hnaVar.e;
            boolean zF5 = p65Var.f(d13VarB) | (i10 == 4);
            Object objM10 = p65Var.M();
            if (zF5 || objM10 == uobVar) {
                objM10 = new nx9(d13VarB, hnaVar, n92Var2, 16);
                p65Var.j0(objM10);
            }
            kyd.k(p65Var, (b55) objM10, publicationTab2);
            boolean zF6 = p65Var.f(d13VarB) | (i3 == 256) | (i10 == 4);
            Object objM11 = p65Var.M();
            if (zF6 || objM11 == uobVar) {
                mw9 mw9Var = new mw9(d13VarB, nlaVar, hnaVar, n92Var2, 10);
                p65Var.j0(mw9Var);
                objM11 = mw9Var;
            }
            kyd.k(p65Var, (b55) objM11, d13VarB);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc3(hnaVar, x45Var, nlaVar, pkfVar, my6Var, zm7Var, r28Var, i, 9);
        }
    }

    public static final void b(fna fnaVar, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1532053661);
        int i2 = (p65Var.f(fnaVar) ? 4 : 2) | i | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            r28 r28VarD = jfc.d(jfc.r(r28Var, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
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
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            iq7.a(fnaVar.a, iy0.a.a(o28Var, z46.e), null, null, null, null, null, null, p65Var, 0, 252);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(fnaVar, r28Var, i, 29);
        }
    }

    public static final void c(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1161672811);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            ek7.p(0, 0L, p65Var, null);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.r(o28Var, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarV = m40.V(jfc.e(o28Var, 48.0f), p65Var, 6);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarV);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            r28 r28VarM = jfc.m(o28Var, 36.0f, 20.0f);
            sn3 sn3Var = kt7.b;
            long j5 = ((zo7) p65Var.j(sn3Var)).c;
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarM, j5, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            dy0.a(flb.a0(jfc.m(o28Var, 63.0f, 20.0f), ((zo7) p65Var.j(sn3Var)).c, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            dy0.a(flb.a0(jfc.m(o28Var, 36.0f, 20.0f), ((zo7) p65Var.j(sn3Var)).c, nr5Var), p65Var, 0);
            p65Var.p(true);
            tp7.c(0.0f, 0, 4, ((zo7) p65Var.j(sn3Var)).c, p65Var, m40.V(iy0.a.a(o28Var, z46.k), p65Var, 0));
            p65Var.p(true);
            p65Var.p(true);
            g76.w(0, 1, p65Var, null);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i, 14);
        }
    }

    public static final void d(ina inaVar, nhc nhcVar, nla nlaVar, pkf pkfVar, my6 my6Var, zm7 zm7Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        pkf pkfVar2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(830256707);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(inaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= (i & 512) == 0 ? p65Var2.f(nlaVar) : p65Var2.h(nlaVar) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            pkfVar2 = pkfVar;
            i2 |= p65Var2.f(pkfVar2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            pkfVar2 = pkfVar;
        }
        if ((i & 24576) == 0) {
            i2 |= (32768 & i) == 0 ? p65Var2.f(my6Var) : p65Var2.h(my6Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= (262144 & i) == 0 ? p65Var2.f(zm7Var) : p65Var2.h(zm7Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i2 |= p65Var2.f(r28Var) ? 1048576 : 524288;
        }
        int i3 = i2;
        if (p65Var2.P(i3 & 1, (599187 & i3) != 599186)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM);
            }
            l78 l78Var = (l78) objM;
            p65Var = p65Var2;
            pr7.b(r28Var, pxf.E(791229631, new se9(inaVar, nlaVar, l78Var, 17), p65Var2), null, pxf.E(1760503293, new w87(nhcVar, 14), p65Var2), null, 0, 0L, 0L, null, pxf.E(702502612, new j84(inaVar, nlaVar, pkfVar2, my6Var, zm7Var, l78Var, 4), p65Var2), p65Var, ((i3 >> 18) & 14) | 805309488, 500);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kz1(inaVar, nhcVar, nlaVar, pkfVar, my6Var, zm7Var, r28Var, i, 5);
        }
    }

    public static final void e(PublicationReference publicationReference, String str, PublicationTab publicationTab, sja sjaVar, r28 r28Var, nna nnaVar, x12 x12Var, int i) {
        nna nnaVar2;
        nna nnaVar3;
        int i2;
        nna nnaVar4;
        publicationReference.getClass();
        str.getClass();
        publicationTab.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-464984012);
        int i3 = i | (p65Var.h(publicationReference) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.h(publicationTab) ? 256 : 128) | (p65Var.f(sjaVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        if (p65Var.P(i3 & 1, (74899 & i3) != 74898)) {
            p65Var.U();
            int i4 = i & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean zH = p65Var.h(publicationReference) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.h(publicationTab);
                Object objM = p65Var.M();
                if (zH || objM == uobVar) {
                    objM = new pi9((Parcelable) publicationReference, str, (Object) publicationTab, 5);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    nnaVar3 = (nna) to7.z(n1b.a.b(nna.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i2 = i3 & (-458753);
                }
            } else {
                p65Var.S();
                i2 = i3 & (-458753);
                nnaVar3 = nnaVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(nnaVar3.x, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            nla nlaVar = new nla(sjaVar, nnaVar3);
            d((ina) l78VarZ.getValue(), nhcVarF, nlaVar, new pkf(sjaVar), new my6(sjaVar), new zm7(23, sjaVar), r28Var, p65Var, (i2 << 6) & 3670016);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH2 = p65Var.h(nnaVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(nlaVar);
            Object objM2 = p65Var.M();
            if (zH2 || objM2 == uobVar) {
                nnaVar4 = nnaVar3;
                zo5 zo5Var = new zo5(nnaVar4, nhcVarF, resources, nlaVar, null, 28);
                p65Var.j0(zo5Var);
                objM2 = zo5Var;
            } else {
                nnaVar4 = nnaVar3;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            nnaVar2 = nnaVar4;
        } else {
            p65Var.S();
            nnaVar2 = nnaVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i, 19, r28Var, (que) nnaVar2, (Object) publicationReference, (Object) publicationTab, (Object) sjaVar, str);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:101:0x0277, code lost:
    
        if (r15 == r0) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x02b0, code lost:
    
        if (r15 == r0) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x02f5, code lost:
    
        if (r15 == r0) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:129:0x032c, code lost:
    
        if (r15 == r0) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00bf, code lost:
    
        if (r15 == r0) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0113, code lost:
    
        if (r15 == r0) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0154, code lost:
    
        if (r15 == r0) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x019a, code lost:
    
        if (r15 == r0) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x01ce, code lost:
    
        if (r15 == r0) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x0214, code lost:
    
        if (r15 == r0) goto L130;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object f(defpackage.ena r11, defpackage.nhc r12, android.content.res.Resources r13, defpackage.nla r14, defpackage.n92 r15) {
        /*
            Method dump skipped, instruction units count: 866
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pla.f(ena, nhc, android.content.res.Resources, nla, n92):java.lang.Object");
    }
}
