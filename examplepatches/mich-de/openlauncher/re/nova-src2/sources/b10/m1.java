package b10;

import b.c9;
import b.u4;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m1 {

    /* renamed from: a, reason: collision with root package name */
    public final b2 f16785a;

    /* renamed from: b, reason: collision with root package name */
    public final z1 f16786b;

    /* renamed from: c, reason: collision with root package name */
    public final String f16787c;

    /* renamed from: d, reason: collision with root package name */
    public final String f16788d;

    /* renamed from: e, reason: collision with root package name */
    public final String f16789e;

    /* renamed from: f, reason: collision with root package name */
    public final String f16790f;

    /* renamed from: g, reason: collision with root package name */
    public final List f16791g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f16792h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f16793i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f16794j;

    /* renamed from: k, reason: collision with root package name */
    public final String f16795k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f16796l;

    /* renamed from: m, reason: collision with root package name */
    public final String f16797m;

    public m1(b2 b2Var, z1 z1Var, String str, String str2, String str3, String str4, List list, boolean z11, boolean z12, boolean z13, String str5, boolean z14, String str6) {
        this.f16785a = b2Var;
        this.f16786b = z1Var;
        this.f16787c = str;
        this.f16788d = str2;
        this.f16789e = str3;
        this.f16790f = str4;
        this.f16791g = list;
        this.f16792h = z11;
        this.f16793i = z12;
        this.f16794j = z13;
        this.f16795k = str5;
        this.f16796l = z14;
        this.f16797m = str6;
    }

    public final z1 a() {
        return this.f16786b;
    }

    public final boolean b() {
        return this.f16796l;
    }

    public final String c() {
        return this.f16788d;
    }

    public final String d() {
        return this.f16787c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m1)) {
            return false;
        }
        m1 m1Var = (m1) obj;
        return this.f16785a == m1Var.f16785a && this.f16786b == m1Var.f16786b && Intrinsics.b(this.f16787c, m1Var.f16787c) && Intrinsics.b(this.f16788d, m1Var.f16788d) && Intrinsics.b(this.f16789e, m1Var.f16789e) && Intrinsics.b(this.f16790f, m1Var.f16790f) && Intrinsics.b(this.f16791g, m1Var.f16791g) && this.f16792h == m1Var.f16792h && this.f16793i == m1Var.f16793i && this.f16794j == m1Var.f16794j && Intrinsics.b(this.f16795k, m1Var.f16795k) && this.f16796l == m1Var.f16796l && Intrinsics.b(this.f16797m, m1Var.f16797m);
    }

    public final int hashCode() {
        return this.f16797m.hashCode() + c9.f(b.c0.e(c9.f(c9.f(c9.f(u4.c(b.c0.e(b.c0.e(b.c0.e(b.c0.e((this.f16786b.hashCode() + (this.f16785a.hashCode() * 31)) * 31, 31, this.f16787c), 31, this.f16788d), 31, this.f16789e), 31, this.f16790f), 31, this.f16791g), 31, this.f16792h), 31, this.f16793i), 31, this.f16794j), 31, this.f16795k), 31, this.f16796l);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PaywallConfig(position=");
        sb2.append(this.f16785a);
        sb2.append(", dismissStyle=");
        sb2.append(this.f16786b);
        sb2.append(", titleOverride=");
        b.c0.D(sb2, this.f16787c, ", subtitleOverride=", this.f16788d, ", ctaTextOverride=");
        b.c0.D(sb2, this.f16789e, ", socialProofText=", this.f16790f, ", featureIds=");
        sb2.append(this.f16791g);
        sb2.append(", showAnnualToggle=");
        sb2.append(this.f16792h);
        sb2.append(", highlightSavings=");
        a80.m.s(sb2, this.f16793i, ", showTrialBadge=", this.f16794j, ", layoutVariant=");
        a80.m.q(this.f16795k, ", plusEnabled=", ", defaultPlusPeriod=", sb2, this.f16796l);
        return b.c0.q(sb2, this.f16797m, ")");
    }
}
