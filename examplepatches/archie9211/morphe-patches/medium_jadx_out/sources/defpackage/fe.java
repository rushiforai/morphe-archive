package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fe implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ r28 c;

    public /* synthetic */ fe(String str, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = str;
        this.c = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        r28 r28Var = this.c;
        String str = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                k50.M(str, r28Var, x12Var, tr7.y(49));
                break;
            case 1:
                y91.e(str, r28Var, x12Var, tr7.y(1));
                break;
            case 2:
                nk7.o(str, r28Var, x12Var, tr7.y(1));
                break;
            case 3:
                mq7.h(str, r28Var, x12Var, tr7.y(1));
                break;
            case 4:
                dm2.k(str, r28Var, x12Var, tr7.y(49));
                break;
            default:
                aq7.a(str, r28Var, x12Var, tr7.y(49));
                break;
        }
        return c1eVar;
    }
}
