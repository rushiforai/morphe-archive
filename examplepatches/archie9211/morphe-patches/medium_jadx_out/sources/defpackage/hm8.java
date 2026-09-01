package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class hm8 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ dr9 b;
    public final /* synthetic */ sh9 c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ int e;

    public /* synthetic */ hm8(int i, dr9 dr9Var, sh9 sh9Var, r28 r28Var, int i2) {
        this.a = 0;
        this.e = i;
        this.b = dr9Var;
        this.c = sh9Var;
        this.d = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = this.e;
        r28 r28Var = this.d;
        sh9 sh9Var = this.c;
        dr9 dr9Var = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                dl7.a(this.e, this.b, this.c, this.d, (x12) obj, iY);
                break;
            case 1:
                ((Integer) obj2).getClass();
                kk7.g(dr9Var, sh9Var, r28Var, (x12) obj, tr7.y(i2 | 1));
                break;
            case 2:
                ((Integer) obj2).getClass();
                kk7.n(dr9Var, sh9Var, r28Var, (x12) obj, tr7.y(i2 | 1));
                break;
            case 3:
                ((Integer) obj2).getClass();
                kk7.n(dr9Var, sh9Var, r28Var, (x12) obj, tr7.y(i2 | 1));
                break;
            case 4:
                ((Integer) obj2).getClass();
                kk7.n(dr9Var, sh9Var, r28Var, (x12) obj, tr7.y(i2 | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                kk7.g(dr9Var, sh9Var, r28Var, (x12) obj, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ hm8(dr9 dr9Var, sh9 sh9Var, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = dr9Var;
        this.c = sh9Var;
        this.d = r28Var;
        this.e = i;
    }
}
