package com.tiktok.util;

import android.text.TextUtils;
import android.util.Base64;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.TikTokBusinessSdk;
import com.tiktok.appevents.TTCrashHandler;
import java.security.MessageDigest;
import java.util.regex.Pattern;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes4.dex */
public class DecryptUtil {
    private static final String TAG = "DecryptUtil";

    public static String encryptWithHmac(String str) {
        try {
            SecretKeySpec secretKeySpec = new SecretKeySpec(TikTokBusinessSdk.getAccessToken().getBytes(), "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(secretKeySpec);
            return Base64.encodeToString(mac.doFinal(str.getBytes()), 2);
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    public static boolean isSHA256(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        try {
            return Pattern.compile("[A-Fa-f0-9]{64}").matcher(str).matches();
        } catch (Throwable unused) {
            return false;
        }
    }

    public static String toSha256(String str) {
        if (str == null) {
            return null;
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.update(str.getBytes());
            StringBuilder sb2 = new StringBuilder();
            for (byte b11 : messageDigest.digest()) {
                sb2.append(Integer.toString((b11 & 255) + 256, 16).substring(1));
            }
            return sb2.toString();
        } catch (Throwable th2) {
            TTCrashHandler.handleCrash(TAG, th2, 2);
            return null;
        }
    }
}
