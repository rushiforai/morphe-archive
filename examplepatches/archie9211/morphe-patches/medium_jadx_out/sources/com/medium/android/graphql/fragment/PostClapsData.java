package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0086\b\u0018\u00002\u00020\u0001:\u0001$B)\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\fJ\u0012\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J:\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0014\u0010\fJ\u0010\u0010\u0016\u001a\u00020\u0015HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001b\u001a\u00020\u001a2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018HÖ\u0003¢\u0006\u0004\b\u001b\u0010\u001cR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001d\u001a\u0004\b\u001e\u0010\fR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001d\u001a\u0004\b\u001f\u0010\fR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010 \u001a\u0004\b!\u0010\u000fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010\"\u001a\u0004\b#\u0010\u0011¨\u0006%"}, d2 = {"Lcom/medium/android/graphql/fragment/PostClapsData;", "Lg15;", "", "__typename", "id", "", "totalClapCount", "Lcom/medium/android/graphql/fragment/PostClapsData$ViewerEdge;", "viewerEdge", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Lcom/medium/android/graphql/fragment/PostClapsData$ViewerEdge;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Ljava/lang/Long;", "component4", "()Lcom/medium/android/graphql/fragment/PostClapsData$ViewerEdge;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Lcom/medium/android/graphql/fragment/PostClapsData$ViewerEdge;)Lcom/medium/android/graphql/fragment/PostClapsData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "Ljava/lang/Long;", "getTotalClapCount", "Lcom/medium/android/graphql/fragment/PostClapsData$ViewerEdge;", "getViewerEdge", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostClapsData implements g15 {
    private final String __typename;
    private final String id;
    private final Long totalClapCount;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\rJ.\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0006HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\f\u0010\r¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/fragment/PostClapsData$ViewerEdge;", "", "__typename", "", "id", "clapCount", "", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V", "get__typename", "()Ljava/lang/String;", "getId", "getClapCount", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)Lcom/medium/android/graphql/fragment/PostClapsData$ViewerEdge;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final Integer clapCount;
        private final String id;

        public ViewerEdge(String str, String str2, Integer num) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.clapCount = num;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, String str2, Integer num, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                str2 = viewerEdge.id;
            }
            if ((i & 4) != 0) {
                num = viewerEdge.clapCount;
            }
            return viewerEdge.copy(str, str2, num);
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
        public final Integer getClapCount() {
            return this.clapCount;
        }

        public final ViewerEdge copy(String __typename, String id, Integer clapCount) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, id, clapCount);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.id, viewerEdge.id) && g76.L(this.clapCount, viewerEdge.clapCount);
        }

        public final Integer getClapCount() {
            return this.clapCount;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            Integer num = this.clapCount;
            return iO + (num == null ? 0 : num.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            Integer num = this.clapCount;
            StringBuilder sbU = y30.u("ViewerEdge(__typename=", str, ", id=", str2, ", clapCount=");
            sbU.append(num);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public PostClapsData(String str, String str2, Long l, ViewerEdge viewerEdge) {
        str.getClass();
        str2.getClass();
        viewerEdge.getClass();
        this.__typename = str;
        this.id = str2;
        this.totalClapCount = l;
        this.viewerEdge = viewerEdge;
    }

    public static /* synthetic */ PostClapsData copy$default(PostClapsData postClapsData, String str, String str2, Long l, ViewerEdge viewerEdge, int i, Object obj) {
        if ((i & 1) != 0) {
            str = postClapsData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = postClapsData.id;
        }
        if ((i & 4) != 0) {
            l = postClapsData.totalClapCount;
        }
        if ((i & 8) != 0) {
            viewerEdge = postClapsData.viewerEdge;
        }
        return postClapsData.copy(str, str2, l, viewerEdge);
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
    public final Long getTotalClapCount() {
        return this.totalClapCount;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final PostClapsData copy(String __typename, String id, Long totalClapCount, ViewerEdge viewerEdge) {
        __typename.getClass();
        id.getClass();
        viewerEdge.getClass();
        return new PostClapsData(__typename, id, totalClapCount, viewerEdge);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostClapsData)) {
            return false;
        }
        PostClapsData postClapsData = (PostClapsData) other;
        return g76.L(this.__typename, postClapsData.__typename) && g76.L(this.id, postClapsData.id) && g76.L(this.totalClapCount, postClapsData.totalClapCount) && g76.L(this.viewerEdge, postClapsData.viewerEdge);
    }

    public final String getId() {
        return this.id;
    }

    public final Long getTotalClapCount() {
        return this.totalClapCount;
    }

    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        Long l = this.totalClapCount;
        return this.viewerEdge.hashCode() + ((iO + (l == null ? 0 : l.hashCode())) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        Long l = this.totalClapCount;
        ViewerEdge viewerEdge = this.viewerEdge;
        StringBuilder sbU = y30.u("PostClapsData(__typename=", str, ", id=", str2, ", totalClapCount=");
        sbU.append(l);
        sbU.append(", viewerEdge=");
        sbU.append(viewerEdge);
        sbU.append(")");
        return sbU.toString();
    }
}
