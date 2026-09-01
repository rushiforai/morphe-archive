package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class c5 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ t99 b;
    public final /* synthetic */ int c;

    public /* synthetic */ c5(t99 t99Var, int i, int i2) {
        this.a = i2;
        this.b = t99Var;
        this.c = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.c;
        t99 t99Var = this.b;
        s99 s99Var = (s99) obj;
        switch (i) {
            case 0:
                s99Var.g(t99Var, 0, -i2, 0.0f);
                break;
            case 1:
                s99Var.g(t99Var, -i2, 0, 0.0f);
                break;
            default:
                s99Var.g(t99Var, 0, -i2, 0.0f);
                break;
        }
        return c1eVar;
    }
}
