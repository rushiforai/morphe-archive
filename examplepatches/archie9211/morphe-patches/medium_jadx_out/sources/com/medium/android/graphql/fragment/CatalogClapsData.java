package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ho2;
import defpackage.ka1;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0086\b\u0018\u00002\u00020\u0001:\u0001$B'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\b\u001a\u00020\u0002¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\fJ8\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\b\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0014\u0010\fJ\u0010\u0010\u0016\u001a\u00020\u0015HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001b\u001a\u00020\u001a2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018HÖ\u0003¢\u0006\u0004\b\u001b\u0010\u001cR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001d\u001a\u0004\b\u001e\u0010\fR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001f\u001a\u0004\b \u0010\u000eR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010!\u001a\u0004\b\"\u0010\u0010R\u0017\u0010\b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\b\u0010\u001d\u001a\u0004\b#\u0010\f¨\u0006%"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogClapsData;", "Lg15;", "", "__typename", "", "totalClapCount", "Lcom/medium/android/graphql/fragment/CatalogClapsData$ViewerEdge;", "viewerEdge", "id", "<init>", "(Ljava/lang/String;JLcom/medium/android/graphql/fragment/CatalogClapsData$ViewerEdge;Ljava/lang/String;)V", "component1", "()Ljava/lang/String;", "component2", "()J", "component3", "()Lcom/medium/android/graphql/fragment/CatalogClapsData$ViewerEdge;", "component4", "copy", "(Ljava/lang/String;JLcom/medium/android/graphql/fragment/CatalogClapsData$ViewerEdge;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/CatalogClapsData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "J", "getTotalClapCount", "Lcom/medium/android/graphql/fragment/CatalogClapsData$ViewerEdge;", "getViewerEdge", "getId", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogClapsData implements g15 {
    private final String __typename;
    private final String id;
    private final long totalClapCount;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\fJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J.\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogClapsData$ViewerEdge;", "", "__typename", "", "clapCount", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getClapCount", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getId", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/CatalogClapsData$ViewerEdge;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final Integer clapCount;
        private final String id;

        public ViewerEdge(String str, Integer num, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.clapCount = num;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, Integer num, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                num = viewerEdge.clapCount;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, num, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getClapCount() {
            return this.clapCount;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, Integer clapCount, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, clapCount, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.clapCount, viewerEdge.clapCount) && g76.L(this.id, viewerEdge.id);
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
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.clapCount;
            return this.id.hashCode() + ((iHashCode + (num == null ? 0 : num.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            Integer num = this.clapCount;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("ViewerEdge(__typename=");
            sb.append(str);
            sb.append(", clapCount=");
            sb.append(num);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public CatalogClapsData(String str, long j, ViewerEdge viewerEdge, String str2) {
        str.getClass();
        viewerEdge.getClass();
        str2.getClass();
        this.__typename = str;
        this.totalClapCount = j;
        this.viewerEdge = viewerEdge;
        this.id = str2;
    }

    public static /* synthetic */ CatalogClapsData copy$default(CatalogClapsData catalogClapsData, String str, long j, ViewerEdge viewerEdge, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = catalogClapsData.__typename;
        }
        if ((i & 2) != 0) {
            j = catalogClapsData.totalClapCount;
        }
        if ((i & 4) != 0) {
            viewerEdge = catalogClapsData.viewerEdge;
        }
        if ((i & 8) != 0) {
            str2 = catalogClapsData.id;
        }
        return catalogClapsData.copy(str, j, viewerEdge, str2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final long getTotalClapCount() {
        return this.totalClapCount;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getId() {
        return this.id;
    }

    public final CatalogClapsData copy(String __typename, long totalClapCount, ViewerEdge viewerEdge, String id) {
        __typename.getClass();
        viewerEdge.getClass();
        id.getClass();
        return new CatalogClapsData(__typename, totalClapCount, viewerEdge, id);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogClapsData)) {
            return false;
        }
        CatalogClapsData catalogClapsData = (CatalogClapsData) other;
        return g76.L(this.__typename, catalogClapsData.__typename) && this.totalClapCount == catalogClapsData.totalClapCount && g76.L(this.viewerEdge, catalogClapsData.viewerEdge) && g76.L(this.id, catalogClapsData.id);
    }

    public final String getId() {
        return this.id;
    }

    public final long getTotalClapCount() {
        return this.totalClapCount;
    }

    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        long j = this.totalClapCount;
        return this.id.hashCode() + ((this.viewerEdge.hashCode() + ((iHashCode + ((int) (j ^ (j >>> 32)))) * 31)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        long j = this.totalClapCount;
        ViewerEdge viewerEdge = this.viewerEdge;
        String str2 = this.id;
        StringBuilder sbI = ho2.I(j, "CatalogClapsData(__typename=", str, ", totalClapCount=");
        sbI.append(", viewerEdge=");
        sbI.append(viewerEdge);
        sbI.append(", id=");
        sbI.append(str2);
        sbI.append(")");
        return sbI.toString();
    }
}
