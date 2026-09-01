package defpackage;

import java.security.GeneralSecurityException;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zgg {
    public static final zgg b;
    public final HashMap a = new HashMap();

    static {
        z0g z0gVar = new z0g(12);
        zgg zggVar = new zgg();
        try {
            zggVar.a(z0gVar, qgg.class);
            b = zggVar;
        } catch (GeneralSecurityException e) {
            throw new IllegalStateException("unexpected error.", e);
        }
    }

    public final synchronized void a(z0g z0gVar, Class cls) {
        try {
            z0g z0gVar2 = (z0g) this.a.get(cls);
            if (z0gVar2 != null && !z0gVar2.equals(z0gVar)) {
                throw new GeneralSecurityException("Different key creator for parameters class " + String.valueOf(cls) + " already inserted");
            }
            this.a.put(cls, z0gVar);
        } catch (Throwable th) {
            throw th;
        }
    }

    public final synchronized gr7 b(bzf bzfVar, Integer num) {
        z0g z0gVar;
        z0gVar = (z0g) this.a.get(bzfVar.getClass());
        if (z0gVar == null) {
            throw new GeneralSecurityException("Cannot create a new key for parameters " + String.valueOf(bzfVar) + ": no key creator for this class was registered.");
        }
        return z0gVar.a(bzfVar, num);
    }
}
