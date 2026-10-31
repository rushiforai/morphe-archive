package com.bytedance.sdk.component.dj;

import android.text.TextUtils;
import android.util.Base64;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.vungle.ads.internal.protos.Sdk;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes2.dex */
public class ycx {
    private static String ycx;

    public static String ycx(String str, String str2) {
        try {
            SecretKeySpec secretKeySpec = new SecretKeySpec(str2.getBytes(), "AES");
            if (TextUtils.isEmpty(ycx)) {
                ycx = ycx("AES/CBC/PKCS5Padding");
            }
            Cipher cipher = Cipher.getInstance(ycx);
            cipher.init(1, secretKeySpec);
            return Base64.encodeToString(cipher.doFinal(str.getBytes("utf-8")), 0);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4kfozpC/jk=", "esse", "XuAuhxqsfQ==", 39);
            th2.getMessage();
            return null;
        }
    }

    public static String zb(String str, String str2, String str3) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            byte[] bArrDecode = Base64.decode(str, 0);
            SecretKeySpec secretKeySpec = new SecretKeySpec(str3.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(2, secretKeySpec, new IvParameterSpec(str2.getBytes()));
            return new String(cipher.doFinal(bArrDecode));
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4kfozpC/jk=", "esse", "X+suhxqsffCJXt9+rjI=", 88);
            th2.getMessage();
            return null;
        }
    }

    public static String ycx(String str, String str2, String str3) {
        SecretKeySpec secretKeySpec = new SecretKeySpec(str3.getBytes(), "AES");
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(1, secretKeySpec, new IvParameterSpec(str2.getBytes()));
            return Base64.encodeToString(cipher.doFinal(str.getBytes("utf-8")), 0);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4kfozpC/jk=", "esse", "XuAuhxqsffCJXt9+rjI=", 60);
            th2.getMessage();
            return null;
        }
    }

    public static String zb(String str, String str2) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            byte[] bArrDecode = Base64.decode(str, 0);
            SecretKeySpec secretKeySpec = new SecretKeySpec(str2.getBytes(), "AES");
            if (TextUtils.isEmpty(ycx)) {
                ycx = ycx("AES/CBC/PKCS5Padding");
            }
            Cipher cipher = Cipher.getInstance(ycx);
            cipher.init(2, secretKeySpec);
            return new String(cipher.doFinal(bArrDecode));
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4kfozpC/jk=", "esse", "X+suhxqsfQ==", Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE);
            return null;
        }
    }

    public static String ycx(String str) {
        int[] iArr = new int[str.length()];
        iArr[4] = 6;
        iArr[5] = 1;
        iArr[6] = 1;
        return new String(ycx(str.getBytes(), iArr));
    }

    public static byte[] ycx(byte[] bArr, int[] iArr) {
        if (bArr == null || bArr.length == 0 || iArr == null || iArr.length == 0) {
            return bArr;
        }
        byte[] bArr2 = new byte[bArr.length];
        for (int i5 = 0; i5 < bArr.length; i5++) {
            bArr2[i5] = (byte) (bArr[i5] ^ iArr[i5 % iArr.length]);
        }
        return bArr2;
    }
}
