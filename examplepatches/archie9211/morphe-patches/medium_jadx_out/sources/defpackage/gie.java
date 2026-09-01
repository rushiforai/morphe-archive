package defpackage;

import com.medium.android.profile.ui.view.UserProfileReference;
import com.medium.android.profile.ui.view.UserProfileTab;
import com.medium.android.profile.ui.view.e;
import com.medium.android.profile.ui.view.m;
import com.medium.android.profile.ui.you.YouProfileTab;
import com.medium.android.profile.ui.you.b;
import com.medium.android.profile.ui.you.i;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class gie implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ gie(UserProfileReference userProfileReference, UserProfileTab userProfileTab, String str, pge pgeVar, r28 r28Var, m mVar, int i) {
        this.a = 0;
        this.c = userProfileReference;
        this.d = userProfileTab;
        this.e = str;
        this.f = pgeVar;
        this.b = r28Var;
        this.g = mVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.g;
        Object obj4 = this.f;
        Object obj5 = this.e;
        Object obj6 = this.d;
        Object obj7 = this.c;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                e.h((UserProfileReference) obj7, (UserProfileTab) obj6, (String) obj5, (pge) obj4, this.b, (m) obj3, (x12) obj, iY);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(196609);
                yi2.s((yle) obj7, (kv6) obj6, (gle) obj5, (k8b) obj4, (sh9) obj3, this.b, (x12) obj, iY2);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(24577);
                yi2.I((String) obj5, (String) obj7, (bo4) obj6, (dle) obj4, this.b, (ime) obj3, (x12) obj, iY3);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(1);
                ht2.Z((bo4) obj7, (String) obj5, (bo4) obj6, (fub) obj4, this.b, (ooe) obj3, (x12) obj, iY4);
                break;
            case 4:
                ((Integer) obj2).getClass();
                int iY5 = tr7.y(24625);
                vo7.m((String) obj5, (paf) obj7, (d2f) obj6, (bo4) obj4, this.b, (kbf) obj3, (x12) obj, iY5);
                break;
            case 5:
                ((Integer) obj2).getClass();
                int iY6 = tr7.y(1);
                b.a((ubf) obj7, (bo4) obj6, (j78) obj5, (j78) obj4, (d2f) obj3, this.b, (x12) obj, iY6);
                break;
            case 6:
                ((Integer) obj2).getClass();
                int iY7 = tr7.y(1);
                b.g((YouProfileTab) obj7, (String) obj5, (bo4) obj6, (obf) obj4, this.b, (i) obj3, (x12) obj, iY7);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY8 = tr7.y(196609);
                pwd.g((kff) obj7, (iff) obj6, (kv6) obj5, (sh9) obj4, (gff) obj3, this.b, (x12) obj, iY8);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ gie(int i, int i2, r28 r28Var, Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
        this.f = obj4;
        this.g = obj5;
        this.b = r28Var;
    }

    public /* synthetic */ gie(int i, int i2, r28 r28Var, que queVar, Object obj, Object obj2, Object obj3, String str) {
        this.a = i2;
        this.e = str;
        this.c = obj;
        this.d = obj2;
        this.f = obj3;
        this.b = r28Var;
        this.g = queVar;
    }

    public /* synthetic */ gie(Object obj, String str, bo4 bo4Var, Object obj2, r28 r28Var, que queVar, int i, int i2) {
        this.a = i2;
        this.c = obj;
        this.e = str;
        this.d = bo4Var;
        this.f = obj2;
        this.b = r28Var;
        this.g = queVar;
    }
}
