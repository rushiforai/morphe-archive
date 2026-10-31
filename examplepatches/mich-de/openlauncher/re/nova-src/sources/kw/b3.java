package kw;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b3 extends d3 {

    /* renamed from: a, reason: collision with root package name */
    public final List f72327a;

    /* renamed from: b, reason: collision with root package name */
    public final List f72328b;

    public b3(List staticIcons, List animatedIcons) {
        Intrinsics.g(staticIcons, "staticIcons");
        Intrinsics.g(animatedIcons, "animatedIcons");
        this.f72327a = staticIcons;
        this.f72328b = animatedIcons;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b3)) {
            return false;
        }
        b3 b3Var = (b3) obj;
        return Intrinsics.b(this.f72327a, b3Var.f72327a) && Intrinsics.b(this.f72328b, b3Var.f72328b);
    }

    public final int hashCode() {
        return this.f72328b.hashCode() + (this.f72327a.hashCode() * 31);
    }

    public final String toString() {
        return "MultiTrailing(staticIcons=" + this.f72327a + ", animatedIcons=" + this.f72328b + ")";
    }
}
