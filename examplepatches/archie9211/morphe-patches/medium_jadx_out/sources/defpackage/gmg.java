package defpackage;

import com.google.android.recaptcha.internal.zzuf;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gmg {
    public static final gmg b;
    public final AtomicReference a = new AtomicReference(new wng(new ajg(1)));

    static {
        try {
            gmg gmgVar = new gmg();
            gmgVar.a(new skg(clg.class, rbg.b));
            b = gmgVar;
        } catch (Exception e) {
            throw new zzuf(e);
        }
    }

    public final synchronized void a(skg skgVar) {
        AtomicReference atomicReference = this.a;
        ajg ajgVar = new ajg((wng) atomicReference.get());
        ajgVar.e(skgVar);
        atomicReference.set(new wng(ajgVar));
    }

    public final synchronized void b(okg okgVar) {
        AtomicReference atomicReference = this.a;
        ajg ajgVar = new ajg((wng) atomicReference.get());
        ajgVar.f(okgVar);
        atomicReference.set(new wng(ajgVar));
    }

    public final synchronized void c(omg omgVar) {
        AtomicReference atomicReference = this.a;
        ajg ajgVar = new ajg((wng) atomicReference.get());
        ajgVar.g(omgVar);
        atomicReference.set(new wng(ajgVar));
    }

    public final synchronized void d(kmg kmgVar) {
        AtomicReference atomicReference = this.a;
        ajg ajgVar = new ajg((wng) atomicReference.get());
        ajgVar.h(kmgVar);
        atomicReference.set(new wng(ajgVar));
    }

    public final ur7 e(ing ingVar) throws GeneralSecurityException {
        wng wngVar = (wng) this.a.get();
        wngVar.getClass();
        tng tngVar = new tng(ing.class, (cmf) ingVar.b);
        HashMap map = wngVar.b;
        if (map.containsKey(tngVar)) {
            return ((okg) map.get(tngVar)).b.j(ingVar);
        }
        String string = tngVar.toString();
        throw new GeneralSecurityException(y30.s(new StringBuilder(string.length() + 47), "No Key Parser for requested key type ", string, " available"));
    }

    public final png f(ur7 ur7Var) throws GeneralSecurityException {
        wng wngVar = (wng) this.a.get();
        wngVar.getClass();
        vng vngVar = new vng(ur7Var.getClass(), ing.class);
        HashMap map = wngVar.a;
        if (map.containsKey(vngVar)) {
            return ((skg) map.get(vngVar)).b.d(ur7Var);
        }
        String string = vngVar.toString();
        throw new GeneralSecurityException(y30.s(new StringBuilder(string.length() + 32), "No Key serializer for ", string, " available"));
    }
}
