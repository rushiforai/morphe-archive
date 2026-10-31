package com.iab.omid.library.vungle.utils;

import android.os.Build;
import com.amplitude.android.plugins.AndroidContextPlugin;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class b {
    public static String a() {
        return Build.MANUFACTURER + "; " + Build.MODEL;
    }

    public static String b() {
        return AndroidContextPlugin.PLATFORM;
    }

    public static String c() {
        return Integer.toString(Build.VERSION.SDK_INT);
    }

    public static JSONObject d() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        c.a(jSONObject, "deviceType", a());
        c.a(jSONObject, "osVersion", c());
        c.a(jSONObject, "os", b());
        return jSONObject;
    }
}
