package ads_mobile_sdk;

import b.k9;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes2.dex */
public final class z93 {

    /* renamed from: a, reason: collision with root package name */
    public static final Charset f12491a = StandardCharsets.UTF_8;

    /* renamed from: b, reason: collision with root package name */
    public static Cipher f12492b = null;

    /* renamed from: c, reason: collision with root package name */
    public static final Object f12493c = new Object();

    /* renamed from: d, reason: collision with root package name */
    public static final Object f12494d = new Object();

    public static byte[] a(String str, byte[] bArr) {
        byte[] bArrDoFinal;
        if (bArr.length != 16) {
            throw new y93();
        }
        try {
            byte[] bArrH = k9.H(str, false);
            if (bArrH.length <= 16) {
                throw new y93();
            }
            ByteBuffer byteBufferAllocate = ByteBuffer.allocate(bArrH.length);
            byteBufferAllocate.put(bArrH);
            byteBufferAllocate.flip();
            byte[] bArr2 = new byte[16];
            byte[] bArr3 = new byte[bArrH.length - 16];
            byteBufferAllocate.get(bArr2);
            byteBufferAllocate.get(bArr3);
            SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, "AES");
            synchronized (f12493c) {
                a().init(2, secretKeySpec, new IvParameterSpec(bArr2));
                bArrDoFinal = a().doFinal(bArr3);
            }
            return bArrDoFinal;
        } catch (IllegalArgumentException | InvalidAlgorithmParameterException | InvalidKeyException | NoSuchAlgorithmException | BadPaddingException | IllegalBlockSizeException | NoSuchPaddingException e3) {
            throw new y93(e3);
        }
    }

    public static String b(String str, byte[] bArr) {
        return new String(a(str, bArr), f12491a);
    }

    public static Cipher a() {
        Cipher cipher;
        synchronized (f12494d) {
            try {
                if (f12492b == null) {
                    f12492b = Cipher.getInstance("AES/CBC/PKCS5Padding");
                }
                cipher = f12492b;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return cipher;
    }
}
