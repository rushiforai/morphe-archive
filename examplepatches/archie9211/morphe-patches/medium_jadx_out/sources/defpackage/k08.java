package defpackage;

import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0081\b\u0018\u00002\u00020\u0001R \u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00030\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0005\u001a\u0004\b\u0004\u0010\u0006¨\u0006\b"}, d2 = {"Lk08;", "", "", "Lpqd;", "a", "Ljava/util/List;", "()Ljava/util/List;", "stats", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class k08 {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("stats")
    private final List<pqd> stats;

    public k08(List list) {
        this.stats = list;
    }

    /* JADX INFO: renamed from: a, reason: from getter */
    public final List getStats() {
        return this.stats;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof k08) && g76.L(this.stats, ((k08) obj).stats);
    }

    public final int hashCode() {
        return this.stats.hashCode();
    }

    public final String toString() {
        return ka1.t("PendingStats(stats=", ")", this.stats);
    }
}
