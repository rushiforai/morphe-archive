package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class d65 {
    public final c65 a;
    public final int b;

    public d65(c65 c65Var, int i) {
        this.a = c65Var;
        this.b = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d65)) {
            return false;
        }
        d65 d65Var = (d65) obj;
        return this.a.equals(d65Var.a) && this.b == d65Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("KindWithArity(kind=");
        sb.append(this.a);
        sb.append(", arity=");
        return km4.A(sb, this.b, ')');
    }
}
