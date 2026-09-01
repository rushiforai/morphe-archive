package com.medium.android.graphql.fragment;

import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001:\u0001\"B/\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\fJ\u0012\u0010\u000e\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u000e\u0010\fJ\u0016\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J@\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0013\u0010\fJ\u0010\u0010\u0015\u001a\u00020\u0014HÖ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u001a\u0010\u001a\u001a\u00020\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0017HÖ\u0003¢\u0006\u0004\b\u001a\u0010\u001bR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001c\u001a\u0004\b\u001d\u0010\fR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001c\u001a\u0004\b\u001e\u0010\fR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001c\u001a\u0004\b\u001f\u0010\fR\u001d\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u00068\u0006¢\u0006\f\n\u0004\b\b\u0010 \u001a\u0004\b!\u0010\u0010¨\u0006#"}, d2 = {"Lcom/medium/android/graphql/fragment/PublicationPostSectionData;", "Lg15;", "", "__typename", "id", "title", "", "Lcom/medium/android/graphql/fragment/PublicationPostSectionData$Post;", "posts", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "()Ljava/util/List;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/medium/android/graphql/fragment/PublicationPostSectionData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getTitle", "Ljava/util/List;", "getPosts", "Post", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationPostSectionData implements g15 {
    private final String __typename;
    private final String id;
    private final List<Post> posts;
    private final String title;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/PublicationPostSectionData$Post;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;

        public Post(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            return post.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Post copy(String __typename, String id) {
            __typename.getClass();
            id.getClass();
            return new Post(__typename, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ev6.y("Post(__typename=", this.__typename, ", id=", this.id, ")");
        }
    }

    public PublicationPostSectionData(String str, String str2, String str3, List<Post> list) {
        str.getClass();
        str2.getClass();
        list.getClass();
        this.__typename = str;
        this.id = str2;
        this.title = str3;
        this.posts = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PublicationPostSectionData copy$default(PublicationPostSectionData publicationPostSectionData, String str, String str2, String str3, List list, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publicationPostSectionData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = publicationPostSectionData.id;
        }
        if ((i & 4) != 0) {
            str3 = publicationPostSectionData.title;
        }
        if ((i & 8) != 0) {
            list = publicationPostSectionData.posts;
        }
        return publicationPostSectionData.copy(str, str2, str3, list);
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

    public final List<Post> component4() {
        return this.posts;
    }

    public final PublicationPostSectionData copy(String __typename, String id, String title, List<Post> posts) {
        __typename.getClass();
        id.getClass();
        posts.getClass();
        return new PublicationPostSectionData(__typename, id, title, posts);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublicationPostSectionData)) {
            return false;
        }
        PublicationPostSectionData publicationPostSectionData = (PublicationPostSectionData) other;
        return g76.L(this.__typename, publicationPostSectionData.__typename) && g76.L(this.id, publicationPostSectionData.id) && g76.L(this.title, publicationPostSectionData.title) && g76.L(this.posts, publicationPostSectionData.posts);
    }

    public final String getId() {
        return this.id;
    }

    public final List<Post> getPosts() {
        return this.posts;
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
        return this.posts.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.title;
        List<Post> list = this.posts;
        StringBuilder sbU = y30.u("PublicationPostSectionData(__typename=", str, ", id=", str2, ", title=");
        sbU.append(str3);
        sbU.append(", posts=");
        sbU.append(list);
        sbU.append(")");
        return sbU.toString();
    }
}
