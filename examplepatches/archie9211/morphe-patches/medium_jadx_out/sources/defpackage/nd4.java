package defpackage;

import com.medium.android.graphql.ExploreQuery;
import com.medium.android.graphql.fragment.PostPreviewData;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nd4 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ lig c;
    public final /* synthetic */ boolean d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nd4(lig ligVar, boolean z, n92 n92Var) {
        super(2, n92Var);
        this.c = ligVar;
        this.d = z;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new nd4(this.c, this.d, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((nd4) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Object hd4Var;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            km4.I(wld.a, null, "Fetch explore content", new Object[0], "Fetch explore content");
            f64 f64Var = (f64) this.c.b;
            yd4 yd4Var = this.d ? yd4.NetworkFirst : yd4.CacheFirst;
            this.b = 1;
            objA = f64Var.a(yd4Var, this);
            if (objA == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            objA = ((bjb) obj).a;
        }
        if (objA instanceof ajb) {
            Throwable thB = bjb.b(objA);
            if (thB == null) {
                thB = new Exception("An error occurred");
            }
            wld.a.e(thB, "Fetch explore content failed", new Object[0]);
            hd4Var = new ajb(thB);
        } else {
            br7.v(objA);
            ExploreQuery.Data data = (ExploreQuery.Data) objA;
            km4.I(wld.a, null, "Fetch explore content successful", new Object[0], "Fetch explore content successful");
            List<ExploreQuery.Edge> edges = data.getRecommendedTags().getEdges();
            ArrayList arrayList = new ArrayList(cu1.k0(edges, 10));
            Iterator<T> it2 = edges.iterator();
            while (it2.hasNext()) {
                arrayList.add(((ExploreQuery.Edge) it2.next()).getNode().getTagData());
            }
            List<ExploreQuery.Edge1> edges2 = data.getTrendingPostsFeed().getEdges();
            ArrayList arrayList2 = new ArrayList();
            Iterator<T> it3 = edges2.iterator();
            while (it3.hasNext()) {
                ExploreQuery.Post post = ((ExploreQuery.Edge1) it3.next()).getNode().getPost();
                PostPreviewData postPreviewData = post != null ? post.getPostPreviewData() : null;
                if (postPreviewData != null) {
                    arrayList2.add(postPreviewData);
                }
            }
            List<ExploreQuery.Item> items = data.getStaffPicksFeed().getItems();
            ArrayList arrayList3 = new ArrayList();
            Iterator<T> it4 = items.iterator();
            while (it4.hasNext()) {
                ExploreQuery.Post1 post2 = ((ExploreQuery.Item) it4.next()).getPost();
                PostPreviewData postPreviewData2 = post2 != null ? post2.getPostPreviewData() : null;
                if (postPreviewData2 != null) {
                    arrayList3.add(postPreviewData2);
                }
            }
            List<ExploreQuery.Item1> items2 = data.getDiscoverPosts().getItems();
            ArrayList arrayList4 = new ArrayList();
            Iterator<T> it5 = items2.iterator();
            while (it5.hasNext()) {
                ExploreQuery.Post2 post3 = ((ExploreQuery.Item1) it5.next()).getPost();
                PostPreviewData postPreviewData3 = post3 != null ? post3.getPostPreviewData() : null;
                if (postPreviewData3 != null) {
                    arrayList4.add(postPreviewData3);
                }
            }
            List<ExploreQuery.Edge2> edges3 = data.getRecommendedPublishers().getEdges();
            ArrayList arrayList5 = new ArrayList(cu1.k0(edges3, 10));
            Iterator<T> it6 = edges3.iterator();
            while (it6.hasNext()) {
                arrayList5.add(((ExploreQuery.Edge2) it6.next()).getNode().getWhoToFollowNode());
            }
            hd4Var = new hd4(arrayList, arrayList2, arrayList3, arrayList4, arrayList5);
        }
        return new bjb(hd4Var);
    }
}
