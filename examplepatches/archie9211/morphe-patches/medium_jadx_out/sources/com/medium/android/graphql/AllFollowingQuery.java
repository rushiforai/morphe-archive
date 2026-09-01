package com.medium.android.graphql;

import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.medium.android.graphql.adapter.AllFollowingQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.AllFollowingQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CollectionPreviewData;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.android.graphql.fragment.TagData;
import com.medium.android.graphql.selections.AllFollowingQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.xv8;
import defpackage.y30;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0015\b\u0086\b\u0018\u0000 .2\b\u0012\u0004\u0012\u00020\u00020\u0001:\r/0123456789:.B!\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0018\u0010\u001e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ,\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0001¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\"\u0010\u000bJ\u0010\u0010$\u001a\u00020#HÖ\u0001¢\u0006\u0004\b$\u0010%J\u001a\u0010(\u001a\u00020\u00122\b\u0010'\u001a\u0004\u0018\u00010&HÖ\u0003¢\u0006\u0004\b(\u0010)R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010*\u001a\u0004\b+\u0010\u000bR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010,\u001a\u0004\b-\u0010\u001f¨\u0006;"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery;", "Luqa;", "Lcom/medium/android/graphql/AllFollowingQuery$Data;", "", "userId", "Lzv8;", "Lcom/medium/android/graphql/type/PagingOptions;", "paging", "<init>", "(Ljava/lang/String;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lzv8;", "copy", "(Ljava/lang/String;Lzv8;)Lcom/medium/android/graphql/AllFollowingQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "Lzv8;", "getPaging", "Companion", "Data", "User", "OnUser", "MissionControl", "OnUserMissionControl", "Counts", "FollowingUserConnection", "User1", "FollowingCollectionConnection", "Collection", "FollowedTags", "Tag", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class AllFollowingQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "830146c96b1d88b36a8351612ae32d7c15f3c58a986c21a91b91e25905af985d";
    public static final String OPERATION_NAME = "allFollowing";
    private final zv8 paging;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$Collection;", "", "__typename", "", "id", "collectionPreviewData", "Lcom/medium/android/graphql/fragment/CollectionPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CollectionPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCollectionPreviewData", "()Lcom/medium/android/graphql/fragment/CollectionPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Collection {
        private final String __typename;
        private final CollectionPreviewData collectionPreviewData;
        private final String id;

        public Collection(String str, String str2, CollectionPreviewData collectionPreviewData) {
            str.getClass();
            str2.getClass();
            collectionPreviewData.getClass();
            this.__typename = str;
            this.id = str2;
            this.collectionPreviewData = collectionPreviewData;
        }

        public static /* synthetic */ Collection copy$default(Collection collection, String str, String str2, CollectionPreviewData collectionPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = collection.__typename;
            }
            if ((i & 2) != 0) {
                str2 = collection.id;
            }
            if ((i & 4) != 0) {
                collectionPreviewData = collection.collectionPreviewData;
            }
            return collection.copy(str, str2, collectionPreviewData);
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
        public final CollectionPreviewData getCollectionPreviewData() {
            return this.collectionPreviewData;
        }

        public final Collection copy(String __typename, String id, CollectionPreviewData collectionPreviewData) {
            __typename.getClass();
            id.getClass();
            collectionPreviewData.getClass();
            return new Collection(__typename, id, collectionPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Collection)) {
                return false;
            }
            Collection collection = (Collection) other;
            return g76.L(this.__typename, collection.__typename) && g76.L(this.id, collection.id) && g76.L(this.collectionPreviewData, collection.collectionPreviewData);
        }

        public final CollectionPreviewData getCollectionPreviewData() {
            return this.collectionPreviewData;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.collectionPreviewData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            CollectionPreviewData collectionPreviewData = this.collectionPreviewData;
            StringBuilder sbU = y30.u("Collection(__typename=", str, ", id=", str2, ", collectionPreviewData=");
            sbU.append(collectionPreviewData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\rJ\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\rJ\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\rJ<\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0016J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u0005HÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\f\u0010\rR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\u000f\u0010\rR\u0015\u0010\u0007\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\u0010\u0010\r¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$Counts;", "", "__typename", "", "followedAuthors", "", "followedCollections", "followedTags", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V", "get__typename", "()Ljava/lang/String;", "getFollowedAuthors", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getFollowedCollections", "getFollowedTags", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Lcom/medium/android/graphql/AllFollowingQuery$Counts;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Counts {
        private final String __typename;
        private final Integer followedAuthors;
        private final Integer followedCollections;
        private final Integer followedTags;

        public Counts(String str, Integer num, Integer num2, Integer num3) {
            str.getClass();
            this.__typename = str;
            this.followedAuthors = num;
            this.followedCollections = num2;
            this.followedTags = num3;
        }

        public static /* synthetic */ Counts copy$default(Counts counts, String str, Integer num, Integer num2, Integer num3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = counts.__typename;
            }
            if ((i & 2) != 0) {
                num = counts.followedAuthors;
            }
            if ((i & 4) != 0) {
                num2 = counts.followedCollections;
            }
            if ((i & 8) != 0) {
                num3 = counts.followedTags;
            }
            return counts.copy(str, num, num2, num3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getFollowedAuthors() {
            return this.followedAuthors;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Integer getFollowedCollections() {
            return this.followedCollections;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Integer getFollowedTags() {
            return this.followedTags;
        }

        public final Counts copy(String __typename, Integer followedAuthors, Integer followedCollections, Integer followedTags) {
            __typename.getClass();
            return new Counts(__typename, followedAuthors, followedCollections, followedTags);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Counts)) {
                return false;
            }
            Counts counts = (Counts) other;
            return g76.L(this.__typename, counts.__typename) && g76.L(this.followedAuthors, counts.followedAuthors) && g76.L(this.followedCollections, counts.followedCollections) && g76.L(this.followedTags, counts.followedTags);
        }

        public final Integer getFollowedAuthors() {
            return this.followedAuthors;
        }

        public final Integer getFollowedCollections() {
            return this.followedCollections;
        }

        public final Integer getFollowedTags() {
            return this.followedTags;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.followedAuthors;
            int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
            Integer num2 = this.followedCollections;
            int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
            Integer num3 = this.followedTags;
            return iHashCode3 + (num3 != null ? num3.hashCode() : 0);
        }

        public final String toString() {
            return "Counts(__typename=" + this.__typename + ", followedAuthors=" + this.followedAuthors + ", followedCollections=" + this.followedCollections + ", followedTags=" + this.followedTags + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/AllFollowingQuery$User;", "user", "<init>", "(Lcom/medium/android/graphql/AllFollowingQuery$User;)V", "component1", "()Lcom/medium/android/graphql/AllFollowingQuery$User;", "copy", "(Lcom/medium/android/graphql/AllFollowingQuery$User;)Lcom/medium/android/graphql/AllFollowingQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/AllFollowingQuery$User;", "getUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final User user;

        public Data(User user) {
            this.user = user;
        }

        public static Data copy$default(Data data, User user, int i, Object obj) {
            if ((i & 1) != 0) {
                user = data.user;
            }
            data.getClass();
            return new Data(user);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final User getUser() {
            return this.user;
        }

        public final Data copy(User user) {
            return new Data(user);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.user, ((Data) other).user);
        }

        public final User getUser() {
            return this.user;
        }

        public final int hashCode() {
            User user = this.user;
            if (user == null) {
                return 0;
            }
            return user.hashCode();
        }

        public final String toString() {
            return "Data(user=" + this.user + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$FollowedTags;", "", "__typename", "", "tags", "", "Lcom/medium/android/graphql/AllFollowingQuery$Tag;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getTags", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class FollowedTags {
        private final String __typename;
        private final List<Tag> tags;

        public FollowedTags(String str, List<Tag> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.tags = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ FollowedTags copy$default(FollowedTags followedTags, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = followedTags.__typename;
            }
            if ((i & 2) != 0) {
                list = followedTags.tags;
            }
            return followedTags.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Tag> component2() {
            return this.tags;
        }

        public final FollowedTags copy(String __typename, List<Tag> tags) {
            __typename.getClass();
            tags.getClass();
            return new FollowedTags(__typename, tags);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof FollowedTags)) {
                return false;
            }
            FollowedTags followedTags = (FollowedTags) other;
            return g76.L(this.__typename, followedTags.__typename) && g76.L(this.tags, followedTags.tags);
        }

        public final List<Tag> getTags() {
            return this.tags;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.tags.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("FollowedTags(__typename=", this.__typename, ", tags=", ")", this.tags);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$FollowingCollectionConnection;", "", "__typename", "", "collections", "", "Lcom/medium/android/graphql/AllFollowingQuery$Collection;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getCollections", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class FollowingCollectionConnection {
        private final String __typename;
        private final List<Collection> collections;

        public FollowingCollectionConnection(String str, List<Collection> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.collections = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ FollowingCollectionConnection copy$default(FollowingCollectionConnection followingCollectionConnection, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = followingCollectionConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = followingCollectionConnection.collections;
            }
            return followingCollectionConnection.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Collection> component2() {
            return this.collections;
        }

        public final FollowingCollectionConnection copy(String __typename, List<Collection> collections) {
            __typename.getClass();
            collections.getClass();
            return new FollowingCollectionConnection(__typename, collections);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof FollowingCollectionConnection)) {
                return false;
            }
            FollowingCollectionConnection followingCollectionConnection = (FollowingCollectionConnection) other;
            return g76.L(this.__typename, followingCollectionConnection.__typename) && g76.L(this.collections, followingCollectionConnection.collections);
        }

        public final List<Collection> getCollections() {
            return this.collections;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.collections.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("FollowingCollectionConnection(__typename=", this.__typename, AXoTRPEGKEve.gOSM, ")", this.collections);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$FollowingUserConnection;", "", "__typename", "", "users", "", "Lcom/medium/android/graphql/AllFollowingQuery$User1;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getUsers", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class FollowingUserConnection {
        private final String __typename;
        private final List<User1> users;

        public FollowingUserConnection(String str, List<User1> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.users = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ FollowingUserConnection copy$default(FollowingUserConnection followingUserConnection, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = followingUserConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = followingUserConnection.users;
            }
            return followingUserConnection.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<User1> component2() {
            return this.users;
        }

        public final FollowingUserConnection copy(String __typename, List<User1> users) {
            __typename.getClass();
            users.getClass();
            return new FollowingUserConnection(__typename, users);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof FollowingUserConnection)) {
                return false;
            }
            FollowingUserConnection followingUserConnection = (FollowingUserConnection) other;
            return g76.L(this.__typename, followingUserConnection.__typename) && g76.L(this.users, followingUserConnection.users);
        }

        public final List<User1> getUsers() {
            return this.users;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.users.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("FollowingUserConnection(__typename=", this.__typename, ", users=", ")", this.users);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$MissionControl;", "", "__typename", "", "onUserMissionControl", "Lcom/medium/android/graphql/AllFollowingQuery$OnUserMissionControl;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AllFollowingQuery$OnUserMissionControl;)V", "get__typename", "()Ljava/lang/String;", "getOnUserMissionControl", "()Lcom/medium/android/graphql/AllFollowingQuery$OnUserMissionControl;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MissionControl {
        private final String __typename;
        private final OnUserMissionControl onUserMissionControl;

        public MissionControl(String str, OnUserMissionControl onUserMissionControl) {
            str.getClass();
            onUserMissionControl.getClass();
            this.__typename = str;
            this.onUserMissionControl = onUserMissionControl;
        }

        public static /* synthetic */ MissionControl copy$default(MissionControl missionControl, String str, OnUserMissionControl onUserMissionControl, int i, Object obj) {
            if ((i & 1) != 0) {
                str = missionControl.__typename;
            }
            if ((i & 2) != 0) {
                onUserMissionControl = missionControl.onUserMissionControl;
            }
            return missionControl.copy(str, onUserMissionControl);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnUserMissionControl getOnUserMissionControl() {
            return this.onUserMissionControl;
        }

        public final MissionControl copy(String __typename, OnUserMissionControl onUserMissionControl) {
            __typename.getClass();
            onUserMissionControl.getClass();
            return new MissionControl(__typename, onUserMissionControl);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MissionControl)) {
                return false;
            }
            MissionControl missionControl = (MissionControl) other;
            return g76.L(this.__typename, missionControl.__typename) && g76.L(this.onUserMissionControl, missionControl.onUserMissionControl);
        }

        public final OnUserMissionControl getOnUserMissionControl() {
            return this.onUserMissionControl;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.onUserMissionControl.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "MissionControl(__typename=" + this.__typename + ", onUserMissionControl=" + this.onUserMissionControl + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B/\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bJ\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\tHÆ\u0003J9\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u001fHÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$OnUser;", "", "missionControl", "Lcom/medium/android/graphql/AllFollowingQuery$MissionControl;", "followingUserConnection", "Lcom/medium/android/graphql/AllFollowingQuery$FollowingUserConnection;", "followingCollectionConnection", "Lcom/medium/android/graphql/AllFollowingQuery$FollowingCollectionConnection;", "followedTags", "Lcom/medium/android/graphql/AllFollowingQuery$FollowedTags;", "<init>", "(Lcom/medium/android/graphql/AllFollowingQuery$MissionControl;Lcom/medium/android/graphql/AllFollowingQuery$FollowingUserConnection;Lcom/medium/android/graphql/AllFollowingQuery$FollowingCollectionConnection;Lcom/medium/android/graphql/AllFollowingQuery$FollowedTags;)V", "getMissionControl", "()Lcom/medium/android/graphql/AllFollowingQuery$MissionControl;", "getFollowingUserConnection", "()Lcom/medium/android/graphql/AllFollowingQuery$FollowingUserConnection;", "getFollowingCollectionConnection", "()Lcom/medium/android/graphql/AllFollowingQuery$FollowingCollectionConnection;", "getFollowedTags", "()Lcom/medium/android/graphql/AllFollowingQuery$FollowedTags;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUser {
        private final FollowedTags followedTags;
        private final FollowingCollectionConnection followingCollectionConnection;
        private final FollowingUserConnection followingUserConnection;
        private final MissionControl missionControl;

        public OnUser(MissionControl missionControl, FollowingUserConnection followingUserConnection, FollowingCollectionConnection followingCollectionConnection, FollowedTags followedTags) {
            this.missionControl = missionControl;
            this.followingUserConnection = followingUserConnection;
            this.followingCollectionConnection = followingCollectionConnection;
            this.followedTags = followedTags;
        }

        public static OnUser copy$default(OnUser onUser, MissionControl missionControl, FollowingUserConnection followingUserConnection, FollowingCollectionConnection followingCollectionConnection, FollowedTags followedTags, int i, Object obj) {
            if ((i & 1) != 0) {
                missionControl = onUser.missionControl;
            }
            if ((i & 2) != 0) {
                followingUserConnection = onUser.followingUserConnection;
            }
            if ((i & 4) != 0) {
                followingCollectionConnection = onUser.followingCollectionConnection;
            }
            if ((i & 8) != 0) {
                followedTags = onUser.followedTags;
            }
            onUser.getClass();
            return new OnUser(missionControl, followingUserConnection, followingCollectionConnection, followedTags);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final MissionControl getMissionControl() {
            return this.missionControl;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final FollowingUserConnection getFollowingUserConnection() {
            return this.followingUserConnection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final FollowingCollectionConnection getFollowingCollectionConnection() {
            return this.followingCollectionConnection;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final FollowedTags getFollowedTags() {
            return this.followedTags;
        }

        public final OnUser copy(MissionControl missionControl, FollowingUserConnection followingUserConnection, FollowingCollectionConnection followingCollectionConnection, FollowedTags followedTags) {
            return new OnUser(missionControl, followingUserConnection, followingCollectionConnection, followedTags);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnUser)) {
                return false;
            }
            OnUser onUser = (OnUser) other;
            return g76.L(this.missionControl, onUser.missionControl) && g76.L(this.followingUserConnection, onUser.followingUserConnection) && g76.L(this.followingCollectionConnection, onUser.followingCollectionConnection) && g76.L(this.followedTags, onUser.followedTags);
        }

        public final FollowedTags getFollowedTags() {
            return this.followedTags;
        }

        public final FollowingCollectionConnection getFollowingCollectionConnection() {
            return this.followingCollectionConnection;
        }

        public final FollowingUserConnection getFollowingUserConnection() {
            return this.followingUserConnection;
        }

        public final MissionControl getMissionControl() {
            return this.missionControl;
        }

        public final int hashCode() {
            MissionControl missionControl = this.missionControl;
            int iHashCode = (missionControl == null ? 0 : missionControl.hashCode()) * 31;
            FollowingUserConnection followingUserConnection = this.followingUserConnection;
            int iHashCode2 = (iHashCode + (followingUserConnection == null ? 0 : followingUserConnection.hashCode())) * 31;
            FollowingCollectionConnection followingCollectionConnection = this.followingCollectionConnection;
            int iHashCode3 = (iHashCode2 + (followingCollectionConnection == null ? 0 : followingCollectionConnection.hashCode())) * 31;
            FollowedTags followedTags = this.followedTags;
            return iHashCode3 + (followedTags != null ? followedTags.hashCode() : 0);
        }

        public final String toString() {
            return "OnUser(missionControl=" + this.missionControl + ", followingUserConnection=" + this.followingUserConnection + ", followingCollectionConnection=" + this.followingCollectionConnection + ", followedTags=" + this.followedTags + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$OnUserMissionControl;", "", "counts", "Lcom/medium/android/graphql/AllFollowingQuery$Counts;", "<init>", "(Lcom/medium/android/graphql/AllFollowingQuery$Counts;)V", "getCounts", "()Lcom/medium/android/graphql/AllFollowingQuery$Counts;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUserMissionControl {
        private final Counts counts;

        public OnUserMissionControl(Counts counts) {
            this.counts = counts;
        }

        public static OnUserMissionControl copy$default(OnUserMissionControl onUserMissionControl, Counts counts, int i, Object obj) {
            if ((i & 1) != 0) {
                counts = onUserMissionControl.counts;
            }
            onUserMissionControl.getClass();
            return new OnUserMissionControl(counts);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Counts getCounts() {
            return this.counts;
        }

        public final OnUserMissionControl copy(Counts counts) {
            return new OnUserMissionControl(counts);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnUserMissionControl) && g76.L(this.counts, ((OnUserMissionControl) other).counts);
        }

        public final Counts getCounts() {
            return this.counts;
        }

        public final int hashCode() {
            Counts counts = this.counts;
            if (counts == null) {
                return 0;
            }
            return counts.hashCode();
        }

        public final String toString() {
            return "OnUserMissionControl(counts=" + this.counts + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$Tag;", "", "__typename", "", "normalizedTagSlug", "tagData", "Lcom/medium/android/graphql/fragment/TagData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/TagData;)V", "get__typename", "()Ljava/lang/String;", "getNormalizedTagSlug", "getTagData", "()Lcom/medium/android/graphql/fragment/TagData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Tag {
        private final String __typename;
        private final String normalizedTagSlug;
        private final TagData tagData;

        public Tag(String str, String str2, TagData tagData) {
            lv8.C(str, str2, tagData);
            this.__typename = str;
            this.normalizedTagSlug = str2;
            this.tagData = tagData;
        }

        public static /* synthetic */ Tag copy$default(Tag tag, String str, String str2, TagData tagData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = tag.__typename;
            }
            if ((i & 2) != 0) {
                str2 = tag.normalizedTagSlug;
            }
            if ((i & 4) != 0) {
                tagData = tag.tagData;
            }
            return tag.copy(str, str2, tagData);
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
        public final TagData getTagData() {
            return this.tagData;
        }

        public final Tag copy(String __typename, String normalizedTagSlug, TagData tagData) {
            __typename.getClass();
            normalizedTagSlug.getClass();
            tagData.getClass();
            return new Tag(__typename, normalizedTagSlug, tagData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Tag)) {
                return false;
            }
            Tag tag = (Tag) other;
            return g76.L(this.__typename, tag.__typename) && g76.L(this.normalizedTagSlug, tag.normalizedTagSlug) && g76.L(this.tagData, tag.tagData);
        }

        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        public final TagData getTagData() {
            return this.tagData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.tagData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.normalizedTagSlug);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.normalizedTagSlug;
            TagData tagData = this.tagData;
            StringBuilder sbU = y30.u("Tag(__typename=", str, ", normalizedTagSlug=", str2, ", tagData=");
            sbU.append(tagData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$User;", "", "__typename", "", "id", "onUser", "Lcom/medium/android/graphql/AllFollowingQuery$OnUser;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/AllFollowingQuery$OnUser;)V", "get__typename", "()Ljava/lang/String;", "getId", "getOnUser", "()Lcom/medium/android/graphql/AllFollowingQuery$OnUser;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User {
        private final String __typename;
        private final String id;
        private final OnUser onUser;

        public User(String str, String str2, OnUser onUser) {
            str.getClass();
            str2.getClass();
            onUser.getClass();
            this.__typename = str;
            this.id = str2;
            this.onUser = onUser;
        }

        public static /* synthetic */ User copy$default(User user, String str, String str2, OnUser onUser, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user.__typename;
            }
            if ((i & 2) != 0) {
                str2 = user.id;
            }
            if ((i & 4) != 0) {
                onUser = user.onUser;
            }
            return user.copy(str, str2, onUser);
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
        public final OnUser getOnUser() {
            return this.onUser;
        }

        public final User copy(String __typename, String id, OnUser onUser) {
            __typename.getClass();
            id.getClass();
            onUser.getClass();
            return new User(__typename, id, onUser);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User)) {
                return false;
            }
            User user = (User) other;
            return g76.L(this.__typename, user.__typename) && g76.L(this.id, user.id) && g76.L(this.onUser, user.onUser);
        }

        public final String getId() {
            return this.id;
        }

        public final OnUser getOnUser() {
            return this.onUser;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.onUser.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            OnUser onUser = this.onUser;
            StringBuilder sbU = y30.u("User(__typename=", str, ", id=", str2, ", onUser=");
            sbU.append(onUser);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$User1;", "", "__typename", "", "id", "creatorPreviewData", "Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CreatorPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCreatorPreviewData", "()Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User1 {
        private final String __typename;
        private final CreatorPreviewData creatorPreviewData;
        private final String id;

        public User1(String str, String str2, CreatorPreviewData creatorPreviewData) {
            str.getClass();
            str2.getClass();
            creatorPreviewData.getClass();
            this.__typename = str;
            this.id = str2;
            this.creatorPreviewData = creatorPreviewData;
        }

        public static /* synthetic */ User1 copy$default(User1 user1, String str, String str2, CreatorPreviewData creatorPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user1.__typename;
            }
            if ((i & 2) != 0) {
                str2 = user1.id;
            }
            if ((i & 4) != 0) {
                creatorPreviewData = user1.creatorPreviewData;
            }
            return user1.copy(str, str2, creatorPreviewData);
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
        public final CreatorPreviewData getCreatorPreviewData() {
            return this.creatorPreviewData;
        }

        public final User1 copy(String __typename, String id, CreatorPreviewData creatorPreviewData) {
            __typename.getClass();
            id.getClass();
            creatorPreviewData.getClass();
            return new User1(__typename, id, creatorPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User1)) {
                return false;
            }
            User1 user1 = (User1) other;
            return g76.L(this.__typename, user1.__typename) && g76.L(this.id, user1.id) && g76.L(this.creatorPreviewData, user1.creatorPreviewData);
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
            return this.creatorPreviewData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            CreatorPreviewData creatorPreviewData = this.creatorPreviewData;
            StringBuilder sbU = y30.u("User1(__typename=", str, ", id=", str2, ", creatorPreviewData=");
            sbU.append(creatorPreviewData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public AllFollowingQuery(String str, zv8 zv8Var) {
        str.getClass();
        zv8Var.getClass();
        this.userId = str;
        this.paging = zv8Var;
    }

    public static /* synthetic */ AllFollowingQuery copy$default(AllFollowingQuery allFollowingQuery, String str, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = allFollowingQuery.userId;
        }
        if ((i & 2) != 0) {
            zv8Var = allFollowingQuery.paging;
        }
        return allFollowingQuery.copy(str, zv8Var);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(AllFollowingQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getPaging() {
        return this.paging;
    }

    public final AllFollowingQuery copy(String userId, zv8 paging) {
        userId.getClass();
        paging.getClass();
        return new AllFollowingQuery(userId, paging);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query allFollowing($userId: ID!, $paging: PagingOptions) { user(id: $userId) { __typename ... on User { missionControl { __typename ... on UserMissionControl { counts { __typename followedAuthors followedCollections followedTags } } } followingUserConnection(paging: $paging) { __typename users { __typename ...CreatorPreviewData id } } followingCollectionConnection(paging: $paging) { __typename collections { __typename ...CollectionPreviewData id } } followedTags(paging: $paging) { __typename tags { __typename ...TagData normalizedTagSlug } } } id } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }  fragment CollectionPreviewData on Collection { __typename id name avatar { __typename id } description subscriberCount customStyleSheet { __typename header { __typename backgroundImage { __typename id } } } }  fragment TagData on Tag { __typename id normalizedTagSlug displayTitle followerCount postCount viewerEdge { __typename id isFollowing } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AllFollowingQuery)) {
            return false;
        }
        AllFollowingQuery allFollowingQuery = (AllFollowingQuery) other;
        return g76.L(this.userId, allFollowingQuery.userId) && g76.L(this.paging, allFollowingQuery.paging);
    }

    public final zv8 getPaging() {
        return this.paging;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.paging.hashCode() + (this.userId.hashCode() * 31);
    }

    @Override // defpackage.hv8
    public final String id() {
        return OPERATION_ID;
    }

    @Override // defpackage.hv8
    public final String name() {
        return OPERATION_NAME;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = AllFollowingQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        AllFollowingQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "AllFollowingQuery(userId=" + this.userId + ", paging=" + this.paging + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/AllFollowingQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query allFollowing($userId: ID!, $paging: PagingOptions) { user(id: $userId) { __typename ... on User { missionControl { __typename ... on UserMissionControl { counts { __typename followedAuthors followedCollections followedTags } } } followingUserConnection(paging: $paging) { __typename users { __typename ...CreatorPreviewData id } } followingCollectionConnection(paging: $paging) { __typename collections { __typename ...CollectionPreviewData id } } followedTags(paging: $paging) { __typename tags { __typename ...TagData normalizedTagSlug } } } id } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }  fragment CollectionPreviewData on Collection { __typename id name avatar { __typename id } description subscriberCount customStyleSheet { __typename header { __typename backgroundImage { __typename id } } } }  fragment TagData on Tag { __typename id normalizedTagSlug displayTitle followerCount postCount viewerEdge { __typename id isFollowing } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ AllFollowingQuery(String str, zv8 zv8Var, int i, gy2 gy2Var) {
        this(str, (i & 2) != 0 ? xv8.a : zv8Var);
    }
}
