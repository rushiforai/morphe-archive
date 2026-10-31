package ox;

import b.c9;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f81072a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f81073b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f81074c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f81075d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f81076e;

    public g(boolean z11, boolean z12, boolean z13, boolean z14, boolean z15) {
        this.f81072a = z11;
        this.f81073b = z12;
        this.f81074c = z13;
        this.f81075d = z14;
        this.f81076e = z15;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f81072a == gVar.f81072a && this.f81073b == gVar.f81073b && this.f81074c == gVar.f81074c && this.f81075d == gVar.f81075d && this.f81076e == gVar.f81076e;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f81076e) + c9.f(c9.f(c9.f(Boolean.hashCode(this.f81072a) * 31, 31, this.f81073b), 31, this.f81074c), 31, this.f81075d);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ConsentStatus(consentDetermined=");
        sb2.append(this.f81072a);
        sb2.append(", gdprApplies=");
        sb2.append(this.f81073b);
        sb2.append(", deviceStorageConsent=");
        a80.m.s(sb2, this.f81074c, ", adUserDataConsent=", this.f81075d, ", adPersonalizationConsent=");
        return a80.m.k(sb2, this.f81076e, ")");
    }
}
