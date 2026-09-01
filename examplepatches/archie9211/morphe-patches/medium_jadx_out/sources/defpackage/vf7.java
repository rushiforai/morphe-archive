package defpackage;

import com.medium.android.core.membership.UpsellInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vf7 implements bg7 {
    public final UpsellInfo a;
    public final String b;

    public vf7(UpsellInfo upsellInfo, String str) {
        str.getClass();
        this.a = upsellInfo;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vf7)) {
            return false;
        }
        vf7 vf7Var = (vf7) obj;
        return this.a.equals(vf7Var.a) && g76.L(this.b, vf7Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ShowMembershipPage(upsellInfo=" + this.a + ", source=" + this.b + ")";
    }
}
