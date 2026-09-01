package defpackage;

import android.content.Context;
import android.content.ContextWrapper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class b5 implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ b5(int i) {
        this.a = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return c1eVar;
            case 1:
                return c1eVar;
            case 2:
                Context context = (Context) obj;
                context.getClass();
                if (context instanceof ContextWrapper) {
                    return ((ContextWrapper) context).getBaseContext();
                }
                return null;
            case 3:
                jyb jybVar = (jyb) obj;
                jybVar.getClass();
                z82.a.getClass();
                gyb.c(jybVar, y82.c);
                return c1eVar;
            case 4:
                jyb jybVar2 = (jyb) obj;
                jybVar2.getClass();
                hyb.a(jybVar2);
                return c1eVar;
            case 5:
                jyb jybVar3 = (jyb) obj;
                jybVar3.getClass();
                z82.a.getClass();
                gyb.c(jybVar3, y82.d);
                return c1eVar;
            case 6:
                jyb jybVar4 = (jyb) obj;
                jybVar4.getClass();
                hyb.a(jybVar4);
                return c1eVar;
            case 7:
                lt1 lt1Var = (lt1) obj;
                lt1Var.getClass();
                return ka1.r("refine_recommendation_all_followed_collections_items_", lt1Var.a);
            case 8:
                jyb jybVar5 = (jyb) obj;
                jybVar5.getClass();
                hyb.a(jybVar5);
                return c1eVar;
            case 9:
                ybd ybdVar = (ybd) obj;
                ybdVar.getClass();
                return "refine_recommendation_all_followed_items_" + ybdVar;
            case 10:
                jyb jybVar6 = (jyb) obj;
                jybVar6.getClass();
                hyb.a(jybVar6);
                return c1eVar;
            case 11:
                hne hneVar = (hne) obj;
                hneVar.getClass();
                return "refine_recommendation_all_followed_items_" + hneVar;
            case 12:
                jyb jybVar7 = (jyb) obj;
                jybVar7.getClass();
                hyb.a(jybVar7);
                return c1eVar;
            case 13:
                lt1 lt1Var2 = (lt1) obj;
                lt1Var2.getClass();
                return ka1.r("refine_recommendation_all_muted_items_", lt1Var2.j);
            case 14:
                jyb jybVar8 = (jyb) obj;
                jybVar8.getClass();
                hyb.a(jybVar8);
                return c1eVar;
            case 15:
                hne hneVar2 = (hne) obj;
                hneVar2.getClass();
                return "refine_recommendation_all_muted_items_" + hneVar2;
            case 16:
                jyb jybVar9 = (jyb) obj;
                jybVar9.getClass();
                hyb.a(jybVar9);
                return c1eVar;
            case 17:
                hne hneVar3 = (hne) obj;
                hneVar3.getClass();
                return ka1.r("all_suggestions_friends_friend_", hneVar3.a);
            case 18:
                jyb jybVar10 = (jyb) obj;
                jybVar10.getClass();
                hyb.a(jybVar10);
                return c1eVar;
            case 19:
                lt1 lt1Var3 = (lt1) obj;
                lt1Var3.getClass();
                return ka1.r("all_suggestions_publications_publication_", lt1Var3.a);
            case 20:
                jyb jybVar11 = (jyb) obj;
                jybVar11.getClass();
                hyb.a(jybVar11);
                return c1eVar;
            case 21:
                ybd ybdVar2 = (ybd) obj;
                ybdVar2.getClass();
                return "all_suggestions_tags_tag_".concat(ybdVar2.a);
            case 22:
                jyb jybVar12 = (jyb) obj;
                jybVar12.getClass();
                hyb.a(jybVar12);
                return c1eVar;
            case 23:
                hne hneVar4 = (hne) obj;
                hneVar4.getClass();
                return ka1.r("all_suggestions_writers_writer_", hneVar4.a);
            case 24:
                jyb jybVar13 = (jyb) obj;
                jybVar13.getClass();
                hyb.a(jybVar13);
                return c1eVar;
            case 25:
                return Float.valueOf(((Float) obj).floatValue() / 2.0f);
            case 26:
                return Boolean.TRUE;
            case 27:
                ((Integer) obj).getClass();
                return Float.valueOf(Float.NaN);
            case 28:
                return Boolean.TRUE;
            default:
                ((Long) obj).getClass();
                return c1eVar;
        }
    }
}
