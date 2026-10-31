package gl;

import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import javax.crypto.Cipher;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes3.dex */
public final class e implements el.a {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f57719a = sl.d.c("7a806c");

    /* renamed from: b, reason: collision with root package name */
    public static final byte[] f57720b = sl.d.c("46bb91c3c5");

    /* renamed from: c, reason: collision with root package name */
    public static final byte[] f57721c = sl.d.c("36864200e0eaf5284d884a0e77d31646");

    /* renamed from: d, reason: collision with root package name */
    public static final byte[] f57722d = sl.d.c("bae8e37fc83441b16034566b");

    /* renamed from: e, reason: collision with root package name */
    public static final byte[] f57723e = sl.d.c("af60eb711bd85bc1e4d3e0a462e074eea428a8");

    public static boolean a(Cipher cipher) throws InvalidKeyException, InvalidAlgorithmParameterException {
        try {
            byte[] bArr = f57722d;
            cipher.init(2, new SecretKeySpec(f57721c, "AES"), new GCMParameterSpec(128, bArr, 0, bArr.length));
            cipher.updateAAD(f57720b);
            byte[] bArr2 = f57723e;
            return MessageDigest.isEqual(cipher.doFinal(bArr2, 0, bArr2.length), f57719a);
        } catch (GeneralSecurityException unused) {
            return false;
        }
    }
}
