package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m48 {
    public final long a;
    public final long b;
    public final boolean c;

    public m48(long j, long j2, boolean z) {
        this.a = j;
        this.b = j2;
        this.c = z;
    }

    public final m48 a(m48 m48Var) {
        return new m48(ip8.e(this.a, m48Var.a), Math.max(this.b, m48Var.b), this.c);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m48)) {
            return false;
        }
        m48 m48Var = (m48) obj;
        return ip8.b(this.a, m48Var.a) && this.b == m48Var.b && this.c == m48Var.c;
    }

    public final int hashCode() {
        int iN = ev6.n(this.a) * 31;
        long j = this.b;
        return ((iN + ((int) (j ^ (j >>> 32)))) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("MouseWheelScrollDelta(value=");
        sb.append((Object) ip8.g(this.a));
        sb.append(", timeMillis=");
        sb.append(this.b);
        sb.append(", shouldApplyImmediately=");
        return ev6.A(sb, this.c, ')');
    }
}
