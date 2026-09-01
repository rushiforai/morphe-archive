package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class so7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ int f;
    public final /* synthetic */ int g;
    public final /* synthetic */ Object h;

    public /* synthetic */ so7(sfb sfbVar, boolean z, boolean z2, veb vebVar, r28 r28Var, int i, int i2) {
        this.a = 2;
        this.c = sfbVar;
        this.b = z;
        this.e = z2;
        this.h = vebVar;
        this.d = r28Var;
        this.f = i;
        this.g = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.f;
        Object obj3 = this.h;
        Object obj4 = this.c;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                to7.a(this.b, (x45) obj4, this.d, this.e, (ey2) obj3, (x12) obj, iY, this.g);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                vo7.b(this.b, (x45) obj4, this.d, this.e, (cl1) obj3, (x12) obj, iY2, this.g);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                ep7.j((sfb) obj4, this.b, this.e, (veb) obj3, this.d, (x12) obj, iY3, this.g);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ so7(boolean z, x45 x45Var, r28 r28Var, boolean z2, Object obj, int i, int i2, int i3) {
        this.a = i3;
        this.b = z;
        this.c = x45Var;
        this.d = r28Var;
        this.e = z2;
        this.h = obj;
        this.f = i;
        this.g = i2;
    }
}
