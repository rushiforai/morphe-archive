package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pw8 extends er7 {
    public final wlb d;
    public final br e;

    public pw8(wlb wlbVar) {
        br brVarA;
        this.d = wlbVar;
        if (ur7.B(wlbVar)) {
            brVarA = null;
        } else {
            brVarA = er.a();
            b09.n(brVarA, wlbVar);
        }
        this.e = brVarA;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof pw8) {
            return this.d.equals(((pw8) obj).d);
        }
        return false;
    }

    public final int hashCode() {
        return this.d.hashCode();
    }

    @Override // defpackage.er7
    public final zwa x() {
        wlb wlbVar = this.d;
        return new zwa(wlbVar.a, wlbVar.b, wlbVar.c, wlbVar.d);
    }
}
