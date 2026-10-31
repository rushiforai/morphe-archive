package hw;

import b.c0;
import b.u4;
import kotlin.jvm.internal.Intrinsics;
import m3.p0;

/* loaded from: classes4.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final int f60802a;

    /* renamed from: b, reason: collision with root package name */
    public final int f60803b;

    /* renamed from: c, reason: collision with root package name */
    public final int f60804c;

    /* renamed from: d, reason: collision with root package name */
    public final float f60805d;

    /* renamed from: e, reason: collision with root package name */
    public final long f60806e;

    /* renamed from: f, reason: collision with root package name */
    public final long f60807f;

    /* renamed from: g, reason: collision with root package name */
    public final long f60808g;

    /* renamed from: h, reason: collision with root package name */
    public final long f60809h;

    /* renamed from: i, reason: collision with root package name */
    public final long f60810i;

    /* renamed from: j, reason: collision with root package name */
    public final long f60811j;

    /* renamed from: k, reason: collision with root package name */
    public final Integer f60812k;

    /* renamed from: l, reason: collision with root package name */
    public final p0 f60813l;

    /* renamed from: m, reason: collision with root package name */
    public final q3.p f60814m;
    public final q3.p n;
    public final q3.p o;

    /* renamed from: p, reason: collision with root package name */
    public final q3.p f60815p;

    /* renamed from: q, reason: collision with root package name */
    public final q3.p f60816q;

    /* renamed from: r, reason: collision with root package name */
    public final q3.p f60817r;

    public s(int i5, int i11, int i12, float f11, long j11, long j12, long j13, long j14, long j15, long j16, Integer num, p0 p0Var, q3.p pVar, q3.p pVar2, q3.p pVar3, q3.p pVar4, q3.p pVar5, q3.p pVar6) {
        this.f60802a = i5;
        this.f60803b = i11;
        this.f60804c = i12;
        this.f60805d = f11;
        this.f60806e = j11;
        this.f60807f = j12;
        this.f60808g = j13;
        this.f60809h = j14;
        this.f60810i = j15;
        this.f60811j = j16;
        this.f60812k = num;
        this.f60813l = p0Var;
        this.f60814m = pVar;
        this.n = pVar2;
        this.o = pVar3;
        this.f60815p = pVar4;
        this.f60816q = pVar5;
        this.f60817r = pVar6;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return this.f60802a == sVar.f60802a && this.f60803b == sVar.f60803b && this.f60804c == sVar.f60804c && Float.compare(this.f60805d, sVar.f60805d) == 0 && y3.p.a(this.f60806e, sVar.f60806e) && y3.p.a(this.f60807f, sVar.f60807f) && y3.p.a(this.f60808g, sVar.f60808g) && y3.p.a(this.f60809h, sVar.f60809h) && y3.p.a(this.f60810i, sVar.f60810i) && y3.p.a(this.f60811j, sVar.f60811j) && Intrinsics.b(this.f60812k, sVar.f60812k) && Intrinsics.b(this.f60813l, sVar.f60813l) && Intrinsics.b(this.f60814m, sVar.f60814m) && Intrinsics.b(this.n, sVar.n) && Intrinsics.b(this.o, sVar.o) && Intrinsics.b(this.f60815p, sVar.f60815p) && Intrinsics.b(this.f60816q, sVar.f60816q) && Intrinsics.b(this.f60817r, sVar.f60817r);
    }

    public final int hashCode() {
        int iD = a80.m.d(this.f60805d, u4.a(this.f60804c, u4.a(this.f60803b, Integer.hashCode(this.f60802a) * 31, 31), 31), 31);
        y3.q[] qVarArr = y3.p.f96616b;
        int iD2 = c0.d(c0.d(c0.d(c0.d(c0.d(c0.d(iD, 31, this.f60806e), 31, this.f60807f), 31, this.f60808g), 31, this.f60809h), 31, this.f60810i), 31, this.f60811j);
        Integer num = this.f60812k;
        int iHashCode = (iD2 + (num == null ? 0 : num.hashCode())) * 31;
        p0 p0Var = this.f60813l;
        int iHashCode2 = (iHashCode + (p0Var == null ? 0 : p0Var.hashCode())) * 31;
        q3.p pVar = this.f60814m;
        int iHashCode3 = (iHashCode2 + (pVar == null ? 0 : pVar.hashCode())) * 31;
        q3.p pVar2 = this.n;
        int iHashCode4 = (iHashCode3 + (pVar2 == null ? 0 : pVar2.hashCode())) * 31;
        q3.p pVar3 = this.o;
        int iHashCode5 = (iHashCode4 + (pVar3 == null ? 0 : pVar3.hashCode())) * 31;
        q3.p pVar4 = this.f60815p;
        int iHashCode6 = (iHashCode5 + (pVar4 == null ? 0 : pVar4.hashCode())) * 31;
        q3.p pVar5 = this.f60816q;
        int iHashCode7 = (iHashCode6 + (pVar5 == null ? 0 : pVar5.hashCode())) * 31;
        q3.p pVar6 = this.f60817r;
        return iHashCode7 + (pVar6 != null ? pVar6.hashCode() : 0);
    }

    public final String toString() {
        String strD = y3.p.d(this.f60806e);
        String strD2 = y3.p.d(this.f60807f);
        String strD3 = y3.p.d(this.f60808g);
        String strD4 = y3.p.d(this.f60809h);
        String strD5 = y3.p.d(this.f60810i);
        String strD6 = y3.p.d(this.f60811j);
        StringBuilder sbT = c0.t(this.f60802a, "StripeTypography(fontWeightNormal=", ", fontWeightMedium=", this.f60803b, ", fontWeightBold=");
        sbT.append(this.f60804c);
        sbT.append(", fontSizeMultiplier=");
        sbT.append(this.f60805d);
        sbT.append(", xxSmallFontSize=");
        c0.D(sbT, strD, ", xSmallFontSize=", strD2, ", smallFontSize=");
        c0.D(sbT, strD3, ", mediumFontSize=", strD4, ", largeFontSize=");
        c0.D(sbT, strD5, ", xLargeFontSize=", strD6, ", fontFamily=");
        sbT.append(this.f60812k);
        sbT.append(", h4=");
        sbT.append(this.f60813l);
        sbT.append(", body1FontFamily=");
        sbT.append(this.f60814m);
        sbT.append(", body2FontFamily=");
        sbT.append(this.n);
        sbT.append(", h5FontFamily=");
        sbT.append(this.o);
        sbT.append(", h6FontFamily=");
        sbT.append(this.f60815p);
        sbT.append(", subtitle1FontFamily=");
        sbT.append(this.f60816q);
        sbT.append(", captionFontFamily=");
        sbT.append(this.f60817r);
        sbT.append(")");
        return sbT.toString();
    }
}
