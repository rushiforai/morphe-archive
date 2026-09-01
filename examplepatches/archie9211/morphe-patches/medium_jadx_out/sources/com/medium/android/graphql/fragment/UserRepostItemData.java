package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\f\b\u0086\b\u0018\u00002\u00020\u0001:\u0002$%B+\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\fJ\u0012\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0012\u0010\u0010\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J<\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007HÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0014\u0010\fJ\u0010\u0010\u0016\u001a\u00020\u0015HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001b\u001a\u00020\u001a2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018HÖ\u0003¢\u0006\u0004\b\u001b\u0010\u001cR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001d\u001a\u0004\b\u001e\u0010\fR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001d\u001a\u0004\b\u001f\u0010\fR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010 \u001a\u0004\b!\u0010\u000fR\u0019\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010\"\u001a\u0004\b#\u0010\u0011¨\u0006&"}, d2 = {"Lcom/medium/android/graphql/fragment/UserRepostItemData;", "Lg15;", "", "__typename", "id", "Lcom/medium/android/graphql/fragment/UserRepostItemData$Post;", "post", "Lcom/medium/android/graphql/fragment/UserRepostItemData$Repost;", "repost", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserRepostItemData$Post;Lcom/medium/android/graphql/fragment/UserRepostItemData$Repost;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Lcom/medium/android/graphql/fragment/UserRepostItemData$Post;", "component4", "()Lcom/medium/android/graphql/fragment/UserRepostItemData$Repost;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserRepostItemData$Post;Lcom/medium/android/graphql/fragment/UserRepostItemData$Repost;)Lcom/medium/android/graphql/fragment/UserRepostItemData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "Lcom/medium/android/graphql/fragment/UserRepostItemData$Post;", "getPost", "Lcom/medium/android/graphql/fragment/UserRepostItemData$Repost;", "getRepost", "Post", "Repost", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserRepostItemData implements g15 {
    private final String __typename;
    private final String id;
    private final Post post;
    private final Repost repost;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/UserRepostItemData$Post;", "", "__typename", "", "id", "postPreviewData", "Lcom/medium/android/graphql/fragment/PostPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getPostPreviewData", "()Lcom/medium/android/graphql/fragment/PostPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;
        private final PostPreviewData postPreviewData;

        public Post(String str, String str2, PostPreviewData postPreviewData) {
            y30.B(str, str2, postPreviewData);
            this.__typename = str;
            this.id = str2;
            this.postPreviewData = postPreviewData;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, PostPreviewData postPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            if ((i & 4) != 0) {
                postPreviewData = post.postPreviewData;
            }
            return post.copy(str, str2, postPreviewData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PostPreviewData getPostPreviewData() {
            return this.postPreviewData;
        }

        public final Post copy(String __typename, String id, PostPreviewData postPreviewData) {
            __typename.getClass();
            id.getClass();
            postPreviewData.getClass();
            return new Post(__typename, id, postPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id) && g76.L(this.postPreviewData, post.postPreviewData);
        }

        public final String getId() {
            return this.id;
        }

        public final PostPreviewData getPostPreviewData() {
            return this.postPreviewData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.postPreviewData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return y30.q(y30.u("Post(__typename=", str, ", id=", str2, ", postPreviewData="), this.postPreviewData, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\fJ\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J0\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\n¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/fragment/UserRepostItemData$Repost;", "", "__typename", "", "repostedAt", "", "note", "<init>", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getRepostedAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getNote", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/UserRepostItemData$Repost;", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Repost {
        private final String __typename;
        private final String note;
        private final Long repostedAt;

        public Repost(String str, Long l, String str2) {
            str.getClass();
            this.__typename = str;
            this.repostedAt = l;
            this.note = str2;
        }

        public static /* synthetic */ Repost copy$default(Repost repost, String str, Long l, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = repost.__typename;
            }
            if ((i & 2) != 0) {
                l = repost.repostedAt;
            }
            if ((i & 4) != 0) {
                str2 = repost.note;
            }
            return repost.copy(str, l, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Long getRepostedAt() {
            return this.repostedAt;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getNote() {
            return this.note;
        }

        public final Repost copy(String __typename, Long repostedAt, String note) {
            __typename.getClass();
            return new Repost(__typename, repostedAt, note);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Repost)) {
                return false;
            }
            Repost repost = (Repost) other;
            return g76.L(this.__typename, repost.__typename) && g76.L(this.repostedAt, repost.repostedAt) && g76.L(this.note, repost.note);
        }

        public final String getNote() {
            return this.note;
        }

        public final Long getRepostedAt() {
            return this.repostedAt;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Long l = this.repostedAt;
            int iHashCode2 = (iHashCode + (l == null ? 0 : l.hashCode())) * 31;
            String str = this.note;
            return iHashCode2 + (str != null ? str.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            Long l = this.repostedAt;
            String str2 = this.note;
            StringBuilder sb = new StringBuilder("Repost(__typename=");
            sb.append(str);
            sb.append(", repostedAt=");
            sb.append(l);
            sb.append(", note=");
            return ka1.v(sb, str2, ")");
        }
    }

    public UserRepostItemData(String str, String str2, Post post, Repost repost) {
        str.getClass();
        str2.getClass();
        this.__typename = str;
        this.id = str2;
        this.post = post;
        this.repost = repost;
    }

    public static /* synthetic */ UserRepostItemData copy$default(UserRepostItemData userRepostItemData, String str, String str2, Post post, Repost repost, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userRepostItemData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = userRepostItemData.id;
        }
        if ((i & 4) != 0) {
            post = userRepostItemData.post;
        }
        if ((i & 8) != 0) {
            repost = userRepostItemData.repost;
        }
        return userRepostItemData.copy(str, str2, post, repost);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final Post getPost() {
        return this.post;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final Repost getRepost() {
        return this.repost;
    }

    public final UserRepostItemData copy(String __typename, String id, Post post, Repost repost) {
        __typename.getClass();
        id.getClass();
        return new UserRepostItemData(__typename, id, post, repost);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserRepostItemData)) {
            return false;
        }
        UserRepostItemData userRepostItemData = (UserRepostItemData) other;
        return g76.L(this.__typename, userRepostItemData.__typename) && g76.L(this.id, userRepostItemData.id) && g76.L(this.post, userRepostItemData.post) && g76.L(this.repost, userRepostItemData.repost);
    }

    public final String getId() {
        return this.id;
    }

    public final Post getPost() {
        return this.post;
    }

    public final Repost getRepost() {
        return this.repost;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        Post post = this.post;
        int iHashCode = (iO + (post == null ? 0 : post.hashCode())) * 31;
        Repost repost = this.repost;
        return iHashCode + (repost != null ? repost.hashCode() : 0);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        Post post = this.post;
        Repost repost = this.repost;
        StringBuilder sbU = y30.u("UserRepostItemData(__typename=", str, ", id=", str2, ", post=");
        sbU.append(post);
        sbU.append(", repost=");
        sbU.append(repost);
        sbU.append(")");
        return sbU.toString();
    }
}
