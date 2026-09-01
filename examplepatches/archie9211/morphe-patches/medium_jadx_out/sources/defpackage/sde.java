package defpackage;

import com.medium.android.graphql.MonthlyStatsAndChartQuery;
import java.util.Calendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sde implements tde {
    public final MonthlyStatsAndChartQuery.User a;
    public final boolean b;
    public final Calendar c;

    public sde(MonthlyStatsAndChartQuery.User user, boolean z, Calendar calendar) {
        user.getClass();
        calendar.getClass();
        this.a = user;
        this.b = z;
        this.c = calendar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sde)) {
            return false;
        }
        sde sdeVar = (sde) obj;
        return g76.L(this.a, sdeVar.a) && this.b == sdeVar.b && g76.L(this.c, sdeVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "Result(data=" + this.a + ", isRefreshing=" + this.b + ", monthSelected=" + this.c + ")";
    }
}
