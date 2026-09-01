package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class yb8 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ long b;
    public final /* synthetic */ long c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ yb8(r28 r28Var, long j, long j2, y3f y3fVar, mz1 mz1Var, int i) {
        this.d = r28Var;
        this.b = j;
        this.c = j2;
        this.e = y3fVar;
        this.f = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.f;
        Object obj4 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(196615);
                fc8.a(this.d, this.b, this.c, (y3f) obj4, (mz1) obj3, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                bo.t((xpd) obj4, this.b, this.c, (mpd) obj3, this.d, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ yb8(xpd xpdVar, long j, long j2, mpd mpdVar, r28 r28Var, int i) {
        this.e = xpdVar;
        this.b = j;
        this.c = j2;
        this.f = mpdVar;
        this.d = r28Var;
    }
}
