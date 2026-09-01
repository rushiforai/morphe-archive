package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lmp8;", "Lu28;", "Lnp8;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class mp8 extends u28 {
    public final x45 b;

    public mp8(x45 x45Var) {
        this.b = x45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        mp8 mp8Var = obj instanceof mp8 ? (mp8) obj : null;
        return mp8Var != null && this.b == mp8Var.b;
    }

    @Override // defpackage.u28
    public final q28 f() {
        np8 np8Var = new np8();
        np8Var.o = this.b;
        np8Var.p = true;
        return np8Var;
    }

    public final int hashCode() {
        return (this.b.hashCode() * 31) + 1231;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        np8 np8Var = (np8) q28Var;
        x45 x45Var = np8Var.o;
        x45 x45Var2 = this.b;
        if (x45Var != x45Var2 || !np8Var.p) {
            flb.v0(np8Var).U(false);
        }
        np8Var.o = x45Var2;
        np8Var.p = true;
    }

    public final String toString() {
        return "OffsetPxModifier(offset=" + this.b + ", rtlAware=true)";
    }
}
