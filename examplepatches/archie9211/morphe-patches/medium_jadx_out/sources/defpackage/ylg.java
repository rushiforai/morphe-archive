package defpackage;

import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ylg {
    public static final ylg b = new ylg();
    public final AtomicReference a = new AtomicReference(new eng(new z7a(2)));

    public final synchronized void a(xmg xmgVar) {
        AtomicReference atomicReference = this.a;
        z7a z7aVar = new z7a((eng) atomicReference.get());
        z7aVar.c(xmgVar);
        atomicReference.set(new eng(z7aVar));
    }

    public final synchronized void b(utg utgVar) {
        Object obj;
        AtomicReference atomicReference = this.a;
        z7a z7aVar = new z7a((eng) atomicReference.get());
        HashMap map = z7aVar.b;
        switch (utgVar.a) {
            case 0:
                obj = mjg.class;
                break;
            default:
                obj = njg.class;
                break;
        }
        if (map.containsKey(obj)) {
            utg utgVar2 = (utg) map.get(obj);
            if (!utgVar2.equals(utgVar) || !utgVar.equals(utgVar2)) {
                throw new GeneralSecurityException("Attempt to register non-equal PrimitiveWrapper object or input class object for already existing object of type".concat(obj.toString()));
            }
        } else {
            map.put(obj, utgVar);
        }
        atomicReference.set(new eng(z7aVar));
    }
}
