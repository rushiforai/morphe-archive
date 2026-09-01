package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kqc implements s79 {
    public final String a;
    public final String b;
    public final String c;
    public final SourceParameter d;
    public final UpsellInfo e;
    public final az5 f;
    public final r79 g;

    public kqc(String str, String str2, String str3, SourceParameter sourceParameter, UpsellInfo upsellInfo, az5 az5Var) {
        str.getClass();
        az5Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = sourceParameter;
        this.e = upsellInfo;
        this.f = az5Var;
        this.g = r79.STATIC;
    }

    @Override // defpackage.s79
    public final SourceParameter a() {
        return this.d;
    }

    @Override // defpackage.s79
    public final String b() {
        return this.a;
    }

    @Override // defpackage.s79
    public final r79 c() {
        return this.g;
    }

    @Override // defpackage.s79
    public final String d() {
        return this.b;
    }

    @Override // defpackage.s79
    public final UpsellInfo e() {
        return this.e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kqc)) {
            return false;
        }
        kqc kqcVar = (kqc) obj;
        return g76.L(this.a, kqcVar.a) && g76.L(this.b, kqcVar.b) && g76.L(this.c, kqcVar.c) && this.d.equals(kqcVar.d) && this.e.equals(kqcVar.e) && g76.L(this.f, kqcVar.f);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        return this.f.hashCode() + ((this.e.hashCode() + ev6.o(this.d, (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31, 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("StaticPaywallUiModel(postId=", this.a, ", currentUserId=", this.b, ", currentUserName=");
        sbU.append(this.c);
        sbU.append(", sourceParameter=");
        sbU.append(this.d);
        sbU.append(", upsellInfo=");
        sbU.append(this.e);
        sbU.append(", freeTrialPeriods=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}
