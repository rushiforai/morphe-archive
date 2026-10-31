package cy;

import b.c9;
import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final String f48469a;

    /* renamed from: b, reason: collision with root package name */
    public final String f48470b;

    /* renamed from: c, reason: collision with root package name */
    public final String f48471c;

    /* renamed from: d, reason: collision with root package name */
    public final int f48472d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f48473e;

    /* renamed from: f, reason: collision with root package name */
    public final m0 f48474f;

    /* renamed from: g, reason: collision with root package name */
    public final String f48475g;

    /* renamed from: h, reason: collision with root package name */
    public final long f48476h;

    /* renamed from: i, reason: collision with root package name */
    public final int f48477i;

    public g(String str, String str2, String str3, int i5, boolean z11, m0 m0Var, String str4, long j11, int i11) {
        this.f48469a = str;
        this.f48470b = str2;
        this.f48471c = str3;
        this.f48472d = i5;
        this.f48473e = z11;
        this.f48474f = m0Var;
        this.f48475g = str4;
        this.f48476h = j11;
        this.f48477i = i11;
    }

    public final boolean a() {
        return this.f48473e;
    }

    public final String b() {
        return this.f48470b;
    }

    public final String c() {
        return this.f48469a;
    }

    public final int d() {
        return this.f48472d;
    }

    public final String e() {
        return this.f48471c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.f48469a, gVar.f48469a) && Intrinsics.b(this.f48470b, gVar.f48470b) && Intrinsics.b(this.f48471c, gVar.f48471c) && this.f48472d == gVar.f48472d && this.f48473e == gVar.f48473e && Intrinsics.b(this.f48474f, gVar.f48474f) && Intrinsics.b(this.f48475g, gVar.f48475g) && this.f48476h == gVar.f48476h && this.f48477i == gVar.f48477i;
    }

    public final int hashCode() {
        int iHashCode = this.f48469a.hashCode() * 31;
        String str = this.f48470b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f48471c;
        int iHashCode3 = (this.f48474f.hashCode() + c9.f(u4.a(this.f48472d, (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31, 31), 31, this.f48473e)) * 31;
        String str3 = this.f48475g;
        return Integer.hashCode(this.f48477i) + b.c0.d((iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 31, 31, this.f48476h);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("SubscriptionInfo(price=", this.f48469a, ", period=", this.f48470b, ", trialUnit=");
        sbW.append(this.f48471c);
        sbW.append(", trialCount=");
        sbW.append(this.f48472d);
        sbW.append(", hasTrial=");
        sbW.append(this.f48473e);
        sbW.append(", tier=");
        sbW.append(this.f48474f);
        sbW.append(", offerToken=");
        sbW.append(this.f48475g);
        sbW.append(", priceAmountMicros=");
        sbW.append(this.f48476h);
        sbW.append(", billingPeriodMonths=");
        sbW.append(this.f48477i);
        sbW.append(")");
        return sbW.toString();
    }

    public /* synthetic */ g(String str, String str2, String str3, int i5, boolean z11, m0 m0Var, String str4, long j11, int i11, int i12) {
        this(str, str2, str3, (i12 & 8) != 0 ? 0 : i5, z11, (i12 & 32) != 0 ? l0.f48505c : m0Var, (i12 & 64) != 0 ? null : str4, (i12 & 128) != 0 ? 0L : j11, (i12 & 256) != 0 ? 0 : i11);
    }
}
