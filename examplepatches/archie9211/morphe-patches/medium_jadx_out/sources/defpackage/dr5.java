package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Ldr5;", "Lu28;", "Ler5;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class dr5 extends u28 {
    public final yq0 b;

    public dr5(yq0 yq0Var) {
        this.b = yq0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        dr5 dr5Var = obj instanceof dr5 ? (dr5) obj : null;
        if (dr5Var == null) {
            return false;
        }
        return this.b.equals(dr5Var.b);
    }

    @Override // defpackage.u28
    public final q28 f() {
        er5 er5Var = new er5();
        er5Var.o = this.b;
        return er5Var;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b.a);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((er5) q28Var).o = this.b;
    }
}
