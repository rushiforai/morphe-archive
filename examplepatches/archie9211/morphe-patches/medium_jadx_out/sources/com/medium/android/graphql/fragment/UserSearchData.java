package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\n\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ\u0012\u0010\f\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\u000bJ\u0010\u0010\r\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\u000bJ\u0010\u0010\u000e\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ:\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u0006HÆ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u000bJ\u0010\u0010\u0014\u001a\u00020\u0013HÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0019\u0010\u001aR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001b\u001a\u0004\b\u001c\u0010\u000bR\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001b\u001a\u0004\b\u001d\u0010\u000bR\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001e\u0010\u000bR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001f\u001a\u0004\b \u0010\u000f¨\u0006!"}, d2 = {"Lcom/medium/android/graphql/fragment/UserSearchData;", "Lg15;", "", "__typename", "algoliaObjectId", "id", "Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "creatorPreviewData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CreatorPreviewData;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "()Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CreatorPreviewData;)Lcom/medium/android/graphql/fragment/UserSearchData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getAlgoliaObjectId", "getId", "Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "getCreatorPreviewData", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserSearchData implements g15 {
    private final String __typename;
    private final String algoliaObjectId;
    private final CreatorPreviewData creatorPreviewData;
    private final String id;

    public UserSearchData(String str, String str2, String str3, CreatorPreviewData creatorPreviewData) {
        str.getClass();
        str3.getClass();
        creatorPreviewData.getClass();
        this.__typename = str;
        this.algoliaObjectId = str2;
        this.id = str3;
        this.creatorPreviewData = creatorPreviewData;
    }

    public static /* synthetic */ UserSearchData copy$default(UserSearchData userSearchData, String str, String str2, String str3, CreatorPreviewData creatorPreviewData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userSearchData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = userSearchData.algoliaObjectId;
        }
        if ((i & 4) != 0) {
            str3 = userSearchData.id;
        }
        if ((i & 8) != 0) {
            creatorPreviewData = userSearchData.creatorPreviewData;
        }
        return userSearchData.copy(str, str2, str3, creatorPreviewData);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getAlgoliaObjectId() {
        return this.algoliaObjectId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final CreatorPreviewData getCreatorPreviewData() {
        return this.creatorPreviewData;
    }

    public final UserSearchData copy(String __typename, String algoliaObjectId, String id, CreatorPreviewData creatorPreviewData) {
        __typename.getClass();
        id.getClass();
        creatorPreviewData.getClass();
        return new UserSearchData(__typename, algoliaObjectId, id, creatorPreviewData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserSearchData)) {
            return false;
        }
        UserSearchData userSearchData = (UserSearchData) other;
        return g76.L(this.__typename, userSearchData.__typename) && g76.L(this.algoliaObjectId, userSearchData.algoliaObjectId) && g76.L(this.id, userSearchData.id) && g76.L(this.creatorPreviewData, userSearchData.creatorPreviewData);
    }

    public final String getAlgoliaObjectId() {
        return this.algoliaObjectId;
    }

    public final CreatorPreviewData getCreatorPreviewData() {
        return this.creatorPreviewData;
    }

    public final String getId() {
        return this.id;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        String str = this.algoliaObjectId;
        return this.creatorPreviewData.hashCode() + wgd.o((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.id);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.algoliaObjectId;
        String str3 = this.id;
        CreatorPreviewData creatorPreviewData = this.creatorPreviewData;
        StringBuilder sbU = y30.u("UserSearchData(__typename=", str, ", algoliaObjectId=", str2, ", id=");
        sbU.append(str3);
        sbU.append(", creatorPreviewData=");
        sbU.append(creatorPreviewData);
        sbU.append(")");
        return sbU.toString();
    }
}
