package dx;

import b.c9;
import b.u4;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f49762a;

    /* renamed from: b, reason: collision with root package name */
    public final List f49763b;

    /* renamed from: c, reason: collision with root package name */
    public final long f49764c;

    public q0(String str, List cascade, long j11, int i5) {
        j11 = (i5 & 4) != 0 ? 30000L : j11;
        Intrinsics.g(cascade, "cascade");
        this.f49762a = str;
        this.f49763b = cascade;
        this.f49764c = j11;
        if (cascade.isEmpty()) {
            throw new IllegalArgumentException(b.c0.l("Placement ", str, " cascade must not be empty").toString());
        }
        List list = cascade;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((f) it.next()).a());
        }
        if (b70.g.N1(arrayList).size() != arrayList.size()) {
            throw new IllegalArgumentException(b.c0.l("Placement ", this.f49762a, " has duplicate candidateId values").toString());
        }
        if (this.f49764c < 0) {
            throw new IllegalArgumentException("rotationIntervalMs must be >= 0 (0 disables rotation)");
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q0)) {
            return false;
        }
        q0 q0Var = (q0) obj;
        return this.f49762a.equals(q0Var.f49762a) && Intrinsics.b(this.f49763b, q0Var.f49763b) && this.f49764c == q0Var.f49764c;
    }

    public final int hashCode() {
        return c9.f(b.c0.d(b.c0.d(u4.c(this.f49762a.hashCode() * 31, 31, this.f49763b), 31, this.f49764c), 31, 1000L), 31, true);
    }

    public final String toString() {
        String strB = t.b(this.f49762a);
        StringBuilder sb2 = new StringBuilder("PlacementConfig(placement=");
        sb2.append(strB);
        sb2.append(", cascade=");
        sb2.append(this.f49763b);
        sb2.append(", rotationIntervalMs=");
        return a2.c.i(this.f49764c, ", minPostImpressionMs=1000, poolEnabled=true, retry=null)", sb2);
    }
}
