package hw;

import b.c0;
import kotlin.ULong;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final long f60736a;

    /* renamed from: b, reason: collision with root package name */
    public final long f60737b;

    /* renamed from: c, reason: collision with root package name */
    public final long f60738c;

    /* renamed from: d, reason: collision with root package name */
    public final long f60739d;

    /* renamed from: e, reason: collision with root package name */
    public final long f60740e;

    public i(long j11, long j12, long j13, long j14, long j15) {
        this.f60736a = j11;
        this.f60737b = j12;
        this.f60738c = j13;
        this.f60739d = j14;
        this.f60740e = j15;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        long j11 = iVar.f60736a;
        int i5 = i2.s.n;
        return ULong.a(this.f60736a, j11) && ULong.a(this.f60737b, iVar.f60737b) && ULong.a(this.f60738c, iVar.f60738c) && ULong.a(this.f60739d, iVar.f60739d) && ULong.a(this.f60740e, iVar.f60740e);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f60740e) + c0.d(c0.d(c0.d(Long.hashCode(this.f60736a) * 31, 31, this.f60737b), 31, this.f60738c), 31, this.f60739d);
    }

    public final String toString() {
        String strH = i2.s.h(this.f60736a);
        String strH2 = i2.s.h(this.f60737b);
        String strH3 = i2.s.h(this.f60738c);
        String strH4 = i2.s.h(this.f60739d);
        String strH5 = i2.s.h(this.f60740e);
        StringBuilder sbW = c0.w("PrimaryButtonColors(background=", strH, ", onBackground=", strH2, ", border=");
        c0.D(sbW, strH3, ", successBackground=", strH4, ", onSuccessBackground=");
        return c0.q(sbW, strH5, ")");
    }
}
