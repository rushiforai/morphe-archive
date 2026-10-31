package com.apm.insight.l;

import android.os.Build;
import android.text.TextUtils;
import b.c0;
import com.google.android.gms.internal.measurement.k2;
import java.io.BufferedReader;
import java.io.Closeable;
import java.io.InputStreamReader;
import java.util.Locale;

/* loaded from: classes2.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    private static final CharSequence f21771a = "amigo";

    /* renamed from: b, reason: collision with root package name */
    private static final CharSequence f21772b = "funtouch";

    public static String a() throws ClassNotFoundException {
        String string;
        boolean zB = d.b();
        String strR = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (zB) {
            if (!d.b()) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            return "miui_" + a("ro.miui.ui.version.name") + "_" + Build.VERSION.INCREMENTAL;
        }
        if (d.c()) {
            String str = Build.DISPLAY;
            return (str == null || !str.toLowerCase(Locale.getDefault()).contains("flyme")) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str;
        }
        if (b()) {
            if (!b()) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            return "coloros_" + a("ro.build.version.opporom") + "_" + Build.DISPLAY;
        }
        String strA = d.a();
        if (strA == null || !strA.toLowerCase(Locale.getDefault()).contains("emotionui")) {
            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            StringBuilder sbK = k2.k(strA, "_");
            sbK.append(Build.DISPLAY);
            string = sbK.toString();
        }
        if (!TextUtils.isEmpty(string)) {
            return string;
        }
        String strA2 = a("ro.vivo.os.build.display.id");
        if (!TextUtils.isEmpty(strA2) && strA2.toLowerCase(Locale.getDefault()).contains(f21772b)) {
            return a("ro.vivo.os.build.display.id") + "_" + a("ro.vivo.product.version");
        }
        String str2 = Build.DISPLAY;
        if (!TextUtils.isEmpty(str2) && str2.toLowerCase(Locale.getDefault()).contains(f21771a)) {
            StringBuilder sbK2 = k2.k(str2, "_");
            sbK2.append(a("ro.gn.sv.version"));
            return sbK2.toString();
        }
        String str3 = Build.MANUFACTURER + Build.BRAND;
        if (!TextUtils.isEmpty(str3)) {
            String lowerCase = str3.toLowerCase(Locale.getDefault());
            if (lowerCase.contains("360") || lowerCase.contains("qiku")) {
                return c0.r(new StringBuilder(), a("ro.build.uiversion"), "_", str2);
            }
        }
        if (!TextUtils.isEmpty(a("ro.letv.release.version"))) {
            strR = c0.r(new StringBuilder("eui_"), a("ro.letv.release.version"), "_", str2);
        }
        return !TextUtils.isEmpty(strR) ? strR : str2;
    }

    private static boolean b() {
        String str = Build.MANUFACTURER;
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return str.toLowerCase(Locale.getDefault()).contains("oppo");
    }

    private static String a(String str) {
        BufferedReader bufferedReader;
        String line = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        try {
            Process processExec = Runtime.getRuntime().exec("getprop ".concat(String.valueOf(str)));
            bufferedReader = new BufferedReader(new InputStreamReader(processExec.getInputStream()), 1024);
            try {
                line = bufferedReader.readLine();
                processExec.destroy();
                com.apm.insight.a.a((Closeable) bufferedReader);
                return line;
            } catch (Throwable unused) {
                com.apm.insight.a.a((Closeable) bufferedReader);
                return line;
            }
        } catch (Throwable unused2) {
            bufferedReader = null;
        }
    }
}
