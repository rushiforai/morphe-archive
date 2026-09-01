package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\n\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\n\u0010\tJ\u0012\u0010\u000b\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\tJ0\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u000e\u0010\tJ\u0010\u0010\u0010\u001a\u00020\u000fHÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012HÖ\u0003¢\u0006\u0004\b\u0015\u0010\u0016R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0017\u001a\u0004\b\u0018\u0010\tR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0017\u001a\u0004\b\u0019\u0010\tR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0017\u001a\u0004\b\u001a\u0010\t¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/fragment/FollowedTagData;", "Lg15;", "", "__typename", "normalizedTagSlug", "displayTitle", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/FollowedTagData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getNormalizedTagSlug", "getDisplayTitle", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class FollowedTagData implements g15 {
    private final String __typename;
    private final String displayTitle;
    private final String normalizedTagSlug;

    public FollowedTagData(String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        this.__typename = str;
        this.normalizedTagSlug = str2;
        this.displayTitle = str3;
    }

    public static /* synthetic */ FollowedTagData copy$default(FollowedTagData followedTagData, String str, String str2, String str3, int i, Object obj) {
        if ((i & 1) != 0) {
            str = followedTagData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = followedTagData.normalizedTagSlug;
        }
        if ((i & 4) != 0) {
            str3 = followedTagData.displayTitle;
        }
        return followedTagData.copy(str, str2, str3);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getNormalizedTagSlug() {
        return this.normalizedTagSlug;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getDisplayTitle() {
        return this.displayTitle;
    }

    public final FollowedTagData copy(String __typename, String normalizedTagSlug, String displayTitle) {
        __typename.getClass();
        normalizedTagSlug.getClass();
        return new FollowedTagData(__typename, normalizedTagSlug, displayTitle);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof FollowedTagData)) {
            return false;
        }
        FollowedTagData followedTagData = (FollowedTagData) other;
        return g76.L(this.__typename, followedTagData.__typename) && g76.L(this.normalizedTagSlug, followedTagData.normalizedTagSlug) && g76.L(this.displayTitle, followedTagData.displayTitle);
    }

    public final String getDisplayTitle() {
        return this.displayTitle;
    }

    public final String getNormalizedTagSlug() {
        return this.normalizedTagSlug;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.normalizedTagSlug);
        String str = this.displayTitle;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.normalizedTagSlug;
        return ka1.v(y30.u("FollowedTagData(__typename=", str, ", normalizedTagSlug=", str2, ", displayTitle="), this.displayTitle, ")");
    }
}
