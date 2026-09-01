package defpackage;

import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ke7 {
    public final String a;
    public final SusiOperation b;
    public final boolean c;

    public ke7(String str, SusiOperation susiOperation, boolean z) {
        str.getClass();
        susiOperation.getClass();
        this.a = str;
        this.b = susiOperation;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ke7)) {
            return false;
        }
        ke7 ke7Var = (ke7) obj;
        return g76.L(this.a, ke7Var.a) && this.b == ke7Var.b && this.c == ke7Var.c;
    }

    public final int hashCode() {
        return ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Content(email=");
        sb.append(this.a);
        sb.append(", susiOperation=");
        sb.append(this.b);
        sb.append(", canResend=");
        return lv8.t(sb, this.c, ")");
    }
}
