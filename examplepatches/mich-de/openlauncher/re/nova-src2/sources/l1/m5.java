package l1;

import kotlin.ULong;

/* loaded from: classes2.dex */
public final class m5 {

    /* renamed from: a, reason: collision with root package name */
    public final long f73641a;

    /* renamed from: b, reason: collision with root package name */
    public final long f73642b;

    /* renamed from: c, reason: collision with root package name */
    public final long f73643c;

    /* renamed from: d, reason: collision with root package name */
    public final long f73644d;

    public m5(long j11, long j12, long j13, long j14) {
        this.f73641a = j11;
        this.f73642b = j12;
        this.f73643c = j13;
        this.f73644d = j14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof m5)) {
            return false;
        }
        m5 m5Var = (m5) obj;
        long j11 = m5Var.f73641a;
        int i5 = i2.s.n;
        return ULong.a(this.f73641a, j11) && ULong.a(this.f73642b, m5Var.f73642b) && ULong.a(this.f73643c, m5Var.f73643c) && ULong.a(this.f73644d, m5Var.f73644d);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f73644d) + b.c0.d(b.c0.d(Long.hashCode(this.f73641a) * 31, 31, this.f73642b), 31, this.f73643c);
    }
}
