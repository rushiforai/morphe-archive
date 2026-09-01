package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0012\u0010\n\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ&\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u000e\u0010\tJ\u0010\u0010\u0010\u001a\u00020\u000fHÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012HÖ\u0003¢\u0006\u0004\b\u0015\u0010\u0016R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0017\u001a\u0004\b\u0018\u0010\tR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0019\u001a\u0004\b\u001a\u0010\u000b¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/fragment/PeopleSearchData;", "Lg15;", "", "__typename", "Lcom/medium/android/graphql/fragment/UserSearchData;", "userSearchData", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserSearchData;)V", "component1", "()Ljava/lang/String;", "component2", "()Lcom/medium/android/graphql/fragment/UserSearchData;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserSearchData;)Lcom/medium/android/graphql/fragment/PeopleSearchData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Lcom/medium/android/graphql/fragment/UserSearchData;", "getUserSearchData", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PeopleSearchData implements g15 {
    private final String __typename;
    private final UserSearchData userSearchData;

    public PeopleSearchData(String str, UserSearchData userSearchData) {
        str.getClass();
        this.__typename = str;
        this.userSearchData = userSearchData;
    }

    public static /* synthetic */ PeopleSearchData copy$default(PeopleSearchData peopleSearchData, String str, UserSearchData userSearchData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = peopleSearchData.__typename;
        }
        if ((i & 2) != 0) {
            userSearchData = peopleSearchData.userSearchData;
        }
        return peopleSearchData.copy(str, userSearchData);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final UserSearchData getUserSearchData() {
        return this.userSearchData;
    }

    public final PeopleSearchData copy(String __typename, UserSearchData userSearchData) {
        __typename.getClass();
        return new PeopleSearchData(__typename, userSearchData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PeopleSearchData)) {
            return false;
        }
        PeopleSearchData peopleSearchData = (PeopleSearchData) other;
        return g76.L(this.__typename, peopleSearchData.__typename) && g76.L(this.userSearchData, peopleSearchData.userSearchData);
    }

    public final UserSearchData getUserSearchData() {
        return this.userSearchData;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        UserSearchData userSearchData = this.userSearchData;
        return iHashCode + (userSearchData == null ? 0 : userSearchData.hashCode());
    }

    public final String toString() {
        return "PeopleSearchData(__typename=" + this.__typename + ", userSearchData=" + this.userSearchData + ")";
    }
}
