package ft;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public final String f55987a;

    /* renamed from: b, reason: collision with root package name */
    public final String f55988b;

    /* renamed from: c, reason: collision with root package name */
    public final String f55989c;

    /* renamed from: d, reason: collision with root package name */
    public final String f55990d;

    /* renamed from: e, reason: collision with root package name */
    public final d0 f55991e;

    /* renamed from: f, reason: collision with root package name */
    public final String f55992f;

    /* renamed from: g, reason: collision with root package name */
    public final Integer f55993g;

    /* renamed from: h, reason: collision with root package name */
    public final String f55994h;

    public o(String uniqueId, String str, String str2, String str3, d0 d0Var, String str4, Integer num, String str5) {
        v0 v0Var = v0.f56064a;
        Intrinsics.g(uniqueId, "uniqueId");
        this.f55987a = uniqueId;
        this.f55988b = str;
        this.f55989c = str2;
        this.f55990d = str3;
        this.f55991e = d0Var;
        this.f55992f = str4;
        this.f55993g = num;
        this.f55994h = str5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o)) {
            return false;
        }
        o oVar = (o) obj;
        if (!Intrinsics.b(this.f55987a, oVar.f55987a)) {
            return false;
        }
        v0 v0Var = v0.f56064a;
        return Intrinsics.b(this.f55988b, oVar.f55988b) && Intrinsics.b(this.f55989c, oVar.f55989c) && Intrinsics.b(this.f55990d, oVar.f55990d) && this.f55991e == oVar.f55991e && Intrinsics.b(this.f55992f, oVar.f55992f) && Intrinsics.b(this.f55993g, oVar.f55993g) && Intrinsics.b(this.f55994h, oVar.f55994h);
    }

    public final int hashCode() {
        int iHashCode = (v0.f56064a.hashCode() + (this.f55987a.hashCode() * 923521)) * 31;
        String str = this.f55988b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f55989c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f55990d;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        d0 d0Var = this.f55991e;
        int iHashCode5 = (iHashCode4 + (d0Var == null ? 0 : d0Var.hashCode())) * 31;
        String str4 = this.f55992f;
        int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
        Integer num = this.f55993g;
        int iHashCode7 = (iHashCode6 + (num == null ? 0 : num.hashCode())) * 31;
        String str5 = this.f55994h;
        return iHashCode7 + (str5 != null ? str5.hashCode() : 0);
    }

    public final String toString() {
        v0 v0Var = v0.f56064a;
        StringBuilder sb2 = new StringBuilder("CreateFinancialConnectionsSessionForDeferredPaymentParams(uniqueId=");
        sb2.append(this.f55987a);
        sb2.append(", initialInstitution=null, manualEntryOnly=null, searchSession=null, verificationMethod=");
        sb2.append(v0Var);
        sb2.append(", hostedSurface=");
        b.c0.D(sb2, this.f55988b, ", customer=", this.f55989c, ", onBehalfOf=");
        sb2.append(this.f55990d);
        sb2.append(", linkMode=");
        sb2.append(this.f55991e);
        sb2.append(", product=");
        sb2.append(this.f55992f);
        sb2.append(", amount=");
        sb2.append(this.f55993g);
        sb2.append(", currency=");
        return b.c0.q(sb2, this.f55994h, ")");
    }
}
