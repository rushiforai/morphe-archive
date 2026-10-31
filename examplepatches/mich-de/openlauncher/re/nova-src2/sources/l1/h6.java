package l1;

import kotlin.ULong;

/* loaded from: classes2.dex */
public final class h6 {

    /* renamed from: a, reason: collision with root package name */
    public final long f73384a;

    /* renamed from: b, reason: collision with root package name */
    public final long f73385b;

    /* renamed from: c, reason: collision with root package name */
    public final long f73386c;

    /* renamed from: d, reason: collision with root package name */
    public final long f73387d;

    /* renamed from: e, reason: collision with root package name */
    public final long f73388e;

    /* renamed from: f, reason: collision with root package name */
    public final long f73389f;

    /* renamed from: g, reason: collision with root package name */
    public final long f73390g;

    /* renamed from: h, reason: collision with root package name */
    public final long f73391h;

    /* renamed from: i, reason: collision with root package name */
    public final long f73392i;

    /* renamed from: j, reason: collision with root package name */
    public final long f73393j;

    public h6(long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, long j21) {
        this.f73384a = j11;
        this.f73385b = j12;
        this.f73386c = j13;
        this.f73387d = j14;
        this.f73388e = j15;
        this.f73389f = j16;
        this.f73390g = j17;
        this.f73391h = j18;
        this.f73392i = j19;
        this.f73393j = j21;
    }

    public final long a(boolean z11, boolean z12) {
        return z11 ? z12 ? this.f73385b : this.f73387d : z12 ? this.f73390g : this.f73392i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof h6)) {
            return false;
        }
        h6 h6Var = (h6) obj;
        long j11 = h6Var.f73384a;
        int i5 = i2.s.n;
        return ULong.a(this.f73384a, j11) && ULong.a(this.f73385b, h6Var.f73385b) && ULong.a(this.f73386c, h6Var.f73386c) && ULong.a(this.f73387d, h6Var.f73387d) && ULong.a(this.f73388e, h6Var.f73388e) && ULong.a(this.f73389f, h6Var.f73389f) && ULong.a(this.f73390g, h6Var.f73390g) && ULong.a(this.f73391h, h6Var.f73391h) && ULong.a(this.f73392i, h6Var.f73392i) && ULong.a(this.f73393j, h6Var.f73393j);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f73393j) + b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(Long.hashCode(this.f73384a) * 31, 31, this.f73385b), 31, this.f73386c), 31, this.f73387d), 31, this.f73388e), 31, this.f73389f), 31, this.f73390g), 31, this.f73391h), 31, this.f73392i);
    }
}
