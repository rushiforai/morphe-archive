package defpackage;

import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wn6 extends rv8 {
    public final un6 C;
    public final f66 D;

    public wn6(un6 un6Var, f66 f66Var) {
        f66Var.getClass();
        this.C = un6Var;
        this.D = f66Var;
    }

    @Override // defpackage.rv8
    public final long C() {
        Object ajbVar;
        try {
            ajbVar = Long.valueOf(this.C.a());
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            d66 d66Var = d66.WARN;
            List listR = d46.R(e66.MAINTAINER, e66.TELEMETRY);
            ot2 ot2Var = ot2.B;
            nig nigVar = (nig) this.D;
            nigVar.getClass();
            d66Var.getClass();
            Iterator it2 = listR.iterator();
            while (it2.hasNext()) {
                nigVar.y(d66Var, (e66) it2.next(), ot2Var, thB, true);
            }
        }
        if (bjb.b(ajbVar) != null) {
            ajbVar = Long.valueOf(System.currentTimeMillis());
        }
        return ((Number) ajbVar).longValue();
    }
}
