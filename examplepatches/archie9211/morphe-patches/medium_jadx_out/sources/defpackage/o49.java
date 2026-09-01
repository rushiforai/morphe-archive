package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lo49;", "Lu28;", "Ln49;", "material3"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class o49 extends u28 {
    public final o8 b;

    public o49(o8 o8Var) {
        this.b = o8Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof o49) {
            return this.b == ((o49) obj).b;
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        n49 n49Var = new n49();
        n49Var.o = this.b;
        return n49Var;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        n49 n49Var = (n49) q28Var;
        n49Var.o = this.b;
        dl7.u(n49Var);
    }
}
