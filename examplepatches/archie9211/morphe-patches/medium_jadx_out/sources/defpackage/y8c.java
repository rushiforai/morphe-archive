package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class y8c implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ f9c b;
    public final /* synthetic */ u8c c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ r28 e;

    public /* synthetic */ y8c(f9c f9cVar, u8c u8cVar, boolean z, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = f9cVar;
        this.c = u8cVar;
        this.d = z;
        this.e = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                iq7.g(this.b, this.c, this.d, this.e, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                iq7.j(this.b, this.c, this.d, this.e, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }
}
