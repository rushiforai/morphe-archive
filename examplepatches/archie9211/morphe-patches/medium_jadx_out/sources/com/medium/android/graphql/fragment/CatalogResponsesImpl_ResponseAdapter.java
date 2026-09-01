package com.medium.android.graphql.fragment;

import com.medium.android.graphql.fragment.CatalogResponses;
import com.medium.android.graphql.fragment.ResponseCatalogThreadDataImpl_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.yl2;
import defpackage.zi5;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\bÆ\u0002\u0018\u00002\u00020\u0001:\u0003\u0004\u0005\u0006B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0007"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogResponsesImpl_ResponseAdapter;", "", "<init>", "()V", "CatalogResponses", "Creator", "ThreadedCatalogResponses", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogResponsesImpl_ResponseAdapter {
    public static final CatalogResponsesImpl_ResponseAdapter INSTANCE = new CatalogResponsesImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogResponsesImpl_ResponseAdapter$CatalogResponses;", "Lc8;", "Lcom/medium/android/graphql/fragment/CatalogResponses;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CatalogResponses;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CatalogResponses;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class CatalogResponses implements c8 {
        public static final CatalogResponses INSTANCE = new CatalogResponses();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "responsesLocked", "disallowResponses", "responsesCount", "creator", "threadedCatalogResponses", "id");

        private CatalogResponses() {
        }

        /* JADX WARN: Failed to find 'out' block for switch in B:4:0x0014. Please report as an issue. */
        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.CatalogResponses fromJson(fd6 reader, yl2 customScalarAdapters) {
            Boolean bool;
            Boolean bool2;
            Boolean bool3;
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            String strQ = null;
            Boolean boolValueOf2 = null;
            Long lValueOf = null;
            CatalogResponses.Creator creator = null;
            CatalogResponses.ThreadedCatalogResponses threadedCatalogResponses = null;
            String strQ2 = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        bool = boolValueOf;
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        boolValueOf = bool;
                        break;
                    case 1:
                        fa4 fa4Var2 = k8.a;
                        boolValueOf = Boolean.valueOf(reader.nextBoolean());
                        break;
                    case 2:
                        bool = boolValueOf;
                        fa4 fa4Var3 = k8.a;
                        boolValueOf2 = Boolean.valueOf(reader.nextBoolean());
                        boolValueOf = bool;
                        break;
                    case 3:
                        bool2 = boolValueOf;
                        bool3 = boolValueOf2;
                        fa4 fa4Var4 = k8.a;
                        lValueOf = Long.valueOf(reader.nextLong());
                        boolValueOf = bool2;
                        boolValueOf2 = bool3;
                        break;
                    case 4:
                        bool2 = boolValueOf;
                        bool3 = boolValueOf2;
                        creator = (CatalogResponses.Creator) k8.c(Creator.INSTANCE, false).fromJson(reader, customScalarAdapters);
                        boolValueOf = bool2;
                        boolValueOf2 = bool3;
                        break;
                    case 5:
                        Boolean bool4 = boolValueOf;
                        Boolean bool5 = boolValueOf2;
                        Long l = lValueOf;
                        sv0 sv0VarC = k8.c(ThreadedCatalogResponses.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        threadedCatalogResponses = (CatalogResponses.ThreadedCatalogResponses) objFromJson;
                        boolValueOf = bool4;
                        boolValueOf2 = bool5;
                        lValueOf = l;
                        break;
                    case 6:
                        bool = boolValueOf;
                        fa4 fa4Var5 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        boolValueOf = bool;
                        break;
                }
                Boolean bool6 = boolValueOf;
                if (strQ == null) {
                    kng.L(reader, "__typename");
                    throw null;
                }
                if (bool6 == null) {
                    kng.L(reader, "responsesLocked");
                    throw null;
                }
                Boolean bool7 = boolValueOf2;
                boolean zBooleanValue = bool6.booleanValue();
                if (bool7 == null) {
                    kng.L(reader, "disallowResponses");
                    throw null;
                }
                Long l2 = lValueOf;
                boolean zBooleanValue2 = bool7.booleanValue();
                if (l2 == null) {
                    kng.L(reader, "responsesCount");
                    throw null;
                }
                long jLongValue = l2.longValue();
                if (creator == null) {
                    kng.L(reader, "creator");
                    throw null;
                }
                if (strQ2 != null) {
                    return new com.medium.android.graphql.fragment.CatalogResponses(strQ, zBooleanValue, zBooleanValue2, jLongValue, creator, threadedCatalogResponses, strQ2);
                }
                kng.L(reader, "id");
                throw null;
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.CatalogResponses value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("responsesLocked");
            zi5 zi5Var = k8.e;
            zi5Var.toJson(writer, customScalarAdapters, Boolean.valueOf(value.getResponsesLocked()));
            writer.t0("disallowResponses");
            zi5Var.toJson(writer, customScalarAdapters, Boolean.valueOf(value.getDisallowResponses()));
            writer.t0("responsesCount");
            k8.d.toJson(writer, customScalarAdapters, Long.valueOf(value.getResponsesCount()));
            writer.t0("creator");
            k8.c(Creator.INSTANCE, false).toJson(writer, customScalarAdapters, value.getCreator());
            writer.t0("threadedCatalogResponses");
            sv0 sv0VarC = k8.c(ThreadedCatalogResponses.INSTANCE, true);
            CatalogResponses.ThreadedCatalogResponses threadedCatalogResponses = value.getThreadedCatalogResponses();
            if (threadedCatalogResponses == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, threadedCatalogResponses);
            }
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogResponsesImpl_ResponseAdapter$Creator;", "Lc8;", "Lcom/medium/android/graphql/fragment/CatalogResponses$Creator;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CatalogResponses$Creator;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CatalogResponses$Creator;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Creator implements c8 {
        public static final Creator INSTANCE = new Creator();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name");

        private Creator() {
        }

        @Override // defpackage.c8
        public final CatalogResponses.Creator fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
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
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new CatalogResponses.Creator(strQ, strQ2, str);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogResponses.Creator value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("name");
            k8.g.toJson(writer, customScalarAdapters, value.getName());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogResponsesImpl_ResponseAdapter$ThreadedCatalogResponses;", "Lc8;", "Lcom/medium/android/graphql/fragment/CatalogResponses$ThreadedCatalogResponses;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CatalogResponses$ThreadedCatalogResponses;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CatalogResponses$ThreadedCatalogResponses;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ThreadedCatalogResponses implements c8 {
        public static final ThreadedCatalogResponses INSTANCE = new ThreadedCatalogResponses();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private ThreadedCatalogResponses() {
        }

        @Override // defpackage.c8
        public final CatalogResponses.ThreadedCatalogResponses fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            reader.j();
            ResponseCatalogThreadData responseCatalogThreadDataFromJson = ResponseCatalogThreadDataImpl_ResponseAdapter.ResponseCatalogThreadData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ != null) {
                return new CatalogResponses.ThreadedCatalogResponses(strQ, responseCatalogThreadDataFromJson);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CatalogResponses.ThreadedCatalogResponses value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            ResponseCatalogThreadDataImpl_ResponseAdapter.ResponseCatalogThreadData.INSTANCE.toJson(writer, customScalarAdapters, value.getResponseCatalogThreadData());
        }
    }

    private CatalogResponsesImpl_ResponseAdapter() {
    }
}
