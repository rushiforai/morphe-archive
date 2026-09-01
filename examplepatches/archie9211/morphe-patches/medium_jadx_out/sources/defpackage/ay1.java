package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ay1 {
    public final Object a;
    public final q51 b;
    public final c55 c;
    public final Object d;
    public final Throwable e;

    public /* synthetic */ ay1(Object obj, q51 q51Var, c55 c55Var, Throwable th, int i) {
        this(obj, (i & 2) != 0 ? null : q51Var, (i & 4) != 0 ? null : c55Var, (Object) null, (i & 16) != 0 ? null : th);
    }

    public static ay1 a(ay1 ay1Var, q51 q51Var, Throwable th, int i) {
        Object obj = ay1Var.a;
        if ((i & 2) != 0) {
            q51Var = ay1Var.b;
        }
        q51 q51Var2 = q51Var;
        c55 c55Var = ay1Var.c;
        Object obj2 = ay1Var.d;
        if ((i & 16) != 0) {
            th = ay1Var.e;
        }
        return new ay1(obj, q51Var2, c55Var, obj2, th);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ay1)) {
            return false;
        }
        ay1 ay1Var = (ay1) obj;
        return g76.L(this.a, ay1Var.a) && g76.L(this.b, ay1Var.b) && g76.L(this.c, ay1Var.c) && g76.L(this.d, ay1Var.d) && g76.L(this.e, ay1Var.e);
    }

    public final int hashCode() {
        Object obj = this.a;
        int iHashCode = (obj == null ? 0 : obj.hashCode()) * 31;
        q51 q51Var = this.b;
        int iHashCode2 = (iHashCode + (q51Var == null ? 0 : q51Var.hashCode())) * 31;
        c55 c55Var = this.c;
        int iHashCode3 = (iHashCode2 + (c55Var == null ? 0 : c55Var.hashCode())) * 31;
        Object obj2 = this.d;
        int iHashCode4 = (iHashCode3 + (obj2 == null ? 0 : obj2.hashCode())) * 31;
        Throwable th = this.e;
        return iHashCode4 + (th != null ? th.hashCode() : 0);
    }

    public final String toString() {
        return "CompletedContinuation(result=" + this.a + ", cancelHandler=" + this.b + ", onCancellation=" + this.c + ", idempotentResume=" + this.d + ", cancelCause=" + this.e + ')';
    }

    public ay1(Object obj, q51 q51Var, c55 c55Var, Object obj2, Throwable th) {
        this.a = obj;
        this.b = q51Var;
        this.c = c55Var;
        this.d = obj2;
        this.e = th;
    }
}
