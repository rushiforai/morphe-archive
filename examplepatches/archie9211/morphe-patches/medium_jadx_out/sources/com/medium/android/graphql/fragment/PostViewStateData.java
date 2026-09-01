package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001:\u0002\u001e\u001fB\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\nJ.\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\nR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001c\u0010\fR\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0019\u001a\u0004\b\u001d\u0010\n¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/fragment/PostViewStateData;", "Lg15;", "", "__typename", "Lcom/medium/android/graphql/fragment/PostViewStateData$ViewerEdge;", "viewerEdge", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostViewStateData$ViewerEdge;Ljava/lang/String;)V", "component1", "()Ljava/lang/String;", "component2", "()Lcom/medium/android/graphql/fragment/PostViewStateData$ViewerEdge;", "component3", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostViewStateData$ViewerEdge;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/PostViewStateData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Lcom/medium/android/graphql/fragment/PostViewStateData$ViewerEdge;", "getViewerEdge", "getId", "ViewerEdge", "ViewState", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostViewStateData implements g15 {
    private final String __typename;
    private final String id;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000bJ$\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\n\u0010\u000b¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PostViewStateData$ViewState;", "", "__typename", "", "viewedAt", "", "<init>", "(Ljava/lang/String;Ljava/lang/Long;)V", "get__typename", "()Ljava/lang/String;", "getViewedAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/Long;)Lcom/medium/android/graphql/fragment/PostViewStateData$ViewState;", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewState {
        private final String __typename;
        private final Long viewedAt;

        public ViewState(String str, Long l) {
            str.getClass();
            this.__typename = str;
            this.viewedAt = l;
        }

        public static /* synthetic */ ViewState copy$default(ViewState viewState, String str, Long l, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewState.__typename;
            }
            if ((i & 2) != 0) {
                l = viewState.viewedAt;
            }
            return viewState.copy(str, l);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Long getViewedAt() {
            return this.viewedAt;
        }

        public final ViewState copy(String __typename, Long viewedAt) {
            __typename.getClass();
            return new ViewState(__typename, viewedAt);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewState)) {
                return false;
            }
            ViewState viewState = (ViewState) other;
            return g76.L(this.__typename, viewState.__typename) && g76.L(this.viewedAt, viewState.viewedAt);
        }

        public final Long getViewedAt() {
            return this.viewedAt;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Long l = this.viewedAt;
            return iHashCode + (l == null ? 0 : l.hashCode());
        }

        public final String toString() {
            return "ViewState(__typename=" + this.__typename + ", viewedAt=" + this.viewedAt + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/PostViewStateData$ViewerEdge;", "", "__typename", "", "viewState", "Lcom/medium/android/graphql/fragment/PostViewStateData$ViewState;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostViewStateData$ViewState;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getViewState", "()Lcom/medium/android/graphql/fragment/PostViewStateData$ViewState;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final ViewState viewState;

        public ViewerEdge(String str, ViewState viewState, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.viewState = viewState;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, ViewState viewState, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                viewState = viewerEdge.viewState;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, viewState, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ViewState getViewState() {
            return this.viewState;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, ViewState viewState, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, viewState, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.viewState, viewerEdge.viewState) && g76.L(this.id, viewerEdge.id);
        }

        public final String getId() {
            return this.id;
        }

        public final ViewState getViewState() {
            return this.viewState;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            ViewState viewState = this.viewState;
            return this.id.hashCode() + ((iHashCode + (viewState == null ? 0 : viewState.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            ViewState viewState = this.viewState;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("ViewerEdge(__typename=");
            sb.append(str);
            sb.append(", viewState=");
            sb.append(viewState);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public PostViewStateData(String str, ViewerEdge viewerEdge, String str2) {
        str.getClass();
        viewerEdge.getClass();
        str2.getClass();
        this.__typename = str;
        this.viewerEdge = viewerEdge;
        this.id = str2;
    }

    public static /* synthetic */ PostViewStateData copy$default(PostViewStateData postViewStateData, String str, ViewerEdge viewerEdge, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = postViewStateData.__typename;
        }
        if ((i & 2) != 0) {
            viewerEdge = postViewStateData.viewerEdge;
        }
        if ((i & 4) != 0) {
            str2 = postViewStateData.id;
        }
        return postViewStateData.copy(str, viewerEdge, str2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getId() {
        return this.id;
    }

    public final PostViewStateData copy(String __typename, ViewerEdge viewerEdge, String id) {
        __typename.getClass();
        viewerEdge.getClass();
        id.getClass();
        return new PostViewStateData(__typename, viewerEdge, id);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostViewStateData)) {
            return false;
        }
        PostViewStateData postViewStateData = (PostViewStateData) other;
        return g76.L(this.__typename, postViewStateData.__typename) && g76.L(this.viewerEdge, postViewStateData.viewerEdge) && g76.L(this.id, postViewStateData.id);
    }

    public final String getId() {
        return this.id;
    }

    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return this.id.hashCode() + ((this.viewerEdge.hashCode() + (this.__typename.hashCode() * 31)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        ViewerEdge viewerEdge = this.viewerEdge;
        String str2 = this.id;
        StringBuilder sb = new StringBuilder("PostViewStateData(__typename=");
        sb.append(str);
        sb.append(", viewerEdge=");
        sb.append(viewerEdge);
        sb.append(", id=");
        return ka1.v(sb, str2, ")");
    }
}
