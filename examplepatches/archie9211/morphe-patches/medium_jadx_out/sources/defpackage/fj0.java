package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fj0 extends mg2 {
    public final Context a;
    public final dp1 b;
    public final dp1 c;
    public final String d;

    public fj0(Context context, dp1 dp1Var, dp1 dp1Var2, String str) {
        if (context == null) {
            z72.c("Null applicationContext");
            throw null;
        }
        this.a = context;
        if (dp1Var == null) {
            z72.c("Null wallClock");
            throw null;
        }
        this.b = dp1Var;
        if (dp1Var2 == null) {
            z72.c("Null monotonicClock");
            throw null;
        }
        this.c = dp1Var2;
        if (str != null) {
            this.d = str;
        } else {
            z72.c("Null backendName");
            throw null;
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof mg2) {
            fj0 fj0Var = (fj0) ((mg2) obj);
            if (this.a.equals(fj0Var.a) && this.b.equals(fj0Var.b) && this.c.equals(fj0Var.c) && this.d.equals(fj0Var.d)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.d.hashCode() ^ ((((((this.a.hashCode() ^ 1000003) * 1000003) ^ this.b.hashCode()) * 1000003) ^ this.c.hashCode()) * 1000003);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CreationContext{applicationContext=");
        sb.append(this.a);
        sb.append(", wallClock=");
        sb.append(this.b);
        sb.append(", monotonicClock=");
        sb.append(this.c);
        sb.append(", backendName=");
        return ka1.v(sb, this.d, "}");
    }
}
