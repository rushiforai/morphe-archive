package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.lv8;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\t\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0012\u0010\u000b\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ\u0010\u0010\f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ0\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0016\u001a\u00020\u00052\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0018\u001a\u0004\b\u0019\u0010\nR\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0018\u001a\u0004\b\u001a\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001b\u001a\u0004\b\u001c\u0010\r¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/fragment/PageInfoData;", "Lg15;", "", "__typename", "endCursor", "", "hasNextPage", "<init>", "(Ljava/lang/String;Ljava/lang/String;Z)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Z", "copy", "(Ljava/lang/String;Ljava/lang/String;Z)Lcom/medium/android/graphql/fragment/PageInfoData;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getEndCursor", "Z", "getHasNextPage", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PageInfoData implements g15 {
    private final String __typename;
    private final String endCursor;
    private final boolean hasNextPage;

    public PageInfoData(String str, String str2, boolean z) {
        str.getClass();
        this.__typename = str;
        this.endCursor = str2;
        this.hasNextPage = z;
    }

    public static /* synthetic */ PageInfoData copy$default(PageInfoData pageInfoData, String str, String str2, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            str = pageInfoData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = pageInfoData.endCursor;
        }
        if ((i & 4) != 0) {
            z = pageInfoData.hasNextPage;
        }
        return pageInfoData.copy(str, str2, z);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getEndCursor() {
        return this.endCursor;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final boolean getHasNextPage() {
        return this.hasNextPage;
    }

    public final PageInfoData copy(String __typename, String endCursor, boolean hasNextPage) {
        __typename.getClass();
        return new PageInfoData(__typename, endCursor, hasNextPage);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PageInfoData)) {
            return false;
        }
        PageInfoData pageInfoData = (PageInfoData) other;
        return g76.L(this.__typename, pageInfoData.__typename) && g76.L(this.endCursor, pageInfoData.endCursor) && this.hasNextPage == pageInfoData.hasNextPage;
    }

    public final String getEndCursor() {
        return this.endCursor;
    }

    public final boolean getHasNextPage() {
        return this.hasNextPage;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        String str = this.endCursor;
        return ((iHashCode + (str == null ? 0 : str.hashCode())) * 31) + (this.hasNextPage ? 1231 : 1237);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.endCursor;
        return lv8.t(y30.u("PageInfoData(__typename=", str, ", endCursor=", str2, ", hasNextPage="), this.hasNextPage, ")");
    }
}
