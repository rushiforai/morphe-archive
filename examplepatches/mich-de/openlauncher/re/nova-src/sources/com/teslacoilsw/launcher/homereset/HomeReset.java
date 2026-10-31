package com.teslacoilsw.launcher.homereset;

import a4.a;
import android.app.Activity;
import android.app.role.RoleManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.reflect.Field;
import mc0.d;

/* loaded from: classes.dex */
public class HomeReset extends Activity {

    /* renamed from: a, reason: collision with root package name */
    public static final ComponentName f45760a = new ComponentName("com.teslacoilsw.launcher", HomeReset.class.getName());

    /* renamed from: b, reason: collision with root package name */
    public static volatile Boolean f45761b = null;

    /* renamed from: c, reason: collision with root package name */
    public static final boolean f45762c;

    /* renamed from: d, reason: collision with root package name */
    public static final ComponentName[] f45763d;

    static {
        Field field = null;
        boolean z11 = false;
        if ("huawei".equalsIgnoreCase(Build.BRAND)) {
            try {
                try {
                    Field field2 = Intent.class.getField("FLAG_HW_HOME_INTENT_FROM_SYSTEM");
                    field2.setAccessible(true);
                    field = field2;
                } catch (NoSuchFieldException | SecurityException unused) {
                }
            } catch (Exception unused2) {
            }
            int i5 = field != null ? field.getInt(Intent.class) : 0;
            if (i5 != 0) {
                z11 = true;
            }
        }
        f45762c = z11;
        f45763d = new ComponentName[]{ComponentName.unflattenFromString("android/com.android.internal.app.ResolverActivity"), ComponentName.unflattenFromString("com.huawei.android.internal.app/.HwResolverActivity"), ComponentName.unflattenFromString("android/com.android.internal.app.ResolverActivityEx")};
        new ComponentName("com.teslacoilsw.launcher", "com.teslacoilsw.launcher.WallpaperReset");
    }

    public static Intent a(Context context) {
        RoleManager roleManagerB;
        if (Build.VERSION.SDK_INT < 29 || (roleManagerB = a.b(context.getSystemService(a.i()))) == null || !roleManagerB.isRoleAvailable("android.app.role.HOME")) {
            return null;
        }
        return roleManagerB.createRequestRoleIntent("android.app.role.HOME");
    }

    public static ComponentName b(PackageManager packageManager) {
        Exception e3;
        ComponentName componentNameResolveActivity;
        boolean z11 = false;
        try {
            componentNameResolveActivity = d().resolveActivity(packageManager);
            int i5 = 0;
            while (true) {
                try {
                    ComponentName[] componentNameArr = f45763d;
                    if (i5 >= componentNameArr.length) {
                        break;
                    }
                    if (componentNameArr[i5].equals(componentNameResolveActivity)) {
                        z11 = true;
                        break;
                    }
                    i5++;
                } catch (Exception e11) {
                    e3 = e11;
                    d.f76206a.p(e3, "Exception when trying to find default home", new Object[0]);
                    return componentNameResolveActivity;
                }
            }
            if (z11) {
                return null;
            }
            return componentNameResolveActivity;
        } catch (Exception e12) {
            e3 = e12;
            componentNameResolveActivity = null;
        }
    }

    public static boolean c(Context context) {
        ComponentName componentNameB = b(context.getPackageManager());
        boolean z11 = componentNameB != null && "com.teslacoilsw.launcher".equals(componentNameB.getPackageName());
        f45761b = Boolean.valueOf(z11);
        return z11;
    }

    public static Intent d() {
        Intent intent = new Intent("android.intent.action.MAIN", (Uri) null);
        intent.addCategory("android.intent.category.HOME");
        intent.addFlags(268435456);
        return intent;
    }

    public static void e(Context context, boolean z11) {
        PackageManager packageManager = context.getApplicationContext().getPackageManager();
        if (Build.VERSION.SDK_INT >= 29) {
            Intent intent = new Intent("android.settings.HOME_SETTINGS");
            intent.addFlags(268435456);
            context.startActivity(intent);
            return;
        }
        if (f45762c) {
            Intent intent2 = new Intent("com.android.settings.PREFERRED_SETTINGS");
            intent2.addFlags(268468224);
            if (packageManager.resolveActivity(intent2, 0) != null) {
                context.startActivity(intent2);
                return;
            }
        }
        ComponentName componentName = f45760a;
        packageManager.setComponentEnabledSetting(componentName, 1, 1);
        if (b(packageManager) != null && v30.a.f92041e) {
            packageManager.setComponentEnabledSetting(componentName, 2, 1);
            Intent intent3 = new Intent("android.settings.HOME_SETTINGS");
            intent3.addFlags(268435456);
            context.startActivity(intent3);
            return;
        }
        Intent intentD = d();
        if (z11) {
            intentD.putExtra("homereset_return_to_settings", true);
        }
        packageManager.resolveActivity(intentD, SQLiteDatabase.OPEN_FULLMUTEX);
        packageManager.setComponentEnabledSetting(componentName, 2, 1);
        context.startActivity(intentD);
    }

    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Context applicationContext = getApplicationContext();
        PackageManager packageManager = getPackageManager();
        ComponentName componentName = f45760a;
        packageManager.setComponentEnabledSetting(componentName, 1, 1);
        Intent intentD = d();
        intentD.setFlags(268435456);
        applicationContext.startActivity(intentD);
        packageManager.setComponentEnabledSetting(componentName, 2, 1);
        Intent intentD2 = d();
        intentD2.setFlags(402653184);
        applicationContext.startActivity(intentD2);
    }
}
