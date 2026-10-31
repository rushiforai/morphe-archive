package com.bytedance.sdk.component.utils;

import android.text.TextUtils;
import b.c0;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import java.security.SecureRandom;
import java.util.Random;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: com.bytedance.sdk.component.utils.ycx$ycx, reason: collision with other inner class name */
    public static class C0043ycx {
        static final Random ycx = ycx.sya();
    }

    public static String sya(String str) {
        if (TextUtils.isEmpty(str) || str.length() < 49) {
            return str;
        }
        String strYcx = ycx(str.substring(1, 33), 32);
        String strSubstring = str.substring(33, 49);
        return (strSubstring == null || strYcx == null) ? str : com.bytedance.sdk.component.dj.ycx.zb(str.substring(49), strSubstring, strYcx);
    }

    public static JSONObject ycx(JSONObject jSONObject) {
        return jSONObject == null ? new JSONObject() : ycx(jSONObject.toString());
    }

    public static String zb(String str) {
        if (TextUtils.isEmpty(str)) {
            return str;
        }
        String strYcx = ycx();
        String strYcx2 = ycx(strYcx, 32);
        String strZb = zb();
        return c0.m("3", strYcx, strZb, (strYcx2 == null || strZb == null) ? null : com.bytedance.sdk.component.dj.ycx.ycx(str, strZb, strYcx2));
    }

    public static JSONObject ycx(String str) {
        JSONObject jSONObject = new JSONObject();
        if (!TextUtils.isEmpty(str)) {
            try {
                String strZb = zb(str);
                if (!TextUtils.isEmpty(strZb)) {
                    jSONObject.put(PglCryptUtils.KEY_MESSAGE, strZb);
                    jSONObject.put("cypher", 3);
                    return jSONObject;
                }
                jSONObject.put(PglCryptUtils.KEY_MESSAGE, str);
                jSONObject.put("cypher", 0);
                return jSONObject;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "esseoBe1ZdQ=", "XuAuhxqsffSUWPVSiAiXIU/mDrcg", 64);
                try {
                    jSONObject.put(PglCryptUtils.KEY_MESSAGE, str);
                    jSONObject.put("cypher", 0);
                } catch (Throwable th3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "esseoBe1ZdQ=", "XuAuhxqsffSUWPVSiAiXIU/mDrcg", 68);
                    th3.getMessage();
                }
            }
        }
        return jSONObject;
    }

    public static Random sya() {
        try {
            return SecureRandom.getInstanceStrong();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "esseoBe1ZdQ=", "XOs5pwKybciNY9lOmBCuK14=", 180);
            return new SecureRandom();
        }
    }

    public static String zb() {
        String strYcx = ycx(8);
        if (strYcx == null || strYcx.length() != 16) {
            return null;
        }
        return strYcx;
    }

    public static String ycx() {
        String strYcx = ycx(16);
        if (strYcx == null || strYcx.length() != 32) {
            return null;
        }
        return strYcx;
    }

    public static String ycx(String str, int i5) {
        if (str == null || str.length() != i5) {
            return null;
        }
        int i11 = i5 / 2;
        return str.substring(i11, i5) + str.substring(0, i11);
    }

    public static String ycx(int i5) {
        try {
            byte[] bArr = new byte[i5];
            C0043ycx.ycx.nextBytes(bArr);
            return lud.ycx(bArr);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "esseoBe1ZdQ=", "S/wikRa/bPWBRNNSgSK0Og==", 170);
            return null;
        }
    }
}
