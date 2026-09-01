package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pfc {
    public final x45 a;
    public final wlc b;

    public pfc(x45 x45Var, wlc wlcVar) {
        this.a = x45Var;
        this.b = wlcVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pfc)) {
            return false;
        }
        pfc pfcVar = (pfc) obj;
        return this.a.equals(pfcVar.a) && this.b.equals(pfcVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Slide(slideOffset=" + this.a + ", animationSpec=" + this.b + ')';
    }
}
