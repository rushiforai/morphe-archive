package defpackage;

import com.medium.android.graphql.HomeFollowingQuery;
import com.medium.android.graphql.fragment.HomeFeedItemData;
import com.medium.android.graphql.fragment.PostPreviewData;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qu7 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ ru7 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qu7(ru7 ru7Var, n92 n92Var) {
        super(2, n92Var);
        this.c = ru7Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new qu7(this.c, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((qu7) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objB;
        HomeFeedItemData homeFeedItemData;
        HomeFeedItemData.Post post;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        ru7 ru7Var = this.c;
        if (i == 0) {
            br7.v(obj);
            mq5 mq5Var = ru7Var.b;
            this.b = 1;
            objB = mq5Var.b(null, yd4.CacheFirst, this);
            if (objB == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            objB = ((bjb) obj).a;
        }
        if (!(objB instanceof ajb)) {
            List<HomeFollowingQuery.Item> items = ((HomeFollowingQuery.FollowingFeed) objB).getItems();
            ArrayList arrayList = ru7Var.d;
            for (HomeFollowingQuery.Item item : items) {
                PostPreviewData postPreviewData = (item == null || (homeFeedItemData = item.getHomeFeedItemData()) == null || (post = homeFeedItemData.getPost()) == null) ? null : post.getPostPreviewData();
                if (postPreviewData != null) {
                    arrayList.add(postPreviewData);
                }
            }
        }
        Throwable thB = bjb.b(objB);
        if (thB != null) {
            wld.a.e(thB, "Widget data loading failed", new Object[0]);
        }
        return new bjb(objB);
    }
}
