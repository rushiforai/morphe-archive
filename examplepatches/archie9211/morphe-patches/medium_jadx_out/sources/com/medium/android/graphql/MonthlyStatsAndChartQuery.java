package com.medium.android.graphql;

import androidx.work.impl.yX.VrhD;
import com.medium.android.graphql.adapter.MonthlyStatsAndChartQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.MonthlyStatsAndChartQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.MonthlyChartPostStatsPoint;
import com.medium.android.graphql.selections.MonthlyStatsAndChartQuerySelections;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.UserPostsAggregateStatsInput;
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
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0012\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\n./0123456-B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\nJ\u0010\u0010\u001d\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u001e¨\u00067"}, d2 = {"Lcom/medium/android/graphql/MonthlyStatsAndChartQuery;", "Luqa;", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Data;", "", "userId", "Lcom/medium/android/graphql/type/UserPostsAggregateStatsInput;", "input", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/UserPostsAggregateStatsInput;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lcom/medium/android/graphql/type/UserPostsAggregateStatsInput;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/UserPostsAggregateStatsInput;)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "Lcom/medium/android/graphql/type/UserPostsAggregateStatsInput;", "getInput", "Companion", "Data", "User", "PostsAggregateTimeseriesStats", "OnAggregatePostTimeseriesStats", "TotalStats", "Point", "PostsConnection", "Edge", "Node", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class MonthlyStatsAndChartQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "6edb7190784c21624fc76d65bca5501a9e444411355defeb6a15ae7df0fe16a3";
    public static final String OPERATION_NAME = "MonthlyStatsAndChartQuery";
    private final UserPostsAggregateStatsInput input;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$User;", "user", "<init>", "(Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$User;)V", "component1", "()Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$User;", "copy", "(Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$User;)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$User;", "getUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final User user;

        public Data(User user) {
            this.user = user;
        }

        public static Data copy$default(Data data, User user, int i, Object obj) {
            if ((i & 1) != 0) {
                user = data.user;
            }
            data.getClass();
            return new Data(user);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final User getUser() {
            return this.user;
        }

        public final Data copy(User user) {
            return new Data(user);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.user, ((Data) other).user);
        }

        public final User getUser() {
            return this.user;
        }

        public final int hashCode() {
            User user = this.user;
            if (user == null) {
                return 0;
            }
            return user.hashCode();
        }

        public final String toString() {
            return "Data(user=" + this.user + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Edge;", "", "__typename", "", "node", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Node;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Node;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Node;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Edge {
        private final String __typename;
        private final Node node;

        public Edge(String str, Node node) {
            str.getClass();
            node.getClass();
            this.__typename = str;
            this.node = node;
        }

        public static /* synthetic */ Edge copy$default(Edge edge, String str, Node node, int i, Object obj) {
            if ((i & 1) != 0) {
                str = edge.__typename;
            }
            if ((i & 2) != 0) {
                node = edge.node;
            }
            return edge.copy(str, node);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Node getNode() {
            return this.node;
        }

        public final Edge copy(String __typename, Node node) {
            __typename.getClass();
            node.getClass();
            return new Edge(__typename, node);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Edge)) {
                return false;
            }
            Edge edge = (Edge) other;
            return g76.L(this.__typename, edge.__typename) && g76.L(this.node, edge.node);
        }

        public final Node getNode() {
            return this.node;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.node.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Edge(__typename=" + this.__typename + ", node=" + this.node + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\fJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J.\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\n¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Node;", "", "__typename", "", "firstPublishedAt", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getFirstPublishedAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getId", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Node;", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node {
        private final String __typename;
        private final Long firstPublishedAt;
        private final String id;

        public Node(String str, Long l, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.firstPublishedAt = l;
            this.id = str2;
        }

        public static /* synthetic */ Node copy$default(Node node, String str, Long l, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node.__typename;
            }
            if ((i & 2) != 0) {
                l = node.firstPublishedAt;
            }
            if ((i & 4) != 0) {
                str2 = node.id;
            }
            return node.copy(str, l, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Long getFirstPublishedAt() {
            return this.firstPublishedAt;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Node copy(String __typename, Long firstPublishedAt, String id) {
            __typename.getClass();
            id.getClass();
            return new Node(__typename, firstPublishedAt, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node)) {
                return false;
            }
            Node node = (Node) other;
            return g76.L(this.__typename, node.__typename) && g76.L(this.firstPublishedAt, node.firstPublishedAt) && g76.L(this.id, node.id);
        }

        public final Long getFirstPublishedAt() {
            return this.firstPublishedAt;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Long l = this.firstPublishedAt;
            return this.id.hashCode() + ((iHashCode + (l == null ? 0 : l.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            Long l = this.firstPublishedAt;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("Node(__typename=");
            sb.append(str);
            sb.append(", firstPublishedAt=");
            sb.append(l);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$OnAggregatePostTimeseriesStats;", "", "totalStats", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$TotalStats;", "points", "", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Point;", "<init>", "(Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$TotalStats;Ljava/util/List;)V", "getTotalStats", "()Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$TotalStats;", "getPoints", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnAggregatePostTimeseriesStats {
        private final List<Point> points;
        private final TotalStats totalStats;

        public OnAggregatePostTimeseriesStats(TotalStats totalStats, List<Point> list) {
            totalStats.getClass();
            list.getClass();
            this.totalStats = totalStats;
            this.points = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnAggregatePostTimeseriesStats copy$default(OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats, TotalStats totalStats, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                totalStats = onAggregatePostTimeseriesStats.totalStats;
            }
            if ((i & 2) != 0) {
                list = onAggregatePostTimeseriesStats.points;
            }
            return onAggregatePostTimeseriesStats.copy(totalStats, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final TotalStats getTotalStats() {
            return this.totalStats;
        }

        public final List<Point> component2() {
            return this.points;
        }

        public final OnAggregatePostTimeseriesStats copy(TotalStats totalStats, List<Point> points) {
            totalStats.getClass();
            points.getClass();
            return new OnAggregatePostTimeseriesStats(totalStats, points);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnAggregatePostTimeseriesStats)) {
                return false;
            }
            OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats = (OnAggregatePostTimeseriesStats) other;
            return g76.L(this.totalStats, onAggregatePostTimeseriesStats.totalStats) && g76.L(this.points, onAggregatePostTimeseriesStats.points);
        }

        public final List<Point> getPoints() {
            return this.points;
        }

        public final TotalStats getTotalStats() {
            return this.totalStats;
        }

        public final int hashCode() {
            return this.points.hashCode() + (this.totalStats.hashCode() * 31);
        }

        public final String toString() {
            return "OnAggregatePostTimeseriesStats(totalStats=" + this.totalStats + ", points=" + this.points + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Point;", "", "__typename", "", "monthlyChartPostStatsPoint", "Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint;)V", "get__typename", "()Ljava/lang/String;", "getMonthlyChartPostStatsPoint", "()Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Point {
        private final String __typename;
        private final MonthlyChartPostStatsPoint monthlyChartPostStatsPoint;

        public Point(String str, MonthlyChartPostStatsPoint monthlyChartPostStatsPoint) {
            str.getClass();
            monthlyChartPostStatsPoint.getClass();
            this.__typename = str;
            this.monthlyChartPostStatsPoint = monthlyChartPostStatsPoint;
        }

        public static /* synthetic */ Point copy$default(Point point, String str, MonthlyChartPostStatsPoint monthlyChartPostStatsPoint, int i, Object obj) {
            if ((i & 1) != 0) {
                str = point.__typename;
            }
            if ((i & 2) != 0) {
                monthlyChartPostStatsPoint = point.monthlyChartPostStatsPoint;
            }
            return point.copy(str, monthlyChartPostStatsPoint);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MonthlyChartPostStatsPoint getMonthlyChartPostStatsPoint() {
            return this.monthlyChartPostStatsPoint;
        }

        public final Point copy(String __typename, MonthlyChartPostStatsPoint monthlyChartPostStatsPoint) {
            __typename.getClass();
            monthlyChartPostStatsPoint.getClass();
            return new Point(__typename, monthlyChartPostStatsPoint);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Point)) {
                return false;
            }
            Point point = (Point) other;
            return g76.L(this.__typename, point.__typename) && g76.L(this.monthlyChartPostStatsPoint, point.monthlyChartPostStatsPoint);
        }

        public final MonthlyChartPostStatsPoint getMonthlyChartPostStatsPoint() {
            return this.monthlyChartPostStatsPoint;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.monthlyChartPostStatsPoint.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return VrhD.nqvkTJXEpaCk + this.__typename + ", monthlyChartPostStatsPoint=" + this.monthlyChartPostStatsPoint + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsAggregateTimeseriesStats;", "", "__typename", "", "onAggregatePostTimeseriesStats", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$OnAggregatePostTimeseriesStats;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$OnAggregatePostTimeseriesStats;)V", "get__typename", "()Ljava/lang/String;", "getOnAggregatePostTimeseriesStats", "()Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$OnAggregatePostTimeseriesStats;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PostsAggregateTimeseriesStats {
        private final String __typename;
        private final OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats;

        public PostsAggregateTimeseriesStats(String str, OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats) {
            str.getClass();
            this.__typename = str;
            this.onAggregatePostTimeseriesStats = onAggregatePostTimeseriesStats;
        }

        public static /* synthetic */ PostsAggregateTimeseriesStats copy$default(PostsAggregateTimeseriesStats postsAggregateTimeseriesStats, String str, OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats, int i, Object obj) {
            if ((i & 1) != 0) {
                str = postsAggregateTimeseriesStats.__typename;
            }
            if ((i & 2) != 0) {
                onAggregatePostTimeseriesStats = postsAggregateTimeseriesStats.onAggregatePostTimeseriesStats;
            }
            return postsAggregateTimeseriesStats.copy(str, onAggregatePostTimeseriesStats);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnAggregatePostTimeseriesStats getOnAggregatePostTimeseriesStats() {
            return this.onAggregatePostTimeseriesStats;
        }

        public final PostsAggregateTimeseriesStats copy(String __typename, OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats) {
            __typename.getClass();
            return new PostsAggregateTimeseriesStats(__typename, onAggregatePostTimeseriesStats);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PostsAggregateTimeseriesStats)) {
                return false;
            }
            PostsAggregateTimeseriesStats postsAggregateTimeseriesStats = (PostsAggregateTimeseriesStats) other;
            return g76.L(this.__typename, postsAggregateTimeseriesStats.__typename) && g76.L(this.onAggregatePostTimeseriesStats, postsAggregateTimeseriesStats.onAggregatePostTimeseriesStats);
        }

        public final OnAggregatePostTimeseriesStats getOnAggregatePostTimeseriesStats() {
            return this.onAggregatePostTimeseriesStats;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats = this.onAggregatePostTimeseriesStats;
            return iHashCode + (onAggregatePostTimeseriesStats == null ? 0 : onAggregatePostTimeseriesStats.hashCode());
        }

        public final String toString() {
            return "PostsAggregateTimeseriesStats(__typename=" + this.__typename + ", onAggregatePostTimeseriesStats=" + this.onAggregatePostTimeseriesStats + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003J%\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0019\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsConnection;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Edge;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PostsConnection {
        private final String __typename;
        private final List<Edge> edges;

        public PostsConnection(String str, List<Edge> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ PostsConnection copy$default(PostsConnection postsConnection, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = postsConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = postsConnection.edges;
            }
            return postsConnection.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge> component2() {
            return this.edges;
        }

        public final PostsConnection copy(String __typename, List<Edge> edges) {
            __typename.getClass();
            edges.getClass();
            return new PostsConnection(__typename, edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PostsConnection)) {
                return false;
            }
            PostsConnection postsConnection = (PostsConnection) other;
            return g76.L(this.__typename, postsConnection.__typename) && g76.L(this.edges, postsConnection.edges);
        }

        public final List<Edge> getEdges() {
            return this.edges;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.edges.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("PostsConnection(__typename=", this.__typename, ", edges=", ")", this.edges);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0019\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B9\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0005\u0012\u0006\u0010\t\u001a\u00020\u0005¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0017\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000fJ\t\u0010\u0018\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0005HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0005HÆ\u0003J\t\u0010\u001b\u001a\u00020\u0005HÆ\u0003JL\u0010\u001c\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u00052\b\b\u0002\u0010\t\u001a\u00020\u0005HÆ\u0001¢\u0006\u0002\u0010\u001dJ\u0013\u0010\u001e\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\"HÖ\u0001J\t\u0010#\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u0010\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0011\u0010\u0007\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0012R\u0011\u0010\b\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0012R\u0011\u0010\t\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0012¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$TotalStats;", "", "__typename", "", "presentations", "", "viewers", "readers", "netFollowersGained", "netSubscribersGained", "<init>", "(Ljava/lang/String;Ljava/lang/Long;JJJJ)V", "get__typename", "()Ljava/lang/String;", "getPresentations", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getViewers", "()J", "getReaders", "getNetFollowersGained", "getNetSubscribersGained", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "(Ljava/lang/String;Ljava/lang/Long;JJJJ)Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$TotalStats;", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class TotalStats {
        private final String __typename;
        private final long netFollowersGained;
        private final long netSubscribersGained;
        private final Long presentations;
        private final long readers;
        private final long viewers;

        public TotalStats(String str, Long l, long j, long j2, long j3, long j4) {
            str.getClass();
            this.__typename = str;
            this.presentations = l;
            this.viewers = j;
            this.readers = j2;
            this.netFollowersGained = j3;
            this.netSubscribersGained = j4;
        }

        public static /* synthetic */ TotalStats copy$default(TotalStats totalStats, String str, Long l, long j, long j2, long j3, long j4, int i, Object obj) {
            if ((i & 1) != 0) {
                str = totalStats.__typename;
            }
            if ((i & 2) != 0) {
                l = totalStats.presentations;
            }
            if ((i & 4) != 0) {
                j = totalStats.viewers;
            }
            if ((i & 8) != 0) {
                j2 = totalStats.readers;
            }
            if ((i & 16) != 0) {
                j3 = totalStats.netFollowersGained;
            }
            if ((i & 32) != 0) {
                j4 = totalStats.netSubscribersGained;
            }
            long j5 = j4;
            long j6 = j3;
            long j7 = j2;
            return totalStats.copy(str, l, j, j7, j6, j5);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Long getPresentations() {
            return this.presentations;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final long getViewers() {
            return this.viewers;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final long getReaders() {
            return this.readers;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final long getNetFollowersGained() {
            return this.netFollowersGained;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final long getNetSubscribersGained() {
            return this.netSubscribersGained;
        }

        public final TotalStats copy(String __typename, Long presentations, long viewers, long readers, long netFollowersGained, long netSubscribersGained) {
            __typename.getClass();
            return new TotalStats(__typename, presentations, viewers, readers, netFollowersGained, netSubscribersGained);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof TotalStats)) {
                return false;
            }
            TotalStats totalStats = (TotalStats) other;
            return g76.L(this.__typename, totalStats.__typename) && g76.L(this.presentations, totalStats.presentations) && this.viewers == totalStats.viewers && this.readers == totalStats.readers && this.netFollowersGained == totalStats.netFollowersGained && this.netSubscribersGained == totalStats.netSubscribersGained;
        }

        public final long getNetFollowersGained() {
            return this.netFollowersGained;
        }

        public final long getNetSubscribersGained() {
            return this.netSubscribersGained;
        }

        public final Long getPresentations() {
            return this.presentations;
        }

        public final long getReaders() {
            return this.readers;
        }

        public final long getViewers() {
            return this.viewers;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Long l = this.presentations;
            int iHashCode2 = (iHashCode + (l == null ? 0 : l.hashCode())) * 31;
            long j = this.viewers;
            int i = (iHashCode2 + ((int) (j ^ (j >>> 32)))) * 31;
            long j2 = this.readers;
            int i2 = (i + ((int) (j2 ^ (j2 >>> 32)))) * 31;
            long j3 = this.netFollowersGained;
            int i3 = (i2 + ((int) (j3 ^ (j3 >>> 32)))) * 31;
            long j4 = this.netSubscribersGained;
            return i3 + ((int) (j4 ^ (j4 >>> 32)));
        }

        public final String toString() {
            String str = this.__typename;
            Long l = this.presentations;
            long j = this.viewers;
            long j2 = this.readers;
            long j3 = this.netFollowersGained;
            long j4 = this.netSubscribersGained;
            StringBuilder sb = new StringBuilder("TotalStats(__typename=");
            sb.append(str);
            sb.append(", presentations=");
            sb.append(l);
            sb.append(", viewers=");
            sb.append(j);
            wgd.y(sb, ", readers=", j2, ", netFollowersGained=");
            sb.append(j3);
            sb.append(", netSubscribersGained=");
            sb.append(j4);
            sb.append(")");
            return sb.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\u0003¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0007HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J1\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J\t\u0010\u001c\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\f¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$User;", "", "__typename", "", "postsAggregateTimeseriesStats", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsAggregateTimeseriesStats;", "postsConnection", "Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsConnection;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsAggregateTimeseriesStats;Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsConnection;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getPostsAggregateTimeseriesStats", "()Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsAggregateTimeseriesStats;", "getPostsConnection", "()Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$PostsConnection;", "getId", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User {
        private final String __typename;
        private final String id;
        private final PostsAggregateTimeseriesStats postsAggregateTimeseriesStats;
        private final PostsConnection postsConnection;

        public User(String str, PostsAggregateTimeseriesStats postsAggregateTimeseriesStats, PostsConnection postsConnection, String str2) {
            str.getClass();
            postsAggregateTimeseriesStats.getClass();
            postsConnection.getClass();
            str2.getClass();
            this.__typename = str;
            this.postsAggregateTimeseriesStats = postsAggregateTimeseriesStats;
            this.postsConnection = postsConnection;
            this.id = str2;
        }

        public static /* synthetic */ User copy$default(User user, String str, PostsAggregateTimeseriesStats postsAggregateTimeseriesStats, PostsConnection postsConnection, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user.__typename;
            }
            if ((i & 2) != 0) {
                postsAggregateTimeseriesStats = user.postsAggregateTimeseriesStats;
            }
            if ((i & 4) != 0) {
                postsConnection = user.postsConnection;
            }
            if ((i & 8) != 0) {
                str2 = user.id;
            }
            return user.copy(str, postsAggregateTimeseriesStats, postsConnection, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PostsAggregateTimeseriesStats getPostsAggregateTimeseriesStats() {
            return this.postsAggregateTimeseriesStats;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PostsConnection getPostsConnection() {
            return this.postsConnection;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final User copy(String __typename, PostsAggregateTimeseriesStats postsAggregateTimeseriesStats, PostsConnection postsConnection, String id) {
            __typename.getClass();
            postsAggregateTimeseriesStats.getClass();
            postsConnection.getClass();
            id.getClass();
            return new User(__typename, postsAggregateTimeseriesStats, postsConnection, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User)) {
                return false;
            }
            User user = (User) other;
            return g76.L(this.__typename, user.__typename) && g76.L(this.postsAggregateTimeseriesStats, user.postsAggregateTimeseriesStats) && g76.L(this.postsConnection, user.postsConnection) && g76.L(this.id, user.id);
        }

        public final String getId() {
            return this.id;
        }

        public final PostsAggregateTimeseriesStats getPostsAggregateTimeseriesStats() {
            return this.postsAggregateTimeseriesStats;
        }

        public final PostsConnection getPostsConnection() {
            return this.postsConnection;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.postsConnection.hashCode() + ((this.postsAggregateTimeseriesStats.hashCode() + (this.__typename.hashCode() * 31)) * 31)) * 31);
        }

        public final String toString() {
            return "User(__typename=" + this.__typename + ", postsAggregateTimeseriesStats=" + this.postsAggregateTimeseriesStats + ", postsConnection=" + this.postsConnection + ", id=" + this.id + ")";
        }
    }

    public MonthlyStatsAndChartQuery(String str, UserPostsAggregateStatsInput userPostsAggregateStatsInput) {
        str.getClass();
        userPostsAggregateStatsInput.getClass();
        this.userId = str;
        this.input = userPostsAggregateStatsInput;
    }

    public static /* synthetic */ MonthlyStatsAndChartQuery copy$default(MonthlyStatsAndChartQuery monthlyStatsAndChartQuery, String str, UserPostsAggregateStatsInput userPostsAggregateStatsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            str = monthlyStatsAndChartQuery.userId;
        }
        if ((i & 2) != 0) {
            userPostsAggregateStatsInput = monthlyStatsAndChartQuery.input;
        }
        return monthlyStatsAndChartQuery.copy(str, userPostsAggregateStatsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(MonthlyStatsAndChartQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final UserPostsAggregateStatsInput getInput() {
        return this.input;
    }

    public final MonthlyStatsAndChartQuery copy(String userId, UserPostsAggregateStatsInput input) {
        userId.getClass();
        input.getClass();
        return new MonthlyStatsAndChartQuery(userId, input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query MonthlyStatsAndChartQuery($userId: ID!, $input: UserPostsAggregateStatsInput!) { user(id: $userId) { __typename postsAggregateTimeseriesStats(input: $input) { __typename ... on AggregatePostTimeseriesStats { totalStats { __typename presentations viewers readers netFollowersGained netSubscribersGained } points { __typename ...MonthlyChartPostStatsPoint } } } postsConnection(first: 25, after: \"\", orderBy: { publishedAt: ASC } , filter: { published: true } ) { __typename edges { __typename node { __typename firstPublishedAt id } } } id } }  fragment MonthlyChartPostStatsPoint on PostStatsPoint { __typename timestamp stats { __typename total { __typename viewers readers } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MonthlyStatsAndChartQuery)) {
            return false;
        }
        MonthlyStatsAndChartQuery monthlyStatsAndChartQuery = (MonthlyStatsAndChartQuery) other;
        return g76.L(this.userId, monthlyStatsAndChartQuery.userId) && g76.L(this.input, monthlyStatsAndChartQuery.input);
    }

    public final UserPostsAggregateStatsInput getInput() {
        return this.input;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.input.hashCode() + (this.userId.hashCode() * 31);
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
        List<sx1> list = MonthlyStatsAndChartQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        MonthlyStatsAndChartQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "MonthlyStatsAndChartQuery(userId=" + this.userId + ", input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/MonthlyStatsAndChartQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query MonthlyStatsAndChartQuery($userId: ID!, $input: UserPostsAggregateStatsInput!) { user(id: $userId) { __typename postsAggregateTimeseriesStats(input: $input) { __typename ... on AggregatePostTimeseriesStats { totalStats { __typename presentations viewers readers netFollowersGained netSubscribersGained } points { __typename ...MonthlyChartPostStatsPoint } } } postsConnection(first: 25, after: \"\", orderBy: { publishedAt: ASC } , filter: { published: true } ) { __typename edges { __typename node { __typename firstPublishedAt id } } } id } }  fragment MonthlyChartPostStatsPoint on PostStatsPoint { __typename timestamp stats { __typename total { __typename viewers readers } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
