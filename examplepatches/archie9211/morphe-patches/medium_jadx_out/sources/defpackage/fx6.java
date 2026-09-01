package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fx6 extends q28 implements u22, od5 {
    public cq o;
    public kx6 p;
    public lid q;
    public final k49 r = qo7.u(null);

    public fx6(cq cqVar, kx6 kx6Var, lid lidVar) {
        this.o = cqVar;
        this.p = kx6Var;
        this.q = lidVar;
    }

    @Override // defpackage.q28
    public final void A0() {
        this.o.k(this);
    }

    @Override // defpackage.od5
    public final void X(eh8 eh8Var) {
        this.r.setValue(eh8Var);
    }

    @Override // defpackage.q28
    public final void y0() {
        cq cqVar = this.o;
        if (cqVar.a != null) {
            e26.c("Expected textInputModifierNode to be null");
        }
        cqVar.a = this;
    }
}
