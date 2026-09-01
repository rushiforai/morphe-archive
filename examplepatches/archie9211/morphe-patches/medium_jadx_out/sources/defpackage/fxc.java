package defpackage;

import androidx.core.widget.nRCC.nGxjfIr;
import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class fxc implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ nxc b;
    public final /* synthetic */ gxc c;

    public /* synthetic */ fxc(nxc nxcVar, gxc gxcVar, int i) {
        this.a = i;
        this.b = nxcVar;
        this.c = gxcVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        nxc nxcVar = this.b;
        int i2 = 1;
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
                if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    boolean zA = nxcVar.a();
                    gxc gxcVar = this.c;
                    boolean zH = p65Var.h(gxcVar);
                    Object objM = p65Var.M();
                    if (zH || objM == w12.a) {
                        joc jocVar = new joc(0, gxcVar, gxc.class, "onRefresh", nGxjfIr.BvRhFaiBqjBF, 0, 10);
                        p65Var.j0(jocVar);
                        objM = jocVar;
                    }
                    er7.d(zA, (m45) ((qh6) objM), w2g.B(o28.b, hy8Var).b(jfc.c), null, 0L, 0L, false, 0.0f, null, null, pxf.E(-45757756, new fxc(nxcVar, gxcVar, i2), p65Var), p65Var, 0, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else if (nxcVar instanceof mxc) {
                    p65Var2.Y(-1023527390);
                    g76.E(0, 0L, p65Var2, null);
                    p65Var2.p(false);
                } else {
                    boolean z = nxcVar instanceof jxc;
                    gxc gxcVar2 = this.c;
                    if (z) {
                        p65Var2.Y(-1023524185);
                        g76.B((jxc) nxcVar, gxcVar2, null, p65Var2, 0);
                        p65Var2.p(false);
                    } else if (nxcVar instanceof lxc) {
                        p65Var2.Y(-1664284291);
                        g76.D((lxc) nxcVar, gxcVar2, null, p65Var2, 0);
                        p65Var2.p(false);
                    } else {
                        if (!(nxcVar instanceof kxc)) {
                            throw ho2.L(p65Var2, -1023529495, false);
                        }
                        p65Var2.Y(-1023511808);
                        g76.C(null, p65Var2, 0);
                        p65Var2.p(false);
                    }
                }
                return c1eVar;
        }
    }
}
