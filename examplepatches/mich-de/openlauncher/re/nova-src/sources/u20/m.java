package u20;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final List f90484a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f90485b;

    public m(List list, boolean z11) {
        this.f90484a = list;
        this.f90485b = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return Intrinsics.b(this.f90484a, mVar.f90484a) && this.f90485b == mVar.f90485b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f90485b) + (this.f90484a.hashCode() * 31);
    }

    public final String toString() {
        return "IconLoadResult(list=" + this.f90484a + ", isThemed=" + this.f90485b + ")";
    }
}
