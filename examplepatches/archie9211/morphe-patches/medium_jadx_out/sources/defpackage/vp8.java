package defpackage;

import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class vp8 {
    public static final w5d a = new w5d(new oo7(23));

    public static final yi5 a(List list) {
        list.getClass();
        ru ruVar = new ru(3);
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            at5 at5Var = (at5) it2.next();
            ruVar.c(at5Var.a, at5Var.b);
        }
        return iq7.C(ruVar);
    }
}
