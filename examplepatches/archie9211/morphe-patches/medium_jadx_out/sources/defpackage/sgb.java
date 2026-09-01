package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sgb {
    public final long a;
    public final int b;

    public sgb(int i, long j) {
        this.a = j;
        this.b = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sgb)) {
            return false;
        }
        sgb sgbVar = (sgb) obj;
        return this.a == sgbVar.a && this.b == sgbVar.b;
    }

    public final int hashCode() {
        long j = this.a;
        return (((int) (j ^ (j >>> 32))) * 31) + this.b;
    }

    public final String toString() {
        return "ClapsState(totalClapCount=" + this.a + ", currentUserClapCount=" + this.b + ")";
    }
}
