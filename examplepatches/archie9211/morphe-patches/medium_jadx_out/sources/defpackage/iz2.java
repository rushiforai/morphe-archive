package defpackage;

import android.util.Log;
import androidx.datastore.core.CorruptionException;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class iz2 implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ iz2(int i) {
        this.a = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((ae6) obj).getClass();
                return c1eVar;
            case 1:
                rj2 rj2Var = (rj2) obj;
                if (rj2Var != null) {
                    return rj2Var.a;
                }
                return null;
            case 2:
                List list = (List) obj;
                Object obj2 = list.get(0);
                obj2.getClass();
                int iIntValue = ((Integer) obj2).intValue();
                Object obj3 = list.get(1);
                obj3.getClass();
                return new d13(iIntValue, ((Float) obj3).floatValue(), new c13(list, 0));
            case 3:
                gyb.i((jyb) obj);
                return c1eVar;
            case 4:
                gyb.i((jyb) obj);
                return c1eVar;
            case 5:
                jyb jybVar = (jyb) obj;
                jybVar.getClass();
                hyb.a(jybVar);
                return c1eVar;
            case 6:
                return c1eVar;
            case 7:
                jyb jybVar2 = (jyb) obj;
                jybVar2.getClass();
                hyb.a(jybVar2);
                return c1eVar;
            case 8:
                jyb jybVar3 = (jyb) obj;
                jybVar3.getClass();
                hyb.a(jybVar3);
                return c1eVar;
            case 9:
                jyb jybVar4 = (jyb) obj;
                jybVar4.getClass();
                hyb.a(jybVar4);
                return c1eVar;
            case 10:
                return c1eVar;
            case 11:
                return Boolean.TRUE;
            case 12:
                jyb jybVar5 = (jyb) obj;
                jybVar5.getClass();
                z82.a.getClass();
                gyb.c(jybVar5, y82.d);
                return c1eVar;
            case 13:
                ((String) obj).getClass();
                return c1eVar;
            case 14:
                ((String) obj).getClass();
                return c1eVar;
            case 15:
                return c1eVar;
            case 16:
                jyb jybVar6 = (jyb) obj;
                jybVar6.getClass();
                hyb.a(jybVar6);
                return c1eVar;
            case 17:
                k9d k9dVar = (k9d) obj;
                k9dVar.getClass();
                return ka1.r("explore_module_recommended_tags_tag_", k9dVar.a);
            case 18:
                hne hneVar = (hne) obj;
                hneVar.getClass();
                return ka1.r("explore_friends_to_follow_item_", hneVar.a);
            case 19:
                x2f x2fVar = (x2f) obj;
                x2fVar.getClass();
                return ka1.r("explore_who_to_follow_item_", x2fVar.getId());
            case 20:
                dr9 dr9Var = (dr9) obj;
                dr9Var.getClass();
                return "explore_module_staff_picks_post_".concat(dr9Var.a);
            case 21:
                jyb jybVar7 = (jyb) obj;
                jybVar7.getClass();
                hyb.a(jybVar7);
                return c1eVar;
            case 22:
                dr9 dr9Var2 = (dr9) obj;
                dr9Var2.getClass();
                return "explore_module_recommended_posts_post_".concat(dr9Var2.a);
            case 23:
                jyb jybVar8 = (jyb) obj;
                jybVar8.getClass();
                hyb.a(jybVar8);
                return c1eVar;
            case 24:
                jyb jybVar9 = (jyb) obj;
                jybVar9.getClass();
                hyb.a(jybVar9);
                return c1eVar;
            case 25:
                lx1 lx1Var = (lx1) obj;
                lx1Var.getClass();
                return Boolean.valueOf(lx1Var.a.b);
            case 26:
                jyb jybVar10 = (jyb) obj;
                jybVar10.getClass();
                hyb.a(jybVar10);
                return c1eVar;
            case 27:
                hne hneVar2 = (hne) obj;
                hneVar2.getClass();
                return ka1.r("find_friends_", hneVar2.j);
            case 28:
                CorruptionException corruptionException = (CorruptionException) obj;
                corruptionException.getClass();
                Log.w("FirebaseSessions", "CorruptionException in session configs DataStore", corruptionException);
                return y3b.k;
            default:
                gyb.g((jyb) obj, 0);
                return c1eVar;
        }
    }
}
