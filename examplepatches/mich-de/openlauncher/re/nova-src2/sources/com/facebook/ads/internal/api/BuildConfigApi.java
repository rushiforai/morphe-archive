package com.facebook.ads.internal.api;

import android.content.Context;
import androidx.annotation.Keep;
import b.c0;
import com.facebook.ads.BuildConfig;
import com.facebook.infer.annotation.Nullsafe;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes.dex */
public class BuildConfigApi {
    static final String UNITY_SHARED_PREFERENCES_SUFIX = ".v2.playerprefs";
    static final String UNITY_TAG = "an_isUnitySDK";
    static final String UNITY_VERSION_SUFIX = "-unity";
    private static volatile String sVersionOverride;

    public static String getVersionName(Context context) {
        String str = sVersionOverride;
        return (str == null || str.isEmpty()) ? isUnity(context) ? c0.q(new StringBuilder(), BuildConfig.VERSION_NAME, UNITY_VERSION_SUFIX) : BuildConfig.VERSION_NAME : isUnity(context) ? str.concat(UNITY_VERSION_SUFIX) : str;
    }

    public static String getVersionOverride() {
        return sVersionOverride;
    }

    public static boolean isDebug() {
        return BuildConfig.DEBUG;
    }

    private static boolean isUnity(Context context) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(context.getPackageName());
        sb2.append(UNITY_SHARED_PREFERENCES_SUFIX);
        return context.getSharedPreferences(sb2.toString(), 0).contains(UNITY_TAG) || context.getSharedPreferences(context.getPackageName(), 0).contains(UNITY_TAG);
    }

    public static void setVersionOverride(String str) {
        sVersionOverride = str;
    }
}
