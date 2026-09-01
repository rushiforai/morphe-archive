package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lifc;", "Lu28;", "Lkfc;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class ifc extends u28 {
    public final float b;
    public final float c;
    public final float d;
    public final float e;
    public final boolean f;

    public ifc(float f, float f2, float f3, float f4, boolean z, int i) {
        this((i & 1) != 0 ? Float.NaN : f, (i & 2) != 0 ? Float.NaN : f2, (i & 4) != 0 ? Float.NaN : f3, (i & 8) != 0 ? Float.NaN : f4, z);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ifc)) {
            return false;
        }
        ifc ifcVar = (ifc) obj;
        return vj3.b(this.b, ifcVar.b) && vj3.b(this.c, ifcVar.c) && vj3.b(this.d, ifcVar.d) && vj3.b(this.e, ifcVar.e) && this.f == ifcVar.f;
    }

    @Override // defpackage.u28
    public final q28 f() {
        kfc kfcVar = new kfc();
        kfcVar.o = this.b;
        kfcVar.p = this.c;
        kfcVar.q = this.d;
        kfcVar.r = this.e;
        kfcVar.s = this.f;
        return kfcVar;
    }

    public final int hashCode() {
        return km4.p(this.e, km4.p(this.d, km4.p(this.c, Float.floatToIntBits(this.b) * 31, 31), 31), 31) + (this.f ? 1231 : 1237);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        kfc kfcVar = (kfc) q28Var;
        kfcVar.o = this.b;
        kfcVar.p = this.c;
        kfcVar.q = this.d;
        kfcVar.r = this.e;
        kfcVar.s = this.f;
    }

    public ifc(float f, float f2, float f3, float f4, boolean z) {
        this.b = f;
        this.c = f2;
        this.d = f3;
        this.e = f4;
        this.f = z;
    }
}
