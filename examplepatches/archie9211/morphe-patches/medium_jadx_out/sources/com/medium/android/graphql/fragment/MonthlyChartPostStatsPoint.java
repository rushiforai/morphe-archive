package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ho2;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0086\b\u0018\u00002\u00020\u0001:\u0002!\"B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\n\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ.\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u0006HÆ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u000bJ\u0010\u0010\u0014\u001a\u00020\u0013HÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0019\u0010\u001aR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001b\u001a\u0004\b\u001c\u0010\u000bR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001d\u001a\u0004\b\u001e\u0010\rR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001f\u001a\u0004\b \u0010\u000f¨\u0006#"}, d2 = {"Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint;", "Lg15;", "", "__typename", "", "timestamp", "Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint$Stats;", "stats", "<init>", "(Ljava/lang/String;JLcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint$Stats;)V", "component1", "()Ljava/lang/String;", "component2", "()J", "component3", "()Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint$Stats;", "copy", "(Ljava/lang/String;JLcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint$Stats;)Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "J", "getTimestamp", "Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint$Stats;", "getStats", "Stats", "Total", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class MonthlyChartPostStatsPoint implements g15 {
    private final String __typename;
    private final Stats stats;
    private final long timestamp;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint$Stats;", "", "__typename", "", "total", "Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint$Total;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint$Total;)V", "get__typename", "()Ljava/lang/String;", "getTotal", "()Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint$Total;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Stats {
        private final String __typename;
        private final Total total;

        public Stats(String str, Total total) {
            str.getClass();
            total.getClass();
            this.__typename = str;
            this.total = total;
        }

        public static /* synthetic */ Stats copy$default(Stats stats, String str, Total total, int i, Object obj) {
            if ((i & 1) != 0) {
                str = stats.__typename;
            }
            if ((i & 2) != 0) {
                total = stats.total;
            }
            return stats.copy(str, total);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Total getTotal() {
            return this.total;
        }

        public final Stats copy(String __typename, Total total) {
            __typename.getClass();
            total.getClass();
            return new Stats(__typename, total);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Stats)) {
                return false;
            }
            Stats stats = (Stats) other;
            return g76.L(this.__typename, stats.__typename) && g76.L(this.total, stats.total);
        }

        public final Total getTotal() {
            return this.total;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.total.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Stats(__typename=" + this.__typename + ", total=" + this.total + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0005HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\f¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/MonthlyChartPostStatsPoint$Total;", "", "__typename", "", "viewers", "", "readers", "<init>", "(Ljava/lang/String;JJ)V", "get__typename", "()Ljava/lang/String;", "getViewers", "()J", "getReaders", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Total {
        private final String __typename;
        private final long readers;
        private final long viewers;

        public Total(String str, long j, long j2) {
            str.getClass();
            this.__typename = str;
            this.viewers = j;
            this.readers = j2;
        }

        public static /* synthetic */ Total copy$default(Total total, String str, long j, long j2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = total.__typename;
            }
            if ((i & 2) != 0) {
                j = total.viewers;
            }
            if ((i & 4) != 0) {
                j2 = total.readers;
            }
            return total.copy(str, j, j2);
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

        public final Total copy(String __typename, long viewers, long readers) {
            __typename.getClass();
            return new Total(__typename, viewers, readers);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Total)) {
                return false;
            }
            Total total = (Total) other;
            return g76.L(this.__typename, total.__typename) && this.viewers == total.viewers && this.readers == total.readers;
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
            StringBuilder sbI = ho2.I(j, "Total(__typename=", str, ", viewers=");
            sbI.append(", readers=");
            sbI.append(j2);
            sbI.append(")");
            return sbI.toString();
        }
    }

    public MonthlyChartPostStatsPoint(String str, long j, Stats stats) {
        str.getClass();
        stats.getClass();
        this.__typename = str;
        this.timestamp = j;
        this.stats = stats;
    }

    public static /* synthetic */ MonthlyChartPostStatsPoint copy$default(MonthlyChartPostStatsPoint monthlyChartPostStatsPoint, String str, long j, Stats stats, int i, Object obj) {
        if ((i & 1) != 0) {
            str = monthlyChartPostStatsPoint.__typename;
        }
        if ((i & 2) != 0) {
            j = monthlyChartPostStatsPoint.timestamp;
        }
        if ((i & 4) != 0) {
            stats = monthlyChartPostStatsPoint.stats;
        }
        return monthlyChartPostStatsPoint.copy(str, j, stats);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final long getTimestamp() {
        return this.timestamp;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final Stats getStats() {
        return this.stats;
    }

    public final MonthlyChartPostStatsPoint copy(String __typename, long timestamp, Stats stats) {
        __typename.getClass();
        stats.getClass();
        return new MonthlyChartPostStatsPoint(__typename, timestamp, stats);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MonthlyChartPostStatsPoint)) {
            return false;
        }
        MonthlyChartPostStatsPoint monthlyChartPostStatsPoint = (MonthlyChartPostStatsPoint) other;
        return g76.L(this.__typename, monthlyChartPostStatsPoint.__typename) && this.timestamp == monthlyChartPostStatsPoint.timestamp && g76.L(this.stats, monthlyChartPostStatsPoint.stats);
    }

    public final Stats getStats() {
        return this.stats;
    }

    public final long getTimestamp() {
        return this.timestamp;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        long j = this.timestamp;
        return this.stats.hashCode() + ((iHashCode + ((int) (j ^ (j >>> 32)))) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        long j = this.timestamp;
        Stats stats = this.stats;
        StringBuilder sbI = ho2.I(j, "MonthlyChartPostStatsPoint(__typename=", str, ", timestamp=");
        sbI.append(", stats=");
        sbI.append(stats);
        sbI.append(")");
        return sbI.toString();
    }
}
