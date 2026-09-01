package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u0000*\u0004\b\u0000\u0010\u00012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00030\u0002¨\u0006\u0004"}, d2 = {"Ljl3;", "T", "Lu28;", "Lll3;", "material3"}, k = 1, mv = {2, 0, 0}, xi = 48)
final class jl3<T> extends u28 {
    public final tl b;
    public final b55 c;
    public final hw8 d;

    public jl3(tl tlVar, b55 b55Var, hw8 hw8Var) {
        this.b = tlVar;
        this.c = b55Var;
        this.d = hw8Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jl3)) {
            return false;
        }
        jl3 jl3Var = (jl3) obj;
        return g76.L(this.b, jl3Var.b) && this.c == jl3Var.c && this.d == jl3Var.d;
    }

    @Override // defpackage.u28
    public final q28 f() {
        ll3 ll3Var = new ll3();
        ll3Var.o = this.b;
        ll3Var.p = this.c;
        ll3Var.q = this.d;
        return ll3Var;
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + (this.b.hashCode() * 31)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ll3 ll3Var = (ll3) q28Var;
        ll3Var.o = this.b;
        ll3Var.p = this.c;
        ll3Var.q = this.d;
    }
}
