package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gr5 {
    public static final gr5 d;
    public static final gr5 e;
    public static final gr5 f;
    public final c55 a;
    public final x45 b;
    public final boolean c;

    static {
        u02 u02Var = new u02(25);
        cq4 cq4Var = new cq4(27);
        d = new gr5(u02Var, cq4Var, false);
        e = new gr5(new u02(26), new cq4(28), true);
        f = new gr5(u02Var, cq4Var, true);
    }

    public gr5(c55 c55Var, x45 x45Var, boolean z) {
        this.a = c55Var;
        this.b = x45Var;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gr5)) {
            return false;
        }
        gr5 gr5Var = (gr5) obj;
        return this.a.equals(gr5Var.a) && this.b.equals(gr5Var.b) && this.c == gr5Var.c;
    }

    public final int hashCode() {
        return ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("HorizontalAxisLabelsStyle(dateFormatter=");
        sb.append(this.a);
        sb.append(", pointsStep=");
        sb.append(this.b);
        sb.append(", useSlantEffect=");
        return lv8.t(sb, this.c, ")");
    }
}
