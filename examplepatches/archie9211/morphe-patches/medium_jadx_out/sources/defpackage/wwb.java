package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wwb {
    public final mcb a;
    public final int b;
    public final long c;

    public wwb(mcb mcbVar, int i, long j) {
        this.a = mcbVar;
        this.b = i;
        this.c = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wwb)) {
            return false;
        }
        wwb wwbVar = (wwb) obj;
        return this.a == wwbVar.a && this.b == wwbVar.b && this.c == wwbVar.c;
    }

    public final int hashCode() {
        int iHashCode = ((this.a.hashCode() * 31) + this.b) * 31;
        long j = this.c;
        return iHashCode + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        return "AnchorInfo(direction=" + this.a + ", offset=" + this.b + ", selectableId=" + this.c + ')';
    }
}
