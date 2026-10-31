package hv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final pw.a f60394a;

    /* renamed from: b, reason: collision with root package name */
    public final pw.a f60395b;

    /* renamed from: c, reason: collision with root package name */
    public final pw.a f60396c;

    /* renamed from: d, reason: collision with root package name */
    public final pw.a f60397d;

    /* renamed from: e, reason: collision with root package name */
    public final pw.a f60398e;

    /* renamed from: f, reason: collision with root package name */
    public final pw.a f60399f;

    /* renamed from: g, reason: collision with root package name */
    public final pw.a f60400g;

    /* renamed from: h, reason: collision with root package name */
    public final pw.a f60401h;

    /* renamed from: i, reason: collision with root package name */
    public final pw.a f60402i;

    public m(pw.a aVar, pw.a aVar2, pw.a aVar3, pw.a aVar4, pw.a aVar5, pw.a aVar6, pw.a aVar7, pw.a aVar8, pw.a aVar9) {
        this.f60394a = aVar;
        this.f60395b = aVar2;
        this.f60396c = aVar3;
        this.f60397d = aVar4;
        this.f60398e = aVar5;
        this.f60399f = aVar6;
        this.f60400g = aVar7;
        this.f60401h = aVar8;
        this.f60402i = aVar9;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return Intrinsics.b(this.f60394a, mVar.f60394a) && Intrinsics.b(this.f60395b, mVar.f60395b) && Intrinsics.b(this.f60396c, mVar.f60396c) && Intrinsics.b(this.f60397d, mVar.f60397d) && Intrinsics.b(this.f60398e, mVar.f60398e) && Intrinsics.b(this.f60399f, mVar.f60399f) && Intrinsics.b(this.f60400g, mVar.f60400g) && Intrinsics.b(this.f60401h, mVar.f60401h) && Intrinsics.b(this.f60402i, mVar.f60402i);
    }

    public final int hashCode() {
        pw.a aVar = this.f60394a;
        int iHashCode = (aVar == null ? 0 : aVar.hashCode()) * 31;
        pw.a aVar2 = this.f60395b;
        int iHashCode2 = (iHashCode + (aVar2 == null ? 0 : aVar2.hashCode())) * 31;
        pw.a aVar3 = this.f60396c;
        int iHashCode3 = (iHashCode2 + (aVar3 == null ? 0 : aVar3.hashCode())) * 31;
        pw.a aVar4 = this.f60397d;
        int iHashCode4 = (iHashCode3 + (aVar4 == null ? 0 : aVar4.hashCode())) * 31;
        pw.a aVar5 = this.f60398e;
        int iHashCode5 = (iHashCode4 + (aVar5 == null ? 0 : aVar5.hashCode())) * 31;
        pw.a aVar6 = this.f60399f;
        int iHashCode6 = (iHashCode5 + (aVar6 == null ? 0 : aVar6.hashCode())) * 31;
        pw.a aVar7 = this.f60400g;
        int iHashCode7 = (iHashCode6 + (aVar7 == null ? 0 : aVar7.hashCode())) * 31;
        pw.a aVar8 = this.f60401h;
        int iHashCode8 = (iHashCode7 + (aVar8 == null ? 0 : aVar8.hashCode())) * 31;
        pw.a aVar9 = this.f60402i;
        return iHashCode8 + (aVar9 != null ? aVar9.hashCode() : 0);
    }

    public final String toString() {
        return "BillingDetailsFormState(name=" + this.f60394a + ", email=" + this.f60395b + ", phone=" + this.f60396c + ", line1=" + this.f60397d + ", line2=" + this.f60398e + ", city=" + this.f60399f + ", postalCode=" + this.f60400g + ", state=" + this.f60401h + ", country=" + this.f60402i + ")";
    }
}
