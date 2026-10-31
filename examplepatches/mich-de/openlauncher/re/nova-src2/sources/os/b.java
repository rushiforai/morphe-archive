package os;

import b.c0;
import i2.s;
import kotlin.ULong;

/* loaded from: classes4.dex */
public final class b {
    public final long A;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f80737a;

    /* renamed from: b, reason: collision with root package name */
    public final long f80738b;

    /* renamed from: c, reason: collision with root package name */
    public final long f80739c;

    /* renamed from: d, reason: collision with root package name */
    public final long f80740d;

    /* renamed from: e, reason: collision with root package name */
    public final long f80741e;

    /* renamed from: f, reason: collision with root package name */
    public final long f80742f;

    /* renamed from: g, reason: collision with root package name */
    public final long f80743g;

    /* renamed from: h, reason: collision with root package name */
    public final long f80744h;

    /* renamed from: i, reason: collision with root package name */
    public final long f80745i;

    /* renamed from: j, reason: collision with root package name */
    public final long f80746j;

    /* renamed from: k, reason: collision with root package name */
    public final long f80747k;

    /* renamed from: l, reason: collision with root package name */
    public final long f80748l;

    /* renamed from: m, reason: collision with root package name */
    public final long f80749m;
    public final long n;
    public final long o;

    /* renamed from: p, reason: collision with root package name */
    public final long f80750p;

    /* renamed from: q, reason: collision with root package name */
    public final long f80751q;

    /* renamed from: r, reason: collision with root package name */
    public final long f80752r;

    /* renamed from: s, reason: collision with root package name */
    public final long f80753s;

    /* renamed from: t, reason: collision with root package name */
    public final long f80754t;

    /* renamed from: u, reason: collision with root package name */
    public final long f80755u;

    /* renamed from: v, reason: collision with root package name */
    public final long f80756v;

    /* renamed from: w, reason: collision with root package name */
    public final long f80757w;

    /* renamed from: x, reason: collision with root package name */
    public final long f80758x;

    /* renamed from: y, reason: collision with root package name */
    public final long f80759y;

    /* renamed from: z, reason: collision with root package name */
    public final long f80760z;

    public b(boolean z11, long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, long j21, long j22, long j23, long j24, long j25, long j26, long j27, long j28, long j29, long j31, long j32, long j33, long j34, long j35, long j36, long j37, long j38) {
        this.f80737a = z11;
        this.f80738b = j11;
        this.f80739c = j12;
        this.f80740d = j13;
        this.f80741e = j14;
        this.f80742f = j15;
        this.f80743g = j16;
        this.f80744h = j17;
        this.f80745i = j18;
        this.f80746j = j19;
        this.f80747k = j21;
        this.f80748l = j22;
        this.f80749m = j23;
        this.n = j24;
        this.o = j25;
        this.f80750p = j26;
        this.f80751q = j27;
        this.f80752r = j28;
        this.f80753s = j29;
        this.f80754t = j31;
        this.f80755u = j32;
        this.f80756v = j33;
        this.f80757w = j34;
        this.f80758x = j35;
        this.f80759y = j36;
        this.f80760z = j37;
        this.A = j38;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (this.f80737a != bVar.f80737a) {
            return false;
        }
        long j11 = bVar.f80738b;
        int i5 = s.n;
        return ULong.a(this.f80738b, j11) && ULong.a(this.f80739c, bVar.f80739c) && ULong.a(this.f80740d, bVar.f80740d) && ULong.a(this.f80741e, bVar.f80741e) && ULong.a(this.f80742f, bVar.f80742f) && ULong.a(this.f80743g, bVar.f80743g) && ULong.a(this.f80744h, bVar.f80744h) && ULong.a(this.f80745i, bVar.f80745i) && ULong.a(this.f80746j, bVar.f80746j) && ULong.a(this.f80747k, bVar.f80747k) && ULong.a(this.f80748l, bVar.f80748l) && ULong.a(this.f80749m, bVar.f80749m) && ULong.a(this.n, bVar.n) && ULong.a(this.o, bVar.o) && ULong.a(this.f80750p, bVar.f80750p) && ULong.a(this.f80751q, bVar.f80751q) && ULong.a(this.f80752r, bVar.f80752r) && ULong.a(this.f80753s, bVar.f80753s) && ULong.a(this.f80754t, bVar.f80754t) && ULong.a(this.f80755u, bVar.f80755u) && ULong.a(this.f80756v, bVar.f80756v) && ULong.a(this.f80757w, bVar.f80757w) && ULong.a(this.f80758x, bVar.f80758x) && ULong.a(this.f80759y, bVar.f80759y) && ULong.a(this.f80760z, bVar.f80760z) && ULong.a(this.A, bVar.A);
    }

