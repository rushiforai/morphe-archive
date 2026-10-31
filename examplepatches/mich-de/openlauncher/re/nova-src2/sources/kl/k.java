package kl;

import h6.c1;
import java.security.GeneralSecurityException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Logger;

/* loaded from: classes.dex */
public final class k {

    /* renamed from: c, reason: collision with root package name */
    public static final Logger f71605c = Logger.getLogger(k.class.getName());

    /* renamed from: d, reason: collision with root package name */
    public static final k f71606d;

    /* renamed from: a, reason: collision with root package name */
    public ConcurrentHashMap f71607a;

    /* renamed from: b, reason: collision with root package name */
    public ConcurrentHashMap f71608b;

    static {
        k kVar = new k();
        kVar.f71607a = new ConcurrentHashMap();
        kVar.f71608b = new ConcurrentHashMap();
        f71606d = kVar;
    }

    public final q a(Class cls, String str) throws GeneralSecurityException {
        q qVar;
        synchronized (this) {
            if (!this.f71607a.containsKey(str)) {
                throw new GeneralSecurityException("No key manager found for key type " + str + ", see https://developers.google.com/tink/faq/registration_errors");
            }
            qVar = (q) this.f71607a.get(str);
        }
        if (qVar.f71627b.equals(cls)) {
            return qVar;
        }
        throw new GeneralSecurityException("Primitive type " + cls.getName() + " not supported by key manager of type " + qVar.getClass() + ", which only supports: " + qVar.f71627b);
    }

    public final synchronized void b(q qVar, boolean z11) {
        try {
            String str = qVar.f71626a;
            if (z11 && this.f71608b.containsKey(str) && !((Boolean) this.f71608b.get(str)).booleanValue()) {
                throw new GeneralSecurityException("New keys are already disallowed for key type ".concat(str));
            }
            q qVar2 = (q) this.f71607a.get(str);
            if (qVar2 != null && !qVar2.getClass().equals(qVar.getClass())) {
                f71605c.warning("Attempted overwrite of a registered key manager for key type ".concat(str));
                throw new GeneralSecurityException("typeUrl (" + str + ") is already registered with " + qVar2.getClass().getName() + ", cannot be re-registered with " + qVar.getClass().getName());
            }
            this.f71607a.putIfAbsent(str, qVar);
            this.f71608b.put(str, Boolean.valueOf(z11));
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void c(q qVar, boolean z11) {
        d(qVar, 1, z11);
    }

    public final synchronized void d(q qVar, int i5, boolean z11) {
        if (!c1.a(i5)) {
            throw new GeneralSecurityException("Cannot register key manager: FIPS compatibility insufficient");
        }
        b(qVar, z11);
    }
}
