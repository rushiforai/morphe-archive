package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wt0 {
    public wp a = null;
    public pm b = null;
    public g61 c = null;
    public br d = null;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wt0)) {
            return false;
        }
        wt0 wt0Var = (wt0) obj;
        return g76.L(this.a, wt0Var.a) && g76.L(this.b, wt0Var.b) && g76.L(this.c, wt0Var.c) && g76.L(this.d, wt0Var.d);
    }

    public final int hashCode() {
        wp wpVar = this.a;
        int iHashCode = (wpVar == null ? 0 : wpVar.hashCode()) * 31;
        pm pmVar = this.b;
        int iHashCode2 = (iHashCode + (pmVar == null ? 0 : pmVar.hashCode())) * 31;
        g61 g61Var = this.c;
        int iHashCode3 = (iHashCode2 + (g61Var == null ? 0 : g61Var.hashCode())) * 31;
        br brVar = this.d;
        return iHashCode3 + (brVar != null ? brVar.hashCode() : 0);
    }

    public final String toString() {
        return "BorderCache(imageBitmap=" + this.a + ", canvas=" + this.b + ", canvasDrawScope=" + this.c + ", borderPath=" + this.d + ')';
    }
}
