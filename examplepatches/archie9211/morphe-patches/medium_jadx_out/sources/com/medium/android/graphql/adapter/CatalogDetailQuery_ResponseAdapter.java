package com.medium.android.graphql.adapter;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.medium.android.graphql.CatalogDetailQuery;
import com.medium.android.graphql.fragment.CatalogDetailData;
import com.medium.android.graphql.fragment.CatalogDetailDataImpl_ResponseAdapter;
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
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0007\bÆ\u0002\u0018\u00002\u00020\u0001:\u0004\u0004\u0005\u0006\u0007B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\b"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogDetailQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "CatalogById", "OnForbidden", "OnNotFound", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogDetailQuery_ResponseAdapter {
    public static final CatalogDetailQuery_ResponseAdapter INSTANCE = new CatalogDetailQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogDetailQuery_ResponseAdapter$CatalogById;", "Lc8;", "Lcom/medium/android/graphql/CatalogDetailQuery$CatalogById;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/CatalogDetailQuery$CatalogById;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/CatalogDetailQuery$CatalogById;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class CatalogById implements c8 {
        public static final CatalogById INSTANCE = new CatalogById();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private CatalogById() {
        }

        @Override // defpackage.c8
        public final CatalogDetailQuery.CatalogById fromJson(fd6 reader, yl2 customScalarAdapters) {
            CatalogDetailQuery.OnForbidden onForbiddenFromJson;
            CatalogDetailQuery.OnNotFound onNotFoundFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Set set = customScalarAdapters.b;
            Set set2 = customScalarAdapters.a;
            CatalogDetailData catalogDetailDataFromJson = null;
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
            if (dm2.B(dm2.Q("Forbidden"), set2, strQ, set)) {
                reader.j();
                onForbiddenFromJson = OnForbidden.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onForbiddenFromJson = null;
            }
            if (dm2.B(dm2.Q("NotFound"), set2, strQ, set)) {
                reader.j();
                onNotFoundFromJson = OnNotFound.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onNotFoundFromJson = null;
            }
            if (dm2.B(dm2.Q("Catalog"), set2, strQ, set)) {
                reader.j();
                catalogDetailDataFromJson = CatalogDetailDataImpl_ResponseAdapter.CatalogDetailData.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new CatalogDetailQuery.CatalogById(strQ, onForbiddenFromJson, onNotFoundFromJson, catalogDetailDataFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogDetailQuery.CatalogById value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnForbidden() != null) {
                OnForbidden.INSTANCE.toJson(writer, customScalarAdapters, value.getOnForbidden());
            }
            if (value.getOnNotFound() != null) {
                OnNotFound.INSTANCE.toJson(writer, customScalarAdapters, value.getOnNotFound());
            }
            if (value.getCatalogDetailData() != null) {
                CatalogDetailDataImpl_ResponseAdapter.CatalogDetailData.INSTANCE.toJson(writer, customScalarAdapters, value.getCatalogDetailData());
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogDetailQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/CatalogDetailQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/CatalogDetailQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/CatalogDetailQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q(QFTsJPDEnO.wBGoiF);

        private Data() {
        }

        @Override // defpackage.c8
        public final CatalogDetailQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            CatalogDetailQuery.CatalogById catalogById = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                catalogById = (CatalogDetailQuery.CatalogById) k8.c(CatalogById.INSTANCE, true).fromJson(reader, customScalarAdapters);
            }
            if (catalogById != null) {
                return new CatalogDetailQuery.Data(catalogById);
            }
            kng.L(reader, "catalogById");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogDetailQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("catalogById");
            k8.c(CatalogById.INSTANCE, true).toJson(writer, customScalarAdapters, value.getCatalogById());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogDetailQuery_ResponseAdapter$OnForbidden;", "Lc8;", "Lcom/medium/android/graphql/CatalogDetailQuery$OnForbidden;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/CatalogDetailQuery$OnForbidden;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/CatalogDetailQuery$OnForbidden;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnForbidden implements c8 {
        public static final OnForbidden INSTANCE = new OnForbidden();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnForbidden() {
        }

        @Override // defpackage.c8
        public final CatalogDetailQuery.OnForbidden fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new CatalogDetailQuery.OnForbidden(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogDetailQuery.OnForbidden value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/CatalogDetailQuery_ResponseAdapter$OnNotFound;", "Lc8;", "Lcom/medium/android/graphql/CatalogDetailQuery$OnNotFound;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/CatalogDetailQuery$OnNotFound;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/CatalogDetailQuery$OnNotFound;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnNotFound implements c8 {
        public static final OnNotFound INSTANCE = new OnNotFound();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnNotFound() {
        }

        @Override // defpackage.c8
        public final CatalogDetailQuery.OnNotFound fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new CatalogDetailQuery.OnNotFound(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogDetailQuery.OnNotFound value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    private CatalogDetailQuery_ResponseAdapter() {
    }
}
