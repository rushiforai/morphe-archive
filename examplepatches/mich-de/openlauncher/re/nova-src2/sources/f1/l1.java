package f1;

import kotlin.ULong;

/* loaded from: classes2.dex */
public final class l1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f53721a;

    /* renamed from: b, reason: collision with root package name */
    public final long f53722b;

    /* renamed from: c, reason: collision with root package name */
    public final long f53723c;

    public l1(long j11, long j12, long j13) {
        this.f53721a = j11;
        this.f53722b = j12;
        this.f53723c = j13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || l1.class != obj.getClass()) {
            return false;
        }
        l1 l1Var = (l1) obj;
        long j11 = l1Var.f53721a;
        int i5 = i2.s.n;
        return ULong.a(this.f53721a, j11) && ULong.a(this.f53722b, l1Var.f53722b) && ULong.a(this.f53723c, l1Var.f53723c);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f53723c) + b.c0.d(Long.hashCode(this.f53721a) * 31, 31, this.f53722b);
    }
}
