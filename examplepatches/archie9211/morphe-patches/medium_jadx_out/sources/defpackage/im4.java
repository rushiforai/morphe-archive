package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class im4 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ String c;
    public final /* synthetic */ r28 d;

    public /* synthetic */ im4(String str, r28 r28Var, String str2, int i) {
        this.a = 0;
        this.b = str;
        this.d = r28Var;
        this.c = str2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        r28 r28Var = this.d;
        String str = this.c;
        String str2 = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                k40.y(tr7.y(391), x12Var, r28Var, str2, str);
                break;
            case 1:
                mq7.a(tr7.y(1), x12Var, r28Var, str2, str);
                break;
            default:
                ek7.n(tr7.y(1), x12Var, r28Var, str2, str);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ im4(String str, String str2, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = str;
        this.c = str2;
        this.d = r28Var;
    }
}
