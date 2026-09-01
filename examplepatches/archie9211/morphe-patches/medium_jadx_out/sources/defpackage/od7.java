package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class od7 implements qd7 {
    public final String a;
    public final String b;
    public final SusiDestination c;
    public final String d;

    public od7(String str, String str2, SusiDestination susiDestination, String str3) {
        str3.getClass();
        this.a = str;
        this.b = str2;
        this.c = susiDestination;
        this.d = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof od7)) {
            return false;
        }
        od7 od7Var = (od7) obj;
        return g76.L(this.a, od7Var.a) && g76.L(this.b, od7Var.b) && g76.L(this.c, od7Var.c) && g76.L(this.d, od7Var.d);
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        SusiDestination susiDestination = this.c;
        return this.d.hashCode() + ((iHashCode2 + (susiDestination != null ? susiDestination.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("NavigateToSignUp(email=", this.a, ", fullName=", this.b, ", susiDestination=");
        sbU.append(this.c);
        sbU.append(", source=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
