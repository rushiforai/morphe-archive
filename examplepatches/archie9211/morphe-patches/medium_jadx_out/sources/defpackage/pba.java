package defpackage;

import android.content.res.Resources;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class pba {
    static {
        d46.R(new nma("technology", "Technology", false), new nma("design", "Design", false), new nma("programming", "Programming", true));
        bu1.m1(new l46(2026, 2019, -1));
    }

    public static final void a(List list, String str, List list2, Integer num, rba rbaVar, nba nbaVar, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2107609416);
        int i2 = 1572864 | i | (p65Var.h(list) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.h(list2) ? 256 : 128) | (p65Var.f(num) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.d(rbaVar.ordinal()) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(nbaVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        if (p65Var.P(i2 & 1, (599187 & i2) != 599186)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
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
            r28 r28VarG = w2g.G(jfc.d(o28Var, 1.0f), 24.0f, 26.0f, 24.0f, 0.0f, 8);
            omb ombVarA = nmb.a(new h70(16.0f, true, new z10(21)), z46.m, p65Var, 6);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarG);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            int i5 = (i2 >> 9) & 896;
            i(list, str, nbaVar, new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), p65Var, (i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER) | i5);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            j(list2, num, nbaVar, new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), p65Var, ((i2 >> 6) & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER) | i5);
            p65Var.p(true);
            g(rbaVar, str != null, nbaVar, w2g.G(jfc.d(o28Var, 1.0f), 24.0f, 16.0f, 24.0f, 0.0f, 8), p65Var, ((i2 >> 12) & 14) | 3072 | i5);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc3(list, str, list2, num, rbaVar, nbaVar, r28Var2, i);
        }
    }

    public static final void b(aca acaVar, nba nbaVar, sh9 sh9Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1471258991);
        int i2 = 2;
        int i3 = i | (p65Var2.f(acaVar) ? 4 : 2) | (p65Var2.f(nbaVar) ? 32 : 16) | (p65Var2.f(sh9Var) ? 256 : 128) | (p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var2);
            r28 r28VarN = bgf.N(r28Var, "content_state");
            boolean z = (i3 & 14) == 4;
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = ((i3 & 896) == 256) | z | (i4 == 32);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new pi9(acaVar, nbaVar, sh9Var, i2);
                p65Var2.j0(objM);
            }
            boolean z3 = true;
            k40.t(r28VarN, kv6VarA, null, null, null, null, false, null, (x45) objM, p65Var2, 0, 508);
            p65Var = p65Var2;
            String str = acaVar.b + "|" + acaVar.c + "|" + acaVar.e;
            boolean zF = p65Var.f(kv6VarA);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (zF || objM2 == uobVar) {
                objM2 = new jv6(kv6VarA, (n92) null, 1);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, str);
            boolean zF2 = p65Var.f(kv6VarA) | (i4 == 32);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new nx9(kv6VarA, nbaVar, n92Var, 6);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, kv6VarA);
            if (i4 != 32) {
                z3 = false;
            }
            Object objM4 = p65Var.M();
            if (z3 || objM4 == uobVar) {
                objM4 = new lo5(nbaVar, null, 21);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i, 23, r28Var, (Object) acaVar, (Object) nbaVar, (Object) sh9Var);
        }
    }

    public static final void c(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2057291132);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarD = jfc.d(jfc.r(bgf.N(r28Var, "error_state"), 3), 1.0f);
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
            iq7.b(iy0.a.a(o28Var, z46.e), null, null, null, null, null, null, p65Var, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i, 7);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:60:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(defpackage.dca r22, defpackage.nhc r23, defpackage.nba r24, defpackage.sh9 r25, defpackage.r28 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 251
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pba.e(dca, nhc, nba, sh9, r28, x12, int, int):void");
    }

    public static final void f(PublicationReference publicationReference, Integer num, String str, rba rbaVar, String str2, olb olbVar, r28 r28Var, lca lcaVar, x12 x12Var, int i) {
        lca lcaVar2;
        int i2;
        lca lcaVar3;
        int i3;
        lca lcaVar4;
        publicationReference.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-150151088);
        int i4 = 4194304 | i | (p65Var.h(publicationReference) ? 4 : 2) | (p65Var.f(num) ? 32 : 16) | (p65Var.f(str) ? 256 : 128) | (p65Var.d(rbaVar == null ? -1 : rbaVar.ordinal()) ? 2048 : 1024) | (p65Var.f(str2) ? 16384 : 8192) | (p65Var.f(olbVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.f(r28Var) ? 1048576 : 524288);
        if (p65Var.P(i4 & 1, (4793491 & i4) != 4793490)) {
            p65Var.U();
            int i5 = i & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                i2 = 57344;
                boolean zH = p65Var.h(publicationReference) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 896) == 256) | ((i4 & 7168) == 2048) | ((i4 & 57344) == 16384);
                Object objM = p65Var.M();
                if (zH || objM == uobVar) {
                    s7 s7Var = new s7(publicationReference, num, str, rbaVar, str2, 9);
                    p65Var.j0(s7Var);
                    objM = s7Var;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    lcaVar3 = (lca) to7.z(n1b.a.b(lca.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-29360129);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-29360129);
                i2 = 57344;
                lcaVar3 = lcaVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(lcaVar3.r, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i6 = 458752 & i3;
            boolean zF = p65Var.f(lcaVar3) | (i6 == 131072);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new nba(olbVar, lcaVar3);
                p65Var.j0(objM2);
            }
            nba nbaVar = (nba) objM2;
            boolean zF2 = p65Var.f(lcaVar3) | (i6 == 131072);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new mba(olbVar, lcaVar3);
                p65Var.j0(objM3);
            }
            mba mbaVar = (mba) objM3;
            e((dca) l78VarZ.getValue(), nhcVarF, nbaVar, mbaVar, r28Var, p65Var, (i3 >> 6) & i2, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH2 = p65Var.h(lcaVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(mbaVar);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                lcaVar4 = lcaVar3;
                objM4 = new zo5(lcaVar4, nhcVarF, resources, mbaVar, null, 20);
                p65Var.j0(objM4);
            } else {
                lcaVar4 = lcaVar3;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            lcaVar2 = lcaVar4;
        } else {
            p65Var.S();
            lcaVar2 = lcaVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new nb4(publicationReference, num, str, rbaVar, str2, olbVar, r28Var, lcaVar2, i);
        }
    }

    public static final void g(rba rbaVar, boolean z, nba nbaVar, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-167459547);
        int i2 = (i & 6) == 0 ? (p65Var.d(rbaVar.ordinal()) ? 4 : 2) | i : i;
        if ((i & 48) == 0) {
            i2 |= p65Var.g(z) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(nbaVar) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            boolean z2 = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                if (z) {
                    g04 entries = rba.getEntries();
                    ArrayList arrayList = new ArrayList();
                    for (Object obj : entries) {
                        if (((rba) obj) != rba.MOST_POPULAR) {
                            arrayList.add(obj);
                        }
                    }
                    objM2 = arrayList;
                } else {
                    objM2 = rba.getEntries();
                }
                p65Var.j0(objM2);
            }
            List list = (List) objM2;
            nwb nwbVar = new nwb(k(rbaVar, p65Var));
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new dq7(l78Var, 20);
                p65Var.j0(objM3);
            }
            tr7.a(nwbVar, (m45) objM3, bgf.N(o28.b, "publication_archive_sort_filter"), 0L, 0, 0, 0, p65Var, 48, 120);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = new dq7(l78Var, 21);
                p65Var.j0(objM4);
            }
            xp7.b(zBooleanValue, (m45) objM4, null, 0L, null, null, null, 0L, 0.0f, pxf.E(-2005244570, new ov2(list, rbaVar, nbaVar, l78Var, 15), p65Var), p65Var, 48, 2044);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w61(rbaVar, z, nbaVar, r28Var, i);
        }
    }

    public static final void h(nma nmaVar, String str, m45 m45Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1631258052);
        int i2 = i | (p65Var.f(nmaVar) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.h(m45Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            String str2 = nmaVar.b;
            String str3 = nmaVar.a;
            aq7.b(new bq7(str2, g76.L(str, str3), null, null, 28), m45Var, bgf.N(o28.b, "publication_archive_tags_filter_" + str3), 0L, 0L, p65Var, (i2 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 24);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 11, nmaVar, str, m45Var);
        }
    }

    public static final void i(List list, String str, nba nbaVar, r28 r28Var, x12 x12Var, int i) {
        nba nbaVar2;
        p65 p65Var;
        Object next;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(753302663);
        int i2 = (i & 6) == 0 ? (p65Var2.h(list) ? 4 : 2) | i : i;
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(str) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            nbaVar2 = nbaVar;
            i2 |= p65Var2.f(nbaVar2) ? 256 : 128;
        } else {
            nbaVar2 = nbaVar;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var2.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28Var);
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
            tp7.B(p65Var2, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM);
            }
            l78 l78Var = (l78) objM;
            boolean zF = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var2.f(list);
            Object objM2 = p65Var2.M();
            if (zF || objM2 == uobVar) {
                Iterator it2 = list.iterator();
                while (true) {
                    if (it2.hasNext()) {
                        next = it2.next();
                        if (g76.L(((nma) next).a, str)) {
                            break;
                        }
                    } else {
                        next = null;
                        break;
                    }
                }
                objM2 = (nma) next;
                p65Var2.j0(objM2);
            }
            nma nmaVar = (nma) objM2;
            boolean zF2 = p65Var2.f(list);
            Object objM3 = p65Var2.M();
            if (zF2 || objM3 == uobVar) {
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                for (Object obj : list) {
                    if (((nma) obj).c) {
                        arrayList2.add(obj);
                    } else {
                        arrayList.add(obj);
                    }
                }
                f09 f09Var = new f09(arrayList, arrayList2);
                p65Var2.j0(f09Var);
                objM3 = f09Var;
            }
            f09 f09Var2 = (f09) objM3;
            List list2 = (List) f09Var2.a;
            List list3 = (List) f09Var2.b;
            String strW = nmaVar != null ? nmaVar.b : null;
            if (strW == null) {
                strW = km4.w(p65Var2, -2065040200, R.string.publication_archive_all_topics, p65Var2, false);
            } else {
                p65Var2.Y(-2065041099);
                p65Var2.p(false);
            }
            nwb nwbVar = new nwb(strW);
            Object objM4 = p65Var2.M();
            if (objM4 == uobVar) {
                objM4 = new dq7(l78Var, 24);
                p65Var2.j0(objM4);
            }
            tr7.a(nwbVar, (m45) objM4, bgf.N(o28.b, "publication_archive_tags_filter"), 0L, 0, 0, 0, p65Var2, 48, 120);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM5 = p65Var2.M();
            if (objM5 == uobVar) {
                objM5 = new dq7(l78Var, 25);
                p65Var2.j0(objM5);
            }
            xp7.b(zBooleanValue, (m45) objM5, null, 0L, null, null, null, 0L, 0.0f, pxf.E(-817215002, new j84(str, (Object) nbaVar2, (Object) list, (Object) list2, (Object) list3, (Object) l78Var, 3), p65Var2), p65Var2, 48, 2044);
            p65Var = p65Var2;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 8, list, str, nbaVar, r28Var);
        }
    }

    public static final void j(List list, Integer num, nba nbaVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        nba nbaVar2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1918358598);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(list) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(num) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            nbaVar2 = nbaVar;
            i2 |= p65Var2.f(nbaVar2) ? 256 : 128;
        } else {
            nbaVar2 = nbaVar;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var2.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28Var);
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
            tp7.B(p65Var2, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM);
            }
            l78 l78Var = (l78) objM;
            String strValueOf = num != null ? String.valueOf(num.intValue()) : null;
            if (strValueOf == null) {
                strValueOf = km4.w(p65Var2, -532508630, R.string.publication_archive_all_years, p65Var2, false);
            } else {
                p65Var2.Y(-532509498);
                p65Var2.p(false);
            }
            nwb nwbVar = new nwb(strValueOf);
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = new dq7(l78Var, 22);
                p65Var2.j0(objM2);
            }
            tr7.a(nwbVar, (m45) objM2, bgf.N(o28.b, "publication_archive_years_filter"), 0L, 0, 0, 0, p65Var2, 48, 120);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var2.M();
            if (objM3 == uobVar) {
                objM3 = new dq7(l78Var, 23);
                p65Var2.j0(objM3);
            }
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, pxf.E(-217201447, new ov2(num, nbaVar2, list, l78Var, 16), p65Var2), p65Var2, 48, 2044);
            p65Var = p65Var2;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 9, list, num, nbaVar, r28Var);
        }
    }

    public static final String k(rba rbaVar, x12 x12Var) {
        p65 p65Var;
        int i;
        int i2;
        int i3 = oba.a[rbaVar.ordinal()];
        if (i3 == 1) {
            p65Var = (p65) x12Var;
            i = R.string.publication_latest;
            i2 = -1668524589;
        } else if (i3 == 2) {
            p65Var = (p65) x12Var;
            i = R.string.publication_earliest;
            i2 = -1668521931;
        } else {
            if (i3 != 3) {
                throw ho2.L((p65) x12Var, -1668525990, false);
            }
            p65Var = (p65) x12Var;
            i = R.string.publication_most_popular;
            i2 = -1668519079;
        }
        return km4.w(p65Var, i2, i, p65Var, false);
    }

    public static final void d(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1355558456);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarD = jfc.d(jfc.r(m40.V(bgf.N(r28Var, "loading_state"), p65Var, 0), 3), 1.0f);
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
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            long j4 = ((zo7) p65Var.j(kt7.b)).c;
            r28 r28VarD3 = jfc.d(w2g.G(o28Var, 24.0f, 26.0f, 24.0f, 0.0f, 8), 1.0f);
            omb ombVarA = nmb.a(new h70(16.0f, true, new z10(21)), z46.m, p65Var, 6);
            long j5 = p65Var.T;
            int i6 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarD3);
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
            double d = 1.0f;
            String str = eoLmc.BofaQElkLe;
            if (d <= 0.0d) {
                z16.a(str);
            }
            r28 r28VarE = jfc.e(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), 40.0f);
            amb ambVar = bmb.a;
            r28 r28VarY = r40.y(r28VarE, ambVar);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarY, j4, nr5Var), p65Var, 0);
            if (1.0f <= 0.0d) {
                z16.a(str);
            }
            dy0.a(flb.a0(r40.y(jfc.e(new sq6(1.0f <= Float.MAX_VALUE ? 1.0f : Float.MAX_VALUE, true), 40.0f), ambVar), j4, nr5Var), p65Var, 0);
            p65Var.p(true);
            dy0.a(flb.a0(r40.y(jfc.d(jfc.e(w2g.G(o28Var, 24.0f, 16.0f, 24.0f, 0.0f, 8), 40.0f), 1.0f), ambVar), j4, nr5Var), p65Var, 0);
            p65Var.Y(909440830);
            for (int i7 = 0; i7 < 5; i7++) {
                il7.l(stc.M, null, 0L, null, p65Var, 6, 14);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i, 6);
        }
    }
}
