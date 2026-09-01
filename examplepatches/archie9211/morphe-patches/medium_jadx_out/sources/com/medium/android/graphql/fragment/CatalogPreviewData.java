package com.medium.android.graphql.fragment;

import com.squareup.wire.sjIw.ezwlgQm;
import defpackage.b09;
import defpackage.g15;
import defpackage.g76;
import defpackage.ho2;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0010\b\u0086\b\u0018\u00002\u00020\u0001:\u0006$%&'()B'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\fJ\u0010\u0010\u000e\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J8\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0014\u0010\fJ\u0010\u0010\u0016\u001a\u00020\u0015HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001b\u001a\u00020\u001a2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018HÖ\u0003¢\u0006\u0004\b\u001b\u0010\u001cR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001d\u001a\u0004\b\u001e\u0010\fR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001d\u001a\u0004\b\u001f\u0010\fR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010 \u001a\u0004\b!\u0010\u000fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010\"\u001a\u0004\b#\u0010\u0011¨\u0006*"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogPreviewData;", "Lg15;", "", "__typename", "id", "Lcom/medium/android/graphql/fragment/CatalogPreviewData$ItemsConnection;", "itemsConnection", "Lcom/medium/android/graphql/fragment/CatalogSummaryData;", "catalogSummaryData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogPreviewData$ItemsConnection;Lcom/medium/android/graphql/fragment/CatalogSummaryData;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Lcom/medium/android/graphql/fragment/CatalogPreviewData$ItemsConnection;", "component4", "()Lcom/medium/android/graphql/fragment/CatalogSummaryData;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogPreviewData$ItemsConnection;Lcom/medium/android/graphql/fragment/CatalogSummaryData;)Lcom/medium/android/graphql/fragment/CatalogPreviewData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "Lcom/medium/android/graphql/fragment/CatalogPreviewData$ItemsConnection;", "getItemsConnection", "Lcom/medium/android/graphql/fragment/CatalogSummaryData;", "getCatalogSummaryData", "ItemsConnection", "Item", "Entity", "OnPost", "PreviewImage", "Paging", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogPreviewData implements g15 {
    private final String __typename;
    private final CatalogSummaryData catalogSummaryData;
    private final String id;
    private final ItemsConnection itemsConnection;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogPreviewData$Entity;", "", "__typename", "", "onPost", "Lcom/medium/android/graphql/fragment/CatalogPreviewData$OnPost;", "catalogItemUserData", "Lcom/medium/android/graphql/fragment/CatalogItemUserData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogPreviewData$OnPost;Lcom/medium/android/graphql/fragment/CatalogItemUserData;)V", "get__typename", "()Ljava/lang/String;", "getOnPost", "()Lcom/medium/android/graphql/fragment/CatalogPreviewData$OnPost;", "getCatalogItemUserData", "()Lcom/medium/android/graphql/fragment/CatalogItemUserData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Entity {
        private final String __typename;
        private final CatalogItemUserData catalogItemUserData;
        private final OnPost onPost;

        public Entity(String str, OnPost onPost, CatalogItemUserData catalogItemUserData) {
            str.getClass();
            this.__typename = str;
            this.onPost = onPost;
            this.catalogItemUserData = catalogItemUserData;
        }

        public static /* synthetic */ Entity copy$default(Entity entity, String str, OnPost onPost, CatalogItemUserData catalogItemUserData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = entity.__typename;
            }
            if ((i & 2) != 0) {
                onPost = entity.onPost;
            }
            if ((i & 4) != 0) {
                catalogItemUserData = entity.catalogItemUserData;
            }
            return entity.copy(str, onPost, catalogItemUserData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPost getOnPost() {
            return this.onPost;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final CatalogItemUserData getCatalogItemUserData() {
            return this.catalogItemUserData;
        }

        public final Entity copy(String __typename, OnPost onPost, CatalogItemUserData catalogItemUserData) {
            __typename.getClass();
            return new Entity(__typename, onPost, catalogItemUserData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Entity)) {
                return false;
            }
            Entity entity = (Entity) other;
            return g76.L(this.__typename, entity.__typename) && g76.L(this.onPost, entity.onPost) && g76.L(this.catalogItemUserData, entity.catalogItemUserData);
        }

        public final CatalogItemUserData getCatalogItemUserData() {
            return this.catalogItemUserData;
        }

        public final OnPost getOnPost() {
            return this.onPost;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPost onPost = this.onPost;
            int iHashCode2 = (iHashCode + (onPost == null ? 0 : onPost.hashCode())) * 31;
            CatalogItemUserData catalogItemUserData = this.catalogItemUserData;
            return iHashCode2 + (catalogItemUserData != null ? catalogItemUserData.hashCode() : 0);
        }

        public final String toString() {
            return "Entity(__typename=" + this.__typename + ", onPost=" + this.onPost + ", catalogItemUserData=" + this.catalogItemUserData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0006HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogPreviewData$Item;", "", "__typename", "", "catalogItemId", "entity", "Lcom/medium/android/graphql/fragment/CatalogPreviewData$Entity;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogPreviewData$Entity;)V", "get__typename", "()Ljava/lang/String;", "getCatalogItemId", "getEntity", "()Lcom/medium/android/graphql/fragment/CatalogPreviewData$Entity;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Item {
        private final String __typename;
        private final String catalogItemId;
        private final Entity entity;

        public Item(String str, String str2, Entity entity) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.catalogItemId = str2;
            this.entity = entity;
        }

        public static /* synthetic */ Item copy$default(Item item, String str, String str2, Entity entity, int i, Object obj) {
            if ((i & 1) != 0) {
                str = item.__typename;
            }
            if ((i & 2) != 0) {
                str2 = item.catalogItemId;
            }
            if ((i & 4) != 0) {
                entity = item.entity;
            }
            return item.copy(str, str2, entity);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getCatalogItemId() {
            return this.catalogItemId;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Entity getEntity() {
            return this.entity;
        }

        public final Item copy(String __typename, String catalogItemId, Entity entity) {
            __typename.getClass();
            catalogItemId.getClass();
            return new Item(__typename, catalogItemId, entity);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Item)) {
                return false;
            }
            Item item = (Item) other;
            return g76.L(this.__typename, item.__typename) && g76.L(this.catalogItemId, item.catalogItemId) && g76.L(this.entity, item.entity);
        }

        public final String getCatalogItemId() {
            return this.catalogItemId;
        }

        public final Entity getEntity() {
            return this.entity;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.catalogItemId);
            Entity entity = this.entity;
            return iO + (entity == null ? 0 : entity.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.catalogItemId;
            Entity entity = this.entity;
            StringBuilder sbU = y30.u("Item(__typename=", str, ", catalogItemId=", str2, ", entity=");
            sbU.append(entity);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\t\u0010\u0013\u001a\u00020\bHÆ\u0003J-\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogPreviewData$ItemsConnection;", "", "__typename", "", "items", "", "Lcom/medium/android/graphql/fragment/CatalogPreviewData$Item;", "paging", "Lcom/medium/android/graphql/fragment/CatalogPreviewData$Paging;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/fragment/CatalogPreviewData$Paging;)V", "get__typename", "()Ljava/lang/String;", "getItems", "()Ljava/util/List;", "getPaging", "()Lcom/medium/android/graphql/fragment/CatalogPreviewData$Paging;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ItemsConnection {
        private final String __typename;
        private final List<Item> items;
        private final Paging paging;

        public ItemsConnection(String str, List<Item> list, Paging paging) {
            str.getClass();
            list.getClass();
            paging.getClass();
            this.__typename = str;
            this.items = list;
            this.paging = paging;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ ItemsConnection copy$default(ItemsConnection itemsConnection, String str, List list, Paging paging, int i, Object obj) {
            if ((i & 1) != 0) {
                str = itemsConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = itemsConnection.items;
            }
            if ((i & 4) != 0) {
                paging = itemsConnection.paging;
            }
            return itemsConnection.copy(str, list, paging);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Item> component2() {
            return this.items;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Paging getPaging() {
            return this.paging;
        }

        public final ItemsConnection copy(String __typename, List<Item> items, Paging paging) {
            __typename.getClass();
            items.getClass();
            paging.getClass();
            return new ItemsConnection(__typename, items, paging);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ItemsConnection)) {
                return false;
            }
            ItemsConnection itemsConnection = (ItemsConnection) other;
            return g76.L(this.__typename, itemsConnection.__typename) && g76.L(this.items, itemsConnection.items) && g76.L(this.paging, itemsConnection.paging);
        }

        public final List<Item> getItems() {
            return this.items;
        }

        public final Paging getPaging() {
            return this.paging;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.paging.hashCode() + wgd.p(this.__typename.hashCode() * 31, 31, this.items);
        }

        public final String toString() {
            String str = this.__typename;
            List<Item> list = this.items;
            Paging paging = this.paging;
            StringBuilder sbE = b09.E("ItemsConnection(__typename=", str, ", items=", ezwlgQm.NeLrbKnI, list);
            sbE.append(paging);
            sbE.append(")");
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogPreviewData$OnPost;", "", "id", "", "previewImage", "Lcom/medium/android/graphql/fragment/CatalogPreviewData$PreviewImage;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogPreviewData$PreviewImage;)V", "getId", "()Ljava/lang/String;", "getPreviewImage", "()Lcom/medium/android/graphql/fragment/CatalogPreviewData$PreviewImage;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPost {
        private final String id;
        private final PreviewImage previewImage;

        public OnPost(String str, PreviewImage previewImage) {
            str.getClass();
            this.id = str;
            this.previewImage = previewImage;
        }

        public static /* synthetic */ OnPost copy$default(OnPost onPost, String str, PreviewImage previewImage, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onPost.id;
            }
            if ((i & 2) != 0) {
                previewImage = onPost.previewImage;
            }
            return onPost.copy(str, previewImage);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PreviewImage getPreviewImage() {
            return this.previewImage;
        }

        public final OnPost copy(String id, PreviewImage previewImage) {
            id.getClass();
            return new OnPost(id, previewImage);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnPost)) {
                return false;
            }
            OnPost onPost = (OnPost) other;
            return g76.L(this.id, onPost.id) && g76.L(this.previewImage, onPost.previewImage);
        }

        public final String getId() {
            return this.id;
        }

        public final PreviewImage getPreviewImage() {
            return this.previewImage;
        }

        public final int hashCode() {
            int iHashCode = this.id.hashCode() * 31;
            PreviewImage previewImage = this.previewImage;
            return iHashCode + (previewImage == null ? 0 : previewImage.hashCode());
        }

        public final String toString() {
            return "OnPost(id=" + this.id + ", previewImage=" + this.previewImage + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0014"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogPreviewData$Paging;", "", "__typename", "", "count", "", "<init>", "(Ljava/lang/String;I)V", "get__typename", "()Ljava/lang/String;", "getCount", "()I", "component1", "component2", "copy", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Paging {
        private final String __typename;
        private final int count;

        public Paging(String str, int i) {
            str.getClass();
            this.__typename = str;
            this.count = i;
        }

        public static /* synthetic */ Paging copy$default(Paging paging, String str, int i, int i2, Object obj) {
            if ((i2 & 1) != 0) {
                str = paging.__typename;
            }
            if ((i2 & 2) != 0) {
                i = paging.count;
            }
            return paging.copy(str, i);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final int getCount() {
            return this.count;
        }

        public final Paging copy(String __typename, int count) {
            __typename.getClass();
            return new Paging(__typename, count);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Paging)) {
                return false;
            }
            Paging paging = (Paging) other;
            return g76.L(this.__typename, paging.__typename) && this.count == paging.count;
        }

        public final int getCount() {
            return this.count;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return (this.__typename.hashCode() * 31) + this.count;
        }

        public final String toString() {
            return ho2.C(this.count, "Paging(__typename=", this.__typename, ", count=", ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogPreviewData$PreviewImage;", "", "__typename", "", "id", "imageMetadataData", "Lcom/medium/android/graphql/fragment/ImageMetadataData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ImageMetadataData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageMetadataData", "()Lcom/medium/android/graphql/fragment/ImageMetadataData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PreviewImage {
        private final String __typename;
        private final String id;
        private final ImageMetadataData imageMetadataData;

        public PreviewImage(String str, String str2, ImageMetadataData imageMetadataData) {
            str.getClass();
            str2.getClass();
            imageMetadataData.getClass();
            this.__typename = str;
            this.id = str2;
            this.imageMetadataData = imageMetadataData;
        }

        public static /* synthetic */ PreviewImage copy$default(PreviewImage previewImage, String str, String str2, ImageMetadataData imageMetadataData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = previewImage.__typename;
            }
            if ((i & 2) != 0) {
                str2 = previewImage.id;
            }
            if ((i & 4) != 0) {
                imageMetadataData = previewImage.imageMetadataData;
            }
            return previewImage.copy(str, str2, imageMetadataData);
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
        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final PreviewImage copy(String __typename, String id, ImageMetadataData imageMetadataData) {
            __typename.getClass();
            id.getClass();
            imageMetadataData.getClass();
            return new PreviewImage(__typename, id, imageMetadataData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PreviewImage)) {
                return false;
            }
            PreviewImage previewImage = (PreviewImage) other;
            return g76.L(this.__typename, previewImage.__typename) && g76.L(this.id, previewImage.id) && g76.L(this.imageMetadataData, previewImage.imageMetadataData);
        }

        public final String getId() {
            return this.id;
        }

        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.imageMetadataData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            ImageMetadataData imageMetadataData = this.imageMetadataData;
            StringBuilder sbU = y30.u("PreviewImage(__typename=", str, ", id=", str2, ", imageMetadataData=");
            sbU.append(imageMetadataData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public CatalogPreviewData(String str, String str2, ItemsConnection itemsConnection, CatalogSummaryData catalogSummaryData) {
        str.getClass();
        str2.getClass();
        itemsConnection.getClass();
        catalogSummaryData.getClass();
        this.__typename = str;
        this.id = str2;
        this.itemsConnection = itemsConnection;
        this.catalogSummaryData = catalogSummaryData;
    }

    public static /* synthetic */ CatalogPreviewData copy$default(CatalogPreviewData catalogPreviewData, String str, String str2, ItemsConnection itemsConnection, CatalogSummaryData catalogSummaryData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = catalogPreviewData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = catalogPreviewData.id;
        }
        if ((i & 4) != 0) {
            itemsConnection = catalogPreviewData.itemsConnection;
        }
        if ((i & 8) != 0) {
            catalogSummaryData = catalogPreviewData.catalogSummaryData;
        }
        return catalogPreviewData.copy(str, str2, itemsConnection, catalogSummaryData);
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
    public final ItemsConnection getItemsConnection() {
        return this.itemsConnection;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final CatalogSummaryData getCatalogSummaryData() {
        return this.catalogSummaryData;
    }

    public final CatalogPreviewData copy(String __typename, String id, ItemsConnection itemsConnection, CatalogSummaryData catalogSummaryData) {
        __typename.getClass();
        id.getClass();
        itemsConnection.getClass();
        catalogSummaryData.getClass();
        return new CatalogPreviewData(__typename, id, itemsConnection, catalogSummaryData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogPreviewData)) {
            return false;
        }
        CatalogPreviewData catalogPreviewData = (CatalogPreviewData) other;
        return g76.L(this.__typename, catalogPreviewData.__typename) && g76.L(this.id, catalogPreviewData.id) && g76.L(this.itemsConnection, catalogPreviewData.itemsConnection) && g76.L(this.catalogSummaryData, catalogPreviewData.catalogSummaryData);
    }

    public final CatalogSummaryData getCatalogSummaryData() {
        return this.catalogSummaryData;
    }

    public final String getId() {
        return this.id;
    }

    public final ItemsConnection getItemsConnection() {
        return this.itemsConnection;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return this.catalogSummaryData.hashCode() + ((this.itemsConnection.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        ItemsConnection itemsConnection = this.itemsConnection;
        CatalogSummaryData catalogSummaryData = this.catalogSummaryData;
        StringBuilder sbU = y30.u("CatalogPreviewData(__typename=", str, ", id=", str2, ", itemsConnection=");
        sbU.append(itemsConnection);
        sbU.append(", catalogSummaryData=");
        sbU.append(catalogSummaryData);
        sbU.append(")");
        return sbU.toString();
    }
}
