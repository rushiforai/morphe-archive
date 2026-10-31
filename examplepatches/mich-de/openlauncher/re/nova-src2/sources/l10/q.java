package l10;

import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ComponentInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import e10.z2;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import r10.n0;
import r10.o0;
import t70.l1;
import t70.m0;
import t70.y0;

/* loaded from: classes.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public static final q f74439a = new q();

    /* renamed from: b, reason: collision with root package name */
    public static final Uri f74440b = z2.x("ic_qsb_m_letter_color_google");

    /* renamed from: c, reason: collision with root package name */
    public static final Uri f74441c = z2.x("ic_qsb_appsearch");

    /* renamed from: d, reason: collision with root package name */
    public static final Uri f74442d;

    /* renamed from: e, reason: collision with root package name */
    public static final Uri f74443e;

    /* renamed from: f, reason: collision with root package name */
    public static final Uri f74444f;

    /* renamed from: g, reason: collision with root package name */
    public static final Uri f74445g;

    /* renamed from: h, reason: collision with root package name */
    public static final Uri f74446h;

    /* renamed from: i, reason: collision with root package name */
    public static final Uri f74447i;

    /* renamed from: j, reason: collision with root package name */
    public static final AtomicBoolean f74448j;

    /* renamed from: k, reason: collision with root package name */
    public static Context f74449k;

    /* renamed from: l, reason: collision with root package name */
    public static String f74450l;

    /* renamed from: m, reason: collision with root package name */
    public static Uri f74451m;
    public static final LinkedHashSet n;
    public static final p o;

    static {
        Uri uriX = z2.x("ic_qsb_google_assist");
        f74442d = uriX;
        f74443e = z2.x("ic_search_google_play");
        f74444f = z2.x("ic_qsb_ddg");
        Uri uriX2 = z2.x("ic_pref_appsearch");
        n0 n0Var = n0.f85193c;
        f74445g = o0.d(uriX2, n0Var);
        f74446h = o0.d(z2.x("ic_qsb_fatter_search"), n0Var);
        f74447i = Uri.parse("favicon://");
        f74448j = new AtomicBoolean(false);
        f74451m = uriX;
        z2.v(2131231778, "com.teslacoilsw.launcher");
        z2.v(2131231774, "com.teslacoilsw.launcher");
        n = new LinkedHashSet();
        o = new p(new Handler(Looper.getMainLooper()));
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x00b2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(Context context) {
        ResolveInfo resolveInfoResolveActivity;
        ComponentInfo componentInfo;
        Uri uriD;
        int i5;
        PackageManager packageManager = context.getApplicationContext().getPackageManager();
        String string = Settings.Secure.getString(context.getContentResolver(), "voice_interaction_service");
        q qVar = f74439a;
        Uri uri = f74442d;
        if (string != null && !r70.k.U0(string)) {
            ComponentName componentNameUnflattenFromString = ComponentName.unflattenFromString(string);
            f74450l = componentNameUnflattenFromString != null ? componentNameUnflattenFromString.getPackageName() : null;
            if (!Intrinsics.b(componentNameUnflattenFromString != null ? componentNameUnflattenFromString.getPackageName() : null, "com.google.android.googlequicksearchbox")) {
                if (!Intrinsics.b(componentNameUnflattenFromString != null ? componentNameUnflattenFromString.getPackageName() : null, "com.google.android.apps.searchlite")) {
                    if (componentNameUnflattenFromString != null) {
                        Intent intent = new Intent();
                        intent.setComponent(componentNameUnflattenFromString);
                        resolveInfoResolveActivity = packageManager.resolveService(intent, 128);
                    }
                }
            }
            qVar.d(uri);
            return;
        }
        String string2 = Settings.Secure.getString(context.getContentResolver(), "assistant");
        if (string2 != null && !r70.k.U0(string2)) {
            ComponentName componentNameUnflattenFromString2 = ComponentName.unflattenFromString(string2);
            f74450l = componentNameUnflattenFromString2 != null ? componentNameUnflattenFromString2.getPackageName() : null;
            if (!Intrinsics.b(componentNameUnflattenFromString2 != null ? componentNameUnflattenFromString2.getPackageName() : null, "com.google.android.googlequicksearchbox")) {
                if (!Intrinsics.b(componentNameUnflattenFromString2 != null ? componentNameUnflattenFromString2.getPackageName() : null, "com.google.android.apps.searchlite")) {
                    if (componentNameUnflattenFromString2 != null) {
                        Intent intent2 = new Intent();
                        intent2.setComponent(componentNameUnflattenFromString2);
                        resolveInfoResolveActivity = packageManager.resolveActivity(intent2, 128);
                    } else {
                        resolveInfoResolveActivity = null;
                    }
                }
            }
            qVar.d(uri);
            return;
        }
        resolveInfoResolveActivity = packageManager.resolveActivity(new Intent("android.intent.action.ASSIST"), 65664);
        if (resolveInfoResolveActivity == null || (componentInfo = resolveInfoResolveActivity.activityInfo) == null) {
            componentInfo = resolveInfoResolveActivity != null ? resolveInfoResolveActivity.serviceInfo : null;
        }
        if (componentInfo != null) {
            Bundle bundle = componentInfo.metaData;
            uriD = (bundle == null || (i5 = bundle.getInt("com.android.systemui.action_assist_icon")) == 0) ? null : z2.v(i5, componentInfo.packageName);
            if (uriD == null && componentInfo.getIconResource() != 0) {
                uriD = z2.v(componentInfo.getIconResource(), componentInfo.packageName);
            }
        } else {
            uriD = null;
        }
        if (uriD == null) {
            uriD = o0.d(z2.v(2131231755, "com.teslacoilsw.launcher"), n0.f85193c);
        }
        f74450l = componentInfo != null ? componentInfo.packageName : null;
        qVar.d(uriD);
    }

    public static void c(Context context) {
        if (f74448j.getAndSet(true)) {
            return;
        }
        f74449k = context;
        a80.e eVar = y0.f88884a;
        m0.t(l1.f88818a, a80.d.f488c, null, new e20.c(context, null, 13), 2);
        ContentResolver contentResolver = context.getContentResolver();
        Uri uriFor = Settings.Secure.getUriFor("voice_interaction_service");
        Uri uriFor2 = Settings.Secure.getUriFor("assistant");
        p pVar = o;
        contentResolver.registerContentObserver(uriFor, false, pVar);
        contentResolver.registerContentObserver(uriFor2, false, pVar);
    }

    public final synchronized void b(Function1 function1) {
        LinkedHashSet linkedHashSet = n;
        linkedHashSet.remove(function1);
        if (linkedHashSet.size() == 0) {
            f74448j.set(false);
            Context context = f74449k;
            if (context != null) {
                context.getContentResolver().unregisterContentObserver(o);
            }
        }
    }

    public final synchronized void d(Uri uri) {
        if (!Intrinsics.b(uri, f74451m)) {
            f74451m = uri;
            Iterator it = n.iterator();
            while (it.hasNext()) {
                ((Function1) it.next()).invoke(f74451m);
            }
        }
    }
}
