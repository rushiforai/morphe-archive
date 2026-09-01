package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class oe7 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ pe7 b;

    public /* synthetic */ oe7(pe7 pe7Var, int i) {
        this.a = i;
        this.b = pe7Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        pe7 pe7Var = this.b;
        switch (i) {
            case 0:
                pe7Var.K0();
                return c1e.a;
            case 1:
                return new ip8(pe7Var.C);
            default:
                hp6 hp6Var = (hp6) pe7Var.A.getValue();
                return new ip8(hp6Var != null ? hp6Var.I(0L) : 9205357640488583168L);
        }
    }
}
