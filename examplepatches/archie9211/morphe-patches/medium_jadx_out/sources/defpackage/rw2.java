package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rw2 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ tw2 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rw2(tw2 tw2Var, int i) {
        super(0);
        this.a = i;
        this.b = tw2Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        tw2 tw2Var = this.b;
        switch (i) {
            case 0:
                boolean zB0 = muc.b0(tw2Var.d());
                String str = tw2Var.h;
                return (zB0 || muc.Q(str, tw2Var.d(), false)) ? str : b09.y(tw2Var.d(), " ", str);
            default:
                return (String) bu1.x0(muc.o0(tw2Var.k, new char[]{'.'}));
        }
    }
}
