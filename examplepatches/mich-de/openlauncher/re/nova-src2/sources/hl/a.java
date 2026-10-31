package hl;

import b.a3;
import fl.s;
import gl.e;
import java.security.GeneralSecurityException;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes3.dex */
public abstract class a implements el.a {

    /* renamed from: a, reason: collision with root package name */
    public static final a3 f59888a = new a3(8);

    public static e a(s sVar) throws GeneralSecurityException {
        byte[] bArr = e.f57719a;
        try {
            Cipher cipher = (Cipher) f59888a.get();
            if (cipher == null) {
                throw new GeneralSecurityException("AES GCM SIV cipher is invalid.");
            }
            if (!e.a(cipher)) {
                throw new IllegalStateException("Cipher does not implement AES GCM SIV.");
            }
            byte[] bArrB = ((tl.a) sVar.f55413d.f88562b).b();
            sVar.f55414e.b();
            e eVar = new e();
            sl.s.a(bArrB.length);
            new SecretKeySpec(bArrB, "AES");
            return eVar;
        } catch (IllegalStateException e3) {
            throw new GeneralSecurityException("AES GCM SIV cipher is not available or is invalid.", e3);
        }
    }
}
