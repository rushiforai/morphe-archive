package defpackage;

import java.lang.reflect.Type;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class d1b implements o86 {
    @Override // defpackage.o86
    public f0b a(y05 y05Var) {
        Object next;
        y05Var.getClass();
        Iterator it2 = getAnnotations().iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (g76.L(e0b.a(vx0.T(vx0.P(((f0b) next).a))).a(), y05Var)) {
                break;
            }
        }
        return (f0b) next;
    }

    public abstract Type b();

    public final boolean equals(Object obj) {
        return (obj instanceof d1b) && g76.L(b(), ((d1b) obj).b());
    }

    public final int hashCode() {
        return b().hashCode();
    }

    public final String toString() {
        return getClass().getName() + ": " + b();
    }
}
