package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ihc {
    public final dic a;
    public final x51 b;

    public ihc(dic dicVar, x51 x51Var) {
        this.a = dicVar;
        this.b = x51Var;
    }

    public final void a() {
        x51 x51Var = this.b;
        if (x51Var.r() instanceof ai8) {
            x51Var.resumeWith(aic.Dismissed);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && ihc.class == obj.getClass()) {
            ihc ihcVar = (ihc) obj;
            return g76.L(this.a, ihcVar.a) && this.b == ihcVar.b;
        }
        return false;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }
}
