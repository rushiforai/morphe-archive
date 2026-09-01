package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qc8 extends aq7 {
    public final ic8 d;

    public qc8(ic8 ic8Var) {
        ic8Var.getClass();
        this.d = ic8Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return obj != null && qc8.class == obj.getClass() && g76.L(this.d, ((qc8) obj).d);
    }

    public final int hashCode() {
        return this.d.hashCode() - 31;
    }

    public final String toString() {
        return "InProgress(latestEvent=" + this.d + ", direction=-1)";
    }
}
