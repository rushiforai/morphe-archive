package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rnc implements ww {
    public final ww a;
    public final long b;

    public rnc(tj4 tj4Var, long j) {
        this.a = tj4Var;
        this.b = j;
    }

    @Override // defpackage.ww
    public final jre a(hud hudVar) {
        return new snc(this.a.a(hudVar), this.b);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof rnc)) {
            return false;
        }
        rnc rncVar = (rnc) obj;
        return rncVar.b == this.b && g76.L(rncVar.a, this.a);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        return iHashCode + ((int) (j ^ (j >>> 32)));
    }
}
