package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class cu7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ mkd c;
    public final /* synthetic */ int d;

    public /* synthetic */ cu7(String str, mkd mkdVar, int i, int i2) {
        this.a = i2;
        this.b = str;
        this.c = mkdVar;
        this.d = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        mkd mkdVar = this.c;
        String str = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                dl7.f(str, mkdVar, x12Var, tr7.y(i2 | 1));
                break;
            default:
                fu7.a(str, mkdVar, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
