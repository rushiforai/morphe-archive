package com.medium.android.graphql.fragment;

import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.dq1;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.xl8;
import defpackage.yl2;
import defpackage.zm7;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\bÆ\u0002\u0018\u00002\u00020\u0001:\u0001\u0004B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/graphql/fragment/PagingParamsDataImpl_ResponseAdapter;", "", "<init>", "()V", "PagingParamsData", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PagingParamsDataImpl_ResponseAdapter {
    public static final PagingParamsDataImpl_ResponseAdapter INSTANCE = new PagingParamsDataImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/PagingParamsDataImpl_ResponseAdapter$PagingParamsData;", "Lc8;", "Lcom/medium/android/graphql/fragment/PagingParamsData;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/PagingParamsData;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/PagingParamsData;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PagingParamsData implements c8 {
        public static final PagingParamsData INSTANCE = new PagingParamsData();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "from", "ignoredIds", "limit", "order", "page", "since", "source", "to");

        private PagingParamsData() {
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.PagingParamsData fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String str = null;
            List list = null;
            Integer num = null;
            String str2 = null;
            Integer num2 = null;
            Long lValueOf = null;
            String str3 = null;
            String str4 = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        break;
                    case 1:
                        str = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 2:
                        zm7 zm7Var = new zm7(k8.a);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = zm7Var.fromJson(reader, customScalarAdapters);
                        }
                        list = (List) objFromJson;
                        break;
                    case 3:
                        num = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                        break;
                    case 4:
                        str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 5:
                        num2 = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                        break;
                    case 6:
                        dq1 dq1Var = k8.d;
                        if (reader.peek() != cd6.NULL) {
                            lValueOf = Long.valueOf(reader.nextLong());
                        } else {
                            reader.v();
                            lValueOf = null;
                        }
                        break;
                    case 7:
                        str3 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    case 8:
                        str4 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        break;
                    default:
                        if (strQ != null) {
                            return new com.medium.android.graphql.fragment.PagingParamsData(strQ, str, list, num, str2, num2, lValueOf, str3, str4);
                        }
                        kng.L(reader, "__typename");
                        throw null;
                }
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.PagingParamsData value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("from");
            xl8 xl8Var = k8.g;
            xl8Var.toJson(writer, customScalarAdapters, value.getFrom());
            writer.t0("ignoredIds");
            zm7 zm7Var = new zm7(fa4Var);
            List<String> ignoredIds = value.getIgnoredIds();
            if (ignoredIds == null) {
                writer.s0();
            } else {
                zm7Var.toJson(writer, customScalarAdapters, ignoredIds);
            }
            writer.t0("limit");
            xl8 xl8Var2 = k8.i;
            xl8Var2.toJson(writer, customScalarAdapters, value.getLimit());
            writer.t0("order");
            xl8Var.toJson(writer, customScalarAdapters, value.getOrder());
            writer.t0("page");
            xl8Var2.toJson(writer, customScalarAdapters, value.getPage());
            writer.t0("since");
            dq1 dq1Var = k8.d;
            Long since = value.getSince();
            if (since == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, since);
            }
            writer.t0("source");
            xl8Var.toJson(writer, customScalarAdapters, value.getSource());
            writer.t0("to");
            xl8Var.toJson(writer, customScalarAdapters, value.getTo());
        }
    }

    private PagingParamsDataImpl_ResponseAdapter() {
    }
}
