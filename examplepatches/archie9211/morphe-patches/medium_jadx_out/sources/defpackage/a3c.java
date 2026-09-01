package defpackage;

import com.medium.android.data.preferences.DarkMode;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a3c implements b3c {
    public final String a;
    public final boolean b;
    public final DarkMode c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    public final boolean g;
    public final boolean h;
    public final boolean i;
    public final boolean j;
    public final String k;
    public final zw7 l;
    public final boolean m;
    public final boolean n;
    public final z2c o;
    public final SourceParameter p;

    public a3c(String str, boolean z, DarkMode darkMode, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, boolean z7, boolean z8, String str2, zw7 zw7Var, boolean z9, boolean z10, z2c z2cVar, SourceParameter sourceParameter) {
        str.getClass();
        darkMode.getClass();
        str2.getClass();
        zw7Var.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = z;
        this.c = darkMode;
        this.d = z2;
        this.e = z3;
        this.f = z4;
        this.g = z5;
        this.h = z6;
        this.i = z7;
        this.j = z8;
        this.k = str2;
        this.l = zw7Var;
        this.m = z9;
        this.n = z10;
        this.o = z2cVar;
        this.p = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a3c)) {
            return false;
        }
        a3c a3cVar = (a3c) obj;
        return g76.L(this.a, a3cVar.a) && this.b == a3cVar.b && this.c == a3cVar.c && this.d == a3cVar.d && this.e == a3cVar.e && this.f == a3cVar.f && this.g == a3cVar.g && this.h == a3cVar.h && this.i == a3cVar.i && this.j == a3cVar.j && g76.L(this.k, a3cVar.k) && this.l == a3cVar.l && this.m == a3cVar.m && this.n == a3cVar.n && g76.L(this.o, a3cVar.o) && g76.L(this.p, a3cVar.p);
    }

    public final int hashCode() {
        int iHashCode = (((((this.l.hashCode() + wgd.o((((((((((((((((this.c.hashCode() + (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31) + (this.h ? 1231 : 1237)) * 31) + (this.i ? 1231 : 1237)) * 31) + (this.j ? 1231 : 1237)) * 31, 31, this.k)) * 31) + (this.m ? 1231 : 1237)) * 31) + (this.n ? 1231 : 1237)) * 31;
        z2c z2cVar = this.o;
        return this.p.hashCode() + ((iHashCode + (z2cVar == null ? 0 : z2cVar.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbD = ev6.D("Main(currentUserId=", this.a, ", showSyncContacts=", ", darkMode=", this.b);
        sbD.append(this.c);
        sbD.append(", canShowX=");
        sbD.append(this.d);
        sbD.append(", canShowFacebook=");
        ho2.R(sbD, this.e, ", canShowMembershipItem=", this.f, ", canShowMembershipAndPaymentItem=");
        ho2.R(sbD, this.g, ", isXConnected=", this.h, ", isFacebookConnected=");
        ho2.R(sbD, this.i, ", isImageLoadingDisabled=", this.j, ", appVersion=");
        sbD.append(this.k);
        sbD.append(", currentUserMembershipType=");
        sbD.append(this.l);
        sbD.append(", canSeeAdminToolsAndFlags=");
        ho2.R(sbD, this.m, ", isLoading=", this.n, ", resubscribeMembershipUiModel=");
        sbD.append(this.o);
        sbD.append(", sourceParameter=");
        sbD.append(this.p);
        sbD.append(")");
        return sbD.toString();
    }
}
