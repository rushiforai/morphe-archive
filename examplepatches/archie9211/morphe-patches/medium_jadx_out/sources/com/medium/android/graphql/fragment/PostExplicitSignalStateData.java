package com.medium.android.graphql.fragment;

import com.medium.android.graphql.type.ExplicitUserSignal;
import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0086\b\u0018\u00002\u00020\u0001:\u0001\u001eB\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ\u0010\u0010\f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ.\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\nR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0019\u001a\u0004\b\u001b\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001c\u001a\u0004\b\u001d\u0010\r¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/fragment/PostExplicitSignalStateData;", "Lg15;", "", "__typename", "id", "Lcom/medium/android/graphql/fragment/PostExplicitSignalStateData$ViewerEdge;", "viewerEdge", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostExplicitSignalStateData$ViewerEdge;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Lcom/medium/android/graphql/fragment/PostExplicitSignalStateData$ViewerEdge;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostExplicitSignalStateData$ViewerEdge;)Lcom/medium/android/graphql/fragment/PostExplicitSignalStateData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "Lcom/medium/android/graphql/fragment/PostExplicitSignalStateData$ViewerEdge;", "getViewerEdge", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostExplicitSignalStateData implements g15 {
    private final String __typename;
    private final String id;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0006HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/PostExplicitSignalStateData$ViewerEdge;", "", "__typename", "", "id", "explicitSignalState", "Lcom/medium/android/graphql/type/ExplicitUserSignal;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/ExplicitUserSignal;)V", "get__typename", "()Ljava/lang/String;", "getId", "getExplicitSignalState", "()Lcom/medium/android/graphql/type/ExplicitUserSignal;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final ExplicitUserSignal explicitSignalState;
        private final String id;

        public ViewerEdge(String str, String str2, ExplicitUserSignal explicitUserSignal) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.explicitSignalState = explicitUserSignal;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, String str2, ExplicitUserSignal explicitUserSignal, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                str2 = viewerEdge.id;
            }
            if ((i & 4) != 0) {
                explicitUserSignal = viewerEdge.explicitSignalState;
            }
            return viewerEdge.copy(str, str2, explicitUserSignal);
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
        public final ExplicitUserSignal getExplicitSignalState() {
            return this.explicitSignalState;
        }

        public final ViewerEdge copy(String __typename, String id, ExplicitUserSignal explicitSignalState) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, id, explicitSignalState);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.id, viewerEdge.id) && this.explicitSignalState == viewerEdge.explicitSignalState;
        }

        public final ExplicitUserSignal getExplicitSignalState() {
            return this.explicitSignalState;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            ExplicitUserSignal explicitUserSignal = this.explicitSignalState;
            return iO + (explicitUserSignal == null ? 0 : explicitUserSignal.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            ExplicitUserSignal explicitUserSignal = this.explicitSignalState;
            StringBuilder sbU = y30.u("ViewerEdge(__typename=", str, ", id=", str2, ", explicitSignalState=");
            sbU.append(explicitUserSignal);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public PostExplicitSignalStateData(String str, String str2, ViewerEdge viewerEdge) {
        str.getClass();
        str2.getClass();
        viewerEdge.getClass();
        this.__typename = str;
        this.id = str2;
        this.viewerEdge = viewerEdge;
    }

    public static /* synthetic */ PostExplicitSignalStateData copy$default(PostExplicitSignalStateData postExplicitSignalStateData, String str, String str2, ViewerEdge viewerEdge, int i, Object obj) {
        if ((i & 1) != 0) {
            str = postExplicitSignalStateData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = postExplicitSignalStateData.id;
        }
        if ((i & 4) != 0) {
            viewerEdge = postExplicitSignalStateData.viewerEdge;
        }
        return postExplicitSignalStateData.copy(str, str2, viewerEdge);
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
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final PostExplicitSignalStateData copy(String __typename, String id, ViewerEdge viewerEdge) {
        __typename.getClass();
        id.getClass();
        viewerEdge.getClass();
        return new PostExplicitSignalStateData(__typename, id, viewerEdge);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostExplicitSignalStateData)) {
            return false;
        }
        PostExplicitSignalStateData postExplicitSignalStateData = (PostExplicitSignalStateData) other;
        return g76.L(this.__typename, postExplicitSignalStateData.__typename) && g76.L(this.id, postExplicitSignalStateData.id) && g76.L(this.viewerEdge, postExplicitSignalStateData.viewerEdge);
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
        return this.viewerEdge.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        ViewerEdge viewerEdge = this.viewerEdge;
        StringBuilder sbU = y30.u("PostExplicitSignalStateData(__typename=", str, ", id=", str2, ", viewerEdge=");
        sbU.append(viewerEdge);
        sbU.append(")");
        return sbU.toString();
    }
}
