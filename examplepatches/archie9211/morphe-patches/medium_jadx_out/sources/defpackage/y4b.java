package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y4b implements tj4 {
    public final int a;
    public final cud b;
    public final v4b c;
    public final long d;

    public y4b(int i, cud cudVar, v4b v4bVar, long j) {
        this.a = i;
        this.b = cudVar;
        this.c = v4bVar;
        this.d = j;
    }

    @Override // defpackage.ww
    public final jre a(hud hudVar) {
        return new pre(this.a, this.b.a(hudVar), this.c, this.d);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof y4b) {
            y4b y4bVar = (y4b) obj;
            if (y4bVar.a == this.a && y4bVar.b.equals(this.b) && y4bVar.c == this.c && y4bVar.d == this.d) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (this.c.hashCode() + ((this.b.hashCode() + (this.a * 31)) * 31)) * 31;
        long j = this.d;
        return ((int) (j ^ (j >>> 32))) + iHashCode;
    }
}
