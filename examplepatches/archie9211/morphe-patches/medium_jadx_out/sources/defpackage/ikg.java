package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.security.GeneralSecurityException;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ikg {
    public static final Logger c = Logger.getLogger(ikg.class.getName());
    public static final ikg d = new ikg();
    public final ConcurrentHashMap a = new ConcurrentHashMap();
    public final ConcurrentHashMap b = new ConcurrentHashMap();

    public final synchronized void a(xkg xkgVar, boolean z) {
        b(xkgVar, 1, z);
    }

    public final synchronized void b(xkg xkgVar, int i, boolean z) {
        if (!hk7.M(i)) {
            throw new GeneralSecurityException("Cannot register key manager: FIPS compatibility insufficient");
        }
        c(xkgVar, z);
    }

    public final synchronized void c(xkg xkgVar, boolean z) {
        try {
            String str = xkgVar.a;
            if (z) {
                ConcurrentHashMap concurrentHashMap = this.b;
                if (concurrentHashMap.containsKey(str) && !((Boolean) concurrentHashMap.get(str)).booleanValue()) {
                    throw new GeneralSecurityException("New keys are already disallowed for key type ".concat(str));
                }
            }
            ConcurrentHashMap concurrentHashMap2 = this.a;
            xkg xkgVar2 = (xkg) concurrentHashMap2.get(str);
            if (xkgVar2 != null && !xkgVar2.getClass().equals(xkgVar.getClass())) {
                c.logp(Level.WARNING, "com.google.crypto.tink.internal.KeyManagerRegistry", "insertKeyManager", "Attempted overwrite of a registered key manager for key type ".concat(str));
                throw new GeneralSecurityException("typeUrl (" + str + ") is already registered with " + xkgVar2.getClass().getName() + ", cannot be re-registered with " + xkgVar.getClass().getName());
            }
            concurrentHashMap2.putIfAbsent(str, xkgVar);
            this.b.put(str, Boolean.valueOf(z));
        } catch (Throwable th) {
            throw th;
        }
    }
}
