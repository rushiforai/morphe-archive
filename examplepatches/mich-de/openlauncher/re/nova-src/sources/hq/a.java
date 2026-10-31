package hq;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final List f59956a;

    /* renamed from: b, reason: collision with root package name */
    public final List f59957b;

    public a(List accountRanges, List unfilteredAccountRanges) {
        Intrinsics.g(accountRanges, "accountRanges");
        Intrinsics.g(unfilteredAccountRanges, "unfilteredAccountRanges");
        this.f59956a = accountRanges;
        this.f59957b = unfilteredAccountRanges;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f59956a, aVar.f59956a) && Intrinsics.b(this.f59957b, aVar.f59957b);
    }

    public final int hashCode() {
        return this.f59957b.hashCode() + (this.f59956a.hashCode() * 31);
    }

    public final String toString() {
        return "AccountRangesResult(accountRanges=" + this.f59956a + ", unfilteredAccountRanges=" + this.f59957b + ")";
    }
}
