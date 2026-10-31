package gl;

import fl.v;
import fl.x;
import java.security.GeneralSecurityException;
import kl.d0;
import kl.f0;
import kl.w0;
import pl.b2;

/* loaded from: classes.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final f0 f57731a;

    /* renamed from: b, reason: collision with root package name */
    public static final d0 f57732b;

    /* renamed from: c, reason: collision with root package name */
    public static final kl.n f57733c;

    /* renamed from: d, reason: collision with root package name */
    public static final kl.l f57734d;

    static {
        tl.a aVarC = w0.c("type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key");
        f57731a = new f0(x.class, new fl.d0(26));
        f57732b = new d0(aVarC, new fl.d0(27));
        f57733c = new kl.n(v.class, new fl.d0(28));
        f57734d = new kl.l(aVarC, new fl.d0(29));
    }

    public static b2 a(fl.j jVar) {
        if (fl.j.f55351t.equals(jVar)) {
            return b2.TINK;
        }
        if (fl.j.f55352u.equals(jVar)) {
            return b2.CRUNCHY;
        }
        if (fl.j.f55353v.equals(jVar)) {
            return b2.RAW;
        }
        throw new GeneralSecurityException("Unable to serialize variant: " + jVar);
    }

    public static fl.j b(b2 b2Var) throws GeneralSecurityException {
        int iOrdinal = b2Var.ordinal();
        if (iOrdinal == 1) {
            return fl.j.f55351t;
        }
        if (iOrdinal != 2) {
            if (iOrdinal == 3) {
                return fl.j.f55353v;
            }
            if (iOrdinal != 4) {
                throw new GeneralSecurityException("Unable to parse OutputPrefixType: " + b2Var.getNumber());
            }
        }
        return fl.j.f55352u;
    }
}
