package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lzq4;", "Lu28;", "Lar4;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class zq4 extends u28 {
    public final x45 b;

    public zq4(x45 x45Var) {
        this.b = x45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof zq4) {
            return this.b == ((zq4) obj).b;
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        ar4 ar4Var = new ar4();
        ar4Var.o = this.b;
        return ar4Var;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((ar4) q28Var).o = this.b;
    }
}
