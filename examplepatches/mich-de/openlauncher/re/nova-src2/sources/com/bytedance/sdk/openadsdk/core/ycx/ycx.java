package com.bytedance.sdk.openadsdk.core.ycx;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.List;
import w.i;

/* loaded from: classes2.dex */
public class ycx {
    private static String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static Boolean f26509zb;

    public static String ycx(Context context) {
        String str = ycx;
        if (str != null) {
            return str;
        }
        try {
            PackageManager packageManager = context.getPackageManager();
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("http://www.example.com"));
            ResolveInfo resolveInfoResolveActivity = packageManager.resolveActivity(intent, 0);
            String str2 = resolveInfoResolveActivity != null ? resolveInfoResolveActivity.activityInfo.packageName : null;
            List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(intent, 0);
            ArrayList arrayList = new ArrayList();
            for (ResolveInfo resolveInfo : listQueryIntentActivities) {
                Intent intent2 = new Intent();
                intent2.setAction("android.support.customtabs.action.CustomTabsService");
                intent2.setPackage(resolveInfo.activityInfo.packageName);
                if (packageManager.resolveService(intent2, 0) != null) {
                    arrayList.add(resolveInfo.activityInfo.packageName);
                }
            }
            if (arrayList.isEmpty()) {
                ycx = null;
            } else if (TextUtils.isEmpty(str2) || ycx(context, intent) || !arrayList.contains(str2)) {
                ycx = (String) arrayList.get(0);
            } else {
                ycx = str2;
            }
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7y6B", "eu05vQawecKS", "XOs5pQK/YsaHT/lcgRSUJ279KA==", 85);
            htf.sya("CustomTabsHelper", th2.getMessage());
        }
        return ycx;
    }

    public static int zb(Context context) {
        try {
            return !TextUtils.isEmpty(ycx(context)) ? 1 : 0;
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7y6B", "eu05vQawecKS", "Uv0Mtjc=", Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE);
            return 0;
        }
    }

    private static boolean ycx(Context context, Intent intent) {
        List<ResolveInfo> listQueryIntentActivities;
        try {
            listQueryIntentActivities = context.getPackageManager().queryIntentActivities(intent, 64);
        } catch (RuntimeException e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7y6B", "eu05vQawecKS", "U+8+phO5as6BRt5HiRWIKVXqIZARlWfThUTDTg==", 108);
            Log.e("CustomTabsHelper", "Runtime exception while getting specialized handlers");
        }
        if (listQueryIntentActivities.size() == 0) {
            return false;
        }
        for (ResolveInfo resolveInfo : listQueryIntentActivities) {
            IntentFilter intentFilter = resolveInfo.filter;
            if (intentFilter != null && intentFilter.countDataAuthorities() != 0 && intentFilter.countDataPaths() != 0 && resolveInfo.activityInfo != null) {
                return true;
            }
        }
        return false;
    }

    public static int ycx() {
        Boolean bool = f26509zb;
        return (bool != null && bool.booleanValue()) ? 1 : 0;
    }

    public static void ycx(Context context, String str, i iVar, Uri uri) {
        iVar.f93407a.setPackage(str);
        iVar.a(context, uri);
    }
}
