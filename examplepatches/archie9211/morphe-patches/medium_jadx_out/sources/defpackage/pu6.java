package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pu6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ru6 b;

    public /* synthetic */ pu6(ru6 ru6Var, int i) {
        this.a = i;
        this.b = ru6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        ru6 ru6Var = this.b;
        switch (i) {
            case 0:
                return Float.valueOf(ru6Var.p.b());
            case 1:
                return Float.valueOf(ru6Var.p.d());
            default:
                return Float.valueOf(ru6Var.p.a() - ru6Var.p.c());
        }
    }
}
