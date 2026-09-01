package defpackage;

import com.medium.android.graphql.fragment.CollectionMuteData;
import com.medium.android.graphql.fragment.PostPreviewData;
import com.medium.android.graphql.fragment.UserMuteData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class k9c extends p4d implements c55 {
    public /* synthetic */ Object b;
    public /* synthetic */ boolean c;
    public final /* synthetic */ l9c d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k9c(l9c l9cVar, n92 n92Var) {
        super(3, n92Var);
        this.d = l9cVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        Object obj4 = ((bjb) obj).a;
        boolean zBooleanValue = ((Boolean) obj2).booleanValue();
        k9c k9cVar = new k9c(this.d, (n92) obj3);
        k9cVar.b = obj4;
        k9cVar.c = zBooleanValue;
        return k9cVar.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        boolean z;
        CollectionMuteData collectionMuteData;
        CollectionMuteData.ViewerEdge viewerEdge;
        UserMuteData userMuteData;
        UserMuteData.ViewerEdge viewerEdge2;
        Object obj2 = this.b;
        boolean z2 = this.c;
        br7.v(obj);
        if (bjb.b(obj2) != null) {
            return g9c.a;
        }
        PostPreviewData postPreviewData = (PostPreviewData) obj2;
        l9c l9cVar = this.d;
        String str = l9cVar.b;
        PostPreviewData.Creator creator = postPreviewData.getCreator();
        boolean z3 = false;
        if (creator == null || (userMuteData = creator.getUserMuteData()) == null || (viewerEdge2 = userMuteData.getViewerEdge()) == null || viewerEdge2.isMuting()) {
            z = false;
        } else {
            z = false;
            z3 = true;
        }
        PostPreviewData.Creator creator2 = postPreviewData.getCreator();
        String id = creator2 != null ? creator2.getId() : null;
        if (id == null) {
            ywb.g(ev6.x("Author of post with id ", l9cVar.b, " has no id"));
            return null;
        }
        PostPreviewData.Creator creator3 = postPreviewData.getCreator();
        String name = creator3 != null ? creator3.getName() : null;
        if (name == null) {
            PostPreviewData.Creator creator4 = postPreviewData.getCreator();
            ywb.g(ev6.x("Author with id ", creator4 != null ? creator4.getId() : null, " has no name"));
            return null;
        }
        PostPreviewData.Collection collection = postPreviewData.getCollection();
        boolean z4 = (collection == null || (collectionMuteData = collection.getCollectionMuteData()) == null || (viewerEdge = collectionMuteData.getViewerEdge()) == null || viewerEdge.isMuting()) ? z : true;
        PostPreviewData.Collection collection2 = postPreviewData.getCollection();
        String id2 = collection2 != null ? collection2.getId() : null;
        PostPreviewData.Collection collection3 = postPreviewData.getCollection();
        return new f9c(str, z3, id, name, z4, id2, collection3 != null ? collection3.getName() : null, z2, l9cVar.o);
    }
}
