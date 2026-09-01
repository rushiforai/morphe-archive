package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Llp6;", "Lu28;", "Lmp6;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
final /* data */ class lp6 extends u28 {
    public final Object b;

    public lp6(Object obj) {
        this.b = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof lp6) && g76.L(this.b, ((lp6) obj).b);
    }

    @Override // defpackage.u28
    public final q28 f() {
        mp6 mp6Var = new mp6();
        mp6Var.o = this.b;
        return mp6Var;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((mp6) q28Var).o = this.b;
    }

    public final String toString() {
        return "LayoutIdElement(layoutId=" + this.b + ')';
    }
}
