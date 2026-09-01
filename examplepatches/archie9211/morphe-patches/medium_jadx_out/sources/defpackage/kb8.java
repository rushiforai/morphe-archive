package defpackage;

import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kb8 implements d55 {
    public final /* synthetic */ hwb a;
    public final /* synthetic */ ba8 b;
    public final /* synthetic */ nob c;
    public final /* synthetic */ l78 d;
    public final /* synthetic */ upc e;

    public kb8(hwb hwbVar, ba8 ba8Var, oob oobVar, l78 l78Var, upc upcVar) {
        this.a = hwbVar;
        this.b = ba8Var;
        this.c = oobVar;
        this.d = l78Var;
        this.e = upcVar;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        Object objPrevious;
        iv ivVar = (iv) obj;
        ba8 ba8Var = (ba8) obj2;
        x12 x12Var = (x12) obj3;
        ((Number) obj4).intValue();
        boolean zL = g76.L(this.a.d.getValue(), this.b);
        if (!((Boolean) this.d.getValue()).booleanValue() && !zL) {
            List list = (List) this.e.getValue();
            ListIterator listIterator = list.listIterator(list.size());
            while (true) {
                if (!listIterator.hasPrevious()) {
                    objPrevious = null;
                    break;
                }
                objPrevious = listIterator.previous();
                if (g76.L(ba8Var, (ba8) objPrevious)) {
                    break;
                }
            }
            ba8Var = (ba8) objPrevious;
        }
        p65 p65Var = (p65) x12Var;
        if (ba8Var == null) {
            p65Var.Y(105930796);
        } else {
            p65Var.Y(-1520603531);
            mo7.j(ba8Var, this.c, pxf.E(-1263531443, new kd(ba8Var, 8, ivVar), p65Var), p65Var, 384);
        }
        p65Var.p(false);
        return c1e.a;
    }
}
