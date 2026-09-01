package com.medium.android.graphql;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.medium.android.graphql.adapter.CatalogRecircItemsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.CatalogRecircItemsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CatalogItemData;
import com.medium.android.graphql.selections.CatalogRecircItemsQuerySelections;
import com.medium.android.graphql.type.CatalogPagingOptionsInput;
import com.medium.android.graphql.type.PredefinedCatalogType;
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
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000f\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0007./0123-B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\nJ\u0010\u0010\u001d\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u001e¨\u00064"}, d2 = {"Lcom/medium/android/graphql/CatalogRecircItemsQuery;", "Luqa;", "Lcom/medium/android/graphql/CatalogRecircItemsQuery$Data;", "", "catalogId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "pagingOptions", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;)Lcom/medium/android/graphql/CatalogRecircItemsQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getCatalogId", "Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "getPagingOptions", "Companion", "Data", "CatalogById", "OnCatalog", "Creator", "ItemsConnection", "Item", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogRecircItemsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "ced33b7e86c641f2186fb1f8b2965d677b37760a1312d42e9c33cdc3ff054e3c";
    public static final String OPERATION_NAME = "CatalogRecircItems";
    private final String catalogId;
    private final CatalogPagingOptionsInput pagingOptions;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/CatalogRecircItemsQuery$CatalogById;", "", "__typename", "", "onCatalog", "Lcom/medium/android/graphql/CatalogRecircItemsQuery$OnCatalog;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/CatalogRecircItemsQuery$OnCatalog;)V", "get__typename", "()Ljava/lang/String;", "getOnCatalog", "()Lcom/medium/android/graphql/CatalogRecircItemsQuery$OnCatalog;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/CatalogRecircItemsQuery$Creator;", "", "__typename", "", "id", "name", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator {
        private final String __typename;
        private final String id;
        private final String name;

        public Creator(String str, String str2, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
        }

        public static /* synthetic */ Creator copy$default(Creator creator, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = creator.__typename;
            }
            if ((i & 2) != 0) {
                str2 = creator.id;
            }
            if ((i & 4) != 0) {
                str3 = creator.name;
            }
            return creator.copy(str, str2, str3);
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
        public final String getName() {
            return this.name;
        }

        public final Creator copy(String __typename, String id, String name) {
            __typename.getClass();
            id.getClass();
            return new Creator(__typename, id, name);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator)) {
                return false;
            }
            Creator creator = (Creator) other;
            return g76.L(this.__typename, creator.__typename) && g76.L(this.id, creator.id) && g76.L(this.name, creator.name);
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return ka1.v(y30.u("Creator(__typename=", str, ", id=", str2, ", name="), this.name, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/CatalogRecircItemsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/CatalogRecircItemsQuery$CatalogById;", "catalogById", "<init>", "(Lcom/medium/android/graphql/CatalogRecircItemsQuery$CatalogById;)V", "component1", "()Lcom/medium/android/graphql/CatalogRecircItemsQuery$CatalogById;", "copy", "(Lcom/medium/android/graphql/CatalogRecircItemsQuery$CatalogById;)Lcom/medium/android/graphql/CatalogRecircItemsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/CatalogRecircItemsQuery$CatalogById;", "getCatalogById", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/CatalogRecircItemsQuery$Item;", "", "__typename", "", "catalogItemId", "catalogItemData", "Lcom/medium/android/graphql/fragment/CatalogItemData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogItemData;)V", "get__typename", "()Ljava/lang/String;", "getCatalogItemId", "getCatalogItemData", "()Lcom/medium/android/graphql/fragment/CatalogItemData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
            StringBuilder sbU = y30.u("Item(__typename=", str, ", catalogItemId=", str2, eoLmc.uWvZCmiDDh);
            sbU.append(catalogItemData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/CatalogRecircItemsQuery$ItemsConnection;", "", "__typename", "", "items", "", "Lcom/medium/android/graphql/CatalogRecircItemsQuery$Item;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getItems", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ItemsConnection {
        private final String __typename;
        private final List<Item> items;

        public ItemsConnection(String str, List<Item> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.items = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ ItemsConnection copy$default(ItemsConnection itemsConnection, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = itemsConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = itemsConnection.items;
            }
            return itemsConnection.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Item> component2() {
            return this.items;
        }

        public final ItemsConnection copy(String __typename, List<Item> items) {
            __typename.getClass();
            items.getClass();
            return new ItemsConnection(__typename, items);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ItemsConnection)) {
                return false;
            }
            ItemsConnection itemsConnection = (ItemsConnection) other;
            return g76.L(this.__typename, itemsConnection.__typename) && g76.L(this.items, itemsConnection.items);
        }

        public final List<Item> getItems() {
            return this.items;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.items.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("ItemsConnection(__typename=", this.__typename, ", items=", ")", this.items);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B1\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0019\u001a\u00020\bHÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\nHÆ\u0003J=\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\b2\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\nHÆ\u0001J\u0013\u0010\u001c\u001a\u00020\u001d2\b\u0010\u001e\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001f\u001a\u00020 HÖ\u0001J\t\u0010!\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015¨\u0006\""}, d2 = {"Lcom/medium/android/graphql/CatalogRecircItemsQuery$OnCatalog;", "", "id", "", "name", "creator", "Lcom/medium/android/graphql/CatalogRecircItemsQuery$Creator;", "itemsConnection", "Lcom/medium/android/graphql/CatalogRecircItemsQuery$ItemsConnection;", "predefined", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/CatalogRecircItemsQuery$Creator;Lcom/medium/android/graphql/CatalogRecircItemsQuery$ItemsConnection;Lcom/medium/android/graphql/type/PredefinedCatalogType;)V", "getId", "()Ljava/lang/String;", "getName", "getCreator", "()Lcom/medium/android/graphql/CatalogRecircItemsQuery$Creator;", "getItemsConnection", "()Lcom/medium/android/graphql/CatalogRecircItemsQuery$ItemsConnection;", "getPredefined", "()Lcom/medium/android/graphql/type/PredefinedCatalogType;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnCatalog {
        private final Creator creator;
        private final String id;
        private final ItemsConnection itemsConnection;
        private final String name;
        private final PredefinedCatalogType predefined;

        public OnCatalog(String str, String str2, Creator creator, ItemsConnection itemsConnection, PredefinedCatalogType predefinedCatalogType) {
            str.getClass();
            str2.getClass();
            creator.getClass();
            itemsConnection.getClass();
            this.id = str;
            this.name = str2;
            this.creator = creator;
            this.itemsConnection = itemsConnection;
            this.predefined = predefinedCatalogType;
        }

        public static /* synthetic */ OnCatalog copy$default(OnCatalog onCatalog, String str, String str2, Creator creator, ItemsConnection itemsConnection, PredefinedCatalogType predefinedCatalogType, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onCatalog.id;
            }
            if ((i & 2) != 0) {
                str2 = onCatalog.name;
            }
            if ((i & 4) != 0) {
                creator = onCatalog.creator;
            }
            if ((i & 8) != 0) {
                itemsConnection = onCatalog.itemsConnection;
            }
            if ((i & 16) != 0) {
                predefinedCatalogType = onCatalog.predefined;
            }
            PredefinedCatalogType predefinedCatalogType2 = predefinedCatalogType;
            Creator creator2 = creator;
            return onCatalog.copy(str, str2, creator2, itemsConnection, predefinedCatalogType2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Creator getCreator() {
            return this.creator;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final ItemsConnection getItemsConnection() {
            return this.itemsConnection;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final PredefinedCatalogType getPredefined() {
            return this.predefined;
        }

        public final OnCatalog copy(String id, String name, Creator creator, ItemsConnection itemsConnection, PredefinedCatalogType predefined) {
            id.getClass();
            name.getClass();
            creator.getClass();
            itemsConnection.getClass();
            return new OnCatalog(id, name, creator, itemsConnection, predefined);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnCatalog)) {
                return false;
            }
            OnCatalog onCatalog = (OnCatalog) other;
            return g76.L(this.id, onCatalog.id) && g76.L(this.name, onCatalog.name) && g76.L(this.creator, onCatalog.creator) && g76.L(this.itemsConnection, onCatalog.itemsConnection) && this.predefined == onCatalog.predefined;
        }

        public final Creator getCreator() {
            return this.creator;
        }

        public final String getId() {
            return this.id;
        }

        public final ItemsConnection getItemsConnection() {
            return this.itemsConnection;
        }

        public final String getName() {
            return this.name;
        }

        public final PredefinedCatalogType getPredefined() {
            return this.predefined;
        }

        public final int hashCode() {
            int iHashCode = (this.itemsConnection.hashCode() + ((this.creator.hashCode() + wgd.o(this.id.hashCode() * 31, 31, this.name)) * 31)) * 31;
            PredefinedCatalogType predefinedCatalogType = this.predefined;
            return iHashCode + (predefinedCatalogType == null ? 0 : predefinedCatalogType.hashCode());
        }

        public final String toString() {
            String str = this.id;
            String str2 = this.name;
            Creator creator = this.creator;
            ItemsConnection itemsConnection = this.itemsConnection;
            PredefinedCatalogType predefinedCatalogType = this.predefined;
            StringBuilder sbU = y30.u("OnCatalog(id=", str, ", name=", str2, ", creator=");
            sbU.append(creator);
            sbU.append(", itemsConnection=");
            sbU.append(itemsConnection);
            sbU.append(", predefined=");
            sbU.append(predefinedCatalogType);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public CatalogRecircItemsQuery(String str, CatalogPagingOptionsInput catalogPagingOptionsInput) {
        str.getClass();
        catalogPagingOptionsInput.getClass();
        this.catalogId = str;
        this.pagingOptions = catalogPagingOptionsInput;
    }

    public static /* synthetic */ CatalogRecircItemsQuery copy$default(CatalogRecircItemsQuery catalogRecircItemsQuery, String str, CatalogPagingOptionsInput catalogPagingOptionsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            str = catalogRecircItemsQuery.catalogId;
        }
        if ((i & 2) != 0) {
            catalogPagingOptionsInput = catalogRecircItemsQuery.pagingOptions;
        }
        return catalogRecircItemsQuery.copy(str, catalogPagingOptionsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(CatalogRecircItemsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getCatalogId() {
        return this.catalogId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final CatalogPagingOptionsInput getPagingOptions() {
        return this.pagingOptions;
    }

    public final CatalogRecircItemsQuery copy(String catalogId, CatalogPagingOptionsInput pagingOptions) {
        catalogId.getClass();
        pagingOptions.getClass();
        return new CatalogRecircItemsQuery(catalogId, pagingOptions);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query CatalogRecircItems($catalogId: ID!, $pagingOptions: CatalogPagingOptionsInput!) { catalogById(catalogId: $catalogId) { __typename ... on Catalog { id name creator { __typename id name } itemsConnection(pagingOptions: $pagingOptions) { __typename items { __typename ...CatalogItemData catalogItemId } } predefined } } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment CatalogItemPostData on Post { __typename ...PostPreviewData id }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogItemData on CatalogItemV2 { __typename catalogItemId catalogId entity { __typename ...CatalogItemPostData ...CatalogItemUserData } userAnnotation { __typename annotation } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogRecircItemsQuery)) {
            return false;
        }
        CatalogRecircItemsQuery catalogRecircItemsQuery = (CatalogRecircItemsQuery) other;
        return g76.L(this.catalogId, catalogRecircItemsQuery.catalogId) && g76.L(this.pagingOptions, catalogRecircItemsQuery.pagingOptions);
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

    @Override // defpackage.hv8
    public final String name() {
        return OPERATION_NAME;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = CatalogRecircItemsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        CatalogRecircItemsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return aJzfoQ.PPwtrvjSOBMVOl + this.catalogId + ", pagingOptions=" + this.pagingOptions + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/CatalogRecircItemsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query CatalogRecircItems($catalogId: ID!, $pagingOptions: CatalogPagingOptionsInput!) { catalogById(catalogId: $catalogId) { __typename ... on Catalog { id name creator { __typename id name } itemsConnection(pagingOptions: $pagingOptions) { __typename items { __typename ...CatalogItemData catalogItemId } } predefined } } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment CatalogItemPostData on Post { __typename ...PostPreviewData id }  fragment CatalogItemUserData on User { __typename id }  fragment CatalogItemData on CatalogItemV2 { __typename catalogItemId catalogId entity { __typename ...CatalogItemPostData ...CatalogItemUserData } userAnnotation { __typename annotation } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
