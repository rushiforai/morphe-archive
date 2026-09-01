package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class gc0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ md0 b;
    public final /* synthetic */ wc0 c;
    public final /* synthetic */ r28 d;

    public /* synthetic */ gc0(md0 md0Var, wc0 wc0Var, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = md0Var;
        this.c = wc0Var;
        this.d = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        r28 r28Var = this.d;
        wc0 wc0Var = this.c;
        md0 md0Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                gsa.I(md0Var, wc0Var, r28Var, x12Var, tr7.y(1));
                break;
            default:
                gsa.g(md0Var, wc0Var, r28Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }
}
