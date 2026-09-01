package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x72 {
    public final int a;
    public final long b;
    public final y72 c;
    public final qlb d;

    public x72(int i, long j, y72 y72Var, qlb qlbVar) {
        this.a = i;
        this.b = j;
        this.c = y72Var;
        this.d = qlbVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x72)) {
            return false;
        }
        x72 x72Var = (x72) obj;
        return this.a == x72Var.a && this.b == x72Var.b && this.c == x72Var.c && g76.L(this.d, x72Var.d);
    }

    public final int hashCode() {
        int i = this.a * 31;
        long j = this.b;
        int iHashCode = (this.c.hashCode() + ((i + ((int) (j ^ (j >>> 32)))) * 31)) * 31;
        qlb qlbVar = this.d;
        return iHashCode + (qlbVar == null ? 0 : qlbVar.hashCode());
    }

    public final String toString() {
        return "ContentCaptureEvent(id=" + this.a + ", timestamp=" + this.b + ", type=" + this.c + ", structureCompat=" + this.d + ')';
    }
}
