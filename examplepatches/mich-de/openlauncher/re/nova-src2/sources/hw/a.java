package hw;

import b.c0;
import kotlin.ULong;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final long f60722a;

    /* renamed from: b, reason: collision with root package name */
    public final long f60723b;

    public a(long j11, long j12) {
        this.f60722a = j11;
        this.f60723b = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        long j11 = aVar.f60722a;
        int i5 = i2.s.n;
        return ULong.a(this.f60722a, j11) && ULong.a(this.f60723b, aVar.f60723b);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f60723b) + (Long.hashCode(this.f60722a) * 31);
    }

    public final String toString() {
        return c0.n("EmbeddedCheckmarkColors(separatorColor=", i2.s.h(this.f60722a), ", checkmarkColor=", i2.s.h(this.f60723b), ")");
    }
}
