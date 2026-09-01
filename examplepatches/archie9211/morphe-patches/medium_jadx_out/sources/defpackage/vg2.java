package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vg2 extends q62 {
    public final String f;
    public final String g;
    public final String h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vg2(String str, String str2, String str3) {
        super(l3d.X, str, str2, str3, null, 16);
        str.getClass();
        str2.getClass();
        this.f = str;
        this.g = str2;
        this.h = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vg2)) {
            return false;
        }
        vg2 vg2Var = (vg2) obj;
        return g76.L(this.f, vg2Var.f) && g76.L(this.g, vg2Var.g) && this.h.equals(vg2Var.h);
    }

    public final int hashCode() {
        return this.h.hashCode() + wgd.o(this.f.hashCode() * 31, 31, this.g);
    }

    public final String toString() {
        return ka1.v(y30.u("X(token=", this.f, ", secret=", this.g, ", username="), this.h, ")");
    }
}
