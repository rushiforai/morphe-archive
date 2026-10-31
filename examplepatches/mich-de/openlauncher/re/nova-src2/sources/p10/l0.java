package p10;

import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l0 {

    /* renamed from: a, reason: collision with root package name */
    public final float f81815a;

    /* renamed from: b, reason: collision with root package name */
    public final float f81816b;

    /* renamed from: c, reason: collision with root package name */
    public final long f81817c;

    /* renamed from: d, reason: collision with root package name */
    public final float f81818d;

    /* renamed from: e, reason: collision with root package name */
    public final long f81819e;

    /* renamed from: f, reason: collision with root package name */
    public final long f81820f;

    /* renamed from: g, reason: collision with root package name */
    public final long f81821g;

    /* renamed from: h, reason: collision with root package name */
    public final float f81822h;

    /* renamed from: i, reason: collision with root package name */
    public final float f81823i;

    /* renamed from: j, reason: collision with root package name */
    public final long f81824j;

    /* renamed from: k, reason: collision with root package name */
    public final long f81825k;

    /* renamed from: l, reason: collision with root package name */
    public final long f81826l;

    /* renamed from: m, reason: collision with root package name */
    public final q3.p f81827m;
    public final float n;

    public l0() {
        long j11 = i2.s.f61136b;
        long j12 = w20.h.j(18);
        long j13 = w20.h.j(32);
        long j14 = w20.h.j(14);
        long j15 = i2.s.f61140f;
        long jB = i2.s.b(0.7f, j15);
        long jB2 = i2.s.b(0.26f, j15);
        this.f81815a = 80;
        this.f81816b = 0.5f;
        this.f81817c = j11;
        this.f81818d = 10;
        this.f81819e = j12;
        this.f81820f = j13;
        this.f81821g = j14;
        this.f81822h = 16;
        this.f81823i = 24;
        this.f81824j = j15;
        this.f81825k = jB;
        this.f81826l = jB2;
        this.f81827m = q3.p.f83588c;
        this.n = 80;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l0)) {
            return false;
        }
        l0 l0Var = (l0) obj;
        if (!y3.f.a(this.f81815a, l0Var.f81815a) || Float.compare(this.f81816b, l0Var.f81816b) != 0) {
            return false;
        }
        long j11 = l0Var.f81817c;
        int i5 = i2.s.n;
        return ULong.a(this.f81817c, j11) && y3.f.a(this.f81818d, l0Var.f81818d) && y3.p.a(this.f81819e, l0Var.f81819e) && y3.p.a(this.f81820f, l0Var.f81820f) && y3.p.a(this.f81821g, l0Var.f81821g) && y3.f.a(this.f81822h, l0Var.f81822h) && y3.f.a(this.f81823i, l0Var.f81823i) && ULong.a(this.f81824j, l0Var.f81824j) && ULong.a(this.f81825k, l0Var.f81825k) && ULong.a(this.f81826l, l0Var.f81826l) && Intrinsics.b(this.f81827m, l0Var.f81827m) && y3.f.a(this.n, l0Var.n);
    }

    public final int hashCode() {
        int iD = a80.m.d(this.f81816b, Float.hashCode(this.f81815a) * 31, 31);
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        int iD2 = a80.m.d(this.f81818d, b.c0.d(iD, 31, this.f81817c), 31);
        y3.q[] qVarArr = y3.p.f96616b;
        return Float.hashCode(this.n) + ((this.f81827m.hashCode() + b.c0.d(b.c0.d(b.c0.d(a80.m.d(this.f81823i, a80.m.d(this.f81822h, b.c0.d(b.c0.d(b.c0.d(iD2, 31, this.f81819e), 31, this.f81820f), 31, this.f81821g), 31), 31), 31, this.f81824j), 31, this.f81825k), 31, this.f81826l)) * 31);
    }

    public final String toString() {
        String strB = y3.f.b(this.f81815a);
        String strH = i2.s.h(this.f81817c);
        String strB2 = y3.f.b(this.f81818d);
        String strD = y3.p.d(this.f81819e);
        String strD2 = y3.p.d(this.f81820f);
        String strD3 = y3.p.d(this.f81821g);
        String strB3 = y3.f.b(this.f81822h);
        String strB4 = y3.f.b(this.f81823i);
        String strH2 = i2.s.h(this.f81824j);
        String strH3 = i2.s.h(this.f81825k);
        String strH4 = i2.s.h(this.f81826l);
        String strB5 = y3.f.b(this.n);
        StringBuilder sb2 = new StringBuilder("OnboardingRewardsTokens(heroIconSize=");
        sb2.append(strB);
        sb2.append(", heroGlyphRatio=");
        sb2.append(this.f81816b);
        sb2.append(", heroGlyphColor=");
        b.c0.D(sb2, strH, ", progressHeight=", strB2, ", bodyTextSize=");
        b.c0.D(sb2, strD, ", amountTextSize=", strD2, ", captionTextSize=");
        b.c0.D(sb2, strD3, ", contentSpacing=", strB3, ", sectionSpacing=");
        b.c0.D(sb2, strB4, ", contentColor=", strH2, ", secondaryContentColor=");
        b.c0.D(sb2, strH3, ", trackColor=", strH4, ", numericFont=");
        sb2.append(this.f81827m);
        sb2.append(", fabClearance=");
        sb2.append(strB5);
        sb2.append(")");
        return sb2.toString();
    }
}
