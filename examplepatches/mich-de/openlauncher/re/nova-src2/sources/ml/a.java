package ml;

import java.security.GeneralSecurityException;
import kl.d0;
import kl.f0;
import kl.l;
import kl.n;
import kl.w0;
import ll.c;
import ll.d;
import ll.i;
import pl.b2;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final f0 f76494a;

    /* renamed from: b, reason: collision with root package name */
    public static final d0 f76495b;

    /* renamed from: c, reason: collision with root package name */
    public static final n f76496c;

    /* renamed from: d, reason: collision with root package name */
    public static final l f76497d;

    static {
        tl.a aVarC = w0.c("type.googleapis.com/google.crypto.tink.AesCmacKey");
        f76494a = new f0(d.class, new i(3));
        f76495b = new d0(aVarC, new i(4));
        f76496c = new n(ll.a.class, new i(5));
        f76497d = new l(aVarC, new i(6));
    }

    public static b2 a(c cVar) {
        if (c.f74993b.equals(cVar)) {
            return b2.TINK;
        }
        if (c.f74994c.equals(cVar)) {
            return b2.CRUNCHY;
        }
        if (c.f74996e.equals(cVar)) {
            return b2.RAW;
        }
        if (c.f74995d.equals(cVar)) {
            return b2.LEGACY;
        }
        throw new GeneralSecurityException("Unable to serialize variant: " + cVar);
    }

    public static c b(b2 b2Var) throws GeneralSecurityException {
        int iOrdinal = b2Var.ordinal();
        if (iOrdinal == 1) {
            return c.f74993b;
        }
        if (iOrdinal == 2) {
            return c.f74995d;
        }
        if (iOrdinal == 3) {
            return c.f74996e;
        }
        if (iOrdinal == 4) {
            return c.f74994c;
        }
        throw new GeneralSecurityException("Unable to parse OutputPrefixType: " + b2Var.getNumber());
    }
}
