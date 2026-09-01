package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bt6 {
    public final int a;
    public final int b;

    public bt6(int i, int i2) {
        this.a = i;
        this.b = i2;
        if (!(i >= 0)) {
            e26.a("negative start index");
        }
        if (i2 >= i) {
            return;
        }
        e26.a("end index greater than start");
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bt6)) {
            return false;
        }
        bt6 bt6Var = (bt6) obj;
        return this.a == bt6Var.a && this.b == bt6Var.b;
    }

    public final int hashCode() {
        return (this.a * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Interval(start=");
        sb.append(this.a);
        sb.append(", end=");
        return km4.A(sb, this.b, ')');
    }
}
