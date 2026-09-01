package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class md0 implements od0 {
    public final SusiOperation a;
    public final SusiDestination b;
    public final boolean c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    public final boolean g;
    public final String h;
    public final boolean i;

    public md0(SusiOperation susiOperation, SusiDestination susiDestination, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, String str, boolean z6) {
        susiOperation.getClass();
        this.a = susiOperation;
        this.b = susiDestination;
        this.c = z;
        this.d = z2;
        this.e = z3;
        this.f = z4;
        this.g = z5;
        this.h = str;
        this.i = z6;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof md0)) {
            return false;
        }
        md0 md0Var = (md0) obj;
        return this.a == md0Var.a && g76.L(this.b, md0Var.b) && this.c == md0Var.c && this.d == md0Var.d && this.e == md0Var.e && this.f == md0Var.f && this.g == md0Var.g && this.h.equals(md0Var.h) && this.i == md0Var.i;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        SusiDestination susiDestination = this.b;
        return wgd.o((((((((((((iHashCode + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31, 31, this.h) + (this.i ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Content(susiOperation=");
        sb.append(this.a);
        sb.append(", susiDestination=");
        sb.append(this.b);
        sb.append(", isAppleSignInEnabled=");
        ho2.R(sb, this.c, ", isEmailSusiEnabled=", this.d, ", isFacebookSusiEnabled=");
        ho2.R(sb, this.e, ", isGoogleSusiEnabled=", this.f, ", isXSignInEnabled=");
        sb.append(this.g);
        sb.append(", source=");
        sb.append(this.h);
        sb.append(", rememberMe=");
        return lv8.t(sb, this.i, ")");
    }
}
