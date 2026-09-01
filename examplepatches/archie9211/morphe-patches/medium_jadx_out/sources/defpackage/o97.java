package defpackage;

import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class o97 implements p97 {
    public final SusiOperation a;
    public final String b;
    public final String c;

    public o97(SusiOperation susiOperation, String str, String str2) {
        susiOperation.getClass();
        str.getClass();
        str2.getClass();
        this.a = susiOperation;
        this.b = str;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o97)) {
            return false;
        }
        o97 o97Var = (o97) obj;
        return this.a == o97Var.a && g76.L(this.b, o97Var.b) && g76.L(this.c, o97Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("TooManyAttempts(susiOperation=");
        sb.append(this.a);
        sb.append(", email=");
        sb.append(this.b);
        sb.append(", code=");
        return ka1.v(sb, this.c, ")");
    }
}
