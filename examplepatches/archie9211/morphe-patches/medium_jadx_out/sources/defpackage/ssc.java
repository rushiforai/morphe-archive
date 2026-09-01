package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ssc implements tsc {
    public final long a;
    public final l38 b;
    public final boolean c;

    public ssc(long j, l38 l38Var, boolean z) {
        this.a = j;
        this.b = l38Var;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ssc)) {
            return false;
        }
        ssc sscVar = (ssc) obj;
        return this.a == sscVar.a && this.b.equals(sscVar.b) && this.c == sscVar.c;
    }

    public final int hashCode() {
        long j = this.a;
        return ((this.b.hashCode() + (((int) (j ^ (j >>> 32))) * 31)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return "MonthlyStats(firstPublishedAt=" + this.a + ", monthlyChartSectionUiModel=" + this.b + ", isRefreshing=" + this.c + ")";
    }
}
