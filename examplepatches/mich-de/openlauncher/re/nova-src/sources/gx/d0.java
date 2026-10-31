package gx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final Integer f58062a;

    public d0(Integer num) {
        this.f58062a = num;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d0) && Intrinsics.b(this.f58062a, ((d0) obj).f58062a);
    }

    public final int hashCode() {
        Integer num = this.f58062a;
        if (num == null) {
            return 0;
        }
        return num.hashCode();
    }

    public final String toString() {
        return "LoadHints(containerWidthDp=" + this.f58062a + ")";
    }
}
