package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class cl0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ t99 b;
    public final /* synthetic */ int c;
    public final /* synthetic */ int d;

    public /* synthetic */ cl0(int i, t99 t99Var, int i2, int i3) {
        this.a = i3;
        this.c = i;
        this.b = t99Var;
        this.d = i2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        int i3 = this.c;
        t99 t99Var = this.b;
        s99 s99Var = (s99) obj;
        switch (i) {
            case 0:
                s99Var.getClass();
                s99Var.g(t99Var, i3, i2, 0.0f);
                break;
            case 1:
                s99Var.getClass();
                s99Var.g(t99Var, i3, i2, 0.0f);
                break;
            case 2:
                s99Var.g(t99Var, i3, i2, 0.0f);
                break;
            case 3:
                s99Var.g(t99Var, nk7.w0((i3 - t99Var.a) / 2.0f), nk7.w0((i2 - t99Var.b) / 2.0f), 0.0f);
                break;
            case 4:
                s99Var.g(t99Var, nk7.w0((i3 - t99Var.a) / 2.0f), nk7.w0((i2 - t99Var.b) / 2.0f), 0.0f);
                break;
            default:
                s99Var.g(t99Var, i3, i2, 0.0f);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ cl0(t99 t99Var, int i, int i2, int i3) {
        this.a = i3;
        this.b = t99Var;
        this.c = i;
        this.d = i2;
    }
}
