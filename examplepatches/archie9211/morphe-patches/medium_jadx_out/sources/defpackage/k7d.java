package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class k7d implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ float c;
    public final /* synthetic */ long d;
    public final /* synthetic */ Object e;

    public /* synthetic */ k7d(Object obj, r28 r28Var, float f, long j, int i, int i2) {
        this.a = i2;
        this.e = obj;
        this.b = r28Var;
        this.c = f;
        this.d = j;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                ((rz5) obj3).t(this.c, iY, this.d, (x12) obj, this.b);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(3073);
                ((fa4) obj3).o(this.c, iY2, this.d, (x12) obj, this.b);
                break;
        }
        return c1eVar;
    }
}
