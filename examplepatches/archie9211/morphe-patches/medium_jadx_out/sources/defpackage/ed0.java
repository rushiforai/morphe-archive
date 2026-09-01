package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ed0 implements kd0 {
    public final String a;
    public final SusiDestination b;
    public final SusiOperation c;
    public final String d;
    public final boolean e;

    public ed0(String str, SusiDestination susiDestination, SusiOperation susiOperation, String str2, boolean z) {
        str.getClass();
        susiOperation.getClass();
        this.a = str;
        this.b = susiDestination;
        this.c = susiOperation;
        this.d = str2;
        this.e = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ed0)) {
            return false;
        }
        ed0 ed0Var = (ed0) obj;
        return g76.L(this.a, ed0Var.a) && g76.L(this.b, ed0Var.b) && this.c == ed0Var.c && this.d.equals(ed0Var.d) && this.e == ed0Var.e;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        SusiDestination susiDestination = this.b;
        return ((wgd.o((this.c.hashCode() + ((iHashCode + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31)) * 31, 31, this.d) + (this.e ? 1231 : 1237)) * 31) + 1231;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NavigateToLoginCode(email=");
        sb.append(this.a);
        sb.append(", susiDestination=");
        sb.append(this.b);
        sb.append(", susiOperation=");
        sb.append(this.c);
        sb.append(", source=");
        sb.append(this.d);
        sb.append(", rememberMe=");
        return lv8.t(sb, this.e, ", fromAccountHint=true)");
    }
}
