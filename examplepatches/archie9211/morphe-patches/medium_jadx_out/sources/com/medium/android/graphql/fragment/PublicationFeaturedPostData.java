package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ho2;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\r\b\u0086\b\u0018\u00002\u00020\u0001:\u0002'(B'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J8\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\bHÆ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0016\u0010\rJ\u0010\u0010\u0018\u001a\u00020\u0017HÖ\u0001¢\u0006\u0004\b\u0018\u0010\u0019J\u001a\u0010\u001d\u001a\u00020\u001c2\b\u0010\u001b\u001a\u0004\u0018\u00010\u001aHÖ\u0003¢\u0006\u0004\b\u001d\u0010\u001eR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001f\u001a\u0004\b \u0010\rR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010!\u001a\u0004\b\"\u0010\u000fR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010#\u001a\u0004\b$\u0010\u0011R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010%\u001a\u0004\b&\u0010\u0013¨\u0006)"}, d2 = {"Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData;", "Lg15;", "", "__typename", "", "featuredAt", "Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData$FeaturedBy;", "featuredBy", "Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData$Post;", "post", "<init>", "(Ljava/lang/String;JLcom/medium/android/graphql/fragment/PublicationFeaturedPostData$FeaturedBy;Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData$Post;)V", "component1", "()Ljava/lang/String;", "component2", "()J", "component3", "()Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData$FeaturedBy;", "component4", "()Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData$Post;", "copy", "(Ljava/lang/String;JLcom/medium/android/graphql/fragment/PublicationFeaturedPostData$FeaturedBy;Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData$Post;)Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "J", "getFeaturedAt", "Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData$FeaturedBy;", "getFeaturedBy", "Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData$Post;", "getPost", "FeaturedBy", "Post", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationFeaturedPostData implements g15 {
    private final String __typename;
    private final long featuredAt;
    private final FeaturedBy featuredBy;
    private final Post post;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData$FeaturedBy;", "", "__typename", "", "id", "name", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class FeaturedBy {
        private final String __typename;
        private final String id;
        private final String name;

        public FeaturedBy(String str, String str2, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
        }

        public static /* synthetic */ FeaturedBy copy$default(FeaturedBy featuredBy, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = featuredBy.__typename;
            }
            if ((i & 2) != 0) {
                str2 = featuredBy.id;
            }
            if ((i & 4) != 0) {
                str3 = featuredBy.name;
            }
            return featuredBy.copy(str, str2, str3);
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
        public final String getName() {
            return this.name;
        }

        public final FeaturedBy copy(String __typename, String id, String name) {
            __typename.getClass();
            id.getClass();
            return new FeaturedBy(__typename, id, name);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof FeaturedBy)) {
                return false;
            }
            FeaturedBy featuredBy = (FeaturedBy) other;
            return g76.L(this.__typename, featuredBy.__typename) && g76.L(this.id, featuredBy.id) && g76.L(this.name, featuredBy.name);
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return ka1.v(y30.u("FeaturedBy(__typename=", str, ", id=", str2, ", name="), this.name, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u0017\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u0010J\t\u0010\u0018\u001a\u00020\tHÆ\u0003JD\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001¢\u0006\u0002\u0010\u001aJ\u0013\u0010\u001b\u001a\u00020\u00072\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\rR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u0011\u001a\u0004\b\u0006\u0010\u0010R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData$Post;", "", "__typename", "", "id", "title", "isLocked", "", "postShareData", "Lcom/medium/android/graphql/fragment/PostShareData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lcom/medium/android/graphql/fragment/PostShareData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getTitle", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getPostShareData", "()Lcom/medium/android/graphql/fragment/PostShareData;", "component1", "component2", "component3", "component4", "component5", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lcom/medium/android/graphql/fragment/PostShareData;)Lcom/medium/android/graphql/fragment/PublicationFeaturedPostData$Post;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;
        private final Boolean isLocked;
        private final PostShareData postShareData;
        private final String title;

        public Post(String str, String str2, String str3, Boolean bool, PostShareData postShareData) {
            str.getClass();
            str2.getClass();
            postShareData.getClass();
            this.__typename = str;
            this.id = str2;
            this.title = str3;
            this.isLocked = bool;
            this.postShareData = postShareData;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, String str3, Boolean bool, PostShareData postShareData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            if ((i & 4) != 0) {
                str3 = post.title;
            }
            if ((i & 8) != 0) {
                bool = post.isLocked;
            }
            if ((i & 16) != 0) {
                postShareData = post.postShareData;
            }
            PostShareData postShareData2 = postShareData;
            String str4 = str3;
            return post.copy(str, str2, str4, bool, postShareData2);
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
        public final String getTitle() {
            return this.title;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Boolean getIsLocked() {
            return this.isLocked;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final PostShareData getPostShareData() {
            return this.postShareData;
        }

        public final Post copy(String __typename, String id, String title, Boolean isLocked, PostShareData postShareData) {
            __typename.getClass();
            id.getClass();
            postShareData.getClass();
            return new Post(__typename, id, title, isLocked, postShareData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id) && g76.L(this.title, post.title) && g76.L(this.isLocked, post.isLocked) && g76.L(this.postShareData, post.postShareData);
        }

        public final String getId() {
            return this.id;
        }

        public final PostShareData getPostShareData() {
            return this.postShareData;
        }

        public final String getTitle() {
            return this.title;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.title;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            Boolean bool = this.isLocked;
            return this.postShareData.hashCode() + ((iHashCode + (bool != null ? bool.hashCode() : 0)) * 31);
        }

        public final Boolean isLocked() {
            return this.isLocked;
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.title;
            Boolean bool = this.isLocked;
            PostShareData postShareData = this.postShareData;
            StringBuilder sbU = y30.u("Post(__typename=", str, ", id=", str2, ", title=");
            sbU.append(str3);
            sbU.append(", isLocked=");
            sbU.append(bool);
            sbU.append(", postShareData=");
            sbU.append(postShareData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public PublicationFeaturedPostData(String str, long j, FeaturedBy featuredBy, Post post) {
        str.getClass();
        featuredBy.getClass();
        post.getClass();
        this.__typename = str;
        this.featuredAt = j;
        this.featuredBy = featuredBy;
        this.post = post;
    }

    public static /* synthetic */ PublicationFeaturedPostData copy$default(PublicationFeaturedPostData publicationFeaturedPostData, String str, long j, FeaturedBy featuredBy, Post post, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publicationFeaturedPostData.__typename;
        }
        if ((i & 2) != 0) {
            j = publicationFeaturedPostData.featuredAt;
        }
        if ((i & 4) != 0) {
            featuredBy = publicationFeaturedPostData.featuredBy;
        }
        if ((i & 8) != 0) {
            post = publicationFeaturedPostData.post;
        }
        return publicationFeaturedPostData.copy(str, j, featuredBy, post);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final long getFeaturedAt() {
        return this.featuredAt;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final FeaturedBy getFeaturedBy() {
        return this.featuredBy;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final Post getPost() {
        return this.post;
    }

    public final PublicationFeaturedPostData copy(String __typename, long featuredAt, FeaturedBy featuredBy, Post post) {
        __typename.getClass();
        featuredBy.getClass();
        post.getClass();
        return new PublicationFeaturedPostData(__typename, featuredAt, featuredBy, post);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublicationFeaturedPostData)) {
            return false;
        }
        PublicationFeaturedPostData publicationFeaturedPostData = (PublicationFeaturedPostData) other;
        return g76.L(this.__typename, publicationFeaturedPostData.__typename) && this.featuredAt == publicationFeaturedPostData.featuredAt && g76.L(this.featuredBy, publicationFeaturedPostData.featuredBy) && g76.L(this.post, publicationFeaturedPostData.post);
    }

    public final long getFeaturedAt() {
        return this.featuredAt;
    }

    public final FeaturedBy getFeaturedBy() {
        return this.featuredBy;
    }

    public final Post getPost() {
        return this.post;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        long j = this.featuredAt;
        return this.post.hashCode() + ((this.featuredBy.hashCode() + ((iHashCode + ((int) (j ^ (j >>> 32)))) * 31)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        long j = this.featuredAt;
        FeaturedBy featuredBy = this.featuredBy;
        Post post = this.post;
        StringBuilder sbI = ho2.I(j, "PublicationFeaturedPostData(__typename=", str, ", featuredAt=");
        sbI.append(", featuredBy=");
        sbI.append(featuredBy);
        sbI.append(", post=");
        sbI.append(post);
        sbI.append(")");
        return sbI.toString();
    }
}
