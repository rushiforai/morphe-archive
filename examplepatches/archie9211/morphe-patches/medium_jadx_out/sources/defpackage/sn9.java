package defpackage;

import com.medium.android.graphql.fragment.PostResponses;
import com.medium.android.graphql.fragment.ResponsePostThreadData;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class sn9 {
    public static final ResponsePostThreadData.PagingInfo a(PostResponses postResponses) {
        ResponsePostThreadData responsePostThreadData;
        postResponses.getClass();
        PostResponses.ThreadedPostResponses threadedPostResponses = postResponses.getThreadedPostResponses();
        if (threadedPostResponses == null || (responsePostThreadData = threadedPostResponses.getResponsePostThreadData()) == null) {
            return null;
        }
        return responsePostThreadData.getPagingInfo();
    }

    public static final List b(PostResponses postResponses) {
        ResponsePostThreadData responsePostThreadData;
        postResponses.getClass();
        PostResponses.ThreadedPostResponses threadedPostResponses = postResponses.getThreadedPostResponses();
        List<ResponsePostThreadData.Post> posts = (threadedPostResponses == null || (responsePostThreadData = threadedPostResponses.getResponsePostThreadData()) == null) ? null : responsePostThreadData.getPosts();
        return posts == null ? ey3.a : posts;
    }
}
