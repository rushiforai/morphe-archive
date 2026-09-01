package defpackage;

import com.medium.android.core.membership.UpsellInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class o35 implements q35 {
    public final String a;
    public final String b;
    public final zw7 c;
    public final UpsellInfo d;
    public final String e;

    public o35(String str, String str2, zw7 zw7Var, UpsellInfo upsellInfo, String str3) {
        str.getClass();
        zw7Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = zw7Var;
        this.d = upsellInfo;
        this.e = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o35)) {
            return false;
        }
        o35 o35Var = (o35) obj;
        return g76.L(this.a, o35Var.a) && g76.L(this.b, o35Var.b) && this.c == o35Var.c && this.d.equals(o35Var.d) && this.e.equals(o35Var.e);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("FriendLink(friendLinkCreatorId=", this.a, ", friendLinkCreatorName=", this.b, ", currentUserMembershipType=");
        sbU.append(this.c);
        sbU.append(", upsellInfo=");
        sbU.append(this.d);
        sbU.append(", source=");
        return ka1.v(sbU, this.e, ")");
    }
}
