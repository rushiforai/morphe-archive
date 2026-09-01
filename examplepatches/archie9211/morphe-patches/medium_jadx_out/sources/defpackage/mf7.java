package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mf7 implements nf7 {
    public final String a;
    public final boolean b;

    public mf7(String str, boolean z) {
        this.a = str;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mf7)) {
            return false;
        }
        mf7 mf7Var = (mf7) obj;
        return g76.L(this.a, mf7Var.a) && this.b == mf7Var.b;
    }

    public final int hashCode() {
        String str = this.a;
        return ((str == null ? 0 : str.hashCode()) * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return km4.z("PremiumTierEducational(currentUserImageId=", this.a, ", canDisplayUpgradeButton=", ")", this.b);
    }
}
