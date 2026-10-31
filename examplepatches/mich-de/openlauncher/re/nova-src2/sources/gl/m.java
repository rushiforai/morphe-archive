package gl;

import fl.j0;
import fl.l0;
import java.security.GeneralSecurityException;
import kl.d0;
import kl.f0;
import kl.w0;
import pl.b2;

/* loaded from: classes.dex */
public abstract class m {

    /* renamed from: a, reason: collision with root package name */
    public static final f0 f57739a;

    /* renamed from: b, reason: collision with root package name */
    public static final d0 f57740b;

    /* renamed from: c, reason: collision with root package name */
    public static final kl.n f57741c;

    /* renamed from: d, reason: collision with root package name */
    public static final kl.l f57742d;

    static {
        tl.a aVarC = w0.c("type.googleapis.com/google.crypto.tink.XAesGcmKey");
        f57739a = new f0(l0.class, new l(0));
        f57740b = new d0(aVarC, new l(1));
        f57741c = new kl.n(j0.class, new l(2));
        f57742d = new kl.l(aVarC, new l(3));
    }

    public static b2 a(fl.j jVar) {
        if (jVar.equals(fl.j.f55354w)) {
            return b2.TINK;
        }
        if (jVar.equals(fl.j.f55355x)) {
            return b2.RAW;
        }
        throw new GeneralSecurityException("Unable to serialize variant: " + jVar);
    }

    public static fl.j b(b2 b2Var) {
        int iOrdinal = b2Var.ordinal();
        if (iOrdinal == 1) {
            return fl.j.f55354w;
        }
        if (iOrdinal == 3) {
            return fl.j.f55355x;
        }
        throw new GeneralSecurityException("Unable to parse OutputPrefixType: " + b2Var.getNumber());
    }
}
