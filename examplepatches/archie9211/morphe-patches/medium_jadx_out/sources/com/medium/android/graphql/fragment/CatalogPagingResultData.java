package com.medium.android.graphql.fragment;

import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001:\u0001\u001fB!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\n\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ\u0012\u0010\u000e\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ0\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006HÆ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u000bJ\u0010\u0010\u0013\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u0013\u0010\rJ\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\u000bR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001c\u0010\rR\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001d\u001a\u0004\b\u001e\u0010\u000f¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogPagingResultData;", "Lg15;", "", "__typename", "", "count", "Lcom/medium/android/graphql/fragment/CatalogPagingResultData$NextPageCursor;", "nextPageCursor", "<init>", "(Ljava/lang/String;ILcom/medium/android/graphql/fragment/CatalogPagingResultData$NextPageCursor;)V", "component1", "()Ljava/lang/String;", "component2", "()I", "component3", "()Lcom/medium/android/graphql/fragment/CatalogPagingResultData$NextPageCursor;", "copy", "(Ljava/lang/String;ILcom/medium/android/graphql/fragment/CatalogPagingResultData$NextPageCursor;)Lcom/medium/android/graphql/fragment/CatalogPagingResultData;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "I", "getCount", "Lcom/medium/android/graphql/fragment/CatalogPagingResultData$NextPageCursor;", "getNextPageCursor", "NextPageCursor", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogPagingResultData implements g15 {
    private final String __typename;
    private final int count;
    private final NextPageCursor nextPageCursor;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogPagingResultData$NextPageCursor;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class NextPageCursor {
        private final String __typename;
        private final String id;

        public NextPageCursor(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
        }

        public static /* synthetic */ NextPageCursor copy$default(NextPageCursor nextPageCursor, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = nextPageCursor.__typename;
            }
            if ((i & 2) != 0) {
                str2 = nextPageCursor.id;
            }
            return nextPageCursor.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final NextPageCursor copy(String __typename, String id) {
            __typename.getClass();
            id.getClass();
            return new NextPageCursor(__typename, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof NextPageCursor)) {
                return false;
            }
            NextPageCursor nextPageCursor = (NextPageCursor) other;
            return g76.L(this.__typename, nextPageCursor.__typename) && g76.L(this.id, nextPageCursor.id);
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
            return ev6.y("NextPageCursor(__typename=", this.__typename, ", id=", this.id, ")");
        }
    }

    public CatalogPagingResultData(String str, int i, NextPageCursor nextPageCursor) {
        str.getClass();
        this.__typename = str;
        this.count = i;
        this.nextPageCursor = nextPageCursor;
    }

    public static /* synthetic */ CatalogPagingResultData copy$default(CatalogPagingResultData catalogPagingResultData, String str, int i, NextPageCursor nextPageCursor, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = catalogPagingResultData.__typename;
        }
        if ((i2 & 2) != 0) {
            i = catalogPagingResultData.count;
        }
        if ((i2 & 4) != 0) {
            nextPageCursor = catalogPagingResultData.nextPageCursor;
        }
        return catalogPagingResultData.copy(str, i, nextPageCursor);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getCount() {
        return this.count;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final NextPageCursor getNextPageCursor() {
        return this.nextPageCursor;
    }

    public final CatalogPagingResultData copy(String __typename, int count, NextPageCursor nextPageCursor) {
        __typename.getClass();
        return new CatalogPagingResultData(__typename, count, nextPageCursor);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogPagingResultData)) {
            return false;
        }
        CatalogPagingResultData catalogPagingResultData = (CatalogPagingResultData) other;
        return g76.L(this.__typename, catalogPagingResultData.__typename) && this.count == catalogPagingResultData.count && g76.L(this.nextPageCursor, catalogPagingResultData.nextPageCursor);
    }

    public final int getCount() {
        return this.count;
    }

    public final NextPageCursor getNextPageCursor() {
        return this.nextPageCursor;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = ((this.__typename.hashCode() * 31) + this.count) * 31;
        NextPageCursor nextPageCursor = this.nextPageCursor;
        return iHashCode + (nextPageCursor == null ? 0 : nextPageCursor.hashCode());
    }

    public final String toString() {
        String str = this.__typename;
        int i = this.count;
        NextPageCursor nextPageCursor = this.nextPageCursor;
        StringBuilder sbT = y30.t(i, "CatalogPagingResultData(__typename=", str, ", count=", ", nextPageCursor=");
        sbT.append(nextPageCursor);
        sbT.append(")");
        return sbT.toString();
    }
}
