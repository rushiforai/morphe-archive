package hw;

import b.c0;
import kotlin.ULong;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final long f60726a;

    /* renamed from: b, reason: collision with root package name */
    public final long f60727b;

    /* renamed from: c, reason: collision with root package name */
    public final long f60728c;

    public f(long j11, long j12, long j13) {
        this.f60726a = j11;
        this.f60727b = j12;
        this.f60728c = j13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        long j11 = fVar.f60726a;
        int i5 = i2.s.n;
        return ULong.a(this.f60726a, j11) && ULong.a(this.f60727b, fVar.f60727b) && ULong.a(this.f60728c, fVar.f60728c);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f60728c) + c0.d(Long.hashCode(this.f60726a) * 31, 31, this.f60727b);
    }

    public final String toString() {
        String strH = i2.s.h(this.f60726a);
        String strH2 = i2.s.h(this.f60727b);
        return c0.q(c0.w("EmbeddedRadioColors(separatorColor=", strH, ", selectedColor=", strH2, ", unselectedColor="), i2.s.h(this.f60728c), ")");
    }
}
