package io.sentry.android.core.internal.util;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import io.sentry.ILogger;
import io.sentry.android.core.a0;
import io.sentry.c0;
import io.sentry.d0;
import io.sentry.e0;
import io.sentry.g3;
import java.util.HashMap;

/* loaded from: classes4.dex */
public final class b implements e0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f66943a;

    /* renamed from: b, reason: collision with root package name */
    public final ILogger f66944b;

    /* renamed from: c, reason: collision with root package name */
    public final a0 f66945c;

    /* renamed from: d, reason: collision with root package name */
    public final HashMap f66946d;

    public b(Context context, ILogger iLogger, a0 a0Var) {
        Context applicationContext = context.getApplicationContext();
        this.f66943a = applicationContext != null ? applicationContext : context;
        this.f66944b = iLogger;
        this.f66945c = a0Var;
        this.f66946d = new HashMap();
    }

    public static ConnectivityManager d(Context context, ILogger iLogger) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        if (connectivityManager == null) {
            iLogger.g(g3.INFO, "ConnectivityManager is null and cannot check network status", new Object[0]);
        }
        return connectivityManager;
    }

    public static boolean e(Context context, ILogger iLogger, a0 a0Var, ConnectivityManager.NetworkCallback networkCallback) {
        a0Var.getClass();
        ConnectivityManager connectivityManagerD = d(context, iLogger);
        if (connectivityManagerD == null) {
            return false;
        }
        if (!j.a(context, "android.permission.ACCESS_NETWORK_STATE")) {
            iLogger.g(g3.INFO, "No permission (ACCESS_NETWORK_STATE) to check network status.", new Object[0]);
            return false;
        }
        try {
            connectivityManagerD.registerDefaultNetworkCallback(networkCallback);
            return true;
        } catch (Throwable th2) {
            iLogger.e(g3.WARNING, "registerDefaultNetworkCallback failed", th2);
            return false;
        }
    }

    @Override // io.sentry.e0
    public final c0 a() {
        Context context = this.f66943a;
        ILogger iLogger = this.f66944b;
        ConnectivityManager connectivityManagerD = d(context, iLogger);
        if (connectivityManagerD == null) {
            return c0.UNKNOWN;
        }
        if (!j.a(context, "android.permission.ACCESS_NETWORK_STATE")) {
            iLogger.g(g3.INFO, "No permission (ACCESS_NETWORK_STATE) to check network status.", new Object[0]);
            return c0.NO_PERMISSION;
        }
        try {
            NetworkInfo activeNetworkInfo = connectivityManagerD.getActiveNetworkInfo();
            if (activeNetworkInfo != null) {
                return activeNetworkInfo.isConnected() ? c0.CONNECTED : c0.DISCONNECTED;
            }
            iLogger.g(g3.INFO, "NetworkInfo is null, there's no active network.", new Object[0]);
            return c0.DISCONNECTED;
        } catch (Throwable th2) {
            iLogger.e(g3.WARNING, "Could not retrieve Connection Status", th2);
            return c0.UNKNOWN;
        }
    }

    @Override // io.sentry.e0
    public final boolean b(d0 d0Var) {
        a0 a0Var = this.f66945c;
        a0Var.getClass();
        a aVar = new a(this, d0Var);
        this.f66946d.put(d0Var, aVar);
        return e(this.f66943a, this.f66944b, a0Var, aVar);
    }

    @Override // io.sentry.e0
    public final void c(d0 d0Var) {
        ConnectivityManager.NetworkCallback networkCallback = (ConnectivityManager.NetworkCallback) this.f66946d.remove(d0Var);
        if (networkCallback != null) {
            this.f66945c.getClass();
            Context context = this.f66943a;
            ILogger iLogger = this.f66944b;
            ConnectivityManager connectivityManagerD = d(context, iLogger);
            if (connectivityManagerD == null) {
                return;
            }
            try {
                connectivityManagerD.unregisterNetworkCallback(networkCallback);
            } catch (Throwable th2) {
                iLogger.e(g3.WARNING, "unregisterNetworkCallback failed", th2);
            }
        }
    }

    @Override // io.sentry.e0
    public final String getConnectionType() {
        a0 a0Var = this.f66945c;
        Context context = this.f66943a;
        ILogger iLogger = this.f66944b;
        ConnectivityManager connectivityManagerD = d(context, iLogger);
        if (connectivityManagerD != null) {
            if (!j.a(context, "android.permission.ACCESS_NETWORK_STATE")) {
                iLogger.g(g3.INFO, "No permission (ACCESS_NETWORK_STATE) to check network status.", new Object[0]);
                return null;
            }
            try {
                a0Var.getClass();
                Network activeNetwork = connectivityManagerD.getActiveNetwork();
                if (activeNetwork == null) {
                    iLogger.g(g3.INFO, "Network is null and cannot check network status", new Object[0]);
                    return null;
                }
                NetworkCapabilities networkCapabilities = connectivityManagerD.getNetworkCapabilities(activeNetwork);
                if (networkCapabilities == null) {
                    iLogger.g(g3.INFO, "NetworkCapabilities is null and cannot check network type", new Object[0]);
                    return null;
                }
                boolean zHasTransport = networkCapabilities.hasTransport(3);
                boolean zHasTransport2 = networkCapabilities.hasTransport(1);
                boolean zHasTransport3 = networkCapabilities.hasTransport(0);
                if (zHasTransport) {
                    return "ethernet";
                }
                if (zHasTransport2) {
                    return "wifi";
                }
                if (zHasTransport3) {
                    return "cellular";
                }
            } catch (Throwable th2) {
                iLogger.e(g3.ERROR, "Failed to retrieve network info", th2);
            }
        }
        return null;
    }
}
