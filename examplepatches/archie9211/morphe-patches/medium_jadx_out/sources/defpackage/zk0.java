package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zk0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ long c;
    public final /* synthetic */ int d;
    public final /* synthetic */ int e;
    public final /* synthetic */ Object f;

    public /* synthetic */ zk0(Object obj, r28 r28Var, long j, int i, int i2, int i3) {
        this.a = i3;
        this.f = obj;
        this.b = r28Var;
        this.c = j;
        this.d = i;
        this.e = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        Object obj3 = this.f;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                d46.d((hl0) obj3, this.b, this.c, (x12) obj, iY, this.e);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                s42.e((oe1) obj3, this.b, this.c, (x12) obj, iY2, this.e);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                vx0.p((String) obj3, this.b, this.c, (x12) obj, iY3, this.e);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(i2 | 1);
                vx0.o((mx) obj3, this.b, this.c, (x12) obj, iY4, this.e);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY5 = tr7.y(i2 | 1);
                fo7.h((xn7) obj3, this.b, this.c, (x12) obj, iY5, this.e);
                break;
        }
        return c1eVar;
    }
}
