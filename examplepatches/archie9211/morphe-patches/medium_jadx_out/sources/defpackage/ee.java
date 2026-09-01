package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ee implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ int c;
    public final /* synthetic */ r28 d;

    public /* synthetic */ ee(String str, r28 r28Var, int i) {
        this.a = 0;
        this.b = str;
        this.d = r28Var;
        this.c = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        r28 r28Var = this.d;
        int i2 = this.c;
        String str = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                k50.U(str, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            case 1:
                hp7.k(str, i2, r28Var, x12Var, tr7.y(1));
                break;
            default:
                hp7.d(str, i2, r28Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ee(String str, int i, r28 r28Var, int i2, int i3) {
        this.a = i3;
        this.b = str;
        this.c = i;
        this.d = r28Var;
    }
}
