package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y95 implements cqc {
    public final wfd a;

    public y95(wfd wfdVar) {
        this.a = wfdVar;
    }

    @Override // defpackage.cqc
    public final boolean a(zj0 zj0Var) {
        g89 g89Var = zj0Var.b;
        if (g89Var != g89.UNREGISTERED && g89Var != g89.REGISTERED && g89Var != g89.REGISTER_ERROR) {
            return false;
        }
        this.a.d(zj0Var.a);
        return true;
    }

    @Override // defpackage.cqc
    public final boolean onException(Exception exc) {
        return false;
    }
}
