package com.medium.android.graphql.fragment;

import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0086\b\u0018\u00002\u00020\u0001:\u0001\u001eB\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\nJ.\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\nR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001c\u0010\fR\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0019\u001a\u0004\b\u001d\u0010\n¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/fragment/CollectionMuteData;", "Lg15;", "", "__typename", "Lcom/medium/android/graphql/fragment/CollectionMuteData$ViewerEdge;", "viewerEdge", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CollectionMuteData$ViewerEdge;Ljava/lang/String;)V", "component1", "()Ljava/lang/String;", "component2", "()Lcom/medium/android/graphql/fragment/CollectionMuteData$ViewerEdge;", "component3", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CollectionMuteData$ViewerEdge;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/CollectionMuteData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Lcom/medium/android/graphql/fragment/CollectionMuteData$ViewerEdge;", "getViewerEdge", "getId", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CollectionMuteData implements g15 {
    private final String __typename;
    private final String id;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0010\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J1\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00052\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\fR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000b¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/CollectionMuteData$ViewerEdge;", "", "__typename", "", "isEditor", "", "isMuting", "id", "<init>", "(Ljava/lang/String;ZZLjava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "()Z", "getId", "component1", "component2", "component3", "component4", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final boolean isEditor;
        private final boolean isMuting;

        public ViewerEdge(String str, boolean z, boolean z2, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.isEditor = z;
            this.isMuting = z2;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, boolean z, boolean z2, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                z = viewerEdge.isEditor;
            }
            if ((i & 4) != 0) {
                z2 = viewerEdge.isMuting;
            }
            if ((i & 8) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, z, z2, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getIsEditor() {
            return this.isEditor;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final boolean getIsMuting() {
            return this.isMuting;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, boolean isEditor, boolean isMuting, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, isEditor, isMuting, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && this.isEditor == viewerEdge.isEditor && this.isMuting == viewerEdge.isMuting && g76.L(this.id, viewerEdge.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + (((((this.__typename.hashCode() * 31) + (this.isEditor ? 1231 : 1237)) * 31) + (this.isMuting ? 1231 : 1237)) * 31);
        }

        public final boolean isEditor() {
            return this.isEditor;
        }

        public final boolean isMuting() {
            return this.isMuting;
        }

        public final String toString() {
            String str = this.__typename;
            boolean z = this.isEditor;
            boolean z2 = this.isMuting;
            String str2 = this.id;
            StringBuilder sbD = ev6.D("ViewerEdge(__typename=", str, ", isEditor=", ", isMuting=", z);
            sbD.append(z2);
            sbD.append(", id=");
            sbD.append(str2);
            sbD.append(")");
            return sbD.toString();
        }
    }

    public CollectionMuteData(String str, ViewerEdge viewerEdge, String str2) {
        str.getClass();
        viewerEdge.getClass();
        str2.getClass();
        this.__typename = str;
        this.viewerEdge = viewerEdge;
        this.id = str2;
    }

    public static /* synthetic */ CollectionMuteData copy$default(CollectionMuteData collectionMuteData, String str, ViewerEdge viewerEdge, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = collectionMuteData.__typename;
        }
        if ((i & 2) != 0) {
            viewerEdge = collectionMuteData.viewerEdge;
        }
        if ((i & 4) != 0) {
            str2 = collectionMuteData.id;
        }
        return collectionMuteData.copy(str, viewerEdge, str2);
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

    public final CollectionMuteData copy(String __typename, ViewerEdge viewerEdge, String id) {
        __typename.getClass();
        viewerEdge.getClass();
        id.getClass();
        return new CollectionMuteData(__typename, viewerEdge, id);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CollectionMuteData)) {
            return false;
        }
        CollectionMuteData collectionMuteData = (CollectionMuteData) other;
        return g76.L(this.__typename, collectionMuteData.__typename) && g76.L(this.viewerEdge, collectionMuteData.viewerEdge) && g76.L(this.id, collectionMuteData.id);
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
        StringBuilder sb = new StringBuilder("CollectionMuteData(__typename=");
        sb.append(str);
        sb.append(", viewerEdge=");
        sb.append(viewerEdge);
        sb.append(", id=");
        return ka1.v(sb, str2, ")");
    }
}
