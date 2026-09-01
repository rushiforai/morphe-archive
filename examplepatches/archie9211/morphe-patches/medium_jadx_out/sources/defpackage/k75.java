package defpackage;

import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class k75 extends g75 implements dz7 {
    public zf4 b = zf4.c;
    public boolean c;

    public final void d(l75 l75Var) {
        ngc ngcVar;
        if (!this.c) {
            this.b = this.b.clone();
            this.c = true;
        }
        zf4 zf4Var = this.b;
        zf4 zf4Var2 = l75Var.a;
        zf4Var.getClass();
        int i = 0;
        while (true) {
            int size = zf4Var2.a.b.size();
            ngcVar = zf4Var2.a;
            if (i >= size) {
                break;
            }
            zf4Var.g((Map.Entry) ngcVar.b.get(i));
            i++;
        }
        Iterator it2 = ngcVar.c().iterator();
        while (it2.hasNext()) {
            zf4Var.g((Map.Entry) it2.next());
        }
    }
}
