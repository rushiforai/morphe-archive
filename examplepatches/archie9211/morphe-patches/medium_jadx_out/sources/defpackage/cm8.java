package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cm8 implements pj6 {
    public final pj6 a;
    public final yzb b;

    public cm8(pj6 pj6Var) {
        pj6Var.getClass();
        this.a = pj6Var;
        this.b = new yzb(pj6Var.a());
    }

    @Override // defpackage.pj6
    public final xzb a() {
        return this.b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        if (obj != null) {
            xtcVar.p(this.a, obj);
        } else {
            xtcVar.m();
        }
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        if (kw2Var.u()) {
            return kw2Var.a(this.a);
        }
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return obj != null && cm8.class == obj.getClass() && g76.L(this.a, ((cm8) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }
}
