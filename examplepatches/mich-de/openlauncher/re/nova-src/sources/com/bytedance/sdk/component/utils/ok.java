package com.bytedance.sdk.component.utils;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Configuration;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Locale;

/* loaded from: classes2.dex */
public class ok {

    @SuppressLint({"StaticFieldLeak"})
    private static Context ycx;

    public static void ycx(Context context, String str, String str2) {
        if (str == null) {
            str = b.f42142b;
        }
        if (str2 == null) {
            str2 = b.f42142b;
        }
        try {
            ycx = context.createConfigurationContext(zb(context, str, str2));
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "d+8jkha9bsK1Xt5Rnw==", "SOs5tgyyfcKYXg==", 37);
            th2.getMessage();
        }
        wwx.ycx(ycx);
    }

    private static Configuration zb(Context context, String str, String str2) {
        Configuration configuration = new Configuration(context.getResources().getConfiguration());
        configuration.setLocale(new Locale(str, str2));
        return configuration;
    }
}
