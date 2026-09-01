package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ho2;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ\u0010\u0010\f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ.\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0011\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b\u0011\u0010\rJ\u001a\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012HÖ\u0003¢\u0006\u0004\b\u0015\u0010\u0016R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0017\u001a\u0004\b\u0018\u0010\nR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0017\u001a\u0004\b\u0019\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u001a\u0004\b\u001b\u0010\r¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/fragment/PostRepostCountData;", "Lg15;", "", "__typename", "id", "", "repostCount", "<init>", "(Ljava/lang/String;Ljava/lang/String;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()I", "copy", "(Ljava/lang/String;Ljava/lang/String;I)Lcom/medium/android/graphql/fragment/PostRepostCountData;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "I", "getRepostCount", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostRepostCountData implements g15 {
    private final String __typename;
    private final String id;
    private final int repostCount;

    public PostRepostCountData(String str, String str2, int i) {
        str.getClass();
        str2.getClass();
        this.__typename = str;
        this.id = str2;
        this.repostCount = i;
    }

    public static /* synthetic */ PostRepostCountData copy$default(PostRepostCountData postRepostCountData, String str, String str2, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = postRepostCountData.__typename;
        }
        if ((i2 & 2) != 0) {
            str2 = postRepostCountData.id;
        }
        if ((i2 & 4) != 0) {
            i = postRepostCountData.repostCount;
        }
        return postRepostCountData.copy(str, str2, i);
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
    public final int getRepostCount() {
        return this.repostCount;
    }

    public final PostRepostCountData copy(String __typename, String id, int repostCount) {
        __typename.getClass();
        id.getClass();
        return new PostRepostCountData(__typename, id, repostCount);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostRepostCountData)) {
            return false;
        }
        PostRepostCountData postRepostCountData = (PostRepostCountData) other;
        return g76.L(this.__typename, postRepostCountData.__typename) && g76.L(this.id, postRepostCountData.id) && this.repostCount == postRepostCountData.repostCount;
    }

    public final String getId() {
        return this.id;
    }

    public final int getRepostCount() {
        return this.repostCount;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return wgd.o(this.__typename.hashCode() * 31, 31, this.id) + this.repostCount;
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        return ho2.H(y30.u("PostRepostCountData(__typename=", str, ", id=", str2, ", repostCount="), this.repostCount, ")");
    }
}
