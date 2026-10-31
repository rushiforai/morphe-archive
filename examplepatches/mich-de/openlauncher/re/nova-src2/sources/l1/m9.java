package l1;

import kotlin.ULong;

/* loaded from: classes2.dex */
public final class m9 {

    /* renamed from: a, reason: collision with root package name */
    public final long f73663a;

    /* renamed from: b, reason: collision with root package name */
    public final long f73664b;

    /* renamed from: c, reason: collision with root package name */
    public final long f73665c;

    /* renamed from: d, reason: collision with root package name */
    public final long f73666d;

    /* renamed from: e, reason: collision with root package name */
    public final long f73667e;

    public m9(long j11, long j12, long j13, long j14, long j15) {
        this.f73663a = j11;
        this.f73664b = j12;
        this.f73665c = j13;
        this.f73666d = j14;
        this.f73667e = j15;
    }

    public final m9 a(long j11, long j12, long j13, long j14, long j15) {
        return new m9(j11 != 16 ? j11 : this.f73663a, j12 != 16 ? j12 : this.f73664b, j13 != 16 ? j13 : this.f73665c, j14 != 16 ? j14 : this.f73666d, j15 != 16 ? j15 : this.f73667e);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof m9)) {
            return false;
        }
        m9 m9Var = (m9) obj;
        long j11 = m9Var.f73663a;
        int i5 = i2.s.n;
        return ULong.a(this.f73663a, j11) && ULong.a(this.f73664b, m9Var.f73664b) && ULong.a(this.f73665c, m9Var.f73665c) && ULong.a(this.f73666d, m9Var.f73666d) && ULong.a(this.f73667e, m9Var.f73667e);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f73667e) + b.c0.d(b.c0.d(b.c0.d(Long.hashCode(this.f73663a) * 31, 31, this.f73664b), 31, this.f73665c), 31, this.f73666d);
    }
}
