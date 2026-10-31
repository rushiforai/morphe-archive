package t80;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final String f88901a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f88902b;

    public d(String str, boolean z11) {
        this.f88901a = str;
        this.f88902b = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f88901a, dVar.f88901a) && this.f88902b == dVar.f88902b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f88902b) + (this.f88901a.hashCode() * 31);
    }

    public final String toString() {
        return "CalendarEntry(name=" + this.f88901a + ", isVisible=" + this.f88902b + ")";
    }
}
