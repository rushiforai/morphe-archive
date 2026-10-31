package com.tiktok.unity;

import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTUnityBridge {
    public static void setConfigCallback(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            Class<?> cls = Class.forName("com.unity3d.player.UnityPlayer");
            cls.getMethod("UnitySendMessage", String.class, String.class, String.class).invoke(cls, "TikTokInnerManager", "UpdateConfigFromNative", jSONObject.toString());
        } catch (Throwable unused) {
        }
    }
}
