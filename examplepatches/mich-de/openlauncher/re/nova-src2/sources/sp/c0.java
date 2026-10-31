package sp;

import android.app.Application;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;

/* loaded from: classes4.dex */
public abstract class c0 {

    /* renamed from: a, reason: collision with root package name */
    public static ConnectivityManager.NetworkCallback f87571a;

    static {
        new b50.d(c0.class.getSimpleName());
    }

    public static ConnectivityManager a(Context context) {
        if (context == null) {
            return null;
        }
        Object systemService = context.getApplicationContext().getSystemService("connectivity");
        if (systemService instanceof ConnectivityManager) {
            return (ConnectivityManager) systemService;
        }
        return null;
    }

    public static boolean b(ConnectivityManager connectivityManager) {
        NetworkCapabilities networkCapabilities;
        try {
            Network activeNetwork = connectivityManager.getActiveNetwork();
            if (activeNetwork == null || (networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork)) == null) {
                return false;
            }
            return networkCapabilities.hasCapability(12);
        } catch (Throwable th2) {
            r0.c(th2);
            return false;
        }
    }

    public static void c(Application application, i iVar) {
        ConnectivityManager connectivityManagerA = a(application);
        if (connectivityManagerA == null) {
            return;
        }
        ConnectivityManager.NetworkCallback networkCallback = f87571a;
        if (networkCallback != null) {
            try {
                connectivityManagerA.unregisterNetworkCallback(networkCallback);
            } catch (Throwable th2) {
                r0.c(th2);
            }
            f87571a = null;
        }
        try {
            io.sentry.android.core.internal.util.a aVar = new io.sentry.android.core.internal.util.a(2, application.getApplicationContext(), iVar);
            f87571a = aVar;
            connectivityManagerA.registerDefaultNetworkCallback(aVar);
        } catch (Throwable th3) {
            r0.c(th3);
            f87571a = null;
        }
    }
}
