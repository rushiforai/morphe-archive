package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lsq6;", "Lu28;", "Ltq6;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class sq6 extends u28 {
    public final float b;
    public final boolean c;

    public sq6(float f, boolean z) {
        this.b = f;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        sq6 sq6Var = obj instanceof sq6 ? (sq6) obj : null;
        return sq6Var != null && this.b == sq6Var.b && this.c == sq6Var.c;
    }

    @Override // defpackage.u28
    public final q28 f() {
        tq6 tq6Var = new tq6();
        tq6Var.o = this.b;
        tq6Var.p = this.c;
        return tq6Var;
    }

    public final int hashCode() {
        return (Float.floatToIntBits(this.b) * 31) + (this.c ? 1231 : 1237);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        tq6 tq6Var = (tq6) q28Var;
        tq6Var.o = this.b;
        tq6Var.p = this.c;
    }
}
