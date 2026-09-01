package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lfy8;", "Lu28;", "Lgy8;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class fy8 extends u28 {
    public final float b;
    public final float c;
    public final float d;
    public final float e;

    public fy8(float f, float f2, float f3, float f4) {
        this.b = f;
        this.c = f2;
        this.d = f3;
        this.e = f4;
        boolean z = true;
        boolean z2 = (f >= 0.0f || Float.isNaN(f)) & (f2 >= 0.0f || Float.isNaN(f2)) & (f3 >= 0.0f || Float.isNaN(f3));
        if (f4 < 0.0f && !Float.isNaN(f4)) {
            z = false;
        }
        if (!z2 || !z) {
            z16.a("Padding must be non-negative");
        }
    }

    public final boolean equals(Object obj) {
        fy8 fy8Var = obj instanceof fy8 ? (fy8) obj : null;
        return fy8Var != null && vj3.b(this.b, fy8Var.b) && vj3.b(this.c, fy8Var.c) && vj3.b(this.d, fy8Var.d) && vj3.b(this.e, fy8Var.e);
    }

    @Override // defpackage.u28
    public final q28 f() {
        gy8 gy8Var = new gy8();
        gy8Var.o = this.b;
        gy8Var.p = this.c;
        gy8Var.q = this.d;
        gy8Var.r = this.e;
        gy8Var.s = true;
        return gy8Var;
    }

    public final int hashCode() {
        return ((Float.floatToIntBits(this.e) + km4.p(this.d, km4.p(this.c, Float.floatToIntBits(this.b) * 31, 31), 31)) * 31) + 1231;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        gy8 gy8Var = (gy8) q28Var;
        gy8Var.o = this.b;
        gy8Var.p = this.c;
        gy8Var.q = this.d;
        gy8Var.r = this.e;
        gy8Var.s = true;
    }
}
