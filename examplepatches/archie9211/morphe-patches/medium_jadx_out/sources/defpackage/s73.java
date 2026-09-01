package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s73 {
    public final rqa a;
    public final int b;
    public final int c;

    public s73(rqa rqaVar, int i, int i2) {
        aq7.l("Null dependency anInterface.", rqaVar);
        this.a = rqaVar;
        this.b = i;
        this.c = i2;
    }

    public static s73 a(rqa rqaVar) {
        return new s73(rqaVar, 1, 0);
    }

    public static s73 b(Class cls) {
        return new s73(1, 0, cls);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof s73)) {
            return false;
        }
        s73 s73Var = (s73) obj;
        return this.a.equals(s73Var.a) && this.b == s73Var.b && this.c == s73Var.c;
    }

    public final int hashCode() {
        return this.c ^ ((((this.a.hashCode() ^ 1000003) * 1000003) ^ this.b) * 1000003);
    }

    public final String toString() {
        String str;
        StringBuilder sb = new StringBuilder("Dependency{anInterface=");
        sb.append(this.a);
        sb.append(", type=");
        int i = this.b;
        sb.append(i == 1 ? "required" : i == 0 ? "optional" : "set");
        sb.append(", injection=");
        int i2 = this.c;
        if (i2 == 0) {
            str = "direct";
        } else if (i2 == 1) {
            str = "provider";
        } else {
            if (i2 != 2) {
                ay0.d(b09.w(i2, "Unsupported injection: "));
                return null;
            }
            str = "deferred";
        }
        return ka1.v(sb, str, "}");
    }

    public s73(int i, int i2, Class cls) {
        this(rqa.a(cls), i, i2);
    }
}
