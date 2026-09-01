package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class rn7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;
    public final /* synthetic */ m45 g;
    public final /* synthetic */ String h;
    public final /* synthetic */ m45 i;
    public final /* synthetic */ int j;
    public final /* synthetic */ int k;

    public /* synthetic */ rn7(String str, m45 m45Var, r28 r28Var, String str2, String str3, m45 m45Var2, String str4, m45 m45Var3, int i, int i2, int i3) {
        this.a = i3;
        this.b = str;
        this.c = m45Var;
        this.d = r28Var;
        this.e = str2;
        this.f = str3;
        this.g = m45Var2;
        this.h = str4;
        this.i = m45Var3;
        this.j = i;
        this.k = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.j;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                vv2.s(this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, (x12) obj, iY, this.k);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                ek7.h(this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, (x12) obj, iY2, this.k);
                break;
        }
        return c1eVar;
    }
}
