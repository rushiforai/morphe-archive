package ads_mobile_sdk;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Build;
import android.os.ext.SdkExtensions;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import w.f;

/* loaded from: classes2.dex */
public final class ai0 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ di0 f989a;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f990j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ai0(di0 di0Var, int i5) {
        super(0);
        this.f990j = i5;
        this.f989a = di0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x009d  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:42:0x00d9 -> B:80:0x00de). Please report as a decompilation issue!!! */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() throws PackageManager.NameNotFoundException {
        boolean z11;
        int i5;
        ActivityInfo activityInfo;
        switch (this.f990j) {
            case 0:
                di0 di0Var = this.f989a;
                return Boolean.valueOf(di0Var.f2531e.hasSystemFeature("com.google.android.feature.services_updater") && di0Var.f2531e.hasSystemFeature("cn.google.services"));
            case 1:
                di0 di0Var2 = this.f989a;
                Context context = di0Var2.f2529c;
                Context context2 = di0Var2.f2529c;
                Context applicationContext = context.getApplicationContext();
                if (applicationContext == null) {
                    applicationContext = context2;
                }
                PackageManager packageManager = context2.getPackageManager();
                Intrinsics.f(packageManager, "getPackageManager(...)");
                ResolveInfo resolveInfoResolveActivity = packageManager.resolveActivity(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.google.android.gms.ads")), SQLiteDatabase.OPEN_FULLMUTEX);
                if (resolveInfoResolveActivity != null && (activityInfo = resolveInfoResolveActivity.activityInfo) != null) {
                    try {
                        PackageInfo packageInfo = applicationContext.getPackageManager().getPackageInfo(activityInfo.packageName, 0);
                        if (packageInfo != null) {
                            return packageInfo.versionCode + "." + activityInfo.packageName;
                        }
                    } catch (PackageManager.NameNotFoundException unused) {
                    }
                }
                return null;
            case 2:
                di0 di0Var3 = this.f989a;
                try {
                    Context applicationContext2 = di0Var3.f2529c.getApplicationContext();
                    if (applicationContext2 == null) {
                        applicationContext2 = di0Var3.f2529c;
                    }
                    PackageInfo packageInfo2 = applicationContext2.getPackageManager().getPackageInfo("com.android.vending", 128);
                    if (packageInfo2 != null) {
                        return packageInfo2.versionCode + "." + packageInfo2.packageName;
                    }
                } catch (Exception unused2) {
                }
                return null;
            case 3:
                try {
                    i5 = Build.VERSION.SDK_INT;
                } catch (Exception e3) {
                    this.f989a.f2530d.a("DeviceProperties.adServicesExtensionVersion", (Throwable) e3);
                }
                int iValueOf = (i5 < 33 || SdkExtensions.getExtensionVersion(33) < 5) ? (i5 < 31 || SdkExtensions.getExtensionVersion(31) < 9) ? 0 : Integer.valueOf(SdkExtensions.getExtensionVersion(31)) : Integer.valueOf(SdkExtensions.getExtensionVersion(1000000));
                return iValueOf;
            case 4:
                if (Build.VERSION.SDK_INT >= 30) {
                    z11 = this.f989a.f2529c.getPackageManager().hasSystemFeature("com.google.android.play.feature.HPE_EXPERIENCE");
                }
                return Boolean.valueOf(z11);
            case 5:
                di0 di0Var4 = this.f989a;
                PackageManager packageManager2 = di0Var4.f2529c.getPackageManager();
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("http://"));
                ResolveInfo resolveInfoResolveActivity2 = packageManager2.resolveActivity(intent, 0);
                List<ResolveInfo> listQueryIntentActivities = packageManager2.queryIntentActivities(intent, SQLiteDatabase.OPEN_FULLMUTEX);
                Intrinsics.f(listQueryIntentActivities, "queryIntentActivities(...)");
                if (resolveInfoResolveActivity2 != null) {
                    Iterator<ResolveInfo> it = listQueryIntentActivities.iterator();
                    while (it.hasNext()) {
                        if (resolveInfoResolveActivity2.activityInfo.name.equals(it.next().activityInfo.name)) {
                            return Boolean.valueOf(resolveInfoResolveActivity2.activityInfo.packageName.equals(f.b(di0Var4.f2529c, null)));
                        }
                    }
                }
                return Boolean.FALSE;
            default:
                Intent intent2 = new Intent("android.intent.action.VIEW", Uri.parse("https://play.google.com/d"));
                intent2.setPackage("com.android.vending");
                return Boolean.valueOf(intent2.resolveActivity(this.f989a.f2531e) != null);
        }
    }
}
