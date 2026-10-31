package cy;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final g f48457a;

    /* renamed from: b, reason: collision with root package name */
    public final List f48458b;

    public e(g gVar, List list) {
        this.f48457a = gVar;
        this.f48458b = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f48457a, eVar.f48457a) && Intrinsics.b(this.f48458b, eVar.f48458b);
    }

    public final int hashCode() {
        g gVar = this.f48457a;
        return this.f48458b.hashCode() + ((gVar == null ? 0 : gVar.hashCode()) * 31);
    }

    public final String toString() {
        return "PlansInfoResult(primeInfo=" + this.f48457a + ", plusOffers=" + this.f48458b + ")";
    }
}
