package u40;

import b.c0;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final long f90565a;

    /* renamed from: b, reason: collision with root package name */
    public final long f90566b;

    /* renamed from: c, reason: collision with root package name */
    public final long f90567c;

    /* renamed from: d, reason: collision with root package name */
    public final long f90568d;

    /* renamed from: e, reason: collision with root package name */
    public final long f90569e;

    /* renamed from: f, reason: collision with root package name */
    public final long f90570f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f90571g;

    public c(long j11, long j12, long j13, long j14, long j15, long j16, ArrayList arrayList) {
        this.f90565a = j11;
        this.f90566b = j12;
        this.f90567c = j13;
        this.f90568d = j14;
        this.f90569e = j15;
        this.f90570f = j16;
        this.f90571g = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return this.f90565a == cVar.f90565a && this.f90566b == cVar.f90566b && this.f90567c == cVar.f90567c && this.f90568d == cVar.f90568d && this.f90569e == cVar.f90569e && this.f90570f == cVar.f90570f && this.f90571g.equals(cVar.f90571g);
    }

    public final int hashCode() {
        return this.f90571g.hashCode() + c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(1590110652, 31, 1770812678925L), 31, this.f90565a), 31, this.f90566b), 31, this.f90567c), 31, this.f90568d), 31, 0L), 31, 0L), 31, this.f90569e), 31, this.f90570f);
    }

    public final String toString() {
        return "PerfStats(versionName=6.6.4, buildTimestamp=1770812678925, shortcutRowCount=" + this.f90565a + ", usageRowCount=" + this.f90566b + ", searchAliasRowCount=" + this.f90567c + ", searchMoreRowCount=" + this.f90568d + ", cachedLinkRowCount=0, cachedAliasRowCount=0, sizeOnDisk=" + this.f90569e + ", lastUsageUpdate=" + this.f90570f + ", searchTimings=" + this.f90571g + ')';
    }
}
