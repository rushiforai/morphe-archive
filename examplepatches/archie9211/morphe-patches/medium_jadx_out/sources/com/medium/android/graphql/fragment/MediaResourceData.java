package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.km4;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ\u0012\u0010\f\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\nJ\u0012\u0010\r\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\nJ<\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\nR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0019\u001a\u0004\b\u001b\u0010\nR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0019\u001a\u0004\b\u001c\u0010\nR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0019\u001a\u0004\b\u001d\u0010\n¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/fragment/MediaResourceData;", "Lg15;", "", "__typename", "id", "iframeSrc", "thumbnailUrl", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/MediaResourceData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getIframeSrc", "getThumbnailUrl", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class MediaResourceData implements g15 {
    private final String __typename;
    private final String id;
    private final String iframeSrc;
    private final String thumbnailUrl;

    public MediaResourceData(String str, String str2, String str3, String str4) {
        str.getClass();
        str2.getClass();
        this.__typename = str;
        this.id = str2;
        this.iframeSrc = str3;
        this.thumbnailUrl = str4;
    }

    public static /* synthetic */ MediaResourceData copy$default(MediaResourceData mediaResourceData, String str, String str2, String str3, String str4, int i, Object obj) {
        if ((i & 1) != 0) {
            str = mediaResourceData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = mediaResourceData.id;
        }
        if ((i & 4) != 0) {
            str3 = mediaResourceData.iframeSrc;
        }
        if ((i & 8) != 0) {
            str4 = mediaResourceData.thumbnailUrl;
        }
        return mediaResourceData.copy(str, str2, str3, str4);
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
    public final String getIframeSrc() {
        return this.iframeSrc;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getThumbnailUrl() {
        return this.thumbnailUrl;
    }

    public final MediaResourceData copy(String __typename, String id, String iframeSrc, String thumbnailUrl) {
        __typename.getClass();
        id.getClass();
        return new MediaResourceData(__typename, id, iframeSrc, thumbnailUrl);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MediaResourceData)) {
            return false;
        }
        MediaResourceData mediaResourceData = (MediaResourceData) other;
        return g76.L(this.__typename, mediaResourceData.__typename) && g76.L(this.id, mediaResourceData.id) && g76.L(this.iframeSrc, mediaResourceData.iframeSrc) && g76.L(this.thumbnailUrl, mediaResourceData.thumbnailUrl);
    }

    public final String getId() {
        return this.id;
    }

    public final String getIframeSrc() {
        return this.iframeSrc;
    }

    public final String getThumbnailUrl() {
        return this.thumbnailUrl;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        String str = this.iframeSrc;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.thumbnailUrl;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        return km4.C(y30.u("MediaResourceData(__typename=", str, ", id=", str2, ", iframeSrc="), this.iframeSrc, ", thumbnailUrl=", this.thumbnailUrl, ")");
    }
}
