package l1;

import kotlin.ULong;

/* loaded from: classes2.dex */
public final class h3 {

    /* renamed from: a, reason: collision with root package name */
    public final long f73372a;

    /* renamed from: b, reason: collision with root package name */
    public final long f73373b;

    /* renamed from: c, reason: collision with root package name */
    public final long f73374c;

    /* renamed from: d, reason: collision with root package name */
    public final long f73375d;

    /* renamed from: e, reason: collision with root package name */
    public final long f73376e;

    /* renamed from: f, reason: collision with root package name */
    public final long f73377f;

    public h3(long j11, long j12, long j13, long j14, long j15, long j16) {
        this.f73372a = j11;
        this.f73373b = j12;
        this.f73374c = j13;
        this.f73375d = j14;
        this.f73376e = j15;
        this.f73377f = j16;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof h3)) {
            return false;
        }
        h3 h3Var = (h3) obj;
        long j11 = h3Var.f73372a;
        int i5 = i2.s.n;
        return ULong.a(this.f73372a, j11) && ULong.a(this.f73373b, h3Var.f73373b) && ULong.a(this.f73374c, h3Var.f73374c) && ULong.a(this.f73375d, h3Var.f73375d) && ULong.a(this.f73376e, h3Var.f73376e) && ULong.a(this.f73377f, h3Var.f73377f);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f73377f) + b.c0.d(b.c0.d(b.c0.d(b.c0.d(Long.hashCode(this.f73372a) * 31, 31, this.f73373b), 31, this.f73374c), 31, this.f73375d), 31, this.f73376e);
    }
}
