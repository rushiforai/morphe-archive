package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cy5 {
    public final by5 a;
    public final int b;

    public cy5(by5 by5Var, int i) {
        this.a = by5Var;
        this.b = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cy5)) {
            return false;
        }
        cy5 cy5Var = (cy5) obj;
        return this.a.equals(cy5Var.a) && this.b == cy5Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ImageVectorEntry(imageVector=");
        sb.append(this.a);
        sb.append(", configFlags=");
        return km4.A(sb, this.b, ')');
    }
}
