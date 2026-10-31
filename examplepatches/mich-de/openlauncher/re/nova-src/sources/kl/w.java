package kl;

import java.security.GeneralSecurityException;
import java.util.HashMap;

/* loaded from: classes.dex */
public final class w {

    /* renamed from: b, reason: collision with root package name */
    public static final w f71648b = new w();

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f71649a = new HashMap();

    public final synchronized void a(fl.g gVar, Class cls) {
        try {
            fl.g gVar2 = (fl.g) this.f71649a.get(cls);
            if (gVar2 != null && !gVar2.equals(gVar)) {
                throw new GeneralSecurityException("Different key creator for parameters class already inserted");
            }
            this.f71649a.put(cls, gVar);
        } catch (Throwable th2) {
            throw th2;
        }
    }
}
