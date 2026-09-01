package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcr8;", "Lu28;", "Ldr8;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class cr8 extends u28 {
    public final x45 b;

    public cr8(x45 x45Var) {
        this.b = x45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof cr8) {
            return this.b == ((cr8) obj).b;
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        dr8 dr8Var = new dr8();
        dr8Var.o = this.b;
        return dr8Var;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((dr8) q28Var).o = this.b;
    }
}
