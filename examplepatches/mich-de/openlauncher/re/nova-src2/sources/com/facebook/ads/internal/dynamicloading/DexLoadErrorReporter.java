package com.facebook.ads.internal.dynamicloading;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.facebook.ads.internal.api.BuildConfigApi;
import com.facebook.infer.annotation.Nullsafe;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes2.dex */
public class DexLoadErrorReporter {
    public static final double SAMPLING = 0.1d;

    /* renamed from: a, reason: collision with root package name */
    public static final AtomicBoolean f27503a = new AtomicBoolean();

    public static void a(Context context, JSONObject jSONObject, String str) throws JSONException {
        String packageName = context.getPackageName();
        PackageManager packageManager = context.getPackageManager();
        if (packageManager != null) {
            jSONObject.put("APPBUILD", packageManager.getPackageInfo(packageName, 0).versionCode);
            jSONObject.put("APPNAME", packageManager.getApplicationLabel(packageManager.getApplicationInfo(packageName, 0)));
            jSONObject.put("APPVERS", packageManager.getPackageInfo(packageName, 0).versionName);
        }
        jSONObject.put("OSVERS", Build.VERSION.RELEASE);
        jSONObject.put("SDK", "android");
        jSONObject.put("SESSION_ID", str);
        jSONObject.put("MODEL", Build.MODEL);
        jSONObject.put("BUNDLE", packageName);
        jSONObject.put("SDK_VERSION", BuildConfigApi.getVersionName(context));
        jSONObject.put(com.moloco.sdk.acm.b.f36016d, AndroidContextPlugin.PLATFORM);
    }

    @SuppressLint({"CatchGeneralException"})
    public static void reportDexLoadingIssue(Context context, String str, double d5) {
        AtomicBoolean atomicBoolean = f27503a;
        if (atomicBoolean.get() || Math.random() >= d5) {
            return;
        }
        atomicBoolean.set(true);
        new a(context, str).start();
    }
}
