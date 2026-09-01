package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Ln80;", "Lu28;", "Lo80;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class n80 extends u28 {
    public final float b;
    public final boolean c;

    public n80(float f, boolean z) {
        this.b = f;
        this.c = z;
        if (f > 0.0f) {
            return;
        }
        z16.a("aspectRatio " + f + " must be > 0");
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        n80 n80Var = obj instanceof n80 ? (n80) obj : null;
        if (n80Var != null && this.b == n80Var.b) {
            return this.c == ((n80) obj).c;
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        o80 o80Var = new o80();
        o80Var.o = this.b;
        o80Var.p = this.c;
        return o80Var;
    }

    public final int hashCode() {
        return (Float.floatToIntBits(this.b) * 31) + (this.c ? 1231 : 1237);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        o80 o80Var = (o80) q28Var;
        o80Var.o = this.b;
        o80Var.p = this.c;
    }
}
