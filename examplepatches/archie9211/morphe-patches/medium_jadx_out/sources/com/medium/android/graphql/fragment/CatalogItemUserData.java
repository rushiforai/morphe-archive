package com.medium.android.graphql.fragment;

import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002¢\u0006\u0004\b\u0005\u0010\u0006J\u0010\u0010\u0007\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\bJ$\u0010\n\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\f\u0010\bJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\bR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0015\u001a\u0004\b\u0017\u0010\b¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogItemUserData;", "Lg15;", "", "__typename", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "component1", "()Ljava/lang/String;", "component2", "copy", "(Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/CatalogItemUserData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogItemUserData implements g15 {
    private final String __typename;
    private final String id;

    public CatalogItemUserData(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.__typename = str;
        this.id = str2;
    }

    public static /* synthetic */ CatalogItemUserData copy$default(CatalogItemUserData catalogItemUserData, String str, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = catalogItemUserData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = catalogItemUserData.id;
        }
        return catalogItemUserData.copy(str, str2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getId() {
        return this.id;
    }

    public final CatalogItemUserData copy(String __typename, String id) {
        __typename.getClass();
        id.getClass();
        return new CatalogItemUserData(__typename, id);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogItemUserData)) {
            return false;
        }
        CatalogItemUserData catalogItemUserData = (CatalogItemUserData) other;
        return g76.L(this.__typename, catalogItemUserData.__typename) && g76.L(this.id, catalogItemUserData.id);
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
        return ev6.y("CatalogItemUserData(__typename=", this.__typename, ", id=", this.id, ")");
    }
}
