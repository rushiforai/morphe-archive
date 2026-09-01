package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PubMonthlyStatsAndChartQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PubMonthlyStatsAndChartQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.MonthlyChartPostStatsPoint;
import com.medium.android.graphql.selections.PubMonthlyStatsAndChartQuerySelections;
import com.medium.android.graphql.type.PublicationAggregateStatsInput;
import com.medium.android.graphql.type.PublicationRef;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ho2;
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
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0013\b\u0086\b\u0018\u0000 /2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u000b0123456789/B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\n\u001a\u00020\tH\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\tH\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\tH\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J$\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\tHÖ\u0001¢\u0006\u0004\b#\u0010\u000bJ\u0010\u0010%\u001a\u00020$HÖ\u0001¢\u0006\u0004\b%\u0010&J\u001a\u0010)\u001a\u00020\u00122\b\u0010(\u001a\u0004\u0018\u00010'HÖ\u0003¢\u0006\u0004\b)\u0010*R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010+\u001a\u0004\b,\u0010\u001eR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010-\u001a\u0004\b.\u0010 ¨\u0006:"}, d2 = {"Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery;", "Luqa;", "Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$Data;", "Lcom/medium/android/graphql/type/PublicationRef;", "ref", "Lcom/medium/android/graphql/type/PublicationAggregateStatsInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/PublicationRef;Lcom/medium/android/graphql/type/PublicationAggregateStatsInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/PublicationRef;", "component2", "()Lcom/medium/android/graphql/type/PublicationAggregateStatsInput;", "copy", "(Lcom/medium/android/graphql/type/PublicationRef;Lcom/medium/android/graphql/type/PublicationAggregateStatsInput;)Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/PublicationRef;", "getRef", "Lcom/medium/android/graphql/type/PublicationAggregateStatsInput;", "getInput", "Companion", "Data", "PublicationAggregateStats", "OnPublicationAggregateTimeseriesStatsResponse", "OnAggregatePostTimeseriesStats", "TotalStats", "Point", "OnUnauthorized", "PublicationByRef", "PublicationPostsConnection", "Edge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PubMonthlyStatsAndChartQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "9da2dd045057a32bf3b83a9449ca398818faab8df84852f91207d4b2b9834ce1";
    public static final String OPERATION_NAME = "PubMonthlyStatsAndChartQuery";
    private final PublicationAggregateStatsInput input;
    private final PublicationRef ref;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0012\u0010\n\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ&\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\tR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001c\u0010\u000b¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationAggregateStats;", "publicationAggregateStats", "Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationByRef;", "publicationByRef", "<init>", "(Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationAggregateStats;Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationByRef;)V", "component1", "()Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationAggregateStats;", "component2", "()Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationByRef;", "copy", "(Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationAggregateStats;Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationByRef;)Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationAggregateStats;", "getPublicationAggregateStats", "Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationByRef;", "getPublicationByRef", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final PublicationAggregateStats publicationAggregateStats;
        private final PublicationByRef publicationByRef;

        public Data(PublicationAggregateStats publicationAggregateStats, PublicationByRef publicationByRef) {
            publicationAggregateStats.getClass();
            this.publicationAggregateStats = publicationAggregateStats;
            this.publicationByRef = publicationByRef;
        }

        public static /* synthetic */ Data copy$default(Data data, PublicationAggregateStats publicationAggregateStats, PublicationByRef publicationByRef, int i, Object obj) {
            if ((i & 1) != 0) {
                publicationAggregateStats = data.publicationAggregateStats;
            }
            if ((i & 2) != 0) {
                publicationByRef = data.publicationByRef;
            }
            return data.copy(publicationAggregateStats, publicationByRef);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final PublicationAggregateStats getPublicationAggregateStats() {
            return this.publicationAggregateStats;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PublicationByRef getPublicationByRef() {
            return this.publicationByRef;
        }

        public final Data copy(PublicationAggregateStats publicationAggregateStats, PublicationByRef publicationByRef) {
            publicationAggregateStats.getClass();
            return new Data(publicationAggregateStats, publicationByRef);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Data)) {
                return false;
            }
            Data data = (Data) other;
            return g76.L(this.publicationAggregateStats, data.publicationAggregateStats) && g76.L(this.publicationByRef, data.publicationByRef);
        }

        public final PublicationAggregateStats getPublicationAggregateStats() {
            return this.publicationAggregateStats;
        }

        public final PublicationByRef getPublicationByRef() {
            return this.publicationByRef;
        }

        public final int hashCode() {
            int iHashCode = this.publicationAggregateStats.hashCode() * 31;
            PublicationByRef publicationByRef = this.publicationByRef;
            return iHashCode + (publicationByRef == null ? 0 : publicationByRef.hashCode());
        }

        public final String toString() {
            return "Data(publicationAggregateStats=" + this.publicationAggregateStats + ", publicationByRef=" + this.publicationByRef + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$Edge;", "", "__typename", "", "listedAt", "", "<init>", "(Ljava/lang/String;J)V", "get__typename", "()Ljava/lang/String;", "getListedAt", "()J", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Edge {
        private final String __typename;
        private final long listedAt;

        public Edge(String str, long j) {
            str.getClass();
            this.__typename = str;
            this.listedAt = j;
        }

        public static /* synthetic */ Edge copy$default(Edge edge, String str, long j, int i, Object obj) {
            if ((i & 1) != 0) {
                str = edge.__typename;
            }
            if ((i & 2) != 0) {
                j = edge.listedAt;
            }
            return edge.copy(str, j);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final long getListedAt() {
            return this.listedAt;
        }

        public final Edge copy(String __typename, long listedAt) {
            __typename.getClass();
            return new Edge(__typename, listedAt);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Edge)) {
                return false;
            }
            Edge edge = (Edge) other;
            return g76.L(this.__typename, edge.__typename) && this.listedAt == edge.listedAt;
        }

        public final long getListedAt() {
            return this.listedAt;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            long j = this.listedAt;
            return iHashCode + ((int) (j ^ (j >>> 32)));
        }

        public final String toString() {
            StringBuilder sbI = ho2.I(this.listedAt, "Edge(__typename=", this.__typename, ", listedAt=");
            sbI.append(")");
            return sbI.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$OnAggregatePostTimeseriesStats;", "", "totalStats", "Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$TotalStats;", "points", "", "Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$Point;", "<init>", "(Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$TotalStats;Ljava/util/List;)V", "getTotalStats", "()Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$TotalStats;", "getPoints", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$OnPublicationAggregateTimeseriesStatsResponse;", "", "onAggregatePostTimeseriesStats", "Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$OnAggregatePostTimeseriesStats;", "<init>", "(Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$OnAggregatePostTimeseriesStats;)V", "getOnAggregatePostTimeseriesStats", "()Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$OnAggregatePostTimeseriesStats;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPublicationAggregateTimeseriesStatsResponse {
        private final OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats;

        public OnPublicationAggregateTimeseriesStatsResponse(OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats) {
            this.onAggregatePostTimeseriesStats = onAggregatePostTimeseriesStats;
        }

        public static OnPublicationAggregateTimeseriesStatsResponse copy$default(OnPublicationAggregateTimeseriesStatsResponse onPublicationAggregateTimeseriesStatsResponse, OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats, int i, Object obj) {
            if ((i & 1) != 0) {
                onAggregatePostTimeseriesStats = onPublicationAggregateTimeseriesStatsResponse.onAggregatePostTimeseriesStats;
            }
            onPublicationAggregateTimeseriesStatsResponse.getClass();
            return new OnPublicationAggregateTimeseriesStatsResponse(onAggregatePostTimeseriesStats);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final OnAggregatePostTimeseriesStats getOnAggregatePostTimeseriesStats() {
            return this.onAggregatePostTimeseriesStats;
        }

        public final OnPublicationAggregateTimeseriesStatsResponse copy(OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats) {
            return new OnPublicationAggregateTimeseriesStatsResponse(onAggregatePostTimeseriesStats);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnPublicationAggregateTimeseriesStatsResponse) && g76.L(this.onAggregatePostTimeseriesStats, ((OnPublicationAggregateTimeseriesStatsResponse) other).onAggregatePostTimeseriesStats);
        }

        public final OnAggregatePostTimeseriesStats getOnAggregatePostTimeseriesStats() {
            return this.onAggregatePostTimeseriesStats;
        }

        public final int hashCode() {
            OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats = this.onAggregatePostTimeseriesStats;
            if (onAggregatePostTimeseriesStats == null) {
                return 0;
            }
            return onAggregatePostTimeseriesStats.hashCode();
        }

        public final String toString() {
            return "OnPublicationAggregateTimeseriesStatsResponse(onAggregatePostTimeseriesStats=" + this.onAggregatePostTimeseriesStats + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$OnUnauthorized;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUnauthorized {
        private final String message;

        public OnUnauthorized(String str) {
            this.message = str;
        }

        public static OnUnauthorized copy$default(OnUnauthorized onUnauthorized, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onUnauthorized.message;
            }
            onUnauthorized.getClass();
            return new OnUnauthorized(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnUnauthorized copy(String message) {
            return new OnUnauthorized(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnUnauthorized) && g76.L(this.message, ((OnUnauthorized) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnUnauthorized(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$Point;", "", "__typename", "", "monthlyChartPostStatsPoint", "Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint;)V", "get__typename", "()Ljava/lang/String;", "getMonthlyChartPostStatsPoint", "()Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
            return "Point(__typename=" + this.__typename + ", monthlyChartPostStatsPoint=" + this.monthlyChartPostStatsPoint + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J)\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationAggregateStats;", "", "__typename", "", "onPublicationAggregateTimeseriesStatsResponse", "Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$OnPublicationAggregateTimeseriesStatsResponse;", "onUnauthorized", "Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$OnUnauthorized;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$OnPublicationAggregateTimeseriesStatsResponse;Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$OnUnauthorized;)V", "get__typename", "()Ljava/lang/String;", "getOnPublicationAggregateTimeseriesStatsResponse", "()Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$OnPublicationAggregateTimeseriesStatsResponse;", "getOnUnauthorized", "()Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$OnUnauthorized;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PublicationAggregateStats {
        private final String __typename;
        private final OnPublicationAggregateTimeseriesStatsResponse onPublicationAggregateTimeseriesStatsResponse;
        private final OnUnauthorized onUnauthorized;

        public PublicationAggregateStats(String str, OnPublicationAggregateTimeseriesStatsResponse onPublicationAggregateTimeseriesStatsResponse, OnUnauthorized onUnauthorized) {
            str.getClass();
            onPublicationAggregateTimeseriesStatsResponse.getClass();
            this.__typename = str;
            this.onPublicationAggregateTimeseriesStatsResponse = onPublicationAggregateTimeseriesStatsResponse;
            this.onUnauthorized = onUnauthorized;
        }

        public static /* synthetic */ PublicationAggregateStats copy$default(PublicationAggregateStats publicationAggregateStats, String str, OnPublicationAggregateTimeseriesStatsResponse onPublicationAggregateTimeseriesStatsResponse, OnUnauthorized onUnauthorized, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publicationAggregateStats.__typename;
            }
            if ((i & 2) != 0) {
                onPublicationAggregateTimeseriesStatsResponse = publicationAggregateStats.onPublicationAggregateTimeseriesStatsResponse;
            }
            if ((i & 4) != 0) {
                onUnauthorized = publicationAggregateStats.onUnauthorized;
            }
            return publicationAggregateStats.copy(str, onPublicationAggregateTimeseriesStatsResponse, onUnauthorized);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPublicationAggregateTimeseriesStatsResponse getOnPublicationAggregateTimeseriesStatsResponse() {
            return this.onPublicationAggregateTimeseriesStatsResponse;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final PublicationAggregateStats copy(String __typename, OnPublicationAggregateTimeseriesStatsResponse onPublicationAggregateTimeseriesStatsResponse, OnUnauthorized onUnauthorized) {
            __typename.getClass();
            onPublicationAggregateTimeseriesStatsResponse.getClass();
            return new PublicationAggregateStats(__typename, onPublicationAggregateTimeseriesStatsResponse, onUnauthorized);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PublicationAggregateStats)) {
                return false;
            }
            PublicationAggregateStats publicationAggregateStats = (PublicationAggregateStats) other;
            return g76.L(this.__typename, publicationAggregateStats.__typename) && g76.L(this.onPublicationAggregateTimeseriesStatsResponse, publicationAggregateStats.onPublicationAggregateTimeseriesStatsResponse) && g76.L(this.onUnauthorized, publicationAggregateStats.onUnauthorized);
        }

        public final OnPublicationAggregateTimeseriesStatsResponse getOnPublicationAggregateTimeseriesStatsResponse() {
            return this.onPublicationAggregateTimeseriesStatsResponse;
        }

        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = (this.onPublicationAggregateTimeseriesStatsResponse.hashCode() + (this.__typename.hashCode() * 31)) * 31;
            OnUnauthorized onUnauthorized = this.onUnauthorized;
            return iHashCode + (onUnauthorized == null ? 0 : onUnauthorized.hashCode());
        }

        public final String toString() {
            return "PublicationAggregateStats(__typename=" + this.__typename + ", onPublicationAggregateTimeseriesStatsResponse=" + this.onPublicationAggregateTimeseriesStatsResponse + ", onUnauthorized=" + this.onUnauthorized + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0007HÆ\u0003J1\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0007HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationByRef;", "", "__typename", "", "id", "name", "publicationPostsConnection", "Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationPostsConnection;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationPostsConnection;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getPublicationPostsConnection", "()Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationPostsConnection;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PublicationByRef {
        private final String __typename;
        private final String id;
        private final String name;
        private final PublicationPostsConnection publicationPostsConnection;

        public PublicationByRef(String str, String str2, String str3, PublicationPostsConnection publicationPostsConnection) {
            str.getClass();
            str2.getClass();
            str3.getClass();
            publicationPostsConnection.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.publicationPostsConnection = publicationPostsConnection;
        }

        public static /* synthetic */ PublicationByRef copy$default(PublicationByRef publicationByRef, String str, String str2, String str3, PublicationPostsConnection publicationPostsConnection, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publicationByRef.__typename;
            }
            if ((i & 2) != 0) {
                str2 = publicationByRef.id;
            }
            if ((i & 4) != 0) {
                str3 = publicationByRef.name;
            }
            if ((i & 8) != 0) {
                publicationPostsConnection = publicationByRef.publicationPostsConnection;
            }
            return publicationByRef.copy(str, str2, str3, publicationPostsConnection);
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

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final PublicationPostsConnection getPublicationPostsConnection() {
            return this.publicationPostsConnection;
        }

        public final PublicationByRef copy(String __typename, String id, String name, PublicationPostsConnection publicationPostsConnection) {
            __typename.getClass();
            id.getClass();
            name.getClass();
            publicationPostsConnection.getClass();
            return new PublicationByRef(__typename, id, name, publicationPostsConnection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PublicationByRef)) {
                return false;
            }
            PublicationByRef publicationByRef = (PublicationByRef) other;
            return g76.L(this.__typename, publicationByRef.__typename) && g76.L(this.id, publicationByRef.id) && g76.L(this.name, publicationByRef.name) && g76.L(this.publicationPostsConnection, publicationByRef.publicationPostsConnection);
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final PublicationPostsConnection getPublicationPostsConnection() {
            return this.publicationPostsConnection;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.publicationPostsConnection.hashCode() + wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.id), 31, this.name);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.name;
            PublicationPostsConnection publicationPostsConnection = this.publicationPostsConnection;
            StringBuilder sbU = y30.u("PublicationByRef(__typename=", str, ", id=", str2, ", name=");
            sbU.append(str3);
            sbU.append(", publicationPostsConnection=");
            sbU.append(publicationPostsConnection);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003J%\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0019\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$PublicationPostsConnection;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$Edge;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PublicationPostsConnection {
        private final String __typename;
        private final List<Edge> edges;

        public PublicationPostsConnection(String str, List<Edge> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ PublicationPostsConnection copy$default(PublicationPostsConnection publicationPostsConnection, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publicationPostsConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = publicationPostsConnection.edges;
            }
            return publicationPostsConnection.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge> component2() {
            return this.edges;
        }

        public final PublicationPostsConnection copy(String __typename, List<Edge> edges) {
            __typename.getClass();
            edges.getClass();
            return new PublicationPostsConnection(__typename, edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PublicationPostsConnection)) {
                return false;
            }
            PublicationPostsConnection publicationPostsConnection = (PublicationPostsConnection) other;
            return g76.L(this.__typename, publicationPostsConnection.__typename) && g76.L(this.edges, publicationPostsConnection.edges);
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
            return ka1.s("PublicationPostsConnection(__typename=", this.__typename, gYpYQDQkhfs.tigvay, ")", this.edges);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0005HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\f¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$TotalStats;", "", "__typename", "", "viewers", "", "readers", "<init>", "(Ljava/lang/String;JJ)V", "get__typename", "()Ljava/lang/String;", "getViewers", "()J", "getReaders", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class TotalStats {
        private final String __typename;
        private final long readers;
        private final long viewers;

        public TotalStats(String str, long j, long j2) {
            str.getClass();
            this.__typename = str;
            this.viewers = j;
            this.readers = j2;
        }

        public static /* synthetic */ TotalStats copy$default(TotalStats totalStats, String str, long j, long j2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = totalStats.__typename;
            }
            if ((i & 2) != 0) {
                j = totalStats.viewers;
            }
            if ((i & 4) != 0) {
                j2 = totalStats.readers;
            }
            return totalStats.copy(str, j, j2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final long getViewers() {
            return this.viewers;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final long getReaders() {
            return this.readers;
        }

        public final TotalStats copy(String __typename, long viewers, long readers) {
            __typename.getClass();
            return new TotalStats(__typename, viewers, readers);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof TotalStats)) {
                return false;
            }
            TotalStats totalStats = (TotalStats) other;
            return g76.L(this.__typename, totalStats.__typename) && this.viewers == totalStats.viewers && this.readers == totalStats.readers;
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
            long j = this.viewers;
            int i = (iHashCode + ((int) (j ^ (j >>> 32)))) * 31;
            long j2 = this.readers;
            return i + ((int) (j2 ^ (j2 >>> 32)));
        }

        public final String toString() {
            String str = this.__typename;
            long j = this.viewers;
            long j2 = this.readers;
            StringBuilder sbI = ho2.I(j, "TotalStats(__typename=", str, ", viewers=");
            sbI.append(", readers=");
            sbI.append(j2);
            sbI.append(")");
            return sbI.toString();
        }
    }

    public PubMonthlyStatsAndChartQuery(PublicationRef publicationRef, PublicationAggregateStatsInput publicationAggregateStatsInput) {
        publicationRef.getClass();
        publicationAggregateStatsInput.getClass();
        this.ref = publicationRef;
        this.input = publicationAggregateStatsInput;
    }

    public static /* synthetic */ PubMonthlyStatsAndChartQuery copy$default(PubMonthlyStatsAndChartQuery pubMonthlyStatsAndChartQuery, PublicationRef publicationRef, PublicationAggregateStatsInput publicationAggregateStatsInput, int i, Object obj) {
        if ((i & 1) != 0) {
            publicationRef = pubMonthlyStatsAndChartQuery.ref;
        }
        if ((i & 2) != 0) {
            publicationAggregateStatsInput = pubMonthlyStatsAndChartQuery.input;
        }
        return pubMonthlyStatsAndChartQuery.copy(publicationRef, publicationAggregateStatsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PubMonthlyStatsAndChartQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final PublicationRef getRef() {
        return this.ref;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final PublicationAggregateStatsInput getInput() {
        return this.input;
    }

    public final PubMonthlyStatsAndChartQuery copy(PublicationRef ref, PublicationAggregateStatsInput input) {
        ref.getClass();
        input.getClass();
        return new PubMonthlyStatsAndChartQuery(ref, input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PubMonthlyStatsAndChartQuery($ref: PublicationRef!, $input: PublicationAggregateStatsInput!) { publicationAggregateStats(input: $input) { __typename ... on PublicationAggregateTimeseriesStatsResponse { ... on AggregatePostTimeseriesStats { totalStats { __typename viewers readers } points { __typename ...MonthlyChartPostStatsPoint } } } ... on Unauthorized { message } } publicationByRef(ref: $ref) { __typename id name publicationPostsConnection(first: 25, after: \"\", orderBy: { publishedAt: ASC } , filter: { published: true } ) { __typename edges { __typename listedAt } } } }  fragment MonthlyChartPostStatsPoint on PostStatsPoint { __typename timestamp stats { __typename total { __typename viewers readers } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PubMonthlyStatsAndChartQuery)) {
            return false;
        }
        PubMonthlyStatsAndChartQuery pubMonthlyStatsAndChartQuery = (PubMonthlyStatsAndChartQuery) other;
        return g76.L(this.ref, pubMonthlyStatsAndChartQuery.ref) && g76.L(this.input, pubMonthlyStatsAndChartQuery.input);
    }

    public final PublicationAggregateStatsInput getInput() {
        return this.input;
    }

    public final PublicationRef getRef() {
        return this.ref;
    }

    public final int hashCode() {
        return this.input.hashCode() + (this.ref.hashCode() * 31);
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
        List<sx1> list = PubMonthlyStatsAndChartQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PubMonthlyStatsAndChartQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "PubMonthlyStatsAndChartQuery(ref=" + this.ref + ", input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PubMonthlyStatsAndChartQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PubMonthlyStatsAndChartQuery($ref: PublicationRef!, $input: PublicationAggregateStatsInput!) { publicationAggregateStats(input: $input) { __typename ... on PublicationAggregateTimeseriesStatsResponse { ... on AggregatePostTimeseriesStats { totalStats { __typename viewers readers } points { __typename ...MonthlyChartPostStatsPoint } } } ... on Unauthorized { message } } publicationByRef(ref: $ref) { __typename id name publicationPostsConnection(first: 25, after: \"\", orderBy: { publishedAt: ASC } , filter: { published: true } ) { __typename edges { __typename listedAt } } } }  fragment MonthlyChartPostStatsPoint on PostStatsPoint { __typename timestamp stats { __typename total { __typename viewers readers } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
