package sl;

import androidx.compose.ui.node.LayoutNode;
import h6.c1;
import java.nio.ByteBuffer;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.security.spec.ECParameterSpec;
import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import t5.d0;

/* loaded from: classes3.dex */
public abstract class d implements nl.c {

    /* renamed from: a, reason: collision with root package name */
    public static final int[] f87498a = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -2, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};

    public static byte[] a(byte[]... bArr) throws GeneralSecurityException {
        int length = 0;
        for (byte[] bArr2 : bArr) {
            if (length > LayoutNode.NotPlacedPlaceOrder - bArr2.length) {
                throw new GeneralSecurityException("exceeded size limit");
            }
            length += bArr2.length;
        }
        byte[] bArr3 = new byte[length];
        int length2 = 0;
        for (byte[] bArr4 : bArr) {
            System.arraycopy(bArr4, 0, bArr3, length2, bArr4.length);
            length2 += bArr4.length;
        }
        return bArr3;
    }

    public static nl.c b(nl.a aVar) throws GeneralSecurityException {
        d0 d0Var = aVar.f78358d;
        byte[] bArrB = ((tl.a) d0Var.f88562b).b();
        ol.a aVar2 = new ol.a();
        s.a(bArrB.length);
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArrB, "AES");
        if (!c1.b(1)) {
            throw new GeneralSecurityException("Can not use AES-CMAC in FIPS-mode.");
        }
        Cipher cipher = (Cipher) ol.a.f80499a.get();
        cipher.init(1, secretKeySpec);
        lb0.b.t(lb0.b.t(cipher.doFinal(new byte[16])));
        try {
            Provider providerN = kl.a.n();
            if (providerN == null) {
                throw new GeneralSecurityException("Conscrypt not available");
            }
            Mac.getInstance("AESCMAC", providerN);
            byte[] bArrB2 = ((tl.a) d0Var.f88562b).b();
            br.c cVar = new br.c();
            if (!c1.b(1)) {
                throw new GeneralSecurityException("Cannot use AES-CMAC in FIPS-mode, as BoringCrypto module is not available");
            }
            new SecretKeySpec(bArrB2, "AES");
            return new k(aVar2, cVar);
        } catch (GeneralSecurityException unused) {
            return aVar2;
        }
    }

    public static byte[] c(String str) {
        if (str.length() % 2 != 0) {
            throw new IllegalArgumentException("Expected a string of even length");
        }
        int length = str.length() / 2;
        byte[] bArr = new byte[length];
        for (int i5 = 0; i5 < length; i5++) {
            int i11 = i5 * 2;
            int iDigit = Character.digit(str.charAt(i11), 16);
            int iDigit2 = Character.digit(str.charAt(i11 + 1), 16);
            if (iDigit == -1 || iDigit2 == -1) {
                throw new IllegalArgumentException("input is not hexadecimal");
            }
            bArr[i5] = (byte) ((iDigit * 16) + iDigit2);
        }
        return bArr;
    }

    public static String d(byte[] bArr) {
        StringBuilder sb2 = new StringBuilder(bArr.length * 2);
        for (byte b11 : bArr) {
            int i5 = b11 & 255;
            sb2.append("0123456789abcdef".charAt(i5 / 16));
            sb2.append("0123456789abcdef".charAt(i5 % 16));
        }
        return sb2.toString();
    }

    public static ECParameterSpec e(g gVar) throws NoSuchAlgorithmException {
        int iOrdinal = gVar.ordinal();
        if (iOrdinal == 0) {
            return kl.f.f71587a;
        }
        if (iOrdinal == 1) {
            return kl.f.f71588b;
        }
        if (iOrdinal == 2) {
            return kl.f.f71589c;
        }
        throw new NoSuchAlgorithmException("curve not implemented:" + gVar);
    }

    public static String f(l lVar) throws GeneralSecurityException {
        int iOrdinal = lVar.ordinal();
        if (iOrdinal == 0) {
            return "SHA-1";
        }
        if (iOrdinal == 1) {
            return "SHA-224";
        }
        if (iOrdinal == 2) {
            return "SHA-256";
        }
        if (iOrdinal == 3) {
            return "SHA-384";
        }
        if (iOrdinal == 4) {
            return "SHA-512";
        }
        throw new GeneralSecurityException("Unsupported hash " + lVar);
    }

    public static byte[] g(byte[] bArr) {
        int length = 0;
        while (length < bArr.length && bArr[length] == 0) {
            length++;
        }
        if (length == bArr.length) {
            length = bArr.length - 1;
        }
        int i5 = (bArr[length] & 128) == 128 ? 1 : 0;
        byte[] bArr2 = new byte[(bArr.length - length) + i5];
        System.arraycopy(bArr, length, bArr2, i5, bArr.length - length);
        return bArr2;
    }

    public static final void h(ByteBuffer byteBuffer, ByteBuffer byteBuffer2, ByteBuffer byteBuffer3, int i5) {
        if (i5 < 0 || byteBuffer2.remaining() < i5 || byteBuffer3.remaining() < i5 || byteBuffer.remaining() < i5) {
            throw new IllegalArgumentException("That combination of buffers, offsets and length to xor result in out-of-bond accesses.");
        }
        for (int i11 = 0; i11 < i5; i11++) {
            byteBuffer.put((byte) (byteBuffer2.get() ^ byteBuffer3.get()));
        }
    }
}
