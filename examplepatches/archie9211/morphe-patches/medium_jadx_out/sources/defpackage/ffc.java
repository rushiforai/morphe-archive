package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ffc {
    public final ou a;
    public long b;

    public ffc(ou ouVar, long j) {
        this.a = ouVar;
        this.b = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ffc) {
            ffc ffcVar = (ffc) obj;
            if (this.a == ffcVar.a && s46.a(this.b, ffcVar.b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        return ((int) (j ^ (j >>> 32))) + iHashCode;
    }

    public final String toString() {
        return "AnimData(anim=" + this.a + ", startSize=" + ((Object) s46.b(this.b)) + ')';
    }
}
