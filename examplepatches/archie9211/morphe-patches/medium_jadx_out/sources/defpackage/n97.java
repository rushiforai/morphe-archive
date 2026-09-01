package defpackage;

import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class n97 implements p97 {
    public final SusiOperation a;
    public final String b;
    public final String c;
    public final Integer d;
    public final boolean e;
    public final boolean f;
    public final boolean g;

    public n97(SusiOperation susiOperation, String str, String str2, Integer num, boolean z, boolean z2, boolean z3) {
        susiOperation.getClass();
        str.getClass();
        str2.getClass();
        this.a = susiOperation;
        this.b = str;
        this.c = str2;
        this.d = num;
        this.e = z;
        this.f = z2;
        this.g = z3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n97)) {
            return false;
        }
        n97 n97Var = (n97) obj;
        return this.a == n97Var.a && g76.L(this.b, n97Var.b) && g76.L(this.c, n97Var.c) && g76.L(this.d, n97Var.d) && this.e == n97Var.e && this.f == n97Var.f && this.g == n97Var.g;
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c);
        Integer num = this.d;
        return ((((((iO + (num == null ? 0 : num.hashCode())) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Main(susiOperation=");
        sb.append(this.a);
        sb.append(", email=");
        sb.append(this.b);
        sb.append(", code=");
        sb.append(this.c);
        sb.append(", errorResId=");
        sb.append(this.d);
        sb.append(", canSubmit=");
        ho2.R(sb, this.e, ", canResendCode=", this.f, ", canEdit=");
        return lv8.t(sb, this.g, ")");
    }
}
