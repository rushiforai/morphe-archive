package com.medium.android.graphql;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.medium.android.graphql.adapter.PublicationFollowersQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PublicationFollowersQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.android.graphql.fragment.PagingParamsData;
import com.medium.android.graphql.selections.PublicationFollowersQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.b09;
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
@Metadata(d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000f\b\u0086\b\u0018\u0000 .2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0007/01234.B!\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0018\u0010\u001e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ,\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0001¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\"\u0010\u000bJ\u0010\u0010$\u001a\u00020#HÖ\u0001¢\u0006\u0004\b$\u0010%J\u001a\u0010(\u001a\u00020\u00122\b\u0010'\u001a\u0004\u0018\u00010&HÖ\u0003¢\u0006\u0004\b(\u0010)R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010*\u001a\u0004\b+\u0010\u000bR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010,\u001a\u0004\b-\u0010\u001f¨\u00065"}, d2 = {"Lcom/medium/android/graphql/PublicationFollowersQuery;", "Luqa;", "Lcom/medium/android/graphql/PublicationFollowersQuery$Data;", "", "collectionId", "Lzv8;", "Lcom/medium/android/graphql/type/PagingOptions;", "pagingInfo", "<init>", "(Ljava/lang/String;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lzv8;", "copy", "(Ljava/lang/String;Lzv8;)Lcom/medium/android/graphql/PublicationFollowersQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCollectionId", "Lzv8;", "getPagingInfo", "Companion", "Data", "Collection", "FollowersUserConnection", "PagingInfo", "Next", "User", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationFollowersQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "3edcf5b6581747df6d9553464d92babf04893b516a29e4351eac5295f71bdb62";
    public static final String OPERATION_NAME = "PublicationFollowersQuery";
    private final String collectionId;
    private final zv8 pagingInfo;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/PublicationFollowersQuery$Collection;", "", "__typename", "", "followersUserConnection", "Lcom/medium/android/graphql/PublicationFollowersQuery$FollowersUserConnection;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationFollowersQuery$FollowersUserConnection;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getFollowersUserConnection", "()Lcom/medium/android/graphql/PublicationFollowersQuery$FollowersUserConnection;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Collection {
        private final String __typename;
        private final FollowersUserConnection followersUserConnection;
        private final String id;

        public Collection(String str, FollowersUserConnection followersUserConnection, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.followersUserConnection = followersUserConnection;
            this.id = str2;
        }

        public static /* synthetic */ Collection copy$default(Collection collection, String str, FollowersUserConnection followersUserConnection, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = collection.__typename;
            }
            if ((i & 2) != 0) {
                followersUserConnection = collection.followersUserConnection;
            }
            if ((i & 4) != 0) {
                str2 = collection.id;
            }
            return collection.copy(str, followersUserConnection, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final FollowersUserConnection getFollowersUserConnection() {
            return this.followersUserConnection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Collection copy(String __typename, FollowersUserConnection followersUserConnection, String id) {
            __typename.getClass();
            id.getClass();
            return new Collection(__typename, followersUserConnection, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Collection)) {
                return false;
            }
            Collection collection = (Collection) other;
            return g76.L(this.__typename, collection.__typename) && g76.L(this.followersUserConnection, collection.followersUserConnection) && g76.L(this.id, collection.id);
        }

        public final FollowersUserConnection getFollowersUserConnection() {
            return this.followersUserConnection;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            FollowersUserConnection followersUserConnection = this.followersUserConnection;
            return this.id.hashCode() + ((iHashCode + (followersUserConnection == null ? 0 : followersUserConnection.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            FollowersUserConnection followersUserConnection = this.followersUserConnection;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("Collection(__typename=");
            sb.append(str);
            sb.append(", followersUserConnection=");
            sb.append(followersUserConnection);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PublicationFollowersQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PublicationFollowersQuery$Collection;", "collection", "<init>", "(Lcom/medium/android/graphql/PublicationFollowersQuery$Collection;)V", "component1", "()Lcom/medium/android/graphql/PublicationFollowersQuery$Collection;", "copy", "(Lcom/medium/android/graphql/PublicationFollowersQuery$Collection;)Lcom/medium/android/graphql/PublicationFollowersQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PublicationFollowersQuery$Collection;", "getCollection", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Collection collection;

        public Data(Collection collection) {
            this.collection = collection;
        }

        public static Data copy$default(Data data, Collection collection, int i, Object obj) {
            if ((i & 1) != 0) {
                collection = data.collection;
            }
            data.getClass();
            return new Data(collection);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Collection getCollection() {
            return this.collection;
        }

        public final Data copy(Collection collection) {
            return new Data(collection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.collection, ((Data) other).collection);
        }

        public final Collection getCollection() {
            return this.collection;
        }

        public final int hashCode() {
            Collection collection = this.collection;
            if (collection == null) {
                return 0;
            }
            return collection.hashCode();
        }

        public final String toString() {
            return "Data(collection=" + this.collection + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\b0\u0007HÆ\u0003J/\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0017\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/PublicationFollowersQuery$FollowersUserConnection;", "", "__typename", "", "pagingInfo", "Lcom/medium/android/graphql/PublicationFollowersQuery$PagingInfo;", "users", "", "Lcom/medium/android/graphql/PublicationFollowersQuery$User;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationFollowersQuery$PagingInfo;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getPagingInfo", "()Lcom/medium/android/graphql/PublicationFollowersQuery$PagingInfo;", "getUsers", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class FollowersUserConnection {
        private final String __typename;
        private final PagingInfo pagingInfo;
        private final List<User> users;

        public FollowersUserConnection(String str, PagingInfo pagingInfo, List<User> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.pagingInfo = pagingInfo;
            this.users = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ FollowersUserConnection copy$default(FollowersUserConnection followersUserConnection, String str, PagingInfo pagingInfo, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = followersUserConnection.__typename;
            }
            if ((i & 2) != 0) {
                pagingInfo = followersUserConnection.pagingInfo;
            }
            if ((i & 4) != 0) {
                list = followersUserConnection.users;
            }
            return followersUserConnection.copy(str, pagingInfo, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PagingInfo getPagingInfo() {
            return this.pagingInfo;
        }

        public final List<User> component3() {
            return this.users;
        }

        public final FollowersUserConnection copy(String __typename, PagingInfo pagingInfo, List<User> users) {
            __typename.getClass();
            users.getClass();
            return new FollowersUserConnection(__typename, pagingInfo, users);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof FollowersUserConnection)) {
                return false;
            }
            FollowersUserConnection followersUserConnection = (FollowersUserConnection) other;
            return g76.L(this.__typename, followersUserConnection.__typename) && g76.L(this.pagingInfo, followersUserConnection.pagingInfo) && g76.L(this.users, followersUserConnection.users);
        }

        public final PagingInfo getPagingInfo() {
            return this.pagingInfo;
        }

        public final List<User> getUsers() {
            return this.users;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            PagingInfo pagingInfo = this.pagingInfo;
            return this.users.hashCode() + ((iHashCode + (pagingInfo == null ? 0 : pagingInfo.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            PagingInfo pagingInfo = this.pagingInfo;
            List<User> list = this.users;
            StringBuilder sb = new StringBuilder("FollowersUserConnection(__typename=");
            sb.append(str);
            sb.append(", pagingInfo=");
            sb.append(pagingInfo);
            sb.append(", users=");
            return b09.B(sb, list, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublicationFollowersQuery$Next;", "", "__typename", "", "pagingParamsData", "Lcom/medium/android/graphql/fragment/PagingParamsData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PagingParamsData;)V", "get__typename", "()Ljava/lang/String;", "getPagingParamsData", "()Lcom/medium/android/graphql/fragment/PagingParamsData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublicationFollowersQuery$PagingInfo;", "", "__typename", "", "next", "Lcom/medium/android/graphql/PublicationFollowersQuery$Next;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationFollowersQuery$Next;)V", "get__typename", "()Ljava/lang/String;", "getNext", "()Lcom/medium/android/graphql/PublicationFollowersQuery$Next;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/PublicationFollowersQuery$User;", "", "__typename", "", "id", "creatorPreviewData", "Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CreatorPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCreatorPreviewData", "()Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User {
        private final String __typename;
        private final CreatorPreviewData creatorPreviewData;
        private final String id;

        public User(String str, String str2, CreatorPreviewData creatorPreviewData) {
            str.getClass();
            str2.getClass();
            creatorPreviewData.getClass();
            this.__typename = str;
            this.id = str2;
            this.creatorPreviewData = creatorPreviewData;
        }

        public static /* synthetic */ User copy$default(User user, String str, String str2, CreatorPreviewData creatorPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user.__typename;
            }
            if ((i & 2) != 0) {
                str2 = user.id;
            }
            if ((i & 4) != 0) {
                creatorPreviewData = user.creatorPreviewData;
            }
            return user.copy(str, str2, creatorPreviewData);
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

        public final User copy(String __typename, String id, CreatorPreviewData creatorPreviewData) {
            __typename.getClass();
            id.getClass();
            creatorPreviewData.getClass();
            return new User(__typename, id, creatorPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User)) {
                return false;
            }
            User user = (User) other;
            return g76.L(this.__typename, user.__typename) && g76.L(this.id, user.id) && g76.L(this.creatorPreviewData, user.creatorPreviewData);
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
            StringBuilder sbU = y30.u("User(__typename=", str, ", id=", str2, ", creatorPreviewData=");
            sbU.append(creatorPreviewData);
            sbU.append(ZVsviyDAr.wbehX);
            return sbU.toString();
        }
    }

    public PublicationFollowersQuery(String str, zv8 zv8Var) {
        str.getClass();
        zv8Var.getClass();
        this.collectionId = str;
        this.pagingInfo = zv8Var;
    }

    public static /* synthetic */ PublicationFollowersQuery copy$default(PublicationFollowersQuery publicationFollowersQuery, String str, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publicationFollowersQuery.collectionId;
        }
        if ((i & 2) != 0) {
            zv8Var = publicationFollowersQuery.pagingInfo;
        }
        return publicationFollowersQuery.copy(str, zv8Var);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PublicationFollowersQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getCollectionId() {
        return this.collectionId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getPagingInfo() {
        return this.pagingInfo;
    }

    public final PublicationFollowersQuery copy(String collectionId, zv8 pagingInfo) {
        collectionId.getClass();
        pagingInfo.getClass();
        return new PublicationFollowersQuery(collectionId, pagingInfo);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PublicationFollowersQuery($collectionId: ID!, $pagingInfo: PagingOptions) { collection(id: $collectionId) { __typename followersUserConnection(paging: $pagingInfo) { __typename pagingInfo { __typename next { __typename ...PagingParamsData } } users { __typename ...CreatorPreviewData id } } id } }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublicationFollowersQuery)) {
            return false;
        }
        PublicationFollowersQuery publicationFollowersQuery = (PublicationFollowersQuery) other;
        return g76.L(this.collectionId, publicationFollowersQuery.collectionId) && g76.L(this.pagingInfo, publicationFollowersQuery.pagingInfo);
    }

    public final String getCollectionId() {
        return this.collectionId;
    }

    public final zv8 getPagingInfo() {
        return this.pagingInfo;
    }

    public final int hashCode() {
        return this.pagingInfo.hashCode() + (this.collectionId.hashCode() * 31);
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
        List<sx1> list = PublicationFollowersQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PublicationFollowersQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "PublicationFollowersQuery(collectionId=" + this.collectionId + ", pagingInfo=" + this.pagingInfo + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PublicationFollowersQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PublicationFollowersQuery($collectionId: ID!, $pagingInfo: PagingOptions) { collection(id: $collectionId) { __typename followersUserConnection(paging: $pagingInfo) { __typename pagingInfo { __typename next { __typename ...PagingParamsData } } users { __typename ...CreatorPreviewData id } } id } }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ PublicationFollowersQuery(String str, zv8 zv8Var, int i, gy2 gy2Var) {
        this(str, (i & 2) != 0 ? xv8.a : zv8Var);
    }
}
