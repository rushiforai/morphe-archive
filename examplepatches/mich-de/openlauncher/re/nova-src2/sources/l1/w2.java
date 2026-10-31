package l1;

import kotlin.ULong;

/* loaded from: classes.dex */
public final class w2 {

    /* renamed from: a, reason: collision with root package name */
    public final long f74155a;

    /* renamed from: b, reason: collision with root package name */
    public final long f74156b;

    /* renamed from: c, reason: collision with root package name */
    public final long f74157c;

    /* renamed from: d, reason: collision with root package name */
    public final long f74158d;

    public w2(long j11, long j12, long j13, long j14) {
        this.f74155a = j11;
        this.f74156b = j12;
        this.f74157c = j13;
        this.f74158d = j14;
    }

    public final w2 a(long j11, long j12, long j13, long j14) {
        if (j11 == 16) {
            j11 = this.f74155a;
        }
        return new w2(j11, j12 != 16 ? j12 : this.f74156b, j13 != 16 ? j13 : this.f74157c, j14 != 16 ? j14 : this.f74158d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof w2)) {
            return false;
        }
        w2 w2Var = (w2) obj;
        long j11 = w2Var.f74155a;
        int i5 = i2.s.n;
        return ULong.a(this.f74155a, j11) && ULong.a(this.f74156b, w2Var.f74156b) && ULong.a(this.f74157c, w2Var.f74157c) && ULong.a(this.f74158d, w2Var.f74158d);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f74158d) + b.c0.d(b.c0.d(Long.hashCode(this.f74155a) * 31, 31, this.f74156b), 31, this.f74157c);
    }
}
