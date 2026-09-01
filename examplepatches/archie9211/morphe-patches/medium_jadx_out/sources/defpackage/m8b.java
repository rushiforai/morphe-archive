package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class m8b implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ q8b b;
    public final /* synthetic */ p8b c;

    public /* synthetic */ m8b(q8b q8bVar, p8b p8bVar, int i, int i2) {
        this.a = i2;
        this.b = q8bVar;
        this.c = p8bVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        p8b p8bVar = this.c;
        q8b q8bVar = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                mk7.l(q8bVar, p8bVar, x12Var, tr7.y(1));
                break;
            default:
                mk7.a(q8bVar, p8bVar, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }
}
