package com.medium.android.graphql.adapter;

import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.medium.android.graphql.CatalogItemsQuery;
import com.medium.android.graphql.fragment.CatalogItemData;
import com.medium.android.graphql.fragment.CatalogItemDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.CatalogPagingResultData;
import com.medium.android.graphql.fragment.CatalogPagingResultDataImpl_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.d46;
import defpackage.dm2;
import defpackage.ev6;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.ygf;
import defpackage.yl2;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001:\u0006\u0004\u0005\u0006\u0007\b\tB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogItemsQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "CatalogById", "OnCatalog", "ItemsConnection", "Item", "Paging", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogItemsQuery_ResponseAdapter {
    public static final CatalogItemsQuery_ResponseAdapter INSTANCE = new CatalogItemsQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogItemsQuery_ResponseAdapter$CatalogById;", "Lc8;", "Lcom/medium/android/graphql/CatalogItemsQuery$CatalogById;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/CatalogItemsQuery$CatalogById;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/CatalogItemsQuery$CatalogById;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class CatalogById implements c8 {
        public static final CatalogById INSTANCE = new CatalogById();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private CatalogById() {
        }

        @Override // defpackage.c8
        public final CatalogItemsQuery.CatalogById fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            CatalogItemsQuery.OnCatalog onCatalogFromJson = null;
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            if (strQ == null) {
                ygf.f("__typename was not found");
                return null;
            }
            if (dm2.B(dm2.Q("Catalog"), customScalarAdapters.a, strQ, customScalarAdapters.b)) {
                reader.j();
                onCatalogFromJson = OnCatalog.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new CatalogItemsQuery.CatalogById(strQ, onCatalogFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogItemsQuery.CatalogById value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnCatalog() != null) {
                OnCatalog.INSTANCE.toJson(writer, customScalarAdapters, value.getOnCatalog());
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogItemsQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/CatalogItemsQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/CatalogItemsQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/CatalogItemsQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q("catalogById");

        private Data() {
        }

        @Override // defpackage.c8
        public final CatalogItemsQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            CatalogItemsQuery.CatalogById catalogById = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                catalogById = (CatalogItemsQuery.CatalogById) k8.c(CatalogById.INSTANCE, true).fromJson(reader, customScalarAdapters);
            }
            if (catalogById != null) {
                return new CatalogItemsQuery.Data(catalogById);
            }
            kng.L(reader, "catalogById");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogItemsQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("catalogById");
            k8.c(CatalogById.INSTANCE, true).toJson(writer, customScalarAdapters, value.getCatalogById());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogItemsQuery_ResponseAdapter$Item;", "Lc8;", "Lcom/medium/android/graphql/CatalogItemsQuery$Item;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/CatalogItemsQuery$Item;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/CatalogItemsQuery$Item;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Item implements c8 {
        public static final Item INSTANCE = new Item();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "catalogItemId");

        private Item() {
        }

        @Override // defpackage.c8
        public final CatalogItemsQuery.Item fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
            }
            reader.j();
            CatalogItemData catalogItemDataFromJson = CatalogItemDataImpl_ResponseAdapter.CatalogItemData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new CatalogItemsQuery.Item(strQ, strQ2, catalogItemDataFromJson);
            }
            kng.L(reader, "catalogItemId");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogItemsQuery.Item value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("catalogItemId");
            fa4Var.toJson(writer, customScalarAdapters, value.getCatalogItemId());
            CatalogItemDataImpl_ResponseAdapter.CatalogItemData.INSTANCE.toJson(writer, customScalarAdapters, value.getCatalogItemData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogItemsQuery_ResponseAdapter$ItemsConnection;", "Lc8;", "Lcom/medium/android/graphql/CatalogItemsQuery$ItemsConnection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/CatalogItemsQuery$ItemsConnection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/CatalogItemsQuery$ItemsConnection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ItemsConnection implements c8 {
        public static final ItemsConnection INSTANCE = new ItemsConnection();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "items", "paging");

        private ItemsConnection() {
        }

        @Override // defpackage.c8
        public final CatalogItemsQuery.ItemsConnection fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            ArrayList arrayList = null;
            CatalogItemsQuery.Paging paging = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    sv0 sv0VarC = k8.c(Item.INSTANCE, true);
                    ArrayList arrayListE = ev6.E(reader);
                    while (reader.hasNext()) {
                        try {
                            arrayListE.add(sv0VarC.fromJson(reader, customScalarAdapters));
                        } catch (ApolloGraphQLException e) {
                            while (reader.hasNext()) {
                                reader.v();
                            }
                            reader.k();
                            throw e;
                        }
                    }
                    reader.k();
                    arrayList = arrayListE;
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    paging = (CatalogItemsQuery.Paging) k8.c(Paging.INSTANCE, true).fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (arrayList == null) {
                kng.L(reader, "items");
                throw null;
            }
            if (paging != null) {
                return new CatalogItemsQuery.ItemsConnection(strQ, arrayList, paging);
            }
            kng.L(reader, "paging");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogItemsQuery.ItemsConnection value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("items");
            sv0 sv0VarC = k8.c(Item.INSTANCE, true);
            List<CatalogItemsQuery.Item> items = value.getItems();
            items.getClass();
            writer.n();
            Iterator<T> it2 = items.iterator();
            while (it2.hasNext()) {
                sv0VarC.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
            writer.t0("paging");
            k8.c(Paging.INSTANCE, true).toJson(writer, customScalarAdapters, value.getPaging());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogItemsQuery_ResponseAdapter$OnCatalog;", "Lc8;", "Lcom/medium/android/graphql/CatalogItemsQuery$OnCatalog;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/CatalogItemsQuery$OnCatalog;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/CatalogItemsQuery$OnCatalog;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnCatalog implements c8 {
        public static final OnCatalog INSTANCE = new OnCatalog();
        private static final List<String> RESPONSE_NAMES = d46.R("itemsConnection", "id");

        private OnCatalog() {
        }

        @Override // defpackage.c8
        public final CatalogItemsQuery.OnCatalog fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            CatalogItemsQuery.ItemsConnection itemsConnection = null;
            String strQ = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    itemsConnection = (CatalogItemsQuery.ItemsConnection) k8.c(ItemsConnection.INSTANCE, false).fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                }
            }
            if (itemsConnection == null) {
                kng.L(reader, "itemsConnection");
                throw null;
            }
            if (strQ != null) {
                return new CatalogItemsQuery.OnCatalog(itemsConnection, strQ);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogItemsQuery.OnCatalog value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("itemsConnection");
            k8.c(ItemsConnection.INSTANCE, false).toJson(writer, customScalarAdapters, value.getItemsConnection());
            writer.t0("id");
            k8.a.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogItemsQuery_ResponseAdapter$Paging;", "Lc8;", "Lcom/medium/android/graphql/CatalogItemsQuery$Paging;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/CatalogItemsQuery$Paging;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/CatalogItemsQuery$Paging;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Paging implements c8 {
        public static final Paging INSTANCE = new Paging();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private Paging() {
        }

        @Override // defpackage.c8
        public final CatalogItemsQuery.Paging fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            reader.j();
            CatalogPagingResultData catalogPagingResultDataFromJson = CatalogPagingResultDataImpl_ResponseAdapter.CatalogPagingResultData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ != null) {
                return new CatalogItemsQuery.Paging(strQ, catalogPagingResultDataFromJson);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogItemsQuery.Paging value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            CatalogPagingResultDataImpl_ResponseAdapter.CatalogPagingResultData.INSTANCE.toJson(writer, customScalarAdapters, value.getCatalogPagingResultData());
        }
    }

    private CatalogItemsQuery_ResponseAdapter() {
    }
}
