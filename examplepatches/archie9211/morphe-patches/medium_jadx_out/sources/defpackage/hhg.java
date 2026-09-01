package defpackage;

import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hhg {
    public static final hhg b = new hhg();
    public final AtomicReference a = new AtomicReference(new gig(new z7a(1)));

    public final synchronized void a(q0g q0gVar) {
        Object obj;
        z7a z7aVar = new z7a((gig) this.a.get());
        HashMap map = z7aVar.b;
        switch (q0gVar.a) {
            case 0:
                obj = lwf.class;
                break;
            case 1:
                obj = rug.class;
                break;
            case 2:
                obj = xwf.class;
                break;
            case 3:
                obj = vwf.class;
                break;
            case 4:
                obj = ijg.class;
                break;
            default:
                obj = nvg.class;
                break;
        }
        if (map.containsKey(obj)) {
            q0g q0gVar2 = (q0g) map.get(obj);
            if (!q0gVar2.equals(q0gVar) || !q0gVar.equals(q0gVar2)) {
                throw new GeneralSecurityException("Attempt to register non-equal PrimitiveWrapper object or input class object for already existing object of type".concat(String.valueOf(obj)));
            }
        } else {
            map.put(obj, q0gVar);
        }
        this.a.set(new gig(z7aVar));
    }

    public final synchronized void b(cig cigVar) {
        z7a z7aVar = new z7a((gig) this.a.get());
        z7aVar.b(cigVar);
        this.a.set(new gig(z7aVar));
    }
}
