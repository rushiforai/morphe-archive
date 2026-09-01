package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xm extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ t99 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xm(t99 t99Var, int i) {
        super(1);
        this.a = i;
        this.b = t99Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        t99 t99Var = this.b;
        switch (i) {
            case 0:
                ((s99) obj).g(t99Var, 0, 0, 0.0f);
                break;
            case 1:
                s99.j((s99) obj, t99Var, 0, 0);
                break;
            case 2:
                ((s99) obj).g(t99Var, 0, 0, 0.0f);
                break;
            case 3:
                ((s99) obj).g(t99Var, 0, 0, 0.0f);
                break;
            case 4:
                ((s99) obj).g(t99Var, 0, 0, 0.0f);
                break;
            case 5:
                s99 s99Var = (s99) obj;
                s99Var.getClass();
                s99.j(s99Var, t99Var, 0, 0);
                break;
            case 6:
                s99.j((s99) obj, t99Var, 0, 0);
                break;
            default:
                s99.k((s99) obj, t99Var, 0, 0);
                break;
        }
        return c1eVar;
    }
}
