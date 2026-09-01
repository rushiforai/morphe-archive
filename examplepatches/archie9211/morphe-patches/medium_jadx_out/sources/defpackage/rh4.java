package defpackage;

import kotlin.Metadata;

/* JADX INFO: Access modifiers changed from: package-private */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lrh4;", "Lu28;", "Lsh4;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class rh4 extends u28 {
    public final ef3 b;
    public final float c;

    public rh4(ef3 ef3Var, float f) {
        this.b = ef3Var;
        this.c = f;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rh4)) {
            return false;
        }
        rh4 rh4Var = (rh4) obj;
        return this.b == rh4Var.b && this.c == rh4Var.c;
    }

    @Override // defpackage.u28
    public final q28 f() {
        sh4 sh4Var = new sh4();
        sh4Var.o = this.b;
        sh4Var.p = this.c;
        return sh4Var;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.c) + (this.b.hashCode() * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        sh4 sh4Var = (sh4) q28Var;
        sh4Var.o = this.b;
        sh4Var.p = this.c;
    }
}
