package hq;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements d {

    /* renamed from: a, reason: collision with root package name */
    public final List f59960a;

    /* renamed from: b, reason: collision with root package name */
    public final List f59961b;

    public c(List ranges, List unfilteredRanges) {
        Intrinsics.g(ranges, "ranges");
        Intrinsics.g(unfilteredRanges, "unfilteredRanges");
        this.f59960a = ranges;
        this.f59961b = unfilteredRanges;
    }

    @Override // hq.d
    public final List a() {
        return this.f59960a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f59960a, cVar.f59960a) && Intrinsics.b(this.f59961b, cVar.f59961b);
    }

    public final int hashCode() {
        return this.f59961b.hashCode() + (this.f59960a.hashCode() * 31);
    }

    public final String toString() {
        return "Success(ranges=" + this.f59960a + ", unfilteredRanges=" + this.f59961b + ")";
    }
}
