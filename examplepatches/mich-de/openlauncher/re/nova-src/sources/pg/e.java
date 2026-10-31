package pg;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import com.google.android.gms.common.GooglePlayServicesIncorrectManifestValueException;
import com.google.android.gms.common.GooglePlayServicesMissingManifestValueException;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicBoolean;
import sg.w;

/* loaded from: classes.dex */
public abstract class e {

    /* renamed from: b, reason: collision with root package name */
    public static boolean f82565b = false;

    /* renamed from: c, reason: collision with root package name */
    public static boolean f82566c = false;

    /* renamed from: a, reason: collision with root package name */
    public static final AtomicBoolean f82564a = new AtomicBoolean();

    /* renamed from: d, reason: collision with root package name */
    public static final AtomicBoolean f82567d = new AtomicBoolean();

    public static boolean a(Context context) {
        try {
            if (!f82566c) {
                try {
                    PackageInfo packageInfoC = zg.b.a(context).c(Build.VERSION.SDK_INT >= 28 ? 134217792 : 64, "com.google.android.gms");
                    f.a(context);
                    if (packageInfoC == null || f.c(packageInfoC, false) || !f.c(packageInfoC, true)) {
                        f82565b = false;
                    } else {
                        f82565b = true;
                    }
                    f82566c = true;
                } catch (PackageManager.NameNotFoundException e3) {
                    Log.w("GooglePlayServicesUtil", "Cannot find Google Play services package name.", e3);
                    f82566c = true;
                }
            }
            return f82565b || !"user".equals(Build.TYPE);
        } catch (Throwable th2) {
            f82566c = true;
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x011c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int b(Context context, int i5) {
        boolean z11;
        PackageInfo packageInfo;
        Bundle bundle;
        try {
            context.getResources().getString(2132017653);
        } catch (Throwable unused) {
            Log.e("GooglePlayServicesUtil", "The Google Play services resources were not found. Check your project configuration to ensure that the resources are included.");
        }
        if (!"com.google.android.gms".equals(context.getPackageName()) && !f82567d.get()) {
            synchronized (w.f87465a) {
                try {
                    if (!w.f87466b) {
                        w.f87466b = true;
                        try {
                            bundle = zg.b.a(context).b(128, context.getPackageName()).metaData;
                        } catch (PackageManager.NameNotFoundException e3) {
                            Log.wtf("MetadataValueReader", "This should never happen.", e3);
                        }
                        if (bundle != null) {
                            bundle.getString("com.google.app.id");
                            w.f87467c = bundle.getInt("com.google.android.gms.version");
                        }
                    }
                } finally {
                }
            }
            int i11 = w.f87467c;
            if (i11 == 0) {
                throw new GooglePlayServicesMissingManifestValueException();
            }
            if (i11 != 12451000) {
                throw new GooglePlayServicesIncorrectManifestValueException(i11);
            }
        }
        if (xg.b.e(context)) {
            z11 = false;
        } else {
            if (xg.b.f95835e == null) {
                xg.b.f95835e = Boolean.valueOf(context.getPackageManager().hasSystemFeature("android.hardware.type.embedded"));
            }
            if (!xg.b.f95835e.booleanValue()) {
                z11 = true;
            }
        }
        w.c(i5 >= 0);
        String packageName = context.getPackageName();
        PackageManager packageManager = context.getPackageManager();
        if (z11) {
            try {
                packageInfo = packageManager.getPackageInfo("com.android.vending", Build.VERSION.SDK_INT >= 28 ? 134225984 : 8256);
            } catch (PackageManager.NameNotFoundException unused2) {
                Log.w("GooglePlayServicesUtil", String.valueOf(packageName).concat(" requires the Google Play Store, but it is missing."));
            }
        } else {
            packageInfo = null;
        }
        try {
            PackageInfo packageInfo2 = packageManager.getPackageInfo("com.google.android.gms", Build.VERSION.SDK_INT >= 28 ? 134217792 : 64);
            f.a(context);
            if (!f.c(packageInfo2, true)) {
                Log.w("GooglePlayServicesUtil", String.valueOf(packageName).concat(" requires Google Play services, but their signature is invalid."));
            } else if (z11) {
                w.h(packageInfo);
                if (!f.c(packageInfo, true)) {
                    Log.w("GooglePlayServicesUtil", String.valueOf(packageName).concat(" requires Google Play Store, but its signature is invalid."));
                } else {
                    if (!z11 || packageInfo == null || packageInfo.signatures[0].equals(packageInfo2.signatures[0])) {
                        int i12 = packageInfo2.versionCode;
                        if ((i12 == -1 ? -1 : i12 / 1000) >= (i5 != -1 ? i5 / 1000 : -1)) {
                            ApplicationInfo applicationInfo = packageInfo2.applicationInfo;
                            if (applicationInfo == null) {
                                try {
                                    applicationInfo = packageManager.getApplicationInfo("com.google.android.gms", 0);
                                } catch (PackageManager.NameNotFoundException e11) {
                                    Log.wtf("GooglePlayServicesUtil", String.valueOf(packageName).concat(" requires Google Play services, but they're missing when getting application info."), e11);
                                    return 1;
                                }
                            }
                            return !applicationInfo.enabled ? 3 : 0;
                        }
                        StringBuilder sb2 = new StringBuilder(String.valueOf(packageName).length() + 49 + String.valueOf(i5).length() + 11 + String.valueOf(i12).length());
                        sb2.append("Google Play services out of date for ");
                        sb2.append(packageName);
                        sb2.append(".  Requires ");
                        sb2.append(i5);
                        sb2.append(" but found ");
                        sb2.append(i12);
                        Log.w("GooglePlayServicesUtil", sb2.toString());
                        return 2;
                    }
                    Log.w("GooglePlayServicesUtil", String.valueOf(packageName).concat(" requires Google Play Store, but its signature doesn't match that of Google Play services."));
                }
            }
            return 9;
        } catch (PackageManager.NameNotFoundException unused3) {
            Log.w("GooglePlayServicesUtil", String.valueOf(packageName).concat(" requires Google Play services, but they are missing."));
            return 1;
        }
    }

    public static boolean c(Context context) {
        try {
            Iterator<PackageInstaller.SessionInfo> it = context.getPackageManager().getPackageInstaller().getAllSessions().iterator();
            while (it.hasNext()) {
                if ("com.google.android.gms".equals(it.next().getAppPackageName())) {
                    return true;
                }
            }
            return context.getPackageManager().getApplicationInfo("com.google.android.gms", UserMetadata.MAX_INTERNAL_KEY_SIZE).enabled;
        } catch (PackageManager.NameNotFoundException | Exception unused) {
            return false;
        }
    }
}
