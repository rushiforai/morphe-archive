package hw;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final Integer f60748a;

    /* renamed from: b, reason: collision with root package name */
    public final long f60749b;

    public l(long j11, Integer num) {
        this.f60748a = num;
        this.f60749b = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l)) {
            return false;
        }
        l lVar = (l) obj;
        return Intrinsics.b(this.f60748a, lVar.f60748a) && y3.p.a(this.f60749b, lVar.f60749b);
    }

    public final int hashCode() {
        Integer num = this.f60748a;
        int iHashCode = num == null ? 0 : num.hashCode();
        y3.q[] qVarArr = y3.p.f96616b;
        return Long.hashCode(this.f60749b) + (iHashCode * 31);
    }

    public final String toString() {
        return "PrimaryButtonTypography(fontFamily=" + this.f60748a + ", fontSize=" + y3.p.d(this.f60749b) + ")";
    }
}
