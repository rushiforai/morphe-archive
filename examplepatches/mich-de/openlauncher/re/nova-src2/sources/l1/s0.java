package l1;

import kotlin.ULong;

/* loaded from: classes2.dex */
public final class s0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f73928a;

    /* renamed from: b, reason: collision with root package name */
    public final long f73929b;

    /* renamed from: c, reason: collision with root package name */
    public final long f73930c;

    /* renamed from: d, reason: collision with root package name */
    public final long f73931d;

    public s0(long j11, long j12, long j13, long j14) {
        this.f73928a = j11;
        this.f73929b = j12;
        this.f73930c = j13;
        this.f73931d = j14;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof s0)) {
            return false;
        }
        s0 s0Var = (s0) obj;
        long j11 = s0Var.f73928a;
        int i5 = i2.s.n;
        return ULong.a(this.f73928a, j11) && ULong.a(this.f73929b, s0Var.f73929b) && ULong.a(this.f73930c, s0Var.f73930c) && ULong.a(this.f73931d, s0Var.f73931d);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f73931d) + b.c0.d(b.c0.d(Long.hashCode(this.f73928a) * 31, 31, this.f73929b), 31, this.f73930c);
    }
}
