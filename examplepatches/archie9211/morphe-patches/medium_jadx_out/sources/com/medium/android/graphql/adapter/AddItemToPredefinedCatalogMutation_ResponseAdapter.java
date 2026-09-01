package com.medium.android.graphql.adapter;

import com.medium.android.graphql.AddItemToPredefinedCatalogMutation;
import defpackage.ae6;
import defpackage.c8;
import defpackage.d46;
import defpackage.dm2;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.ygf;
import defpackage.yl2;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\t\bÆ\u0002\u0018\u00002\u00020\u0001:\u0006\u0004\u0005\u0006\u0007\b\tB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/adapter/AddItemToPredefinedCatalogMutation_ResponseAdapter;", "", "<init>", "()V", "Data", "AddToPredefinedCatalog", "OnAddToPredefinedCatalogSucces", "InsertedItem", "OnBadRequest", "OnUnauthorized", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AddItemToPredefinedCatalogMutation_ResponseAdapter {
    public static final AddItemToPredefinedCatalogMutation_ResponseAdapter INSTANCE = new AddItemToPredefinedCatalogMutation_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AddItemToPredefinedCatalogMutation_ResponseAdapter$AddToPredefinedCatalog;", "Lc8;", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$AddToPredefinedCatalog;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$AddToPredefinedCatalog;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$AddToPredefinedCatalog;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class AddToPredefinedCatalog implements c8 {
        public static final AddToPredefinedCatalog INSTANCE = new AddToPredefinedCatalog();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private AddToPredefinedCatalog() {
        }

        @Override // defpackage.c8
        public final AddItemToPredefinedCatalogMutation.AddToPredefinedCatalog fromJson(fd6 reader, yl2 customScalarAdapters) {
            AddItemToPredefinedCatalogMutation.OnAddToPredefinedCatalogSucces onAddToPredefinedCatalogSuccesFromJson;
            AddItemToPredefinedCatalogMutation.OnBadRequest onBadRequestFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Set set = customScalarAdapters.b;
            Set set2 = customScalarAdapters.a;
            AddItemToPredefinedCatalogMutation.OnUnauthorized onUnauthorizedFromJson = null;
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
            if (dm2.B(dm2.Q("AddToPredefinedCatalogSucces"), set2, strQ, set)) {
                reader.j();
                onAddToPredefinedCatalogSuccesFromJson = OnAddToPredefinedCatalogSucces.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onAddToPredefinedCatalogSuccesFromJson = null;
            }
            if (dm2.B(dm2.Q("BadRequest"), set2, strQ, set)) {
                reader.j();
                onBadRequestFromJson = OnBadRequest.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onBadRequestFromJson = null;
            }
            if (dm2.B(dm2.Q("Unauthorized"), set2, strQ, set)) {
                reader.j();
                onUnauthorizedFromJson = OnUnauthorized.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new AddItemToPredefinedCatalogMutation.AddToPredefinedCatalog(strQ, onAddToPredefinedCatalogSuccesFromJson, onBadRequestFromJson, onUnauthorizedFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AddItemToPredefinedCatalogMutation.AddToPredefinedCatalog value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnAddToPredefinedCatalogSucces() != null) {
                OnAddToPredefinedCatalogSucces.INSTANCE.toJson(writer, customScalarAdapters, value.getOnAddToPredefinedCatalogSucces());
            }
            if (value.getOnBadRequest() != null) {
                OnBadRequest.INSTANCE.toJson(writer, customScalarAdapters, value.getOnBadRequest());
            }
            if (value.getOnUnauthorized() != null) {
                OnUnauthorized.INSTANCE.toJson(writer, customScalarAdapters, value.getOnUnauthorized());
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AddItemToPredefinedCatalogMutation_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q("addToPredefinedCatalog");

        private Data() {
        }

        @Override // defpackage.c8
        public final AddItemToPredefinedCatalogMutation.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            AddItemToPredefinedCatalogMutation.AddToPredefinedCatalog addToPredefinedCatalog = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                addToPredefinedCatalog = (AddItemToPredefinedCatalogMutation.AddToPredefinedCatalog) k8.c(AddToPredefinedCatalog.INSTANCE, true).fromJson(reader, customScalarAdapters);
            }
            if (addToPredefinedCatalog != null) {
                return new AddItemToPredefinedCatalogMutation.Data(addToPredefinedCatalog);
            }
            kng.L(reader, "addToPredefinedCatalog");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AddItemToPredefinedCatalogMutation.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("addToPredefinedCatalog");
            k8.c(AddToPredefinedCatalog.INSTANCE, true).toJson(writer, customScalarAdapters, value.getAddToPredefinedCatalog());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AddItemToPredefinedCatalogMutation_ResponseAdapter$InsertedItem;", "Lc8;", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$InsertedItem;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$InsertedItem;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$InsertedItem;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class InsertedItem implements c8 {
        public static final InsertedItem INSTANCE = new InsertedItem();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "catalogId", "catalogItemId");

        private InsertedItem() {
        }

        @Override // defpackage.c8
        public final AddItemToPredefinedCatalogMutation.InsertedItem fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String strQ3 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    fa4 fa4Var3 = k8.a;
                    strQ3 = reader.q();
                    strQ3.getClass();
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 == null) {
                kng.L(reader, "catalogId");
                throw null;
            }
            if (strQ3 != null) {
                return new AddItemToPredefinedCatalogMutation.InsertedItem(strQ, strQ2, strQ3);
            }
            kng.L(reader, "catalogItemId");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AddItemToPredefinedCatalogMutation.InsertedItem value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("catalogId");
            fa4Var.toJson(writer, customScalarAdapters, value.getCatalogId());
            writer.t0("catalogItemId");
            fa4Var.toJson(writer, customScalarAdapters, value.getCatalogItemId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AddItemToPredefinedCatalogMutation_ResponseAdapter$OnAddToPredefinedCatalogSucces;", "Lc8;", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnAddToPredefinedCatalogSucces;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnAddToPredefinedCatalogSucces;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnAddToPredefinedCatalogSucces;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnAddToPredefinedCatalogSucces implements c8 {
        public static final OnAddToPredefinedCatalogSucces INSTANCE = new OnAddToPredefinedCatalogSucces();
        private static final List<String> RESPONSE_NAMES = d46.R("version", "insertedItem");

        private OnAddToPredefinedCatalogSucces() {
        }

        @Override // defpackage.c8
        public final AddItemToPredefinedCatalogMutation.OnAddToPredefinedCatalogSucces fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            AddItemToPredefinedCatalogMutation.InsertedItem insertedItem = null;
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
                    insertedItem = (AddItemToPredefinedCatalogMutation.InsertedItem) k8.c(InsertedItem.INSTANCE, false).fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "version");
                throw null;
            }
            if (insertedItem != null) {
                return new AddItemToPredefinedCatalogMutation.OnAddToPredefinedCatalogSucces(strQ, insertedItem);
            }
            kng.L(reader, "insertedItem");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AddItemToPredefinedCatalogMutation.OnAddToPredefinedCatalogSucces value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("version");
            k8.a.toJson(writer, customScalarAdapters, value.getVersion());
            writer.t0("insertedItem");
            k8.c(InsertedItem.INSTANCE, false).toJson(writer, customScalarAdapters, value.getInsertedItem());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AddItemToPredefinedCatalogMutation_ResponseAdapter$OnBadRequest;", "Lc8;", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnBadRequest;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnBadRequest;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnBadRequest;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnBadRequest implements c8 {
        public static final OnBadRequest INSTANCE = new OnBadRequest();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnBadRequest() {
        }

        @Override // defpackage.c8
        public final AddItemToPredefinedCatalogMutation.OnBadRequest fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new AddItemToPredefinedCatalogMutation.OnBadRequest(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AddItemToPredefinedCatalogMutation.OnBadRequest value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/AddItemToPredefinedCatalogMutation_ResponseAdapter$OnUnauthorized;", "Lc8;", "Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnUnauthorized;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnUnauthorized;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/AddItemToPredefinedCatalogMutation$OnUnauthorized;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnUnauthorized implements c8 {
        public static final OnUnauthorized INSTANCE = new OnUnauthorized();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnUnauthorized() {
        }

        @Override // defpackage.c8
        public final AddItemToPredefinedCatalogMutation.OnUnauthorized fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new AddItemToPredefinedCatalogMutation.OnUnauthorized(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, AddItemToPredefinedCatalogMutation.OnUnauthorized value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    private AddItemToPredefinedCatalogMutation_ResponseAdapter() {
    }
}
