package com.pgl.ssdk;

import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.text.TextUtils;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: classes.dex */
public class ab {

    /* renamed from: a, reason: collision with root package name */
    private static int f42257a = -1;

    /* renamed from: b, reason: collision with root package name */
    private static int f42258b = -1;

    @SuppressLint({"PrivateApi"})
    public static Application a() {
        try {
            return (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication", null).invoke(null, null);
        } catch (Throwable unused) {
            return null;
        }
    }

    public static String b() {
        if (Build.VERSION.SDK_INT >= 28) {
            return Application.getProcessName();
        }
        try {
            Method declaredMethod = Class.forName("android.app.ActivityThread", false, Application.class.getClassLoader()).getDeclaredMethod("currentProcessName", null);
            declaredMethod.setAccessible(true);
            Object objInvoke = declaredMethod.invoke(null, null);
            if (objInvoke instanceof String) {
                return (String) objInvoke;
            }
        } catch (Throwable unused) {
        }
        return null;
    }

    public static String c() {
        String path;
        try {
            path = Environment.getDataDirectory().getPath();
        } catch (Throwable unused) {
            path = null;
        }
        return path == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : path.trim();
    }

    public static String d() {
        String absolutePath;
        try {
            absolutePath = Environment.getExternalStorageDirectory().getAbsolutePath();
        } catch (Throwable unused) {
            absolutePath = null;
        }
        return absolutePath == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : absolutePath.trim();
    }

    public static String e(Context context) {
        String absolutePath;
        try {
            absolutePath = context.getFilesDir().getAbsolutePath();
        } catch (Throwable unused) {
            absolutePath = null;
        }
        return absolutePath == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : absolutePath.trim();
    }

    public static String f(Context context) {
        String packageName;
        try {
            packageName = context.getPackageName();
        } catch (Throwable unused) {
            packageName = null;
        }
        return packageName == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : packageName.trim();
    }

    public static String g(Context context) {
        String packageResourcePath;
        try {
            packageResourcePath = context.getPackageResourcePath();
        } catch (Throwable unused) {
            packageResourcePath = null;
        }
        return packageResourcePath == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : packageResourcePath.trim();
    }

    public static int h(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
        } catch (Throwable unused) {
            return 0;
        }
    }

    public static String i(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (Throwable unused) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    public static boolean j(Context context) {
        ResolveInfo resolveInfo;
        try {
            PackageManager packageManager = context.getPackageManager();
            Intent intent = new Intent("android.intent.action.MAIN", (Uri) null);
            intent.addCategory("android.intent.category.LAUNCHER");
            intent.setPackage(context.getPackageName());
            List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(intent, 0);
            if (listQueryIntentActivities == null || listQueryIntentActivities.isEmpty() || (resolveInfo = listQueryIntentActivities.get(0)) == null) {
                return false;
            }
            ActivityInfo activityInfo = resolveInfo.activityInfo;
            int componentEnabledSetting = packageManager.getComponentEnabledSetting(new ComponentName(activityInfo.packageName, activityInfo.name));
            return componentEnabledSetting == 0 || componentEnabledSetting == 1;
        } catch (Throwable unused) {
            return true;
        }
    }

    public static int k(Context context) {
        int i5;
        PackageManager packageManager = context.getPackageManager();
        String packageName = context.getPackageName();
        Intent intent = new Intent("android.net.VpnService");
        intent.setPackage(packageName);
        Iterator<ResolveInfo> it = packageManager.queryIntentServices(intent, 128).iterator();
        while (true) {
            if (!it.hasNext()) {
                i5 = 999999;
                break;
            }
            if (it.next().serviceInfo.packageName.equals(packageName)) {
                i5 = 1;
                break;
            }
        }
        if (i5 != 1) {
            return -1;
        }
        return i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0042  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static void l(Context context) {
        int iA;
        String strA = aw.a(context, "hac_date", (String) null);
        if (!TextUtils.isEmpty(strA)) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
            if (strA.equals(simpleDateFormat.format(new Date()))) {
                int iA2 = aw.a(context, "hac", -1);
                iA = aw.a(context, "tac", -1);
                if (iA2 == -1 || iA == -1) {
                    iA = 0;
                    f42257a = 0;
                } else {
                    f42257a = iA2;
                }
            }
        }
        f42258b = iA;
    }

    private static void m(Context context) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
        aw.b(context, "hac_date", simpleDateFormat.format(new Date()));
        aw.b(context, "hac", f42257a);
        aw.b(context, "tac", f42258b);
    }

    private static String a(Context context, int i5, String str) {
        Configuration configuration = new Configuration(context.getResources().getConfiguration());
        configuration.setLocale(new Locale(str));
        return context.createConfigurationContext(configuration).getResources().getString(i5);
    }

    public static void b(Context context) {
        try {
            if (f42257a == -1 || f42258b == -1) {
                l(context);
            }
            if (a(context)) {
                f42257a++;
            }
            f42258b++;
            if (f42257a != 0) {
                m(context);
                com.pgl.ssdk.ces.a.meta(160, null, new int[]{f42257a, f42258b});
            }
        } catch (Throwable unused) {
        }
    }

    public static String c(Context context) {
        String str;
        try {
            str = context.getApplicationInfo().sourceDir;
        } catch (Throwable unused) {
            str = null;
        }
        return str == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str.trim();
    }

    public static String d(Context context) {
        try {
            return a(context, context.getPackageManager().getApplicationInfo(context.getPackageName(), 0).labelRes, "en");
        } catch (Throwable unused) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    private static boolean a(Context context) {
        List<ActivityManager.AppTask> appTasks;
        if (context == null || (appTasks = ((ActivityManager) context.getSystemService("activity")).getAppTasks()) == null || appTasks.isEmpty()) {
            return false;
        }
        for (ActivityManager.AppTask appTask : appTasks) {
            if (appTask.getTaskInfo() != null && a(appTask.getTaskInfo().baseIntent)) {
                return true;
            }
        }
        return false;
    }

    private static boolean a(Intent intent) {
        return (intent == null || (intent.getFlags() & 8388608) == 0) ? false : true;
    }
}
