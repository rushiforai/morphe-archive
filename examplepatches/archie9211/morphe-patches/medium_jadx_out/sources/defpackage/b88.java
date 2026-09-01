package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class b88 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ r28 c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ int e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    public /* synthetic */ b88(r28 r28Var, boolean z, boolean z2, m5d m5dVar, d56 d56Var, m3c m3cVar, int i) {
        this.a = 2;
        this.c = r28Var;
        this.b = z;
        this.d = z2;
        this.f = m5dVar;
        this.g = d56Var;
        this.h = m3cVar;
        this.e = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.e;
        Object obj3 = this.h;
        Object obj4 = this.g;
        Object obj5 = this.f;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                ok7.c(this.b, (xn7) obj5, (m45) obj4, (m45) obj3, this.c, this.d, (x12) obj, iY);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                o5d.a(this.b, (x45) obj5, this.c, this.d, (m5d) obj4, (m68) obj3, (x12) obj, iY2);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                o5d.b(this.c, this.b, this.d, (m5d) obj5, (d56) obj4, (m3c) obj3, (x12) obj, iY3);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(i2 | 1);
                p5d.a(this.b, (x45) obj5, this.c, this.d, (m68) obj4, (h23) obj3, (x12) obj, iY4);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ b88(boolean z, x45 x45Var, r28 r28Var, boolean z2, Object obj, Object obj2, int i, int i2) {
        this.a = i2;
        this.b = z;
        this.f = x45Var;
        this.c = r28Var;
        this.d = z2;
        this.g = obj;
        this.h = obj2;
        this.e = i;
    }

    public /* synthetic */ b88(boolean z, xn7 xn7Var, m45 m45Var, m45 m45Var2, r28 r28Var, boolean z2, int i) {
        this.a = 0;
        this.b = z;
        this.f = xn7Var;
        this.g = m45Var;
        this.h = m45Var2;
        this.c = r28Var;
        this.d = z2;
        this.e = i;
    }
}
