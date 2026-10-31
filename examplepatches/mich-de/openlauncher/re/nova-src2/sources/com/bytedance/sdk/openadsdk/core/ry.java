package com.bytedance.sdk.openadsdk.core;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import android.os.LocaleList;
import android.os.SystemClock;
import android.text.TextUtils;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Locale;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ry {

    /* renamed from: dj, reason: collision with root package name */
    private static boolean f25903dj;
    private static String sya;
    private static String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static String f25904zb;

    private static Context dj(Context context) {
        return context == null ? pmi.ycx() : context;
    }

    private static void lt(Context context) {
        if (dj(context) == null) {
            return;
        }
        String strZb = sya.ycx().zb("abcd", (String) null);
        if (TextUtils.isEmpty(strZb)) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(strZb);
            int iOptInt = jSONObject.optInt("cypher", -1);
            String strOptString = jSONObject.optString(PglCryptUtils.KEY_MESSAGE);
            if (iOptInt == 3) {
                String strSya = com.bytedance.sdk.component.utils.ycx.sya(strOptString);
                if (TextUtils.isEmpty(strSya)) {
                    return;
                }
                ycx = new JSONObject(strSya).optString("abcd");
                ycx();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "cuoYgQqweg==", "UuAkgSe1bQ==", Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        }
    }

    @SuppressLint({"HardwareIds"})
    private static void lud(Context context) {
        if (f25903dj || dj(context) == null) {
            return;
        }
        f25904zb = String.valueOf(Build.TIME);
        sya = sya.ycx().zb("uuid", (String) null);
        f25903dj = true;
    }

    public static String ycx(Context context) {
        if (!TextUtils.isEmpty(ycx)) {
            return ycx;
        }
        lt(context);
        return ycx;
    }

    public static String zb(Context context) {
        if (f25904zb == null && !f25903dj) {
            synchronized (ry.class) {
                try {
                    if (!f25903dj) {
                        lud(context);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f25904zb;
    }

    public static String sya(Context context) {
        if (TextUtils.isEmpty(sya) && !f25903dj) {
            synchronized (ry.class) {
                try {
                    if (!f25903dj) {
                        lud(context);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return sya;
    }

    public static void ycx(String str) {
        if (!TextUtils.isEmpty(str)) {
            if (!str.equals(ycx)) {
                ycx = str;
            }
            ycx();
        }
        if (TextUtils.isEmpty(ycx)) {
            return;
        }
        com.bytedance.sdk.openadsdk.core.ok.sya.zb(ycx);
        ok.ycx(ycx);
    }

    public static String zb() {
        try {
            Locale locale = LocaleList.getDefault().get(0);
            String language = locale != null ? locale.getLanguage() : b.f42142b;
            if (locale == null || !"zh".equals(language)) {
                return language;
            }
            String string = locale.toString();
            if (locale.toString().length() >= 5) {
                string = string.substring(0, 5);
            }
            if (Locale.SIMPLIFIED_CHINESE.toString().equals(string)) {
                return "zh";
            }
            return "zh-Hant";
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "cuoYgQqweg==", "XOs5phqvfcKNZtZTiwShL14=", 183);
            return b.f42142b;
        }
    }

    public static void ycx() {
        if (TextUtils.isEmpty(ycx)) {
            return;
        }
        com.bytedance.sdk.openadsdk.utils.yzp.sya((Runnable) new com.bytedance.sdk.component.fby.zb.sya("update_did") { // from class: com.bytedance.sdk.openadsdk.core.ry.1
            @Override // java.lang.Runnable
            public void run() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("time", SystemClock.elapsedRealtime());
                    jSONObject.put("abcd", ry.ycx);
                    sya.ycx().ycx("abcd", com.bytedance.sdk.component.utils.ycx.ycx(jSONObject).toString());
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "cuoYgQqweoPR", "Sfsj", 143);
                }
            }
        });
    }
}
