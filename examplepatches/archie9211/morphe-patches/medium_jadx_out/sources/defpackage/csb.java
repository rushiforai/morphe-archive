package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcsb;", "Lu28;", "Lmsb;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class csb extends u28 {
    public final nsb b;
    public final hw8 c;
    public final boolean d;
    public final boolean e;

    public csb(nsb nsbVar, hw8 hw8Var, boolean z, boolean z2) {
        this.b = nsbVar;
        this.c = hw8Var;
        this.d = z;
        this.e = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof csb)) {
            return false;
        }
        csb csbVar = (csb) obj;
        return g76.L(this.b, csbVar.b) && this.c == csbVar.c && this.d == csbVar.d && this.e == csbVar.e;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new msb(null, null, null, this.c, null, this.b, this.d, this.e);
    }

    public final int hashCode() {
        return (((((this.c.hashCode() + (this.b.hashCode() * 31)) * 961) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 29791;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((msb) q28Var).d1(null, null, null, this.c, null, this.b, this.d, this.e);
    }
}
