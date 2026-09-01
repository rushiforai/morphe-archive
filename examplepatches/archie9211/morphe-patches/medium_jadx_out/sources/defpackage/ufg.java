package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.security.GeneralSecurityException;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ufg {
    public static final Logger c = Logger.getLogger(ufg.class.getName());
    public static final ufg d;
    public ConcurrentHashMap a;
    public ConcurrentHashMap b;

    static {
        ufg ufgVar = new ufg();
        ufgVar.a = new ConcurrentHashMap();
        ufgVar.b = new ConcurrentHashMap();
        d = ufgVar;
    }

    public final synchronized void a(bgg bggVar, mag magVar, boolean z) {
        if (!magVar.zza()) {
            throw new GeneralSecurityException("Cannot register key manager: FIPS compatibility insufficient");
        }
        c(bggVar, z);
    }

    public final synchronized void b(bgg bggVar, boolean z) {
        a(bggVar, mag.zza, z);
    }

    public final synchronized void c(bgg bggVar, boolean z) {
        try {
            String str = bggVar.a;
            if (z && this.b.containsKey(str) && !((Boolean) this.b.get(str)).booleanValue()) {
                throw new GeneralSecurityException("New keys are already disallowed for key type ".concat(str));
            }
            bgg bggVar2 = (bgg) this.a.get(str);
            if (bggVar2 != null && !bggVar2.getClass().equals(bggVar.getClass())) {
                c.logp(Level.WARNING, "com.google.crypto.tink.internal.KeyManagerRegistry", "insertKeyManager", "Attempted overwrite of a registered key manager for key type ".concat(str));
                throw new GeneralSecurityException("typeUrl (" + str + ") is already registered with " + bggVar2.getClass().getName() + ", cannot be re-registered with " + bggVar.getClass().getName());
            }
            this.a.putIfAbsent(str, bggVar);
            this.b.put(str, Boolean.valueOf(z));
        } catch (Throwable th) {
            throw th;
        }
    }

    public final synchronized bgg d(String str) {
        if (!this.a.containsKey(str)) {
            throw new GeneralSecurityException("No key manager found for key type " + str + ", see https://developers.google.com/tink/faq/registration_errors");
        }
        return (bgg) this.a.get(str);
    }
}
