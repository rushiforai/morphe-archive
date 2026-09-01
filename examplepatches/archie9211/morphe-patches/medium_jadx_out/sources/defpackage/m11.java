package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class m11 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ int d;
    public final /* synthetic */ int e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;
    public final /* synthetic */ Object j;

    public /* synthetic */ m11(String str, int i, x45 x45Var, r28 r28Var, boolean z, int i2, sk6 sk6Var, pk6 pk6Var, String str2, int i3) {
        this.a = 2;
        this.f = str;
        this.d = i;
        this.g = x45Var;
        this.b = r28Var;
        this.c = z;
        this.e = i2;
        this.h = sk6Var;
        this.i = pk6Var;
        this.j = str2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = this.d;
        c1e c1eVar = c1e.a;
        Object obj3 = this.j;
        Object obj4 = this.i;
        Object obj5 = this.h;
        Object obj6 = this.g;
        Object obj7 = this.f;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                f76.w((m45) obj7, this.b, this.c, (m3c) obj6, (g11) obj5, (hy8) obj4, (c55) obj3, (x12) obj, iY, this.e);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                rx0.h((String) obj7, this.b, this.c, (Integer) obj6, (sk6) obj5, (pk6) obj4, (x45) obj3, (x12) obj, iY2, this.e);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(805331329);
                d46.l((String) obj7, this.d, (x45) obj6, this.b, this.c, this.e, (sk6) obj5, (pk6) obj4, (String) obj3, (x12) obj, iY3);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ m11(Object obj, r28 r28Var, boolean z, Object obj2, Object obj3, Object obj4, j55 j55Var, int i, int i2, int i3) {
        this.a = i3;
        this.f = obj;
        this.b = r28Var;
        this.c = z;
        this.g = obj2;
        this.h = obj3;
        this.i = obj4;
        this.j = j55Var;
        this.d = i;
        this.e = i2;
    }
}
