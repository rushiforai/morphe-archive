package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Ljp8;", "Lu28;", "Lkp8;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class jp8 extends u28 {
    public final float b;
    public final float c;

    public jp8(float f, float f2) {
        this.b = f;
        this.c = f2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        jp8 jp8Var = obj instanceof jp8 ? (jp8) obj : null;
        return jp8Var != null && vj3.b(this.b, jp8Var.b) && vj3.b(this.c, jp8Var.c);
    }

    @Override // defpackage.u28
    public final q28 f() {
        kp8 kp8Var = new kp8();
        kp8Var.o = this.b;
        kp8Var.p = this.c;
        kp8Var.q = true;
        return kp8Var;
    }

    public final int hashCode() {
        return ((Float.floatToIntBits(this.c) + (Float.floatToIntBits(this.b) * 31)) * 31) + 1231;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        kp8 kp8Var = (kp8) q28Var;
        float f = kp8Var.o;
        float f2 = this.b;
        boolean zB = vj3.b(f, f2);
        float f3 = this.c;
        if (!zB || !vj3.b(kp8Var.p, f3) || !kp8Var.q) {
            flb.v0(kp8Var).U(false);
        }
        kp8Var.o = f2;
        kp8Var.p = f3;
        kp8Var.q = true;
    }

    public final String toString() {
        return "OffsetModifierElement(x=" + ((Object) vj3.c(this.b)) + ", y=" + ((Object) vj3.c(this.c)) + ", rtlAware=true)";
    }
}
