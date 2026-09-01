package com.medium.android.graphql.fragment;

import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import com.medium.android.graphql.fragment.CatalogSummaryData;
import com.medium.android.graphql.fragment.UserNewsletterDataImpl_ResponseAdapter;
import com.medium.android.graphql.type.CatalogType;
import com.medium.android.graphql.type.CatalogVisibility;
import com.medium.android.graphql.type.PredefinedCatalogType;
import com.medium.android.graphql.type.adapter.CatalogType_ResponseAdapter;
import com.medium.android.graphql.type.adapter.CatalogVisibility_ResponseAdapter;
import com.medium.android.graphql.type.adapter.PredefinedCatalogType_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.xl8;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;
import pushnotifications.SY.eoLmc;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001:\u0005\u0004\u0005\u0006\u0007\bB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\t"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogSummaryDataImpl_ResponseAdapter;", "", "<init>", "()V", "CatalogSummaryData", "Creator", "ViewerEdge", "Verifications", "ViewerEdge1", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogSummaryDataImpl_ResponseAdapter {
    public static final CatalogSummaryDataImpl_ResponseAdapter INSTANCE = new CatalogSummaryDataImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogSummaryDataImpl_ResponseAdapter$CatalogSummaryData;", "Lc8;", "Lcom/medium/android/graphql/fragment/CatalogSummaryData;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CatalogSummaryData;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CatalogSummaryData;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class CatalogSummaryData implements c8 {
        public static final CatalogSummaryData INSTANCE = new CatalogSummaryData();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", gYpYQDQkhfs.ixQXM, "type", "visibility", "predefined", "creator", "version", "itemsLastInsertedAt", "postItemsCount", "viewerEdge");

        private CatalogSummaryData() {
        }

        /* JADX WARN: Failed to find 'out' block for switch in B:4:0x0018. Please report as an issue. */
        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.CatalogSummaryData fromJson(fd6 reader, yl2 customScalarAdapters) {
            Integer num;
            Long l;
            reader.getClass();
            customScalarAdapters.getClass();
            Long lValueOf = null;
            String strQ = null;
            String strQ2 = null;
            String strQ3 = null;
            CatalogType catalogTypeFromJson = null;
            CatalogVisibility catalogVisibilityFromJson = null;
            PredefinedCatalogType predefinedCatalogType = null;
            CatalogSummaryData.Creator creator = null;
            String strQ4 = null;
            Integer numValueOf = null;
            CatalogSummaryData.ViewerEdge1 viewerEdge1 = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        l = lValueOf;
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        lValueOf = l;
                        break;
                    case 1:
                        l = lValueOf;
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        lValueOf = l;
                        break;
                    case 2:
                        l = lValueOf;
                        fa4 fa4Var3 = k8.a;
                        strQ3 = reader.q();
                        strQ3.getClass();
                        lValueOf = l;
                        break;
                    case 3:
                        l = lValueOf;
                        catalogTypeFromJson = CatalogType_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                        lValueOf = l;
                        break;
                    case 4:
                        l = lValueOf;
                        catalogVisibilityFromJson = CatalogVisibility_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                        lValueOf = l;
                        break;
                    case 5:
                        l = lValueOf;
                        predefinedCatalogType = (PredefinedCatalogType) k8.b(PredefinedCatalogType_ResponseAdapter.INSTANCE).fromJson(reader, customScalarAdapters);
                        lValueOf = l;
                        break;
                    case 6:
                        l = lValueOf;
                        creator = (CatalogSummaryData.Creator) k8.c(Creator.INSTANCE, true).fromJson(reader, customScalarAdapters);
                        lValueOf = l;
                        break;
                    case 7:
                        l = lValueOf;
                        fa4 fa4Var4 = k8.a;
                        strQ4 = reader.q();
                        strQ4.getClass();
                        lValueOf = l;
                        break;
                    case 8:
                        num = numValueOf;
                        fa4 fa4Var5 = k8.a;
                        lValueOf = Long.valueOf(reader.nextLong());
                        numValueOf = num;
                        break;
                    case 9:
                        l = lValueOf;
                        fa4 fa4Var6 = k8.a;
                        numValueOf = Integer.valueOf(reader.nextInt());
                        lValueOf = l;
                        break;
                    case 10:
                        num = numValueOf;
                        viewerEdge1 = (CatalogSummaryData.ViewerEdge1) k8.c(ViewerEdge1.INSTANCE, false).fromJson(reader, customScalarAdapters);
                        lValueOf = lValueOf;
                        numValueOf = num;
                        break;
                }
                Long l2 = lValueOf;
                if (strQ == null) {
                    kng.L(reader, "__typename");
                    throw null;
                }
                if (strQ2 == null) {
                    kng.L(reader, "id");
                    throw null;
                }
                if (strQ3 == null) {
                    kng.L(reader, "name");
                    throw null;
                }
                if (catalogTypeFromJson == null) {
                    kng.L(reader, "type");
                    throw null;
                }
                if (catalogVisibilityFromJson == null) {
                    kng.L(reader, "visibility");
                    throw null;
                }
                if (creator == null) {
                    kng.L(reader, "creator");
                    throw null;
                }
                if (strQ4 == null) {
                    kng.L(reader, "version");
                    throw null;
                }
                if (l2 == null) {
                    kng.L(reader, "itemsLastInsertedAt");
                    throw null;
                }
                Integer num2 = numValueOf;
                long jLongValue = l2.longValue();
                if (num2 == null) {
                    kng.L(reader, "postItemsCount");
                    throw null;
                }
                int iIntValue = num2.intValue();
                if (viewerEdge1 != null) {
                    return new com.medium.android.graphql.fragment.CatalogSummaryData(strQ, strQ2, strQ3, catalogTypeFromJson, catalogVisibilityFromJson, predefinedCatalogType, creator, strQ4, jLongValue, iIntValue, viewerEdge1);
                }
                kng.L(reader, "viewerEdge");
                throw null;
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.CatalogSummaryData value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("name");
            fa4Var.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("type");
            CatalogType_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getType());
            writer.t0("visibility");
            CatalogVisibility_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getVisibility());
            writer.t0("predefined");
            k8.b(PredefinedCatalogType_ResponseAdapter.INSTANCE).toJson(writer, customScalarAdapters, value.getPredefined());
            writer.t0("creator");
            k8.c(Creator.INSTANCE, true).toJson(writer, customScalarAdapters, value.getCreator());
            writer.t0("version");
            fa4Var.toJson(writer, customScalarAdapters, value.getVersion());
            writer.t0("itemsLastInsertedAt");
            k8.d.toJson(writer, customScalarAdapters, Long.valueOf(value.getItemsLastInsertedAt()));
            writer.t0("postItemsCount");
            k8.b.toJson(writer, customScalarAdapters, Integer.valueOf(value.getPostItemsCount()));
            writer.t0("viewerEdge");
            k8.c(ViewerEdge1.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogSummaryDataImpl_ResponseAdapter$Verifications;", "Lc8;", "Lcom/medium/android/graphql/fragment/CatalogSummaryData$Verifications;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CatalogSummaryData$Verifications;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CatalogSummaryData$Verifications;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Verifications implements c8 {
        public static final Verifications INSTANCE = new Verifications();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "isBookAuthor");

        private Verifications() {
        }

        @Override // defpackage.c8
        public final CatalogSummaryData.Verifications fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Boolean boolValueOf = null;
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
                    boolValueOf = Boolean.valueOf(reader.nextBoolean());
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (boolValueOf != null) {
                return new CatalogSummaryData.Verifications(strQ, boolValueOf.booleanValue());
            }
            kng.L(reader, "isBookAuthor");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogSummaryData.Verifications value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("isBookAuthor");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isBookAuthor()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogSummaryDataImpl_ResponseAdapter$ViewerEdge;", "Lc8;", "Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge implements c8 {
        public static final ViewerEdge INSTANCE = new ViewerEdge();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "isUser");

        private ViewerEdge() {
        }

        @Override // defpackage.c8
        public final CatalogSummaryData.ViewerEdge fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            Boolean boolValueOf = null;
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
                    boolValueOf = Boolean.valueOf(reader.nextBoolean());
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 == null) {
                kng.L(reader, "id");
                throw null;
            }
            if (boolValueOf != null) {
                return new CatalogSummaryData.ViewerEdge(strQ, strQ2, boolValueOf.booleanValue());
            }
            kng.L(reader, "isUser");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogSummaryData.ViewerEdge value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("isUser");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isUser()));
        }
    }

    private CatalogSummaryDataImpl_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogSummaryDataImpl_ResponseAdapter$Creator;", "Lc8;", "Lcom/medium/android/graphql/fragment/CatalogSummaryData$Creator;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CatalogSummaryData$Creator;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CatalogSummaryData$Creator;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Creator implements c8 {
        public static final Creator INSTANCE = new Creator();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name", "username", "imageId", "viewerEdge", "verifications");

        private Creator() {
        }

        @Override // defpackage.c8
        public final CatalogSummaryData.Creator fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            String str2 = null;
            String str3 = null;
            CatalogSummaryData.ViewerEdge viewerEdge = null;
            CatalogSummaryData.Verifications verifications = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        break;
                    case 1:
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        break;
                    case 2:
                        str = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 3:
                        str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 4:
                        str3 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 5:
                        viewerEdge = (CatalogSummaryData.ViewerEdge) k8.c(ViewerEdge.INSTANCE, false).fromJson(reader, customScalarAdapters);
                        break;
                    case 6:
                        sv0 sv0VarC = k8.c(Verifications.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        verifications = (CatalogSummaryData.Verifications) objFromJson;
                        break;
                    default:
                        reader.j();
                        UserNewsletterData userNewsletterDataFromJson = UserNewsletterDataImpl_ResponseAdapter.UserNewsletterData.INSTANCE.fromJson(reader, customScalarAdapters);
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (strQ2 == null) {
                            kng.L(reader, "id");
                            throw null;
                        }
                        if (viewerEdge != null) {
                            return new CatalogSummaryData.Creator(strQ, strQ2, str, str2, str3, viewerEdge, verifications, userNewsletterDataFromJson);
                        }
                        kng.L(reader, "viewerEdge");
                        throw null;
                }
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogSummaryData.Creator value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0(eoLmc.WwBFIqmhzmlhNR);
            xl8 xl8Var = k8.g;
            xl8Var.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("username");
            xl8Var.toJson(writer, customScalarAdapters, value.getUsername());
            writer.t0("imageId");
            xl8Var.toJson(writer, customScalarAdapters, value.getImageId());
            writer.t0("viewerEdge");
            k8.c(ViewerEdge.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
            writer.t0("verifications");
            sv0 sv0VarC = k8.c(Verifications.INSTANCE, false);
            CatalogSummaryData.Verifications verifications = value.getVerifications();
            if (verifications == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, verifications);
            }
            UserNewsletterDataImpl_ResponseAdapter.UserNewsletterData.INSTANCE.toJson(writer, customScalarAdapters, value.getUserNewsletterData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogSummaryDataImpl_ResponseAdapter$ViewerEdge1;", "Lc8;", "Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge1;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge1;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CatalogSummaryData$ViewerEdge1;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge1 implements c8 {
        public static final ViewerEdge1 INSTANCE = new ViewerEdge1();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "followersCount");

        private ViewerEdge1() {
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogSummaryData.ViewerEdge1 value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("followersCount");
            k8.i.toJson(writer, customScalarAdapters, value.getFollowersCount());
        }

        @Override // defpackage.c8
        public final CatalogSummaryData.ViewerEdge1 fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            Integer num = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 != 0) {
                    if (iN0 != 1) {
                        if (iN0 != 2) {
                            break;
                        }
                        num = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                    } else {
                        fa4 fa4Var = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                    }
                } else {
                    fa4 fa4Var2 = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                }
            }
            if (strQ != null) {
                if (strQ2 != null) {
                    return new CatalogSummaryData.ViewerEdge1(strQ, strQ2, num);
                }
                kng.L(reader, "id");
                throw null;
            }
            kng.L(reader, ziYqbdHrAXvj.fbN);
            throw null;
        }
    }
}
