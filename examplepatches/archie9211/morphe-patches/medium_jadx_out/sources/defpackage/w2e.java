package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lw2e;", "Lu28;", "Lx2e;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class w2e extends u28 {
    public final float b;
    public final float c;

    public w2e(float f, float f2) {
        this.b = f;
        this.c = f2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof w2e)) {
            return false;
        }
        w2e w2eVar = (w2e) obj;
        return vj3.b(this.b, w2eVar.b) && vj3.b(this.c, w2eVar.c);
    }

    @Override // defpackage.u28
    public final q28 f() {
        x2e x2eVar = new x2e();
        x2eVar.o = this.b;
        x2eVar.p = this.c;
        return x2eVar;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.c) + (Float.floatToIntBits(this.b) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        x2e x2eVar = (x2e) q28Var;
        x2eVar.o = this.b;
        x2eVar.p = this.c;
    }
}
