package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class o9a implements p9a {
    public final String a;
    public final long b;
    public final l38 c;
    public final boolean d;

    public o9a(String str, long j, l38 l38Var, boolean z) {
        str.getClass();
        this.a = str;
        this.b = j;
        this.c = l38Var;
        this.d = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o9a)) {
            return false;
        }
        o9a o9aVar = (o9a) obj;
        return g76.L(this.a, o9aVar.a) && this.b == o9aVar.b && this.c.equals(o9aVar.c) && this.d == o9aVar.d;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        return ((this.c.hashCode() + ((iHashCode + ((int) (j ^ (j >>> 32)))) * 31)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbI = ho2.I(this.b, "MonthlyStats(name=", this.a, ", firstPublishedAt=");
        sbI.append(", monthlyChartSectionUiModel=");
        sbI.append(this.c);
        sbI.append(", isRefreshing=");
        sbI.append(this.d);
        sbI.append(")");
        return sbI.toString();
    }
}
