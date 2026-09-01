package defpackage;

import com.medium.android.graphql.fragment.PostVisibilityData;
import com.medium.proto.event.PostClientVisibilityState;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ax9 {
    public final l95 a;

    public ax9(l95 l95Var) {
        this.a = l95Var;
    }

    public final PostClientVisibilityState a(PostVisibilityData postVisibilityData) {
        postVisibilityData.getClass();
        int i = zw9.a[postVisibilityData.getVisibility().ordinal()];
        return i != 1 ? i != 2 ? i != 3 ? PostClientVisibilityState.PUBLIC : PostClientVisibilityState.PUBLIC : b(postVisibilityData) ? PostClientVisibilityState.LOCKED_MEMBER : PostClientVisibilityState.LOCKED_PREVIEW : PostClientVisibilityState.UNLISTED;
    }

    public final boolean b(PostVisibilityData postVisibilityData) {
        String id;
        PostVisibilityData.Creator creator;
        PostVisibilityData.Collection collection;
        PostVisibilityData.ViewerEdge viewerEdge;
        rj2 rj2VarA = this.a.a();
        if (rj2VarA != null) {
            boolean z = (postVisibilityData == null || (collection = postVisibilityData.getCollection()) == null || (viewerEdge = collection.getViewerEdge()) == null || (!viewerEdge.isEditor() && !viewerEdge.getCanEditPosts() && !viewerEdge.getCanEditOwnPosts())) ? false : true;
            if (postVisibilityData == null || (creator = postVisibilityData.getCreator()) == null || (id = creator.getId()) == null) {
                id = "";
            }
            if (z || rj2VarA.i.getReadingAccess() == yw7.UNLIMITED || id.equals(rj2VarA.a)) {
                return true;
            }
        }
        return false;
    }
}
