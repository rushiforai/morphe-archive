package com.pgl.ssdk;

import android.content.Context;
import android.provider.Settings;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.io.File;

/* loaded from: classes4.dex */
public class w {

    /* renamed from: a, reason: collision with root package name */
    private static String f42389a;

    /* renamed from: b, reason: collision with root package name */
    private static String f42390b;

    public static String a() {
        if (TextUtils.isEmpty(f42390b)) {
            f42390b = b();
        }
        return f42390b;
    }

    private static String b() {
        return (a("com.samsung.android.knox.SemPersonaManager") || a("com.samsung.android.knoxguard.KnoxGuardManager")) ? "samsung" : (a("androidhnext.Manifest") || a("androidhnext.R")) ? "honor" : (a("androidhwext.Manifest") || a("androidhwext.R")) ? "huawei" : (a("oppo.Manifest") || a("oppo.R") || a("oplus.Manifest") || a("oplus.R") || a("com.oneplus.Manifest") || a("com.oneplus.R")) ? "oppo" : (a("vivo.Manifest") || a("vivo.R")) ? "vivo" : (a("miui.Manifest") || a("miui.R") || a("miui.os.Build")) ? "xiaomi" : (a("lineageos.platform.Manifest") || a("lineageos.platform.R")) ? "lineage" : b("/system/framework/com.motorola.motosignature.jar") ? "moto" : (b("/system/framework/transsion-framework.jar") || b("/system/framework/transsion-services.jar")) ? "transsion" : InneractiveMediationNameConsts.OTHER;
    }

    public static String a(Context context) {
        String str = f42389a;
        if (str != null) {
            return str;
        }
        String string = Settings.Global.getString(context.getContentResolver(), "boot_count");
        f42389a = string;
        return string;
    }

    private static boolean b(String str) {
        try {
            return new File(str).exists();
        } catch (Throwable unused) {
            return false;
        }
    }

    private static boolean a(String str) {
        try {
            Class.forName(str);
            return true;
        } catch (Throwable unused) {
            return false;
        }
    }
}
