package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lui7;", "Lu28;", "Lyi7;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final /* data */ class ui7 extends u28 {
    public final int b;
    public final rd6 c;
    public final float d;

    public ui7(int i, rd6 rd6Var, float f) {
        this.b = i;
        this.c = rd6Var;
        this.d = f;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ui7)) {
            return false;
        }
        ui7 ui7Var = (ui7) obj;
        return this.b == ui7Var.b && g76.L(this.c, ui7Var.c) && vj3.b(this.d, ui7Var.d);
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new yi7(this.b, this.c, this.d);
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.d) + ((this.c.hashCode() + ((126573 + this.b) * 31)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        yi7 yi7Var = (yi7) q28Var;
        yi7Var.x.setValue(this.c);
        yi7Var.y.setValue(new ti7());
        int i = yi7Var.o;
        int i2 = this.b;
        float f = this.d;
        if (i == 3 && yi7Var.p == 1200 && yi7Var.q == i2 && vj3.b(yi7Var.r, f)) {
            return;
        }
        yi7Var.o = 3;
        yi7Var.p = 1200;
        yi7Var.q = i2;
        yi7Var.r = f;
        yi7Var.J0();
    }

    public final String toString() {
        return "MarqueeModifierElement(iterations=3, animationMode=Immediately, delayMillis=1200, initialDelayMillis=" + this.b + ", spacing=" + this.c + ", velocity=" + ((Object) vj3.c(this.d)) + ')';
    }
}
