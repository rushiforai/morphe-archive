package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fm0 {
    public final em0 a;

    public fm0(em0 em0Var) {
        em0Var.getClass();
        this.a = em0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof fm0) && this.a == ((fm0) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode() + ((fn.x.hashCode() + ((x22.v.hashCode() + 31744) * 31)) * 31);
    }

    public final String toString() {
        return "BackPressureStrategy(capacity=1024, onThresholdReached=" + x22.v + ", onItemDropped=" + fn.x + ", backpressureMitigation=" + this.a + ")";
    }
}
