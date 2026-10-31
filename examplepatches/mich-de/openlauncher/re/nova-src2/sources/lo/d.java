package lo;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final Integer f75079a;

    /* renamed from: b, reason: collision with root package name */
    public final Long f75080b;

    /* renamed from: c, reason: collision with root package name */
    public final Boolean f75081c;

    public /* synthetic */ d(int i5, Long l9, Integer num) {
        this(num, (i5 & 2) != 0 ? null : l9, (Boolean) null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f75079a, dVar.f75079a) && Intrinsics.b(this.f75080b, dVar.f75080b) && Intrinsics.b(this.f75081c, dVar.f75081c);
    }

    public final int hashCode() {
        Integer num = this.f75079a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Long l9 = this.f75080b;
        int iHashCode2 = (iHashCode + (l9 == null ? 0 : l9.hashCode())) * 31;
        Boolean bool = this.f75081c;
        return iHashCode2 + (bool != null ? bool.hashCode() : 0);
    }

    public final String toString() {
        return "SurfaceOverrides(minScoreThreshold=" + this.f75079a + ", maxFrequencyMs=" + this.f75080b + ", enabled=" + this.f75081c + ')';
    }

    public d(Integer num, Long l9, Boolean bool) {
        this.f75079a = num;
        this.f75080b = l9;
        this.f75081c = bool;
    }
}
