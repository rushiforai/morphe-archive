package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jt2 {
    public final it2 a;
    public final it2 b;
    public final double c;

    public jt2(it2 it2Var, it2 it2Var2, double d) {
        it2Var.getClass();
        it2Var2.getClass();
        this.a = it2Var;
        this.b = it2Var2;
        this.c = d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jt2)) {
            return false;
        }
        jt2 jt2Var = (jt2) obj;
        return this.a == jt2Var.a && this.b == jt2Var.b && Double.compare(this.c, jt2Var.c) == 0;
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        long jDoubleToLongBits = Double.doubleToLongBits(this.c);
        return iHashCode + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
    }

    public final String toString() {
        return "DataCollectionStatus(performance=" + this.a + ", crashlytics=" + this.b + ", sessionSamplingRate=" + this.c + ')';
    }
}
