package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ds implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ r28 c;
    public final /* synthetic */ long d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ ds(zte zteVar, long j, boolean z, r28 r28Var, lp8 lp8Var) {
        this.e = zteVar;
        this.d = j;
        this.b = z;
        this.c = r28Var;
        this.f = lp8Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.f;
        Object obj4 = this.e;
        switch (i) {
            case 0:
                zte zteVar = (zte) obj4;
                lp8 lp8Var = (lp8) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    k40.c(z22.u.a(zteVar), pxf.E(1260045569, new fs(this.d, this.b, this.c, lp8Var), p65Var), p65Var, 56);
                }
                break;
            default:
                ((Integer) obj2).getClass();
                kng.e((String) obj4, this.b, this.c, this.d, (m45) obj3, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ds(String str, boolean z, r28 r28Var, long j, m45 m45Var, int i) {
        this.e = str;
        this.b = z;
        this.c = r28Var;
        this.d = j;
        this.f = m45Var;
    }
}
