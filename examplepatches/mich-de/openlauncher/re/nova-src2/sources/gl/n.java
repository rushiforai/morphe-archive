package gl;

import fl.m0;
import fl.o0;
import java.security.GeneralSecurityException;
import kl.d0;
import kl.f0;
import kl.w0;
import pl.b2;

/* loaded from: classes.dex */
public abstract class n {

    /* renamed from: a, reason: collision with root package name */
    public static final f0 f57743a;

    /* renamed from: b, reason: collision with root package name */
    public static final d0 f57744b;

    /* renamed from: c, reason: collision with root package name */
    public static final kl.n f57745c;

    /* renamed from: d, reason: collision with root package name */
    public static final kl.l f57746d;

    static {
        tl.a aVarC = w0.c("type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key");
        f57743a = new f0(o0.class, new l(4));
        f57744b = new d0(aVarC, new l(5));
        f57745c = new kl.n(m0.class, new l(6));
        f57746d = new kl.l(aVarC, new l(7));
    }

    public static b2 a(fl.j jVar) {
        if (fl.j.f55356y.equals(jVar)) {
            return b2.TINK;
        }
        if (fl.j.f55357z.equals(jVar)) {
            return b2.CRUNCHY;
        }
        if (fl.j.A.equals(jVar)) {
            return b2.RAW;
        }
        throw new GeneralSecurityException("Unable to serialize variant: " + jVar);
    }

    public static fl.j b(b2 b2Var) throws GeneralSecurityException {
        int iOrdinal = b2Var.ordinal();
        if (iOrdinal == 1) {
            return fl.j.f55356y;
        }
        if (iOrdinal != 2) {
            if (iOrdinal == 3) {
                return fl.j.A;
            }
            if (iOrdinal != 4) {
                throw new GeneralSecurityException("Unable to parse OutputPrefixType: " + b2Var.getNumber());
            }
        }
        return fl.j.f55357z;
    }
}
