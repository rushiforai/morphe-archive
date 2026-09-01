package defpackage;

import android.content.Context;
import android.content.res.Resources;
import androidx.core.widget.nRCC.nGxjfIr;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.graphql.type.AppConfigSupportStatus;
import com.medium.android.susi.ui.signUp.SignUpFragment;
import com.medium.reader.R;
import com.squareup.wire.sjIw.ezwlgQm;
import java.io.Closeable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class k50 {
    public static final mz1 a = new mz1(new e02(11), false, -1062111917);
    public static final mz1 b = new mz1(new a02(22), false, -223483238);
    public static final mz1 c = new mz1(new l02(29), false, -63499472);
    public static final mz1 d = new mz1(new m02(0), false, 1284306563);
    public static final mz1 e = new mz1(new u02(20), false, 2011832395);
    public static final j7g f = new j7g("id");
    public static final j7g g = new j7g("type");
    public static final /* synthetic */ int h = 0;
    public static final /* synthetic */ int i = 0;
    public static final /* synthetic */ int j = 0;
    public static final /* synthetic */ int k = 0;

    public static final void A(String str, String str2, String str3, String str4, String str5, lb4 lb4Var, r28 r28Var, qb4 qb4Var, x12 x12Var, int i2) {
        r28 r28Var2;
        qb4 qb4Var2;
        qb4 qb4Var3;
        ho2.Q(str, str2, str3, str5);
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1080675551);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(str3) ? 256 : 128) | (p65Var.f(str4) ? 2048 : 1024) | (p65Var.f(str5) ? 16384 : 8192) | (p65Var.f(lb4Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | 5767168;
        if (p65Var.P(i3 & 1, (4793491 & i3) != 4793490)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 896) == 256) | ((i3 & 7168) == 2048) | ((i3 & 57344) == 16384);
                Object objM = p65Var.M();
                if (z || objM == w12.a) {
                    s7 s7Var = new s7(str, str2, str3, str4, str5);
                    p65Var.j0(s7Var);
                    objM = s7Var;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    qb4Var3 = (qb4) to7.z(n1b.a.b(qb4.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    r28Var2 = o28.b;
                }
            } else {
                p65Var.S();
                r28Var2 = r28Var;
                qb4Var3 = qb4Var;
            }
            p65Var.q();
            z((pb4) guc.z(qb4Var3.h, p65Var, 0).getValue(), new ob4(lb4Var, qb4Var3), r28Var2, p65Var, 384);
            qb4Var2 = qb4Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            qb4Var2 = qb4Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new nb4(str, str2, str3, str4, str5, lb4Var, r28Var2, qb4Var2, i2);
        }
    }

    public static final void B(int i2, int i3, long j2, x12 x12Var, r28 r28Var) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-452919245);
        int i4 = i3 | (p65Var2.d(i2) ? 4 : 2) | (p65Var2.e(j2) ? 32 : 16);
        if (p65Var2.P(i4 & 1, (i4 & 147) != 146)) {
            mkd mkdVarA = mkd.a(((bu7) p65Var2.j(jt7.c)).l, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            omb ombVarA = nmb.a(new h70(24.0f, true, new z10(21)), z46.m, p65Var2, 6);
            long j3 = p65Var2.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, ombVarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            jjd.b(vo7.R(p65Var2, i2), bgf.N(new sq6(1.0f, true), "friend_link_row_title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var2, 0, 0, 131068);
            jjd.b(dq1.g(Long.valueOf(j2)), bgf.N(o28.b, "friend_link_row_count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var2, 48, 0, 131068);
            p65Var = p65Var2;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(i2, j2, r28Var, i3);
        }
    }

    public static final void C(t35 t35Var, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        boolean z;
        String strW;
        t35Var.getClass();
        s35 s35Var = t35Var.b;
        Long l = t35Var.a;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(343076284);
        int i3 = i2 | (p65Var.f(t35Var) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(w2g.E(o28Var, 24.0f, 0.0f, 2), "friend_links_section");
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            jjd.b(vo7.R(p65Var, R.string.post_stats_friend_links_title), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.u(p65Var), p65Var, 0, 0, 131070);
            hp7.t(p65Var, jfc.e(o28Var, 4.0f));
            if (l == null || s35Var != s35.Hourly) {
                z = false;
                if (l == null || s35Var != s35.Daily) {
                    strW = km4.w(p65Var, 1973590014, R.string.stats_updated_daily, p65Var, false);
                } else {
                    p65Var.Y(1973581407);
                    strW = vo7.Q(R.string.stats_from_to_utc_updated_daily, new Object[]{vo7.v(l.longValue(), p65Var), vo7.R(p65Var, R.string.common_today)}, p65Var);
                    p65Var.p(false);
                }
            } else {
                p65Var.Y(1973569568);
                z = false;
                strW = vo7.Q(R.string.stats_from_to_utc_updated_hourly, new Object[]{vo7.v(l.longValue(), p65Var), vo7.R(p65Var, R.string.common_today)}, p65Var);
                p65Var.p(false);
            }
            boolean z2 = z;
            jjd.b(strW, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.t(p65Var), p65Var, 0, 0, 131070);
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            p65Var.Y(1973598209);
            kx kxVar = new kx();
            kxVar.d(vo7.R(p65Var, R.string.post_stats_friend_links_description));
            kxVar.d(" ");
            p65Var.Y(1973602969);
            wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14);
            boolean z3 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 ? true : z2;
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                objM = new al4(1, m45Var);
                p65Var.j0(objM);
            }
            int iV = ho2.v("learn_more", wjdVar, (e07) objM, kxVar);
            try {
                kxVar.d(vo7.R(p65Var, R.string.post_stats_friend_links_learn_more));
                kxVar.f(iV);
                p65Var.p(z2);
                mx mxVarI = kxVar.i();
                p65Var.p(z2);
                jjd.c(mxVarI, null, 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, to7.s(p65Var), p65Var, 0, 0, 262142);
                p65Var = p65Var;
                hp7.t(p65Var, jfc.e(o28Var, 32.0f));
                wv1 wv1VarA2 = uv1.a(new h70(12.0f, true, new z10(21)), yq0Var, p65Var, 6);
                long j3 = p65Var.T;
                int i5 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, o28Var);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, wv1VarA2);
                tp7.B(p65Var, cuVar2, i89VarL2);
                ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR2);
                B(R.string.post_stats_friend_links_shared_by_author, 384, t35Var.c, p65Var, bgf.N(o28Var, "friend_link_row_author"));
                B(R.string.post_stats_friend_links_shared_by_member, 384, t35Var.d, p65Var, bgf.N(o28Var, "friend_link_row_member"));
                p65Var.p(true);
                p65Var.p(true);
                r28Var2 = o28Var;
            } catch (Throwable th) {
                kxVar.f(iV);
                throw th;
            }
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 25, t35Var, m45Var, r28Var2);
        }
    }

    public static final void D(String str, r28 r28Var, long j2, m45 m45Var, x12 x12Var, int i2, int i3) {
        int i4;
        p65 p65Var;
        long j3;
        r28 r28Var2;
        int i5;
        long j4;
        r28 r28Var3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-323277640);
        if ((i2 & 6) == 0) {
            i4 = i2 | (p65Var2.f(str) ? 4 : 2);
        } else {
            i4 = i2;
        }
        long j5 = j2;
        int i6 = i4 | 48 | (((i3 & 4) == 0 && p65Var2.e(j5)) ? 256 : 128) | (p65Var2.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i6 & 1, (i6 & 1171) != 1170)) {
            p65Var2.U();
            if ((i2 & 1) == 0 || p65Var2.z()) {
                int i7 = i3 & 4;
                o28 o28Var = o28.b;
                if (i7 != 0) {
                    j5 = ((zo7) p65Var2.j(kt7.b)).o;
                    i6 &= -897;
                }
                i5 = i6;
                j4 = j5;
                r28Var3 = o28Var;
            } else {
                p65Var2.S();
                if ((i3 & 4) != 0) {
                    i6 &= -897;
                }
                i5 = i6;
                j4 = j5;
                r28Var3 = r28Var;
            }
            p65Var2.q();
            p65Var = p65Var2;
            jjd.b(str, w2g.F(jfc.d(hlg.r(flb.a0(r28Var3, ((zo7) p65Var2.j(kt7.b)).a, rv8.r), false, null, new vkb(0), m45Var, 11), 1.0f), 24.0f, 14.0f, 24.0f, 14.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).m, j4, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, i5 & 14, 0, 131068);
            j3 = j4;
            r28Var2 = r28Var3;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            j3 = j5;
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new zb(str, r28Var2, j3, m45Var, i2, i3, 0);
        }
    }

    public static final void E(final pdc pdcVar, final cbc cbcVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-454624957);
        int i3 = i2 | (p65Var2.f(pdcVar) ? 4 : 2) | (p65Var2.f(cbcVar) ? 32 : 16) | 384;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var2.Y(1192087200);
            StringBuilder sb = new StringBuilder(16);
            ArrayList arrayListV = wgd.v();
            new ArrayList();
            String strR = vo7.R(p65Var2, R.string.common_terms_of_service);
            String strR2 = vo7.R(p65Var2, R.string.common_privacy_policy);
            String strQ = vo7.Q(R.string.susi_auth_sign_up_terms_privacy_message, new Object[]{strR, strR2}, p65Var2);
            int iZ = muc.Z(strQ, strR, 0, false, 6);
            int length = strR.length() + iZ;
            int iZ2 = muc.Z(strQ, strR2, 0, false, 6);
            int length2 = strR2.length() + iZ2;
            sb.append(strQ);
            ohd ohdVar = ohd.c;
            wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), null, 14);
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i5 = i3 & 14;
            boolean z = (i4 == 32) | (i5 == 4);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                final int i6 = 0;
                objM = new e07() { // from class: bbc
                    @Override // defpackage.e07
                    public final void a(d07 d07Var) {
                        int i7 = i6;
                        pdc pdcVar2 = pdcVar;
                        cbc cbcVar2 = cbcVar;
                        d07Var.getClass();
                        switch (i7) {
                            case 0:
                                String str = pdcVar2.f;
                                str.getClass();
                                lig ligVar = ((SignUpFragment) cbcVar2.a.a).u0;
                                if (ligVar != null) {
                                    ligVar.Y(str);
                                    return;
                                } else {
                                    g76.g0("susiRouter");
                                    throw null;
                                }
                            default:
                                String str2 = pdcVar2.f;
                                str2.getClass();
                                lig ligVar2 = ((SignUpFragment) cbcVar2.a.a).u0;
                                if (ligVar2 != null) {
                                    ligVar2.X(str2);
                                    return;
                                } else {
                                    g76.g0("susiRouter");
                                    throw null;
                                }
                        }
                    }
                };
                p65Var2.j0(objM);
            }
            b07 b07Var = new b07("terms_of_service", wjdVar, (e07) objM);
            int i7 = 8;
            arrayListV.add(new jx(b07Var, iZ, length, i7));
            wjd wjdVar2 = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohdVar, (i3c) null, 61439), null, 14);
            boolean z2 = (i5 == 4) | (i4 == 32);
            Object objM2 = p65Var2.M();
            if (z2 || objM2 == uobVar) {
                final int i8 = 1;
                objM2 = new e07() { // from class: bbc
                    @Override // defpackage.e07
                    public final void a(d07 d07Var) {
                        int i72 = i8;
                        pdc pdcVar2 = pdcVar;
                        cbc cbcVar2 = cbcVar;
                        d07Var.getClass();
                        switch (i72) {
                            case 0:
                                String str = pdcVar2.f;
                                str.getClass();
                                lig ligVar = ((SignUpFragment) cbcVar2.a.a).u0;
                                if (ligVar != null) {
                                    ligVar.Y(str);
                                    return;
                                } else {
                                    g76.g0("susiRouter");
                                    throw null;
                                }
                            default:
                                String str2 = pdcVar2.f;
                                str2.getClass();
                                lig ligVar2 = ((SignUpFragment) cbcVar2.a.a).u0;
                                if (ligVar2 != null) {
                                    ligVar2.X(str2);
                                    return;
                                } else {
                                    g76.g0("susiRouter");
                                    throw null;
                                }
                        }
                    }
                };
                p65Var2.j0(objM2);
            }
            arrayListV.add(new jx(new b07("privacy_policy", wjdVar2, (e07) objM2), iZ2, length2, i7));
            String string = sb.toString();
            ArrayList arrayList = new ArrayList(arrayListV.size());
            int size = arrayListV.size();
            for (int i9 = 0; i9 < size; i9 = lv8.i(sb, (jx) arrayListV.get(i9), arrayList, i9, 1)) {
            }
            mx mxVar = new mx(string, arrayList);
            p65Var2.p(false);
            mkd mkdVar = ((bu7) p65Var2.j(jt7.c)).m;
            o28 o28Var = o28.b;
            p65Var = p65Var2;
            jjd.c(mxVar, bgf.N(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f), "legal_text"), 0L, 0L, 0L, new jgd(3), 0L, 0, false, 0, 0, null, null, mkdVar, p65Var, 0, 0, 261116);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new zac(pdcVar, cbcVar, r28Var2, i2, 1);
        }
    }

    public static final void F(k47 k47Var, u37 u37Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        k47Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1653525174);
        int i3 = i2 | (p65Var.f(k47Var) ? 4 : 2) | (p65Var.f(u37Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarJ = rv8.J(jfc.c, jq7.t(p65Var), null);
            p65Var.Y(-1003410150);
            p65Var.Y(212064437);
            p65Var.p(false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var2 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                fr0 fr0Var = new fr0(l78Var2, hl7Var, m62Var, l78Var, 12);
                p65Var.j0(fr0Var);
                objM6 = fr0Var;
            }
            zk7 zk7Var = (zk7) objM6;
            Object objM7 = p65Var.M();
            int i4 = 12;
            if (objM7 == uobVar) {
                objM7 = new gr0(l78Var, m62Var, 12);
                p65Var.j0(objM7);
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new hr0(hl7Var, i4);
                p65Var.j0(objM8);
            }
            hlg.j(wxb.a(r28VarJ, false, (x45) objM8), pxf.E(1200550679, new je2(l78Var2, z52Var, m45Var, u37Var, k47Var, 1), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
            r28Var2 = o28.b;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i2, 3, k47Var, u37Var, r28Var2);
        }
    }

    public static final void G(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(813233812);
        int i3 = i2 | 6;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            o28 o28Var = o28.b;
            r28 r28VarE = w2g.E(jfc.r(jfc.d(o28Var, 1.0f), 3), 24.0f, 0.0f, 2);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarE);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            xz5.o(iy0.a.a(jfc.l(w2g.E(o28Var, 0.0f, 16.0f, 1), 32.0f), z46.h), ((Boolean) p65Var.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 0.0f, 0L, 0L, 0, p65Var, 0, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
            p65Var.p(true);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i2, 9);
        }
    }

    public static final void H(k57 k57Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1356839102);
        int i3 = (p65Var.f(k57Var) ? 4 : 2) | i2 | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            int i4 = k57Var.b;
            boolean z = k57Var.c;
            mz1 mz1Var = dm2.d;
            o28 o28Var = o28.b;
            fp7.c(i4, z, o28Var, mz1Var, p65Var, 3456);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(k57Var, r28Var, i2, 20);
        }
    }

    public static final void I(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1294986779);
        boolean z = false;
        int i3 = 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarN = bgf.N(m40.V(r28Var, p65Var, 6), "loading_state");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
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
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(1054910053);
            int iR = 0;
            while (iR < 10) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, z);
                long j3 = p65Var.T;
                int i5 = (int) (j3 ^ (j3 >>> c2));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var, cuVar, zk7VarC);
                cu cuVar2 = q12.e;
                tp7.B(p65Var, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i5);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                char c3 = c2;
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, z);
                long j4 = p65Var.T;
                int i6 = (int) (j4 ^ (j4 >>> c3));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                il7.l(stc.M, null, 0L, null, p65Var, 6, 14);
                iR = wgd.r(p65Var, true, true, iR, 1);
                c2 = c3;
                z = false;
            }
            p65Var.p(z);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, i3);
        }
    }

    public static final void J(i9e i9eVar, w9e w9eVar, l8e l8eVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        int i3;
        boolean z;
        boolean z2;
        String strQ;
        int i4;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-439677970);
        int i5 = i2 | (p65Var2.f(i9eVar) ? 4 : 2) | (p65Var2.d(w9eVar.ordinal()) ? 32 : 16) | (p65Var2.f(l8eVar) ? 256 : 128);
        if (p65Var2.P(i5 & 1, (i5 & 1171) != 1170)) {
            r28 r28VarX = ho2.x((jp7) p65Var2.j(kt7.a), bgf.N(r28Var, "empty_state"), 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var2.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarX);
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
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var2.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            if (i9eVar.a) {
                p65Var2.Y(-410437368);
                int i8 = o8e.a[w9eVar.ordinal()];
                if (i8 == 1) {
                    i4 = R.string.user_activity_empty_current_user;
                } else if (i8 == 2) {
                    i4 = R.string.user_activity_empty_claps_current_user;
                } else if (i8 == 3) {
                    i4 = R.string.user_activity_empty_responses_current_user;
                } else {
                    if (i8 != 4) {
                        ygf.a();
                        return;
                    }
                    i4 = R.string.user_activity_empty_highlights_current_user;
                }
                strQ = vo7.R(p65Var2, i4);
                p65Var2.p(false);
                z = false;
                z2 = true;
            } else {
                p65Var2.Y(-410339749);
                int i9 = o8e.a[w9eVar.ordinal()];
                if (i9 == 1) {
                    i3 = R.string.user_activity_empty_other_user;
                } else if (i9 == 2) {
                    i3 = R.string.user_activity_empty_claps_other_user;
                } else if (i9 == 3) {
                    i3 = R.string.user_activity_empty_responses_other_user;
                } else {
                    if (i9 != 4) {
                        ygf.a();
                        return;
                    }
                    i3 = R.string.user_activity_empty_highlights_other_user;
                }
                String strW = i9eVar.b;
                if (strW == null) {
                    z = false;
                    strW = km4.w(p65Var2, 1233693197, R.string.common_unknown_user, p65Var2, false);
                } else {
                    z = false;
                    p65Var2.Y(1233692639);
                    p65Var2.p(false);
                }
                z2 = true;
                Object[] objArr = new Object[1];
                objArr[z ? 1 : 0] = strW;
                strQ = vo7.Q(i3, objArr, p65Var2);
                p65Var2.p(z);
            }
            boolean z3 = z2;
            String str = strQ;
            boolean z4 = z;
            jjd.b(str, iy0.a.a(jfc.d(o28Var, 1.0f), ar0Var), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).n, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 130044);
            p65Var = p65Var2;
            p65Var.p(z3);
            p65Var.p(z3);
            Object[] objArr2 = (i5 & 896) == 256 ? z3 ? 1 : 0 : z4 ? 1 : 0;
            Object objM = p65Var.M();
            if (objArr2 != null || objM == w12.a) {
                objM = new i8e(l8eVar, null, z3 ? 1 : 0);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i2, 20, i9eVar, w9eVar, l8eVar, r28Var);
        }
    }

    public static final void K(r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1352200294);
        int i3 = i2 | 6;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarV = m40.V(wgf.R(jfc.c, new yrb(0), false, 12), p65Var, 0);
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarV);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            long j5 = ((zo7) p65Var.j(kt7.b)).o;
            r28 r28VarM = jfc.m(w2g.G(o28Var, 24.0f, 32.0f, 24.0f, 0.0f, 8), 255.0f, 40.0f);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarM, j5, nr5Var), p65Var, 0);
            r28 r28VarD2 = jfc.d(w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8), 1.0f);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j6 = p65Var.T;
            int i7 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            dy0.a(flb.a0(r40.y(jfc.l(o28Var, 44.0f), bmb.a), j5, nr5Var), p65Var, 0);
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j7 = p65Var.T;
            int i8 = (int) (j7 ^ (j7 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL5);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            r28Var2 = o28Var;
            dy0.a(flb.a0(jfc.m(w2g.G(r28Var2, 12.0f, 4.0f, 0.0f, 0.0f, 12), 120.0f, 16.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.m(w2g.G(r28Var2, 12.0f, 4.0f, 0.0f, 0.0f, 12), 80.0f, 16.0f), j5, nr5Var), p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 40.0f, 40.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 8.0f, 32.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 8.0f, 128.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 32.0f, 40.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 8.0f, 32.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 8.0f, 24.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 8.0f, 56.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 8.0f, 128.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 40.0f, 40.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 8.0f, 32.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 8.0f, 128.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 32.0f, 40.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 8.0f, 32.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 8.0f, 24.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 8.0f, 56.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(r28Var2, 24.0f, 8.0f, 128.0f, 0.0f, 8), 1.0f), 24.0f), j5, nr5Var), p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var2, i2, 27);
        }
    }

    public static final void L(j9e j9eVar, l8e l8eVar, r28 r28Var, x12 x12Var, int i2) {
        String strQ;
        boolean z;
        boolean z2 = j9eVar.a;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-496602286);
        int i3 = 2;
        int i4 = i2 | (p65Var.f(j9eVar) ? 4 : 2) | (p65Var.f(l8eVar) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            int i5 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z3 = i5 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            n92 n92Var = null;
            if (z3 || objM == uobVar) {
                objM = new i8e(l8eVar, n92Var, i3);
                p65Var.j0(objM);
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM, c1eVar);
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "private_state"), 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
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
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarA = iy0.a.a(jfc.d(o28Var, 1.0f), ar0Var);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j4 = p65Var.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarA);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            if (z2) {
                strQ = km4.w(p65Var, 625433138, R.string.user_activity_private_current_user, p65Var, false);
            } else {
                p65Var.Y(625533113);
                String strW = j9eVar.b;
                if (strW == null) {
                    strW = km4.w(p65Var, 1682750625, R.string.common_unknown_user, p65Var, false);
                } else {
                    p65Var.Y(1682750067);
                    p65Var.p(false);
                }
                strQ = vo7.Q(R.string.user_activity_private_other_user, new Object[]{strW}, p65Var);
                p65Var.p(false);
            }
            jgd jgdVar = new jgd(3);
            mkd mkdVar = ((bu7) p65Var.j(jt7.c)).n;
            sn3 sn3Var = kt7.b;
            jjd.b(strQ, null, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, mkd.a(mkdVar, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 130046);
            p65Var = p65Var;
            if (z2) {
                p65Var.Y(626029175);
                boolean z4 = ((i4 & 14) == 4) | (i5 == 32);
                Object objM2 = p65Var.M();
                if (z4 || objM2 == uobVar) {
                    objM2 = new nbb(l8eVar, 24, j9eVar);
                    p65Var.j0(objM2);
                }
                String strR = vo7.R(p65Var, R.string.user_activity_private_change_settings);
                xn7 xn7Var = xn7.S;
                jy8 jy8Var = h11.a;
                long j5 = uu1.g;
                fo7.k(384, 104, h11.a(j5, ((zo7) p65Var.j(sn3Var)).o, j5, uu1.b(0.5f, ((zo7) p65Var.j(sn3Var)).o), p65Var, 0), p65Var, (m45) objM2, xn7Var, null, strR, false, false);
                p65Var = p65Var;
                z = false;
            } else {
                z = false;
                p65Var.Y(599855565);
            }
            p65Var.p(z);
            b09.H(p65Var, true, true, true);
            boolean z5 = i5 == 32 ? true : z;
            Object objM3 = p65Var.M();
            if (z5 || objM3 == uobVar) {
                objM3 = new i8e(l8eVar, null, 3);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, c1eVar);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 13, j9eVar, l8eVar, r28Var);
        }
    }

    public static final void M(String str, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2077650610);
        int i3 = (p65Var.f(str != null ? new ax5(str) : null) ? 4 : 2) | i2;
        int i4 = 0;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            amb ambVarA = bmb.a(2.0f);
            sn3 sn3Var = l36.a;
            if (!((Boolean) p65Var.j(sn3Var)).booleanValue() && str != null) {
                p65Var.Y(537563406);
                sn3 sn3Var2 = eo.b;
                nx5 nx5Var = new nx5((Context) p65Var.j(sn3Var2));
                nx5Var.c = new ax5(str);
                hlg.X(nx5Var, (Context) p65Var.j(sn3Var2));
                ur7.a(nx5Var.a(), null, r40.y(bo.B(r28Var, 1.0f, gsa.b0(p65Var), ambVarA), ambVarA), null, null, 0.0f, null, 0, p65Var, 48, 2040);
                p65Var.p(false);
            } else if (((Boolean) p65Var.j(sn3Var)).booleanValue()) {
                p65Var.Y(537587340);
                dy0.a(flb.a0(bo.B(r28Var, 1.0f, gsa.b0(p65Var), ambVarA), ((zo7) p65Var.j(kt7.b)).b, ambVarA), p65Var, 0);
                p65Var.p(false);
            } else {
                p65Var.Y(537579841);
                dy0.a(flb.a0(r28Var, ((zo7) p65Var.j(kt7.b)).b, ambVarA), p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fe(str, r28Var, i2, i4);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0031  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0033  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x003c  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x016d  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0179  */
    /* JADX WARN: Removed duplicated region for block: B:37:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void N(int r31, int r32, defpackage.x12 r33, defpackage.r28 r34, java.lang.String r35, java.lang.String r36) {
        /*
            Method dump skipped, instruction units count: 389
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k50.N(int, int, x12, r28, java.lang.String, java.lang.String):void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:101:0x0448  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x044a  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x045b  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x04c1  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0375  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0378  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x037c  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0388  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x039c  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x03a5  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x03b4  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x03b6  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x03bf  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x03f4  */
    /* JADX WARN: Type inference failed for: r11v15 */
    /* JADX WARN: Type inference failed for: r11v16, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r11v23 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void O(defpackage.pdc r45, defpackage.cbc r46, defpackage.r28 r47, defpackage.x12 r48, int r49) {
        /*
            Method dump skipped, instruction units count: 1263
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k50.O(pdc, cbc, r28, x12, int):void");
    }

    public static final void P(pdc pdcVar, cbc cbcVar, r28 r28Var, nhc nhcVar, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        pdcVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-429029815);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(pdcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(cbcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(nhcVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new dsb(14);
                p65Var2.j0(objM);
            }
            r28 r28VarN = bgf.N(wxb.a(r28Var, false, (x45) objM), "sign_up_screen");
            mz1 mz1VarE = pxf.E(-1232000691, new abc(cbcVar), p65Var2);
            mz1 mz1VarE2 = pxf.E(-733443889, new w87(nhcVar, 27), p65Var2);
            y0e y0eVarV = hk7.v(p65Var2);
            WeakHashMap weakHashMap = f5f.w;
            int i4 = i3;
            pr7.b(r28VarN, mz1VarE, null, mz1VarE2, null, 0, 0L, 0L, new y0e(y0eVarV, tr7.o(p65Var2).c), pxf.E(1132202840, new qg9(pdcVar, 24, cbcVar), p65Var2), p65Var2, 805309488, 244);
            p65Var = p65Var2;
            boolean z = (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                objM2 = new obb(cbcVar, null, 6);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(pdcVar, cbcVar, r28Var, nhcVar, i2, 17);
        }
    }

    public static final void Q(String str, String str2, String str3, SusiDestination susiDestination, boolean z, hha hhaVar, r28 r28Var, sdc sdcVar, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        sdc sdcVar2;
        int i3;
        r28 r28Var3;
        b09.I(str, str2, str3);
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(697952997);
        int i4 = i2 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(str2) ? 32 : 16) | (p65Var2.f(str3) ? 256 : 128) | (p65Var2.f(susiDestination) ? 2048 : 1024) | (p65Var2.g(z) ? 16384 : 8192) | (p65Var2.f(hhaVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | 5767168;
        if (p65Var2.P(i4 & 1, (4793491 & i4) != 4793490)) {
            p65Var2.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var2.z()) {
                boolean z2 = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 896) == 256) | ((i4 & 7168) == 2048) | ((57344 & i4) == 16384);
                Object objM = p65Var2.M();
                if (z2 || objM == uobVar) {
                    xx7 xx7Var = new xx7(str, str2, str3, susiDestination, z);
                    p65Var2.j0(xx7Var);
                    objM = xx7Var;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var2);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                sdc sdcVar3 = (sdc) to7.z(n1b.a.b(sdc.class), wueVarA, t40.E(wueVarA, p65Var2), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var2);
                i3 = i4 & (-29360129);
                r28Var3 = o28.b;
                sdcVar2 = sdcVar3;
            } else {
                p65Var2.S();
                i3 = i4 & (-29360129);
                r28Var3 = r28Var;
                sdcVar2 = sdcVar;
            }
            int i6 = i3;
            p65Var2.q();
            l78 l78VarM = no7.m(sdcVar2.n, p65Var2);
            uua uuaVar = sdcVar2.p;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var2);
            }
            nhc nhcVar = (nhc) objM2;
            akc akcVar = (akc) p65Var2.j(z22.r);
            Resources resources = (Resources) p65Var2.j(eo.c);
            P((pdc) l78VarM.getValue(), new cbc(hhaVar, sdcVar2), r28Var3, nhcVar, p65Var2, 3456);
            r28 r28Var4 = r28Var3;
            p65Var = p65Var2;
            boolean zH = p65Var.h(uuaVar) | p65Var.f(akcVar) | ((458752 & i6) == 131072) | p65Var.h(resources);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                uk8 uk8Var = new uk8((Object) uuaVar, nhcVar, resources, (Object) akcVar, (Object) hhaVar, (n92) null, 27);
                p65Var.j0(uk8Var);
                objM3 = uk8Var;
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            r28Var2 = r28Var4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
            sdcVar2 = sdcVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sl1(str, str2, str3, susiDestination, z, hhaVar, r28Var2, sdcVar2, i2);
        }
    }

    public static final void R(cbc cbcVar, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(364891098);
        int i3 = (p65Var2.f(cbcVar) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new j5c(0, cbcVar, cbc.class, "onBackPressed", "onBackPressed()V", 0, 20);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.g(null, null, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 0, 507);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new abc(cbcVar, i2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:58:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x012e  */
    /* JADX WARN: Removed duplicated region for block: B:74:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void S(defpackage.m9e r24, defpackage.nhc r25, defpackage.kv6 r26, defpackage.l8e r27, defpackage.n8e r28, defpackage.sh9 r29, defpackage.r28 r30, defpackage.x12 r31, int r32, int r33) {
        /*
            Method dump skipped, instruction units count: 323
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k50.S(m9e, nhc, kv6, l8e, n8e, sh9, r28, x12, int, int):void");
    }

    public static final void T(String str, String str2, bo4 bo4Var, h8e h8eVar, r28 r28Var, q9e q9eVar, x12 x12Var, int i2) {
        q9e q9eVar2;
        int i3;
        q9e q9eVar3;
        str.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1971035416);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.h(bo4Var) ? 256 : 128) | (p65Var.f(h8eVar) ? 2048 : 1024) | ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 24);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    q9e q9eVar4 = (q9e) to7.z(n1b.a.b(q9e.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-458753);
                    q9eVar3 = q9eVar4;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-458753);
                q9eVar3 = q9eVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(q9eVar3.s, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            kv6 kv6VarA = pv6.a(p65Var);
            int i6 = i3 & 7168;
            boolean zF = (i6 == 2048) | p65Var.f(q9eVar3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new l8e(h8eVar, q9eVar3);
                p65Var.j0(objM2);
            }
            l8e l8eVar = (l8e) objM2;
            boolean z2 = i6 == 2048;
            Object objM3 = p65Var.M();
            if (z2 || objM3 == uobVar) {
                objM3 = new n8e(h8eVar);
                p65Var.j0(objM3);
            }
            n8e n8eVar = (n8e) objM3;
            boolean zF2 = p65Var.f(q9eVar3) | (i6 == 2048);
            Object objM4 = p65Var.M();
            if (zF2 || objM4 == uobVar) {
                objM4 = new m8e(h8eVar, q9eVar3);
                p65Var.j0(objM4);
            }
            m8e m8eVar = (m8e) objM4;
            q9e q9eVar5 = q9eVar3;
            S((m9e) l78VarZ.getValue(), nhcVarF, kv6VarA, l8eVar, n8eVar, m8eVar, r28Var, p65Var, 1572864, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(q9eVar5) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(m8eVar);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar) {
                objM5 = new gbd(q9eVar5, nhcVarF, resources, m8eVar, null, 11);
                p65Var.j0(objM5);
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM5, c1eVar);
            w9e w9eVar = ((m9e) l78VarZ.getValue()).b;
            boolean zF3 = p65Var.f(kv6VarA);
            Object objM6 = p65Var.M();
            n92 n92Var = null;
            if (zF3 || objM6 == uobVar) {
                objM6 = new jv6(kv6VarA, n92Var, 2);
                p65Var.j0(objM6);
            }
            kyd.k(p65Var, (b55) objM6, w9eVar);
            boolean zH2 = p65Var.h(bo4Var) | p65Var.h(q9eVar5) | p65Var.f(kv6VarA);
            Object objM7 = p65Var.M();
            if (zH2 || objM7 == uobVar) {
                j5d j5dVar = new j5d(bo4Var, q9eVar5, kv6VarA, n92Var, 9);
                p65Var.j0(j5dVar);
                objM7 = j5dVar;
            }
            kyd.k(p65Var, (b55) objM7, c1eVar);
            q9eVar2 = q9eVar5;
        } else {
            p65Var.S();
            q9eVar2 = q9eVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(str, str2, bo4Var, h8eVar, r28Var, q9eVar2, i2, 27);
        }
    }

    public static final void U(String str, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1912347441);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(str != null ? new ax5(str) : null) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            amb ambVar = bmb.a;
            sn3 sn3Var = l36.a;
            if (!((Boolean) p65Var.j(sn3Var)).booleanValue() && str != null) {
                p65Var.Y(-480105546);
                nx5 nx5Var = new nx5((Context) p65Var.j(eo.b));
                nx5Var.c = new ax5(str);
                hlg.W(nx5Var);
                ur7.a(nx5Var.a(), null, bo.B(r28Var, 1.0f, gsa.b0(p65Var), ambVar), null, null, 0.0f, null, 0, p65Var, 48, 2040);
                p65Var.p(false);
            } else if (((Boolean) p65Var.j(sn3Var)).booleanValue()) {
                p65Var.Y(-480081905);
                dy0.a(flb.a0(bo.B(r28Var, 1.0f, gsa.b0(p65Var), ambVar), ((zo7) p65Var.j(kt7.b)).b, ambVar), p65Var, 0);
                p65Var.p(false);
            } else {
                p65Var.Y(-1997915762);
                dy0.a(flb.a0(r28Var, ((zo7) p65Var.j(kt7.b)).b, ambVar), p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ee(str, r28Var, i2);
        }
    }

    public static final Object V(a43 a43Var, m45 m45Var, p92 p92Var) {
        Object obj;
        eh8 eh8VarU0;
        Object objG;
        hj0 hj0Var;
        if (((q28) a43Var).a.n) {
            q28 q28Var = (q28) a43Var;
            if (!q28Var.a.n) {
                b26.b("visitAncestors called on an unattached node");
            }
            q28 q28Var2 = q28Var.a.e;
            aq6 aq6VarV0 = flb.v0(a43Var);
            loop0: while (true) {
                obj = null;
                if (aq6VarV0 == null) {
                    break;
                }
                if ((((q28) aq6VarV0.F.g).d & 524288) != 0) {
                    while (q28Var2 != null) {
                        if ((q28Var2.c & 524288) != 0) {
                            q28 q28VarQ0 = q28Var2;
                            o78 o78Var = null;
                            while (q28VarQ0 != null) {
                                if (q28VarQ0 instanceof my0) {
                                    obj = q28VarQ0;
                                    break loop0;
                                }
                                if ((q28VarQ0.c & 524288) != 0 && (q28VarQ0 instanceof b43)) {
                                    int i2 = 0;
                                    for (q28 q28Var3 = ((b43) q28VarQ0).p; q28Var3 != null; q28Var3 = q28Var3.f) {
                                        if ((q28Var3.c & 524288) != 0) {
                                            i2++;
                                            if (i2 == 1) {
                                                q28VarQ0 = q28Var3;
                                            } else {
                                                if (o78Var == null) {
                                                    o78Var = new o78(new q28[16]);
                                                }
                                                if (q28VarQ0 != null) {
                                                    o78Var.b(q28VarQ0);
                                                    q28VarQ0 = null;
                                                }
                                                o78Var.b(q28Var3);
                                            }
                                        }
                                    }
                                    if (i2 == 1) {
                                    }
                                }
                                q28VarQ0 = flb.q0(o78Var);
                            }
                        }
                        q28Var2 = q28Var2.e;
                    }
                }
                aq6VarV0 = aq6VarV0.v();
                q28Var2 = (aq6VarV0 == null || (hj0Var = aq6VarV0.F) == null) ? null : (ffd) hj0Var.f;
            }
            my0 my0Var = (my0) obj;
            if (my0Var != null && (objG = my0Var.G((eh8VarU0 = flb.u0(a43Var)), new cn(m45Var, 4, eh8VarU0), p92Var)) == tb2.COROUTINE_SUSPENDED) {
                return objG;
            }
        }
        return c1e.a;
    }

    public static final boolean W(es4 es4Var, boolean z) {
        int i2 = hs4.a[es4Var.N0().ordinal()];
        if (i2 != 1) {
            if (i2 == 2) {
                return z;
            }
            if (i2 == 3) {
                es4 es4VarO = rx0.O(es4Var);
                if (!(es4VarO != null ? W(es4VarO, z) : true)) {
                    return false;
                }
                es4Var.J0(zr4.ActiveParent, zr4.Inactive);
                return true;
            }
            if (i2 != 4) {
                ygf.a();
                return false;
            }
        }
        return true;
    }

    public static final void X(Closeable closeable, Throwable th) {
        if (closeable != null) {
            if (th == null) {
                closeable.close();
                return;
            }
            try {
                closeable.close();
            } catch (Throwable th2) {
                kyd.D(th, th2);
            }
        }
    }

    public static final ExecutorService Y(boolean z) {
        ExecutorService executorServiceNewFixedThreadPool = Executors.newFixedThreadPool(Math.max(2, Math.min(Runtime.getRuntime().availableProcessors() - 1, 4)), new s32(z));
        executorServiceNewFixedThreadPool.getClass();
        return executorServiceNewFixedThreadPool;
    }

    public static final void Z(f58 f58Var, e61 e61Var, ez0 ez0Var, float f2, i3c i3cVar, ohd ohdVar, pxf pxfVar) {
        ArrayList arrayList = f58Var.h;
        int size = arrayList.size();
        for (int i2 = 0; i2 < size; i2++) {
            y19 y19Var = (y19) arrayList.get(i2);
            y19Var.a.g(e61Var, ez0Var, f2, i3cVar, ohdVar, pxfVar);
            e61Var.p(0.0f, y19Var.a.b());
        }
    }

    public static final void a(w9e w9eVar, List list, l8e l8eVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-897452571);
        int i3 = i2 | (p65Var.d(w9eVar.ordinal()) ? 4 : 2) | (p65Var.h(list) ? 32 : 16) | (p65Var.f(l8eVar) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            o28 o28Var = o28.b;
            r28 r28VarF = w2g.F(o28Var, 24.0f, 24.0f, 24.0f, 8.0f);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarF);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            ((jp7) p65Var.j(kt7.a)).getClass();
            r28 r28VarD = jp7.a(p65Var) == ip7.COMPACT ? jfc.d(o28Var, 1.0f) : jfc.q(pwd.e0(o28Var, a76.Min), 150.0f, 0.0f, 2);
            nwb nwbVar = new nwb(vo7.R(p65Var, c0(w9eVar)));
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new z7b(l78Var, 18);
                p65Var.j0(objM2);
            }
            tr7.a(nwbVar, (m45) objM2, bgf.N(r28VarD, "user_activities_activity_type_selector"), 0L, 0, 0, 0, p65Var, 48, 120);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new z7b(l78Var, 19);
                p65Var.j0(objM3);
            }
            mz1 mz1VarE = pxf.E(-124229850, new ov2(list, w9eVar, l8eVar, l78Var, 27), p65Var);
            p65Var = p65Var;
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, mz1VarE, p65Var, 48, 2044);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i2, 21, w9eVar, list, l8eVar, r28Var2);
        }
    }

    public static final r28 a0(r28 r28Var, boolean z, m68 m68Var) {
        return r28Var.b(z ? new ks4(m68Var) : o28.b);
    }

    public static final void b(gc gcVar, x12 x12Var, int i2) {
        int i3;
        gc gcVar2;
        int i4;
        p65 p65Var;
        int i5;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(328691059);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(gcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            p65Var = p65Var2;
            N(6, 6, p65Var, null, "Apollo cache", null);
            int i6 = i3 & 14;
            boolean z = i6 == 4;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                i4 = 1;
                i5 = 0;
                x8 x8Var = new x8(0, gcVar, gc.class, "dumpApolloCache", "dumpApolloCache()V", 0, 5);
                p65Var.j0(x8Var);
                objM = x8Var;
            } else {
                i4 = 1;
                i5 = 0;
            }
            D("Dump cache", null, 0L, (m45) ((qh6) objM), p65Var, 6, 6);
            w(p65Var, i5);
            int i7 = i6 == 4 ? i4 : i5;
            Object objM2 = p65Var.M();
            if (i7 != 0 || objM2 == uobVar) {
                objM2 = new x8(0, gcVar, gc.class, "clearApolloCache", "clearApolloCache()V", 0, 6);
                gcVar2 = gcVar;
                p65Var.j0(objM2);
            } else {
                gcVar2 = gcVar;
            }
            D("Clear cache", null, ((zo7) p65Var.j(kt7.b)).u, (m45) ((qh6) objM2), p65Var, 6, 2);
            w(p65Var, i5);
        } else {
            gcVar2 = gcVar;
            i4 = 1;
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cc(gcVar2, i2, i4);
        }
    }

    public static String b0(int i2, int[] iArr, String[] strArr, int[] iArr2) {
        StringBuilder sb = new StringBuilder("$");
        for (int i3 = 0; i3 < i2; i3++) {
            int i4 = iArr[i3];
            if (i4 == 1 || i4 == 2) {
                sb.append('[');
                sb.append(iArr2[i3]);
                sb.append(']');
            } else if (i4 == 3 || i4 == 4 || i4 == 5) {
                sb.append('.');
                String str = strArr[i3];
                if (str != null) {
                    sb.append(str);
                }
            }
        }
        return sb.toString();
    }

    public static final void c(gc gcVar, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(152305426);
        int i3 = 2;
        int i4 = (i2 & 6) == 0 ? (p65Var.f(gcVar) ? 4 : 2) | i2 : i2;
        int i5 = 0;
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
            N(390, 2, p65Var, null, "App support", "Set the app support status");
            w(p65Var, 0);
            for (AppConfigSupportStatus appConfigSupportStatus : d46.R(AppConfigSupportStatus.SUPPORTED, AppConfigSupportStatus.DEPRECATED, AppConfigSupportStatus.DROPPED)) {
                String strName = appConfigSupportStatus.name();
                boolean zD = ((i4 & 14) == 4) | p65Var.d(appConfigSupportStatus.ordinal());
                Object objM = p65Var.M();
                if (zD || objM == w12.a) {
                    objM = new n(gcVar, i3, appConfigSupportStatus);
                    p65Var.j0(objM);
                }
                p65 p65Var2 = p65Var;
                D(strName, null, 0L, (m45) objM, p65Var2, 0, 6);
                p65Var = p65Var2;
                w(p65Var, 0);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cc(gcVar, i2, i5);
        }
    }

    public static final int c0(w9e w9eVar) {
        int i2 = o8e.a[w9eVar.ordinal()];
        if (i2 == 1) {
            return R.string.user_activity_filter_all;
        }
        if (i2 == 2) {
            return R.string.user_activity_filter_claps;
        }
        if (i2 == 3) {
            return R.string.user_activity_filter_responses;
        }
        if (i2 == 4) {
            return R.string.user_activity_filter_highlights;
        }
        ygf.a();
        return 0;
    }

    public static final void d(lc lcVar, gc gcVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2037440409);
        int i3 = (p65Var.f(lcVar) ? 4 : 2) | i2 | (p65Var.f(gcVar) ? 32 : 16);
        if (!p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.S();
        } else if (lcVar instanceof jc) {
            p65Var.Y(524861154);
            h(r28Var, p65Var, 6);
            p65Var.p(false);
        } else {
            if (!(lcVar instanceof kc)) {
                throw ho2.L(p65Var, 524859142, false);
            }
            p65Var.Y(524863724);
            i((kc) lcVar, gcVar, r28Var, p65Var, i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 5, lcVar, gcVar, r28Var);
        }
    }

    public static final ul2 d0(es4 es4Var, int i2) {
        int i3 = hs4.a[es4Var.N0().ordinal()];
        if (i3 != 1) {
            if (i3 == 2) {
                return ul2.Cancelled;
            }
            if (i3 == 3) {
                es4 es4VarO = rx0.O(es4Var);
                if (es4VarO == null) {
                    ay0.e("ActiveParent with no focused child");
                    return null;
                }
                ul2 ul2VarD0 = d0(es4VarO, i2);
                ul2 ul2Var = ul2.None;
                ul2 ul2Var2 = ul2VarD0 != ul2Var ? ul2VarD0 : null;
                if (ul2Var2 != null) {
                    return ul2Var2;
                }
                if (es4Var.q) {
                    return ul2Var;
                }
                es4Var.q = true;
                try {
                    qr4 qr4VarK0 = es4Var.K0();
                    r51 r51Var = new r51(i2);
                    or4 or4Var = (or4) ((mn) flb.w0(es4Var)).getFocusOwner();
                    es4 es4VarF = or4Var.f();
                    qr4VarK0.k.invoke(r51Var);
                    es4 es4VarF2 = or4Var.f();
                    if (!r51Var.b) {
                        return (es4VarF == es4VarF2 || es4VarF2 == null) ? ul2Var : sr4.d == sr4.c ? ul2.Cancelled : ul2.Redirected;
                    }
                    sr4 sr4Var = sr4.b;
                    return ul2.Cancelled;
                } finally {
                    es4Var.q = false;
                }
            }
            if (i3 != 4) {
                ygf.a();
                return null;
            }
        }
        return ul2.None;
    }

    public static final ul2 e0(es4 es4Var, int i2) {
        if (!es4Var.r) {
            es4Var.r = true;
            try {
                qr4 qr4VarK0 = es4Var.K0();
                r51 r51Var = new r51(i2);
                or4 or4Var = (or4) ((mn) flb.w0(es4Var)).getFocusOwner();
                es4 es4VarF = or4Var.f();
                qr4VarK0.j.invoke(r51Var);
                es4 es4VarF2 = or4Var.f();
                if (r51Var.b) {
                    sr4 sr4Var = sr4.b;
                    return ul2.Cancelled;
                }
                if (es4VarF != es4VarF2 && es4VarF2 != null) {
                    return sr4.d == sr4.c ? ul2.Cancelled : ul2.Redirected;
                }
            } finally {
                es4Var.r = false;
            }
        }
        return ul2.None;
    }

    public static final void f(kc kcVar, gc gcVar, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(82603809);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(kcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(gcVar) ? 32 : 16;
        }
        int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            N(6, 6, p65Var, null, "FCM Token", null);
            String str = kcVar.a;
            if (str == null) {
                str = "No token";
            }
            boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new n(gcVar, 3, kcVar);
                p65Var.j0(objM);
            }
            D(str, null, 0L, (m45) objM, p65Var, 0, 6);
            p65Var = p65Var;
            w(p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(kcVar, gcVar, i2, i4);
        }
    }

    public static final ul2 f0(es4 es4Var, int i2) {
        q28 q28VarQ0;
        hj0 hj0Var;
        int i3 = hs4.a[es4Var.N0().ordinal()];
        if (i3 == 1 || i3 == 2) {
            return ul2.None;
        }
        if (i3 == 3) {
            es4 es4VarO = rx0.O(es4Var);
            if (es4VarO != null) {
                return d0(es4VarO, i2);
            }
            ay0.e("ActiveParent with no focused child");
            return null;
        }
        if (i3 != 4) {
            ygf.a();
            return null;
        }
        if (!es4Var.a.n) {
            b26.b("visitAncestors called on an unattached node");
        }
        q28 q28Var = es4Var.a.e;
        aq6 aq6VarV0 = flb.v0(es4Var);
        loop0: while (true) {
            if (aq6VarV0 == null) {
                q28VarQ0 = null;
                break;
            }
            if ((((q28) aq6VarV0.F.g).d & 1024) != 0) {
                while (q28Var != null) {
                    if ((q28Var.c & 1024) != 0) {
                        q28VarQ0 = q28Var;
                        o78 o78Var = null;
                        while (q28VarQ0 != null) {
                            if (q28VarQ0 instanceof es4) {
                                break loop0;
                            }
                            if ((q28VarQ0.c & 1024) != 0 && (q28VarQ0 instanceof b43)) {
                                int i4 = 0;
                                for (q28 q28Var2 = ((b43) q28VarQ0).p; q28Var2 != null; q28Var2 = q28Var2.f) {
                                    if ((q28Var2.c & 1024) != 0) {
                                        i4++;
                                        if (i4 == 1) {
                                            q28VarQ0 = q28Var2;
                                        } else {
                                            if (o78Var == null) {
                                                o78Var = new o78(new q28[16]);
                                            }
                                            if (q28VarQ0 != null) {
                                                o78Var.b(q28VarQ0);
                                                q28VarQ0 = null;
                                            }
                                            o78Var.b(q28Var2);
                                        }
                                    }
                                }
                                if (i4 == 1) {
                                }
                            }
                            q28VarQ0 = flb.q0(o78Var);
                        }
                    }
                    q28Var = q28Var.e;
                }
            }
            aq6VarV0 = aq6VarV0.v();
            q28Var = (aq6VarV0 == null || (hj0Var = aq6VarV0.F) == null) ? null : (ffd) hj0Var.f;
        }
        es4 es4Var2 = (es4) q28VarQ0;
        if (es4Var2 == null) {
            return ul2.None;
        }
        int i5 = hs4.a[es4Var2.N0().ordinal()];
        if (i5 == 1) {
            return e0(es4Var2, i2);
        }
        if (i5 == 2) {
            return ul2.Cancelled;
        }
        if (i5 == 3) {
            return f0(es4Var2, i2);
        }
        if (i5 != 4) {
            ygf.a();
            return null;
        }
        ul2 ul2VarF0 = f0(es4Var2, i2);
        ul2 ul2Var = ul2VarF0 != ul2.None ? ul2VarF0 : null;
        return ul2Var == null ? e0(es4Var2, i2) : ul2Var;
    }

    public static final void g(gc gcVar, x12 x12Var, int i2) {
        int i3;
        gc gcVar2;
        p65 p65Var;
        int i4;
        int i5;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1942649247);
        int i6 = 2;
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(gcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            p65Var = p65Var2;
            N(6, 6, p65Var, null, "Images cache", null);
            w(p65Var, 0);
            int i7 = i3 & 14;
            boolean z = i7 == 4;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                i4 = 0;
                i5 = 4;
                x8 x8Var = new x8(0, gcVar, gc.class, "onClearImageDiskCacheButtonClicked", "onClearImageDiskCacheButtonClicked()V", 0, 14);
                p65Var.j0(x8Var);
                objM = x8Var;
            } else {
                i5 = 4;
                i4 = 0;
            }
            sn3 sn3Var = kt7.b;
            D("Clear images disk cache", null, ((zo7) p65Var.j(sn3Var)).u, (m45) ((qh6) objM), p65Var, 6, 2);
            w(p65Var, i4);
            int i8 = i7 != i5 ? i4 : 1;
            Object objM2 = p65Var.M();
            if (i8 != 0 || objM2 == uobVar) {
                objM2 = new x8(0, gcVar, gc.class, "onClearImageMemoryCacheButtonClicked", "onClearImageMemoryCacheButtonClicked()V", 0, 15);
                gcVar2 = gcVar;
                p65Var.j0(objM2);
            } else {
                gcVar2 = gcVar;
            }
            D("Clear images memory cache", null, ((zo7) p65Var.j(sn3Var)).u, (m45) ((qh6) objM2), p65Var, 6, 2);
            w(p65Var, i4);
        } else {
            gcVar2 = gcVar;
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cc(gcVar2, i2, i6);
        }
    }

    public static final boolean g0(es4 es4Var) {
        o78 o78Var;
        hj0 hj0Var;
        or4 or4Var;
        boolean z;
        int i2;
        o78 o78Var2;
        int i3;
        int i4;
        hj0 hj0Var2;
        or4 or4Var2 = (or4) ((mn) flb.w0(es4Var)).getFocusOwner();
        es4 es4VarF = or4Var2.f();
        zr4 zr4VarN0 = es4Var.N0();
        if (es4VarF == es4Var) {
            es4Var.J0(zr4VarN0, zr4VarN0);
            return true;
        }
        if ((es4VarF == null || es4VarF.o) && !es4Var.o && !((or4) ((mn) flb.w0(es4Var)).getFocusOwner()).a.F()) {
            return false;
        }
        if (es4VarF != null) {
            o78Var = new o78(new es4[16]);
            if (!es4VarF.a.n) {
                b26.b("visitAncestors called on an unattached node");
            }
            q28 q28Var = es4VarF.a.e;
            aq6 aq6VarV0 = flb.v0(es4VarF);
            while (aq6VarV0 != null) {
                if ((((q28) aq6VarV0.F.g).d & 1024) != 0) {
                    while (q28Var != null) {
                        if ((q28Var.c & 1024) != 0) {
                            q28 q28VarQ0 = q28Var;
                            o78 o78Var3 = null;
                            while (q28VarQ0 != null) {
                                if (q28VarQ0 instanceof es4) {
                                    o78Var.b((es4) q28VarQ0);
                                } else if ((q28VarQ0.c & 1024) != 0 && (q28VarQ0 instanceof b43)) {
                                    int i5 = 0;
                                    for (q28 q28Var2 = ((b43) q28VarQ0).p; q28Var2 != null; q28Var2 = q28Var2.f) {
                                        if ((q28Var2.c & 1024) != 0) {
                                            i5++;
                                            if (i5 == 1) {
                                                q28VarQ0 = q28Var2;
                                            } else {
                                                if (o78Var3 == null) {
                                                    o78Var3 = new o78(new q28[16]);
                                                }
                                                if (q28VarQ0 != null) {
                                                    o78Var3.b(q28VarQ0);
                                                    q28VarQ0 = null;
                                                }
                                                o78Var3.b(q28Var2);
                                            }
                                        }
                                    }
                                    if (i5 == 1) {
                                    }
                                }
                                q28VarQ0 = flb.q0(o78Var3);
                            }
                        }
                        q28Var = q28Var.e;
                    }
                }
                aq6VarV0 = aq6VarV0.v();
                q28Var = (aq6VarV0 == null || (hj0Var2 = aq6VarV0.F) == null) ? null : (ffd) hj0Var2.f;
            }
        } else {
            o78Var = null;
        }
        Object[] objArr = new es4[16];
        Object[] objArr2 = new es4[16];
        if (!es4Var.a.n) {
            b26.b("visitAncestors called on an unattached node");
        }
        q28 q28Var3 = es4Var.a.e;
        aq6 aq6VarV02 = flb.v0(es4Var);
        boolean z2 = true;
        int i6 = 0;
        int i7 = 0;
        while (aq6VarV02 != null) {
            if ((((q28) aq6VarV02.F.g).d & 1024) != 0) {
                while (q28Var3 != null) {
                    if ((q28Var3.c & 1024) != 0) {
                        q28 q28VarQ02 = q28Var3;
                        o78 o78Var4 = null;
                        while (q28VarQ02 != null) {
                            if (q28VarQ02 instanceof es4) {
                                es4 es4Var2 = (es4) q28VarQ02;
                                if (g76.L(o78Var != null ? Boolean.valueOf(o78Var.l(es4Var2)) : null, Boolean.TRUE)) {
                                    int i8 = i6 + 1;
                                    if (objArr.length < i8) {
                                        int length = objArr.length;
                                        or4Var = or4Var2;
                                        Object[] objArr3 = new Object[Math.max(i8, length * 2)];
                                        i4 = i8;
                                        System.arraycopy(objArr, 0, objArr3, 0, length);
                                        objArr = objArr3;
                                    } else {
                                        or4Var = or4Var2;
                                        i4 = i8;
                                    }
                                    objArr[i6] = es4Var2;
                                    i6 = i4;
                                } else {
                                    or4Var = or4Var2;
                                    int i9 = i7 + 1;
                                    if (objArr2.length < i9) {
                                        int length2 = objArr2.length;
                                        Object[] objArr4 = new Object[Math.max(i9, length2 * 2)];
                                        i3 = i9;
                                        System.arraycopy(objArr2, 0, objArr4, 0, length2);
                                        objArr2 = objArr4;
                                    } else {
                                        i3 = i9;
                                    }
                                    objArr2[i7] = es4Var2;
                                    i7 = i3;
                                }
                                if (es4Var2 == es4VarF) {
                                    z2 = false;
                                }
                                z = false;
                            } else {
                                or4Var = or4Var2;
                                z = true;
                            }
                            if (z && (q28VarQ02.c & 1024) != 0 && (q28VarQ02 instanceof b43)) {
                                int i10 = 0;
                                for (q28 q28Var4 = ((b43) q28VarQ02).p; q28Var4 != null; q28Var4 = q28Var4.f) {
                                    if ((q28Var4.c & 1024) != 0) {
                                        int i11 = i10 + 1;
                                        if (i11 == 1) {
                                            q28VarQ02 = q28Var4;
                                            i2 = i11;
                                        } else {
                                            if (o78Var4 == null) {
                                                i2 = i11;
                                                o78Var2 = new o78(new q28[16]);
                                            } else {
                                                i2 = i11;
                                                o78Var2 = o78Var4;
                                            }
                                            if (q28VarQ02 != null) {
                                                o78Var2.b(q28VarQ02);
                                                q28VarQ02 = null;
                                            }
                                            o78Var2.b(q28Var4);
                                            o78Var4 = o78Var2;
                                        }
                                        i10 = i2;
                                    }
                                }
                                if (i10 == 1) {
                                    or4Var2 = or4Var;
                                } else {
                                    q28VarQ02 = flb.q0(o78Var4);
                                    or4Var2 = or4Var;
                                }
                            } else {
                                q28VarQ02 = flb.q0(o78Var4);
                                or4Var2 = or4Var;
                            }
                        }
                    }
                    q28Var3 = q28Var3.e;
                    or4Var2 = or4Var2;
                }
            }
            or4 or4Var3 = or4Var2;
            aq6VarV02 = aq6VarV02.v();
            q28Var3 = (aq6VarV02 == null || (hj0Var = aq6VarV02.F) == null) ? null : (ffd) hj0Var.f;
            or4Var2 = or4Var3;
        }
        or4 or4Var4 = or4Var2;
        if (z2 && es4VarF != null && !W(es4VarF, false)) {
            return false;
        }
        mo7.T(es4Var, new ir(17, es4Var));
        int i12 = hs4.a[es4Var.N0().ordinal()];
        if (i12 != 1 && i12 != 2) {
            if (i12 != 3 && i12 != 4) {
                ygf.a();
                return false;
            }
            ((or4) ((mn) flb.w0(es4Var)).getFocusOwner()).i(es4Var);
        }
        if (z2 && es4VarF != null) {
            es4VarF.J0(zr4.Active, zr4.Inactive);
        }
        if (o78Var != null) {
            int i13 = o78Var.c - 1;
            Object[] objArr5 = o78Var.a;
            if (i13 < objArr5.length) {
                while (i13 >= 0) {
                    es4 es4Var3 = (es4) objArr5[i13];
                    if (or4Var4.f() != es4Var) {
                        return false;
                    }
                    es4Var3.J0(zr4.ActiveParent, zr4.Inactive);
                    i13--;
                }
            }
        }
        int i14 = i7 - 1;
        if (i14 < objArr2.length) {
            while (i14 >= 0) {
                es4 es4Var4 = (es4) objArr2[i14];
                if (or4Var4.f() != es4Var) {
                    return false;
                }
                es4Var4.J0(es4Var4 == es4VarF ? zr4.Active : zr4.Inactive, zr4.ActiveParent);
                i14--;
            }
        }
        if (or4Var4.f() != es4Var) {
            return false;
        }
        es4Var.J0(zr4VarN0, zr4.Active);
        return or4Var4.f() == es4Var;
    }

    public static final void h(r28 r28Var, x12 x12Var, int i2) {
        int i3;
        nr5 nr5Var = rv8.r;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1158224409);
        int i4 = 4;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarV = m40.V(r28Var, p65Var, i3 & 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-936832135);
            int i6 = 0;
            while (i6 < i4) {
                float f2 = 24.0f;
                dy0.a(flb.a0(jfc.e(jfc.p(w2g.F(r28Var, 24.0f, 24.0f, 24.0f, 16.0f), 160.0f), 20.0f), ((zo7) p65Var.j(kt7.b)).b, nr5Var), p65Var, 0);
                w(p65Var, 0);
                p65Var.Y(-936822225);
                int i7 = 0;
                while (i7 < i4) {
                    r28 r28VarD = jfc.d(r28Var, 1.0f);
                    sn3 sn3Var = kt7.b;
                    r28 r28VarF = w2g.F(flb.a0(r28VarD, ((zo7) p65Var.j(sn3Var)).a, nr5Var), f2, 14.0f, f2, 14.0f);
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    long j3 = p65Var.T;
                    int i8 = (int) (j3 ^ (j3 >>> c2));
                    i89 i89VarL2 = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarF);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var2);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC);
                    tp7.B(p65Var, q12.e, i89VarL2);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i8));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR2);
                    dy0.a(flb.a0(jfc.e(jfc.p(o28.b, gq7.c(i7).c(48, 240)), 20.0f), ((zo7) p65Var.j(sn3Var)).b, nr5Var), p65Var, 0);
                    p65Var.p(true);
                    w(p65Var, 0);
                    i7++;
                    i4 = 4;
                    c2 = ' ';
                    f2 = 24.0f;
                }
                p65Var.p(false);
                i6++;
                i4 = 4;
                c2 = ' ';
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i2, 0);
        }
    }

    public static final as6 h0(n0c n0cVar, o86 o86Var) {
        n0cVar.getClass();
        o86Var.getClass();
        return new as6(n0cVar, o86Var, false);
    }

    public static final void i(kc kcVar, gc gcVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1202598911);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(kcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(gcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            int i5 = (i3 >> 3) & 14;
            j(gcVar, p65Var, i5);
            e(gcVar, p65Var, i5);
            b(gcVar, p65Var, i5);
            f(kcVar, gcVar, p65Var, i3 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            k(gcVar, p65Var, i5);
            l(gcVar, p65Var, i5);
            c(gcVar, p65Var, i5);
            g(gcVar, p65Var, i5);
            m(gcVar, p65Var, i5);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 0, kcVar, gcVar, r28Var);
        }
    }

    public static final Object i0(x45 x45Var, p92 p92Var) {
        if (p92Var.getContext().o0(uob.d) == null) {
            return gr7.o(p92Var.getContext()).a(x45Var, p92Var);
        }
        rd6.m();
        return null;
    }

    public static final void k(gc gcVar, x12 x12Var, int i2) {
        int i3;
        gc gcVar2;
        p65 p65Var;
        int i4;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1425097458);
        int i5 = 4;
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(gcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            p65Var = p65Var2;
            N(6, 6, p65Var, null, "Push notification permission request", null);
            w(p65Var, 0);
            int i6 = i3 & 14;
            boolean z = i6 == 4;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                i4 = 0;
                x8 x8Var = new x8(0, gcVar, gc.class, "showPushNotificationPermissionRequestBottomSheet", "showPushNotificationPermissionRequestBottomSheet()V", 0, 17);
                p65Var.j0(x8Var);
                objM = x8Var;
            } else {
                i4 = 0;
            }
            D("Show push notification permission request bottom sheet", null, 0L, (m45) ((qh6) objM), p65Var, 6, 6);
            w(p65Var, i4);
            int i7 = i6 != 4 ? i4 : 1;
            Object objM2 = p65Var.M();
            if (i7 != 0 || objM2 == uobVar) {
                objM2 = new x8(0, gcVar, gc.class, "resetPushNotificationPermissionRequestTimer", "resetPushNotificationPermissionRequestTimer()V", 0, 18);
                gcVar2 = gcVar;
                p65Var.j0(objM2);
            } else {
                gcVar2 = gcVar;
            }
            D("Reset last time push notification permission request was asked timer", null, 0L, (m45) ((qh6) objM2), p65Var, 6, 6);
        } else {
            gcVar2 = gcVar;
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cc(gcVar2, i2, i5);
        }
    }

    public static final void l(gc gcVar, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1635337126);
        int i3 = 4;
        int i4 = (i2 & 6) == 0 ? (p65Var.f(gcVar) ? 4 : 2) | i2 : i2;
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
            N(6, 6, p65Var, null, "Push notifications simulator", null);
            w(p65Var, 0);
            for (ic icVar : oc.s) {
                String str = icVar.a;
                boolean zF = ((i4 & 14) == 4) | p65Var.f(icVar);
                Object objM = p65Var.M();
                if (zF || objM == w12.a) {
                    objM = new n(gcVar, i3, icVar);
                    p65Var.j0(objM);
                }
                p65 p65Var2 = p65Var;
                D(str, null, 0L, (m45) objM, p65Var2, 0, 6);
                p65Var = p65Var2;
                w(p65Var, 0);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cc(gcVar, i2, 7);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:59:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void n(defpackage.lc r21, defpackage.nhc r22, defpackage.gc r23, defpackage.r28 r24, defpackage.x12 r25, int r26, int r27) {
        /*
            Method dump skipped, instruction units count: 256
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k50.n(lc, nhc, gc, r28, x12, int, int):void");
    }

    public static final void o(lig ligVar, String str, r28 r28Var, oc ocVar, x12 x12Var, int i2) {
        oc ocVar2;
        oc ocVar3;
        int i3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1318713602);
        int i4 = 2;
        int i5 = i2 | (p65Var.f(ligVar) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i5 & 1, (i5 & 1171) != 1170)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z = (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new mb(str, i4);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    ocVar3 = (oc) to7.z(n1b.a.b(oc.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i5 & (-7169);
                }
            } else {
                p65Var.S();
                i3 = i5 & (-7169);
                ocVar3 = ocVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(ocVar3.r, p65Var, 0);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            n((lc) l78VarZ.getValue(), nhcVar, new gc(ocVar3, ligVar, (Context) p65Var.j(eo.b)), r28Var, p65Var, ((i3 << 3) & 7168) | 48, 0);
            boolean zH = p65Var.h(ocVar3);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                objM3 = new j0(ocVar3, nhcVar, null, 6);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            ocVar2 = ocVar3;
        } else {
            p65Var.S();
            ocVar2 = ocVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 2, ligVar, str, r28Var, ocVar2);
        }
    }

    public static final void p(gc gcVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-424785728);
        int i3 = (p65Var2.f(gcVar) ? 4 : 2) | i2 | 48;
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new x8(0, gcVar, gc.class, "onBackPressed", "onBackPressed()V", 0, 21);
                p65Var2.j0(objM);
            }
            long j2 = ((zo7) p65Var2.j(kt7.b)).c;
            mz1 mz1VarE = pxf.E(2045285927, new so1(3, gcVar), p65Var2);
            p65Var = p65Var2;
            r28Var2 = o28.b;
            qk7.g(r28Var2, "Admin tools", (m45) ((qh6) objM), mz1VarE, null, null, 0L, j2, null, p65Var, 3126, 368);
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new r(gcVar, r28Var2, i2, 6);
        }
    }

    public static final void q(je jeVar, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        r28 r28Var3;
        float f2;
        long j2;
        boolean z;
        long j3;
        boolean z2 = jeVar.b;
        List list = jeVar.a;
        m45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1718586922);
        int i3 = i2 | (p65Var2.f(jeVar) ? 4 : 2) | (p65Var2.h(m45Var) ? 32 : 16) | 384;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(w2g.G(hlg.r(r40.y(jfc.p(o28Var, 72.0f), bmb.a(4.0f)), false, null, new vkb(0), m45Var, 11), 0.0f, 0.0f, 0.0f, 4.0f, 7), "all_entities");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j4 = p65Var2.T;
            int i4 = (int) (j4 ^ (j4 >>> 32));
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
            tp7.B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            r28 r28VarC = w2g.C(jfc.l(o28Var, 72.0f), 3.0f);
            if (z2) {
                f2 = 3.0f;
                p65Var2.Y(1916714314);
                r28Var3 = r28VarC;
                j2 = ((zo7) p65Var2.j(kt7.b)).y;
                p65Var2.p(false);
            } else {
                r28Var3 = r28VarC;
                f2 = 3.0f;
                p65Var2.Y(1916715391);
                p65Var2.p(false);
                j2 = uu1.g;
            }
            amb ambVar = bmb.a;
            r28 r28VarB = bo.B(r28Var3, 1.0f, j2, ambVar);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j5 = p65Var2.T;
            int i5 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarB);
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
            r28 r28VarL = jfc.l(iy0.a.a(o28Var, z46.h), 56.0f);
            sn3 sn3Var = kt7.b;
            dy0.a(flb.a0(r28VarL, ((zo7) p65Var2.j(sn3Var)).c, ambVar), p65Var2, 0);
            ie ieVar = (ie) bu1.A0(0, list);
            r28 r28VarL2 = jfc.l(w2g.G(o28Var, 14.0f, 10.0f, 0.0f, 0.0f, 12), 24.0f);
            if (ieVar instanceof ge) {
                p65Var2.Y(274453625);
                M(((ge) ieVar).a, r28VarL2, p65Var2, 48);
                p65Var2.p(false);
            } else if (ieVar instanceof he) {
                p65Var2.Y(274460436);
                U(((he) ieVar).a, r28VarL2, p65Var2, 48);
                p65Var2.p(false);
            } else {
                if (ieVar != null) {
                    throw ho2.L(p65Var2, 274450954, false);
                }
                p65Var2.Y(274465541);
                U(null, r28VarL2, p65Var2, 54);
                p65Var2.p(false);
            }
            ie ieVar2 = (ie) bu1.A0(1, list);
            r28 r28VarL3 = jfc.l(w2g.G(o28Var, 41.0f, 20.0f, 0.0f, 0.0f, 12), 12.0f);
            if (ieVar2 instanceof ge) {
                p65Var2.Y(274479771);
                M(((ge) ieVar2).a, r28VarL3, p65Var2, 48);
                p65Var2.p(false);
            } else if (ieVar2 instanceof he) {
                p65Var2.Y(274486646);
                U(((he) ieVar2).a, r28VarL3, p65Var2, 48);
                p65Var2.p(false);
            } else {
                if (ieVar2 != null) {
                    throw ho2.L(p65Var2, 274477072, false);
                }
                p65Var2.Y(274491814);
                U(null, r28VarL3, p65Var2, 54);
                p65Var2.p(false);
            }
            ie ieVar3 = (ie) bu1.A0(2, list);
            r28 r28VarL4 = jfc.l(w2g.G(o28Var, 14.0f, 37.0f, 0.0f, 0.0f, 12), 16.0f);
            if (ieVar3 instanceof ge) {
                p65Var2.Y(274505977);
                M(((ge) ieVar3).a, r28VarL4, p65Var2, 48);
                p65Var2.p(false);
            } else if (ieVar3 instanceof he) {
                p65Var2.Y(274512788);
                U(((he) ieVar3).a, r28VarL4, p65Var2, 48);
                p65Var2.p(false);
            } else {
                if (ieVar3 != null) {
                    throw ho2.L(p65Var2, 274503306, false);
                }
                p65Var2.Y(274517893);
                U(null, r28VarL4, p65Var2, 54);
                p65Var2.p(false);
            }
            ie ieVar4 = (ie) bu1.A0(3, list);
            r28 r28VarL5 = jfc.l(w2g.G(o28Var, 33.0f, 35.0f, 0.0f, 0.0f, 12), 20.0f);
            if (ieVar4 instanceof ge) {
                p65Var2.Y(274532025);
                M(((ge) ieVar4).a, r28VarL5, p65Var2, 48);
                z = false;
                p65Var2.p(false);
            } else {
                z = false;
                if (ieVar4 instanceof he) {
                    p65Var2.Y(274538836);
                    U(((he) ieVar4).a, r28VarL5, p65Var2, 48);
                    p65Var2.p(false);
                } else {
                    if (ieVar4 != null) {
                        throw ho2.L(p65Var2, 274529354, false);
                    }
                    p65Var2.Y(274543941);
                    U(null, r28VarL5, p65Var2, 54);
                    p65Var2.p(false);
                }
            }
            p65Var2.p(true);
            if (z2) {
                p65Var2.Y(-707660118);
                j3 = ((zo7) p65Var2.j(sn3Var)).n;
                p65Var2.p(z);
            } else {
                p65Var2.Y(-707586648);
                j3 = ((zo7) p65Var2.j(sn3Var)).o;
                p65Var2.p(z);
            }
            jjd.b(vo7.R(p65Var2, R.string.common_all), jfc.d(w2g.G(o28Var, f2, 4.0f, f2, 0.0f, 8), 1.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).o, j3, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 48, 24960, 109564);
            p65Var = p65Var2;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 7, jeVar, m45Var, r28Var2);
        }
    }

    public static final void r(String str, String str2, boolean z, boolean z2, u37 u37Var, x12 x12Var, int i2) {
        Object fr0Var;
        m62 m62Var;
        l78 l78Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-780418162);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.g(z) ? 256 : 128) | (p65Var.g(z2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(u37Var) ? 16384 : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            r28 r28VarB = jfc.b(jfc.d(o28.b, 1.0f), 0.0f, 48.0f, 1);
            vkb vkbVar = new vkb(1);
            boolean z3 = ((57344 & i3) == 16384) | ((i3 & 14) == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z3 || objM == uobVar) {
                objM = new ps5(u37Var, 9, str);
                p65Var.j0(objM);
            }
            r28 r28VarE = w2g.E(hlg.r(r28VarB, false, null, vkbVar, (m45) objM, 11), 24.0f, 0.0f, 2);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM4);
            }
            l78 l78Var2 = (l78) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.s(z52Var, p65Var);
            }
            m62 m62Var2 = (m62) objM5;
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM6;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM7 = p65Var.M();
            if (zH || objM7 == uobVar) {
                fr0Var = new fr0(l78Var3, hl7Var, m62Var2, l78Var2, 11);
                m62Var = m62Var2;
                l78Var = l78Var2;
                p65Var.j0(fr0Var);
            } else {
                fr0Var = objM7;
                m62Var = m62Var2;
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) fr0Var;
            Object objM8 = p65Var.M();
            int i4 = 11;
            if (objM8 == uobVar) {
                objM8 = new gr0(l78Var, m62Var, 11);
                p65Var.j0(objM8);
            }
            m45 m45Var = (m45) objM8;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM9 = p65Var.M();
            if (zH2 || objM9 == uobVar) {
                objM9 = new hr0(hl7Var, i4);
                p65Var.j0(objM9);
            }
            hlg.j(wxb.a(r28VarE, false, (x45) objM9), pxf.E(1200550679, new x37(l78Var3, z52Var, m45Var, z, str2, z2), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new al1(str, str2, z, z2, u37Var, i2);
        }
    }

    public static final void s(f9e f9eVar, kv6 kv6Var, l8e l8eVar, n8e n8eVar, sh9 sh9Var, r28 r28Var, x12 x12Var, int i2) {
        l8e l8eVar2;
        kv6 kv6Var2 = kv6Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-493351099);
        int i3 = i2 | (p65Var.f(f9eVar) ? 4 : 2) | (p65Var.f(kv6Var2) ? 32 : 16) | (p65Var.f(l8eVar) ? 256 : 128) | (p65Var.f(n8eVar) ? 2048 : 1024) | (p65Var.f(sh9Var) ? 16384 : 8192);
        if (p65Var.P(i3 & 1, (74899 & i3) != 74898)) {
            jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 48.0f, 7);
            r28 r28VarN = bgf.N(r28Var, "content_state");
            int i4 = i3 & 14;
            boolean z = (i4 == 4) | ((i3 & 7168) == 2048) | ((57344 & i3) == 16384);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new pi9(f9eVar, n8eVar, sh9Var, 19);
                p65Var.j0(objM);
            }
            int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            k40.t(r28VarN, kv6Var, jy8VarH, null, null, null, false, null, (x45) objM, p65Var, i5 | 384, 504);
            kv6Var2 = kv6Var;
            int i6 = i3 & 896;
            boolean z2 = (i6 == 256) | (i5 == 32);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (z2 || objM2 == uobVar) {
                l8eVar2 = l8eVar;
                objM2 = new cfd(kv6Var2, l8eVar2, n92Var, 8);
                p65Var.j0(objM2);
            } else {
                l8eVar2 = l8eVar;
            }
            kyd.k(p65Var, (b55) objM2, kv6Var2);
            Boolean boolValueOf = Boolean.valueOf(f9eVar.c);
            boolean z3 = (i4 == 4) | (i6 == 256);
            Object objM3 = p65Var.M();
            if (z3 || objM3 == uobVar) {
                objM3 = new n79(l8eVar2, f9eVar, n92Var, 25);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, boolValueOf);
            boolean z4 = i6 == 256;
            Object objM4 = p65Var.M();
            if (z4 || objM4 == uobVar) {
                objM4 = new i8e(l8eVar2, n92Var, 0);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
        } else {
            l8eVar2 = l8eVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i2, 28, r28Var, f9eVar, kv6Var2, l8eVar2, n8eVar, sh9Var);
        }
    }

    public static final void t(qc3 qc3Var, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(313746654);
        int i3 = i2 | (p65Var.f(qc3Var) ? 4 : 2) | (p65Var.h(x45Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MMMM d, yyyy", Locale.US);
            o28 o28Var = o28.b;
            r28 r28VarF = jfc.f(jfc.d(o28Var, 1.0f), 48.0f, 0.0f, 2);
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new gf2(x45Var, 29, qc3Var);
                p65Var.j0(objM);
            }
            r28 r28VarG = w2g.G(hlg.r(r28VarF, false, null, null, (m45) objM, 15), 24.0f, 0.0f, 24.0f, 0.0f, 10);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) ((j2 >>> 32) ^ j2);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            mr7.a(qc3Var.c, null, null, false, null, null, p65Var, 48, 60);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            String str = simpleDateFormat.format(Long.valueOf(qc3Var.b));
            str.getClass();
            jjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).l, p65Var, 0, 0, 131070);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 18, qc3Var, x45Var, r28Var2);
        }
    }

    public static final void u(int i2, long j2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(626865556);
        int i3 = i2 | 6 | (p65Var.e(j2) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            int i4 = i2 & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var.z()) {
                r28Var2 = o28Var;
            } else {
                p65Var.S();
                r28Var2 = r28Var;
            }
            p65Var.q();
            r28 r28VarG = w2g.G(jfc.f(jfc.d(r28Var2, 1.0f), 48.0f, 0.0f, 2), 24.0f, 0.0f, 24.0f, 0.0f, 10);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            r28 r28VarY = r40.y(jfc.l(o28Var, 20.0f), bmb.a);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarY, j2, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            p65Var.Y(1576926208);
            float fZ = ((m73) p65Var.j(z22.h)).z(((bu7) p65Var.j(jt7.c)).l.b.c);
            p65Var.p(false);
            dy0.a(flb.a0(jfc.e(jfc.d(o28Var, 0.5f), fZ), j2, nr5Var), p65Var, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var2, j2, i2, 7);
        }
    }

    public static final long v(float f2, boolean z, boolean z2) {
        return (((z ? 1L : 0L) | (z2 ? 2L : 0L)) & 4294967295L) | (((long) Float.floatToRawIntBits(f2)) << 32);
    }

    public static final void w(x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1085390777);
        int i3 = 1;
        if (p65Var.P(i2 & 1, i2 != 0)) {
            tp7.c(0.0f, 0, 5, ((zo7) p65Var.j(kt7.b)).x, p65Var, null);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new p02(i2, i3);
        }
    }

    public static final void x(r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1599079578);
        int i3 = i2 | 6;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            o28 o28Var = o28.b;
            gq7.a(bgf.N(o28Var, "end_of_feed"), null, vo7.R(p65Var, R.string.user_activity_end_of_feed_title), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 0, 0, 2042);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var2, i2, 5);
        }
    }

    public static final void y(g9e g9eVar, l8e l8eVar, r28 r28Var, x12 x12Var, int i2) {
        Object k8eVar;
        ar0 ar0Var;
        g9e g9eVar2 = g9eVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(63232338);
        int i3 = i2 | (p65Var.f(g9eVar2) ? 4 : 2) | (p65Var.f(l8eVar) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "error_state"), 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            g9eVar2 = g9eVar;
            b24 b24Var = g9eVar2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                k8eVar = new k8e(0, l8eVar, l8e.class, "refresh", "refresh()V", 0, 0);
                p65Var.j0(k8eVar);
            } else {
                k8eVar = objM;
                ar0Var = ar0Var2;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, 1.0f), ar0Var), null, null, null, null, (m45) ((qh6) k8eVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 14, g9eVar2, l8eVar, r28Var);
        }
    }

    public static final void z(pb4 pb4Var, ob4 ob4Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1903408140);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(pb4Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(ob4Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        int i4 = i3;
        if (p65Var2.P(i4 & 1, (i4 & 147) != 146)) {
            int i5 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z = i5 == 32;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new z8(ob4Var, null, 22);
                p65Var2.j0(objM);
            }
            kyd.k(p65Var2, (b55) objM, c1e.a);
            String strR = vo7.R(p65Var2, R.string.featured_in_publication_title);
            boolean z2 = i5 == 32;
            Object objM2 = p65Var2.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new hq3(0, ob4Var, ob4.class, "onClose", "onClose()V", 0, 26);
                p65Var2.j0(objM2);
            }
            p65Var = p65Var2;
            ek7.g(strR, (m45) ((qh6) objM2), r28Var, null, pxf.E(876846262, new g64(ob4Var, 5, pb4Var), p65Var2), p65Var, (i4 & 896) | 24576, 8);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 15, pb4Var, ob4Var, r28Var);
        }
    }

    public static final void e(gc gcVar, x12 x12Var, int i2) {
        int i3;
        gc gcVar2;
        p65 p65Var;
        int i4;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1097013780);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(gcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            p65Var = p65Var2;
            N(6, 6, p65Var, null, "Debug tools", null);
            int i5 = i3 & 14;
            boolean z = i5 == 4;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                i4 = 0;
                x8 x8Var = new x8(0, gcVar, gc.class, ezwlgQm.GjuuBvExOil, "navigateToAdminInternalStatus()V", 0, 7);
                p65Var.j0(x8Var);
                objM = x8Var;
            } else {
                i4 = 0;
            }
            D("Authenticate via Okta / Cloudflare Access (Force Admin)", null, 0L, (m45) ((qh6) objM), p65Var, 6, 6);
            w(p65Var, i4);
            int i6 = i5 == 4 ? 1 : i4;
            Object objM2 = p65Var.M();
            if (i6 != 0 || objM2 == uobVar) {
                objM2 = new x8(0, gcVar, gc.class, "navigateToDesignSystem", "navigateToDesignSystem()V", 0, 8);
                p65Var.j0(objM2);
            }
            D("Design System", null, 0L, (m45) ((qh6) objM2), p65Var, 6, 6);
            w(p65Var, i4);
            int i7 = i5 == 4 ? 1 : i4;
            Object objM3 = p65Var.M();
            if (i7 != 0 || objM3 == uobVar) {
                objM3 = new x8(0, gcVar, gc.class, "navigateToDesignSystem3", "navigateToDesignSystem3()V", 0, 9);
                p65Var.j0(objM3);
            }
            D("Design System 3", null, 0L, (m45) ((qh6) objM3), p65Var, 6, 6);
            w(p65Var, i4);
            int i8 = i5 == 4 ? 1 : i4;
            Object objM4 = p65Var.M();
            if (i8 != 0 || objM4 == uobVar) {
                objM4 = new x8(0, gcVar, gc.class, "dumpLogsToFile", "dumpLogsToFile()V", 0, 10);
                p65Var.j0(objM4);
            }
            D("Dump logs to file", null, 0L, (m45) ((qh6) objM4), p65Var, 6, 6);
            w(p65Var, i4);
            int i9 = i5 == 4 ? 1 : i4;
            Object objM5 = p65Var.M();
            if (i9 != 0 || objM5 == uobVar) {
                objM5 = new x8(0, gcVar, gc.class, "navigateToPaymentsDebugger", "navigateToPaymentsDebugger()V", 0, 11);
                p65Var.j0(objM5);
            }
            D("Payments debugger", null, 0L, (m45) ((qh6) objM5), p65Var, 6, 6);
            w(p65Var, i4);
            int i10 = i5 == 4 ? 1 : i4;
            Object objM6 = p65Var.M();
            if (i10 != 0 || objM6 == uobVar) {
                objM6 = new x8(0, gcVar, gc.class, "navigateToStageBranch", "navigateToStageBranch()V", 0, 12);
                p65Var.j0(objM6);
            }
            D("Stage Branch", null, 0L, (m45) ((qh6) objM6), p65Var, 6, 6);
            w(p65Var, i4);
            int i11 = i5 != 4 ? i4 : 1;
            Object objM7 = p65Var.M();
            if (i11 != 0 || objM7 == uobVar) {
                objM7 = new x8(0, gcVar, gc.class, "navigateToUserDismissableFlags", "navigateToUserDismissableFlags()V", 0, 13);
                gcVar2 = gcVar;
                p65Var.j0(objM7);
            } else {
                gcVar2 = gcVar;
            }
            D("User Dismissable Flags", null, 0L, (m45) ((qh6) objM7), p65Var, 6, 6);
            w(p65Var, i4);
        } else {
            gcVar2 = gcVar;
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cc(gcVar2, i2, 3);
        }
    }

    public static final void j(gc gcVar, x12 x12Var, int i2) {
        int i3;
        gc gcVar2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1465674568);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(gcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            p65Var = p65Var2;
            N(390, 2, p65Var, null, "Navigation", "Allow to navigate to a feature which is not easy to enter in");
            w(p65Var, 0);
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new x8(0, gcVar, gc.class, fiHTiFJ.VrvXsFgQp, "navigateToOnboardingFlow()V", 0, 16);
                gcVar2 = gcVar;
                p65Var.j0(objM);
            } else {
                gcVar2 = gcVar;
            }
            D("Onboarding flow", null, 0L, (m45) ((qh6) objM), p65Var, 6, 6);
            w(p65Var, 0);
        } else {
            gcVar2 = gcVar;
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cc(gcVar2, i2, 6);
        }
    }

    public static final void m(gc gcVar, x12 x12Var, int i2) {
        int i3;
        gc gcVar2;
        p65 p65Var;
        int i4;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(563817425);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(gcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            p65Var = p65Var2;
            N(390, 2, p65Var, null, "Reset", nGxjfIr.fxJpAG);
            w(p65Var, 0);
            int i5 = i3 & 14;
            boolean z = i5 == 4;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                i4 = 0;
                x8 x8Var = new x8(0, gcVar, gc.class, "onResetWhatsNewButtonClicked", "onResetWhatsNewButtonClicked()V", 0, 19);
                p65Var.j0(x8Var);
                objM = x8Var;
            } else {
                i4 = 0;
            }
            D("What's new dialog", null, 0L, (m45) ((qh6) objM), p65Var, 6, 6);
            w(p65Var, i4);
            int i6 = i5 != 4 ? i4 : 1;
            Object objM2 = p65Var.M();
            if (i6 != 0 || objM2 == uobVar) {
                objM2 = new x8(0, gcVar, gc.class, "onResetFindYourFriendsDialogButtonClicked", "onResetFindYourFriendsDialogButtonClicked()V", 0, 20);
                gcVar2 = gcVar;
                p65Var.j0(objM2);
            } else {
                gcVar2 = gcVar;
            }
            D("Reset Find your friends dialog visibility", null, 0L, (m45) ((qh6) objM2), p65Var, 6, 6);
            w(p65Var, i4);
        } else {
            gcVar2 = gcVar;
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cc(gcVar2, i2, 5);
        }
    }
}
