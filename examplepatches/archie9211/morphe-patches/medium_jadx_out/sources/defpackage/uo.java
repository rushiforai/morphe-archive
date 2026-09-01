package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uo extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ xb3 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uo(xb3 xb3Var, int i) {
        super(1);
        this.a = i;
        this.b = xb3Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        xb3 xb3Var = this.b;
        switch (i) {
            case 0:
                xb3Var.show();
                return new u7(1, xb3Var);
            default:
                if (xb3Var.f.a) {
                    xb3Var.e.invoke();
                }
                return c1e.a;
        }
    }
}
