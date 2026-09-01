package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rn3 implements s79 {
    public final String a;
    public final String b;
    public final String c;
    public final SourceParameter d;
    public final UpsellInfo e;
    public final az5 f;
    public final String g;
    public final pn3 h;
    public final List i;
    public final r79 j;

    public rn3(String str, String str2, String str3, SourceParameter sourceParameter, UpsellInfo upsellInfo, az5 az5Var, String str4, pn3 pn3Var, List list) {
        r79 r79Var;
        str.getClass();
        az5Var.getClass();
        pn3Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = sourceParameter;
        this.e = upsellInfo;
        this.f = az5Var;
        this.g = str4;
        this.h = pn3Var;
        this.i = list;
        int i = qn3.a[pn3Var.ordinal()];
        if (i == 1) {
            r79Var = r79.ASPIRATIONAL;
        } else {
            if (i != 2) {
                ygf.a();
                throw null;
            }
            r79Var = r79.PROGRAMMING;
        }
        this.j = r79Var;
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
        return this.j;
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
        if (!(obj instanceof rn3)) {
            return false;
        }
        rn3 rn3Var = (rn3) obj;
        return g76.L(this.a, rn3Var.a) && g76.L(this.b, rn3Var.b) && g76.L(this.c, rn3Var.c) && this.d.equals(rn3Var.d) && this.e.equals(rn3Var.e) && g76.L(this.f, rn3Var.f) && g76.L(this.g, rn3Var.g) && this.h == rn3Var.h && this.i.equals(rn3Var.i);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iB = ka1.b(this.f, (this.e.hashCode() + ev6.o(this.d, (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31, 31)) * 31, 31);
        String str3 = this.g;
        return this.i.hashCode() + ((this.h.hashCode() + ((iB + (str3 != null ? str3.hashCode() : 0)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("DynamicPaywallUiModel(postId=", this.a, ", currentUserId=", this.b, ", currentUserName=");
        sbU.append(this.c);
        sbU.append(", sourceParameter=");
        sbU.append(this.d);
        sbU.append(", upsellInfo=");
        sbU.append(this.e);
        sbU.append(", freeTrialPeriods=");
        sbU.append(this.f);
        sbU.append(", authorName=");
        sbU.append(this.g);
        sbU.append(", type=");
        sbU.append(this.h);
        sbU.append(", creators=");
        return b09.B(sbU, this.i, ")");
    }
}
