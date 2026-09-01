package defpackage;

import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hn7 extends n68 {
    public pnb l;

    @Override // defpackage.g57
    public final void f() {
        Iterator it2 = this.l.iterator();
        while (true) {
            lnb lnbVar = (lnb) it2;
            if (!lnbVar.hasNext()) {
                return;
            }
            gn7 gn7Var = (gn7) ((Map.Entry) lnbVar.next()).getValue();
            gn7Var.a.e(gn7Var);
        }
    }

    @Override // defpackage.g57
    public final void g() {
        Iterator it2 = this.l.iterator();
        while (true) {
            lnb lnbVar = (lnb) it2;
            if (!lnbVar.hasNext()) {
                return;
            }
            gn7 gn7Var = (gn7) ((Map.Entry) lnbVar.next()).getValue();
            gn7Var.a.i(gn7Var);
        }
    }
}
