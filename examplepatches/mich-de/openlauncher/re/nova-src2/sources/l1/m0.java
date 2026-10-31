package l1;

import kotlin.ULong;

/* loaded from: classes.dex */
public final class m0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f73633a;

    /* renamed from: b, reason: collision with root package name */
    public final long f73634b;

    /* renamed from: c, reason: collision with root package name */
    public final long f73635c;

    /* renamed from: d, reason: collision with root package name */
    public final long f73636d;

    public m0(long j11, long j12, long j13, long j14) {
        this.f73633a = j11;
        this.f73634b = j12;
        this.f73635c = j13;
        this.f73636d = j14;
    }

    public final m0 a(long j11, long j12, long j13, long j14) {
        if (j11 == 16) {
            j11 = this.f73633a;
        }
        return new m0(j11, j12 != 16 ? j12 : this.f73634b, j13 != 16 ? j13 : this.f73635c, j14 != 16 ? j14 : this.f73636d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof m0)) {
            return false;
        }
        m0 m0Var = (m0) obj;
        long j11 = m0Var.f73633a;
        int i5 = i2.s.n;
        return ULong.a(this.f73633a, j11) && ULong.a(this.f73634b, m0Var.f73634b) && ULong.a(this.f73635c, m0Var.f73635c) && ULong.a(this.f73636d, m0Var.f73636d);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f73636d) + b.c0.d(b.c0.d(Long.hashCode(this.f73633a) * 31, 31, this.f73634b), 31, this.f73635c);
    }
}
