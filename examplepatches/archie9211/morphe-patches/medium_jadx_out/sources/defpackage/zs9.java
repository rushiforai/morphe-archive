package defpackage;

import com.medium.android.core.membership.UpsellInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zs9 implements ou9 {
    public final UpsellInfo a;
    public final String b;

    public zs9(UpsellInfo upsellInfo, String str) {
        upsellInfo.getClass();
        this.a = upsellInfo;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zs9)) {
            return false;
        }
        zs9 zs9Var = (zs9) obj;
        return g76.L(this.a, zs9Var.a) && this.b.equals(zs9Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "NavigateToMembershipPage(upsellInfo=" + this.a + ", source=" + this.b + ")";
    }
}
