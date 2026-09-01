package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lj3c;", "Lu28;", "Lgs0;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final /* data */ class j3c extends u28 {
    public final float b;
    public final m3c c;
    public final boolean d;
    public final long e;
    public final long f;

    public j3c(float f, m3c m3cVar, boolean z, long j, long j2) {
        this.b = f;
        this.c = m3cVar;
        this.d = z;
        this.e = j;
        this.f = j2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j3c)) {
            return false;
        }
        j3c j3cVar = (j3c) obj;
        if (!vj3.b(this.b, j3cVar.b) || !g76.L(this.c, j3cVar.c) || this.d != j3cVar.d) {
            return false;
        }
        long j = j3cVar.e;
        int i = uu1.i;
        return ezd.a(this.e, j) && ezd.a(this.f, j3cVar.f);
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new gs0(new fw8(6, this));
    }

    public final int hashCode() {
        int iHashCode = (((this.c.hashCode() + (Float.floatToIntBits(this.b) * 31)) * 31) + (this.d ? 1231 : 1237)) * 31;
        int i = uu1.i;
        return ev6.n(this.f) + lv8.g(iHashCode, 31, this.e);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        eh8 eh8Var;
        gs0 gs0Var = (gs0) q28Var;
        fw8 fw8Var = new fw8(6, this);
        gs0Var.o = fw8Var;
        if (gs0Var.a.n && (eh8Var = flb.t0(gs0Var, 2).p) != null) {
            eh8Var.n1(fw8Var, true);
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ShadowGraphicsLayerElement(elevation=");
        sb.append((Object) vj3.c(this.b));
        sb.append(", shape=");
        sb.append(this.c);
        sb.append(", clip=");
        sb.append(this.d);
        sb.append(", ambientColor=");
        ev6.F(this.e, ", spotColor=", sb);
        sb.append((Object) uu1.h(this.f));
        sb.append(')');
        return sb.toString();
    }
}
