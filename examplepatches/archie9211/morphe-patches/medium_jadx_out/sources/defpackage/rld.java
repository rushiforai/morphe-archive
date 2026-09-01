package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lrld;", "Lu28;", "Ltld;", "material3"}, k = 1, mv = {2, 0, 0}, xi = 48)
final /* data */ class rld extends u28 {
    public final d56 b;
    public final boolean c;
    public final wlc d;

    public rld(d56 d56Var, boolean z, wlc wlcVar) {
        this.b = d56Var;
        this.c = z;
        this.d = wlcVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rld)) {
            return false;
        }
        rld rldVar = (rld) obj;
        return g76.L(this.b, rldVar.b) && this.c == rldVar.c && this.d.equals(rldVar.d);
    }

    @Override // defpackage.u28
    public final q28 f() {
        tld tldVar = new tld();
        tldVar.o = this.b;
        tldVar.p = this.c;
        tldVar.q = this.d;
        tldVar.u = Float.NaN;
        tldVar.v = Float.NaN;
        return tldVar;
    }

    public final int hashCode() {
        return this.d.hashCode() + (((this.b.hashCode() * 31) + (this.c ? 1231 : 1237)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        tld tldVar = (tld) q28Var;
        tldVar.o = this.b;
        boolean z = tldVar.p;
        boolean z2 = this.c;
        if (z != z2) {
            gx1.M(tldVar);
        }
        tldVar.p = z2;
        tldVar.q = this.d;
        if (tldVar.t == null && !Float.isNaN(tldVar.v)) {
            tldVar.t = yi2.h(tldVar.v);
        }
        if (tldVar.s != null || Float.isNaN(tldVar.u)) {
            return;
        }
        tldVar.s = yi2.h(tldVar.u);
    }

    public final String toString() {
        return "ThumbElement(interactionSource=" + this.b + ", checked=" + this.c + ", animationSpec=" + this.d + ')';
    }
}
