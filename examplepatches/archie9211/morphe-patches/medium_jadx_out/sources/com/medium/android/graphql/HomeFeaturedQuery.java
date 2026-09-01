package com.medium.android.graphql;

import com.medium.android.graphql.adapter.HomeFeaturedQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.HomeFeaturedQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.HomeFeedItemData;
import com.medium.android.graphql.fragment.PagingParamsData;
import com.medium.android.graphql.selections.HomeFeaturedQuerySelections;
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
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u0000\n\u0002\b\u000e\b\u0086\b\u0018\u0000 +2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0006,-./0+B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001e\u0010\nJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010\"\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\"\u0010\u001dJ\u001a\u0010%\u001a\u00020\u00112\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001dR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010)\u001a\u0004\b*\u0010\n¨\u00061"}, d2 = {"Lcom/medium/android/graphql/HomeFeaturedQuery;", "Luqa;", "Lcom/medium/android/graphql/HomeFeaturedQuery$Data;", "", "first", "", "after", "<init>", "(ILjava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()I", "component2", "copy", "(ILjava/lang/String;)Lcom/medium/android/graphql/HomeFeaturedQuery;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "I", "getFirst", "Ljava/lang/String;", "getAfter", "Companion", "Data", "FollowedPublicationsFeaturedPostsConnection", "Item", "PagingInfo", "Next", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class HomeFeaturedQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "fa80b0b52d60f696ae6f1de0d1d20a007d42081b5c9a3167f082e84553d67d36";
    public static final String OPERATION_NAME = "HomeFeaturedQuery";
    private final String after;
    private final int first;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/HomeFeaturedQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/HomeFeaturedQuery$FollowedPublicationsFeaturedPostsConnection;", "followedPublicationsFeaturedPostsConnection", "<init>", "(Lcom/medium/android/graphql/HomeFeaturedQuery$FollowedPublicationsFeaturedPostsConnection;)V", "component1", "()Lcom/medium/android/graphql/HomeFeaturedQuery$FollowedPublicationsFeaturedPostsConnection;", "copy", "(Lcom/medium/android/graphql/HomeFeaturedQuery$FollowedPublicationsFeaturedPostsConnection;)Lcom/medium/android/graphql/HomeFeaturedQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/HomeFeaturedQuery$FollowedPublicationsFeaturedPostsConnection;", "getFollowedPublicationsFeaturedPostsConnection", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final FollowedPublicationsFeaturedPostsConnection followedPublicationsFeaturedPostsConnection;

        public Data(FollowedPublicationsFeaturedPostsConnection followedPublicationsFeaturedPostsConnection) {
            followedPublicationsFeaturedPostsConnection.getClass();
            this.followedPublicationsFeaturedPostsConnection = followedPublicationsFeaturedPostsConnection;
        }

        public static /* synthetic */ Data copy$default(Data data, FollowedPublicationsFeaturedPostsConnection followedPublicationsFeaturedPostsConnection, int i, Object obj) {
            if ((i & 1) != 0) {
                followedPublicationsFeaturedPostsConnection = data.followedPublicationsFeaturedPostsConnection;
            }
            return data.copy(followedPublicationsFeaturedPostsConnection);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final FollowedPublicationsFeaturedPostsConnection getFollowedPublicationsFeaturedPostsConnection() {
            return this.followedPublicationsFeaturedPostsConnection;
        }

        public final Data copy(FollowedPublicationsFeaturedPostsConnection followedPublicationsFeaturedPostsConnection) {
            followedPublicationsFeaturedPostsConnection.getClass();
            return new Data(followedPublicationsFeaturedPostsConnection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.followedPublicationsFeaturedPostsConnection, ((Data) other).followedPublicationsFeaturedPostsConnection);
        }

        public final FollowedPublicationsFeaturedPostsConnection getFollowedPublicationsFeaturedPostsConnection() {
            return this.followedPublicationsFeaturedPostsConnection;
        }

        public final int hashCode() {
            return this.followedPublicationsFeaturedPostsConnection.hashCode();
        }

        public final String toString() {
            return "Data(followedPublicationsFeaturedPostsConnection=" + this.followedPublicationsFeaturedPostsConnection + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\bHÆ\u0003J1\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0019\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/HomeFeaturedQuery$FollowedPublicationsFeaturedPostsConnection;", "", "__typename", "", "items", "", "Lcom/medium/android/graphql/HomeFeaturedQuery$Item;", "pagingInfo", "Lcom/medium/android/graphql/HomeFeaturedQuery$PagingInfo;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/HomeFeaturedQuery$PagingInfo;)V", "get__typename", "()Ljava/lang/String;", "getItems", "()Ljava/util/List;", "getPagingInfo", "()Lcom/medium/android/graphql/HomeFeaturedQuery$PagingInfo;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class FollowedPublicationsFeaturedPostsConnection {
        private final String __typename;
        private final List<Item> items;
        private final PagingInfo pagingInfo;

        public FollowedPublicationsFeaturedPostsConnection(String str, List<Item> list, PagingInfo pagingInfo) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.items = list;
            this.pagingInfo = pagingInfo;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ FollowedPublicationsFeaturedPostsConnection copy$default(FollowedPublicationsFeaturedPostsConnection followedPublicationsFeaturedPostsConnection, String str, List list, PagingInfo pagingInfo, int i, Object obj) {
            if ((i & 1) != 0) {
                str = followedPublicationsFeaturedPostsConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = followedPublicationsFeaturedPostsConnection.items;
            }
            if ((i & 4) != 0) {
                pagingInfo = followedPublicationsFeaturedPostsConnection.pagingInfo;
            }
            return followedPublicationsFeaturedPostsConnection.copy(str, list, pagingInfo);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Item> component2() {
            return this.items;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PagingInfo getPagingInfo() {
            return this.pagingInfo;
        }

        public final FollowedPublicationsFeaturedPostsConnection copy(String __typename, List<Item> items, PagingInfo pagingInfo) {
            __typename.getClass();
            items.getClass();
            return new FollowedPublicationsFeaturedPostsConnection(__typename, items, pagingInfo);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof FollowedPublicationsFeaturedPostsConnection)) {
                return false;
            }
            FollowedPublicationsFeaturedPostsConnection followedPublicationsFeaturedPostsConnection = (FollowedPublicationsFeaturedPostsConnection) other;
            return g76.L(this.__typename, followedPublicationsFeaturedPostsConnection.__typename) && g76.L(this.items, followedPublicationsFeaturedPostsConnection.items) && g76.L(this.pagingInfo, followedPublicationsFeaturedPostsConnection.pagingInfo);
        }

        public final List<Item> getItems() {
            return this.items;
        }

        public final PagingInfo getPagingInfo() {
            return this.pagingInfo;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iP = wgd.p(this.__typename.hashCode() * 31, 31, this.items);
            PagingInfo pagingInfo = this.pagingInfo;
            return iP + (pagingInfo == null ? 0 : pagingInfo.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            List<Item> list = this.items;
            PagingInfo pagingInfo = this.pagingInfo;
            StringBuilder sbE = b09.E("FollowedPublicationsFeaturedPostsConnection(__typename=", str, ", items=", ", pagingInfo=", list);
            sbE.append(pagingInfo);
            sbE.append(")");
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/HomeFeaturedQuery$Item;", "", "__typename", "", "homeFeedItemData", "Lcom/medium/android/graphql/fragment/HomeFeedItemData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/HomeFeedItemData;)V", "get__typename", "()Ljava/lang/String;", "getHomeFeedItemData", "()Lcom/medium/android/graphql/fragment/HomeFeedItemData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Item {
        private final String __typename;
        private final HomeFeedItemData homeFeedItemData;

        public Item(String str, HomeFeedItemData homeFeedItemData) {
            str.getClass();
            homeFeedItemData.getClass();
            this.__typename = str;
            this.homeFeedItemData = homeFeedItemData;
        }

        public static /* synthetic */ Item copy$default(Item item, String str, HomeFeedItemData homeFeedItemData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = item.__typename;
            }
            if ((i & 2) != 0) {
                homeFeedItemData = item.homeFeedItemData;
            }
            return item.copy(str, homeFeedItemData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final HomeFeedItemData getHomeFeedItemData() {
            return this.homeFeedItemData;
        }

        public final Item copy(String __typename, HomeFeedItemData homeFeedItemData) {
            __typename.getClass();
            homeFeedItemData.getClass();
            return new Item(__typename, homeFeedItemData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Item)) {
                return false;
            }
            Item item = (Item) other;
            return g76.L(this.__typename, item.__typename) && g76.L(this.homeFeedItemData, item.homeFeedItemData);
        }

        public final HomeFeedItemData getHomeFeedItemData() {
            return this.homeFeedItemData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.homeFeedItemData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Item(__typename=" + this.__typename + ", homeFeedItemData=" + this.homeFeedItemData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/HomeFeaturedQuery$Next;", "", "__typename", "", "pagingParamsData", "Lcom/medium/android/graphql/fragment/PagingParamsData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PagingParamsData;)V", "get__typename", "()Ljava/lang/String;", "getPagingParamsData", "()Lcom/medium/android/graphql/fragment/PagingParamsData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/HomeFeaturedQuery$PagingInfo;", "", "__typename", "", "next", "Lcom/medium/android/graphql/HomeFeaturedQuery$Next;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/HomeFeaturedQuery$Next;)V", "get__typename", "()Ljava/lang/String;", "getNext", "()Lcom/medium/android/graphql/HomeFeaturedQuery$Next;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public HomeFeaturedQuery(int i, String str) {
        str.getClass();
        this.first = i;
        this.after = str;
    }

    public static /* synthetic */ HomeFeaturedQuery copy$default(HomeFeaturedQuery homeFeaturedQuery, int i, String str, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = homeFeaturedQuery.first;
        }
        if ((i2 & 2) != 0) {
            str = homeFeaturedQuery.after;
        }
        return homeFeaturedQuery.copy(i, str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(HomeFeaturedQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final int getFirst() {
        return this.first;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getAfter() {
        return this.after;
    }

    public final HomeFeaturedQuery copy(int first, String after) {
        after.getClass();
        return new HomeFeaturedQuery(first, after);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query HomeFeaturedQuery($first: Int!, $after: String!) { followedPublicationsFeaturedPostsConnection(first: $first, after: $after) { __typename items { __typename ...HomeFeedItemData } pagingInfo { __typename next { __typename ...PagingParamsData } } } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment TagData on Tag { __typename id normalizedTagSlug displayTitle followerCount postCount viewerEdge { __typename id isFollowing } }  fragment HomeFeedItemData on HomeFeedItem { __typename post { __typename ...PostPreviewData id } reason postProviderExplanation { __typename reason tagObject { __typename ...TagData normalizedTagSlug } interactedUsers { __typename id name username imageId viewerEdge { __typename isUser id } } } feedId moduleSourceEncoding feedRepost { __typename repostedAt note } }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof HomeFeaturedQuery)) {
            return false;
        }
        HomeFeaturedQuery homeFeaturedQuery = (HomeFeaturedQuery) other;
        return this.first == homeFeaturedQuery.first && g76.L(this.after, homeFeaturedQuery.after);
    }

    public final String getAfter() {
        return this.after;
    }

    public final int getFirst() {
        return this.first;
    }

    public final int hashCode() {
        return this.after.hashCode() + (this.first * 31);
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
        List<sx1> list = HomeFeaturedQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        HomeFeaturedQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "HomeFeaturedQuery(first=" + this.first + ", after=" + this.after + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/HomeFeaturedQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query HomeFeaturedQuery($first: Int!, $after: String!) { followedPublicationsFeaturedPostsConnection(first: $first, after: $after) { __typename items { __typename ...HomeFeedItemData } pagingInfo { __typename next { __typename ...PagingParamsData } } } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment TagData on Tag { __typename id normalizedTagSlug displayTitle followerCount postCount viewerEdge { __typename id isFollowing } }  fragment HomeFeedItemData on HomeFeedItem { __typename post { __typename ...PostPreviewData id } reason postProviderExplanation { __typename reason tagObject { __typename ...TagData normalizedTagSlug } interactedUsers { __typename id name username imageId viewerEdge { __typename isUser id } } } feedId moduleSourceEncoding feedRepost { __typename repostedAt note } }  fragment PagingParamsData on PageParams { __typename from ignoredIds limit order page since source to }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
