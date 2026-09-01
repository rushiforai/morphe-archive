package defpackage;

import com.medium.android.graphql.OnboardingStarterPacksQuery;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class et8 {
    public final hs8 a;
    public final r6c b = k40.x(0, 7, null);

    public et8(hs8 hs8Var) {
        this.a = hs8Var;
    }

    public static bt8 a(Object obj) {
        Throwable thB = bjb.b(obj);
        if (thB != null) {
            return new ys8(thB);
        }
        HashSet hashSet = new HashSet();
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : (List) obj) {
            if (hashSet.add(((OnboardingStarterPacksQuery.StarterPack) obj2).getId())) {
                arrayList.add(obj2);
            }
        }
        return new at8(arrayList, false);
    }
}
