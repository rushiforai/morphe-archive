package defpackage;

import com.medium.android.graphql.fragment.TagData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class f9d {
    public static final w7d a(TagData tagData) {
        tagData.getClass();
        String id = tagData.getId();
        if (id == null) {
            ay0.e("Required value was null.");
            return null;
        }
        String normalizedTagSlug = tagData.getNormalizedTagSlug();
        if (normalizedTagSlug == null) {
            ay0.e("Required value was null.");
            return null;
        }
        String displayTitle = tagData.getDisplayTitle();
        if (displayTitle == null) {
            ay0.e("Required value was null.");
            return null;
        }
        Integer followerCount = tagData.getFollowerCount();
        if (followerCount == null || followerCount.intValue() < 0) {
            followerCount = null;
        }
        Long postCount = tagData.getPostCount();
        if (postCount == null || postCount.longValue() < 0) {
            postCount = null;
        }
        return new w7d(id, normalizedTagSlug, displayTitle, followerCount, postCount, tagData.getViewerEdge().isFollowing());
    }
}
