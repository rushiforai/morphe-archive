package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0086\b\u0018\u00002\u00020\u0001:\u0001\u001eB!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ\u0012\u0010\f\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ0\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\nR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0019\u001a\u0004\b\u001b\u0010\nR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001c\u001a\u0004\b\u001d\u0010\r¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCountData;", "Lg15;", "", "__typename", "id", "Lcom/medium/android/graphql/fragment/ResponseCountData$PostResponses;", "postResponses", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseCountData$PostResponses;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Lcom/medium/android/graphql/fragment/ResponseCountData$PostResponses;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseCountData$PostResponses;)Lcom/medium/android/graphql/fragment/ResponseCountData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "Lcom/medium/android/graphql/fragment/ResponseCountData$PostResponses;", "getPostResponses", "PostResponses", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ResponseCountData implements g15 {
    private final String __typename;
    private final String id;
    private final PostResponses postResponses;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000bJ$\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/ResponseCountData$PostResponses;", "", "__typename", "", "count", "", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;)V", "get__typename", "()Ljava/lang/String;", "getCount", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/Integer;)Lcom/medium/android/graphql/fragment/ResponseCountData$PostResponses;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PostResponses {
        private final String __typename;
        private final Integer count;

        public PostResponses(String str, Integer num) {
            str.getClass();
            this.__typename = str;
            this.count = num;
        }

        public static /* synthetic */ PostResponses copy$default(PostResponses postResponses, String str, Integer num, int i, Object obj) {
            if ((i & 1) != 0) {
                str = postResponses.__typename;
            }
            if ((i & 2) != 0) {
                num = postResponses.count;
            }
            return postResponses.copy(str, num);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getCount() {
            return this.count;
        }

        public final PostResponses copy(String __typename, Integer count) {
            __typename.getClass();
            return new PostResponses(__typename, count);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PostResponses)) {
                return false;
            }
            PostResponses postResponses = (PostResponses) other;
            return g76.L(this.__typename, postResponses.__typename) && g76.L(this.count, postResponses.count);
        }

        public final Integer getCount() {
            return this.count;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.count;
            return iHashCode + (num == null ? 0 : num.hashCode());
        }

        public final String toString() {
            return "PostResponses(__typename=" + this.__typename + ", count=" + this.count + ")";
        }
    }

    public ResponseCountData(String str, String str2, PostResponses postResponses) {
        str.getClass();
        str2.getClass();
        this.__typename = str;
        this.id = str2;
        this.postResponses = postResponses;
    }

    public static /* synthetic */ ResponseCountData copy$default(ResponseCountData responseCountData, String str, String str2, PostResponses postResponses, int i, Object obj) {
        if ((i & 1) != 0) {
            str = responseCountData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = responseCountData.id;
        }
        if ((i & 4) != 0) {
            postResponses = responseCountData.postResponses;
        }
        return responseCountData.copy(str, str2, postResponses);
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
    public final PostResponses getPostResponses() {
        return this.postResponses;
    }

    public final ResponseCountData copy(String __typename, String id, PostResponses postResponses) {
        __typename.getClass();
        id.getClass();
        return new ResponseCountData(__typename, id, postResponses);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ResponseCountData)) {
            return false;
        }
        ResponseCountData responseCountData = (ResponseCountData) other;
        return g76.L(this.__typename, responseCountData.__typename) && g76.L(this.id, responseCountData.id) && g76.L(this.postResponses, responseCountData.postResponses);
    }

    public final String getId() {
        return this.id;
    }

    public final PostResponses getPostResponses() {
        return this.postResponses;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        PostResponses postResponses = this.postResponses;
        return iO + (postResponses == null ? 0 : postResponses.hashCode());
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        PostResponses postResponses = this.postResponses;
        StringBuilder sbU = y30.u("ResponseCountData(__typename=", str, ", id=", str2, ", postResponses=");
        sbU.append(postResponses);
        sbU.append(")");
        return sbU.toString();
    }
}
