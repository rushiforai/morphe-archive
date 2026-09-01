package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ko6 implements qo6 {
    public final String a;
    public final String b;
    public final SusiDestination c;
    public final SusiOperation d;

    public ko6(String str, String str2, SusiDestination.Deeplink deeplink, SusiOperation susiOperation) {
        this.a = str;
        this.b = str2;
        this.c = deeplink;
        this.d = susiOperation;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ko6)) {
            return false;
        }
        ko6 ko6Var = (ko6) obj;
        return this.a.equals(ko6Var.a) && this.b.equals(ko6Var.b) && g76.L(this.c, ko6Var.c) && this.d == ko6Var.d;
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        SusiDestination susiDestination = this.c;
        int iHashCode = (iO + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31;
        SusiOperation susiOperation = this.d;
        return iHashCode + (susiOperation != null ? susiOperation.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("NavigateToEmailCallback(token=", this.a, ", referrerSource=", this.b, ", susiDestination=");
        sbU.append(this.c);
        sbU.append(", susiOperation=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
