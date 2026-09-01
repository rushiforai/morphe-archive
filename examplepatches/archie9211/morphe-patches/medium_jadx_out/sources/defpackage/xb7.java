package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0080\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lxb7;", "Lu28;", "Lyb7;", "lottie-compose_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
public final /* data */ class xb7 extends u28 {
    public final int b;
    public final int c;

    public xb7(int i, int i2) {
        this.b = i;
        this.c = i2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xb7)) {
            return false;
        }
        xb7 xb7Var = (xb7) obj;
        return this.b == xb7Var.b && this.c == xb7Var.c;
    }

    @Override // defpackage.u28
    public final q28 f() {
        yb7 yb7Var = new yb7();
        yb7Var.o = this.b;
        yb7Var.p = this.c;
        return yb7Var;
    }

    public final int hashCode() {
        return (this.b * 31) + this.c;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        yb7 yb7Var = (yb7) q28Var;
        yb7Var.getClass();
        yb7Var.o = this.b;
        yb7Var.p = this.c;
    }

    public final String toString() {
        return ev6.s(this.b, this.c, "LottieAnimationSizeElement(width=", ", height=", ")");
    }
}
