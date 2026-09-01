package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lw8f;", "Lu28;", "Ly8f;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class w8f extends u28 {
    public final ef3 b;
    public final b55 c;
    public final Object d;

    public w8f(ef3 ef3Var, b55 b55Var, Object obj) {
        this.b = ef3Var;
        this.c = b55Var;
        this.d = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || w8f.class != obj.getClass()) {
            return false;
        }
        w8f w8fVar = (w8f) obj;
        return this.b == w8fVar.b && g76.L(this.d, w8fVar.d);
    }

    @Override // defpackage.u28
    public final q28 f() {
        y8f y8fVar = new y8f();
        y8fVar.o = this.b;
        y8fVar.p = this.c;
        return y8fVar;
    }

    public final int hashCode() {
        return this.d.hashCode() + (((this.b.hashCode() * 31) + 1237) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        y8f y8fVar = (y8f) q28Var;
        y8fVar.o = this.b;
        y8fVar.p = this.c;
    }
}
