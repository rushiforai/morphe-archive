package hw;

import b.c0;
import kotlin.ULong;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final long f60724a;

    /* renamed from: b, reason: collision with root package name */
    public final long f60725b;

    public b(long j11, long j12) {
        this.f60724a = j11;
        this.f60725b = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        long j11 = bVar.f60724a;
        int i5 = i2.s.n;
        return ULong.a(this.f60724a, j11) && ULong.a(this.f60725b, bVar.f60725b);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f60725b) + (Long.hashCode(this.f60724a) * 31);
    }

    public final String toString() {
        return c0.n("EmbeddedDisclosureColors(separatorColor=", i2.s.h(this.f60724a), ", disclosureColor=", i2.s.h(this.f60725b), ")");
    }
}
