package kl;

import java.security.GeneralSecurityException;
import java.util.HashMap;

/* loaded from: classes.dex */
public final class v {

    /* renamed from: b, reason: collision with root package name */
    public static final v f71642b;

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f71643a = new HashMap();

    static {
        fl.h hVar = new fl.h();
        v vVar = new v();
        try {
            vVar.a(hVar, t.class);
            f71642b = vVar;
        } catch (GeneralSecurityException e3) {
            throw new IllegalStateException("unexpected error.", e3);
        }
    }

    public final synchronized void a(fl.h hVar, Class cls) {
        try {
            fl.h hVar2 = (fl.h) this.f71643a.get(cls);
            if (hVar2 != null && !hVar2.equals(hVar)) {
                throw new GeneralSecurityException("Different key creator for parameters class " + cls + " already inserted");
            }
            this.f71643a.put(cls, hVar);
        } catch (Throwable th2) {
            throw th2;
        }
    }
}
