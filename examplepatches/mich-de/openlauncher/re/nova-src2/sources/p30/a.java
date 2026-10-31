package p30;

import com.teslacoilsw.licensing_misc.ValidationException;
import com.teslacoilsw.licensing_misc.util.Base64DecoderException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final String f82066b = "UTF-8";

    /* renamed from: c, reason: collision with root package name */
    public static final String f82067c = "AES";

    /* renamed from: d, reason: collision with root package name */
    public static final String f82068d = "PBEWithMD5And128BitAES-CBC-OpenSSL";

    /* renamed from: e, reason: collision with root package name */
    public static final String f82069e = "AES/CBC/PKCS5Padding";

    /* renamed from: f, reason: collision with root package name */
    public static final byte[] f82070f = {74, -39, 32, -18, -94, -86, -15, -70, 38, 21, -41, -43, -100, 63, 71, -76};

    /* renamed from: g, reason: collision with root package name */
    public static final String f82071g = "com.teslacoilsw.widgetlocker.WidgetLockerAA";

    /* renamed from: a, reason: collision with root package name */
    public final SecretKeySpec f82072a;

    public a(String str, String str2, byte[] bArr) throws NoSuchAlgorithmException {
        try {
            this.f82072a = new SecretKeySpec(SecretKeyFactory.getInstance(f82068d).generateSecret(new PBEKeySpec((str + str2).toCharArray(), bArr, 1024, 256)).getEncoded(), f82067c);
        } catch (GeneralSecurityException e3) {
            throw new RuntimeException(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, e3);
        }
    }

    public final String a(String str) throws NoSuchPaddingException, ValidationException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        try {
            Cipher cipher = Cipher.getInstance(f82069e);
            cipher.init(2, this.f82072a, new IvParameterSpec(f82070f));
            String str2 = new String(cipher.doFinal(q30.a.a(str)), f82066b);
            String str3 = f82071g;
            if (str2.indexOf(str3) == 0) {
                return str2.substring(str3.length(), str2.length());
            }
            throw new ValidationException(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        } catch (Base64DecoderException unused) {
            throw new ValidationException(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        } catch (UnsupportedEncodingException e3) {
            throw new RuntimeException(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, e3);
        } catch (RuntimeException unused2) {
            throw new ValidationException(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        } catch (GeneralSecurityException unused3) {
            throw new ValidationException(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
    }
}
