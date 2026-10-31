package gl;

import fl.o;
import java.security.GeneralSecurityException;
import kl.d0;
import kl.f0;
import kl.w0;
import pl.b2;
import pl.u;
import pl.v;

/* loaded from: classes.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final f0 f57710a;

    /* renamed from: b, reason: collision with root package name */
    public static final d0 f57711b;

    /* renamed from: c, reason: collision with root package name */
    public static final kl.n f57712c;

    /* renamed from: d, reason: collision with root package name */
    public static final kl.l f57713d;

    static {
        tl.a aVarC = w0.c("type.googleapis.com/google.crypto.tink.AesEaxKey");
        f57710a = new f0(o.class, new fl.d0(14));
        f57711b = new d0(aVarC, new fl.d0(15));
        f57712c = new kl.n(fl.m.class, new fl.d0(16));
        f57713d = new kl.l(aVarC, new fl.d0(17));
    }

    public static v a(o oVar) throws GeneralSecurityException {
        if (oVar.f55396c != 16) {
            throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d. Currently Tink only supports aes eax keys with tag size equal to 16 bytes.", Integer.valueOf(oVar.f55396c)));
        }
        u uVarY = v.y();
        uVarY.f(oVar.f55395b);
        return (v) uVarY.a();
    }

    public static b2 b(fl.j jVar) {
        if (fl.j.f55344k.equals(jVar)) {
            return b2.TINK;
        }
        if (fl.j.f55345l.equals(jVar)) {
            return b2.CRUNCHY;
        }
        if (fl.j.f55346m.equals(jVar)) {
            return b2.RAW;
        }
        throw new GeneralSecurityException("Unable to serialize variant: " + jVar);
    }

    public static fl.j c(b2 b2Var) throws GeneralSecurityException {
        int iOrdinal = b2Var.ordinal();
        if (iOrdinal == 1) {
            return fl.j.f55344k;
        }
        if (iOrdinal != 2) {
            if (iOrdinal == 3) {
                return fl.j.f55346m;
            }
            if (iOrdinal != 4) {
                throw new GeneralSecurityException("Unable to parse OutputPrefixType: " + b2Var.getNumber());
            }
        }
        return fl.j.f55345l;
    }
}
