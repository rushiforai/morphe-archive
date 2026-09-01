package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lhgd;", "Lu28;", "Ligd;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class hgd extends u28 {
    public final String b;

    public hgd(String str) {
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hgd)) {
            return false;
        }
        return g76.L(this.b, ((hgd) obj).b);
    }

    @Override // defpackage.u28
    public final q28 f() {
        igd igdVar = new igd();
        igdVar.o = this.b;
        return igdVar;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((igd) q28Var).o = this.b;
    }
}
