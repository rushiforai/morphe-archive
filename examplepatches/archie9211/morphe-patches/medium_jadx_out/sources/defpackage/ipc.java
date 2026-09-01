package defpackage;

import com.medium.android.graphql.OnboardingStarterPacksQuery;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ipc extends p4d implements c55 {
    public ArrayList b;
    public boolean c;
    public int d;
    public /* synthetic */ bt8 e;
    public /* synthetic */ Map f;
    public final /* synthetic */ jpc g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ipc(jpc jpcVar, n92 n92Var) {
        super(3, n92Var);
        this.g = jpcVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        ipc ipcVar = new ipc(this.g, (n92) obj3);
        ipcVar.e = (bt8) obj;
        ipcVar.f = (Map) obj2;
        return ipcVar.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        ArrayList arrayList;
        boolean z;
        Object objA;
        int i;
        int i2;
        bt8 bt8Var = this.e;
        Map map = this.f;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i3 = this.d;
        if (i3 == 0) {
            br7.v(obj);
            if (bt8Var instanceof zs8) {
                return gpc.a;
            }
            if (!(bt8Var instanceof at8)) {
                if (bt8Var instanceof ys8) {
                    return new fpc(m4.I(((ys8) bt8Var).a));
                }
                ygf.a();
                return null;
            }
            at8 at8Var = (at8) bt8Var;
            List list = at8Var.a;
            if (list.isEmpty()) {
                return new fpc(m4.I(new IllegalStateException("No starter packs returned")));
            }
            arrayList = new ArrayList(cu1.k0(list, 10));
            Iterator it2 = list.iterator();
            while (true) {
                boolean zHasNext = it2.hasNext();
                jpc jpcVar = this.g;
                if (zHasNext) {
                    OnboardingStarterPacksQuery.StarterPack starterPack = (OnboardingStarterPacksQuery.StarterPack) it2.next();
                    List<OnboardingStarterPacksQuery.RecommendedPublisher> recommendedPublishers = starterPack.getRecommendedPublishers();
                    int size = 0;
                    if (recommendedPublishers == null || !recommendedPublishers.isEmpty()) {
                        Iterator<T> it3 = recommendedPublishers.iterator();
                        int i4 = 0;
                        while (it3.hasNext()) {
                            if (((OnboardingStarterPacksQuery.RecommendedPublisher) it3.next()).getOnUser() != null && (i4 = i4 + 1) < 0) {
                                d46.h0();
                                throw null;
                            }
                        }
                        i = i4;
                    } else {
                        i = 0;
                    }
                    List<OnboardingStarterPacksQuery.RecommendedPublisher> recommendedPublishers2 = starterPack.getRecommendedPublishers();
                    if (recommendedPublishers2 == null || !recommendedPublishers2.isEmpty()) {
                        Iterator<T> it4 = recommendedPublishers2.iterator();
                        int i5 = 0;
                        while (it4.hasNext()) {
                            if (((OnboardingStarterPacksQuery.RecommendedPublisher) it4.next()).getOnPublication() != null && (i5 = i5 + 1) < 0) {
                                d46.h0();
                                throw null;
                            }
                        }
                        i2 = i5;
                    } else {
                        i2 = 0;
                    }
                    String id = starterPack.getId();
                    String categoryName = starterPack.getCategoryName();
                    nr8 nr8VarB = jpcVar.d.b(starterPack.getId());
                    List<OnboardingStarterPacksQuery.WriterConnection> writerConnections = starterPack.getWriterConnections();
                    ArrayList arrayList2 = new ArrayList(cu1.k0(writerConnections, 10));
                    Iterator<T> it5 = writerConnections.iterator();
                    while (it5.hasNext()) {
                        arrayList2.add(((OnboardingStarterPacksQuery.WriterConnection) it5.next()).getImageId());
                    }
                    az5 az5VarF0 = bo.f0(bu1.m1(bu1.p1(arrayList2)));
                    List list2 = (List) map.get(starterPack.getId());
                    if (list2 != null) {
                        size = list2.size();
                    }
                    arrayList.add(new dpc(id, categoryName, nr8VarB, az5VarF0, i, i2, size));
                } else {
                    z = at8Var.b;
                    zxc zxcVar = jpcVar.e;
                    this.e = null;
                    this.f = null;
                    this.b = arrayList;
                    this.c = z;
                    this.d = 1;
                    objA = zxcVar.a(this);
                    if (objA == tb2Var) {
                        return tb2Var;
                    }
                }
            }
        } else {
            if (i3 != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            z = this.c;
            ArrayList arrayList3 = this.b;
            br7.v(obj);
            arrayList = arrayList3;
            objA = obj;
        }
        return new epc(arrayList, z, !((Boolean) objA).booleanValue());
    }
}
