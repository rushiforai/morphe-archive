package defpackage;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ck0 {
    public final dp1 a;
    public final HashMap b;

    public ck0(dp1 dp1Var, HashMap map) {
        this.a = dp1Var;
        this.b = map;
    }

    public final long a(z0a z0aVar, long j, int i) {
        long jE = j - this.a.e();
        dk0 dk0Var = (dk0) this.b.get(z0aVar);
        long j2 = dk0Var.a;
        return Math.min(Math.max((long) (Math.pow(3.0d, i - 1) * j2 * Math.max(1.0d, Math.log(10000.0d) / Math.log((j2 > 1 ? j2 : 2L) * ((long) r12)))), jE), dk0Var.b);
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof ck0)) {
            return false;
        }
        ck0 ck0Var = (ck0) obj;
        return this.a.equals(ck0Var.a) && this.b.equals(ck0Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() ^ ((this.a.hashCode() ^ 1000003) * 1000003);
    }

    public final String toString() {
        return "SchedulerConfig{clock=" + this.a + ", values=" + this.b + "}";
    }
}
