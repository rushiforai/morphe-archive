package l1;

import kotlin.ULong;

/* loaded from: classes2.dex */
public final class o5 {

    /* renamed from: a, reason: collision with root package name */
    public final long f73745a = i2.s.f61147m;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o5)) {
            return false;
        }
        long j11 = ((o5) obj).f73745a;
        int i5 = i2.s.n;
        return ULong.a(this.f73745a, j11);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f73745a) * 31;
    }

    public final String toString() {
        return "RippleConfiguration(color=" + ((Object) i2.s.h(this.f73745a)) + ", rippleAlpha=null)";
    }
}
