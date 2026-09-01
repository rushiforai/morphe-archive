package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s41 extends j2 {
    public final /* synthetic */ t41 h;

    public s41(t41 t41Var) {
        this.h = t41Var;
    }

    @Override // defpackage.j2
    public final String i() {
        q41 q41Var = (q41) this.h.a.get();
        if (q41Var == null) {
            return "Completer object has been garbage collected, future will fail soon";
        }
        return "tag=[" + q41Var.a + "]";
    }
}
