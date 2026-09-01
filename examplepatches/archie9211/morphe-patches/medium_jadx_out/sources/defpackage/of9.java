package defpackage;

import com.medium.android.graphql.fragment.PostClapsData;
import com.medium.android.graphql.fragment.PostFooterCountData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class of9 {
    public static final int a(PostFooterCountData postFooterCountData) {
        postFooterCountData.getClass();
        Integer clapCount = postFooterCountData.getPostClapsData().getViewerEdge().getClapCount();
        if (clapCount != null) {
            return clapCount.intValue();
        }
        return 0;
    }

    public static final long b(PostFooterCountData postFooterCountData) {
        postFooterCountData.getClass();
        Long totalClapCount = postFooterCountData.getPostClapsData().getTotalClapCount();
        if (totalClapCount != null) {
            return totalClapCount.longValue();
        }
        return 0L;
    }

    public static final PostFooterCountData c(PostFooterCountData postFooterCountData, int i, long j) {
        postFooterCountData.getClass();
        return PostFooterCountData.copy$default(postFooterCountData, null, null, false, null, null, null, null, PostClapsData.copy$default(postFooterCountData.getPostClapsData(), null, null, Long.valueOf(j), PostClapsData.ViewerEdge.copy$default(postFooterCountData.getPostClapsData().getViewerEdge(), null, null, Integer.valueOf(i), 3, null), 3, null), null, 383, null);
    }
}
