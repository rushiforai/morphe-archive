package r80;

import b.c0;
import java.util.ArrayList;

/* loaded from: classes5.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final long f85668a;

    /* renamed from: b, reason: collision with root package name */
    public final long f85669b;

    /* renamed from: c, reason: collision with root package name */
    public final long f85670c;

    /* renamed from: d, reason: collision with root package name */
    public final long f85671d;

    /* renamed from: e, reason: collision with root package name */
    public final long f85672e;

    /* renamed from: f, reason: collision with root package name */
    public final long f85673f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f85674g;

    public g(long j11, long j12, long j13, long j14, long j15, long j16, ArrayList arrayList) {
        this.f85668a = j11;
        this.f85669b = j12;
        this.f85670c = j13;
        this.f85671d = j14;
        this.f85672e = j15;
        this.f85673f = j16;
        this.f85674g = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f85668a == gVar.f85668a && this.f85669b == gVar.f85669b && this.f85670c == gVar.f85670c && this.f85671d == gVar.f85671d && this.f85672e == gVar.f85672e && this.f85673f == gVar.f85673f && this.f85674g.equals(gVar.f85674g);
    }

    public final int hashCode() {
        return this.f85674g.hashCode() + c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(1505453, 31, 1791366169857L), 31, this.f85668a), 31, -1L), 31, this.f85669b), 31, this.f85670c), 31, this.f85671d), 31, 0L), 31, 0L), 31, this.f85672e), 31, this.f85673f);
    }

    public final String toString() {
        StringBuilder sbU = c0.u(this.f85668a, "PerfStats(versionName=1.0, buildTimestamp=1791366169857, shortcutRowCount=", ", contactActionsRowCount=-1, usageRowCount=");
        sbU.append(this.f85669b);
        c0.B(sbU, ", searchAliasRowCount=", this.f85670c, ", searchMoreRowCount=");
        sbU.append(this.f85671d);
        c0.B(sbU, ", cachedLinkRowCount=0, cachedAliasRowCount=0, sizeOnDisk=", this.f85672e, ", lastUsageUpdate=");
        sbU.append(this.f85673f);
        sbU.append(", searchTimings=");
        sbU.append(this.f85674g);
        sbU.append(")");
        return sbU.toString();
    }
}
