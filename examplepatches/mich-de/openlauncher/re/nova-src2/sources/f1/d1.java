package f1;

import kotlin.ULong;

/* loaded from: classes2.dex */
public final class d1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f53451a;

    /* renamed from: b, reason: collision with root package name */
    public final long f53452b;

    /* renamed from: c, reason: collision with root package name */
    public final long f53453c;

    /* renamed from: d, reason: collision with root package name */
    public final long f53454d;

    public d1(long j11, long j12, long j13, long j14) {
        this.f53451a = j11;
        this.f53452b = j12;
        this.f53453c = j13;
        this.f53454d = j14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || d1.class != obj.getClass()) {
            return false;
        }
        d1 d1Var = (d1) obj;
        long j11 = d1Var.f53451a;
        int i5 = i2.s.n;
        return ULong.a(this.f53451a, j11) && ULong.a(this.f53452b, d1Var.f53452b) && ULong.a(this.f53453c, d1Var.f53453c) && ULong.a(this.f53454d, d1Var.f53454d);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f53454d) + b.c0.d(b.c0.d(Long.hashCode(this.f53451a) * 31, 31, this.f53452b), 31, this.f53453c);
    }
}
