package defpackage;

import com.medium.android.graphql.OnboardingStarterPackQuery;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qs8 extends p4d implements c55 {
    public /* synthetic */ os8 b;
    public /* synthetic */ Map c;
    public final /* synthetic */ String d;
    public final /* synthetic */ ts8 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qs8(String str, ts8 ts8Var, n92 n92Var) {
        super(3, n92Var);
        this.d = str;
        this.e = ts8Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        qs8 qs8Var = new qs8(this.d, this.e, (n92) obj3);
        qs8Var.b = (os8) obj;
        qs8Var.c = (Map) obj2;
        return qs8Var.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        String id;
        os8 os8Var = this.b;
        Map map = this.c;
        br7.v(obj);
        List list = (List) map.get(this.d);
        Set setQ1 = list != null ? bu1.q1(list) : ny3.a;
        if (setQ1.isEmpty() || !(os8Var instanceof ns8)) {
            return os8Var;
        }
        ns8 ns8Var = (ns8) os8Var;
        OnboardingStarterPackQuery.OnStarterPack onStarterPack = ns8Var.a;
        List<OnboardingStarterPackQuery.RecommendedPublisher> recommendedPublishers = onStarterPack.getRecommendedPublishers();
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : recommendedPublishers) {
            OnboardingStarterPackQuery.RecommendedPublisher recommendedPublisher = (OnboardingStarterPackQuery.RecommendedPublisher) obj2;
            OnboardingStarterPackQuery.OnUser onUser = recommendedPublisher.getOnUser();
            if (onUser == null || (id = onUser.getId()) == null) {
                OnboardingStarterPackQuery.OnPublication onPublication = recommendedPublisher.getOnPublication();
                id = onPublication != null ? onPublication.getId() : null;
            }
            if (!bu1.p0(setQ1, id)) {
                arrayList.add(obj2);
            }
        }
        return ns8.a(ns8Var, OnboardingStarterPackQuery.OnStarterPack.copy$default(onStarterPack, null, null, null, arrayList, 7, null), 2);
    }
}
