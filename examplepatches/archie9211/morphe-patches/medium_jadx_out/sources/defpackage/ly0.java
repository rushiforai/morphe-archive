package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lly0;", "Lu28;", "Lny0;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class ly0 extends u28 {
    public final ut b;

    public ly0(ut utVar) {
        this.b = utVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ly0) {
            return this.b == ((ly0) obj).b;
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new ny0(this.b);
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ny0 ny0Var = (ny0) q28Var;
        ut utVar = this.b;
        ny0Var.o = utVar;
        if (ny0Var.n) {
            utVar.invoke(ny0Var.p);
        }
    }
}
