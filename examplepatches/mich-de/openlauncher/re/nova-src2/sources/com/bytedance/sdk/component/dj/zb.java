package com.bytedance.sdk.component.dj;

import android.util.Log;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.instabridge.ai.auth.AndroidKeystoreSecretCipher;
import java.security.SecureRandom;
import java.util.Random;
import javax.crypto.Cipher;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes2.dex */
public class zb {
    private static final Random ycx = new SecureRandom();

    public static byte[] ycx(byte[] bArr, byte[] bArr2) {
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr2, "AES");
        try {
            Cipher cipher = Cipher.getInstance(AndroidKeystoreSecretCipher.TRANSFORMATION);
            byte[] bArr3 = new byte[12];
            System.arraycopy(bArr, 0, bArr3, 0, 12);
            cipher.init(2, secretKeySpec, new GCMParameterSpec(128, bArr3));
            return cipher.doFinal(bArr, 12, bArr.length - 12);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4kfozpC/jk=", "essesiCR", "X+suhxqsfeWZa/JuqzKN", 27);
            Log.e("AESGCM", "decryptByAESGCM: ", th2);
            return null;
        }
    }

    public static byte[] zb(byte[] bArr, byte[] bArr2) {
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr2, "AES");
        try {
            Cipher cipher = Cipher.getInstance(AndroidKeystoreSecretCipher.TRANSFORMATION);
            byte[] bArr3 = new byte[12];
            ycx.nextBytes(bArr3);
            cipher.init(1, secretKeySpec, new GCMParameterSpec(128, bArr3));
            byte[] bArrDoFinal = cipher.doFinal(bArr);
            byte[] bArr4 = new byte[bArrDoFinal.length + 12];
            System.arraycopy(bArr3, 0, bArr4, 0, 12);
            System.arraycopy(bArrDoFinal, 0, bArr4, 12, bArrDoFinal.length);
            return bArr4;
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4kfozpC/jk=", "essesiCR", "XuAuhxqsfeWZa/JuqzKN", 45);
            Log.e("AESGCM", "encryptByAESGCM: ", th2);
            return null;
        }
    }
}
