package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dx8 {
    public final long a;
    public final jy8 b;

    public dx8() {
        long jL = op8.l(4284900966L);
        jy8 jy8VarG = w2g.g(3, 0.0f);
        this.a = jL;
        this.b = jy8VarG;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!dx8.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        dx8 dx8Var = (dx8) obj;
        long j = dx8Var.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && this.b.equals(dx8Var.b);
    }

    public final int hashCode() {
        int i = uu1.i;
        return this.b.hashCode() + (ev6.n(this.a) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("OverscrollConfiguration(glowColor=");
        ev6.F(this.a, ", drawPadding=", sb);
        sb.append(this.b);
        sb.append(')');
        return sb.toString();
    }
}
