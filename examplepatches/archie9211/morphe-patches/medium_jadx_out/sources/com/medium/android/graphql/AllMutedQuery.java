package com.medium.android.graphql;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import com.medium.android.graphql.adapter.AllMutedQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.AllMutedQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CollectionPreviewData;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.android.graphql.fragment.PagingParamsData;
import com.medium.android.graphql.selections.AllMutedQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
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
@Metadata(d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0017\b\u0086\b\u0018\u0000 .2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u000f/0123456789:;<.B!\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0018\u0010\u001e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ,\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0001¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\"\u0010\u000bJ\u0010\u0010$\u001a\u00020#HÖ\u0001¢\u0006\u0004\b$\u0010%J\u001a\u0010(\u001a\u00020\u00122\b\u0010'\u001a\u0004\u0018\u00010&HÖ\u0003¢\u0006\u0004\b(\u0010)R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010*\u001a\u0004\b+\u0010\u000bR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010,\u001a\u0004\b-\u0010\u001f¨\u0006="}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery;", "Luqa;", "Lcom/medium/android/graphql/AllMutedQuery$Data;", "", "userId", "Lzv8;", "Lcom/medium/android/graphql/type/PagingOptions;", "paging", "<init>", "(Ljava/lang/String;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lzv8;", "copy", "(Ljava/lang/String;Lzv8;)Lcom/medium/android/graphql/AllMutedQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "Lzv8;", "getPaging", "Companion", "Data", "User", "OnUser", "MissionControl", "OnUserMissionControl", "Counts", "MutedUserConnection", "User1", "PagingInfo", "Next", "MutedCollectionConnection", "Collection", "PagingInfo1", "Next1", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class AllMutedQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "4156c8a99af12d603b85c49d763e14798d61731ab29f8f3c545d93be9c88c06b";
    public static final String OPERATION_NAME = "allMuted";
    private final zv8 paging;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$Collection;", "", "__typename", "", "id", "collectionPreviewData", "Lcom/medium/android/graphql/fragment/CollectionPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CollectionPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCollectionPreviewData", "()Lcom/medium/android/graphql/fragment/CollectionPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\fJ\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\fJ0\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000b\u0010\fR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000e\u0010\f¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$Counts;", "", "__typename", "", "mutedAuthors", "", MutedCollectionsQuery.OPERATION_NAME, "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V", "get__typename", "()Ljava/lang/String;", "getMutedAuthors", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getMutedCollections", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)Lcom/medium/android/graphql/AllMutedQuery$Counts;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Counts {
        private final String __typename;
        private final Integer mutedAuthors;
        private final Integer mutedCollections;

        public Counts(String str, Integer num, Integer num2) {
            str.getClass();
            this.__typename = str;
            this.mutedAuthors = num;
            this.mutedCollections = num2;
        }

        public static /* synthetic */ Counts copy$default(Counts counts, String str, Integer num, Integer num2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = counts.__typename;
            }
            if ((i & 2) != 0) {
                num = counts.mutedAuthors;
            }
            if ((i & 4) != 0) {
                num2 = counts.mutedCollections;
            }
            return counts.copy(str, num, num2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getMutedAuthors() {
            return this.mutedAuthors;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Integer getMutedCollections() {
            return this.mutedCollections;
        }

        public final Counts copy(String __typename, Integer mutedAuthors, Integer mutedCollections) {
            __typename.getClass();
            return new Counts(__typename, mutedAuthors, mutedCollections);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Counts)) {
                return false;
            }
            Counts counts = (Counts) other;
            return g76.L(this.__typename, counts.__typename) && g76.L(this.mutedAuthors, counts.mutedAuthors) && g76.L(this.mutedCollections, counts.mutedCollections);
        }

        public final Integer getMutedAuthors() {
            return this.mutedAuthors;
        }

        public final Integer getMutedCollections() {
            return this.mutedCollections;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.mutedAuthors;
            int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
            Integer num2 = this.mutedCollections;
            return iHashCode2 + (num2 != null ? num2.hashCode() : 0);
        }

        public final String toString() {
            return "Counts(__typename=" + this.__typename + ", mutedAuthors=" + this.mutedAuthors + ", mutedCollections=" + this.mutedCollections + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/AllMutedQuery$User;", "user", "<init>", "(Lcom/medium/android/graphql/AllMutedQuery$User;)V", "component1", "()Lcom/medium/android/graphql/AllMutedQuery$User;", "copy", "(Lcom/medium/android/graphql/AllMutedQuery$User;)Lcom/medium/android/graphql/AllMutedQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/AllMutedQuery$User;", "getUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$MissionControl;", "", "__typename", "", "onUserMissionControl", "Lcom/medium/android/graphql/AllMutedQuery$OnUserMissionControl;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AllMutedQuery$OnUserMissionControl;)V", "get__typename", "()Ljava/lang/String;", "getOnUserMissionControl", "()Lcom/medium/android/graphql/AllMutedQuery$OnUserMissionControl;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\bHÆ\u0003J/\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$MutedCollectionConnection;", "", "__typename", "", "collections", "", "Lcom/medium/android/graphql/AllMutedQuery$Collection;", "pagingInfo", "Lcom/medium/android/graphql/AllMutedQuery$PagingInfo1;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/AllMutedQuery$PagingInfo1;)V", "get__typename", "()Ljava/lang/String;", "getCollections", "()Ljava/util/List;", "getPagingInfo", "()Lcom/medium/android/graphql/AllMutedQuery$PagingInfo1;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MutedCollectionConnection {
        private final String __typename;
        private final List<Collection> collections;
        private final PagingInfo1 pagingInfo;

        public MutedCollectionConnection(String str, List<Collection> list, PagingInfo1 pagingInfo1) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.collections = list;
            this.pagingInfo = pagingInfo1;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ MutedCollectionConnection copy$default(MutedCollectionConnection mutedCollectionConnection, String str, List list, PagingInfo1 pagingInfo1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mutedCollectionConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = mutedCollectionConnection.collections;
            }
            if ((i & 4) != 0) {
                pagingInfo1 = mutedCollectionConnection.pagingInfo;
            }
            return mutedCollectionConnection.copy(str, list, pagingInfo1);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Collection> component2() {
            return this.collections;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PagingInfo1 getPagingInfo() {
            return this.pagingInfo;
        }

        public final MutedCollectionConnection copy(String __typename, List<Collection> collections, PagingInfo1 pagingInfo) {
            __typename.getClass();
            collections.getClass();
            return new MutedCollectionConnection(__typename, collections, pagingInfo);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MutedCollectionConnection)) {
                return false;
            }
            MutedCollectionConnection mutedCollectionConnection = (MutedCollectionConnection) other;
            return g76.L(this.__typename, mutedCollectionConnection.__typename) && g76.L(this.collections, mutedCollectionConnection.collections) && g76.L(this.pagingInfo, mutedCollectionConnection.pagingInfo);
        }

        public final List<Collection> getCollections() {
            return this.collections;
        }

        public final PagingInfo1 getPagingInfo() {
            return this.pagingInfo;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iP = wgd.p(this.__typename.hashCode() * 31, 31, this.collections);
            PagingInfo1 pagingInfo1 = this.pagingInfo;
            return iP + (pagingInfo1 == null ? 0 : pagingInfo1.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            List<Collection> list = this.collections;
            PagingInfo1 pagingInfo1 = this.pagingInfo;
            StringBuilder sbE = b09.E("MutedCollectionConnection(__typename=", str, ", collections=", ", pagingInfo=", list);
            sbE.append(pagingInfo1);
            sbE.append(")");
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\bHÆ\u0003J/\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$MutedUserConnection;", "", "__typename", "", "users", "", "Lcom/medium/android/graphql/AllMutedQuery$User1;", "pagingInfo", "Lcom/medium/android/graphql/AllMutedQuery$PagingInfo;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/AllMutedQuery$PagingInfo;)V", "get__typename", "()Ljava/lang/String;", "getUsers", "()Ljava/util/List;", "getPagingInfo", "()Lcom/medium/android/graphql/AllMutedQuery$PagingInfo;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MutedUserConnection {
        private final String __typename;
        private final PagingInfo pagingInfo;
        private final List<User1> users;

        public MutedUserConnection(String str, List<User1> list, PagingInfo pagingInfo) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.users = list;
            this.pagingInfo = pagingInfo;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ MutedUserConnection copy$default(MutedUserConnection mutedUserConnection, String str, List list, PagingInfo pagingInfo, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mutedUserConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = mutedUserConnection.users;
            }
            if ((i & 4) != 0) {
                pagingInfo = mutedUserConnection.pagingInfo;
            }
            return mutedUserConnection.copy(str, list, pagingInfo);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<User1> component2() {
            return this.users;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PagingInfo getPagingInfo() {
            return this.pagingInfo;
        }

        public final MutedUserConnection copy(String __typename, List<User1> users, PagingInfo pagingInfo) {
            __typename.getClass();
            users.getClass();
            return new MutedUserConnection(__typename, users, pagingInfo);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MutedUserConnection)) {
                return false;
            }
            MutedUserConnection mutedUserConnection = (MutedUserConnection) other;
            return g76.L(this.__typename, mutedUserConnection.__typename) && g76.L(this.users, mutedUserConnection.users) && g76.L(this.pagingInfo, mutedUserConnection.pagingInfo);
        }

        public final PagingInfo getPagingInfo() {
            return this.pagingInfo;
        }

        public final List<User1> getUsers() {
            return this.users;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iP = wgd.p(this.__typename.hashCode() * 31, 31, this.users);
            PagingInfo pagingInfo = this.pagingInfo;
            return iP + (pagingInfo == null ? 0 : pagingInfo.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            List<User1> list = this.users;
            PagingInfo pagingInfo = this.pagingInfo;
            StringBuilder sbE = b09.E("MutedUserConnection(__typename=", str, ", users=", ", pagingInfo=", list);
            sbE.append(pagingInfo);
            sbE.append(")");
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$Next;", "", "__typename", "", "pagingParamsData", "Lcom/medium/android/graphql/fragment/PagingParamsData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PagingParamsData;)V", "get__typename", "()Ljava/lang/String;", "getPagingParamsData", "()Lcom/medium/android/graphql/fragment/PagingParamsData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Next {
        private final String __typename;
        private final PagingParamsData pagingParamsData;

        public Next(String str, PagingParamsData pagingParamsData) {
            str.getClass();
            pagingParamsData.getClass();
            this.__typename = str;
            this.pagingParamsData = pagingParamsData;
        }

        public static /* synthetic */ Next copy$default(Next next, String str, PagingParamsData pagingParamsData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = next.__typename;
            }
            if ((i & 2) != 0) {
                pagingParamsData = next.pagingParamsData;
            }
            return next.copy(str, pagingParamsData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PagingParamsData getPagingParamsData() {
            return this.pagingParamsData;
        }

        public final Next copy(String __typename, PagingParamsData pagingParamsData) {
            __typename.getClass();
            pagingParamsData.getClass();
            return new Next(__typename, pagingParamsData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Next)) {
                return false;
            }
            Next next = (Next) other;
            return g76.L(this.__typename, next.__typename) && g76.L(this.pagingParamsData, next.pagingParamsData);
        }

        public final PagingParamsData getPagingParamsData() {
            return this.pagingParamsData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.pagingParamsData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return lv8.q("Next(__typename=", this.__typename, ", pagingParamsData=", this.pagingParamsData, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$Next1;", "", "__typename", "", "pagingParamsData", "Lcom/medium/android/graphql/fragment/PagingParamsData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PagingParamsData;)V", "get__typename", "()Ljava/lang/String;", "getPagingParamsData", "()Lcom/medium/android/graphql/fragment/PagingParamsData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Next1 {
        private final String __typename;
        private final PagingParamsData pagingParamsData;

        public Next1(String str, PagingParamsData pagingParamsData) {
            str.getClass();
            pagingParamsData.getClass();
            this.__typename = str;
            this.pagingParamsData = pagingParamsData;
        }

        public static /* synthetic */ Next1 copy$default(Next1 next1, String str, PagingParamsData pagingParamsData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = next1.__typename;
            }
            if ((i & 2) != 0) {
                pagingParamsData = next1.pagingParamsData;
            }
            return next1.copy(str, pagingParamsData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PagingParamsData getPagingParamsData() {
            return this.pagingParamsData;
        }

        public final Next1 copy(String __typename, PagingParamsData pagingParamsData) {
            __typename.getClass();
            pagingParamsData.getClass();
            return new Next1(__typename, pagingParamsData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Next1)) {
                return false;
            }
            Next1 next1 = (Next1) other;
            return g76.L(this.__typename, next1.__typename) && g76.L(this.pagingParamsData, next1.pagingParamsData);
        }

        public final PagingParamsData getPagingParamsData() {
            return this.pagingParamsData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.pagingParamsData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return lv8.q("Next1(__typename=", this.__typename, ", pagingParamsData=", this.pagingParamsData, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B%\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J-\u0010\u0013\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u001aHÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$OnUser;", "", "missionControl", "Lcom/medium/android/graphql/AllMutedQuery$MissionControl;", "mutedUserConnection", "Lcom/medium/android/graphql/AllMutedQuery$MutedUserConnection;", "mutedCollectionConnection", "Lcom/medium/android/graphql/AllMutedQuery$MutedCollectionConnection;", "<init>", "(Lcom/medium/android/graphql/AllMutedQuery$MissionControl;Lcom/medium/android/graphql/AllMutedQuery$MutedUserConnection;Lcom/medium/android/graphql/AllMutedQuery$MutedCollectionConnection;)V", "getMissionControl", "()Lcom/medium/android/graphql/AllMutedQuery$MissionControl;", "getMutedUserConnection", "()Lcom/medium/android/graphql/AllMutedQuery$MutedUserConnection;", "getMutedCollectionConnection", "()Lcom/medium/android/graphql/AllMutedQuery$MutedCollectionConnection;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUser {
        private final MissionControl missionControl;
        private final MutedCollectionConnection mutedCollectionConnection;
        private final MutedUserConnection mutedUserConnection;

        public OnUser(MissionControl missionControl, MutedUserConnection mutedUserConnection, MutedCollectionConnection mutedCollectionConnection) {
            this.missionControl = missionControl;
            this.mutedUserConnection = mutedUserConnection;
            this.mutedCollectionConnection = mutedCollectionConnection;
        }

        public static OnUser copy$default(OnUser onUser, MissionControl missionControl, MutedUserConnection mutedUserConnection, MutedCollectionConnection mutedCollectionConnection, int i, Object obj) {
            if ((i & 1) != 0) {
                missionControl = onUser.missionControl;
            }
            if ((i & 2) != 0) {
                mutedUserConnection = onUser.mutedUserConnection;
            }
            if ((i & 4) != 0) {
                mutedCollectionConnection = onUser.mutedCollectionConnection;
            }
            onUser.getClass();
            return new OnUser(missionControl, mutedUserConnection, mutedCollectionConnection);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final MissionControl getMissionControl() {
            return this.missionControl;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MutedUserConnection getMutedUserConnection() {
            return this.mutedUserConnection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final MutedCollectionConnection getMutedCollectionConnection() {
            return this.mutedCollectionConnection;
        }

        public final OnUser copy(MissionControl missionControl, MutedUserConnection mutedUserConnection, MutedCollectionConnection mutedCollectionConnection) {
            return new OnUser(missionControl, mutedUserConnection, mutedCollectionConnection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnUser)) {
                return false;
            }
            OnUser onUser = (OnUser) other;
            return g76.L(this.missionControl, onUser.missionControl) && g76.L(this.mutedUserConnection, onUser.mutedUserConnection) && g76.L(this.mutedCollectionConnection, onUser.mutedCollectionConnection);
        }

        public final MissionControl getMissionControl() {
            return this.missionControl;
        }

        public final MutedCollectionConnection getMutedCollectionConnection() {
            return this.mutedCollectionConnection;
        }

        public final MutedUserConnection getMutedUserConnection() {
            return this.mutedUserConnection;
        }

        public final int hashCode() {
            MissionControl missionControl = this.missionControl;
            int iHashCode = (missionControl == null ? 0 : missionControl.hashCode()) * 31;
            MutedUserConnection mutedUserConnection = this.mutedUserConnection;
            int iHashCode2 = (iHashCode + (mutedUserConnection == null ? 0 : mutedUserConnection.hashCode())) * 31;
            MutedCollectionConnection mutedCollectionConnection = this.mutedCollectionConnection;
            return iHashCode2 + (mutedCollectionConnection != null ? mutedCollectionConnection.hashCode() : 0);
        }

        public final String toString() {
            return "OnUser(missionControl=" + this.missionControl + ", mutedUserConnection=" + this.mutedUserConnection + ", mutedCollectionConnection=" + this.mutedCollectionConnection + HrUBqHumRuLe.sJbSLVyCod;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$OnUserMissionControl;", "", "counts", "Lcom/medium/android/graphql/AllMutedQuery$Counts;", "<init>", "(Lcom/medium/android/graphql/AllMutedQuery$Counts;)V", "getCounts", "()Lcom/medium/android/graphql/AllMutedQuery$Counts;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$PagingInfo;", "", "__typename", "", "next", "Lcom/medium/android/graphql/AllMutedQuery$Next;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AllMutedQuery$Next;)V", "get__typename", "()Ljava/lang/String;", "getNext", "()Lcom/medium/android/graphql/AllMutedQuery$Next;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PagingInfo {
        private final String __typename;
        private final Next next;

        public PagingInfo(String str, Next next) {
            str.getClass();
            this.__typename = str;
            this.next = next;
        }

        public static /* synthetic */ PagingInfo copy$default(PagingInfo pagingInfo, String str, Next next, int i, Object obj) {
            if ((i & 1) != 0) {
                str = pagingInfo.__typename;
            }
            if ((i & 2) != 0) {
                next = pagingInfo.next;
            }
            return pagingInfo.copy(str, next);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Next getNext() {
            return this.next;
        }

        public final PagingInfo copy(String __typename, Next next) {
            __typename.getClass();
            return new PagingInfo(__typename, next);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PagingInfo)) {
                return false;
            }
            PagingInfo pagingInfo = (PagingInfo) other;
            return g76.L(this.__typename, pagingInfo.__typename) && g76.L(this.next, pagingInfo.next);
        }

        public final Next getNext() {
            return this.next;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Next next = this.next;
            return iHashCode + (next == null ? 0 : next.hashCode());
        }

        public final String toString() {
            return "PagingInfo(__typename=" + this.__typename + ", next=" + this.next + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$PagingInfo1;", "", "__typename", "", "next", "Lcom/medium/android/graphql/AllMutedQuery$Next1;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AllMutedQuery$Next1;)V", "get__typename", "()Ljava/lang/String;", "getNext", "()Lcom/medium/android/graphql/AllMutedQuery$Next1;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PagingInfo1 {
        private final String __typename;
        private final Next1 next;

        public PagingInfo1(String str, Next1 next1) {
            str.getClass();
            this.__typename = str;
            this.next = next1;
        }

        public static /* synthetic */ PagingInfo1 copy$default(PagingInfo1 pagingInfo1, String str, Next1 next1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = pagingInfo1.__typename;
            }
            if ((i & 2) != 0) {
                next1 = pagingInfo1.next;
            }
            return pagingInfo1.copy(str, next1);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Next1 getNext() {
            return this.next;
        }

        public final PagingInfo1 copy(String __typename, Next1 next) {
            __typename.getClass();
            return new PagingInfo1(__typename, next);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PagingInfo1)) {
                return false;
            }
            PagingInfo1 pagingInfo1 = (PagingInfo1) other;
            return g76.L(this.__typename, pagingInfo1.__typename) && g76.L(this.next, pagingInfo1.next);
        }

        public final Next1 getNext() {
            return this.next;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Next1 next1 = this.next;
            return iHashCode + (next1 == null ? 0 : next1.hashCode());
        }

        public final String toString() {
            return "PagingInfo1(__typename=" + this.__typename + ", next=" + this.next + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$User;", "", "__typename", "", "id", "onUser", "Lcom/medium/android/graphql/AllMutedQuery$OnUser;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/AllMutedQuery$OnUser;)V", "get__typename", "()Ljava/lang/String;", "getId", "getOnUser", "()Lcom/medium/android/graphql/AllMutedQuery$OnUser;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$User1;", "", "__typename", "", "id", "creatorPreviewData", "Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CreatorPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCreatorPreviewData", "()Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public AllMutedQuery(String str, zv8 zv8Var) {
        str.getClass();
        zv8Var.getClass();
        this.userId = str;
        this.paging = zv8Var;
    }

    public static /* synthetic */ AllMutedQuery copy$default(AllMutedQuery allMutedQuery, String str, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = allMutedQuery.userId;
        }
        if ((i & 2) != 0) {
            zv8Var = allMutedQuery.paging;
        }
        return allMutedQuery.copy(str, zv8Var);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(AllMutedQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getPaging() {
        return this.paging;
    }

    public final AllMutedQuery copy(String userId, zv8 paging) {
        userId.getClass();
        paging.getClass();
        return new AllMutedQuery(userId, paging);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query allMuted($userId: ID!, $paging: PagingOptions) { user(id: $userId) { __typename ... on User { missionControl { __typename ... on UserMissionControl { counts { __typename mutedAuthors mutedCollections } } } mutedUserConnection(paging: $paging) { __typename users { __typename ...CreatorPreviewData id } pagingInfo { __typename next { __typename ...PagingParamsData } } } mutedCollectionConnection(paging: $paging) { __typename collections { __typename ...CollectionPreviewData id } pagingInfo { __typename next { __typename ...PagingParamsData } } } } id } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }  fragment CollectionPreviewData on Collection { __typename id name avatar { __typename id } description subscriberCount customStyleSheet { __typename header { __typename backgroundImage { __typename id } } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AllMutedQuery)) {
            return false;
        }
        AllMutedQuery allMutedQuery = (AllMutedQuery) other;
        return g76.L(this.userId, allMutedQuery.userId) && g76.L(this.paging, allMutedQuery.paging);
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
        List<sx1> list = AllMutedQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        AllMutedQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "AllMutedQuery(userId=" + this.userId + ", paging=" + this.paging + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/AllMutedQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query allMuted($userId: ID!, $paging: PagingOptions) { user(id: $userId) { __typename ... on User { missionControl { __typename ... on UserMissionControl { counts { __typename mutedAuthors mutedCollections } } } mutedUserConnection(paging: $paging) { __typename users { __typename ...CreatorPreviewData id } pagingInfo { __typename next { __typename ...PagingParamsData } } } mutedCollectionConnection(paging: $paging) { __typename collections { __typename ...CollectionPreviewData id } pagingInfo { __typename next { __typename ...PagingParamsData } } } } id } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }  fragment CollectionPreviewData on Collection { __typename id name avatar { __typename id } description subscriberCount customStyleSheet { __typename header { __typename backgroundImage { __typename id } } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ AllMutedQuery(String str, zv8 zv8Var, int i, gy2 gy2Var) {
        this(str, (i & 2) != 0 ? xv8.a : zv8Var);
    }
}
