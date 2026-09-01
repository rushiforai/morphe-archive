package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Ld09;", "Lu28;", "Le09;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
final /* data */ class d09 extends u28 {
    public final c09 b;
    public final xd c;
    public final w82 d;
    public final float e;
    public final bs0 f;

    public d09(c09 c09Var, xd xdVar, w82 w82Var, float f, bs0 bs0Var) {
        this.b = c09Var;
        this.c = xdVar;
        this.d = w82Var;
        this.e = f;
        this.f = bs0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d09)) {
            return false;
        }
        d09 d09Var = (d09) obj;
        return g76.L(this.b, d09Var.b) && g76.L(this.c, d09Var.c) && g76.L(this.d, d09Var.d) && Float.compare(this.e, d09Var.e) == 0 && g76.L(this.f, d09Var.f);
    }

    @Override // defpackage.u28
    public final q28 f() {
        e09 e09Var = new e09();
        e09Var.o = this.b;
        e09Var.p = true;
        e09Var.q = this.c;
        e09Var.r = this.d;
        e09Var.s = this.e;
        e09Var.t = this.f;
        return e09Var;
    }

    public final int hashCode() {
        int iP = km4.p(this.e, (this.d.hashCode() + ((this.c.hashCode() + (((this.b.hashCode() * 31) + 1231) * 31)) * 31)) * 31, 31);
        bs0 bs0Var = this.f;
        return iP + (bs0Var == null ? 0 : bs0Var.hashCode());
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        e09 e09Var = (e09) q28Var;
        boolean z = e09Var.p;
        c09 c09Var = this.b;
        boolean z2 = (z && dfc.a(e09Var.o.h(), c09Var.h())) ? false : true;
        e09Var.o = c09Var;
        e09Var.p = true;
        e09Var.q = this.c;
        e09Var.r = this.d;
        e09Var.s = this.e;
        e09Var.t = this.f;
        if (z2) {
            gx1.M(e09Var);
        }
        wgf.y(e09Var);
    }

    public final String toString() {
        return "PainterElement(painter=" + this.b + ", sizeToIntrinsics=true, alignment=" + this.c + ", contentScale=" + this.d + ", alpha=" + this.e + ", colorFilter=" + this.f + ')';
    }
}
