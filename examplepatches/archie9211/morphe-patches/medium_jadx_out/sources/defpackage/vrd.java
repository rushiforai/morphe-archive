package defpackage;

import android.view.View;
import com.medium.android.profile.ui.view.UserProfileTab;
import com.medium.android.profile.ui.you.YouProfileTab;
import com.medium.android.profile.ui.you.i;
import com.medium.android.upvoters.ui.UpVotersReference;
import com.medium.android.upvoters.ui.d;
import com.medium.stats.ui.user.UserStatsTab;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vrd implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ vrd(Object obj, int i, Object obj2) {
        this.a = i;
        this.c = obj;
        this.b = obj2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Exception {
        int i = 5;
        int i2 = 11;
        int i3 = 12;
        int i4 = 14;
        int i5 = 13;
        int i6 = 0;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        n92 n92Var = null;
        int i7 = 1;
        switch (this.a) {
            case 0:
                vx0.c0((sb2) this.c, null, wb2.UNDISPATCHED, new jb8((dsd) this.b, null), 1);
                return new or(3);
            case 1:
                dsd dsdVar = (dsd) this.b;
                dsd dsdVar2 = (dsd) this.c;
                dsdVar.j.add(dsdVar2);
                return new am0(dsdVar, i2, dsdVar2);
            case 2:
                return new am0((dsd) this.b, i3, (xrd) this.c);
            case 3:
                b2 b2Var = (b2) this.b;
                ((hwb) b2Var).E0(new gjc(new vrd(Thread.currentThread(), (sb2) this.c, objArr == true ? 1 : 0, i)));
                return new u7(i5, b2Var);
            case 4:
                dsd dsdVar3 = (dsd) this.b;
                bsd bsdVar = (bsd) this.c;
                dsdVar3.i.add(bsdVar);
                return new am0(dsdVar3, i5, bsdVar);
            case 5:
                Object obj2 = this.b;
                sb2 sb2Var = (sb2) this.c;
                m45 m45Var = (m45) obj;
                if (obj2 == Thread.currentThread()) {
                    m45Var.invoke();
                } else {
                    vx0.c0(sb2Var, null, null, new qe(m45Var, n92Var, i), 3);
                }
                return c1e.a;
            case 6:
                a1a a1aVar = (a1a) this.c;
                dyd dydVar = (dyd) this.b;
                gyd gydVar = (gyd) obj;
                synchronized (((dq1) a1aVar.b)) {
                    try {
                        boolean zA = gydVar.a();
                        bd7 bd7Var = (bd7) a1aVar.c;
                        if (zA) {
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                }
                return c1e.a;
            case 7:
                UpVotersReference upVotersReference = (UpVotersReference) this.c;
                String str = (String) this.b;
                lo2 lo2Var = (lo2) obj;
                lo2Var.getClass();
                eo2 eo2Var = lo2Var.a;
                ys2 ys2Var = (ys2) eo2Var.e;
                kxe kxeVar = new kxe((qi1) ys2Var.b.t.get());
                wye wyeVar = new wye((gn9) ys2Var.b.u.get());
                ko2 ko2Var = ys2Var.b;
                ixe ixeVar = new ixe((qi1) ko2Var.t.get());
                uye uyeVar = new uye((gn9) ko2Var.u.get());
                kbe kbeVarM = ys2Var.M();
                kne kneVarO = ys2Var.O();
                ko2 ko2Var2 = eo2Var.b;
                s26 s26VarZ = ko2Var2.z();
                ax2 ax2VarT = ko2Var2.t();
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new d(upVotersReference, str, kxeVar, wyeVar, ixeVar, uyeVar, kbeVarM, kneVarO, s26VarZ, ax2VarT, r13Var);
            case 8:
                x3e x3eVar = (x3e) this.c;
                obe obeVar = (obe) this.b;
                xu6 xu6Var = (xu6) obj;
                xu6Var.getClass();
                List list = x3eVar.c;
                xu6Var.l0(list.size(), new vja(new n2c(i5), 29, list), new lba(list, 19), new mz1(new wf(list, obeVar, i2), true, 2039820996));
                if (x3eVar.d) {
                    ev6.j(xu6Var, "up_voter_item_loading_more", w2g.k, 2);
                }
                return c1e.a;
            case 9:
                d4e d4eVar = (d4e) this.c;
                x45 x45Var = (x45) this.b;
                ((Long) obj).getClass();
                float f = d4eVar.e;
                d4eVar.e = 0.0f;
                x45Var.invoke(Float.valueOf(f));
                return c1e.a;
            case 10:
                nee neeVar = (nee) this.c;
                ffe ffeVar = (ffe) this.b;
                String str2 = (String) obj;
                str2.getClass();
                SourceParameter sourceParameter = ffeVar.d;
                sourceParameter.getClass();
                neeVar.b.i(str2, sourceParameter);
                return c1e.a;
            case 11:
                nee neeVar2 = (nee) this.c;
                efe efeVar = (efe) this.b;
                String str3 = (String) obj;
                str3.getClass();
                SourceParameter sourceParameter2 = efeVar.e;
                sourceParameter2.getClass();
                neeVar2.b.i(str3, sourceParameter2);
                return c1e.a;
            case 12:
                ige igeVar = (ige) this.c;
                rfe rfeVar = (rfe) this.b;
                xu6 xu6Var2 = (xu6) obj;
                xu6Var2.getClass();
                ev6.j(xu6Var2, "verified_author_intro", new mz1(new ofe(igeVar, rfeVar), true, -1135575323), 2);
                ArrayList arrayList = igeVar.a;
                int i8 = 16;
                xu6Var2.l0(arrayList.size(), new j8e(new n2c(i8), i7, arrayList), new rl5(i8, arrayList), new mz1(new kd3(arrayList, arrayList.size(), rfeVar, i7), true, 2039820996));
                return c1e.a;
            case 13:
                ((ihe) this.c).q0((UserProfileTab) ((jje) this.b).a.get(((Integer) obj).intValue()));
                return c1e.a;
            case 14:
                return Boolean.valueOf(((tjd) this.c).invoke(obj).equals(((kf9) ((mf9) this.b)).a));
            case 15:
                m45 m45Var2 = (m45) this.c;
                x45 x45Var2 = (x45) this.b;
                int iIntValue = ((Integer) obj).intValue();
                if (iIntValue == 2) {
                    m45Var2.invoke();
                } else {
                    x45Var2.invoke(((i04) UserStatsTab.getEntries()).get(iIntValue));
                }
                return c1e.a;
            case 16:
                hoe hoeVar = (hoe) this.c;
                obe obeVar2 = (obe) this.b;
                xu6 xu6Var3 = (xu6) obj;
                xu6Var3.getClass();
                az5 az5Var = hoeVar.a;
                xu6Var3.l0(((t0) az5Var).getSize(), new j8e(new tjd(26), 4, az5Var), new lba(az5Var, 23), new mz1(new wf(az5Var, obeVar2, i3), true, 802480018));
                if (hoeVar.c) {
                    ev6.j(xu6Var3, "users_search_loading_more", bo.k, 2);
                }
                return c1e.a;
            case 17:
                f5f f5fVar = (f5f) this.c;
                View view = (View) this.b;
                f5fVar.a(view);
                return new am0(f5fVar, i4, view);
            case 18:
                s7f s7fVar = (s7f) this.c;
                r7f r7fVar = (r7f) this.b;
                anb anbVar = (anb) obj;
                anbVar.getClass();
                s7fVar.b.I(anbVar, r7fVar);
                return c1e.a;
            case 19:
                u7f u7fVar = (u7f) this.c;
                t7f t7fVar = (t7f) this.b;
                anb anbVar2 = (anb) obj;
                anbVar2.getClass();
                u7fVar.b.I(anbVar2, t7fVar);
                return c1e.a;
            case 20:
                j7f j7fVar = (j7f) this.c;
                String str4 = (String) this.b;
                anb anbVar3 = (anb) obj;
                anbVar3.getClass();
                gnb gnbVarB0 = anbVar3.B0("UPDATE workspec SET state=? WHERE id=?");
                try {
                    gnbVarB0.c(1, en7.R(j7fVar));
                    gnbVarB0.M(2, str4);
                    gnbVarB0.w0();
                    int iS = dl7.s(anbVar3);
                    gnbVarB0.close();
                    return Integer.valueOf(iS);
                } finally {
                }
            case 21:
                g8f g8fVar = (g8f) this.c;
                c8f c8fVar = (c8f) this.b;
                anb anbVar4 = (anb) obj;
                anbVar4.getClass();
                g8fVar.b.I(anbVar4, c8fVar);
                return c1e.a;
            case 22:
                dt2 dt2Var = (dt2) this.c;
                String str5 = (String) this.b;
                anb anbVar5 = (anb) obj;
                anbVar5.getClass();
                gnb gnbVarB02 = anbVar5.B0("UPDATE workspec SET output=? WHERE id=?");
                try {
                    dt2 dt2Var2 = dt2.b;
                    gnbVarB02.d(1, ht2.E0(dt2Var));
                    gnbVarB02.M(2, str5);
                    gnbVarB02.w0();
                    gnbVarB02.close();
                    return c1e.a;
                } finally {
                }
            case 23:
                i8f i8fVar = (i8f) this.c;
                h8f h8fVar = (h8f) this.b;
                anb anbVar6 = (anb) obj;
                anbVar6.getClass();
                i8fVar.b.I(anbVar6, h8fVar);
                return c1e.a;
            case 24:
                String str6 = (String) this.c;
                paf pafVar = (paf) this.b;
                zo2 zo2Var = (zo2) obj;
                zo2Var.getClass();
                eo2 eo2Var2 = zo2Var.a;
                ys2 ys2Var2 = (ys2) eo2Var2.e;
                eo2 eo2Var3 = ys2Var2.K1;
                eo2 eo2Var4 = ys2Var2.L1;
                eo2 eo2Var5 = ys2Var2.M1;
                qlb qlbVarS = ys2Var2.S();
                tl tlVarP = ys2Var2.p();
                fr9 fr9VarR = ys2Var2.r();
                ko2 ko2Var3 = eo2Var2.b;
                ty2 ty2VarQ = ko2Var3.q();
                ax2 ax2VarT2 = ko2Var3.t();
                r13 r13Var2 = xg3.a;
                iq7.s(r13Var2);
                return new kbf(str6, pafVar, eo2Var3, eo2Var4, eo2Var5, qlbVarS, tlVarP, fr9VarR, ty2VarQ, ax2VarT2, r13Var2);
            case 25:
                YouProfileTab youProfileTab = (YouProfileTab) this.c;
                String str7 = (String) this.b;
                ap2 ap2Var = (ap2) obj;
                ap2Var.getClass();
                eo2 eo2Var6 = ap2Var.a;
                ko2 ko2Var4 = eo2Var6.b;
                mya myaVarA = ko2Var4.A();
                zk2 zk2Var = (zk2) ko2Var4.r.get();
                ax2 ax2Var = new ax2(ko2Var4.x(), 9);
                ax2 ax2VarT3 = ko2Var4.t();
                vob vobVar = ((ys2) eo2Var6.e).a;
                r13 r13Var3 = xg3.a;
                iq7.s(r13Var3);
                return new i(youProfileTab, str7, myaVarA, zk2Var, ax2Var, ax2VarT3, vobVar, r13Var3);
            case 26:
                ((d2f) this.c).s0((YouProfileTab) ((ubf) this.b).i.get(((Integer) obj).intValue()));
                return c1e.a;
            case 27:
                ddf ddfVar = (ddf) this.c;
                dw4 dw4Var = (dw4) this.b;
                ((String) obj).getClass();
                ddfVar.a.c.d("selected_tag_id", dw4Var.a);
                return c1e.a;
            case 28:
                ydf ydfVar = (ydf) this.c;
                ddf ddfVar2 = (ddf) this.b;
                xu6 xu6Var4 = (xu6) obj;
                xu6Var4.getClass();
                if (ydfVar instanceof tdf) {
                    ev6.l(xu6Var4, 3, null, vx0.n, 6);
                } else if (g76.L(ydfVar, udf.a)) {
                    ev6.l(xu6Var4, 7, null, vx0.o, 6);
                } else if (ydfVar instanceof xdf) {
                    ev6.j(xu6Var4, "your_following_feed_followed_tags_sort_selector", new mz1(new ucf(ydfVar, ddfVar2, objArr3 == true ? 1 : 0), true, 1244700150), 2);
                    ev6.j(xu6Var4, "your_following_feed_followed_tags_divider", new mz1(new vcf(objArr2 == true ? 1 : 0), true, -475182049), 2);
                    xdf xdfVar = (xdf) ydfVar;
                    for (dw4 dw4Var2 : xdfVar.b) {
                        ev6.j(xu6Var4, "your_following_feed_followed_tag_".concat(dw4Var2.a), new mz1(new dyc(dw4Var2, 15, ddfVar2), true, -225061177), 2);
                    }
                    if (xdfVar.d) {
                        ev6.j(xu6Var4, "your_following_feed_followed_tags_loading_more", vx0.p, 2);
                    }
                } else {
                    if (!g76.L(ydfVar, vdf.a)) {
                        ygf.a();
                        return null;
                    }
                    ev6.l(xu6Var4, 3, null, vx0.q, 6);
                }
                return c1e.a;
            default:
                sdf sdfVar = (sdf) this.c;
                ddf ddfVar3 = (ddf) this.b;
                xu6 xu6Var5 = (xu6) obj;
                xu6Var5.getClass();
                if (sdfVar instanceof pdf) {
                    ev6.l(xu6Var5, 3, null, vx0.j, 6);
                } else if (g76.L(sdfVar, qdf.a)) {
                    ev6.l(xu6Var5, 7, null, vx0.k, 6);
                } else if (sdfVar instanceof odf) {
                    ev6.j(xu6Var5, "your_following_feed_all_followed_entities", new mz1(new tcf(sdfVar, ddfVar3, i6), true, 1049905782), 2);
                    odf odfVar = (odf) sdfVar;
                    for (ev4 ev4Var : odfVar.b) {
                        ev6.j(xu6Var5, ka1.r("your_following_feed_followed_entity_", ev4Var.getId()), new mz1(new dyc(ev4Var, i4, ddfVar3), true, 1741928740), 2);
                    }
                    if (odfVar.d) {
                        ev6.j(xu6Var5, "your_following_feed_followed_entities_loading_more", vx0.l, 2);
                    }
                } else {
                    if (!g76.L(sdfVar, rdf.a)) {
                        ygf.a();
                        return null;
                    }
                    ev6.l(xu6Var5, 3, null, vx0.m, 6);
                }
                return c1e.a;
        }
    }

    public /* synthetic */ vrd(Object obj, Object obj2, boolean z, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }
}
