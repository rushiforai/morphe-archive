package defpackage;

import android.database.sqlite.SQLiteCursorDriver;
import android.database.sqlite.SQLiteQuery;
import android.text.Editable;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.common.post.iframe.ParagraphEditIframeLayout;
import com.medium.android.common.post.image.ParagraphEditImageLayout;
import com.medium.android.common.post.text.ParagraphEditTextLayout;
import com.medium.android.yourlibrary.YourLibraryTab;
import com.medium.reader.R;
import com.medium.stats.ui.user.UserStatsTab;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zq implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ zq(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        long j;
        long j2;
        int i = this.a;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        Object obj5 = this.b;
        switch (i) {
            case 0:
                ar arVar = (ar) obj5;
                gyd gydVarB = ((bz4) arVar.e).b((az4) obj, (d05) obj2, ((zz4) obj3).a, ((a05) obj4).a);
                if (gydVarB instanceof fyd) {
                    Object obj6 = ((fyd) gydVarB).a;
                    obj6.getClass();
                } else {
                    vwa vwaVar = new vwa(gydVarB, arVar.j);
                    arVar.j = vwaVar;
                    Object obj7 = vwaVar.d;
                    obj7.getClass();
                }
                break;
            case 1:
                SQLiteCursorDriver sQLiteCursorDriver = (SQLiteCursorDriver) obj2;
                String str = (String) obj3;
                SQLiteQuery sQLiteQuery = (SQLiteQuery) obj4;
                sQLiteQuery.getClass();
                g35 g35Var = new g35(sQLiteQuery);
                z2d z2dVar = (z2d) ((qlb) obj5).a;
                int length = z2dVar.d.length;
                for (int i2 = 1; i2 < length; i2++) {
                    int i3 = z2dVar.d[i2];
                    if (i3 == 1) {
                        g35Var.c(i2, z2dVar.e[i2]);
                    } else if (i3 == 2) {
                        g35Var.f0(z2dVar.f[i2], i2);
                    } else if (i3 == 3) {
                        String str2 = z2dVar.g[i2];
                        str2.getClass();
                        g35Var.s(i2, str2);
                    } else if (i3 == 4) {
                        byte[] bArr = z2dVar.h[i2];
                        bArr.getClass();
                        g35Var.d(i2, bArr);
                    } else if (i3 == 5) {
                        g35Var.g(i2);
                    }
                }
                break;
            case 2:
                c55 c55Var = (c55) obj5;
                xr6 xr6Var = (xr6) obj;
                ((Integer) obj2).intValue();
                x12 x12Var = (x12) obj3;
                int iIntValue = ((Integer) obj4).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(xr6Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 131) != 130)) {
                    c55Var.f(xr6Var, p65Var, Integer.valueOf(iIntValue & 14));
                } else {
                    p65Var.S();
                }
                break;
            case 3:
                mz1 mz1Var = (mz1) obj5;
                bw6 bw6Var = (bw6) obj;
                ((Integer) obj2).getClass();
                x12 x12Var2 = (x12) obj3;
                int iIntValue2 = ((Integer) obj4).intValue();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(bw6Var) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 131) != 130)) {
                    mz1Var.f(bw6Var, p65Var2, Integer.valueOf(iIntValue2 & 14));
                } else {
                    p65Var2.S();
                }
                break;
            case 4:
                oe1 oe1Var = (oe1) obj5;
                ((Integer) obj2).getClass();
                x12 x12Var3 = (x12) obj3;
                int iIntValue3 = ((Integer) obj4).intValue();
                ((xr6) obj).getClass();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 129) != 128)) {
                    float fP = br7.p(p65Var3, R.dimen.list_catalog_preview_horizontal_padding);
                    o28 o28Var = o28.b;
                    r28 r28VarX = ho2.x((jp7) p65Var3.j(kt7.a), w2g.E(o28Var, fP, 0.0f, 2), 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j3 = p65Var3.T;
                    int i4 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL = p65Var3.l();
                    r28 r28VarR = gx1.R(p65Var3, r28VarX);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var);
                    } else {
                        p65Var3.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var3, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var3, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i4);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var3, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var3, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var3, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j4 = p65Var3.T;
                    int i5 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL2 = p65Var3.l();
                    r28 r28VarR2 = gx1.R(p65Var3, r28VarD);
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, cuVar, zk7VarC2);
                    tp7.B(p65Var3, cuVar2, i89VarL2);
                    ka1.z(i5, p65Var3, cuVar3, p65Var3, fnVar);
                    tp7.B(p65Var3, cuVar4, r28VarR2);
                    s42.e(oe1Var, null, 0L, p65Var3, 0, 6);
                    p65Var3.p(true);
                    p65Var3.p(true);
                } else {
                    p65Var3.S();
                }
                break;
            case 5:
                String str3 = (String) obj5;
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                x45 x45Var = (x45) obj2;
                x12 x12Var4 = (x12) obj3;
                int iIntValue4 = ((Integer) obj4).intValue();
                x45Var.getClass();
                int i6 = (iIntValue4 & 6) == 0 ? iIntValue4 | (((p65) x12Var4).g(zBooleanValue) ? 4 : 2) : iIntValue4;
                if ((iIntValue4 & 48) == 0) {
                    i6 |= ((p65) x12Var4).h(x45Var) ? 32 : 16;
                }
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(i6 & 1, (i6 & 147) != 146)) {
                    lk7.c((i6 << 3) & PhotoshopDirectory.TAG_CAPTION, p65Var4, x45Var, null, str3, zBooleanValue);
                } else {
                    p65Var4.S();
                }
                break;
            case 6:
                p38 p38Var = (p38) obj5;
                r28 r28Var = (r28) obj2;
                x12 x12Var5 = (x12) obj3;
                int iIntValue5 = ((Integer) obj4).intValue();
                ((gq4) obj).getClass();
                r28Var.getClass();
                if ((iIntValue5 & 48) == 0) {
                    iIntValue5 |= ((p65) x12Var5).f(r28Var) ? 32 : 16;
                }
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 145) != 144)) {
                    int i7 = (iIntValue5 << 3) & 896;
                    rr7.c(String.valueOf(p38Var.k), vo7.R(p65Var5, R.string.post_stats_monthly_stats_total_clappers), r28Var, vo7.R(p65Var5, R.string.post_stats_monthly_stats_total_clappers_info), p65Var5, i7, 0);
                    rr7.c(String.valueOf(p38Var.l), vo7.R(p65Var5, R.string.post_stats_monthly_stats_total_highlighters), r28Var, vo7.R(p65Var5, R.string.post_stats_monthly_stats_total_highlighters_info), p65Var5, i7, 0);
                    rr7.c(String.valueOf(p38Var.n), vo7.R(p65Var5, R.string.post_stats_monthly_stats_total_responders), r28Var, vo7.R(p65Var5, R.string.post_stats_monthly_stats_total_responders_info), p65Var5, i7, 0);
                    rr7.c(String.valueOf(p38Var.o), vo7.R(p65Var5, R.string.post_stats_monthly_stats_total_reposters), r28Var, vo7.R(p65Var5, R.string.post_stats_monthly_stats_total_reposters_info), p65Var5, i7, 0);
                    rr7.c(String.valueOf(p38Var.m), vo7.R(p65Var5, R.string.post_stats_monthly_stats_total_followers), r28Var, vo7.R(p65Var5, R.string.post_stats_monthly_stats_total_followers_info), p65Var5, i7, 0);
                } else {
                    p65Var5.S();
                }
                break;
            case 7:
                int iIntValue6 = ((Integer) obj2).intValue();
                int iIntValue7 = ((Integer) obj3).intValue();
                int iIntValue8 = ((Integer) obj4).intValue();
                int i8 = ParagraphEditIframeLayout.n;
                obj.getClass();
                Editable text = ((ParagraphEditIframeLayout) obj5).h.getText();
                if (text != null) {
                    text.setSpan(obj, iIntValue6, iIntValue7, iIntValue8);
                }
                break;
            case 8:
                int iIntValue9 = ((Integer) obj2).intValue();
                int iIntValue10 = ((Integer) obj3).intValue();
                int iIntValue11 = ((Integer) obj4).intValue();
                int i9 = ParagraphEditImageLayout.p;
                obj.getClass();
                Editable text2 = ((ParagraphEditImageLayout) obj5).j.getText();
                if (text2 != null) {
                    text2.setSpan(obj, iIntValue9, iIntValue10, iIntValue11);
                }
                break;
            case 9:
                int iIntValue12 = ((Integer) obj2).intValue();
                int iIntValue13 = ((Integer) obj3).intValue();
                int iIntValue14 = ((Integer) obj4).intValue();
                int i10 = ParagraphEditTextLayout.k;
                obj.getClass();
                Editable text3 = ((ParagraphEditTextLayout) obj5).c.getText();
                if (text3 != null) {
                    text3.setSpan(obj, iIntValue12, iIntValue13, iIntValue14);
                }
                break;
            case 10:
                UserStatsTab userStatsTab = (UserStatsTab) obj5;
                boolean zBooleanValue2 = ((Boolean) obj).booleanValue();
                x45 x45Var2 = (x45) obj2;
                x12 x12Var6 = (x12) obj3;
                int iIntValue15 = ((Integer) obj4).intValue();
                x45Var2.getClass();
                int i11 = (iIntValue15 & 6) == 0 ? iIntValue15 | (((p65) x12Var6).g(zBooleanValue2) ? 4 : 2) : iIntValue15;
                if ((iIntValue15 & 48) == 0) {
                    i11 |= ((p65) x12Var6).h(x45Var2) ? 32 : 16;
                }
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(i11 & 1, (i11 & 147) != 146)) {
                    if (zBooleanValue2) {
                        p65Var6.Y(174950232);
                        j = ((zo7) p65Var6.j(kt7.b)).n;
                        p65Var6.p(false);
                    } else {
                        p65Var6.Y(175063382);
                        j = ((zo7) p65Var6.j(kt7.b)).o;
                        p65Var6.p(false);
                    }
                    long j5 = j;
                    String strR = vo7.R(p65Var6, userStatsTab.getTitleResId());
                    r28 r28VarC = w2g.C(o28.b, 16.0f);
                    mkd mkdVarA = mkd.a(((bu7) p65Var6.j(jt7.c)).m, j5, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                    boolean z = (i11 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
                    Object objM = p65Var6.M();
                    if (z || objM == uobVar) {
                        objM = new ju0(6, x45Var2);
                        p65Var6.j0(objM);
                    }
                    jjd.b(strR, r28VarC, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, (x45) objM, mkdVarA, p65Var6, 48, 0, 65532);
                } else {
                    p65Var6.S();
                }
                break;
            case 11:
                m45 m45Var = (m45) obj5;
                ((Integer) obj2).getClass();
                x12 x12Var7 = (x12) obj3;
                int iIntValue16 = ((Integer) obj4).intValue();
                ((xr6) obj).getClass();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue16 & 1, (iIntValue16 & 129) != 128)) {
                    sn3 sn3Var = kt7.b;
                    long j6 = ((zo7) p65Var7.j(sn3Var)).b;
                    nr5 nr5Var = rv8.r;
                    o28 o28Var2 = o28.b;
                    r28 r28VarE = jfc.e(jfc.d(flb.a0(o28Var2, j6, nr5Var), 1.0f), 60.0f);
                    zk7 zk7VarC3 = dy0.c(z46.d, false);
                    long j7 = p65Var7.T;
                    int i12 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL3 = p65Var7.l();
                    r28 r28VarR3 = gx1.R(p65Var7, r28VarE);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var7.c0();
                    if (p65Var7.S) {
                        p65Var7.k(ot2Var2);
                    } else {
                        p65Var7.m0();
                    }
                    tp7.B(p65Var7, q12.f, zk7VarC3);
                    tp7.B(p65Var7, q12.e, i89VarL3);
                    tp7.B(p65Var7, q12.g, Integer.valueOf(i12));
                    tp7.y(p65Var7, q12.h);
                    tp7.B(p65Var7, q12.d, r28VarR3);
                    String strR2 = vo7.R(p65Var7, R.string.select_a_voice);
                    r28 r28VarG = w2g.G(o28Var2, 0.0f, 16.0f, 0.0f, 16.0f, 5);
                    ar0 ar0Var = z46.h;
                    iy0 iy0Var = iy0.a;
                    jjd.b(strR2, iy0Var.a(r28VarG, ar0Var), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var7.j(jt7.c)).e, p65Var7, 0, 0, 131068);
                    tp7.c(0.0f, 0, 4, ((zo7) p65Var7.j(sn3Var)).z, p65Var7, iy0Var.a(o28Var2, z46.k));
                    boolean zF = p65Var7.f(m45Var);
                    Object objM2 = p65Var7.M();
                    if (zF || objM2 == uobVar) {
                        objM2 = new z23(i, m45Var);
                        p65Var7.j0(objM2);
                    }
                    fo7.k(384, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var7, (m45) objM2, xn7.S, w2g.G(iy0Var.a(o28Var2, z46.i), 0.0f, 0.0f, 8.0f, 0.0f, 11), vo7.R(p65Var7, R.string.close), false, false);
                    p65Var7.p(true);
                } else {
                    p65Var7.S();
                }
                break;
            default:
                YourLibraryTab yourLibraryTab = (YourLibraryTab) obj5;
                boolean zBooleanValue3 = ((Boolean) obj).booleanValue();
                x45 x45Var3 = (x45) obj2;
                x12 x12Var8 = (x12) obj3;
                int iIntValue17 = ((Integer) obj4).intValue();
                x45Var3.getClass();
                int i13 = (iIntValue17 & 6) == 0 ? iIntValue17 | (((p65) x12Var8).g(zBooleanValue3) ? 4 : 2) : iIntValue17;
                if ((iIntValue17 & 48) == 0) {
                    i13 |= ((p65) x12Var8).h(x45Var3) ? 32 : 16;
                }
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(i13 & 1, (i13 & 147) != 146)) {
                    o28 o28Var3 = o28.b;
                    r28 r28VarE2 = o7f.E(w2g.C(o28Var3, 16.0f), x45Var3);
                    omb ombVarA = nmb.a(qb8.a, z46.n, p65Var8, 48);
                    long j8 = p65Var8.T;
                    int i14 = (int) (j8 ^ (j8 >>> 32));
                    i89 i89VarL4 = p65Var8.l();
                    r28 r28VarR4 = gx1.R(p65Var8, r28VarE2);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var8.c0();
                    if (p65Var8.S) {
                        p65Var8.k(ot2Var3);
                    } else {
                        p65Var8.m0();
                    }
                    tp7.B(p65Var8, q12.f, ombVarA);
                    tp7.B(p65Var8, q12.e, i89VarL4);
                    tp7.B(p65Var8, q12.g, Integer.valueOf(i14));
                    tp7.y(p65Var8, q12.h);
                    tp7.B(p65Var8, q12.d, r28VarR4);
                    String strR3 = vo7.R(p65Var8, yourLibraryTab.getTitleResId());
                    mkd mkdVar = ((bu7) p65Var8.j(jt7.c)).n;
                    if (zBooleanValue3) {
                        p65Var8.Y(-195766311);
                        j2 = ((zo7) p65Var8.j(kt7.b)).n;
                        p65Var8.p(false);
                    } else {
                        p65Var8.Y(-195645225);
                        j2 = ((zo7) p65Var8.j(kt7.b)).o;
                        p65Var8.p(false);
                    }
                    jjd.b(strR3, o28Var3, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(mkdVar, j2, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var8, 48, 0, 131068);
                    p65Var8.p(true);
                } else {
                    p65Var8.S();
                }
                break;
        }
        return c1eVar;
    }
}
