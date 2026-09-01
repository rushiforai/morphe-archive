package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v20 extends u05 {
    public final /* synthetic */ c30 j;
    public final /* synthetic */ f30 k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v20(f30 f30Var, f30 f30Var2, c30 c30Var) {
        super(f30Var2);
        this.k = f30Var;
        this.j = c30Var;
    }

    @Override // defpackage.u05
    public final p9c b() {
        return this.j;
    }

    @Override // defpackage.u05
    public final boolean c() {
        f30 f30Var = this.k;
        if (f30Var.getInternalPopup().a()) {
            return true;
        }
        f30Var.f.m(f30Var.getTextDirection(), f30Var.getTextAlignment());
        return true;
    }
}
