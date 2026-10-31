package gl;

import fl.v;
import h6.c1;
import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes3.dex */
public final class g implements el.a {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f57728a = sl.d.c("808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9f");

    /* renamed from: b, reason: collision with root package name */
    public static final byte[] f57729b = sl.d.c("070000004041424344454647");

    /* renamed from: c, reason: collision with root package name */
    public static final byte[] f57730c = sl.d.c("a0784d7a4716f3feb4f64e7f4b39bf04");

    public static g a(v vVar) throws GeneralSecurityException {
        Cipher cipherB = b();
        byte[] bArrB = ((tl.a) vVar.f55423d.f88562b).b();
        vVar.f55424e.b();
        cipherB.getProvider();
        g gVar = new g();
        if (!c1.b(1)) {
            throw new GeneralSecurityException("Can not use ChaCha20Poly1305 in FIPS-mode.");
        }
        if (bArrB.length != 32) {
            throw new InvalidKeyException("The key length in bytes must be 32.");
        }
        new SecretKeySpec(bArrB, "ChaCha20");
        return gVar;
    }

    public static Cipher b() {
        Cipher cipher = (Cipher) sl.j.f87509b.f87514a.a("ChaCha20-Poly1305");
        try {
            IvParameterSpec ivParameterSpec = new IvParameterSpec(f57729b);
            byte[] bArr = f57728a;
            cipher.init(2, new SecretKeySpec(bArr, "ChaCha20"), ivParameterSpec);
            byte[] bArr2 = f57730c;
            if (cipher.doFinal(bArr2).length == 0) {
                cipher.init(2, new SecretKeySpec(bArr, "ChaCha20"), ivParameterSpec);
                if (cipher.doFinal(bArr2).length == 0) {
                    return cipher;
                }
            }
        } catch (GeneralSecurityException unused) {
        }
        throw new GeneralSecurityException("JCE does not support algorithm: ChaCha20-Poly1305");
    }

    public static boolean c() {
        try {
            b();
            return true;
        } catch (GeneralSecurityException unused) {
            return false;
        }
    }
}
