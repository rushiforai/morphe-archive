package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class w8c implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ u8c b;
    public final /* synthetic */ int c;

    public /* synthetic */ w8c(u8c u8cVar, int i, int i2) {
        this.a = i2;
        this.b = u8cVar;
        this.c = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.c;
        u8c u8cVar = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                iq7.m(u8cVar, x12Var, tr7.y(i2 | 1));
                break;
            default:
                iq7.l(u8cVar, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
