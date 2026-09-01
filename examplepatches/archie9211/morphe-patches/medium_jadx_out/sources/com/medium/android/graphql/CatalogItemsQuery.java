package com.medium.android.graphql;

import com.medium.android.graphql.adapter.CatalogItemsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.CatalogItemsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CatalogItemData;
import com.medium.android.graphql.fragment.CatalogPagingResultData;
import com.medium.android.graphql.selections.CatalogItemsQuerySelections;
import com.medium.android.graphql.type.CatalogPagingOptionsInput;
import com.medium.android.graphql.type.Query;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
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
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000f\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0007./0123-B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\nJ\u0010\u0010\u001d\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u001e¨\u00064"}, d2 = {"Lcom/medium/android/graphql/CatalogItemsQuery;", "Luqa;", "Lcom/medium/android/graphql/CatalogItemsQuery$Data;", "", "catalogId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "pagingOptions", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)Lcom/medium/android/graphql/CatalogItemsQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCatalogId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "getPagingOptions", "Companion", "Data", "CatalogById", "OnCatalog", "ItemsConnection", "Item", "Paging", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogItemsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "63f92ecb8c7813c4db24a6b7fd1c6f36ab5c8d131d54a77f6bf4d01babd9a420";
    public static final String OPERATION_NAME = "CatalogItems";
    private final String catalogId;
    private final CatalogPagingOptionsInput pagingOptions;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/CatalogItemsQuery$CatalogById;", "", "__typename", "", "onCatalog", "Lcom/medium/android/graphql/CatalogItemsQuery$OnCatalog;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/CatalogItemsQuery$OnCatalog;)V", "get__typename", "()Ljava/lang/String;", "getOnCatalog", "()Lcom/medium/android/graphql/CatalogItemsQuery$OnCatalog;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CatalogById {
        private final String __typename;
        private final OnCatalog onCatalog;

        public CatalogById(String str, OnCatalog onCatalog) {
            str.getClass();
            this.__typename = str;
            this.onCatalog = onCatalog;
        }

        public static /* synthetic */ CatalogById copy$default(CatalogById catalogById, String str, OnCatalog onCatalog, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalogById.__typename;
            }
            if ((i & 2) != 0) {
                onCatalog = catalogById.onCatalog;
            }
            return catalogById.copy(str, onCatalog);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnCatalog getOnCatalog() {
            return this.onCatalog;
        }

        public final CatalogById copy(String __typename, OnCatalog onCatalog) {
            __typename.getClass();
            return new CatalogById(__typename, onCatalog);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CatalogById)) {
                return false;
            }
            CatalogById catalogById = (CatalogById) other;
            return g76.L(this.__typename, catalogById.__typename) && g76.L(this.onCatalog, catalogById.onCatalog);
        }

        public final OnCatalog getOnCatalog() {
            return this.onCatalog;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnCatalog onCatalog = this.onCatalog;
            return iHashCode + (onCatalog == null ? 0 : onCatalog.hashCode());
        }

        public final String toString() {
            return "CatalogById(__typename=" + this.__typename + ", onCatalog=" + this.onCatalog + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/CatalogItemsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/CatalogItemsQuery$CatalogById;", "catalogById", "<init>", "(Lcom/medium/android/graphql/CatalogItemsQuery$CatalogById;)V", "component1", "()Lcom/medium/android/graphql/CatalogItemsQuery$CatalogById;", "copy", "(Lcom/medium/android/graphql/CatalogItemsQuery$CatalogById;)Lcom/medium/android/graphql/CatalogItemsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/CatalogItemsQuery$CatalogById;", "getCatalogById", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final CatalogById catalogById;

        public Data(CatalogById catalogById) {
            catalogById.getClass();
            this.catalogById = catalogById;
        }

        public static /* synthetic */ Data copy$default(Data data, CatalogById catalogById, int i, Object obj) {
            if ((i & 1) != 0) {
                catalogById = data.catalogById;
            }
            return data.copy(catalogById);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final CatalogById getCatalogById() {
            return this.catalogById;
        }

        public final Data copy(CatalogById catalogById) {
            catalogById.getClass();
            return new Data(catalogById);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.catalogById, ((Data) other).catalogById);
        }

        public final CatalogById getCatalogById() {
            return this.catalogById;
        }

        public final int hashCode() {
            return this.catalogById.hashCode();
        }

        public final String toString() {
            return "Data(catalogById=" + this.catalogById + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/CatalogItemsQuery$Item;", "", "__typename", "", "catalogItemId", "catalogItemData", "Lcom/medium/android/graphql/fragment/CatalogItemData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogItemData;)V", "get__typename", "()Ljava/lang/String;", "getCatalogItemId", "getCatalogItemData", "()Lcom/medium/android/graphql/fragment/CatalogItemData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Item {
        private final String __typename;
        private final CatalogItemData catalogItemData;
        private final String catalogItemId;

        public Item(String str, String str2, CatalogItemData catalogItemData) {
            str.getClass();
            str2.getClass();
            catalogItemData.getClass();
            this.__typename = str;
            this.catalogItemId = str2;
            this.catalogItemData = catalogItemData;
        }

        public static /* synthetic */ Item copy$default(Item item, String str, String str2, CatalogItemData catalogItemData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = item.__typename;
            }
            if ((i & 2) != 0) {
                str2 = item.catalogItemId;
            }
            if ((i & 4) != 0) {
                catalogItemData = item.catalogItemData;
            }
            return item.copy(str, str2, catalogItemData);
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
        public final CatalogItemData getCatalogItemData() {
            return this.catalogItemData;
        }

        public final Item copy(String __typename, String catalogItemId, CatalogItemData catalogItemData) {
            __typename.getClass();
            catalogItemId.getClass();
            catalogItemData.getClass();
            return new Item(__typename, catalogItemId, catalogItemData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Item)) {
                return false;
            }
            Item item = (Item) other;
            return g76.L(this.__typename, item.__typename) && g76.L(this.catalogItemId, item.catalogItemId) && g76.L(this.catalogItemData, item.catalogItemData);
        }

        public final CatalogItemData getCatalogItemData() {
            return this.catalogItemData;
        }

        public final String getCatalogItemId() {
            return this.catalogItemId;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.catalogItemData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.catalogItemId);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.catalogItemId;
            CatalogItemData catalogItemData = this.catalogItemData;
            StringBuilder sbU = y30.u("Item(__typename=", str, ", catalogItemId=", str2, ", catalogItemData=");
            sbU.append(catalogItemData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\t\u0010\u0013\u001a\u00020\bHÆ\u0003J-\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/CatalogItemsQuery$ItemsConnection;", "", "__typename", "", "items", "", "Lcom/medium/android/graphql/CatalogItemsQuery$Item;", "paging", "Lcom/medium/android/graphql/CatalogItemsQuery$Paging;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/CatalogItemsQuery$Paging;)V", "get__typename", "()Ljava/lang/String;", "getItems", "()Ljava/util/List;", "getPaging", "()Lcom/medium/android/graphql/CatalogItemsQuery$Paging;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
            StringBuilder sbE = b09.E("ItemsConnection(__typename=", str, ", items=", ", paging=", list);
            sbE.append(paging);
            sbE.append(")");
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/CatalogItemsQuery$OnCatalog;", "", "itemsConnection", "Lcom/medium/android/graphql/CatalogItemsQuery$ItemsConnection;", "id", "", "<init>", "(Lcom/medium/android/graphql/CatalogItemsQuery$ItemsConnection;Ljava/lang/String;)V", "getItemsConnection", "()Lcom/medium/android/graphql/CatalogItemsQuery$ItemsConnection;", "getId", "()Ljava/lang/String;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnCatalog {
        private final String id;
        private final ItemsConnection itemsConnection;

        public OnCatalog(ItemsConnection itemsConnection, String str) {
            itemsConnection.getClass();
            str.getClass();
            this.itemsConnection = itemsConnection;
            this.id = str;
        }

        public static /* synthetic */ OnCatalog copy$default(OnCatalog onCatalog, ItemsConnection itemsConnection, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                itemsConnection = onCatalog.itemsConnection;
            }
            if ((i & 2) != 0) {
                str = onCatalog.id;
            }
            return onCatalog.copy(itemsConnection, str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final ItemsConnection getItemsConnection() {
            return this.itemsConnection;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final OnCatalog copy(ItemsConnection itemsConnection, String id) {
            itemsConnection.getClass();
            id.getClass();
            return new OnCatalog(itemsConnection, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnCatalog)) {
                return false;
            }
            OnCatalog onCatalog = (OnCatalog) other;
            return g76.L(this.itemsConnection, onCatalog.itemsConnection) && g76.L(this.id, onCatalog.id);
        }

        public final String getId() {
            return this.id;
        }

        public final ItemsConnection getItemsConnection() {
            return this.itemsConnection;
        }

        public final int hashCode() {
            return this.id.hashCode() + (this.itemsConnection.hashCode() * 31);
        }

        public final String toString() {
            return "OnCatalog(itemsConnection=" + this.itemsConnection + ", id=" + this.id + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/CatalogItemsQuery$Paging;", "", "__typename", "", "catalogPagingResultData", "Lcom/medium/android/graphql/fragment/CatalogPagingResultData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogPagingResultData;)V", "get__typename", "()Ljava/lang/String;", "getCatalogPagingResultData", "()Lcom/medium/android/graphql/fragment/CatalogPagingResultData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Paging {
        private final String __typename;
        private final CatalogPagingResultData catalogPagingResultData;

        public Paging(String str, CatalogPagingResultData catalogPagingResultData) {
            str.getClass();
            catalogPagingResultData.getClass();
            this.__typename = str;
            this.catalogPagingResultData = catalogPagingResultData;
        }

        public static /* synthetic */ Paging copy$default(Paging paging, String str, CatalogPagingResultData catalogPagingResultData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = paging.__typename;
            }
            if ((i & 2) != 0) {
                catalogPagingResultData = paging.catalogPagingResultData;
            }
            return paging.copy(str, catalogPagingResultData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final CatalogPagingResultData getCatalogPagingResultData() {
            return this.catalogPagingResultData;
        }

        public final Paging copy(String __typename, CatalogPagingResultData catalogPagingResultData) {
            __typename.getClass();
            catalogPagingResultData.getClass();
            return new Paging(__typename, catalogPagingResultData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Paging)) {
                return false;
            }
            Paging paging = (Paging) other;
            return g76.L(this.__typename, paging.__typename) && g76.L(this.catalogPagingResultData, paging.catalogPagingResultData);
        }

        public final CatalogPagingResultData getCatalogPagingResultData() {
            return this.catalogPagingResultData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.catalogPagingResultData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Paging(__typename=" + this.__typename + ", catalogPagingResultData=" + this.catalogPagingResultData + ")";
        }
    }

    public CatalogItemsQuery(String str, CatalogPagingOptionsInput catalogPagingOptionsInput) {
        str.getClass();
        catalogPagingOptionsInput.getClass();
        this.catalogId = str;
        this.pagingOptions = catalogPagingOptionsInput;
    }

    public static /* synthetic */ CatalogItemsQuery copy$default(CatalogItemsQuery catalogItemsQuery, String str, CatalogPagingOptionsInput catalogPagingOptionsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            str = catalogItemsQuery.catalogId;
        }
        if ((i & 2) != 0) {
            catalogPagingOptionsInput = catalogItemsQuery.pagingOptions;
        }
        return catalogItemsQuery.copy(str, catalogPagingOptionsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(CatalogItemsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getCatalogId() {
        return this.catalogId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final CatalogPagingOptionsInput getPagingOptions() {
        return this.pagingOptions;
    }

    public final CatalogItemsQuery copy(String catalogId, CatalogPagingOptionsInput pagingOptions) {
        catalogId.getClass();
        pagingOptions.getClass();
        return new CatalogItemsQuery(catalogId, pagingOptions);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query CatalogItems($catalogId: ID!, $pagingOptions: CatalogPagingOptionsInput!) { catalogById(catalogId: $catalogId) { __typename ... on Catalog { itemsConnection(pagingOptions: $pagingOptions) { __typename items { __typename ...CatalogItemData catalogItemId } paging { __typename ...CatalogPagingResultData } } id } } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment CatalogItemPostData on Post { __typename ...PostPreviewData id }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogItemData on CatalogItemV2 { __typename catalogItemId catalogId entity { __typename ...CatalogItemPostData ...CatalogItemUserData } userAnnotation { __typename annotation } }  fragment CatalogPagingResultData on CatalogPagingResult { __typename count nextPageCursor { __typename id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogItemsQuery)) {
            return false;
        }
        CatalogItemsQuery catalogItemsQuery = (CatalogItemsQuery) other;
        return g76.L(this.catalogId, catalogItemsQuery.catalogId) && g76.L(this.pagingOptions, catalogItemsQuery.pagingOptions);
    }

    public final String getCatalogId() {
        return this.catalogId;
    }

    public final CatalogPagingOptionsInput getPagingOptions() {
        return this.pagingOptions;
    }

    public final int hashCode() {
        return this.pagingOptions.hashCode() + (this.catalogId.hashCode() * 31);
    }

    @Override // defpackage.hv8
    public final String id() {
        return OPERATION_ID;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = CatalogItemsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        CatalogItemsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "CatalogItemsQuery(catalogId=" + this.catalogId + ", pagingOptions=" + this.pagingOptions + ")";
    }

    @Override // defpackage.hv8
    public final String name() {
        return mgKMENwrbHf.UJA;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/CatalogItemsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query CatalogItems($catalogId: ID!, $pagingOptions: CatalogPagingOptionsInput!) { catalogById(catalogId: $catalogId) { __typename ... on Catalog { itemsConnection(pagingOptions: $pagingOptions) { __typename items { __typename ...CatalogItemData catalogItemId } paging { __typename ...CatalogPagingResultData } } id } } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment CatalogItemPostData on Post { __typename ...PostPreviewData id }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogItemData on CatalogItemV2 { __typename catalogItemId catalogId entity { __typename ...CatalogItemPostData ...CatalogItemUserData } userAnnotation { __typename annotation } }  fragment CatalogPagingResultData on CatalogPagingResult { __typename count nextPageCursor { __typename id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
