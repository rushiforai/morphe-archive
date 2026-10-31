package x7;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final String f95128a;

    /* renamed from: b, reason: collision with root package name */
    public final Long f95129b;

    public d(String str, Long l9) {
        this.f95128a = str;
        this.f95129b = l9;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f95128a, dVar.f95128a) && Intrinsics.b(this.f95129b, dVar.f95129b);
    }

    public final int hashCode() {
        int iHashCode = this.f95128a.hashCode() * 31;
        Long l9 = this.f95129b;
        return iHashCode + (l9 == null ? 0 : l9.hashCode());
    }

    public final String toString() {
        return "Preference(key=" + this.f95128a + ", value=" + this.f95129b + ')';
    }
}
