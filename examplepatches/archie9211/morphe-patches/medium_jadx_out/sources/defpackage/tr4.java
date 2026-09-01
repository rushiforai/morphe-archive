package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Ltr4;", "Lu28;", "Lvr4;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
final /* data */ class tr4 extends u28 {
    public final sr4 b;

    public tr4(sr4 sr4Var) {
        this.b = sr4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof tr4) && g76.L(this.b, ((tr4) obj).b);
    }

    @Override // defpackage.u28
    public final q28 f() {
        vr4 vr4Var = new vr4();
        vr4Var.o = this.b;
        return vr4Var;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        vr4 vr4Var = (vr4) q28Var;
        vr4Var.o.a.l(vr4Var);
        sr4 sr4Var = this.b;
        vr4Var.o = sr4Var;
        sr4Var.a.b(vr4Var);
    }

    public final String toString() {
        return "FocusRequesterElement(focusRequester=" + this.b + ')';
    }
}
