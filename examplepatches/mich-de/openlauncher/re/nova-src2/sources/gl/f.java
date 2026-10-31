package gl;

import fl.s;
import fl.u;
import java.security.GeneralSecurityException;
import kl.d0;
import kl.f0;
import kl.w0;
import pl.b2;

/* loaded from: classes.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public static final f0 f57724a;

    /* renamed from: b, reason: collision with root package name */
    public static final d0 f57725b;

    /* renamed from: c, reason: collision with root package name */
    public static final kl.n f57726c;

    /* renamed from: d, reason: collision with root package name */
    public static final kl.l f57727d;

    static {
        tl.a aVarC = w0.c("type.googleapis.com/google.crypto.tink.AesGcmSivKey");
        f57724a = new f0(u.class, new fl.d0(22));
        f57725b = new d0(aVarC, new fl.d0(23));
        f57726c = new kl.n(s.class, new fl.d0(24));
        f57727d = new kl.l(aVarC, new fl.d0(25));
    }

    public static b2 a(fl.j jVar) {
        if (fl.j.f55348q.equals(jVar)) {
            return b2.TINK;
        }
        if (fl.j.f55349r.equals(jVar)) {
            return b2.CRUNCHY;
        }
        if (fl.j.f55350s.equals(jVar)) {
            return b2.RAW;
        }
        throw new GeneralSecurityException("Unable to serialize variant: " + jVar);
    }

    public static fl.j b(b2 b2Var) throws GeneralSecurityException {
        int iOrdinal = b2Var.ordinal();
        if (iOrdinal == 1) {
            return fl.j.f55348q;
        }
        if (iOrdinal != 2) {
            if (iOrdinal == 3) {
                return fl.j.f55350s;
            }
            if (iOrdinal != 4) {
                throw new GeneralSecurityException("Unable to parse OutputPrefixType: " + b2Var.getNumber());
            }
        }
        return fl.j.f55349r;
    }
}
