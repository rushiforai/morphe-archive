package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.explore.ui.vAWg.OphtYB;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ldc implements odc {
    public final String a;
    public final String b;
    public final SusiDestination c;
    public final SusiOperation d;
    public final String e;
    public final boolean f;

    public ldc(String str, SusiOperation susiOperation, SusiDestination susiDestination, String str2, String str3, boolean z) {
        str.getClass();
        str2.getClass();
        susiOperation.getClass();
        str3.getClass();
        this.a = str;
        this.b = str2;
        this.c = susiDestination;
        this.d = susiOperation;
        this.e = str3;
        this.f = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ldc)) {
            return false;
        }
        ldc ldcVar = (ldc) obj;
        return g76.L(this.a, ldcVar.a) && g76.L(this.b, ldcVar.b) && g76.L(this.c, ldcVar.c) && this.d == ldcVar.d && g76.L(this.e, ldcVar.e) && this.f == ldcVar.f;
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        SusiDestination susiDestination = this.c;
        return wgd.o((this.d.hashCode() + ((iO + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31)) * 31, 31, this.e) + (this.f ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("NavigateToLoginCode(fullName=", this.a, ", email=", this.b, ", susiDestination=");
        sbU.append(this.c);
        sbU.append(", susiOperation=");
        sbU.append(this.d);
        sbU.append(OphtYB.suDlcnUSZ);
        sbU.append(this.e);
        sbU.append(", rememberMe=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}
