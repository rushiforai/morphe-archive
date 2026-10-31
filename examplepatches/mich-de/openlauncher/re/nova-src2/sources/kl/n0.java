package kl;

import java.security.GeneralSecurityException;
import java.util.HashMap;

/* loaded from: classes.dex */
public final class n0 {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f71618a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f71619b;

    public n0(ab.c0 c0Var) {
        this.f71618a = new HashMap((HashMap) c0Var.f691b);
        this.f71619b = new HashMap((HashMap) c0Var.f692c);
    }

    public final Object a(bh.g gVar, Class cls) throws GeneralSecurityException {
        m0 m0Var = new m0(gVar.getClass(), cls);
        HashMap map = this.f71618a;
        if (map.containsKey(m0Var)) {
            return ((k0) map.get(m0Var)).f71611c.e(gVar);
        }
        throw new GeneralSecurityException("No PrimitiveConstructor for " + m0Var + " available, see https://developers.google.com/tink/faq/registration_errors");
    }
}
