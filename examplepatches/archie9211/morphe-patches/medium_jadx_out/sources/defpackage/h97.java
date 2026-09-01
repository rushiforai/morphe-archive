package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class h97 implements m97 {
    public final SusiOperation a;
    public final SusiDestination b;
    public final String c;
    public final String d;
    public final String e;
    public final boolean f;

    public h97(String str, SusiOperation susiOperation, SusiDestination susiDestination, String str2, String str3, boolean z) {
        susiOperation.getClass();
        str.getClass();
        str3.getClass();
        this.a = susiOperation;
        this.b = susiDestination;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h97)) {
            return false;
        }
        h97 h97Var = (h97) obj;
        return this.a == h97Var.a && g76.L(this.b, h97Var.b) && g76.L(this.c, h97Var.c) && g76.L(this.d, h97Var.d) && g76.L(this.e, h97Var.e) && this.f == h97Var.f;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        SusiDestination susiDestination = this.b;
        int iO = wgd.o((iHashCode + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31, 31, this.c);
        String str = this.d;
        return wgd.o((iO + (str != null ? str.hashCode() : 0)) * 31, 31, this.e) + (this.f ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NavigateToMagicLink(susiOperation=");
        sb.append(this.a);
        sb.append(", susiDestination=");
        sb.append(this.b);
        sb.append(", email=");
        ka1.C(sb, this.c, ", fullName=", this.d, ", source=");
        sb.append(this.e);
        sb.append(", rememberMe=");
        sb.append(this.f);
        sb.append(")");
        return sb.toString();
    }
}
