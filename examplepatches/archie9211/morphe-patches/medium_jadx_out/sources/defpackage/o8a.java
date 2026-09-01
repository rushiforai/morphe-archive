package defpackage;

import com.medium.android.graphql.PubMonthlyStatsAndChartQuery;
import java.util.Calendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class o8a implements p8a {
    public final PubMonthlyStatsAndChartQuery.OnAggregatePostTimeseriesStats a;
    public final PubMonthlyStatsAndChartQuery.PublicationByRef b;
    public final boolean c;
    public final Calendar d;

    public o8a(PubMonthlyStatsAndChartQuery.OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats, PubMonthlyStatsAndChartQuery.PublicationByRef publicationByRef, boolean z, Calendar calendar) {
        calendar.getClass();
        this.a = onAggregatePostTimeseriesStats;
        this.b = publicationByRef;
        this.c = z;
        this.d = calendar;
    }

    public static o8a a(o8a o8aVar, boolean z, Calendar calendar, int i) {
        PubMonthlyStatsAndChartQuery.OnAggregatePostTimeseriesStats onAggregatePostTimeseriesStats = o8aVar.a;
        PubMonthlyStatsAndChartQuery.PublicationByRef publicationByRef = o8aVar.b;
        if ((i & 8) != 0) {
            calendar = o8aVar.d;
        }
        o8aVar.getClass();
        calendar.getClass();
        return new o8a(onAggregatePostTimeseriesStats, publicationByRef, z, calendar);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o8a)) {
            return false;
        }
        o8a o8aVar = (o8a) obj;
        return this.a.equals(o8aVar.a) && this.b.equals(o8aVar.b) && this.c == o8aVar.c && g76.L(this.d, o8aVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + (this.c ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "Success(onAggregatePostTimeseriesStats=" + this.a + ", publicationByRef=" + this.b + ", isRefreshing=" + this.c + ", monthSelected=" + this.d + ")";
    }
}
