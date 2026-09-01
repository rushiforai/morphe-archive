package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class imb {
    public final jmb a;
    public final jmb b;
    public final Throwable c;

    public imb(jmb jmbVar, x32 x32Var, Throwable th) {
        this.a = jmbVar;
        this.b = x32Var;
        this.c = th;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof imb)) {
            return false;
        }
        imb imbVar = (imb) obj;
        return g76.L(this.a, imbVar.a) && g76.L(this.b, imbVar.b) && g76.L(this.c, imbVar.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        jmb jmbVar = this.b;
        int iHashCode2 = (iHashCode + (jmbVar == null ? 0 : jmbVar.hashCode())) * 31;
        Throwable th = this.c;
        return iHashCode2 + (th != null ? th.hashCode() : 0);
    }

    public final String toString() {
        return "ConnectResult(plan=" + this.a + ", nextPlan=" + this.b + ", throwable=" + this.c + ')';
    }

    public /* synthetic */ imb(jmb jmbVar, Throwable th, int i) {
        this(jmbVar, (x32) null, (i & 4) != 0 ? null : th);
    }
}
