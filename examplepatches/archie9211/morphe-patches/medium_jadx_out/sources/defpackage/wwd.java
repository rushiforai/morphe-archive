package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wwd {
    public final swd a;
    public final v96 b;

    public wwd(swd swdVar, v96 v96Var) {
        swdVar.getClass();
        v96Var.getClass();
        this.a = swdVar;
        this.b = v96Var;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof wwd)) {
            return false;
        }
        wwd wwdVar = (wwd) obj;
        return g76.L(wwdVar.a, this.a) && g76.L(wwdVar.b, this.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode();
        return this.b.hashCode() + (iHashCode * 31) + iHashCode;
    }

    public final String toString() {
        return "DataToEraseUpperBound(typeParameter=" + this.a + ", typeAttr=" + this.b + ')';
    }
}
