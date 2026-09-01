package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class xcf implements c55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ aef b;
    public final /* synthetic */ kv6 c;
    public final /* synthetic */ ddf d;
    public final /* synthetic */ sh9 e;

    public /* synthetic */ xcf(aef aefVar, kv6 kv6Var, ddf ddfVar, sh9 sh9Var) {
        this.b = aefVar;
        this.c = kv6Var;
        this.d = ddfVar;
        this.e = sh9Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                hy8 hy8Var = (hy8) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    aef aefVar = this.b;
                    boolean z = aefVar.a;
                    ddf ddfVar = this.d;
                    boolean zF = p65Var.f(ddfVar);
                    Object objM = p65Var.M();
                    if (zF || objM == w12.a) {
                        objM = new iaf(0, ddfVar, ddf.class, "refreshWholeScreen", "refreshWholeScreen()V", 0, 8);
                        p65Var.j0(objM);
                    }
                    er7.d(z, (m45) ((qh6) objM), w2g.B(o28.b, hy8Var), null, 0L, 0L, false, 0.0f, null, null, pxf.E(1655935407, new xcf(aefVar, this.c, ddfVar, this.e), p65Var), p65Var, 0, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    flb.U(this.b, this.c, this.d, this.e, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ xcf(aef aefVar, ddf ddfVar, kv6 kv6Var, sh9 sh9Var) {
        this.b = aefVar;
        this.d = ddfVar;
        this.c = kv6Var;
        this.e = sh9Var;
    }
}
