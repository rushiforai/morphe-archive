package ads_mobile_sdk;

import android.util.Log;
import java.util.Iterator;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import vk.t;

/* loaded from: classes2.dex */
public abstract class mu0 {

    /* renamed from: a, reason: collision with root package name */
    public static final cz.b f7335a = new cz.b(new o7.a(14));

    public static void a(String msg, Exception exc) {
        Intrinsics.g(msg, "msg");
        if (a(6, "GoogleMobileAds")) {
            cz.b bVar = f7335a;
            bVar.getClass();
            Iterator itW = ((t) bVar.f48576d).w(bVar, msg);
            while (true) {
                vk.s sVar = (vk.s) itW;
                if (!sVar.hasNext()) {
                    break;
                }
                String str = (String) sVar.next();
                Log.e("GoogleMobileAds", Thread.currentThread().getName() + ": " + str);
            }
            if (exc != null) {
                String stackTraceString = Log.getStackTraceString(exc);
                Intrinsics.f(stackTraceString, "getStackTraceString(...)");
                Log.e("GoogleMobileAds", stackTraceString);
            }
        }
    }

    public static void b(String msg, Throwable th2) {
        Intrinsics.g(msg, "msg");
        if (a(2, "GoogleMobileAds")) {
            cz.b bVar = f7335a;
            bVar.getClass();
            Iterator itW = ((t) bVar.f48576d).w(bVar, msg);
            while (true) {
                vk.s sVar = (vk.s) itW;
                if (!sVar.hasNext()) {
                    break;
                }
                Thread.currentThread().getClass();
            }
            if (th2 != null) {
                Intrinsics.f(Log.getStackTraceString(th2), "getStackTraceString(...)");
            }
        }
    }

    public static void c(String msg, Exception exc) {
        Intrinsics.g(msg, "msg");
        if (a(5, "GoogleMobileAds")) {
            cz.b bVar = f7335a;
            bVar.getClass();
            Iterator itW = ((t) bVar.f48576d).w(bVar, msg);
            while (true) {
                vk.s sVar = (vk.s) itW;
                if (!sVar.hasNext()) {
                    break;
                }
                String str = (String) sVar.next();
                Log.w("GoogleMobileAds", Thread.currentThread().getName() + ": " + str);
            }
            if (exc != null) {
                String stackTraceString = Log.getStackTraceString(exc);
                Intrinsics.f(stackTraceString, "getStackTraceString(...)");
                Log.w("GoogleMobileAds", stackTraceString);
            }
        }
    }

    public static void a(Function0 function0) {
        if (gq.f4020a == hq.f4478a || !a(2, "GoogleMobileAds")) {
            return;
        }
        Iterator it = f7335a.c((CharSequence) function0.invoke()).iterator();
        while (true) {
            vk.s sVar = (vk.s) it;
            if (!sVar.hasNext()) {
                return;
            }
            Thread.currentThread().getClass();
        }
    }

    public static void a(String msg, RuntimeException runtimeException, int i5) {
        String str;
        if ((i5 & 2) != 0) {
            runtimeException = null;
        }
        if ((i5 & 4) != 0) {
            str = "GoogleMobileAds";
        } else {
            str = "GoogleMobileAdsNetwork";
        }
        Intrinsics.g(msg, "msg");
        if (a(4, str)) {
            cz.b bVar = f7335a;
            bVar.getClass();
            Iterator itW = ((t) bVar.f48576d).w(bVar, msg);
            while (true) {
                vk.s sVar = (vk.s) itW;
                if (!sVar.hasNext()) {
                    break;
                }
                String str2 = (String) sVar.next();
                Log.i(str, Thread.currentThread().getName() + ": " + str2);
            }
            if (runtimeException != null) {
                String stackTraceString = Log.getStackTraceString(runtimeException);
                Intrinsics.f(stackTraceString, "getStackTraceString(...)");
                Log.i(str, stackTraceString);
            }
        }
    }

    public static boolean a(int i5, String str) {
        hq hqVar = gq.f4020a;
        return i5 >= 5 || Log.isLoggable(str, i5);
    }

    public static cz.b a() {
        return f7335a;
    }
}
