package defpackage;

import android.os.Bundle;
import android.view.textclassifier.TextClassifier;
import com.medium.android.common.post.iframe.ParagraphEditIframeLayout;
import com.medium.android.common.post.image.ParagraphEditImageLayout;
import com.medium.android.common.post.pre.ParagraphEditPreLayout;
import com.medium.android.common.post.text.ParagraphEditTextLayout;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.proto.event.CollectionViewed;
import com.medium.proto.event.SignUpSignInLoginCodeViewed;
import com.medium.proto.event.SignUpSignInMagicLinkSentViewed;
import com.medium.proto.event.StatsPostStatsViewed;
import java.util.Collections;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lo5 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lo5(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                return new lo5((no5) obj2, n92Var, 0);
            case 1:
                return new lo5((jp5) obj2, n92Var, 1);
            case 2:
                return new lo5((gg5) obj2, n92Var, 2);
            case 3:
                return new lo5((v16) obj2, n92Var, 3);
            case 4:
                return new lo5((x87) obj2, n92Var, 4);
            case 5:
                return new lo5((ld7) obj2, n92Var, 5);
            case 6:
                return new lo5((me7) obj2, n92Var, 6);
            case 7:
                return new lo5((i88) obj2, n92Var, 7);
            case 8:
                return new lo5((ba8) obj2, n92Var, 8);
            case 9:
                return new lo5((ik8) obj2, n92Var, 9);
            case 10:
                return new lo5((ParagraphEditIframeLayout) obj2, n92Var, 10);
            case 11:
                return new lo5((ParagraphEditImageLayout) obj2, n92Var, 11);
            case 12:
                return new lo5((ParagraphEditPreLayout) obj2, n92Var, 12);
            case 13:
                return new lo5((ParagraphEditTextLayout) obj2, n92Var, 13);
            case 14:
                return new lo5((c79) obj2, n92Var, 14);
            case 15:
                return new lo5((va9) obj2, n92Var, 15);
            case 16:
                return new lo5((fp9) obj2, n92Var, 16);
            case 17:
                return new lo5((ex9) obj2, n92Var, 17);
            case 18:
                return new lo5((i1a) obj2, n92Var, 18);
            case 19:
                return new lo5((e9a) obj2, n92Var, 19);
            case 20:
                return new lo5((iaa) obj2, n92Var, 20);
            case 21:
                return new lo5((nba) obj2, n92Var, 21);
            case 22:
                return new lo5((qca) obj2, n92Var, 22);
            case 23:
                return new lo5((jha) obj2, n92Var, 23);
            case 24:
                return new lo5((qia) obj2, n92Var, 24);
            case 25:
                return new lo5((xja) obj2, n92Var, 25);
            case 26:
                return new lo5((nla) obj2, n92Var, 26);
            case 27:
                return new lo5((sna) obj2, n92Var, 27);
            case 28:
                return new lo5((wpa) obj2, n92Var, 28);
            default:
                return new lo5((mab) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 2:
                break;
            case 3:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 4:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 5:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 6:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 7:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 8:
                ((lo5) create((Bundle) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 9:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 10:
                ((lo5) create((nld) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 11:
                ((lo5) create((nld) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 12:
                ((lo5) create((nld) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 13:
                ((lo5) create((nld) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 14:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 15:
                break;
            case 16:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 17:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 18:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 19:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 20:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 21:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 22:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 23:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 24:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 25:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 26:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 27:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 28:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            default:
                ((lo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                ap5 ap5Var = ((no5) obj2).a;
                if (!ap5Var.q) {
                    ap5Var.q = true;
                    ap5Var.j.j(ap5Var.b, gp7.u(ap5Var.p), ap5Var.o);
                }
                return c1eVar;
            case 1:
                br7.v(obj);
                bq5 bq5Var = ((jp5) obj2).a;
                if (!bq5Var.s) {
                    bq5Var.s = true;
                    bq5Var.j.j(bq5Var.b, gp7.u(bq5Var.r), bq5Var.q);
                }
                return c1eVar;
            case 2:
                br7.v(obj);
                x2b x2bVar = tj2.a;
                return Boolean.valueOf(tj2.a(((zk2) ((gg5) obj2).b).m()));
            case 3:
                br7.v(obj);
                hy2 hy2Var = (hy2) ((ko2) ((v16) obj2)).K.get();
                hy2Var.getClass();
                g01.y = hy2Var;
                return c1eVar;
            case 4:
                br7.v(obj);
                u97 u97Var = ((x87) obj2).b;
                String str = u97Var.n;
                String str2 = u97Var.u;
                String str3 = u97Var.t;
                if (!u97Var.v) {
                    u97Var.v = true;
                    a13 a13Var = u97Var.l;
                    SusiOperation susiOperation = u97Var.b;
                    a13Var.getClass();
                    susiOperation.getClass();
                    str3.getClass();
                    str2.getClass();
                    str.getClass();
                    rqd.a(a13Var.a, new SignUpSignInLoginCodeViewed(null, "app", susiOperation.getValue(), a13Var.b.p(), null, 17, null), str, str2, false, null, str3, 24);
                    u97Var.m.j(str, str2, str3);
                }
                return c1eVar;
            case 5:
                br7.v(obj);
                zd7 zd7Var = ((ld7) obj2).b;
                if (!zd7Var.k) {
                    zd7Var.k = true;
                    zd7Var.h.j(zd7Var.b, zd7Var.j, zd7Var.i);
                }
                return c1eVar;
            case 6:
                br7.v(obj);
                me7 me7Var = (me7) obj2;
                a13 a13Var2 = me7Var.h;
                SusiOperation susiOperation2 = me7Var.f;
                String str4 = me7Var.j;
                String str5 = me7Var.k;
                String str6 = me7Var.b;
                a13Var2.getClass();
                susiOperation2.getClass();
                str4.getClass();
                str5.getClass();
                str6.getClass();
                rqd.a(a13Var2.a, new SignUpSignInMagicLinkSentViewed(null, "app", susiOperation2.getValue(), a13Var2.b.p(), null, 17, null), str6, str5, false, null, str4, 24);
                return c1eVar;
            case 7:
                br7.v(obj);
                x88 x88Var = ((i88) obj2).a;
                if (!x88Var.q) {
                    x88Var.q = true;
                    x88Var.j.j(x88Var.b, x88Var.m, x88Var.k);
                }
                return c1eVar;
            case 8:
                br7.v(obj);
                ((ba8) obj2).a().d(MaAxRJinch.jCKFa, null);
                return c1eVar;
            case 9:
                br7.v(obj);
                tk8 tk8Var = ((ik8) obj2).b;
                if (!tk8Var.k) {
                    tk8Var.k = true;
                    tk8Var.f.j(tk8Var.c, gp7.u(tk8Var.i), tk8Var.h);
                }
                return c1eVar;
            case 10:
                br7.v(obj);
                ParagraphEditIframeLayout paragraphEditIframeLayout = (ParagraphEditIframeLayout) obj2;
                paragraphEditIframeLayout.getListener().e(paragraphEditIframeLayout);
                return c1eVar;
            case 11:
                br7.v(obj);
                ParagraphEditImageLayout paragraphEditImageLayout = (ParagraphEditImageLayout) obj2;
                paragraphEditImageLayout.getListener().E0(paragraphEditImageLayout);
                return c1eVar;
            case 12:
                br7.v(obj);
                ParagraphEditPreLayout paragraphEditPreLayout = (ParagraphEditPreLayout) obj2;
                paragraphEditPreLayout.getListener().b(paragraphEditPreLayout);
                return c1eVar;
            case 13:
                br7.v(obj);
                ParagraphEditTextLayout paragraphEditTextLayout = (ParagraphEditTextLayout) obj2;
                paragraphEditTextLayout.getListener().c(paragraphEditTextLayout);
                return c1eVar;
            case 14:
                br7.v(obj);
                c79 c79Var = (c79) obj2;
                if (!c79Var.i) {
                    c79Var.i = true;
                    c79Var.f.j(c79Var.b, c79Var.g, c79Var.h);
                }
                return c1eVar;
            case 15:
                br7.v(obj);
                va9 va9Var = (va9) obj2;
                TextClassifier textClassifierI = uy.i(va9Var.b, va9Var.c);
                va9Var.f = textClassifierI;
                return textClassifierI;
            case 16:
                br7.v(obj);
                wp9 wp9Var = ((fp9) obj2).b;
                String str7 = wp9Var.j;
                String str8 = wp9Var.c;
                if (!wp9Var.k) {
                    wp9Var.k = true;
                    wp9Var.g.j(str8, gp7.u(wp9Var.g()), str7);
                    qy2 qy2Var = wp9Var.h;
                    String str9 = wp9Var.b;
                    String strU = gp7.u(wp9Var.g());
                    qy2Var.getClass();
                    str9.getClass();
                    rqd.a(qy2Var.a, new StatsPostStatsViewed(null, str9, null, 5, null), str8, strU, false, null, str7, 24);
                }
                return c1eVar;
            case 17:
                br7.v(obj);
                qx9 qx9Var = ((ex9) obj2).a;
                if (!qx9Var.t) {
                    qx9Var.t = true;
                    qx9Var.h.j(qx9Var.b, gp7.u(qx9Var.s), qx9Var.r);
                }
                return c1eVar;
            case 18:
                br7.v(obj);
                q1a q1aVar = ((i1a) obj2).b;
                if (!q1aVar.l) {
                    q1aVar.l = true;
                    q1aVar.f.j(q1aVar.b, q1aVar.k, q1aVar.j);
                }
                return c1eVar;
            case 19:
                br7.v(obj);
                w9a w9aVar = ((e9a) obj2).b;
                if (!w9aVar.l) {
                    w9aVar.l = true;
                    w9aVar.h.j(w9aVar.c, gp7.u(w9aVar.k), w9aVar.j);
                    slc slcVar = w9aVar.i;
                    slcVar.getClass();
                    nl4 nl4Var = nl4.ENABLE_SPRIG_EVENT_WRITER_STATS_VIEWED;
                    Map mapSingletonMap = Collections.singletonMap("writerStats.surface", "publication");
                    mapSingletonMap.getClass();
                    slcVar.a("writer.statsViewed", nl4Var, mapSingletonMap);
                }
                return c1eVar;
            case 20:
                br7.v(obj);
                vaa vaaVar = ((iaa) obj2).b;
                if (!vaaVar.q) {
                    vaaVar.q = true;
                    vaaVar.j.j(vaaVar.c, gp7.u(vaaVar.p), vaaVar.o);
                }
                return c1eVar;
            case 21:
                br7.v(obj);
                lca lcaVar = ((nba) obj2).b;
                if (!lcaVar.u) {
                    lcaVar.u = true;
                    lcaVar.l.j(lcaVar.d, gp7.u(lcaVar.e()), lcaVar.t);
                }
                return c1eVar;
            case 22:
                br7.v(obj);
                dda ddaVar = ((qca) obj2).b;
                vob vobVar = ddaVar.h;
                Boolean bool = (Boolean) vobVar.a("has_tracked_screen_viewed");
                if (!(bool != null ? bool.booleanValue() : false)) {
                    vobVar.d("has_tracked_screen_viewed", Boolean.TRUE);
                    ddaVar.g.j(ddaVar.b, gp7.u(ddaVar.n), ddaVar.m);
                }
                return c1eVar;
            case 23:
                br7.v(obj);
                ((jha) obj2).h();
                return c1eVar;
            case 24:
                br7.v(obj);
                rja rjaVar = ((qia) obj2).a;
                if (!rjaVar.m) {
                    rjaVar.m = true;
                    rjaVar.g.j(rjaVar.b, gp7.u(rjaVar.l), rjaVar.k);
                }
                return c1eVar;
            case 25:
                br7.v(obj);
                pka pkaVar = ((xja) obj2).a;
                if (!pkaVar.q) {
                    pkaVar.q = true;
                    pkaVar.k.j(pkaVar.c, gp7.u(pkaVar.p), pkaVar.o);
                }
                return c1eVar;
            case 26:
                br7.v(obj);
                nna nnaVar = ((nla) obj2).b;
                ax2 ax2Var = nnaVar.p;
                String str10 = nnaVar.v;
                if (str10 == null) {
                    g76.g0("publicationId");
                    throw null;
                }
                String str11 = nnaVar.c;
                String strU2 = gp7.u(nnaVar.e());
                String str12 = nnaVar.z;
                ax2Var.getClass();
                str11.getClass();
                str12.getClass();
                rqd.a(ax2Var.b, new CollectionViewed(null, str10, null, null, null, null, 53, null), str11, strU2, false, null, str12, 24);
                return c1eVar;
            case 27:
                br7.v(obj);
                eoa eoaVar = ((sna) obj2).b;
                vob vobVar2 = eoaVar.i;
                Boolean bool2 = (Boolean) vobVar2.a("has_tracked_screen_viewed");
                if (!(bool2 != null ? bool2.booleanValue() : false)) {
                    vobVar2.d("has_tracked_screen_viewed", Boolean.TRUE);
                    eoaVar.h.j(eoaVar.b, gp7.u(eoaVar.n), eoaVar.m);
                }
                return c1eVar;
            case 28:
                br7.v(obj);
                pkf pkfVar = ((wpa) obj2).b;
                km4.I(wld.a, null, "Set push notification permission requested", new Object[0], "Set push notification permission requested");
                zpa zpaVar = (zpa) pkfVar.a;
                long jCurrentTimeMillis = System.currentTimeMillis();
                vr7 vr7Var = zpaVar.b;
                vr7Var.getClass();
                vr7Var.B(ek6.NOTIFICATIONS_PERMISSION_RATIONALE_TIMESTAMP, jCurrentTimeMillis);
                return c1eVar;
            default:
                br7.v(obj);
                jbb jbbVar = ((mab) obj2).b;
                if (!jbbVar.u) {
                    jbbVar.u = true;
                    jbbVar.l.j(jbbVar.c, gp7.u(jbbVar.t), jbbVar.s);
                }
                return c1eVar;
        }
    }
}
