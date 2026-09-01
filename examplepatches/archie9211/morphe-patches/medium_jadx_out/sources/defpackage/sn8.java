package defpackage;

import com.medium.android.followers.publication.PublicationFollowersFragment;
import com.medium.reader.R;
import com.medium.stats.ui.post.PostStatsFragment;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class sn8 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ sn8(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        String strK;
        int i = this.a;
        uob uobVar = w12.a;
        int i2 = 2;
        c1e c1eVar = c1e.a;
        Object obj3 = this.c;
        Object obj4 = this.b;
        switch (i) {
            case 0:
                String str = (String) obj4;
                wn8 wn8Var = (wn8) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    no7.e(str, wn8Var.c, wn8Var.d, null, p65Var, 0);
                }
                break;
            case 1:
                ((Integer) obj2).getClass();
                ur7.h((kx8) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 2:
                oya oyaVar = (oya) obj4;
                float fFloatValue = ((Float) obj).floatValue();
                ((Float) obj2).getClass();
                oyaVar.a += ((fv6) obj3).b.a(fFloatValue - oyaVar.a);
                break;
            case 3:
                ((Integer) obj2).getClass();
                e29.a((n39) obj4, (r28) obj3, (x12) obj, tr7.y(49));
                break;
            case 4:
                ((Integer) obj2).getClass();
                x69.a((b79) obj4, (r28) obj3, (x12) obj, tr7.y(49));
                break;
            case 5:
                ((Integer) obj2).getClass();
                hp7.b((on3) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 6:
                ((Integer) obj2).getClass();
                ur7.j((zd9) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 7:
                ((Integer) obj2).getClass();
                ek7.k((List) obj4, (cv9) obj3, (x12) obj, tr7.y(1));
                break;
            case 8:
                ((Integer) obj2).getClass();
                ok7.e((kl9) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 9:
                ((Integer) obj2).getClass();
                qk7.h((ml9) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 10:
                ((Integer) obj2).getClass();
                dl7.c((ol9) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 11:
                ((Integer) obj2).getClass();
                il7.c((ql9) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 12:
                ((Integer) obj2).getClass();
                en7.b((kn9) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 13:
                ((Integer) obj2).getClass();
                vn7.d((mn9) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 14:
                ((Integer) obj2).getClass();
                fo7.u((on9) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                break;
            case 15:
                lo9 lo9Var = (lo9) obj4;
                tb3 tb3Var = (tb3) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    boolean zH = p65Var2.h(lo9Var) | p65Var2.f(tb3Var);
                    Object objM = p65Var2.M();
                    if (zH || objM == uobVar) {
                        objM = new ui9(lo9Var, i2, tb3Var);
                        p65Var2.j0(objM);
                    }
                    f76.w((m45) objM, null, false, null, null, null, wgf.g, p65Var2, 805306368, 510);
                }
                break;
            case 16:
                ((Integer) obj2).getClass();
                no7.g((ko9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 17:
                PostStatsFragment postStatsFragment = (PostStatsFragment) obj4;
                vq6 vq6Var = postStatsFragment.v0;
                upc upcVar = (upc) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    qo7.h(((PostStatsFragment.BundleInfo) vq6Var.getValue()).getPostId(), ((PostStatsFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), new ap9(postStatsFragment), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) upcVar.getValue()).a, 7), null, p65Var3, 0);
                }
                break;
            case 18:
                ((Integer) obj2).getClass();
                qo7.e((mp9) obj4, (fp9) obj3, (x12) obj, tr7.y(1));
                break;
            case 19:
                fp9 fp9Var = (fp9) obj4;
                upc upcVar2 = (upc) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    String strR = vo7.R(p65Var4, R.string.post_stats_title);
                    boolean zH2 = p65Var4.h(fp9Var);
                    Object objM2 = p65Var4.M();
                    if (zH2 || objM2 == uobVar) {
                        bo9 bo9Var = new bo9(0, fp9Var, fp9.class, "onBackPressed", "onBackPressed()V", 0, 9);
                        p65Var4.j0(bo9Var);
                        objM2 = bo9Var;
                    }
                    qk7.g(wo7.w(o28.b, ((vj3) upcVar2.getValue()).a, null, 0L, 0L, 30), strR, (m45) ((qh6) objM2), null, null, null, 0L, 0L, null, p65Var4, 0, 504);
                }
                break;
            case 20:
                ((Integer) obj2).getClass();
                vx0.r((l1a) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 21:
                gg5 gg5Var = (gg5) obj4;
                upc upcVar3 = (upc) obj3;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    qk7.b(null, vo7.R(p65Var5, R.string.pronouns), null, pxf.E(757924223, new g4a(gg5Var, upcVar3), p65Var5), null, null, 0L, 0L, p65Var5, 3072, 245);
                }
                break;
            case 22:
                dca dcaVar = (dca) obj4;
                nba nbaVar = (nba) obj3;
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (!p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    p65Var6.S();
                } else {
                    p65Var6.Y(830045452);
                    Object obj5 = null;
                    aca acaVar = dcaVar instanceof aca ? (aca) dcaVar : null;
                    if (acaVar == null) {
                        p65Var6.p(false);
                        strK = "";
                    } else {
                        String str2 = acaVar.e;
                        List list = acaVar.d;
                        boolean zF = p65Var6.f(list) | p65Var6.f(str2);
                        Object objM3 = p65Var6.M();
                        if (zF || objM3 == uobVar) {
                            Iterator it2 = list.iterator();
                            while (true) {
                                if (it2.hasNext()) {
                                    Object next = it2.next();
                                    if (g76.L(((nma) next).a, str2)) {
                                        obj5 = next;
                                    }
                                }
                            }
                            objM3 = (nma) obj5;
                            p65Var6.j0(objM3);
                        }
                        nma nmaVar = (nma) objM3;
                        Integer num = acaVar.b;
                        if (nmaVar != null && num != null) {
                            p65Var6.Y(-1190223128);
                            strK = vo7.Q(R.string.publication_archive_topic_in_year, new Object[]{nmaVar.b, String.valueOf(num.intValue())}, p65Var6);
                            p65Var6.p(false);
                        } else if (nmaVar != null) {
                            p65Var6.Y(-1190216840);
                            p65Var6.p(false);
                            strK = nmaVar.b;
                        } else if (num != null) {
                            p65Var6.Y(-1190214986);
                            p65Var6.p(false);
                            strK = String.valueOf(num.intValue());
                        } else {
                            p65Var6.Y(-1190214101);
                            strK = pba.k(acaVar.c, p65Var6);
                            p65Var6.p(false);
                        }
                        p65Var6.p(false);
                    }
                    boolean zF2 = p65Var6.f(nbaVar);
                    Object objM4 = p65Var6.M();
                    if (zF2 || objM4 == uobVar) {
                        c9a c9aVar = new c9a(0, nbaVar, nba.class, "onBackPressed", "onBackPressed()V", 0, 2);
                        p65Var6.j0(c9aVar);
                        objM4 = c9aVar;
                    }
                    qk7.g(null, strK, (m45) ((qh6) objM4), null, null, null, 0L, 0L, null, p65Var6, 0, 505);
                }
                break;
            case 23:
                ((Integer) obj2).getClass();
                tp7.i((nca) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 24:
                ((Integer) obj2).getClass();
                vv2.m((uca) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 25:
                ((Integer) obj2).getClass();
                xz5.y((az5) obj4, (wda) obj3, (x12) obj, tr7.y(1));
                break;
            case 26:
                wda wdaVar = (wda) obj4;
                upc upcVar4 = (upc) obj3;
                x12 x12Var7 = (x12) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (!p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    p65Var7.S();
                } else {
                    mz1 mz1VarE = pxf.E(68288776, new th9(upcVar4, i2), p65Var7);
                    boolean zF3 = p65Var7.f(wdaVar);
                    Object objM5 = p65Var7.M();
                    if (zF3 || objM5 == uobVar) {
                        c9a c9aVar2 = new c9a(0, wdaVar, wda.class, "onBackPressed", "onBackPressed()V", 0, 9);
                        p65Var7.j0(c9aVar2);
                        objM5 = c9aVar2;
                    }
                    au7.a(mz1VarE, null, (m45) ((qh6) objM5), null, null, null, ((zo7) p65Var7.j(kt7.b)).b, p65Var7, 6, 122);
                }
                break;
            case 27:
                PublicationFollowersFragment publicationFollowersFragment = (PublicationFollowersFragment) obj4;
                vq6 vq6Var2 = publicationFollowersFragment.u0;
                upc upcVar5 = (upc) obj3;
                x12 x12Var8 = (x12) obj;
                int iIntValue8 = ((Integer) obj2).intValue();
                p65 p65Var8 = (p65) x12Var8;
                if (!p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                    p65Var8.S();
                } else {
                    f76.t(((PublicationFollowersFragment.BundleInfo) vq6Var2.getValue()).getPublicationId(), ((PublicationFollowersFragment.BundleInfo) vq6Var2.getValue()).getReferrerSource(), new hha(publicationFollowersFragment), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) upcVar5.getValue()).a, 7), null, p65Var8, 0);
                }
                break;
            case 28:
                ((Integer) obj2).getClass();
                lk7.h((hka) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                pla.b((fna) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ sn8(Object obj, Object obj2, int i, int i2) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
    }
}
