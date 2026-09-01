package defpackage;

import com.medium.android.core.navigation.NotificationFilterType;
import com.medium.android.core.share.PostShareData;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.following.FollowingTab;
import com.medium.android.postpage.share.a;
import com.medium.android.yourlibrary.YourLibraryTab;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class mc3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    public /* synthetic */ mc3(PostShareData postShareData, String str, String str2, String str3, a aVar, r28 r28Var, j6c j6cVar, int i) {
        this.a = 11;
        this.f = postShareData;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.g = aVar;
        this.b = r28Var;
        this.h = j6cVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.h;
        Object obj4 = this.b;
        Object obj5 = this.g;
        Object obj6 = this.d;
        Object obj7 = this.f;
        Object obj8 = this.c;
        Object obj9 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                rx0.n((String) obj8, (String) obj6, (String) obj9, (String) obj7, (rz2) obj5, (r28) obj4, (wc3) obj3, (x12) obj, tr7.y(1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                hlg.d((x64) obj8, (kv6) obj6, (l64) obj9, (sh9) obj7, (obe) obj5, (cs1) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 2:
                String str = (String) obj8;
                String str2 = (String) obj6;
                nhc nhcVar = (nhc) obj3;
                r28 r28Var = (r28) obj4;
                x12 x12Var = (x12) obj;
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                f49.g(iY, x12Var, (ay4) obj7, r28Var, (gz8) obj5, nhcVar, (FollowingTab) obj9, str, str2);
                break;
            case 3:
                ((Integer) obj2).getClass();
                nk7.w((String) obj8, (bo4) obj6, (nhc) obj9, (rq5) obj7, (m45) obj5, (r28) obj4, (ap5) obj3, (x12) obj, tr7.y(1));
                break;
            case 4:
                ((Integer) obj2).getClass();
                qb8.n((String) obj8, (bo4) obj6, (nhc) obj9, (rq5) obj7, (m45) obj5, (r28) obj4, (bq5) obj3, (x12) obj, tr7.y(1));
                break;
            case 5:
                ((Integer) obj2).getClass();
                g01.t((String) obj8, (String) obj6, (SusiDestination) obj9, (SusiOperation) obj7, (hd7) obj5, (r28) obj4, (zd7) obj3, (x12) obj, tr7.y(1));
                break;
            case 6:
                ((Integer) obj2).getClass();
                xk8.a((fl8) obj8, (NotificationFilterType) obj6, (kv6) obj9, (vk8) obj7, (ek8) obj5, (obe) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 7:
                ((Integer) obj2).getClass();
                pba.a((List) obj6, (String) obj8, (List) obj9, (Integer) obj7, (rba) obj5, (nba) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 8:
                ((Integer) obj2).getClass();
                qq7.c((String) obj8, (String) obj6, (mda) obj7, (String) obj9, (fha) obj5, (wea) obj4, (lma) obj3, (x12) obj, tr7.y(1));
                break;
            case 9:
                ((Integer) obj2).getClass();
                pla.a((hna) obj8, (x45) obj6, (nla) obj9, (pkf) obj7, (my6) obj5, (zm7) obj3, (r28) obj4, (x12) obj, tr7.y(49));
                break;
            case 10:
                ((Integer) obj2).getClass();
                pgb.f((uid) obj8, (aib) obj6, (kv6) obj9, (nhc) obj7, (lgb) obj5, (ngb) obj3, (r28) obj4, (x12) obj, tr7.y(3073));
                break;
            case 11:
                ((Integer) obj2).getClass();
                kp7.g((PostShareData) obj7, (String) obj8, (String) obj6, (String) obj9, (a) obj5, (r28) obj4, (j6c) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                guc.q((YourLibraryTab) obj9, (String) obj8, (uef) obj7, (String) obj6, (bo4) obj5, (r28) obj4, (eff) obj3, (x12) obj, tr7.y(385));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ mc3(YourLibraryTab yourLibraryTab, String str, uef uefVar, String str2, bo4 bo4Var, r28 r28Var, eff effVar, int i) {
        this.a = 12;
        this.e = yourLibraryTab;
        this.c = str;
        this.f = uefVar;
        this.d = str2;
        this.g = bo4Var;
        this.b = r28Var;
        this.h = effVar;
    }

    public /* synthetic */ mc3(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
        this.f = obj4;
        this.g = obj5;
        this.h = obj6;
        this.b = r28Var;
    }

    public /* synthetic */ mc3(String str, Object obj, Object obj2, Object obj3, Object obj4, r28 r28Var, que queVar, int i, int i2) {
        this.a = i2;
        this.c = str;
        this.d = obj;
        this.e = obj2;
        this.f = obj3;
        this.g = obj4;
        this.b = r28Var;
        this.h = queVar;
    }

    public /* synthetic */ mc3(String str, String str2, mda mdaVar, String str3, fha fhaVar, wea weaVar, lma lmaVar, int i) {
        this.a = 8;
        this.c = str;
        this.d = str2;
        this.f = mdaVar;
        this.e = str3;
        this.g = fhaVar;
        this.b = weaVar;
        this.h = lmaVar;
    }

    public /* synthetic */ mc3(List list, String str, List list2, Integer num, rba rbaVar, nba nbaVar, r28 r28Var, int i) {
        this.a = 7;
        this.d = list;
        this.c = str;
        this.e = list2;
        this.f = num;
        this.g = rbaVar;
        this.h = nbaVar;
        this.b = r28Var;
    }
}
