package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ\u0010\u0010\f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ.\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\nR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0019\u001a\u0004\b\u001b\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001c\u001a\u0004\b\u001d\u0010\r¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogItemPostData;", "Lg15;", "", "__typename", "id", "Lcom/medium/android/graphql/fragment/PostPreviewData;", "postPreviewData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Lcom/medium/android/graphql/fragment/PostPreviewData;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData;)Lcom/medium/android/graphql/fragment/CatalogItemPostData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "Lcom/medium/android/graphql/fragment/PostPreviewData;", "getPostPreviewData", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogItemPostData implements g15 {
    private final String __typename;
    private final String id;
    private final PostPreviewData postPreviewData;

    public CatalogItemPostData(String str, String str2, PostPreviewData postPreviewData) {
        y30.B(str, str2, postPreviewData);
        this.__typename = str;
        this.id = str2;
        this.postPreviewData = postPreviewData;
    }

    public static /* synthetic */ CatalogItemPostData copy$default(CatalogItemPostData catalogItemPostData, String str, String str2, PostPreviewData postPreviewData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = catalogItemPostData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = catalogItemPostData.id;
        }
        if ((i & 4) != 0) {
            postPreviewData = catalogItemPostData.postPreviewData;
        }
        return catalogItemPostData.copy(str, str2, postPreviewData);
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
    public final PostPreviewData getPostPreviewData() {
        return this.postPreviewData;
    }

    public final CatalogItemPostData copy(String __typename, String id, PostPreviewData postPreviewData) {
        __typename.getClass();
        id.getClass();
        postPreviewData.getClass();
        return new CatalogItemPostData(__typename, id, postPreviewData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogItemPostData)) {
            return false;
        }
        CatalogItemPostData catalogItemPostData = (CatalogItemPostData) other;
        return g76.L(this.__typename, catalogItemPostData.__typename) && g76.L(this.id, catalogItemPostData.id) && g76.L(this.postPreviewData, catalogItemPostData.postPreviewData);
    }

    public final String getId() {
        return this.id;
    }

    public final PostPreviewData getPostPreviewData() {
        return this.postPreviewData;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return this.postPreviewData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        return y30.q(y30.u("CatalogItemPostData(__typename=", str, ", id=", str2, ", postPreviewData="), this.postPreviewData, ")");
    }
}
