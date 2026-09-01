package defpackage;

import com.medium.android.core.membership.UpsellInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jb1 implements bc1 {
    public final UpsellInfo a;
    public final String b;

    public jb1(UpsellInfo upsellInfo, String str) {
        this.a = upsellInfo;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jb1)) {
            return false;
        }
        jb1 jb1Var = (jb1) obj;
        return this.a.equals(jb1Var.a) && this.b.equals(jb1Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "GoToSubscriptionScreen(upsellInfo=" + this.a + ", source=" + this.b + ")";
    }
}
