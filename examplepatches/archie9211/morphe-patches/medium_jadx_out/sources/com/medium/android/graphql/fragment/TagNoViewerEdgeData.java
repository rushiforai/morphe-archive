package com.medium.android.graphql.fragment;

import defpackage.b09;
import defpackage.g15;
import defpackage.g76;
import defpackage.km4;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ\u0010\u0010\f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\nJ\u0012\u0010\r\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\nJ:\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\nR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0019\u001a\u0004\b\u001b\u0010\nR\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0019\u001a\u0004\b\u001c\u0010\nR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0019\u001a\u0004\b\u001d\u0010\n¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/fragment/TagNoViewerEdgeData;", "Lg15;", "", "__typename", "id", "normalizedTagSlug", "displayTitle", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/TagNoViewerEdgeData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getNormalizedTagSlug", "getDisplayTitle", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class TagNoViewerEdgeData implements g15 {
    private final String __typename;
    private final String displayTitle;
    private final String id;
    private final String normalizedTagSlug;

    public TagNoViewerEdgeData(String str, String str2, String str3, String str4) {
        b09.I(str, str2, str3);
        this.__typename = str;
        this.id = str2;
        this.normalizedTagSlug = str3;
        this.displayTitle = str4;
    }

    public static /* synthetic */ TagNoViewerEdgeData copy$default(TagNoViewerEdgeData tagNoViewerEdgeData, String str, String str2, String str3, String str4, int i, Object obj) {
        if ((i & 1) != 0) {
            str = tagNoViewerEdgeData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = tagNoViewerEdgeData.id;
        }
        if ((i & 4) != 0) {
            str3 = tagNoViewerEdgeData.normalizedTagSlug;
        }
        if ((i & 8) != 0) {
            str4 = tagNoViewerEdgeData.displayTitle;
        }
        return tagNoViewerEdgeData.copy(str, str2, str3, str4);
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
    public final String getNormalizedTagSlug() {
        return this.normalizedTagSlug;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getDisplayTitle() {
        return this.displayTitle;
    }

    public final TagNoViewerEdgeData copy(String __typename, String id, String normalizedTagSlug, String displayTitle) {
        __typename.getClass();
        id.getClass();
        normalizedTagSlug.getClass();
        return new TagNoViewerEdgeData(__typename, id, normalizedTagSlug, displayTitle);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TagNoViewerEdgeData)) {
            return false;
        }
        TagNoViewerEdgeData tagNoViewerEdgeData = (TagNoViewerEdgeData) other;
        return g76.L(this.__typename, tagNoViewerEdgeData.__typename) && g76.L(this.id, tagNoViewerEdgeData.id) && g76.L(this.normalizedTagSlug, tagNoViewerEdgeData.normalizedTagSlug) && g76.L(this.displayTitle, tagNoViewerEdgeData.displayTitle);
    }

    public final String getDisplayTitle() {
        return this.displayTitle;
    }

    public final String getId() {
        return this.id;
    }

    public final String getNormalizedTagSlug() {
        return this.normalizedTagSlug;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.id), 31, this.normalizedTagSlug);
        String str = this.displayTitle;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        return km4.C(y30.u("TagNoViewerEdgeData(__typename=", str, ", id=", str2, ", normalizedTagSlug="), this.normalizedTagSlug, ", displayTitle=", this.displayTitle, ")");
    }
}
