package defpackage;

import com.medium.android.graphql.fragment.PostMetaData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class wh9 {
    public static final String a(PostMetaData postMetaData) {
        String id;
        PostMetaData.Creator creator = postMetaData.getCreator();
        return (creator == null || (id = creator.getId()) == null) ? "" : id;
    }
}
