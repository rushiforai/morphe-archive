package com.medium.android.graphql.adapter;

import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.medium.android.graphql.CurrencyAdapter;
import com.medium.android.graphql.GetPostStatsDetailsQuery;
import com.medium.android.graphql.fragment.PostPreviewData;
import com.medium.android.graphql.fragment.PostPreviewDataImpl_ResponseAdapter;
import com.medium.android.graphql.type.PublicationFeaturingEventType;
import com.medium.android.graphql.type.ReferrerType;
import com.medium.android.graphql.type.adapter.PublicationFeaturingEventType_ResponseAdapter;
import com.medium.android.graphql.type.adapter.ReferrerType_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.dm2;
import defpackage.dq1;
import defpackage.ev6;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.uob;
import defpackage.ygf;
import defpackage.yl2;
import defpackage.zm7;
import java.util.ArrayList;
import java.util.Currency;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u001b\bÆ\u0002\u0018\u00002\u00020\u0001:\u0018\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000e\u000f\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017\u0018\u0019\u001a\u001bB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "PostResult", "OnPost", "PublicationFeaturingEventsConnection", "OnPublicationFeaturingEventsConnection", "Edge", "Node", "Publication", "ReadersTopicsV2", "Tag", "Referrer", "Earnings", "Total", "OnGraphqlEmptyId", "OnWithheldInCountry", "OnRemovedByUser", "OnUnavailableForLegalReasons", "OnUnauthorized", "OnPostSuspended", "OnAccountSuspended", "OnAccountDeleted", "OnBlocked", "OnBlocking", "PostStatsTotalBundle", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GetPostStatsDetailsQuery_ResponseAdapter {
    public static final GetPostStatsDetailsQuery_ResponseAdapter INSTANCE = new GetPostStatsDetailsQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.R("postResult", "postStatsTotalBundle");

        private Data() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            GetPostStatsDetailsQuery.PostResult postResult = null;
            GetPostStatsDetailsQuery.PostStatsTotalBundle postStatsTotalBundle = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    sv0 sv0VarC = k8.c(PostResult.INSTANCE, true);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    postResult = (GetPostStatsDetailsQuery.PostResult) objFromJson;
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    postStatsTotalBundle = (GetPostStatsDetailsQuery.PostStatsTotalBundle) k8.c(PostStatsTotalBundle.INSTANCE, false).fromJson(reader, customScalarAdapters);
                }
            }
            if (postStatsTotalBundle != null) {
                return new GetPostStatsDetailsQuery.Data(postResult, postStatsTotalBundle);
            }
            kng.L(reader, "postStatsTotalBundle");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("postResult");
            sv0 sv0VarC = k8.c(PostResult.INSTANCE, true);
            GetPostStatsDetailsQuery.PostResult postResult = value.getPostResult();
            if (postResult == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, postResult);
            }
            writer.t0("postStatsTotalBundle");
            k8.c(PostStatsTotalBundle.INSTANCE, false).toJson(writer, customScalarAdapters, value.getPostStatsTotalBundle());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$Earnings;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Earnings;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Earnings;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Earnings;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Earnings implements c8 {
        public static final Earnings INSTANCE = new Earnings();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "total");

        private Earnings() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.Earnings fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            GetPostStatsDetailsQuery.Total total = null;
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
                    total = (GetPostStatsDetailsQuery.Total) k8.c(Total.INSTANCE, false).fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (total != null) {
                return new GetPostStatsDetailsQuery.Earnings(strQ, total);
            }
            kng.L(reader, "total");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.Earnings value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("total");
            k8.c(Total.INSTANCE, false).toJson(writer, customScalarAdapters, value.getTotal());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$Edge;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Edge;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Edge;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Edge;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Edge implements c8 {
        public static final Edge INSTANCE = new Edge();
        private static final List<String> RESPONSE_NAMES = d46.R(AEVqIoD.lall, "node");

        private Edge() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.Edge fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            GetPostStatsDetailsQuery.Node node = null;
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
                    node = (GetPostStatsDetailsQuery.Node) k8.c(Node.INSTANCE, false).fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (node != null) {
                return new GetPostStatsDetailsQuery.Edge(strQ, node);
            }
            kng.L(reader, "node");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.Edge value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("node");
            k8.c(Node.INSTANCE, false).toJson(writer, customScalarAdapters, value.getNode());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$Node;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Node;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Node;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Node;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Node implements c8 {
        public static final Node INSTANCE = new Node();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "publication", "eventType", "occurredAt");

        private Node() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.Node fromJson(fd6 reader, yl2 customScalarAdapters) {
            Long l;
            reader.getClass();
            customScalarAdapters.getClass();
            Long lValueOf = null;
            String strQ = null;
            GetPostStatsDetailsQuery.Publication publication = null;
            PublicationFeaturingEventType publicationFeaturingEventTypeFromJson = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    l = lValueOf;
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    l = lValueOf;
                    publication = (GetPostStatsDetailsQuery.Publication) k8.c(Publication.INSTANCE, false).fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    l = lValueOf;
                    publicationFeaturingEventTypeFromJson = PublicationFeaturingEventType_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    fa4 fa4Var2 = k8.a;
                    lValueOf = Long.valueOf(reader.nextLong());
                }
                lValueOf = l;
            }
            Long l2 = lValueOf;
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (publication == null) {
                kng.L(reader, "publication");
                throw null;
            }
            if (publicationFeaturingEventTypeFromJson == null) {
                kng.L(reader, "eventType");
                throw null;
            }
            if (l2 != null) {
                return new GetPostStatsDetailsQuery.Node(strQ, publication, publicationFeaturingEventTypeFromJson, l2.longValue());
            }
            kng.L(reader, "occurredAt");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.Node value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("publication");
            k8.c(Publication.INSTANCE, false).toJson(writer, customScalarAdapters, value.getPublication());
            writer.t0("eventType");
            PublicationFeaturingEventType_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getEventType());
            writer.t0("occurredAt");
            k8.d.toJson(writer, customScalarAdapters, Long.valueOf(value.getOccurredAt()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$OnAccountDeleted;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountDeleted;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountDeleted;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountDeleted;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnAccountDeleted implements c8 {
        public static final OnAccountDeleted INSTANCE = new OnAccountDeleted();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnAccountDeleted() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.OnAccountDeleted fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetPostStatsDetailsQuery.OnAccountDeleted(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.OnAccountDeleted value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$OnAccountSuspended;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountSuspended;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountSuspended;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountSuspended;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnAccountSuspended implements c8 {
        public static final OnAccountSuspended INSTANCE = new OnAccountSuspended();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnAccountSuspended() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.OnAccountSuspended fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetPostStatsDetailsQuery.OnAccountSuspended(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.OnAccountSuspended value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$OnBlocked;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocked;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocked;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocked;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnBlocked implements c8 {
        public static final OnBlocked INSTANCE = new OnBlocked();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnBlocked() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.OnBlocked fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetPostStatsDetailsQuery.OnBlocked(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.OnBlocked value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$OnBlocking;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocking;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocking;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocking;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnBlocking implements c8 {
        public static final OnBlocking INSTANCE = new OnBlocking();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnBlocking() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.OnBlocking fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetPostStatsDetailsQuery.OnBlocking(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.OnBlocking value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$OnGraphqlEmptyId;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnGraphqlEmptyId;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnGraphqlEmptyId;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnGraphqlEmptyId;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnGraphqlEmptyId implements c8 {
        public static final OnGraphqlEmptyId INSTANCE = new OnGraphqlEmptyId();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnGraphqlEmptyId() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.OnGraphqlEmptyId fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetPostStatsDetailsQuery.OnGraphqlEmptyId(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.OnGraphqlEmptyId value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$OnPost;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPost;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPost;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPost;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnPost implements c8 {
        public static final OnPost INSTANCE = new OnPost();
        private static final List<String> RESPONSE_NAMES = d46.R("firstBoostedAt", "publicationFeaturingEventsConnection", "isLocked", "readersTopicsV2", "referrers", "earnings", "id");

        private OnPost() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.OnPost fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Long lValueOf = null;
            GetPostStatsDetailsQuery.PublicationFeaturingEventsConnection publicationFeaturingEventsConnection = null;
            Boolean bool = null;
            ArrayList arrayListE = null;
            ArrayList arrayListFromJson = null;
            GetPostStatsDetailsQuery.Earnings earnings = null;
            String strQ = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        dq1 dq1Var = k8.d;
                        if (reader.peek() != cd6.NULL) {
                            lValueOf = Long.valueOf(reader.nextLong());
                        } else {
                            reader.v();
                            lValueOf = null;
                        }
                        break;
                    case 1:
                        publicationFeaturingEventsConnection = (GetPostStatsDetailsQuery.PublicationFeaturingEventsConnection) k8.c(PublicationFeaturingEventsConnection.INSTANCE, true).fromJson(reader, customScalarAdapters);
                        break;
                    case 2:
                        bool = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                        break;
                    case 3:
                        sv0 sv0VarC = k8.c(ReadersTopicsV2.INSTANCE, false);
                        arrayListE = ev6.E(reader);
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
                        break;
                    case 4:
                        zm7 zm7Var = new zm7(k8.c(Referrer.INSTANCE, false));
                        if (reader.peek() != cd6.NULL) {
                            arrayListFromJson = zm7Var.fromJson(reader, customScalarAdapters);
                        } else {
                            reader.v();
                            arrayListFromJson = null;
                        }
                        break;
                    case 5:
                        sv0 sv0VarC2 = k8.c(Earnings.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC2.fromJson(reader, customScalarAdapters);
                        }
                        earnings = (GetPostStatsDetailsQuery.Earnings) objFromJson;
                        break;
                    case 6:
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        break;
                    default:
                        reader.j();
                        PostPreviewData postPreviewDataFromJson = PostPreviewDataImpl_ResponseAdapter.PostPreviewData.INSTANCE.fromJson(reader, customScalarAdapters);
                        if (publicationFeaturingEventsConnection == null) {
                            kng.L(reader, "publicationFeaturingEventsConnection");
                            throw null;
                        }
                        if (arrayListE == null) {
                            kng.L(reader, "readersTopicsV2");
                            throw null;
                        }
                        if (strQ != null) {
                            return new GetPostStatsDetailsQuery.OnPost(lValueOf, publicationFeaturingEventsConnection, bool, arrayListE, arrayListFromJson, earnings, strQ, postPreviewDataFromJson);
                        }
                        kng.L(reader, "id");
                        throw null;
                }
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.OnPost value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("firstBoostedAt");
            dq1 dq1Var = k8.d;
            Long firstBoostedAt = value.getFirstBoostedAt();
            if (firstBoostedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, firstBoostedAt);
            }
            writer.t0("publicationFeaturingEventsConnection");
            k8.c(PublicationFeaturingEventsConnection.INSTANCE, true).toJson(writer, customScalarAdapters, value.getPublicationFeaturingEventsConnection());
            writer.t0("isLocked");
            k8.j.toJson(writer, customScalarAdapters, value.isLocked());
            writer.t0("readersTopicsV2");
            sv0 sv0VarC = k8.c(ReadersTopicsV2.INSTANCE, false);
            List<GetPostStatsDetailsQuery.ReadersTopicsV2> readersTopicsV2 = value.getReadersTopicsV2();
            readersTopicsV2.getClass();
            writer.n();
            Iterator<T> it2 = readersTopicsV2.iterator();
            while (it2.hasNext()) {
                sv0VarC.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
            writer.t0("referrers");
            zm7 zm7Var = new zm7(k8.c(Referrer.INSTANCE, false));
            List<GetPostStatsDetailsQuery.Referrer> referrers = value.getReferrers();
            if (referrers == null) {
                writer.s0();
            } else {
                zm7Var.toJson(writer, customScalarAdapters, referrers);
            }
            writer.t0("earnings");
            sv0 sv0VarC2 = k8.c(Earnings.INSTANCE, false);
            GetPostStatsDetailsQuery.Earnings earnings = value.getEarnings();
            if (earnings == null) {
                writer.s0();
            } else {
                sv0VarC2.toJson(writer, customScalarAdapters, earnings);
            }
            writer.t0("id");
            k8.a.toJson(writer, customScalarAdapters, value.getId());
            PostPreviewDataImpl_ResponseAdapter.PostPreviewData.INSTANCE.toJson(writer, customScalarAdapters, value.getPostPreviewData());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$OnPostSuspended;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPostSuspended;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPostSuspended;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPostSuspended;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnPostSuspended implements c8 {
        public static final OnPostSuspended INSTANCE = new OnPostSuspended();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnPostSuspended() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.OnPostSuspended fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetPostStatsDetailsQuery.OnPostSuspended(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.OnPostSuspended value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$OnPublicationFeaturingEventsConnection;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPublicationFeaturingEventsConnection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPublicationFeaturingEventsConnection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPublicationFeaturingEventsConnection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnPublicationFeaturingEventsConnection implements c8 {
        public static final OnPublicationFeaturingEventsConnection INSTANCE = new OnPublicationFeaturingEventsConnection();
        private static final List<String> RESPONSE_NAMES = d46.Q("edges");

        private OnPublicationFeaturingEventsConnection() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.OnPublicationFeaturingEventsConnection fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            ArrayList arrayList = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                sv0 sv0VarC = k8.c(Edge.INSTANCE, false);
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
            }
            if (arrayList != null) {
                return new GetPostStatsDetailsQuery.OnPublicationFeaturingEventsConnection(arrayList);
            }
            kng.L(reader, "edges");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.OnPublicationFeaturingEventsConnection value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("edges");
            sv0 sv0VarC = k8.c(Edge.INSTANCE, false);
            List<GetPostStatsDetailsQuery.Edge> edges = value.getEdges();
            edges.getClass();
            writer.n();
            Iterator<T> it2 = edges.iterator();
            while (it2.hasNext()) {
                sv0VarC.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$OnRemovedByUser;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnRemovedByUser;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnRemovedByUser;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnRemovedByUser;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnRemovedByUser implements c8 {
        public static final OnRemovedByUser INSTANCE = new OnRemovedByUser();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnRemovedByUser() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.OnRemovedByUser fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetPostStatsDetailsQuery.OnRemovedByUser(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.OnRemovedByUser value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$OnUnauthorized;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnauthorized;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnauthorized;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnauthorized;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnUnauthorized implements c8 {
        public static final OnUnauthorized INSTANCE = new OnUnauthorized();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnUnauthorized() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.OnUnauthorized fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetPostStatsDetailsQuery.OnUnauthorized(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.OnUnauthorized value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$OnUnavailableForLegalReasons;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnavailableForLegalReasons;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnavailableForLegalReasons;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnavailableForLegalReasons;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnUnavailableForLegalReasons implements c8 {
        public static final OnUnavailableForLegalReasons INSTANCE = new OnUnavailableForLegalReasons();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnUnavailableForLegalReasons() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.OnUnavailableForLegalReasons fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetPostStatsDetailsQuery.OnUnavailableForLegalReasons(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.OnUnavailableForLegalReasons value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$OnWithheldInCountry;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnWithheldInCountry;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnWithheldInCountry;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnWithheldInCountry;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnWithheldInCountry implements c8 {
        public static final OnWithheldInCountry INSTANCE = new OnWithheldInCountry();
        private static final List<String> RESPONSE_NAMES = d46.Q("message");

        private OnWithheldInCountry() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.OnWithheldInCountry fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String str = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                str = (String) k8.g.fromJson(reader, customScalarAdapters);
            }
            return new GetPostStatsDetailsQuery.OnWithheldInCountry(str);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.OnWithheldInCountry value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("message");
            k8.g.toJson(writer, customScalarAdapters, value.getMessage());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$PostResult;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostResult;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostResult;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostResult;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PostResult implements c8 {
        public static final PostResult INSTANCE = new PostResult();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private PostResult() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.PostResult fromJson(fd6 reader, yl2 customScalarAdapters) {
            GetPostStatsDetailsQuery.OnPost onPostFromJson;
            GetPostStatsDetailsQuery.OnGraphqlEmptyId onGraphqlEmptyIdFromJson;
            GetPostStatsDetailsQuery.OnWithheldInCountry onWithheldInCountryFromJson;
            GetPostStatsDetailsQuery.OnRemovedByUser onRemovedByUserFromJson;
            GetPostStatsDetailsQuery.OnUnavailableForLegalReasons onUnavailableForLegalReasonsFromJson;
            GetPostStatsDetailsQuery.OnUnauthorized onUnauthorizedFromJson;
            GetPostStatsDetailsQuery.OnPostSuspended onPostSuspendedFromJson;
            GetPostStatsDetailsQuery.OnAccountSuspended onAccountSuspendedFromJson;
            GetPostStatsDetailsQuery.OnAccountDeleted onAccountDeletedFromJson;
            GetPostStatsDetailsQuery.OnBlocked onBlockedFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            Set set = customScalarAdapters.b;
            Set set2 = customScalarAdapters.a;
            GetPostStatsDetailsQuery.OnBlocking onBlockingFromJson = null;
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
            if (dm2.B(dm2.Q("Post"), set2, strQ, set)) {
                reader.j();
                onPostFromJson = OnPost.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onPostFromJson = null;
            }
            if (dm2.B(dm2.Q("GraphqlEmptyId"), set2, strQ, set)) {
                reader.j();
                onGraphqlEmptyIdFromJson = OnGraphqlEmptyId.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onGraphqlEmptyIdFromJson = null;
            }
            if (dm2.B(dm2.Q("WithheldInCountry"), set2, strQ, set)) {
                reader.j();
                onWithheldInCountryFromJson = OnWithheldInCountry.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onWithheldInCountryFromJson = null;
            }
            if (dm2.B(dm2.Q("RemovedByUser"), set2, strQ, set)) {
                reader.j();
                onRemovedByUserFromJson = OnRemovedByUser.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onRemovedByUserFromJson = null;
            }
            if (dm2.B(dm2.Q("UnavailableForLegalReasons"), set2, strQ, set)) {
                reader.j();
                onUnavailableForLegalReasonsFromJson = OnUnavailableForLegalReasons.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onUnavailableForLegalReasonsFromJson = null;
            }
            if (dm2.B(dm2.Q("Unauthorized"), set2, strQ, set)) {
                reader.j();
                onUnauthorizedFromJson = OnUnauthorized.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onUnauthorizedFromJson = null;
            }
            if (dm2.B(dm2.Q("PostSuspended"), set2, strQ, set)) {
                reader.j();
                onPostSuspendedFromJson = OnPostSuspended.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onPostSuspendedFromJson = null;
            }
            if (dm2.B(dm2.Q("AccountSuspended"), set2, strQ, set)) {
                reader.j();
                onAccountSuspendedFromJson = OnAccountSuspended.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onAccountSuspendedFromJson = null;
            }
            if (dm2.B(dm2.Q("AccountDeleted"), set2, strQ, set)) {
                reader.j();
                onAccountDeletedFromJson = OnAccountDeleted.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onAccountDeletedFromJson = null;
            }
            if (dm2.B(dm2.Q("Blocked"), set2, strQ, set)) {
                reader.j();
                onBlockedFromJson = OnBlocked.INSTANCE.fromJson(reader, customScalarAdapters);
            } else {
                onBlockedFromJson = null;
            }
            if (dm2.B(dm2.Q("Blocking"), set2, strQ, set)) {
                reader.j();
                onBlockingFromJson = OnBlocking.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new GetPostStatsDetailsQuery.PostResult(strQ, onPostFromJson, onGraphqlEmptyIdFromJson, onWithheldInCountryFromJson, onRemovedByUserFromJson, onUnavailableForLegalReasonsFromJson, onUnauthorizedFromJson, onPostSuspendedFromJson, onAccountSuspendedFromJson, onAccountDeletedFromJson, onBlockedFromJson, onBlockingFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.PostResult value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnPost() != null) {
                OnPost.INSTANCE.toJson(writer, customScalarAdapters, value.getOnPost());
            }
            if (value.getOnGraphqlEmptyId() != null) {
                OnGraphqlEmptyId.INSTANCE.toJson(writer, customScalarAdapters, value.getOnGraphqlEmptyId());
            }
            if (value.getOnWithheldInCountry() != null) {
                OnWithheldInCountry.INSTANCE.toJson(writer, customScalarAdapters, value.getOnWithheldInCountry());
            }
            if (value.getOnRemovedByUser() != null) {
                OnRemovedByUser.INSTANCE.toJson(writer, customScalarAdapters, value.getOnRemovedByUser());
            }
            if (value.getOnUnavailableForLegalReasons() != null) {
                OnUnavailableForLegalReasons.INSTANCE.toJson(writer, customScalarAdapters, value.getOnUnavailableForLegalReasons());
            }
            if (value.getOnUnauthorized() != null) {
                OnUnauthorized.INSTANCE.toJson(writer, customScalarAdapters, value.getOnUnauthorized());
            }
            if (value.getOnPostSuspended() != null) {
                OnPostSuspended.INSTANCE.toJson(writer, customScalarAdapters, value.getOnPostSuspended());
            }
            if (value.getOnAccountSuspended() != null) {
                OnAccountSuspended.INSTANCE.toJson(writer, customScalarAdapters, value.getOnAccountSuspended());
            }
            if (value.getOnAccountDeleted() != null) {
                OnAccountDeleted.INSTANCE.toJson(writer, customScalarAdapters, value.getOnAccountDeleted());
            }
            if (value.getOnBlocked() != null) {
                OnBlocked.INSTANCE.toJson(writer, customScalarAdapters, value.getOnBlocked());
            }
            if (value.getOnBlocking() != null) {
                OnBlocking.INSTANCE.toJson(writer, customScalarAdapters, value.getOnBlocking());
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$PostStatsTotalBundle;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostStatsTotalBundle;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostStatsTotalBundle;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostStatsTotalBundle;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PostStatsTotalBundle implements c8 {
        public static final PostStatsTotalBundle INSTANCE = new PostStatsTotalBundle();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "viewViaAuthorFriendLinkCount", "viewViaPremiumFriendLinkCount", "presentationCount", "viewCount", "readCount", "followersGained", "followersLost", "subscribersGained", "subscribersLost", "netFollowerCount", "netSubscriberCount", "feedClickThroughRate");

        private PostStatsTotalBundle() {
        }

        /* JADX WARN: Failed to find 'out' block for switch in B:4:0x001d. Please report as an issue. */
        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.PostStatsTotalBundle fromJson(fd6 reader, yl2 customScalarAdapters) {
            Long l;
            Long l2;
            Long l3;
            Long l4;
            Long l5;
            Long l6;
            reader.getClass();
            customScalarAdapters.getClass();
            Long lValueOf = null;
            String strQ = null;
            Long lValueOf2 = null;
            Long lValueOf3 = null;
            Long lValueOf4 = null;
            Long lValueOf5 = null;
            Long lValueOf6 = null;
            Long lValueOf7 = null;
            Long lValueOf8 = null;
            Long lValueOf9 = null;
            Long lValueOf10 = null;
            Long lValueOf11 = null;
            Double d = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        l = lValueOf;
                        l2 = lValueOf2;
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        lValueOf = l;
                        lValueOf2 = l2;
                        break;
                    case 1:
                        l3 = lValueOf2;
                        l4 = lValueOf3;
                        l5 = lValueOf4;
                        fa4 fa4Var2 = k8.a;
                        lValueOf = Long.valueOf(reader.nextLong());
                        lValueOf2 = l3;
                        lValueOf3 = l4;
                        lValueOf4 = l5;
                        break;
                    case 2:
                        Long l7 = lValueOf;
                        l4 = lValueOf3;
                        l5 = lValueOf4;
                        fa4 fa4Var3 = k8.a;
                        lValueOf2 = Long.valueOf(reader.nextLong());
                        lValueOf = l7;
                        lValueOf3 = l4;
                        lValueOf4 = l5;
                        break;
                    case 3:
                        Long l8 = lValueOf;
                        Long l9 = lValueOf2;
                        Long l10 = lValueOf3;
                        Long l11 = lValueOf4;
                        Long l12 = lValueOf5;
                        Long l13 = lValueOf7;
                        Long l14 = lValueOf8;
                        Long l15 = lValueOf9;
                        Long l16 = lValueOf10;
                        Long l17 = lValueOf11;
                        dq1 dq1Var = k8.d;
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            lValueOf6 = null;
                        } else {
                            lValueOf6 = Long.valueOf(reader.nextLong());
                        }
                        lValueOf = l8;
                        lValueOf2 = l9;
                        lValueOf3 = l10;
                        lValueOf4 = l11;
                        lValueOf5 = l12;
                        lValueOf7 = l13;
                        lValueOf8 = l14;
                        lValueOf9 = l15;
                        lValueOf10 = l16;
                        lValueOf11 = l17;
                        break;
                    case 4:
                        Long l18 = lValueOf;
                        l5 = lValueOf4;
                        fa4 fa4Var4 = k8.a;
                        lValueOf3 = Long.valueOf(reader.nextLong());
                        lValueOf = l18;
                        lValueOf2 = lValueOf2;
                        lValueOf4 = l5;
                        break;
                    case 5:
                        Long l19 = lValueOf;
                        fa4 fa4Var5 = k8.a;
                        lValueOf4 = Long.valueOf(reader.nextLong());
                        lValueOf = l19;
                        lValueOf2 = lValueOf2;
                        lValueOf3 = lValueOf3;
                        break;
                    case 6:
                        l6 = lValueOf;
                        l3 = lValueOf2;
                        l4 = lValueOf3;
                        l5 = lValueOf4;
                        fa4 fa4Var6 = k8.a;
                        lValueOf5 = Long.valueOf(reader.nextLong());
                        lValueOf = l6;
                        lValueOf2 = l3;
                        lValueOf3 = l4;
                        lValueOf4 = l5;
                        break;
                    case 7:
                        l6 = lValueOf;
                        l3 = lValueOf2;
                        l4 = lValueOf3;
                        l5 = lValueOf4;
                        fa4 fa4Var7 = k8.a;
                        lValueOf7 = Long.valueOf(reader.nextLong());
                        lValueOf = l6;
                        lValueOf2 = l3;
                        lValueOf3 = l4;
                        lValueOf4 = l5;
                        break;
                    case 8:
                        l6 = lValueOf;
                        l3 = lValueOf2;
                        l4 = lValueOf3;
                        l5 = lValueOf4;
                        fa4 fa4Var8 = k8.a;
                        lValueOf8 = Long.valueOf(reader.nextLong());
                        lValueOf = l6;
                        lValueOf2 = l3;
                        lValueOf3 = l4;
                        lValueOf4 = l5;
                        break;
                    case 9:
                        l6 = lValueOf;
                        l3 = lValueOf2;
                        l4 = lValueOf3;
                        l5 = lValueOf4;
                        fa4 fa4Var9 = k8.a;
                        lValueOf9 = Long.valueOf(reader.nextLong());
                        lValueOf = l6;
                        lValueOf2 = l3;
                        lValueOf3 = l4;
                        lValueOf4 = l5;
                        break;
                    case 10:
                        l6 = lValueOf;
                        l3 = lValueOf2;
                        l4 = lValueOf3;
                        l5 = lValueOf4;
                        fa4 fa4Var10 = k8.a;
                        lValueOf10 = Long.valueOf(reader.nextLong());
                        lValueOf = l6;
                        lValueOf2 = l3;
                        lValueOf3 = l4;
                        lValueOf4 = l5;
                        break;
                    case 11:
                        l6 = lValueOf;
                        l3 = lValueOf2;
                        l4 = lValueOf3;
                        l5 = lValueOf4;
                        fa4 fa4Var11 = k8.a;
                        lValueOf11 = Long.valueOf(reader.nextLong());
                        lValueOf = l6;
                        lValueOf2 = l3;
                        lValueOf3 = l4;
                        lValueOf4 = l5;
                        break;
                    case 12:
                        l = lValueOf;
                        l2 = lValueOf2;
                        d = (Double) k8.h.fromJson(reader, customScalarAdapters);
                        lValueOf = l;
                        lValueOf2 = l2;
                        break;
                }
                Long l20 = lValueOf;
                if (strQ == null) {
                    kng.L(reader, "__typename");
                    throw null;
                }
                if (l20 == null) {
                    kng.L(reader, "viewViaAuthorFriendLinkCount");
                    throw null;
                }
                Long l21 = lValueOf2;
                Long l22 = lValueOf3;
                long jLongValue = l20.longValue();
                if (l21 == null) {
                    kng.L(reader, "viewViaPremiumFriendLinkCount");
                    throw null;
                }
                Long l23 = lValueOf4;
                Long l24 = lValueOf5;
                long jLongValue2 = l21.longValue();
                if (l22 == null) {
                    kng.L(reader, "viewCount");
                    throw null;
                }
                Long l25 = lValueOf7;
                Long l26 = lValueOf8;
                long jLongValue3 = l22.longValue();
                if (l23 == null) {
                    kng.L(reader, "readCount");
                    throw null;
                }
                Long l27 = lValueOf9;
                Long l28 = lValueOf10;
                long jLongValue4 = l23.longValue();
                if (l24 == null) {
                    kng.L(reader, "followersGained");
                    throw null;
                }
                Long l29 = lValueOf11;
                long jLongValue5 = l24.longValue();
                if (l25 == null) {
                    kng.L(reader, "followersLost");
                    throw null;
                }
                long jLongValue6 = l25.longValue();
                if (l26 == null) {
                    kng.L(reader, "subscribersGained");
                    throw null;
                }
                long jLongValue7 = l26.longValue();
                if (l27 == null) {
                    kng.L(reader, "subscribersLost");
                    throw null;
                }
                long jLongValue8 = l27.longValue();
                if (l28 == null) {
                    kng.L(reader, "netFollowerCount");
                    throw null;
                }
                long jLongValue9 = l28.longValue();
                if (l29 != null) {
                    return new GetPostStatsDetailsQuery.PostStatsTotalBundle(strQ, jLongValue, jLongValue2, lValueOf6, jLongValue3, jLongValue4, jLongValue5, jLongValue6, jLongValue7, jLongValue8, jLongValue9, l29.longValue(), d);
                }
                kng.L(reader, "netSubscriberCount");
                throw null;
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.PostStatsTotalBundle value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("viewViaAuthorFriendLinkCount");
            dq1 dq1Var = k8.d;
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getViewViaAuthorFriendLinkCount()));
            writer.t0("viewViaPremiumFriendLinkCount");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getViewViaPremiumFriendLinkCount()));
            writer.t0("presentationCount");
            Long presentationCount = value.getPresentationCount();
            if (presentationCount == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, presentationCount);
            }
            writer.t0("viewCount");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getViewCount()));
            writer.t0("readCount");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getReadCount()));
            writer.t0("followersGained");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getFollowersGained()));
            writer.t0("followersLost");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getFollowersLost()));
            writer.t0("subscribersGained");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getSubscribersGained()));
            writer.t0("subscribersLost");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getSubscribersLost()));
            writer.t0("netFollowerCount");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getNetFollowerCount()));
            writer.t0("netSubscriberCount");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getNetSubscriberCount()));
            writer.t0("feedClickThroughRate");
            k8.h.toJson(writer, customScalarAdapters, value.getFeedClickThroughRate());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$Publication;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Publication;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Publication;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Publication;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Publication implements c8 {
        public static final Publication INSTANCE = new Publication();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "name", "slug", "id");

        private Publication() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.Publication fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String strQ3 = null;
            String strQ4 = null;
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
                } else if (iN0 == 2) {
                    fa4 fa4Var3 = k8.a;
                    strQ3 = reader.q();
                    strQ3.getClass();
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    fa4 fa4Var4 = k8.a;
                    strQ4 = reader.q();
                    strQ4.getClass();
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 == null) {
                kng.L(reader, "name");
                throw null;
            }
            if (strQ3 == null) {
                kng.L(reader, "slug");
                throw null;
            }
            if (strQ4 != null) {
                return new GetPostStatsDetailsQuery.Publication(strQ, strQ2, strQ3, strQ4);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.Publication value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("name");
            fa4Var.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("slug");
            fa4Var.toJson(writer, customScalarAdapters, value.getSlug());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$PublicationFeaturingEventsConnection;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PublicationFeaturingEventsConnection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PublicationFeaturingEventsConnection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PublicationFeaturingEventsConnection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PublicationFeaturingEventsConnection implements c8 {
        public static final PublicationFeaturingEventsConnection INSTANCE = new PublicationFeaturingEventsConnection();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private PublicationFeaturingEventsConnection() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.PublicationFeaturingEventsConnection fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            GetPostStatsDetailsQuery.OnPublicationFeaturingEventsConnection onPublicationFeaturingEventsConnectionFromJson = null;
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
            if (dm2.B(dm2.Q("PublicationFeaturingEventsConnection"), customScalarAdapters.a, strQ, customScalarAdapters.b)) {
                reader.j();
                onPublicationFeaturingEventsConnectionFromJson = OnPublicationFeaturingEventsConnection.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new GetPostStatsDetailsQuery.PublicationFeaturingEventsConnection(strQ, onPublicationFeaturingEventsConnectionFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.PublicationFeaturingEventsConnection value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnPublicationFeaturingEventsConnection() != null) {
                OnPublicationFeaturingEventsConnection.INSTANCE.toJson(writer, customScalarAdapters, value.getOnPublicationFeaturingEventsConnection());
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$ReadersTopicsV2;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$ReadersTopicsV2;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$ReadersTopicsV2;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$ReadersTopicsV2;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ReadersTopicsV2 implements c8 {
        public static final ReadersTopicsV2 INSTANCE = new ReadersTopicsV2();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "tag", "percentage");

        private ReadersTopicsV2() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.ReadersTopicsV2 fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            GetPostStatsDetailsQuery.Tag tag = null;
            Double dValueOf = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    tag = (GetPostStatsDetailsQuery.Tag) k8.c(Tag.INSTANCE, false).fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    fa4 fa4Var2 = k8.a;
                    dValueOf = Double.valueOf(reader.nextDouble());
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (tag == null) {
                kng.L(reader, "tag");
                throw null;
            }
            if (dValueOf != null) {
                return new GetPostStatsDetailsQuery.ReadersTopicsV2(strQ, tag, dValueOf.doubleValue());
            }
            kng.L(reader, "percentage");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.ReadersTopicsV2 value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("tag");
            k8.c(Tag.INSTANCE, false).toJson(writer, customScalarAdapters, value.getTag());
            writer.t0("percentage");
            k8.c.toJson(writer, customScalarAdapters, Double.valueOf(value.getPercentage()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$Referrer;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Referrer;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Referrer;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Referrer;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Referrer implements c8 {
        public static final Referrer INSTANCE = new Referrer();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "type", "totalCount", "sourceIdentifier");

        private Referrer() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.Referrer fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            ReferrerType referrerType = null;
            Integer num = null;
            String str = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    referrerType = (ReferrerType) k8.b(ReferrerType_ResponseAdapter.INSTANCE).fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    num = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ != null) {
                return new GetPostStatsDetailsQuery.Referrer(strQ, referrerType, num, str);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.Referrer value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("type");
            k8.b(ReferrerType_ResponseAdapter.INSTANCE).toJson(writer, customScalarAdapters, value.getType());
            writer.t0("totalCount");
            k8.i.toJson(writer, customScalarAdapters, value.getTotalCount());
            writer.t0("sourceIdentifier");
            k8.g.toJson(writer, customScalarAdapters, value.getSourceIdentifier());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$Tag;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Tag;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Tag;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Tag;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Tag implements c8 {
        public static final Tag INSTANCE = new Tag();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "displayTitle", "normalizedTagSlug");

        private Tag() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.Tag fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
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
                } else if (iN0 == 2) {
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 3) {
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
                kng.L(reader, "id");
                throw null;
            }
            if (strQ3 != null) {
                return new GetPostStatsDetailsQuery.Tag(strQ, strQ2, str, strQ3);
            }
            kng.L(reader, "normalizedTagSlug");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.Tag value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("displayTitle");
            k8.g.toJson(writer, customScalarAdapters, value.getDisplayTitle());
            writer.t0("normalizedTagSlug");
            fa4Var.toJson(writer, customScalarAdapters, value.getNormalizedTagSlug());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/GetPostStatsDetailsQuery_ResponseAdapter$Total;", "Lc8;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Total;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Total;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Total;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Total implements c8 {
        public static final Total INSTANCE = new Total();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "currency", "nanos", "units");

        private Total() {
        }

        @Override // defpackage.c8
        public final GetPostStatsDetailsQuery.Total fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Currency currencyFromJson = null;
            Integer numValueOf = null;
            Integer numValueOf2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    currencyFromJson = CurrencyAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    fa4 fa4Var2 = k8.a;
                    numValueOf = Integer.valueOf(reader.nextInt());
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    fa4 fa4Var3 = k8.a;
                    numValueOf2 = Integer.valueOf(reader.nextInt());
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (currencyFromJson == null) {
                kng.L(reader, "currency");
                throw null;
            }
            if (numValueOf == null) {
                kng.L(reader, "nanos");
                throw null;
            }
            int iIntValue = numValueOf.intValue();
            if (numValueOf2 != null) {
                return new GetPostStatsDetailsQuery.Total(strQ, currencyFromJson, iIntValue, numValueOf2.intValue());
            }
            kng.L(reader, "units");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, GetPostStatsDetailsQuery.Total value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("currency");
            CurrencyAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getCurrency());
            writer.t0("nanos");
            uob uobVar = k8.b;
            uobVar.toJson(writer, customScalarAdapters, Integer.valueOf(value.getNanos()));
            writer.t0("units");
            uobVar.toJson(writer, customScalarAdapters, Integer.valueOf(value.getUnits()));
        }
    }

    private GetPostStatsDetailsQuery_ResponseAdapter() {
    }
}
