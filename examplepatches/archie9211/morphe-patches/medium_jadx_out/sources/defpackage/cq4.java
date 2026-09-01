package defpackage;

import defpackage.k25;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class cq4 implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ cq4(int i) {
        this.a = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        switch (this.a) {
            case 0:
                return c1e.a;
            case 1:
                return c1e.a;
            case 2:
                jyb jybVar = (jyb) obj;
                jybVar.getClass();
                hyb.a(jybVar);
                return c1e.a;
            case 3:
                ((rg1) obj).getClass();
                return c1e.a;
            case 4:
                ((rg1) obj).getClass();
                return c1e.a;
            case 5:
                return b09.w(((Integer) obj).intValue(), "followers_loading_item_");
            case 6:
                jyb jybVar2 = (jyb) obj;
                jybVar2.getClass();
                hyb.a(jybVar2);
                return c1e.a;
            case 7:
                xu6 xu6Var = (xu6) obj;
                xu6Var.getClass();
                ev6.l(xu6Var, 12, new cq4(5), o7f.a, 4);
                return c1e.a;
            case 8:
                xu6 xu6Var2 = (xu6) obj;
                xu6Var2.getClass();
                ev6.l(xu6Var2, 12, new cq4(9), bgf.a, 4);
                return c1e.a;
            case 9:
                return b09.w(((Integer) obj).intValue(), "following_list_tab_publications_loading_item_");
            case 10:
                jyb jybVar3 = (jyb) obj;
                jybVar3.getClass();
                hyb.a(jybVar3);
                return c1e.a;
            case 11:
                ybd ybdVar = (ybd) obj;
                ybdVar.getClass();
                return "refine_recommendation_following_topic_".concat(ybdVar.g);
            case 12:
                lt1 lt1Var = (lt1) obj;
                lt1Var.getClass();
                return ka1.r("refine_recommendation_following_publication_", lt1Var.j);
            case 13:
                hne hneVar = (hne) obj;
                hneVar.getClass();
                return ka1.r("refine_recommendation_following_user_", hneVar.j);
            case 14:
                jyb jybVar4 = (jyb) obj;
                jybVar4.getClass();
                hyb.a(jybVar4);
                return c1e.a;
            case 15:
                jyb jybVar5 = (jyb) obj;
                jybVar5.getClass();
                hyb.a(jybVar5);
                return c1e.a;
            case 16:
                xu6 xu6Var3 = (xu6) obj;
                xu6Var3.getClass();
                ev6.j(xu6Var3, null, pxf.e, 3);
                ev6.l(xu6Var3, 12, new cq4(18), pxf.f, 4);
                return c1e.a;
            case 17:
                ((String) obj).getClass();
                return c1e.a;
            case 18:
                return b09.w(((Integer) obj).intValue(), "following_list_tab_users_loading_item_");
            case 19:
                ((qg2) obj).getClass();
                return new k25.a();
            case 20:
                jyb jybVar6 = (jyb) obj;
                jybVar6.getClass();
                hyb.a(jybVar6);
                return c1e.a;
            case 21:
                return Float.valueOf(((Float) obj).floatValue() / 4.0f);
            case 22:
                synchronized (uic.c) {
                    List list = uic.i;
                    int size = list.size();
                    for (int i = 0; i < size; i++) {
                        ((x45) list.get(i)).invoke(obj);
                    }
                }
                return c1e.a;
            case 23:
                jyb jybVar7 = (jyb) obj;
                jybVar7.getClass();
                hyb.a(jybVar7);
                return c1e.a;
            case 24:
                jyb jybVar8 = (jyb) obj;
                jybVar8.getClass();
                hyb.a(jybVar8);
                return c1e.a;
            case 25:
                jyb jybVar9 = (jyb) obj;
                jybVar9.getClass();
                hyb.a(jybVar9);
                return c1e.a;
            case 26:
                jyb jybVar10 = (jyb) obj;
                jybVar10.getClass();
                hyb.a(jybVar10);
                return c1e.a;
            case 27:
                List list2 = (List) obj;
                list2.getClass();
                return Integer.valueOf(list2.size() >= 4 ? (int) Math.floor(list2.size() / 4.0f) : 1);
            case 28:
                ((List) obj).getClass();
                return 1;
            default:
                return c1e.a;
        }
    }
}
