package gl;

import fl.p;
import fl.r;
import java.security.GeneralSecurityException;
import kl.d0;
import kl.f0;
import kl.w0;
import pl.b2;

/* loaded from: classes.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final f0 f57715a;

    /* renamed from: b, reason: collision with root package name */
    public static final d0 f57716b;

    /* renamed from: c, reason: collision with root package name */
    public static final kl.n f57717c;

    /* renamed from: d, reason: collision with root package name */
    public static final kl.l f57718d;

    static {
        tl.a aVarC = w0.c("type.googleapis.com/google.crypto.tink.AesGcmKey");
        f57715a = new f0(r.class, new fl.d0(18));
        f57716b = new d0(aVarC, new fl.d0(19));
        f57717c = new kl.n(p.class, new fl.d0(20));
        f57718d = new kl.l(aVarC, new fl.d0(21));
    }

    public static b2 a(fl.j jVar) {
        if (fl.j.n.equals(jVar)) {
            return b2.TINK;
        }
        if (fl.j.o.equals(jVar)) {
            return b2.CRUNCHY;
        }
        if (fl.j.f55347p.equals(jVar)) {
            return b2.RAW;
        }
        throw new GeneralSecurityException("Unable to serialize variant: " + jVar);
    }

    public static fl.j b(b2 b2Var) throws GeneralSecurityException {
        int iOrdinal = b2Var.ordinal();
        if (iOrdinal == 1) {
            return fl.j.n;
        }
        if (iOrdinal != 2) {
            if (iOrdinal == 3) {
                return fl.j.f55347p;
            }
            if (iOrdinal != 4) {
                throw new GeneralSecurityException("Unable to parse OutputPrefixType: " + b2Var.getNumber());
            }
        }
        return fl.j.o;
    }

    public static void c(r rVar) {
        int i5 = rVar.f55410c;
        int i11 = rVar.f55409b;
        if (i5 != 16) {
            throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d. Currently Tink only supports serialization of AES GCM keys with tag size equal to 16 bytes.", Integer.valueOf(rVar.f55410c)));
        }
        if (i11 != 12) {
            throw new GeneralSecurityException(String.format("Invalid IV size in bytes %d. Currently Tink only supports serialization of AES GCM keys with IV size equal to 12 bytes.", Integer.valueOf(i11)));
        }
    }
}
