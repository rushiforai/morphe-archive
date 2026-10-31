package hw;

import b.c0;
import f1.t0;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final long f60753a;

    /* renamed from: b, reason: collision with root package name */
    public final long f60754b;

    /* renamed from: c, reason: collision with root package name */
    public final long f60755c;

    /* renamed from: d, reason: collision with root package name */
    public final long f60756d;

    /* renamed from: e, reason: collision with root package name */
    public final long f60757e;

    /* renamed from: f, reason: collision with root package name */
    public final long f60758f;

    /* renamed from: g, reason: collision with root package name */
    public final long f60759g;

    /* renamed from: h, reason: collision with root package name */
    public final long f60760h;

    /* renamed from: i, reason: collision with root package name */
    public final t0 f60761i;

    public n(long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, t0 t0Var) {
        this.f60753a = j11;
        this.f60754b = j12;
        this.f60755c = j13;
        this.f60756d = j14;
        this.f60757e = j15;
        this.f60758f = j16;
        this.f60759g = j17;
        this.f60760h = j18;
        this.f60761i = t0Var;
    }

    public static n a(n nVar, long j11, long j12, long j13, long j14, long j15, long j16, long j17, t0 t0Var, int i5) {
        long j18 = (i5 & 16) != 0 ? nVar.f60757e : j15;
        long j19 = nVar.f60758f;
        long j21 = (i5 & 128) != 0 ? nVar.f60760h : j17;
        nVar.getClass();
        return new n(j11, j12, j13, j14, j18, j19, j16, j21, t0Var);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        long j11 = nVar.f60753a;
        int i5 = i2.s.n;
        return ULong.a(this.f60753a, j11) && ULong.a(this.f60754b, nVar.f60754b) && ULong.a(this.f60755c, nVar.f60755c) && ULong.a(this.f60756d, nVar.f60756d) && ULong.a(this.f60757e, nVar.f60757e) && ULong.a(this.f60758f, nVar.f60758f) && ULong.a(this.f60759g, nVar.f60759g) && ULong.a(this.f60760h, nVar.f60760h) && Intrinsics.b(this.f60761i, nVar.f60761i);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return this.f60761i.hashCode() + c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(Long.hashCode(this.f60753a) * 31, 31, this.f60754b), 31, this.f60755c), 31, this.f60756d), 31, this.f60757e), 31, this.f60758f), 31, this.f60759g), 31, this.f60760h);
    }

    public final String toString() {
        String strH = i2.s.h(this.f60753a);
        String strH2 = i2.s.h(this.f60754b);
        String strH3 = i2.s.h(this.f60755c);
        String strH4 = i2.s.h(this.f60756d);
        String strH5 = i2.s.h(this.f60757e);
        String strH6 = i2.s.h(this.f60758f);
        String strH7 = i2.s.h(this.f60759g);
        String strH8 = i2.s.h(this.f60760h);
        StringBuilder sbW = c0.w("StripeColors(component=", strH, ", componentBorder=", strH2, ", componentDivider=");
        c0.D(sbW, strH3, ", onComponent=", strH4, ", subtitle=");
        c0.D(sbW, strH5, ", textCursor=", strH6, ", placeholderText=");
        c0.D(sbW, strH7, ", appBarIcon=", strH8, ", materialColors=");
        sbW.append(this.f60761i);
        sbW.append(")");
        return sbW.toString();
    }
}