    public final int hashCode() {
        int iHashCode = Boolean.hashCode(this.f80737a) * 31;
        int i5 = s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.A) + c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(iHashCode, 31, this.f80738b), 31, this.f80739c), 31, this.f80740d), 31, this.f80741e), 31, this.f80742f), 31, this.f80743g), 31, this.f80744h), 31, this.f80745i), 31, this.f80746j), 31, this.f80747k), 31, this.f80748l), 31, this.f80749m), 31, this.n), 31, this.o), 31, this.f80750p), 31, this.f80751q), 31, this.f80752r), 31, this.f80753s), 31, this.f80754t), 31, this.f80755u), 31, this.f80756v), 31, this.f80757w), 31, this.f80758x), 31, this.f80759y), 31, this.f80760z);
    }

    public final String toString() {
        String strH = s.h(this.f80738b);
        String strH2 = s.h(this.f80739c);
        String strH3 = s.h(this.f80740d);
        String strH4 = s.h(this.f80741e);
        String strH5 = s.h(this.f80742f);
        String strH6 = s.h(this.f80743g);
        String strH7 = s.h(this.f80744h);
        String strH8 = s.h(this.f80745i);
        String strH9 = s.h(this.f80746j);
        String strH10 = s.h(this.f80747k);
        String strH11 = s.h(this.f80748l);
        String strH12 = s.h(this.f80749m);
        String strH13 = s.h(this.n);
        String strH14 = s.h(this.o);
        String strH15 = s.h(this.f80750p);
        String strH16 = s.h(this.f80751q);
        String strH17 = s.h(this.f80752r);
        String strH18 = s.h(this.f80753s);
        String strH19 = s.h(this.f80754t);
        String strH20 = s.h(this.f80755u);
        String strH21 = s.h(this.f80756v);
        String strH22 = s.h(this.f80757w);
        String strH23 = s.h(this.f80758x);
        String strH24 = s.h(this.f80759y);
        String strH25 = s.h(this.f80760z);
        String strH26 = s.h(this.A);
        StringBuilder sb2 = new StringBuilder("LinkColors(isDark=");
        sb2.append(this.f80737a);
        sb2.append(", surfacePrimary=");
        sb2.append(strH);
        sb2.append(", surfaceSecondary=");
        c0.D(sb2, strH2, ", surfaceTertiary=", strH3, ", surfaceBackdrop=");
        c0.D(sb2, strH4, ", borderDefault=", strH5, ", borderSelected=");
        c0.D(sb2, strH6, ", borderCritical=", strH7, ", buttonPrimary=");
        c0.D(sb2, strH8, ", buttonTertiary=", strH9, ", buttonBrand=");
        c0.D(sb2, strH10, ", buttonCritical=", strH11, ", textPrimary=");
        c0.D(sb2, strH12, ", textSecondary=", strH13, ", textTertiary=");
        c0.D(sb2, strH14, ", textWhite=", strH15, ", textBrand=");
        c0.D(sb2, strH16, ", textCritical=", strH17, ", onButtonPrimary=");
        c0.D(sb2, strH18, ", onButtonBrand=", strH19, ", iconPrimary=");
        c0.D(sb2, strH20, ", iconSecondary=", strH21, ", iconTertiary=");
        c0.D(sb2, strH22, ", iconWhite=", strH23, ", iconBrand=");
        c0.D(sb2, strH24, ", iconCritical=", strH25, ", outline=");
        return c0.q(sb2, strH26, ")");
    }
}
