package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fh3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ lh3 b;
    public final /* synthetic */ ah3 c;

    public /* synthetic */ fh3(lh3 lh3Var, ah3 ah3Var, int i, int i2) {
        this.a = i2;
        this.b = lh3Var;
        this.c = ah3Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ah3 ah3Var = this.c;
        lh3 lh3Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                rv8.j(lh3Var, ah3Var, x12Var, tr7.y(1));
                break;
            case 1:
                rv8.i(lh3Var, ah3Var, x12Var, tr7.y(1));
                break;
            default:
                rv8.b(lh3Var, ah3Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }
}
