package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lnb9;", "Lu28;", "Lob9;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final /* data */ class nb9 extends u28 {
    public final lr b;

    public nb9(lr lrVar) {
        this.b = lrVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof nb9) && this.b.equals(((nb9) obj).b);
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new ob9(this.b, null);
    }

    public final int hashCode() {
        return (this.b.hashCode() * 31) + 1237;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ob9 ob9Var = (ob9) q28Var;
        lr lrVar = ob9Var.p;
        lr lrVar2 = this.b;
        if (g76.L(lrVar, lrVar2)) {
            return;
        }
        ob9Var.p = lrVar2;
        if (ob9Var.q) {
            ob9Var.K0();
        }
    }

    public final String toString() {
        return "PointerHoverIconModifierElement(icon=" + this.b + ", overrideDescendants=false)";
    }
}
