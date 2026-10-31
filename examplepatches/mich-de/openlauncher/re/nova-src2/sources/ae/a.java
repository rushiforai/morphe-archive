package ae;

import java.util.HashMap;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final de.a f12735a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f12736b;

    public a(de.a aVar, HashMap map) {
        this.f12735a = aVar;
        this.f12736b = map;
    }

    public final long a(qd.d dVar, long j11, int i5) {
        long time = j11 - this.f12735a.getTime();
        b bVar = (b) this.f12736b.get(dVar);
        long j12 = bVar.f12737a;
        return Math.min(Math.max((long) (Math.pow(3.0d, i5 - 1) * j12 * Math.max(1.0d, Math.log(10000.0d) / Math.log((j12 > 1 ? j12 : 2L) * r12))), time), bVar.f12738b);
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f12735a.equals(aVar.f12735a) && this.f12736b.equals(aVar.f12736b);
    }

    public final int hashCode() {
        return ((this.f12735a.hashCode() ^ 1000003) * 1000003) ^ this.f12736b.hashCode();
    }

    public final String toString() {
        return "SchedulerConfig{clock=" + this.f12735a + ", values=" + this.f12736b + "}";
    }
}
