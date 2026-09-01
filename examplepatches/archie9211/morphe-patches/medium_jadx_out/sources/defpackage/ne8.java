package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ne8 {
    public final int a;
    public final long b;
    public final long c;
    public final ce8 d;
    public final qkc e;
    public final Object f;

    public ne8(int i, long j, long j2, ce8 ce8Var, qkc qkcVar, Object obj) {
        this.a = i;
        this.b = j;
        this.c = j2;
        this.d = ce8Var;
        this.e = qkcVar;
        this.f = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ne8)) {
            return false;
        }
        ne8 ne8Var = (ne8) obj;
        return this.a == ne8Var.a && this.b == ne8Var.b && this.c == ne8Var.c && g76.L(this.d, ne8Var.d) && g76.L(this.e, ne8Var.e) && g76.L(this.f, ne8Var.f);
    }

    public final int hashCode() {
        int i = this.a * 31;
        long j = this.b;
        int i2 = (i + ((int) (j ^ (j >>> 32)))) * 31;
        long j2 = this.c;
        int iHashCode = (this.d.a.hashCode() + ((i2 + ((int) (j2 ^ (j2 >>> 32)))) * 31)) * 31;
        qkc qkcVar = this.e;
        int iHashCode2 = (iHashCode + (qkcVar == null ? 0 : qkcVar.a.hashCode())) * 31;
        Object obj = this.f;
        return iHashCode2 + (obj != null ? obj.hashCode() : 0);
    }

    public final String toString() {
        return "NetworkResponse(code=" + this.a + ", requestMillis=" + this.b + ", responseMillis=" + this.c + ", headers=" + this.d + ", body=" + this.e + ", delegate=" + this.f + ')';
    }
}
