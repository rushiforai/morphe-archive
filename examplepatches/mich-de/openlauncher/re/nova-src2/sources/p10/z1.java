package p10;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class z1 {

    /* renamed from: a, reason: collision with root package name */
    public final float f81990a;

    /* renamed from: b, reason: collision with root package name */
    public final float f81991b;

    /* renamed from: c, reason: collision with root package name */
    public final float f81992c;

    /* renamed from: d, reason: collision with root package name */
    public final long f81993d;

    /* renamed from: e, reason: collision with root package name */
    public final long f81994e;

    /* renamed from: f, reason: collision with root package name */
    public final float f81995f;

    /* renamed from: g, reason: collision with root package name */
    public final float f81996g;

    /* renamed from: h, reason: collision with root package name */
    public final float f81997h;

    /* renamed from: i, reason: collision with root package name */
    public final int f81998i;

    /* renamed from: j, reason: collision with root package name */
    public final q3.s f81999j;

    /* renamed from: k, reason: collision with root package name */
    public final q3.p f82000k;

    public z1() {
        long j11 = w20.h.j(48);
        long j12 = w20.h.j(20);
        q3.s sVar = h1.f81783a;
        this.f81990a = 24;
        this.f81991b = 20;
        this.f81992c = 20;
        this.f81993d = j11;
        this.f81994e = j12;
        this.f81995f = 8;
        this.f81996g = 10;
        this.f81997h = 8;
        this.f81998i = 10;
        this.f81999j = sVar;
        this.f82000k = q3.p.f83588c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z1)) {
            return false;
        }
        z1 z1Var = (z1) obj;
        return y3.f.a(this.f81990a, z1Var.f81990a) && y3.f.a(this.f81991b, z1Var.f81991b) && y3.f.a(this.f81992c, z1Var.f81992c) && y3.p.a(this.f81993d, z1Var.f81993d) && y3.p.a(this.f81994e, z1Var.f81994e) && y3.f.a(this.f81995f, z1Var.f81995f) && y3.f.a(this.f81996g, z1Var.f81996g) && y3.f.a(this.f81997h, z1Var.f81997h) && this.f81998i == z1Var.f81998i && Intrinsics.b(this.f81999j, z1Var.f81999j) && Intrinsics.b(this.f82000k, z1Var.f82000k);
    }

    public final int hashCode() {
        int iD = a80.m.d(this.f81992c, a80.m.d(this.f81991b, Float.hashCode(this.f81990a) * 31, 31), 31);
        y3.q[] qVarArr = y3.p.f96616b;
        return this.f82000k.hashCode() + u4.c(u4.a(this.f81998i, a80.m.d(this.f81997h, a80.m.d(this.f81996g, a80.m.d(this.f81995f, b.c0.d(b.c0.d(iD, 31, this.f81993d), 31, this.f81994e), 31), 31), 31), 31), 31, this.f81999j.f83597d);
    }

    public final String toString() {
        String strB = y3.f.b(this.f81990a);
        String strB2 = y3.f.b(this.f81991b);
        String strB3 = y3.f.b(this.f81992c);
        String strD = y3.p.d(this.f81993d);
        String strD2 = y3.p.d(this.f81994e);
        String strB4 = y3.f.b(this.f81995f);
        String strB5 = y3.f.b(this.f81996g);
        String strB6 = y3.f.b(this.f81997h);
        StringBuilder sbW = b.c0.w("RewardsScreenTokens(cornerRadius=", strB, ", cardCornerRadius=", strB2, ", sectionSpacing=");
        b.c0.D(sbW, strB3, ", balanceTextSize=", strD, ", headingTextSize=");
        b.c0.D(sbW, strD2, ", progressHeight=", strB4, ", streakDotSize=");
        b.c0.D(sbW, strB5, ", streakDotSpacing=", strB6, ", maxStreakDots=");
        sbW.append(this.f81998i);
        sbW.append(", brandFont=");
        sbW.append(this.f81999j);
        sbW.append(", numericFont=");
        sbW.append(this.f82000k);
        sbW.append(")");
        return sbW.toString();
    }
}
