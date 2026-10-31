package w;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Build;
import android.os.RemoteException;
import android.support.customtabs.ICustomTabsService;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public final ICustomTabsService f93398a;

    /* renamed from: b, reason: collision with root package name */
    public final ComponentName f93399b;

    /* renamed from: c, reason: collision with root package name */
    public final Context f93400c;

    public f(ICustomTabsService iCustomTabsService, ComponentName componentName, Context context) {
        this.f93398a = iCustomTabsService;
        this.f93399b = componentName;
        this.f93400c = context;
    }

    public static boolean a(Context context, String str, k kVar) {
        kVar.setApplicationContext(context.getApplicationContext());
        Intent intent = new Intent("android.support.customtabs.action.CustomTabsService");
        if (str.isEmpty()) {
            throw new IllegalArgumentException("Service Intents must be explicit");
        }
        intent.setPackage(str);
        return context.bindService(intent, kVar, 33);
    }

    public static String b(Context context, List list) {
        PackageManager packageManager = context.getPackageManager();
        List<String> arrayList = list == null ? new ArrayList() : list;
        ResolveInfo resolveInfoResolveActivity = packageManager.resolveActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://")), 0);
        if (resolveInfoResolveActivity != null) {
            String str = resolveInfoResolveActivity.activityInfo.packageName;
            ArrayList arrayList2 = new ArrayList(arrayList.size() + 1);
            arrayList2.add(str);
            if (list != null) {
                arrayList2.addAll(list);
            }
            arrayList = arrayList2;
        }
        Intent intent = new Intent("android.support.customtabs.action.CustomTabsService");
        for (String str2 : arrayList) {
            intent.setPackage(str2);
            if (packageManager.resolveService(intent, 0) != null) {
                return str2;
            }
        }
        if (Build.VERSION.SDK_INT < 30) {
            return null;
        }
        Log.w("CustomTabsClient", "Unable to find any Custom Tabs packages, you may need to add a <queries> element to your manifest. See the docs for CustomTabsClient#getPackageName.");
        return null;
    }

    public final l c(b bVar) {
        ICustomTabsService iCustomTabsService = this.f93398a;
        e eVar = new e(bVar);
        try {
            if (iCustomTabsService.newSession(eVar)) {
                return new l(iCustomTabsService, eVar, this.f93399b);
            }
            return null;
        } catch (RemoteException unused) {
            return null;
        }
    }
}
