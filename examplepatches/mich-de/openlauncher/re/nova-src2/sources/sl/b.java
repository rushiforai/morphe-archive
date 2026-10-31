package sl;

import b.a3;
import h6.c1;
import java.security.GeneralSecurityException;
import javax.crypto.spec.SecretKeySpec;
import t5.d0;

/* loaded from: classes3.dex */
public final class b implements el.a {
    static {
        new a3(14);
    }

    public static b a(fl.m mVar) throws GeneralSecurityException {
        if (!c1.b(1)) {
            throw new GeneralSecurityException("Can not use AES-EAX in FIPS-mode.");
        }
        fl.o oVar = mVar.f55379c;
        if (oVar.f55396c != 16) {
            throw new GeneralSecurityException("AesEaxJce only supports 16 byte tag size, not " + oVar.f55396c);
        }
        byte[] bArrB = ((tl.a) mVar.f55380d.f88562b).b();
        int i5 = oVar.f55395b;
        mVar.f55381e.b();
        b bVar = new b();
        if (!c1.b(1)) {
            throw new GeneralSecurityException("Can not use AES-EAX in FIPS-mode.");
        }
        if (i5 != 12 && i5 != 16) {
            throw new IllegalArgumentException("IV size should be either 12 or 16 bytes");
        }
        s.a(bArrB.length);
        new SecretKeySpec(bArrB, "AES");
        d.b(nl.a.o0(nl.b.b(bArrB.length), new d0(tl.a.a(bArrB), 2)));
        return bVar;
    }
}
