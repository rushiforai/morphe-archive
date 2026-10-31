package hv;

import kotlin.ULong;

/* loaded from: classes4.dex */
public final class w2 {

    /* renamed from: a, reason: collision with root package name */
    public final long f60642a;

    /* renamed from: b, reason: collision with root package name */
    public final long f60643b;

    /* renamed from: c, reason: collision with root package name */
    public final long f60644c;

    /* renamed from: d, reason: collision with root package name */
    public final long f60645d;

    /* renamed from: e, reason: collision with root package name */
    public final long f60646e;

    public w2(long j11, long j12, long j13, long j14, long j15) {
        this.f60642a = j11;
        this.f60643b = j12;
        this.f60644c = j13;
        this.f60645d = j14;
        this.f60646e = j15;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w2)) {
            return false;
        }
        w2 w2Var = (w2) obj;
        long j11 = w2Var.f60642a;
        int i5 = i2.s.n;
        return ULong.a(this.f60642a, j11) && ULong.a(this.f60643b, w2Var.f60643b) && ULong.a(this.f60644c, w2Var.f60644c) && ULong.a(this.f60645d, w2Var.f60645d) && ULong.a(this.f60646e, w2Var.f60646e);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f60646e) + b.c0.d(b.c0.d(b.c0.d(Long.hashCode(this.f60642a) * 31, 31, this.f60643b), 31, this.f60644c), 31, this.f60645d);
    }

    public final String toString() {
        String strH = i2.s.h(this.f60642a);
        String strH2 = i2.s.h(this.f60643b);
        String strH3 = i2.s.h(this.f60644c);
        String strH4 = i2.s.h(this.f60645d);
        String strH5 = i2.s.h(this.f60646e);
        StringBuilder sbW = b.c0.w("PrimaryButtonColors(background=", strH, ", onBackground=", strH2, ", successBackground=");
        b.c0.D(sbW, strH3, ", onSuccessBackground=", strH4, ", border=");
        return b.c0.q(sbW, strH5, ")");
    }
}
