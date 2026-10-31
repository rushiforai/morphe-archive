package cy;

import b.c9;
import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final i f48479a;

    /* renamed from: b, reason: collision with root package name */
    public final String f48480b;

    /* renamed from: c, reason: collision with root package name */
    public final String f48481c;

    /* renamed from: d, reason: collision with root package name */
    public final String f48482d;

    /* renamed from: e, reason: collision with root package name */
    public final String f48483e;

    /* renamed from: f, reason: collision with root package name */
    public final String f48484f;

    /* renamed from: g, reason: collision with root package name */
    public final int f48485g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f48486h;

    /* renamed from: i, reason: collision with root package name */
    public final Boolean f48487i;

    /* renamed from: j, reason: collision with root package name */
    public final Long f48488j;

    public h(i iVar, String str, String str2, String str3, String str4, String str5, int i5, boolean z11, Boolean bool, Long l9) {
        this.f48479a = iVar;
        this.f48480b = str;
        this.f48481c = str2;
        this.f48482d = str3;
        this.f48483e = str4;
        this.f48484f = str5;
        this.f48485g = i5;
        this.f48486h = z11;
        this.f48487i = bool;
        this.f48488j = l9;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return this.f48479a == hVar.f48479a && Intrinsics.b(this.f48480b, hVar.f48480b) && Intrinsics.b(this.f48481c, hVar.f48481c) && Intrinsics.b(this.f48482d, hVar.f48482d) && Intrinsics.b(this.f48483e, hVar.f48483e) && Intrinsics.b(this.f48484f, hVar.f48484f) && this.f48485g == hVar.f48485g && this.f48486h == hVar.f48486h && Intrinsics.b(this.f48487i, hVar.f48487i) && Intrinsics.b(this.f48488j, hVar.f48488j);
    }

    public final int hashCode() {
        int iHashCode = this.f48479a.hashCode() * 31;
        String str = this.f48480b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f48481c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f48482d;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f48483e;
        int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f48484f;
        int iF = c9.f(u4.a(this.f48485g, (iHashCode5 + (str5 == null ? 0 : str5.hashCode())) * 31, 31), 31, this.f48486h);
        Boolean bool = this.f48487i;
        int iHashCode6 = (iF + (bool == null ? 0 : bool.hashCode())) * 31;
        Long l9 = this.f48488j;
        return iHashCode6 + (l9 != null ? l9.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SubscriptionManageInfo(status=");
        sb2.append(this.f48479a);
        sb2.append(", productId=");
        sb2.append(this.f48480b);
        sb2.append(", productName=");
        b.c0.D(sb2, this.f48481c, ", price=", this.f48482d, ", period=");
        b.c0.D(sb2, this.f48483e, ", trialUnit=", this.f48484f, ", trialCount=");
        sb2.append(this.f48485g);
        sb2.append(", hasTrial=");
        sb2.append(this.f48486h);
        sb2.append(", isAutoRenewing=");
        sb2.append(this.f48487i);
        sb2.append(", purchaseTime=");
        sb2.append(this.f48488j);
        sb2.append(")");
        return sb2.toString();
    }
}
