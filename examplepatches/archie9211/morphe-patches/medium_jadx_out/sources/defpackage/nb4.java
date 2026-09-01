package defpackage;

import com.medium.android.core.navigation.PublicationReference;
import com.medium.refinerecommendations.RefineRecommendationsFilter;
import com.medium.refinerecommendations.RefineRecommendationsTab;
import com.medium.stats.ui.user.UserStatsTab;
import com.medium.stats.ui.user.a;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class nb4 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;

    public /* synthetic */ nb4(PublicationReference publicationReference, Integer num, String str, rba rbaVar, String str2, olb olbVar, r28 r28Var, lca lcaVar, int i) {
        this.a = 1;
        this.e = publicationReference;
        this.f = num;
        this.b = str;
        this.g = rbaVar;
        this.c = str2;
        this.h = olbVar;
        this.d = r28Var;
        this.i = lcaVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.i;
        Object obj4 = this.h;
        Object obj5 = this.g;
        Object obj6 = this.f;
        Object obj7 = this.c;
        Object obj8 = this.e;
        Object obj9 = this.b;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                k50.A((String) obj9, (String) obj7, (String) obj8, (String) obj6, (String) obj5, (lb4) obj4, this.d, (qb4) obj3, (x12) obj, iY);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                pba.f((PublicationReference) obj8, (Integer) obj6, (String) obj9, (rba) obj5, (String) obj7, (olb) obj4, this.d, (lca) obj3, (x12) obj, iY2);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(1);
                f49.n((String) obj9, (RefineRecommendationsTab) obj7, (RefineRecommendationsFilter) obj8, (zza) obj6, (uza) obj5, (x45) obj4, (nhc) obj3, this.d, (x12) obj, iY3);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(1);
                qq7.e((yub) obj9, (hub) obj7, (fub) obj8, (gub) obj6, (fub) obj5, (gub) obj4, (fub) obj3, this.d, (x12) obj, iY4);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY5 = tr7.y(1);
                to7.f((String) obj9, (UserStatsTab) obj8, (String) obj7, (ume) obj6, (tme) obj5, (a) obj4, this.d, (yme) obj3, (x12) obj, iY5);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ nb4(int i, int i2, r28 r28Var, Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
        this.e = obj3;
        this.f = obj4;
        this.g = obj5;
        this.h = obj6;
        this.i = obj7;
        this.d = r28Var;
    }

    public /* synthetic */ nb4(String str, UserStatsTab userStatsTab, String str2, ume umeVar, tme tmeVar, a aVar, r28 r28Var, yme ymeVar, int i) {
        this.a = 4;
        this.b = str;
        this.e = userStatsTab;
        this.c = str2;
        this.f = umeVar;
        this.g = tmeVar;
        this.h = aVar;
        this.d = r28Var;
        this.i = ymeVar;
    }

    public /* synthetic */ nb4(String str, String str2, String str3, String str4, String str5, lb4 lb4Var, r28 r28Var, qb4 qb4Var, int i) {
        this.a = 0;
        this.b = str;
        this.c = str2;
        this.e = str3;
        this.f = str4;
        this.g = str5;
        this.h = lb4Var;
        this.d = r28Var;
        this.i = qb4Var;
    }
}
