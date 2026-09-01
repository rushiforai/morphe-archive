package com.medium.android.graphql.adapter;

import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.medium.android.explore.ui.vAWg.OphtYB;
import com.medium.android.graphql.MonthlyStatsAndChartQuery;
import com.medium.android.graphql.fragment.MonthlyChartPostStatsPoint;
import com.medium.android.graphql.fragment.MonthlyChartPostStatsPointImpl_ResponseAdapter;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
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
import defpackage.xl8;
import defpackage.ygf;
import defpackage.yl2;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\f\bÆ\u0002\u0018\u00002\u00020\u0001:\t\u0004\u0005\u0006\u0007\b\t\n\u000b\fB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\r"}, d2 = {"Lcom/medium/android/graphql/adapter/MonthlyStatsAndChartQuery_ResponseAdapter;", "", "<init>", "()V", "Data", "User", "PostsAggregateTimeseriesStats", "OnAggregatePostTimeseriesStats", "TotalStats", "Point", "PostsConnection", "Edge", "Node", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MonthlyStatsAndChartQuery_ResponseAdapter {
    public static final MonthlyStatsAndChartQuery_ResponseAdapter INSTANCE = new MonthlyStatsAndChartQuery_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MonthlyStatsAndChartQuery_ResponseAdapter$Data;", "Lc8;", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Data;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Data;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Data;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Data implements c8 {
        public static final Data INSTANCE = new Data();
        private static final List<String> RESPONSE_NAMES = d46.Q("user");

        private Data() {
        }

        @Override // defpackage.c8
        public final MonthlyStatsAndChartQuery.Data fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            MonthlyStatsAndChartQuery.User user = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                sv0 sv0VarC = k8.c(User.INSTANCE, false);
                if (reader.peek() == cd6.NULL) {
                    reader.v();
                    objFromJson = null;
                } else {
                    objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                }
                user = (MonthlyStatsAndChartQuery.User) objFromJson;
            }
            return new MonthlyStatsAndChartQuery.Data(user);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MonthlyStatsAndChartQuery.Data value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("user");
            sv0 sv0VarC = k8.c(User.INSTANCE, false);
            MonthlyStatsAndChartQuery.User user = value.getUser();
            if (user == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, user);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MonthlyStatsAndChartQuery_ResponseAdapter$Edge;", "Lc8;", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Edge;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Edge;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Edge;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Edge implements c8 {
        public static final Edge INSTANCE = new Edge();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "node");

        private Edge() {
        }

        @Override // defpackage.c8
        public final MonthlyStatsAndChartQuery.Edge fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            MonthlyStatsAndChartQuery.Node node = null;
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
                    node = (MonthlyStatsAndChartQuery.Node) k8.c(Node.INSTANCE, false).fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (node != null) {
                return new MonthlyStatsAndChartQuery.Edge(strQ, node);
            }
            kng.L(reader, "node");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MonthlyStatsAndChartQuery.Edge value) {
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
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MonthlyStatsAndChartQuery_ResponseAdapter$Node;", "Lc8;", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Node;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Node;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Node;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Node implements c8 {
        public static final Node INSTANCE = new Node();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", OphtYB.xoNnzUo, "id");

        private Node() {
        }

        @Override // defpackage.c8
        public final MonthlyStatsAndChartQuery.Node fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Long lValueOf = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    dq1 dq1Var = k8.d;
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        lValueOf = null;
                    } else {
                        lValueOf = Long.valueOf(reader.nextLong());
                    }
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new MonthlyStatsAndChartQuery.Node(strQ, lValueOf, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MonthlyStatsAndChartQuery.Node value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("firstPublishedAt");
            dq1 dq1Var = k8.d;
            Long firstPublishedAt = value.getFirstPublishedAt();
            if (firstPublishedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, firstPublishedAt);
            }
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MonthlyStatsAndChartQuery_ResponseAdapter$Point;", "Lc8;", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Point;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Point;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Point;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Point implements c8 {
        public static final Point INSTANCE = new Point();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private Point() {
        }

        @Override // defpackage.c8
        public final MonthlyStatsAndChartQuery.Point fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            reader.j();
            MonthlyChartPostStatsPoint monthlyChartPostStatsPointFromJson = MonthlyChartPostStatsPointImpl_ResponseAdapter.MonthlyChartPostStatsPoint.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ != null) {
                return new MonthlyStatsAndChartQuery.Point(strQ, monthlyChartPostStatsPointFromJson);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MonthlyStatsAndChartQuery.Point value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            MonthlyChartPostStatsPointImpl_ResponseAdapter.MonthlyChartPostStatsPoint.INSTANCE.toJson(writer, customScalarAdapters, value.getMonthlyChartPostStatsPoint());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MonthlyStatsAndChartQuery_ResponseAdapter$PostsAggregateTimeseriesStats;", "Lc8;", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsAggregateTimeseriesStats;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsAggregateTimeseriesStats;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsAggregateTimeseriesStats;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PostsAggregateTimeseriesStats implements c8 {
        public static final PostsAggregateTimeseriesStats INSTANCE = new PostsAggregateTimeseriesStats();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private PostsAggregateTimeseriesStats() {
        }

        @Override // defpackage.c8
        public final MonthlyStatsAndChartQuery.PostsAggregateTimeseriesStats fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            MonthlyStatsAndChartQuery.OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStatsFromJson = null;
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
            if (dm2.B(dm2.Q("AggregatePostTimeseriesStats"), customScalarAdapters.a, strQ, customScalarAdapters.b)) {
                reader.j();
                onAggregatePostTimeseriesStatsFromJson = OnAggregatePostTimeseriesStats.INSTANCE.fromJson(reader, customScalarAdapters);
            }
            return new MonthlyStatsAndChartQuery.PostsAggregateTimeseriesStats(strQ, onAggregatePostTimeseriesStatsFromJson);
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MonthlyStatsAndChartQuery.PostsAggregateTimeseriesStats value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            if (value.getOnAggregatePostTimeseriesStats() != null) {
                OnAggregatePostTimeseriesStats.INSTANCE.toJson(writer, customScalarAdapters, value.getOnAggregatePostTimeseriesStats());
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MonthlyStatsAndChartQuery_ResponseAdapter$PostsConnection;", "Lc8;", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsConnection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsConnection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsConnection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PostsConnection implements c8 {
        public static final PostsConnection INSTANCE = new PostsConnection();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "edges");

        private PostsConnection() {
        }

        @Override // defpackage.c8
        public final MonthlyStatsAndChartQuery.PostsConnection fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            ArrayList arrayList = null;
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
                    sv0 sv0VarC = k8.c(Edge.INSTANCE, false);
                    ArrayList arrayListE = ev6.E(reader);
                    while (reader.hasNext()) {
                        try {
                            if (reader.peek() == cd6.NULL) {
                                reader.v();
                                objFromJson = null;
                            } else {
                                objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                            }
                            arrayListE.add(objFromJson);
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
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (arrayList != null) {
                return new MonthlyStatsAndChartQuery.PostsConnection(strQ, arrayList);
            }
            kng.L(reader, "edges");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MonthlyStatsAndChartQuery.PostsConnection value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("edges");
            xl8 xl8Var = new xl8(k8.c(Edge.INSTANCE, false));
            List<MonthlyStatsAndChartQuery.Edge> edges = value.getEdges();
            edges.getClass();
            writer.n();
            Iterator<T> it2 = edges.iterator();
            while (it2.hasNext()) {
                xl8Var.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MonthlyStatsAndChartQuery_ResponseAdapter$TotalStats;", "Lc8;", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$TotalStats;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$TotalStats;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$TotalStats;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class TotalStats implements c8 {
        public static final TotalStats INSTANCE = new TotalStats();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "presentations", "viewers", "readers", "netFollowersGained", "netSubscribersGained");

        private TotalStats() {
        }

        @Override // defpackage.c8
        public final MonthlyStatsAndChartQuery.TotalStats fromJson(fd6 reader, yl2 customScalarAdapters) {
            Long l;
            Long l2;
            reader.getClass();
            customScalarAdapters.getClass();
            Long lValueOf = null;
            Long lValueOf2 = null;
            String strQ = null;
            Long lValueOf3 = null;
            Long lValueOf4 = null;
            Long lValueOf5 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 != 0) {
                    if (iN0 == 1) {
                        Long l3 = lValueOf2;
                        l = lValueOf4;
                        l2 = lValueOf5;
                        dq1 dq1Var = k8.d;
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            lValueOf3 = null;
                        } else {
                            lValueOf3 = Long.valueOf(reader.nextLong());
                        }
                        lValueOf2 = l3;
                    } else if (iN0 == 2) {
                        l = lValueOf4;
                        l2 = lValueOf5;
                        fa4 fa4Var = k8.a;
                        lValueOf = Long.valueOf(reader.nextLong());
                    } else if (iN0 == 3) {
                        l = lValueOf4;
                        l2 = lValueOf5;
                        fa4 fa4Var2 = k8.a;
                        lValueOf2 = Long.valueOf(reader.nextLong());
                    } else if (iN0 == 4) {
                        Long l4 = lValueOf2;
                        l2 = lValueOf5;
                        fa4 fa4Var3 = k8.a;
                        lValueOf4 = Long.valueOf(reader.nextLong());
                        lValueOf2 = l4;
                        lValueOf5 = l2;
                    } else {
                        if (iN0 != 5) {
                            break;
                        }
                        Long l5 = lValueOf2;
                        fa4 fa4Var4 = k8.a;
                        lValueOf5 = Long.valueOf(reader.nextLong());
                        lValueOf2 = l5;
                        lValueOf4 = lValueOf4;
                    }
                    lValueOf4 = l;
                    lValueOf5 = l2;
                } else {
                    Long l6 = lValueOf2;
                    fa4 fa4Var5 = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                    lValueOf2 = l6;
                }
            }
            Long l7 = lValueOf2;
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (lValueOf == null) {
                kng.L(reader, "viewers");
                throw null;
            }
            Long l8 = lValueOf4;
            Long l9 = lValueOf5;
            long jLongValue = lValueOf.longValue();
            if (l7 == null) {
                kng.L(reader, "readers");
                throw null;
            }
            long jLongValue2 = l7.longValue();
            if (l8 == null) {
                kng.L(reader, "netFollowersGained");
                throw null;
            }
            long jLongValue3 = l8.longValue();
            if (l9 != null) {
                return new MonthlyStatsAndChartQuery.TotalStats(strQ, lValueOf3, jLongValue, jLongValue2, jLongValue3, l9.longValue());
            }
            kng.L(reader, "netSubscribersGained");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MonthlyStatsAndChartQuery.TotalStats value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("presentations");
            dq1 dq1Var = k8.d;
            Long presentations = value.getPresentations();
            if (presentations == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, presentations);
            }
            writer.t0("viewers");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getViewers()));
            writer.t0("readers");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getReaders()));
            writer.t0("netFollowersGained");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getNetFollowersGained()));
            writer.t0("netSubscribersGained");
            dq1Var.toJson(writer, customScalarAdapters, Long.valueOf(value.getNetSubscribersGained()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MonthlyStatsAndChartQuery_ResponseAdapter$User;", "Lc8;", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$User;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$User;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$User;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class User implements c8 {
        public static final User INSTANCE = new User();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "postsAggregateTimeseriesStats", "postsConnection", "id");

        private User() {
        }

        @Override // defpackage.c8
        public final MonthlyStatsAndChartQuery.User fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            MonthlyStatsAndChartQuery.PostsAggregateTimeseriesStats postsAggregateTimeseriesStats = null;
            MonthlyStatsAndChartQuery.PostsConnection postsConnection = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    postsAggregateTimeseriesStats = (MonthlyStatsAndChartQuery.PostsAggregateTimeseriesStats) k8.c(PostsAggregateTimeseriesStats.INSTANCE, true).fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    postsConnection = (MonthlyStatsAndChartQuery.PostsConnection) k8.c(PostsConnection.INSTANCE, false).fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (postsAggregateTimeseriesStats == null) {
                kng.L(reader, "postsAggregateTimeseriesStats");
                throw null;
            }
            if (postsConnection == null) {
                kng.L(reader, "postsConnection");
                throw null;
            }
            if (strQ2 != null) {
                return new MonthlyStatsAndChartQuery.User(strQ, postsAggregateTimeseriesStats, postsConnection, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MonthlyStatsAndChartQuery.User value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("postsAggregateTimeseriesStats");
            k8.c(PostsAggregateTimeseriesStats.INSTANCE, true).toJson(writer, customScalarAdapters, value.getPostsAggregateTimeseriesStats());
            writer.t0("postsConnection");
            k8.c(PostsConnection.INSTANCE, false).toJson(writer, customScalarAdapters, value.getPostsConnection());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    private MonthlyStatsAndChartQuery_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/adapter/MonthlyStatsAndChartQuery_ResponseAdapter$OnAggregatePostTimeseriesStats;", "Lc8;", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$OnAggregatePostTimeseriesStats;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$OnAggregatePostTimeseriesStats;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$OnAggregatePostTimeseriesStats;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class OnAggregatePostTimeseriesStats implements c8 {
        public static final OnAggregatePostTimeseriesStats INSTANCE = new OnAggregatePostTimeseriesStats();
        private static final List<String> RESPONSE_NAMES = d46.R("totalStats", "points");

        private OnAggregatePostTimeseriesStats() {
        }

        @Override // defpackage.c8
        public final MonthlyStatsAndChartQuery.OnAggregatePostTimeseriesStats fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            MonthlyStatsAndChartQuery.TotalStats totalStats = null;
            ArrayList arrayList = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    totalStats = (MonthlyStatsAndChartQuery.TotalStats) k8.c(TotalStats.INSTANCE, false).fromJson(reader, customScalarAdapters);
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    sv0 sv0VarC = k8.c(Point.INSTANCE, true);
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
            }
            if (totalStats == null) {
                kng.L(reader, "totalStats");
                throw null;
            }
            if (arrayList != null) {
                return new MonthlyStatsAndChartQuery.OnAggregatePostTimeseriesStats(totalStats, arrayList);
            }
            kng.L(reader, "points");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, MonthlyStatsAndChartQuery.OnAggregatePostTimeseriesStats value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("totalStats");
            k8.c(TotalStats.INSTANCE, false).toJson(writer, customScalarAdapters, value.getTotalStats());
            writer.t0(mgKMENwrbHf.sQHl);
            sv0 sv0VarC = k8.c(Point.INSTANCE, true);
            List<MonthlyStatsAndChartQuery.Point> points = value.getPoints();
            points.getClass();
            writer.n();
            Iterator<T> it2 = points.iterator();
            while (it2.hasNext()) {
                sv0VarC.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
        }
    }
}
